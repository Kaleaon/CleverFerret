package com.universalmedialibrary.services.playback

import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.TrackInfo
import com.universalmedialibrary.services.audiobook.AudiobookService
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Integration adapter for existing media services with unified queue
 * 
 * Provides a bridge between the new UnifiedPlaybackQueueManager and
 * existing service implementations, allowing gradual migration while
 * maintaining compatibility.
 */
@Singleton
class QueueIntegrationAdapter @Inject constructor(
    private val unifiedQueueManager: UnifiedPlaybackQueueManager,
    private val musicPlayerService: AdvancedMusicPlayerService,
    private val audiobookService: AudiobookService
) {
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    /**
     * Migrate music tracks from AdvancedMusicPlayerService to unified queue
     */
    suspend fun migrateMusicToUnifiedQueue(mediaItems: List<MediaItem>) {
        // Create or switch to music queue
        val musicQueue = unifiedQueueManager.createOrSwitchToQueue(
            queueName = "MUSIC_QUEUE",
            queueType = "MUSIC", 
            displayName = "Music"
        )
        
        // Add items to unified queue
        unifiedQueueManager.enqueueItems(mediaItems)
    }
    
    /**
     * Migrate audiobook from AudiobookService to unified queue
     */  
    suspend fun migrateAudiobookToUnifiedQueue(mediaItem: MediaItem) {
        // Create or switch to audiobook queue
        val audiobookQueue = unifiedQueueManager.createOrSwitchToQueue(
            queueName = "AUDIOBOOK_QUEUE",
            queueType = "AUDIOBOOK",
            displayName = "Audiobook"
        )
        
        // Add audiobook to unified queue
        unifiedQueueManager.enqueueItems(listOf(mediaItem))
    }
    
    /**
     * Convert TrackInfo from music service to MediaItem for unified queue
     */
    fun convertTrackInfoToMediaItem(trackInfo: TrackInfo): MediaItem {
        return MediaItem(
            itemId = trackInfo.id.toLongOrNull() ?: 0L,
            libraryId = 1L, // Default library - would need proper mapping
            filePath = trackInfo.filePath,
            fileName = trackInfo.title,
            fileExtension = trackInfo.filePath.substringAfterLast('.', ""),
            fileSize = 0L, // Unknown from TrackInfo
            mediaType = "MUSIC_TRACK",
            mimeType = "audio/*"
        )
    }
    
    /**
     * Sync playback state from unified queue to music service
     */
    private fun syncToMusicService() {
        serviceScope.launch {
            unifiedQueueManager.playbackState.collect { unifiedState ->
                // Update music service state to match unified state
                // This allows existing UI that depends on music service to work
                if (unifiedState.isPlaying) {
                    // musicPlayerService.syncFromUnifiedState(unifiedState)
                }
            }
        }
    }
    
    /**
     * Sync playback state from unified queue to audiobook service  
     */
    private fun syncToAudiobookService() {
        serviceScope.launch {
            unifiedQueueManager.playbackState.collect { unifiedState ->
                // Update audiobook service state to match unified state
                if (unifiedState.isPlaying) {
                    // audiobookService.syncFromUnifiedState(unifiedState)
                }
            }
        }
    }
    
    /**
     * Handle queue type switching
     */
    suspend fun switchToMediaType(mediaType: String) {
        when (mediaType.uppercase()) {
            "MUSIC" -> {
                unifiedQueueManager.switchToQueue(getMusicQueueId())
            }
            "AUDIOBOOK" -> {
                unifiedQueueManager.switchToQueue(getAudiobookQueueId())
            }
            "TTS" -> {
                unifiedQueueManager.switchToQueue(getTtsQueueId())
            }
        }
    }
    
    // Helper methods to get queue IDs (would be cached or looked up)
    private suspend fun getMusicQueueId(): Long {
        val queue = unifiedQueueManager.createOrSwitchToQueue("MUSIC_QUEUE", "MUSIC", "Music")
        return queue.queueId
    }
    
    private suspend fun getAudiobookQueueId(): Long {
        val queue = unifiedQueueManager.createOrSwitchToQueue("AUDIOBOOK_QUEUE", "AUDIOBOOK", "Audiobook")
        return queue.queueId
    }
    
    private suspend fun getTtsQueueId(): Long {
        val queue = unifiedQueueManager.createOrSwitchToQueue("TTS_QUEUE", "TTS", "Text-to-Speech")
        return queue.queueId
    }
}