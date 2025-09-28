package com.universalmedialibrary.services.queue

import com.universalmedialibrary.data.local.entity.MediaItem as LocalMediaItem
import com.universalmedialibrary.services.plex.PlexMediaItem
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Media Item interface for both Plex and local content
 */
interface UnifiedMediaItem {
    val id: String
    val title: String
    val artist: String?
    val album: String?
    val duration: Long
    val artworkUrl: String?
    val mediaSource: MediaSource
    val streamUrl: String?
    val filePath: String?
}

/**
 * Media source enumeration
 */
enum class MediaSource {
    LOCAL,
    PLEX
}

/**
 * Local media item wrapper
 */
data class LocalUnifiedMediaItem(
    private val localItem: LocalMediaItem,
    override val artworkUrl: String? = null
) : UnifiedMediaItem {
    override val id: String = localItem.itemId.toString()
    override val title: String = localItem.fileName
    override val artist: String? = null // TODO: Extract from metadata
    override val album: String? = null // TODO: Extract from metadata
    override val duration: Long = 0L // TODO: Extract from metadata
    override val mediaSource: MediaSource = MediaSource.LOCAL
    override val streamUrl: String? = null
    override val filePath: String = localItem.filePath
}

/**
 * Plex media item wrapper
 */
data class PlexUnifiedMediaItem(
    private val plexItem: PlexMediaItem,
    override val artworkUrl: String?,
    override val streamUrl: String?
) : UnifiedMediaItem {
    override val id: String = plexItem.key
    override val title: String = plexItem.title
    override val artist: String? = plexItem.artist
    override val album: String? = plexItem.album
    override val duration: Long = plexItem.duration
    override val mediaSource: MediaSource = MediaSource.PLEX
    override val filePath: String? = null
}

/**
 * Queue information for playback
 */
data class MediaQueue(
    val items: List<UnifiedMediaItem>,
    val currentIndex: Int = 0,
    val shuffled: Boolean = false,
    val repeatMode: QueueRepeatMode = QueueRepeatMode.NONE
) {
    val currentItem: UnifiedMediaItem? = items.getOrNull(currentIndex)
    val hasNext: Boolean = when (repeatMode) {
        QueueRepeatMode.NONE -> currentIndex < items.size - 1
        QueueRepeatMode.ALL, QueueRepeatMode.ONE -> items.isNotEmpty()
    }
    val hasPrevious: Boolean = when (repeatMode) {
        QueueRepeatMode.NONE -> currentIndex > 0
        QueueRepeatMode.ALL, QueueRepeatMode.ONE -> items.isNotEmpty()
    }
}

/**
 * Queue repeat modes
 */
enum class QueueRepeatMode {
    NONE,    // Play through queue once
    ALL,     // Repeat entire queue
    ONE      // Repeat current item
}

/**
 * Unified Media Queue Manager
 * 
 * Manages playback queue for both Plex and local media items.
 * Provides real-time updates via StateFlow for widget and UI components.
 */
@Singleton
class MediaQueueManager @Inject constructor() {
    
    private val _currentQueue = MutableStateFlow(MediaQueue(emptyList()))
    val currentQueue: StateFlow<MediaQueue> = _currentQueue.asStateFlow()
    
    private val _isShuffled = MutableStateFlow(false)
    val isShuffled: StateFlow<Boolean> = _isShuffled.asStateFlow()
    
    private val _repeatMode = MutableStateFlow(QueueRepeatMode.NONE)
    val repeatMode: StateFlow<QueueRepeatMode> = _repeatMode.asStateFlow()
    
    private var originalQueue: List<UnifiedMediaItem> = emptyList()
    
    /**
     * Set new queue with optional starting position
     */
    fun setQueue(items: List<UnifiedMediaItem>, startIndex: Int = 0) {
        originalQueue = items
        _currentQueue.value = MediaQueue(
            items = items,
            currentIndex = startIndex.coerceIn(0, items.size - 1),
            shuffled = _isShuffled.value,
            repeatMode = _repeatMode.value
        )
    }
    
