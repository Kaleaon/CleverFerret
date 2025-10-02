package com.universalmedialibrary.ui.podcast

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.podcast.AdvancedPodcastPlayerService
import com.universalmedialibrary.services.podcast.PodcastService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the advanced podcast player screen
 */
@HiltViewModel
class PodcastPlayerViewModel @Inject constructor(
    private val podcastPlayerService: AdvancedPodcastPlayerService,
    private val podcastService: PodcastService
) : ViewModel() {

    val playbackState: StateFlow<com.universalmedialibrary.services.podcast.PodcastPlaybackState> =
        podcastPlayerService.playbackState

    val currentEpisode: StateFlow<com.universalmedialibrary.services.podcast.EpisodePlaybackInfo?> =
        podcastPlayerService.currentEpisode

    val episodeQueue: StateFlow<List<com.universalmedialibrary.services.podcast.EpisodePlaybackInfo>> =
        podcastPlayerService.episodeQueue

    val playbackSettings: StateFlow<com.universalmedialibrary.services.podcast.PodcastPlaybackSettings> =
        podcastPlayerService.playbackSettings

    val chapters: StateFlow<List<com.universalmedialibrary.services.podcast.PodcastChapter>> =
        podcastPlayerService.chapters

    /**
     * Toggle play/pause
     */
    fun togglePlayPause() {
        podcastPlayerService.togglePlayPause()
    }

    /**
     * Skip to previous episode
     */
    fun skipToPreviousEpisode() {
        podcastPlayerService.skipToPreviousEpisode()
    }

    /**
     * Skip to next episode
     */
    fun skipToNextEpisode() {
        podcastPlayerService.skipToNextEpisode()
    }

    /**
     * Skip forward by seconds
     */
    fun skipForward(seconds: Int) {
        podcastPlayerService.skipForward(seconds)
    }

    /**
     * Skip backward by seconds
     */
    fun skipBackward(seconds: Int) {
        podcastPlayerService.skipBackward(seconds)
    }

    /**
     * Seek to specific position
     */
    fun seekTo(positionMs: Long) {
        podcastPlayerService.seekTo(positionMs)
    }

    /**
     * Jump to specific chapter
     */
    fun jumpToChapter(chapterIndex: Int) {
        podcastPlayerService.jumpToChapter(chapterIndex)
    }

    /**
     * Get current playback position
     */
    fun getCurrentPosition(): Long {
        return podcastPlayerService.getCurrentPosition()
    }

    /**
     * Set playback speed
     */
    fun setPlaybackSpeed(speed: Float) {
        podcastPlayerService.setPlaybackSpeed(speed)
    }

    /**
     * Toggle skip silence
     */
    fun toggleSkipSilence() {
        val currentSettings = playbackSettings.value
        podcastPlayerService.setSkipSilence(!currentSettings.skipSilence)
    }

    /**
     * Toggle sleep timer (cycles through common durations)
     */
    fun toggleSleepTimer() {
        val currentMinutes = playbackSettings.value.sleepTimerMinutes
        val nextMinutes = when (currentMinutes) {
            0 -> 15
            15 -> 30
            30 -> 60
            60 -> 90
            else -> 0
        }
        podcastPlayerService.setSleepTimer(nextMinutes)
    }

    /**
     * Set specific sleep timer duration
     */
    fun setSleepTimer(minutes: Int) {
        podcastPlayerService.setSleepTimer(minutes)
    }

    /**
     * Add episode to queue
     */
    fun addEpisodeToQueue(episode: com.universalmedialibrary.services.podcast.PodcastEpisode) {
        podcastPlayerService.addToQueue(episode)
    }

    /**
     * Remove episode from queue
     */
    fun removeEpisodeFromQueue(episodeId: String) {
        podcastPlayerService.removeFromQueue(episodeId)
    }

    /**
     * Get remaining sleep timer time
     */
    fun getSleepTimerRemaining(): Long {
        return podcastPlayerService.getSleepTimerRemaining()
    }

    /**
     * Mark current episode as completed
     */
    fun markEpisodeCompleted() {
        // TODO: Implement episode completion tracking
        viewModelScope.launch {
            // Update episode completion status in database
        }
    }

    /**
     * Download episode for offline listening
     */
    fun downloadEpisode(episode: com.universalmedialibrary.services.podcast.PodcastEpisode) {
        viewModelScope.launch {
            try {
                val result = podcastService.downloadEpisode(episode)
                if (result.success) {
                    // TODO: Update UI to show download success
                } else {
                    // TODO: Show error message
                }
            } catch (e: Exception) {
                // TODO: Handle download error
            }
        }
    }

    /**
     * Subscribe to podcast show
     */
    fun subscribeToPodcast(feedUrl: String) {
        viewModelScope.launch {
            try {
                val result = podcastService.subscribeToPodcast(feedUrl)
                if (result.success) {
                    // TODO: Update UI to show subscription success
                } else {
                    // TODO: Show error message
                }
            } catch (e: Exception) {
                // TODO: Handle subscription error
            }
        }
    }

    /**
     * Get episodes for current podcast
     */
    fun refreshEpisodes() {
        val currentEpisode = currentEpisode.value
        if (currentEpisode != null) {
            viewModelScope.launch {
                try {
                    // TODO: Refresh episodes from podcast feed
                    // This would require getting the subscription info first
                } catch (e: Exception) {
                    // TODO: Handle refresh error
                }
            }
        }
    }

    override fun onCleared() {
        super.onCleared()
        // Don't release the service here as it should continue playing in background
        // podcastPlayerService.release()
    }
}
