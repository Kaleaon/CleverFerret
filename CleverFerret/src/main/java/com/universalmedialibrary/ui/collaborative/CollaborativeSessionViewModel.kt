package com.universalmedialibrary.ui.collaborative

import android.content.Context
import android.graphics.Bitmap
import android.provider.Settings
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.services.collaborative.CollaborativeSessionService
import com.universalmedialibrary.services.collaborative.ChromecastSessionManager
import com.universalmedialibrary.services.collaborative.SessionOptions
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for managing collaborative playlist sessions
 */
@HiltViewModel
class CollaborativeSessionViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val collaborativeService: CollaborativeSessionService,
    private val chromecastManager: ChromecastSessionManager
) : ViewModel() {

    private val _uiState = MutableStateFlow<CollaborativeUiState>(CollaborativeUiState.Idle)
    val uiState: StateFlow<CollaborativeUiState> = _uiState.asStateFlow()

    private val _activeSessions = MutableStateFlow<List<CollaborativeSession>>(emptyList())
    val activeSessions: StateFlow<List<CollaborativeSession>> = _activeSessions.asStateFlow()

    private val _currentSession = MutableStateFlow<CollaborativeSession?>(null)
    val currentSession: StateFlow<CollaborativeSession?> = _currentSession.asStateFlow()

    private val _connectedClients = MutableStateFlow<List<SessionClient>>(emptyList())
    val connectedClients: StateFlow<List<SessionClient>> = _connectedClients.asStateFlow()

    private val _sessionQueue = MutableStateFlow<List<SessionQueueItem>>(emptyList())
    val sessionQueue: StateFlow<List<SessionQueueItem>> = _sessionQueue.asStateFlow()

    private val _qrCodeBitmap = MutableStateFlow<Bitmap?>(null)
    val qrCodeBitmap: StateFlow<Bitmap?> = _qrCodeBitmap.asStateFlow()

    init {
        chromecastManager.initialize()
        loadActiveSessions()
    }

    /**
     * Load all active sessions
     */
    private fun loadActiveSessions() {
        viewModelScope.launch {
            collaborativeService.getActiveSessions().collect { sessions ->
                _activeSessions.value = sessions
            }
        }
    }

    /**
     * Create a new collaborative session
     */
    fun createSession(
        name: String,
        playlistId: Long,
        sessionType: SessionType,
        options: SessionOptions = SessionOptions()
    ) {
        viewModelScope.launch {
            try {
                _uiState.value = CollaborativeUiState.Creating

                val deviceId = Settings.Secure.getString(
                    context.contentResolver,
                    Settings.Secure.ANDROID_ID
                )
                val deviceName = android.os.Build.MODEL

                val session = collaborativeService.createSession(
                    name = name,
                    playlistId = playlistId,
                    sessionType = sessionType,
                    hostDeviceId = deviceId,
                    hostDeviceName = deviceName,
                    options = options
                )

                _currentSession.value = session
                _qrCodeBitmap.value = collaborativeService.generateQRCode(session)
                _uiState.value = CollaborativeUiState.SessionCreated(session)
            } catch (e: Exception) {
                _uiState.value = CollaborativeUiState.Error(e.message ?: "Failed to create session")
            }
        }
    }

    /**
     * Start a session
     */
    fun startSession(sessionId: String) {
        viewModelScope.launch {
            try {
                _uiState.value = CollaborativeUiState.Starting
                collaborativeService.startSession(sessionId)
                
                // If Chromecast session type, start casting
                _currentSession.value?.let { session ->
                    if (session.sessionType == SessionType.CHROMECAST || 
                        session.sessionType == SessionType.BOTH) {
                        chromecastManager.startCasting(session)
                    }
                }

                observeSessionUpdates(sessionId)
                _uiState.value = CollaborativeUiState.Active
            } catch (e: Exception) {
                _uiState.value = CollaborativeUiState.Error(e.message ?: "Failed to start session")
            }
        }
    }

    /**
     * Observe session updates
     */
    private fun observeSessionUpdates(sessionId: String) {
        viewModelScope.launch {
            // Observe connected clients
            collaborativeService.getConnectedClients(sessionId).collect { clients ->
                _connectedClients.value = clients
            }
        }

        viewModelScope.launch {
            // Observe session queue
            collaborativeService.getQueue(sessionId).collect { queue ->
                _sessionQueue.value = queue
            }
        }
    }

    /**
     * End a session
     */
    fun endSession(sessionId: String) {
        viewModelScope.launch {
            try {
                collaborativeService.endSession(sessionId)
                chromecastManager.stopCasting()
                _currentSession.value = null
                _uiState.value = CollaborativeUiState.Idle
            } catch (e: Exception) {
                _uiState.value = CollaborativeUiState.Error(e.message ?: "Failed to end session")
            }
        }
    }

    /**
     * Add track to session queue
     */
    fun addTrackToQueue(sessionId: String, clientId: String, mediaItemId: Long) {
        viewModelScope.launch {
            try {
                val queueItem = collaborativeService.addTrackToQueue(sessionId, clientId, mediaItemId)
                
                // Add to cast queue if casting
                if (chromecastManager.isCasting()) {
                    chromecastManager.addTrackToQueue(queueItem)
                }
            } catch (e: Exception) {
                _uiState.value = CollaborativeUiState.Error(e.message ?: "Failed to add track")
            }
        }
    }

    /**
     * Vote on a track
     */
    fun voteOnTrack(sessionId: String, clientId: String, queueItemId: Long, voteType: VoteType) {
        viewModelScope.launch {
            try {
                collaborativeService.voteOnTrack(sessionId, clientId, queueItemId, voteType)
            } catch (e: Exception) {
                _uiState.value = CollaborativeUiState.Error(e.message ?: "Failed to vote")
            }
        }
    }

    /**
     * Toggle playback
     */
    fun togglePlayback() {
        chromecastManager.togglePlayback()
    }

    /**
     * Skip to next track
     */
    fun skipToNext() {
        chromecastManager.skipToNext()
    }

    /**
     * Skip to previous track
     */
    fun skipToPrevious() {
        chromecastManager.skipToPrevious()
    }

    /**
     * Check if currently casting
     */
    fun isCasting(): Boolean {
        return chromecastManager.isCasting()
    }

    /**
     * Get current Chromecast device name
     */
    fun getCurrentCastDeviceName(): String? {
        return chromecastManager.getCurrentDevice()?.friendlyName
    }
}

/**
 * UI state for collaborative sessions
 */
sealed class CollaborativeUiState {
    object Idle : CollaborativeUiState()
    object Creating : CollaborativeUiState()
    object Starting : CollaborativeUiState()
    object Active : CollaborativeUiState()
    data class SessionCreated(val session: CollaborativeSession) : CollaborativeUiState()
    data class Error(val message: String) : CollaborativeUiState()
}
