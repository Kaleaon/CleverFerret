package com.universalmedialibrary.services.media

import android.content.Context
import com.universalmedialibrary.data.local.entity.MediaItem as LocalMediaItem
import com.universalmedialibrary.services.artwork.ArtworkLoader
import com.universalmedialibrary.services.plex.PlexApiService
import com.universalmedialibrary.services.plex.PlexMediaItem
import com.universalmedialibrary.services.queue.LocalUnifiedMediaItem
import com.universalmedialibrary.services.queue.MediaQueueManager
import com.universalmedialibrary.services.queue.PlexUnifiedMediaItem
import com.universalmedialibrary.services.queue.UnifiedMediaItem
import com.universalmedialibrary.services.widget.WidgetUpdateService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Media Service
 * 
 * Central service that coordinates playback, queue management, and real-time updates
 * for both Plex and local media items. Integrates with widget updates and artwork loading.
 */
@Singleton
class UnifiedMediaService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val queueManager: MediaQueueManager,
    private val artworkLoader: ArtworkLoader,
    private val plexApiService: PlexApiService,
    private val widgetUpdateService: WidgetUpdateService
) {
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    private val _playbackState = MutableStateFlow(UnifiedPlaybackState())
    val playbackState: StateFlow<UnifiedPlaybackState> = _playbackState.asStateFlow()
    
    init {
        // Start widget update service to monitor queue changes
        widgetUpdateService.startObserving()
    }
    
    /**
     * Play a local media item, adding it to queue if not already present
     */
    suspend fun playLocalMedia(mediaItem: LocalMediaItem, addToQueue: Boolean = true) {
        val unifiedItem = LocalUnifiedMediaItem(
            localItem = mediaItem,
            artworkUrl = extractArtworkFromLocal(mediaItem)
        )
        
        if (addToQueue) {
            val currentQueue = queueManager.currentQueue.value
            if (currentQueue.items.none { it.id == unifiedItem.id }) {
                queueManager.addToQueue(unifiedItem)
            }
            // Jump to this item
            val itemIndex = queueManager.currentQueue.value.items.indexOfFirst { it.id == unifiedItem.id }
            if (itemIndex >= 0) {
                queueManager.jumpToIndex(itemIndex)
            }
        }
        
        startPlayback(unifiedItem)
    }
    
    /**
     * Play a Plex media item, adding it to queue if not already present
     */
    suspend fun playPlexMedia(plexItem: PlexMediaItem, addToQueue: Boolean = true) {
        val artworkUrl = plexApiService.getArtworkUrl(plexItem.thumb)
        val streamUrl = plexApiService.getStreamUrl(plexItem.key)
        
        val unifiedItem = PlexUnifiedMediaItem(
            plexItem = plexItem,
            artworkUrl = artworkUrl,
            streamUrl = streamUrl
        )
        
        if (addToQueue) {
            val currentQueue = queueManager.currentQueue.value
            if (currentQueue.items.none { it.id == unifiedItem.id }) {
                queueManager.addToQueue(unifiedItem)
            }
            // Jump to this item
            val itemIndex = queueManager.currentQueue.value.items.indexOfFirst { it.id == unifiedItem.id }
            if (itemIndex >= 0) {
                queueManager.jumpToIndex(itemIndex)
            }
        }
        
        startPlayback(unifiedItem)
    }
    
    /**
     * Play a queue of mixed media items (local and Plex)
     */
    suspend fun playMixedQueue(items: List<UnifiedMediaItem>, startIndex: Int = 0) {
        queueManager.setQueue(items, startIndex)
        val currentItem = queueManager.currentQueue.value.currentItem
        if (currentItem != null) {
            startPlayback(currentItem)
        }
    }
    
    /**
     * Start playback for a unified media item
     */
    private suspend fun startPlayback(mediaItem: UnifiedMediaItem) {
        try {
            _playbackState.value = _playbackState.value.copy(
                isLoading = true,
                error = null
            )
            
            // TODO: Integrate with actual playback engine (ExoPlayer, VLC, etc.)
            // For now, just simulate playback start
            
            when (mediaItem.mediaSource) {
                com.universalmedialibrary.services.queue.MediaSource.LOCAL -> {
                    // Play local file
                    simulatePlayback(mediaItem)
                }
                com.universalmedialibrary.services.queue.MediaSource.PLEX -> {
                    // Stream from Plex
                    simulatePlayback(mediaItem)
                }
            }
            
        } catch (e: Exception) {
            _playbackState.value = _playbackState.value.copy(
                isLoading = false,
                error = "Error starting playback: ${e.message}"
            )
        }
    }
    
    /**
     * Simulate playback (replace with actual playback integration)
     */
    private fun simulatePlayback(mediaItem: UnifiedMediaItem) {
        _playbackState.value = _playbackState.value.copy(
            isLoading = false,
            isPlaying = true,
            currentItem = mediaItem,
            error = null
        )
    }
    
    /**
     * Toggle play/pause
     */
    fun togglePlayPause() {
        val currentState = _playbackState.value
        _playbackState.value = currentState.copy(
            isPlaying = !currentState.isPlaying
        )
    }
    
    /**
     * Skip to next track
     */
    fun skipToNext() {
        serviceScope.launch {
            if (queueManager.moveToNext()) {
                val nextItem = queueManager.currentQueue.value.currentItem
                if (nextItem != null) {
                    startPlayback(nextItem)
                }
            }
        }
    }
    
    /**
     * Skip to previous track
     */
    fun skipToPrevious() {
        serviceScope.launch {
            if (queueManager.moveToPrevious()) {
                val prevItem = queueManager.currentQueue.value.currentItem
                if (prevItem != null) {
                    startPlayback(prevItem)
                }
            }
        }
    }
    
    /**
     * Stop playback and clear queue
     */
    fun stop() {
        _playbackState.value = UnifiedPlaybackState()
        queueManager.clearQueue()
    }
    
    /**
     * Extract artwork URL from local media item
     * TODO: Implement actual metadata extraction
     */
    private suspend fun extractArtworkFromLocal(mediaItem: LocalMediaItem): String? {
        // For now, return null - would extract from file metadata
        return null
    }
    
    /**
     * Get artwork bitmap for notifications/widgets
     */
    suspend fun getCurrentArtworkBitmap(width: Int, height: Int) = 
        artworkLoader.loadArtworkBitmap(
            _playbackState.value.currentItem?.artworkUrl,
            width,
            height
        )
}

/**
 * Unified playback state
 */
data class UnifiedPlaybackState(
    val isPlaying: Boolean = false,
    val isLoading: Boolean = false,
    val currentItem: UnifiedMediaItem? = null,
    val position: Long = 0L,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canPlay: Boolean get() = !isLoading && !hasError
}