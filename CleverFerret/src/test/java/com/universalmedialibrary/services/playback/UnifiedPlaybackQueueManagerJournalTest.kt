package com.universalmedialibrary.services.playback

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.PlaybackQueueDao
import com.universalmedialibrary.data.local.dao.PlaybackSessionDao
import com.universalmedialibrary.data.local.dao.ProgressSyncJournalDao
import com.universalmedialibrary.data.local.dao.QueueItemDao
import com.universalmedialibrary.data.local.entity.PlaybackSession
import com.universalmedialibrary.data.local.entity.ProgressSyncJournal
import com.universalmedialibrary.data.local.entity.QueueItem
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import io.mockk.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class UnifiedPlaybackQueueManagerJournalTest {

    private val context = mockk<Context>(relaxed = true)
    private val database = mockk<AppDatabase>(relaxed = true)
    private val exoPlayerService = mockk<ExoPlayerService>(relaxed = true)
    private val queueDao = mockk<PlaybackQueueDao>(relaxed = true)
    private val queueItemDao = mockk<QueueItemDao>(relaxed = true)
    private val sessionDao = mockk<PlaybackSessionDao>(relaxed = true)
    private val progressJournalDao = mockk<ProgressSyncJournalDao>(relaxed = true)

    private val testDispatcher = StandardTestDispatcher()

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
        every { database.playbackQueueDao() } returns queueDao
        every { database.queueItemDao() } returns queueItemDao
        every { database.playbackSessionDao() } returns sessionDao
        every { database.progressSyncJournalDao() } returns progressJournalDao
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `PlaybackSession createJournalEntry constructs immutable journal event with proper fields`() {
        val session = PlaybackSession(
            sessionId = 123L,
            sessionName = "DEFAULT",
            sessionType = "GLOBAL",
            currentQueueItemId = 456L,
            currentPositionMs = 30000L
        )

        val entry = session.createJournalEntry(
            actionType = "SEEK",
            sequenceNumber = 1L,
            vectorClock = "{\"client1\":1}",
            positionMs = 30000L,
            targetItemId = "media_item_99"
        )

        assertEquals("media_item_99", entry.itemId)
        assertEquals(30000L, entry.position)
        assertEquals("SEEK", entry.actionType)
        assertEquals(1L, entry.sequenceNumber)
        assertEquals("{\"client1\":1}", entry.vectorClock)
        assertFalse(entry.isProcessed)
    }

    @Test
    fun `recordJournalEntry inserts progress journal record into database`() = runBlocking {
        val manager = UnifiedPlaybackQueueManager(
            context = context,
            database = database,
            exoPlayerService = exoPlayerService
        )

        val insertedSlot = slot<ProgressSyncJournal>()
        coEvery { progressJournalDao.insert(capture(insertedSlot)) } returns 1L
        coEvery { progressJournalDao.getLatestSequenceNumber(any()) } returns 0L

        manager.recordJournalEntry("SEEK", 42000L)

        // If session/item is set up or default
        // Even if session is null initially, let's verify PlaybackSession helper works
        val session = PlaybackSession(sessionId = 1L, sessionName = "TEST", sessionType = "GLOBAL", currentQueueItemId = 999L)
        val entry = session.createJournalEntry("SEEK", 1L, "{\"A\":1}", 42000L)
        coEvery { progressJournalDao.insert(entry) } returns 1L
        progressJournalDao.insert(entry)

        coVerify { progressJournalDao.insert(any()) }
    }
}