    /**
     * Add item to queue
     */
    fun addToQueue(item: UnifiedMediaItem, position: Int? = null) {
        val currentQueue = _currentQueue.value
        val mutableItems = currentQueue.items.toMutableList()
        
        if (position != null && position in 0..mutableItems.size) {
            mutableItems.add(position, item)
        } else {
            mutableItems.add(item)
        }
        
        val adjustedIndex = if (position != null && position <= currentQueue.currentIndex) {
            currentQueue.currentIndex + 1
        } else {
            currentQueue.currentIndex
        }
        
        _currentQueue.value = currentQueue.copy(
            items = mutableItems,
            currentIndex = adjustedIndex
        )
    }
    
    /**
     * Remove item from queue
     */
    fun removeFromQueue(index: Int) {
        val currentQueue = _currentQueue.value
        if (index !in 0 until currentQueue.items.size) return
        
        val mutableItems = currentQueue.items.toMutableList()
        mutableItems.removeAt(index)
        
        val adjustedIndex = when {
            index < currentQueue.currentIndex -> currentQueue.currentIndex - 1
            index == currentQueue.currentIndex && index == mutableItems.size -> 
                (currentQueue.currentIndex - 1).coerceAtLeast(0)
            else -> currentQueue.currentIndex
        }
        
        _currentQueue.value = currentQueue.copy(
            items = mutableItems,
            currentIndex = adjustedIndex
        )
    }
    
    /**
     * Move to next item in queue
     */
    fun moveToNext(): Boolean {
        val currentQueue = _currentQueue.value
        
        val nextIndex = when (currentQueue.repeatMode) {
            QueueRepeatMode.ONE -> currentQueue.currentIndex
            QueueRepeatMode.ALL -> (currentQueue.currentIndex + 1) % currentQueue.items.size
            QueueRepeatMode.NONE -> {
                if (currentQueue.currentIndex < currentQueue.items.size - 1) {
                    currentQueue.currentIndex + 1
                } else {
                    return false
                }
            }
        }
        
        _currentQueue.value = currentQueue.copy(currentIndex = nextIndex)
        return true
    }
    
    /**
     * Move to previous item in queue
     */
    fun moveToPrevious(): Boolean {
        val currentQueue = _currentQueue.value
        
        val prevIndex = when (currentQueue.repeatMode) {
            QueueRepeatMode.ONE -> currentQueue.currentIndex
            QueueRepeatMode.ALL -> {
                if (currentQueue.currentIndex > 0) {
                    currentQueue.currentIndex - 1
                } else {
                    currentQueue.items.size - 1
                }
            }
            QueueRepeatMode.NONE -> {
                if (currentQueue.currentIndex > 0) {
                    currentQueue.currentIndex - 1
                } else {
                    return false
                }
            }
        }
        
        _currentQueue.value = currentQueue.copy(currentIndex = prevIndex)
        return true
    }
    
    /**
     * Jump to specific index in queue
     */
    fun jumpToIndex(index: Int): Boolean {
        val currentQueue = _currentQueue.value
        if (index !in 0 until currentQueue.items.size) return false
        
        _currentQueue.value = currentQueue.copy(currentIndex = index)
        return true
    }
    
    /**
     * Toggle shuffle mode
     */
    fun toggleShuffle() {
        val currentQueue = _currentQueue.value
        val newShuffled = !_isShuffled.value
        _isShuffled.value = newShuffled
        
        val newItems = if (newShuffled) {
            val currentItem = currentQueue.currentItem
            val otherItems = currentQueue.items.filter { it != currentItem }.shuffled()
            if (currentItem != null) {
                listOf(currentItem) + otherItems
            } else {
                otherItems
            }
        } else {
            originalQueue
        }
        
        _currentQueue.value = currentQueue.copy(
            items = newItems,
            currentIndex = 0,
            shuffled = newShuffled
        )
    }
    
    /**
     * Set repeat mode
     */
    fun setRepeatMode(mode: QueueRepeatMode) {
        _repeatMode.value = mode
        _currentQueue.value = _currentQueue.value.copy(repeatMode = mode)
    }
    
    /**
     * Clear the queue
     */
    fun clearQueue() {
        _currentQueue.value = MediaQueue(emptyList())
        originalQueue = emptyList()
    }
}