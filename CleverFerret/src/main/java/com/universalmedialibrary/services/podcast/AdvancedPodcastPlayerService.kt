package com.universalmedialibrary.services.podcast

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Minimal advanced podcast player service to satisfy ViewModel dependencies.
 * Provides reactive playback state, episode queue, basic chapters, and simple controls.
 */
@Singleton
class AdvancedPodcastPlayerService @Inject constructor(
    @ApplicationContext private val applicationContext: Context,
    private val podcastService: PodcastService,
) {
    // Playback state and settings flows
    private val _playbackState = MutableStateFlow(PodcastPlaybackState())
    val playbackState: StateFlow<PodcastPlaybackState> = _playbackState.asStateFlow()

    private val _playbackSettings = MutableStateFlow(PodcastPlaybackSettings())
    val playbackSettings: StateFlow<PodcastPlaybackSettings> = _playbackSettings.asStateFlow()

    // Now-playing info and queue
    private val _currentEpisode = MutableStateFlow<EpisodePlaybackInfo?>(null)
    val currentEpisode: StateFlow<EpisodePlaybackInfo?> = _currentEpisode.asStateFlow()

    private val _episodeQueue = MutableStateFlow<List<EpisodePlaybackInfo>>(emptyList())
    val episodeQueue: StateFlow<List<EpisodePlaybackInfo>> = _episodeQueue.asStateFlow()

    private val _chapters = MutableStateFlow<List<PodcastChapter>>(emptyList())
    val chapters: StateFlow<List<PodcastChapter>> = _chapters.asStateFlow()

    private var currentQueueIndex: Int = -1
    private var sleepTimerEndTimeMs: Long = 0L

    fun togglePlayPause() {
        _playbackState.value = _playbackState.value.copy(
            isPlaying = !_playbackState.value.isPlaying,
            isLoading = false,
            error = null,
        )
    }

    fun skipToPreviousEpisode() {
        if (_episodeQueue.value.isEmpty()) return
        currentQueueIndex = (currentQueueIndex - 1).coerceAtLeast(0)
        _currentEpisode.value = _episodeQueue.value.getOrNull(currentQueueIndex)
    }

    fun skipToNextEpisode() {
        if (_episodeQueue.value.isEmpty()) return
        currentQueueIndex = (currentQueueIndex + 1).coerceAtMost(_episodeQueue.value.size - 1)
        _currentEpisode.value = _episodeQueue.value.getOrNull(currentQueueIndex)
    }

    fun skipForward(seconds: Int) {
        val current = _currentEpisode.value ?: return
        _currentEpisode.value = current.copy(positionMs = current.positionMs + seconds * 1000L)
    }

    fun skipBackward(seconds: Int) {
        val current = _currentEpisode.value ?: return
        _currentEpisode.value = current.copy(positionMs = (current.positionMs - seconds * 1000L).coerceAtLeast(0L))
    }

    fun seekTo(positionMs: Long) {
        val current = _currentEpisode.value ?: return
        _currentEpisode.value = current.copy(positionMs = positionMs.coerceAtLeast(0L))
    }

    fun getCurrentPosition(): Long {
        return _currentEpisode.value?.positionMs ?: 0L
    }

    fun setPlaybackSpeed(speed: Float) {
        _playbackSettings.value = _playbackSettings.value.copy(
            playbackSpeed = speed.coerceIn(0.25f, 3.0f),
        )
    }

    fun setSkipSilence(enabled: Boolean) {
        _playbackSettings.value = _playbackSettings.value.copy(skipSilence = enabled)
    }

    fun addToQueue(episode: PodcastEpisode) {
        val newItem = EpisodePlaybackInfo(episode = episode, positionMs = 0L)
        val updated = _episodeQueue.value.toMutableList().apply { add(newItem) }
        _episodeQueue.value = updated
        if (currentQueueIndex == -1) {
            currentQueueIndex = 0
            _currentEpisode.value = updated.firstOrNull()
        }
    }

    fun removeFromQueue(episodeId: String) {
        val updated = _episodeQueue.value.filterNot { it.episode.id == episodeId }
        _episodeQueue.value = updated
        if (updated.isEmpty()) {
            currentQueueIndex = -1
            _currentEpisode.value = null
            _playbackState.value = _playbackState.value.copy(isPlaying = false)
        } else if (currentQueueIndex >= updated.size) {
            currentQueueIndex = updated.lastIndex
            _currentEpisode.value = updated.getOrNull(currentQueueIndex)
        }
    }

    fun setSleepTimer(minutes: Int) {
        val clampedMinutes = minutes.coerceAtLeast(0)
        val now = System.currentTimeMillis()
        sleepTimerEndTimeMs = if (clampedMinutes == 0) 0L else now + clampedMinutes * 60_000L
        _playbackSettings.value = _playbackSettings.value.copy(sleepTimerMinutes = clampedMinutes)
    }

    fun getSleepTimerRemaining(): Long {
        if (sleepTimerEndTimeMs == 0L) return 0L
        val remaining = sleepTimerEndTimeMs - System.currentTimeMillis()
        return remaining.coerceAtLeast(0L)
    }

    fun jumpToChapter(chapterIndex: Int) {
        val chapter = _chapters.value.getOrNull(chapterIndex) ?: return
        seekTo(chapter.startTime)
    }
}

// Podcast playback-related models used by the player UI/ViewModel

data class PodcastPlaybackState(
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val hasError: Boolean = false,
    val error: String? = null,
)

data class PodcastPlaybackSettings(
    val playbackSpeed: Float = 1.0f,
    val skipSilence: Boolean = false,
    val sleepTimerMinutes: Int = 0,
)

data class PodcastChapter(
    val title: String,
    val startTime: Long,
    val endTime: Long,
)

data class EpisodePlaybackInfo(
    val episode: PodcastEpisode,
    val positionMs: Long,
)
