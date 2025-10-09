package com.universalmedialibrary.services.playback

import android.content.Context
import androidx.media3.common.MediaItem as ExoMediaItem
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.PlaybackQueueDao
import com.universalmedialibrary.data.local.dao.QueueItemDao
import com.universalmedialibrary.data.local.dao.PlaybackSessionDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.PlaybackQueue
import com.universalmedialibrary.data.local.entity.QueueItem
import com.universalmedialibrary.data.local.entity.PlaybackSession
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Playback Queue Manager
 *
 * Central service managing all media playback across different media types.
 * Provides a single interface for queue management, session state, and
 * cross-media playback capabilities.
 *
 * Features:
 * - Universal queue supporting music, audiobooks, TTS, podcasts, video
 * - Persistent playback state and position tracking
 * - Queue operations: enqueue, reorder, shuffle, repeat modes
 * - Session management with multiple concurrent sessions
 * - Chapter/bookmark support for structured media
 * - Android MediaSession integration for system controls
 */
@Singleton
class UnifiedPlaybackQueueManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val database: AppDatabase,
    private val exoPlayerService: ExoPlayerService
) {

    private val queueDao: PlaybackQueueDao = database.playbackQueueDao()
    private val queueItemDao: QueueItemDao = database.queueItemDao()
    private val sessionDao: PlaybackSessionDao = database.playbackSessionDao()

    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    // State management
    private val _currentSession = MutableStateFlow<PlaybackSession?>(null)
    val currentSession: StateFlow<PlaybackSession?> = _currentSession.asStateFlow()

    private val _currentQueue = MutableStateFlow<PlaybackQueue?>(null)
    val currentQueue: StateFlow<PlaybackQueue?> = _currentQueue.asStateFlow()

    private val _queueItems = MutableStateFlow<List<QueueItem>>(emptyList())
    val queueItems: StateFlow<List<QueueItem>> = _queueItems.asStateFlow()

    private val _currentItem = MutableStateFlow<QueueItem?>(null)
    val currentItem: StateFlow<QueueItem?> = _currentItem.asStateFlow()

    private val _playbackState = MutableStateFlow(UnifiedPlaybackState())
    val playbackState: StateFlow<UnifiedPlaybackState> = _playbackState.asStateFlow()

    init {
        // Initialize with default session
        serviceScope.launch {
            initializeDefaultSession()
            observePlaybackState()
        }
    }

    /**
     * Initialize or restore the default playback session
     */
    private suspend fun initializeDefaultSession() = withContext(Dispatchers.IO) {
        var session = sessionDao.getSessionByName("DEFAULT")

        if (session == null) {
            // Create default session
            val sessionId = sessionDao.insertSession(
                PlaybackSession(
                    sessionName = "DEFAULT",
                    sessionType = "GLOBAL",
                    isActive = true
                )
            )
            session = sessionDao.getSessionById(sessionId)
        } else {
            // Activate existing session
            sessionDao.deactivateAllSessions()
            sessionDao.activateSession(session.sessionId)
        }

        session?.let { activeSession ->
            _currentSession.value = activeSession

            // Restore active queue if it exists
            activeSession.activeQueueId?.let { queueId ->
                val queue = queueDao.getQueueById(queueId)
                _currentQueue.value = queue

                // Load queue items
                val items = queueItemDao.getQueueItems(queueId)
                _queueItems.value = items

                // Find current item
                val currentItem = items.find { it.isCurrentlyPlaying }
                _currentItem.value = currentItem

                // Update playback state
                updatePlaybackState(
                    isPlaying = activeSession.isPlaying,
                    isPaused = activeSession.isPaused,
                    currentPositionMs = activeSession.currentPositionMs,
                    playbackSpeed = activeSession.playbackSpeed
                )
            }
        }
    }

    /**
     * Observe ExoPlayer state and sync with our state
     */
    private fun observePlaybackState() {
        serviceScope.launch {
            exoPlayerService.playerState.collect { exoState ->
                updatePlaybackState(
                    isPlaying = exoState.isPlaying,
                    currentPositionMs = exoState.currentPosition,
                    duration = exoState.duration,
                    playbackSpeed = exoState.playbackSpeed,
                    isBuffering = exoState.isBuffering,
                    hasEnded = exoState.hasEnded
                )

                // Save position periodically
                if (exoState.isPlaying) {
                    saveCurrentPosition(exoState.currentPosition)
                }
            }
        }
    }

    /**
     * Create or switch to a queue for specific media type
     */
    suspend fun createOrSwitchToQueue(
        queueName: String,
        queueType: String,
        displayName: String = queueName
    ): PlaybackQueue = withContext(Dispatchers.IO) {

        var queue = queueDao.getQueueByName(queueName)

        if (queue == null) {
            // Create new queue
            val queueId = queueDao.insertQueue(
                PlaybackQueue(
                    queueName = queueName,
                    displayName = displayName,
                    queueType = queueType,
                    isActive = false,
                    isPersistent = true
                )
            )
            queue = queueDao.getQueueById(queueId)!!
        }

        // Switch to this queue
        switchToQueue(queue.queueId)

        queue
    }

    /**
     * Switch to a different queue
     */
    suspend fun switchToQueue(queueId: Long) = withContext(Dispatchers.IO) {
        // Save current state first
        saveCurrentState()

        // Deactivate all queues
        queueDao.deactivateAllQueues()

        // Activate new queue
        queueDao.activateQueue(queueId)
        queueDao.updateLastUsed(queueId)

        // Load new queue
        val queue = queueDao.getQueueById(queueId)
        _currentQueue.value = queue

        // Load queue items
        val items = queueItemDao.getQueueItems(queueId)
        _queueItems.value = items

        // Update session
        _currentSession.value?.let { session ->
            sessionDao.updateActiveQueue(session.sessionId, queueId)
        }

        // Find current item and prepare player
        val currentItem = items.find { it.isCurrentlyPlaying }
        if (currentItem != null) {
            _currentItem.value = currentItem
            preparePlayerForCurrentItem()
        }
    }

    /**
     * Add media items to the current queue
     */
    suspend fun enqueueItems(
        mediaItems: List<MediaItem>,
        insertAtCurrent: Boolean = false
    ) = withContext(Dispatchers.IO) {

        val currentQueue = _currentQueue.value ?: run {
            // Create main queue if none exists
            createOrSwitchToQueue("MAIN_QUEUE", "MAIN", "Now Playing")
        }

        val currentItems = _queueItems.value
        val insertPosition = if (insertAtCurrent) {
            val currentIndex = currentItems.indexOfFirst { it.isCurrentlyPlaying }
            if (currentIndex >= 0) currentIndex + 1 else currentItems.size
        } else {
            currentItems.size
        }

        // Create queue items
        val queueItems = mediaItems.mapIndexed { index, mediaItem ->
            QueueItem(
                queueId = currentQueue.queueId,
                mediaItemId = mediaItem.itemId,
                queuePosition = insertPosition + index,
                mediaType = determineMediaType(mediaItem.mediaType),
                title = mediaItem.fileName.substringBeforeLast('.'),
                durationMs = 0 // Will be filled when loaded
            )
        }

        // Shift existing items if inserting
        if (insertAtCurrent && insertPosition < currentItems.size) {
            queueItemDao.shiftPositionsUp(currentQueue.queueId, insertPosition)
        }

        // Insert new items
        queueItemDao.insertQueueItems(queueItems)

        // Refresh queue items
        val updatedItems = queueItemDao.getQueueItems(currentQueue.queueId)
        _queueItems.value = updatedItems

        // Update queue timestamp
        queueDao.updateLastUsed(currentQueue.queueId)
    }

    // Playback control methods
    fun play() {
        exoPlayerService.play()
        updatePlaybackSessionState(isPlaying = true, isPaused = false)
    }

    fun pause() {
        exoPlayerService.pause()
        updatePlaybackSessionState(isPlaying = false, isPaused = true)
    }

    fun stop() {
        exoPlayerService.stop()
        updatePlaybackSessionState(isPlaying = false, isPaused = false)
    }

    fun seekTo(positionMs: Long) {
        exoPlayerService.seekTo(positionMs)
        serviceScope.launch {
            saveCurrentPosition(positionMs)
        }
    }

    fun setPlaybackSpeed(speed: Float) {
        exoPlayerService.setPlaybackSpeed(speed)
        serviceScope.launch {
            _currentSession.value?.let { session ->
                sessionDao.updatePlaybackSpeed(session.sessionId, speed)
            }
        }
    }

    /**
     * Skip to the next item in the queue
     */
    suspend fun skipToNext() = withContext(Dispatchers.IO) {
        val currentQueue = _currentQueue.value ?: return@withContext
        val items = _queueItems.value
        
        if (items.isEmpty()) return@withContext
        
        // Find current item index
        val currentIndex = items.indexOfFirst { it.isCurrentlyPlaying }
        
        if (currentIndex < 0) {
            // No current item, start from first
            playQueueItemAtIndex(0)
            return@withContext
        }
        
        // Check if we're at the end
        if (currentIndex >= items.size - 1) {
            // Handle based on repeat mode
            val repeatMode = currentQueue.repeatMode
            when (repeatMode) {
                "ALL", "SHUFFLE" -> {
                    // Loop back to start
                    playQueueItemAtIndex(0)
                }
                else -> {
                    // Stop at end
                    stop()
                }
            }
        } else {
            // Play next item
            playQueueItemAtIndex(currentIndex + 1)
        }
    }

    /**
     * Skip to the previous item in the queue
     */
    suspend fun skipToPrevious() = withContext(Dispatchers.IO) {
        val items = _queueItems.value
        
        if (items.isEmpty()) return@withContext
        
        // Find current item index
        val currentIndex = items.indexOfFirst { it.isCurrentlyPlaying }
        
        if (currentIndex <= 0) {
            // At beginning, restart current track or go to end based on repeat mode
            val currentQueue = _currentQueue.value
            if (currentQueue?.repeatMode == "ALL" || currentQueue?.repeatMode == "SHUFFLE") {
                // Loop to end
                playQueueItemAtIndex(items.size - 1)
            } else {
                // Restart current track
                seekTo(0)
            }
        } else {
            // Play previous item
            playQueueItemAtIndex(currentIndex - 1)
        }
    }

    /**
     * Play a specific queue item by its ID
     */
    suspend fun playQueueItem(queueItemId: Long) = withContext(Dispatchers.IO) {
        val items = _queueItems.value
        val itemIndex = items.indexOfFirst { it.queueItemId == queueItemId }
        
        if (itemIndex >= 0) {
            playQueueItemAtIndex(itemIndex)
        }
    }

    /**
     * Remove an item from the queue
     */
    suspend fun removeFromQueue(queueItemId: Long) = withContext(Dispatchers.IO) {
        val currentQueue = _currentQueue.value ?: return@withContext
        val items = _queueItems.value
        val itemToRemove = items.find { it.queueItemId == queueItemId } ?: return@withContext
        
        // Check if we're removing the currently playing item
        val wasCurrentlyPlaying = itemToRemove.isCurrentlyPlaying
        val removedPosition = itemToRemove.queuePosition
        
        // Delete from database
        queueItemDao.deleteQueueItemById(queueItemId)
        
        // Shift positions of items after the removed item
        queueItemDao.shiftPositionsDown(currentQueue.queueId, removedPosition, Int.MAX_VALUE)
        
        // Reload queue items
        val updatedItems = queueItemDao.getQueueItems(currentQueue.queueId)
        _queueItems.value = updatedItems
        
        // If we removed the current item, handle playback state
        if (wasCurrentlyPlaying) {
            if (updatedItems.isEmpty()) {
                // Queue is now empty
                stop()
                _currentItem.value = null
            } else {
                // Find item at the same position (which is now the "next" item)
                val nextItem = updatedItems.find { it.queuePosition == removedPosition }
                    ?: updatedItems.firstOrNull()
                
                nextItem?.let {
                    playQueueItem(it.queueItemId)
                }
            }
        }
        
        // Update queue timestamp
        queueDao.updateLastUsed(currentQueue.queueId)
    }

    /**
     * Set repeat mode for the current queue
     */
    suspend fun setRepeatMode(repeatMode: RepeatMode) = withContext(Dispatchers.IO) {
        _currentQueue.value?.let { queue ->
            val modeString = repeatMode.name
            queueDao.updateRepeatMode(queue.queueId, modeString)
            
            // Reload queue
            val updatedQueue = queueDao.getQueueById(queue.queueId)
            _currentQueue.value = updatedQueue
        }
    }

    /**
     * Set shuffle mode for the current queue
     */
    suspend fun setShuffleMode(enabled: Boolean) = withContext(Dispatchers.IO) {
        _currentQueue.value?.let { queue ->
            queueDao.updateShuffleMode(queue.queueId, enabled)
            
            // Reload queue
            val updatedQueue = queueDao.getQueueById(queue.queueId)
            _currentQueue.value = updatedQueue
            
            // If shuffle is enabled, randomize queue order (except current item)
            if (enabled) {
                shuffleQueue()
            }
        }
    }

    // Private helper methods
    
    /**
     * Play the queue item at a specific index
     */
    private suspend fun playQueueItemAtIndex(index: Int) {
        val currentQueue = _currentQueue.value ?: return
        val items = _queueItems.value
        
        if (index < 0 || index >= items.size) return
        
        val itemToPlay = items[index]
        
        // Clear current playing status
        queueItemDao.clearCurrentlyPlaying(currentQueue.queueId)
        
        // Set new current item
        queueItemDao.setCurrentlyPlaying(itemToPlay.queueItemId)
        _currentItem.value = itemToPlay
        
        // Record playback
        queueItemDao.recordPlayback(itemToPlay.queueItemId)
        
        // Prepare and play
        preparePlayerForCurrentItem()
        play()
        
        // Reload items to get updated state
        _queueItems.value = queueItemDao.getQueueItems(currentQueue.queueId)
    }

    /**
     * Shuffle the queue order while keeping the current item in place
     */
    private suspend fun shuffleQueue() {
        val currentQueue = _currentQueue.value ?: return
        val items = _queueItems.value.toMutableList()
        
        if (items.size <= 1) return
        
        // Find and remove current item
        val currentIndex = items.indexOfFirst { it.isCurrentlyPlaying }
        val currentItem = if (currentIndex >= 0) items.removeAt(currentIndex) else null
        
        // Shuffle remaining items
        items.shuffle()
        
        // Put current item at the beginning if it exists
        if (currentItem != null) {
            items.add(0, currentItem)
        }
        
        // Update positions in database
        items.forEachIndexed { index, item ->
            queueItemDao.updateItemPosition(item.queueItemId, index)
        }
        
        // Reload queue items
        _queueItems.value = queueItemDao.getQueueItems(currentQueue.queueId)
    }
    private suspend fun preparePlayerForCurrentItem() {
        val currentItem = _currentItem.value ?: return
        val mediaItem = database.mediaItemDao().getMediaItemById(currentItem.mediaItemId) ?: return

        val exoMediaItem = ExoMediaItem.fromUri(mediaItem.filePath)
        if (exoPlayerService.prepareMedia(exoMediaItem)) {
            // Seek to saved position
            if (currentItem.playbackPositionMs > 0) {
                exoPlayerService.seekTo(currentItem.playbackPositionMs)
            }
        }
    }

    private fun determineMediaType(mediaType: String): String {
        return when (mediaType.uppercase()) {
            "MUSIC_TRACK" -> "MUSIC"
            "BOOK", "AUDIOBOOK" -> "AUDIOBOOK"
            "VIDEO", "MOVIE", "TV_SHOW" -> "VIDEO"
            "PODCAST" -> "PODCAST"
            else -> "UNKNOWN"
        }
    }

    private suspend fun saveCurrentPosition(positionMs: Long) {
        _currentItem.value?.let { currentItem ->
            queueItemDao.updatePlaybackPosition(currentItem.queueItemId, positionMs)
        }

        _currentSession.value?.let { session ->
            sessionDao.updateCurrentPosition(session.sessionId, positionMs)
        }
    }

    private suspend fun saveCurrentState() = withContext(Dispatchers.IO) {
        val currentPosition = exoPlayerService.getCurrentPosition()
        saveCurrentPosition(currentPosition)

        _currentSession.value?.let { session ->
            sessionDao.updateLastUsed(session.sessionId)
        }
    }

    private fun updatePlaybackSessionState(
        isPlaying: Boolean? = null,
        isPaused: Boolean? = null
    ) {
        serviceScope.launch {
            _currentSession.value?.let { session ->
                if (isPlaying != null && isPaused != null) {
                    sessionDao.updatePlaybackState(session.sessionId, isPlaying, isPaused)
                }
            }
        }
    }

    private fun updatePlaybackState(
        isPlaying: Boolean = _playbackState.value.isPlaying,
        isPaused: Boolean = _playbackState.value.isPaused,
        isBuffering: Boolean = _playbackState.value.isBuffering,
        hasEnded: Boolean = _playbackState.value.hasEnded,
        currentPositionMs: Long = _playbackState.value.currentPositionMs,
        duration: Long = _playbackState.value.duration,
        playbackSpeed: Float = _playbackState.value.playbackSpeed,
        error: String? = null
    ) {
        _playbackState.value = UnifiedPlaybackState(
            isPlaying = isPlaying,
            isPaused = isPaused,
            isBuffering = isBuffering,
            hasEnded = hasEnded,
            currentPositionMs = currentPositionMs,
            duration = duration,
            playbackSpeed = playbackSpeed,
            error = error
        )
    }

    /**
     * Release resources and save state
     */
    fun release() {
        serviceScope.launch {
            saveCurrentState()
        }
    }
}

/**
 * Unified playback state for all media types
 */
data class UnifiedPlaybackState(
    val isPlaying: Boolean = false,
    val isPaused: Boolean = false,
    val isBuffering: Boolean = false,
    val hasEnded: Boolean = false,
    val currentPositionMs: Long = 0,
    val duration: Long = 0,
    val playbackSpeed: Float = 1.0f,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canPlay: Boolean get() = !isBuffering && !hasError
}

/**
 * Repeat modes for queue playback
 */
enum class RepeatMode {
    NONE,    // Play through queue once
    ONE,     // Repeat current item
    ALL,     // Repeat entire queue
    SHUFFLE  // Random playback order
}
