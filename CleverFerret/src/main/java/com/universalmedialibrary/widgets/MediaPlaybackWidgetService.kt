package com.universalmedialibrary.widgets

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.artwork.ArtworkLoader
import com.universalmedialibrary.services.playback.UnifiedPlaybackQueueManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * MediaPlaybackWidgetService
 *
 * Service that observes the unified playback queue and updates widget state.
 * Acts as a bridge between UnifiedPlaybackQueueManager and the widget UI.
 *
 * Features:
 * - Observes queue state changes from UnifiedPlaybackQueueManager
 * - Loads artwork via ArtworkLoader
 * - Exposes StateFlow for widget updates
 * - Handles widget action callbacks (play, pause, next, previous)
 *
 * TODO: Implement actual widget update via Glance or RemoteViews
 * TODO: Add error handling and retry logic for artwork loading
 * TODO: Add preferences for widget customization
 */
@Singleton
class MediaPlaybackWidgetService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val queueManager: UnifiedPlaybackQueueManager,
    private val artworkLoader: ArtworkLoader,
    private val database: AppDatabase
) {

    private val TAG = "MediaPlaybackWidgetService"

    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    // Widget state exposed to UI
    private val _widgetState = MutableStateFlow(MediaPlaybackWidgetState.empty())
    val widgetState: StateFlow<MediaPlaybackWidgetState> = _widgetState.asStateFlow()

    init {
        observePlaybackQueue()
    }

    /**
     * Observe the playback queue and update widget state
     */
    private fun observePlaybackQueue() {
        serviceScope.launch {
            // Combine multiple state flows into widget state
            combine(
                queueManager.currentItem,
                queueManager.queueItems,
                queueManager.playbackState
            ) { currentItem, queueItems, playbackState ->

                // Load media item if we have a current queue item
                val mediaItem = currentItem?.let { queueItem ->
                    try {
                        database.mediaItemDao().getMediaItemById(queueItem.mediaItemId)
                    } catch (e: Exception) {
                        Log.e(TAG, "Failed to load media item", e)
                        null
                    }
                }

                // Build widget state
                val state = if (currentItem != null) {
                    MediaPlaybackWidgetState(
                        currentMedia = mediaItem,
                        title = currentItem.title,
                        subtitle = currentItem.artist ?: "",
                        isPlaying = playbackState.isPlaying,
                        isPaused = playbackState.isPaused,
                        isBuffering = playbackState.isBuffering,
                        currentPositionMs = playbackState.currentPositionMs,
                        durationMs = playbackState.duration,
                        playbackSpeed = playbackState.playbackSpeed,
                        queueSize = queueItems.size,
                        currentQueuePosition = queueItems.indexOf(currentItem),
                        error = playbackState.error
                    )
                } else {
                    MediaPlaybackWidgetState.empty()
                }

                _widgetState.value = state

                // Load artwork asynchronously
                if (mediaItem != null) {
                    loadArtworkForCurrentItem(mediaItem)
                }

                // Widget updates will be triggered by widget providers listening to state
                Log.d(TAG, "Widget state updated: ${state.displayTitle}")

            }.collect { /* State is updated via _widgetState above */ }
        }
    }

    /**
     * Load artwork for the current media item
     */
    private fun loadArtworkForCurrentItem(mediaItem: com.universalmedialibrary.data.local.entity.MediaItem) {
        serviceScope.launch(Dispatchers.IO) {
            try {
                // Load artwork with widget-appropriate size (256x256)
                val artwork = artworkLoader.loadArtwork(
                    mediaItem = mediaItem,
                    maxWidth = 256,
                    maxHeight = 256
                )

                // TODO: Save artwork to temporary file and update state with URI
                // For now, just log
                if (artwork != null) {
                    Log.d(TAG, "Artwork loaded for: ${mediaItem.fileName}")
                    // _widgetState.value = _widgetState.value.copy(artworkUri = "path/to/artwork")
                } else {
                    Log.d(TAG, "No artwork available for: ${mediaItem.fileName}")
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error loading artwork for widget", e)
            }
        }
    }

    /**
     * Handle play action from widget
     */
    fun onPlayClicked() {
        Log.d(TAG, "Play clicked")
        queueManager.play()
        // Widget will update automatically via state flow
    }

    /**
     * Handle pause action from widget
     */
    fun onPauseClicked() {
        Log.d(TAG, "Pause clicked")
        queueManager.pause()
        // Widget will update automatically via state flow
    }

    /**
     * Handle next action from widget
     */
    fun onNextClicked() {
        Log.d(TAG, "Next clicked")
        serviceScope.launch {
            try {
                queueManager.skipToNext()
                Log.d(TAG, "Skipped to next track")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to skip to next", e)
            }
        }
    }

    /**
     * Handle previous action from widget
     */
    fun onPreviousClicked() {
        Log.d(TAG, "Previous clicked")
        serviceScope.launch {
            try {
                queueManager.skipToPrevious()
                Log.d(TAG, "Skipped to previous track")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to skip to previous", e)
            }
        }
    }

    /**
     * Update widget for all instances
     */
    fun updateWidget() {
        Log.d(TAG, "Widget update requested - state will propagate via StateFlow")
        // Widget providers will observe widgetState StateFlow and update accordingly
    }

    /**
     * Get current widget state synchronously
     */
    fun getCurrentState(): MediaPlaybackWidgetState {
        return _widgetState.value
    }
}
