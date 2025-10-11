package com.universalmedialibrary.services.cast

import android.content.Context
import androidx.media3.cast.CastPlayer
import androidx.media3.cast.SessionAvailabilityListener
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.CastSession
import com.google.android.gms.cast.framework.SessionManagerListener
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Chromecast Manager for casting media and visualizer
 *
 * Provides Chromecast casting functionality for both audio/video content
 * and audio visualizations
 */
@Singleton
@androidx.media3.common.util.UnstableApi
class ChromecastManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private var castContext: CastContext? = null
    private var castPlayer: CastPlayer? = null

    private val _castState = MutableStateFlow(CastState())
    val castState: StateFlow<CastState> = _castState.asStateFlow()

    private val sessionManagerListener = object : SessionManagerListener<CastSession> {
        override fun onSessionStarting(session: CastSession) {
            _castState.value = _castState.value.copy(isConnecting = true)
        }

        override fun onSessionStarted(session: CastSession, sessionId: String) {
            _castState.value = _castState.value.copy(
                isConnected = true,
                isConnecting = false,
                deviceName = session.castDevice?.friendlyName
            )
        }

        override fun onSessionEnding(session: CastSession) {
            _castState.value = _castState.value.copy(isConnecting = false)
        }

        override fun onSessionEnded(session: CastSession, error: Int) {
            _castState.value = _castState.value.copy(
                isConnected = false,
                isConnecting = false,
                deviceName = null
            )
        }

        override fun onSessionResuming(session: CastSession, sessionId: String) {
            _castState.value = _castState.value.copy(isConnecting = true)
        }

        override fun onSessionResumed(session: CastSession, wasSuspended: Boolean) {
            _castState.value = _castState.value.copy(
                isConnected = true,
                deviceName = session.castDevice?.friendlyName
            )
        }

        override fun onSessionResumeFailed(session: CastSession, error: Int) {
            _castState.value = _castState.value.copy(
                isConnected = false,
                error = "Failed to resume session: $error"
            )
        }

        override fun onSessionStartFailed(session: CastSession, error: Int) {
            _castState.value = _castState.value.copy(
                isConnecting = false,
                error = "Failed to start session: $error"
            )
        }

        override fun onSessionSuspended(session: CastSession, reason: Int) {
            _castState.value = _castState.value.copy(isConnected = false)
        }
    }

    /**
     * Initialize Chromecast
     */
    fun initialize() {
        try {
            castContext = CastContext.getSharedInstance(context)
            castContext?.sessionManager?.addSessionManagerListener(
                sessionManagerListener,
                CastSession::class.java
            )

            // Create cast player
            castPlayer = CastPlayer(castContext!!).apply {
                setSessionAvailabilityListener(object : SessionAvailabilityListener {
                    override fun onCastSessionAvailable() {
                        _castState.value = _castState.value.copy(
                            isCastAvailable = true
                        )
                    }

                    override fun onCastSessionUnavailable() {
                        _castState.value = _castState.value.copy(
                            isCastAvailable = false,
                            isConnected = false
                        )
                    }
                })
            }

            _castState.value = _castState.value.copy(isInitialized = true)
        } catch (e: Exception) {
            _castState.value = _castState.value.copy(
                error = "Failed to initialize Chromecast: ${e.message}"
            )
        }
    }

    /**
     * Get the cast player instance
     */
    fun getCastPlayer(): CastPlayer? = castPlayer

    /**
     * Check if a cast session is active
     */
    fun isCasting(): Boolean = castContext?.sessionManager?.currentCastSession != null

    /**
     * Cast media item
     */
    fun castMedia(mediaItem: MediaItem) {
        try {
            castPlayer?.setMediaItem(mediaItem)
            castPlayer?.prepare()
            castPlayer?.play()
        } catch (e: Exception) {
            _castState.value = _castState.value.copy(
                error = "Failed to cast media: ${e.message}"
            )
        }
    }

    /**
     * Cast media queue
     */
    fun castMediaQueue(mediaItems: List<MediaItem>, startIndex: Int = 0) {
        try {
            castPlayer?.setMediaItems(mediaItems, startIndex, 0)
            castPlayer?.prepare()
            castPlayer?.play()
        } catch (e: Exception) {
            _castState.value = _castState.value.copy(
                error = "Failed to cast queue: ${e.message}"
            )
        }
    }

    /**
     * Stop casting
     */
    fun stopCasting() {
        try {
            castContext?.sessionManager?.endCurrentSession(true)
        } catch (e: Exception) {
            _castState.value = _castState.value.copy(
                error = "Failed to stop casting: ${e.message}"
            )
        }
    }

    /**
     * Enable visualizer casting mode
     * This will prepare a custom receiver app that shows the visualizer
     */
    fun enableVisualizerCasting(enabled: Boolean) {
        _castState.value = _castState.value.copy(
            isVisualizerMode = enabled
        )
    }

    /**
     * Update visualizer data for casting
     */
    fun updateVisualizerData(
        bass: Float,
        mid: Float,
        treble: Float,
        spectrum: List<Float>
    ) {
        if (!_castState.value.isVisualizerMode || !isCasting()) return

        try {
            // Send custom message to receiver app with visualizer data
            val session = castContext?.sessionManager?.currentCastSession
            session?.sendMessage(
                VISUALIZER_NAMESPACE,
                buildVisualizerMessage(bass, mid, treble, spectrum)
            )
        } catch (e: Exception) {
            // Silently fail - visualizer updates are non-critical
        }
    }

    /**
     * Build visualizer message for cast receiver
     */
    private fun buildVisualizerMessage(
        bass: Float,
        mid: Float,
        treble: Float,
        spectrum: List<Float>
    ): String {
        return """
            {
                "type": "visualizer_update",
                "bass": $bass,
                "mid": $mid,
                "treble": $treble,
                "spectrum": [${spectrum.joinToString(",")}],
                "timestamp": ${System.currentTimeMillis()}
            }
        """.trimIndent()
    }

    /**
     * Release resources
     */
    fun release() {
        castContext?.sessionManager?.removeSessionManagerListener(
            sessionManagerListener,
            CastSession::class.java
        )
        castPlayer?.release()
        castPlayer = null
        _castState.value = CastState()
    }

    companion object {
        private const val VISUALIZER_NAMESPACE = "urn:x-cast:com.universalmedialibrary.visualizer"
    }
}

/**
 * State of the Chromecast connection
 */
data class CastState(
    val isInitialized: Boolean = false,
    val isCastAvailable: Boolean = false,
    val isConnecting: Boolean = false,
    val isConnected: Boolean = false,
    val deviceName: String? = null,
    val isVisualizerMode: Boolean = false,
    val error: String? = null
)
