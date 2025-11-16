package com.universalmedialibrary.ui.player

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.audio.AudioPlaybackManager.AudioQueueEntry
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject

@HiltViewModel
class ModernAudioPlayerViewModel @Inject constructor(
    private val audioPlaybackManager: AudioPlaybackManager,
    private val mediaRepository: MediaRepository,
    @ApplicationContext private val context: Context
) : ViewModel() {

    private val _uiState = MutableStateFlow(ModernAudioPlayerUiState())
    val uiState: StateFlow<ModernAudioPlayerUiState> = _uiState.asStateFlow()

    private var artworkJob: Job? = null
    private var lastArtworkSource: String? = null

    init {
        // Observe audio playback state
        viewModelScope.launch {
            audioPlaybackManager.state.collect { audioState ->
                val currentMediaItem = audioPlaybackManager.exoPlayer.currentMediaItem
                val currentUri = currentMediaItem?.localConfiguration?.uri
                val previousTrack = _uiState.value.currentTrack
                    _uiState.value = _uiState.value.copy(
                    currentTrack = if (audioState.title != null) {
                        val cover = if (currentUri?.toString() == lastArtworkSource) {
                            previousTrack?.coverUrl
                        } else null
                        AudioTrack(
                            id = currentUri?.hashCode()?.toLong() ?: 0L,
                            title = audioState.title,
                            artist = audioState.artist ?: "Unknown Artist",
                            album = audioState.album,
                            duration = audioState.duration,
                            coverUrl = cover
                        )
                    } else {
                        _uiState.value.currentTrack
                    },
                    isPlaying = audioState.isPlaying,
                    currentPosition = audioPlaybackManager.exoPlayer.currentPosition,
                    duration = audioState.duration,
                    progress = if (audioState.duration > 0) {
                        audioPlaybackManager.exoPlayer.currentPosition.toFloat() / audioState.duration
                    } else 0f,
                    isShuffleEnabled = audioState.isShuffleEnabled,
                        repeatMode = when (audioState.repeatMode) {
                        com.universalmedialibrary.services.audio.RepeatMode.OFF -> RepeatMode.OFF
                        com.universalmedialibrary.services.audio.RepeatMode.ONE -> RepeatMode.ONE
                        com.universalmedialibrary.services.audio.RepeatMode.ALL -> RepeatMode.ALL
                        },
                        skipSilenceEnabled = audioState.skipSilenceEnabled,
                        crossfadeDurationMs = audioState.crossfadeDurationMs,
                        queueEntries = audioState.queue,
                        sleepTimerEndTime = audioState.sleepTimerEndTime,
                        lastSleepTimerMinutes = audioState.lastSleepTimerMinutes
                )
                resolveCurrentArtwork()
            }
        }
    }

    fun togglePlayPause() {
        audioPlaybackManager.togglePlayPause()
    }

    fun previous() {
        audioPlaybackManager.skipToPrevious()
    }

    fun next() {
        audioPlaybackManager.skipToNext()
    }

    fun toggleShuffle() {
        audioPlaybackManager.toggleShuffle()
    }

    fun toggleRepeat() {
        audioPlaybackManager.toggleRepeat()
    }

    fun toggleSkipSilence() {
        audioPlaybackManager.toggleSkipSilence()
    }

    fun toggleCrossfade() {
        audioPlaybackManager.toggleCrossfade()
    }

    fun setCrossfadeDurationSeconds(seconds: Int) {
        audioPlaybackManager.updateCrossfade(seconds * 1000)
    }

    fun toggleLike() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLiked = !_uiState.value.isLiked
            )
            // Save like state to database if we have a current track
            // In a real implementation, we'd save this to a favorites table
        }
    }

    fun seekTo(position: Long) {
        audioPlaybackManager.seekTo(position)
    }

    fun seekToFraction(fraction: Float) {
        val duration = _uiState.value.duration
        if (duration <= 0) return
        val clamped = fraction.coerceIn(0f, 1f)
        audioPlaybackManager.seekTo((duration * clamped).toLong())
    }

    fun moveQueueItem(from: Int, to: Int) {
        audioPlaybackManager.moveQueueItem(from, to)
    }

    fun removeQueueItem(index: Int) {
        audioPlaybackManager.removeFromQueue(index)
    }

    fun playQueueItem(index: Int) {
        audioPlaybackManager.playFromQueue(index)
    }

    fun scheduleSleepTimer(minutes: Int) {
        audioPlaybackManager.scheduleSleepTimer(minutes, pauseOnComplete = true)
    }

    fun cancelSleepTimer() {
        audioPlaybackManager.clearSleepTimer()
    }

    fun togglePartyMode() {
        _uiState.value = _uiState.value.copy(partyModeEnabled = !_uiState.value.partyModeEnabled)
    }

    private fun resolveCurrentArtwork() {
        val currentMediaItem = audioPlaybackManager.exoPlayer.currentMediaItem ?: return
        val uri = currentMediaItem.localConfiguration?.uri ?: return
        val uriString = uri.toString()
        if (uriString == lastArtworkSource && _uiState.value.currentTrack?.coverUrl != null) {
            return
        }
        lastArtworkSource = uriString
        artworkJob?.cancel()
        artworkJob = viewModelScope.launch(Dispatchers.IO) {
            val cover = fetchCoverForUri(uri)
            if (cover != null) {
                withContext(Dispatchers.Main) {
                    val current = _uiState.value.currentTrack
                    if (current != null) {
                        _uiState.value = _uiState.value.copy(
                            currentTrack = current.copy(coverUrl = cover)
                        )
                    }
                }
            }
        }
    }

    private suspend fun fetchCoverForUri(uri: Uri): String? {
        val path = uri.path
        if (!path.isNullOrEmpty()) {
            val mediaItem = mediaRepository.getMediaItemByPath(path)
            if (mediaItem != null) {
                val metadata = mediaRepository.getCommonMetadata(mediaItem.itemId)
                if (!metadata?.coverImagePath.isNullOrEmpty()) {
                    return metadata?.coverImagePath
                }
                if (!mediaItem.thumbnailPath.isNullOrEmpty()) {
                    return mediaItem.thumbnailPath
                }
            }
        }
        return extractCoverFromUri(uri)
    }

    private fun extractCoverFromUri(uri: Uri): String? {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(context, uri)
            val picture = retriever.embeddedPicture ?: return null
            saveCoverToCache(picture, uri)
        } catch (_: Exception) {
            null
        } finally {
            try {
                retriever.release()
            } catch (_: Exception) { }
        }
    }

    private fun saveCoverToCache(bytes: ByteArray, uri: Uri): String? {
        return try {
            val fileName = "modern_cover_${uri.hashCode()}_${System.currentTimeMillis()}.jpg"
            val file = File(context.cacheDir, fileName)
            FileOutputStream(file).use { it.write(bytes) }
            file.absolutePath
        } catch (_: Exception) {
            null
        }
    }
}

    data class ModernAudioPlayerUiState(
        val currentTrack: AudioTrack? = null,
        val isPlaying: Boolean = false,
        val currentPosition: Long = 0L,
        val duration: Long = 0L,
        val progress: Float = 0f,
        val isShuffleEnabled: Boolean = false,
        val repeatMode: RepeatMode = RepeatMode.OFF,
        val isLiked: Boolean = false,
        val skipSilenceEnabled: Boolean = false,
        val crossfadeDurationMs: Int = 0,
        val queueEntries: List<AudioQueueEntry> = emptyList(),
        val sleepTimerEndTime: Long? = null,
        val lastSleepTimerMinutes: Int = 0,
        val partyModeEnabled: Boolean = false
    )

data class AudioTrack(
    val id: Long,
    val title: String,
    val artist: String,
    val album: String? = null,
    val coverUrl: String? = null,
    val duration: Long = 0L
)
