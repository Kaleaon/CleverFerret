package com.universalmedialibrary.services.playback

import android.content.Context
import androidx.room.Room
import androidx.test.core.app.ApplicationProvider
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.services.exoplayer.ExoPlayerState
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.test.runTest
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.mockito.kotlin.whenever
import java.io.IOException

/**
 * Unit tests for UnifiedPlaybackQueueManager
 * 
 * Tests core queue operations, session management, and state persistence.
 */
@OptIn(ExperimentalCoroutinesApi::class)
@RunWith(AndroidJUnit4::class)
class UnifiedPlaybackQueueManagerTest {
    
    @Mock
    private lateinit var mockExoPlayerService: ExoPlayerService
    
    private lateinit var database: AppDatabase
    private lateinit var queueManager: UnifiedPlaybackQueueManager
    private lateinit var context: Context
    
    @Before
    fun setup() {
        MockitoAnnotations.openMocks(this)
        context = ApplicationProvider.getApplicationContext()
        
        // Create in-memory database for testing
        database = Room.inMemoryDatabaseBuilder(
            context,
            AppDatabase::class.java
        ).allowMainThreadQueries().build()
        
        // Mock ExoPlayer service
        val mockPlayerState = MutableStateFlow(ExoPlayerState())
        whenever(mockExoPlayerService.playerState).thenReturn(mockPlayerState)
        whenever(mockExoPlayerService.getCurrentPosition()).thenReturn(0L)
        whenever(mockExoPlayerService.getDuration()).thenReturn(180000L) // 3 minutes
        
        // Create queue manager
        queueManager = UnifiedPlaybackQueueManager(
            context = context,
            database = database,
            exoPlayerService = mockExoPlayerService
        )
    }
    
    @After
    @Throws(IOException::class)
    fun tearDown() {
        database.close()
        queueManager.release()
    }
    
    @Test
    fun testDefaultSessionCreation() = runTest {
        // Wait a moment for initialization
        kotlinx.coroutines.delay(100)
        
        val session = queueManager.currentSession.first()
        assertNotNull("Default session should be created", session)
        assertEquals("DEFAULT", session?.sessionName)
        assertEquals("GLOBAL", session?.sessionType)
        assertTrue("Session should be active", session?.isActive == true)
    }
    
    @Test
    fun testCreateQueue() = runTest {
        val queue = queueManager.createOrSwitchToQueue(
            queueName = "TEST_QUEUE",
            queueType = "MUSIC",
            displayName = "Test Music Queue"
        )
        
        assertNotNull("Queue should be created", queue)
        assertEquals("TEST_QUEUE", queue.queueName)
        assertEquals("MUSIC", queue.queueType)
        assertEquals("Test Music Queue", queue.displayName)
        assertTrue("Queue should be persistent", queue.isPersistent)
    }
    
    @Test
    fun testEnqueueItems() = runTest {
        // First create a library
        val libraryId = database.libraryDao().insertLibrary(
            Library(
                name = "Test Library",
                path = "/test/path",
                type = "MUSIC"
            )
        )
        
        // Create test media items
        val mediaItems = listOf(
            MediaItem(
                libraryId = libraryId,
                filePath = "/test/song1.mp3",
                fileName = "Song 1.mp3",
                fileExtension = "mp3",
                fileSize = 5000000,
                mediaType = "MUSIC_TRACK",
                mimeType = "audio/mpeg"
            ),
            MediaItem(
                libraryId = libraryId,
                filePath = "/test/song2.mp3",
                fileName = "Song 2.mp3", 
                fileExtension = "mp3",
                fileSize = 4500000,
                mediaType = "MUSIC_TRACK",
                mimeType = "audio/mpeg"
            )
        )
        
        // Insert media items into database
        val insertedItems = mediaItems.map { item ->
            val itemId = database.mediaItemDao().insertMediaItem(item)
            item.copy(itemId = itemId)
        }
        
        // Enqueue items
        queueManager.enqueueItems(insertedItems)
        
        // Verify queue was created and items added
        val currentQueue = queueManager.currentQueue.first()
        assertNotNull("Queue should exist", currentQueue)
        
        val queueItems = queueManager.queueItems.first()
        assertEquals("Should have 2 items in queue", 2, queueItems.size)
        assertEquals("First item should be Song 1", "Song 1", queueItems[0].title)
        assertEquals("Second item should be Song 2", "Song 2", queueItems[1].title)
        assertEquals("First item position should be 0", 0, queueItems[0].queuePosition)
        assertEquals("Second item position should be 1", 1, queueItems[1].queuePosition)
    }
    
    @Test 
    fun testSwitchQueues() = runTest {
        // Create first queue
        val musicQueue = queueManager.createOrSwitchToQueue(
            queueName = "MUSIC_QUEUE",
            queueType = "MUSIC",
            displayName = "Music"
        )
        
        // Create second queue
        val audiobookQueue = queueManager.createOrSwitchToQueue(
            queueName = "AUDIOBOOK_QUEUE", 
            queueType = "AUDIOBOOK",
            displayName = "Audiobook"
        )
        
        // Verify we're on audiobook queue
        val currentQueue = queueManager.currentQueue.first()
        assertEquals("Should be on audiobook queue", audiobookQueue.queueId, currentQueue?.queueId)
        
        // Switch back to music queue
        queueManager.switchToQueue(musicQueue.queueId)
        
        val switchedQueue = queueManager.currentQueue.first()
        assertEquals("Should be on music queue", musicQueue.queueId, switchedQueue?.queueId)
    }
    
    @Test
    fun testRepeatModes() = runTest {
        val queue = queueManager.createOrSwitchToQueue("TEST_QUEUE", "MUSIC", "Test")
        
        // Test setting different repeat modes
        queueManager.setRepeatMode(RepeatMode.ONE)
        val updatedQueue = database.playbackQueueDao().getQueueById(queue.queueId)
        assertEquals("ONE", updatedQueue?.repeatMode)
        
        queueManager.setRepeatMode(RepeatMode.ALL)
        val updatedQueue2 = database.playbackQueueDao().getQueueById(queue.queueId)
        assertEquals("ALL", updatedQueue2?.repeatMode)
        
        queueManager.setRepeatMode(RepeatMode.SHUFFLE)
        val updatedQueue3 = database.playbackQueueDao().getQueueById(queue.queueId)
        assertEquals("SHUFFLE", updatedQueue3?.repeatMode)
        assertTrue("Shuffle should be enabled", updatedQueue3?.shuffleEnabled == true)
    }
    
    @Test
    fun testPlaybackState() = runTest {
        val initialState = queueManager.playbackState.first()
        
        assertFalse("Initially not playing", initialState.isPlaying)
        assertFalse("Initially not paused", initialState.isPaused)
        assertEquals("Initial position is 0", 0L, initialState.currentPositionMs)
        assertEquals("Initial speed is 1.0", 1.0f, initialState.playbackSpeed)
        assertFalse("Initially no error", initialState.hasError)
        assertTrue("Initially can play", initialState.canPlay)
    }
}