package com.universalmedialibrary.services.sync

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.ReadingProgress
import io.mockk.*
import kotlinx.coroutines.runBlocking
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test

class CloudSyncEngineMergeTest {

    private val context = mockk<Context>(relaxed = true)
    private val database = mockk<AppDatabase>(relaxed = true)
    private val readingProgressDao = mockk<ReadingProgressDao>(relaxed = true)
    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private val bookmarkDao = mockk<BookmarkDao>(relaxed = true)

    private lateinit var syncEngine: CloudSyncEngine

    @Before
    fun setUp() {
        every { database.readingProgressDao() } returns readingProgressDao
        every { database.mediaItemDao() } returns mediaItemDao
        every { database.bookmarkDao() } returns bookmarkDao

        syncEngine = CloudSyncEngine(
            context = context,
            database = database
        )
    }

    @Test
    fun `mergeReadingProgress selects local rewind when local vector clock dominates despite lower currentPage and skewed backward clock`() = runBlocking {
        // Local user rewound from page 50 to page 15 while offline, with a device clock skewed backwards to 1000L
        val localProgress = ReadingProgress(
            progressId = 1L,
            itemId = 42L,
            currentPage = 15, // Rewound page!
            currentPosition = 15000L,
            sequenceNumber = 5L,
            vectorClock = "{\"deviceOffline\":2,\"deviceRemote\":1}",
            lastUpdate = 1000L // Clock skewed backwards!
        )

        // Remote peer played forward to page 50 with newer wall clock 9000L but older causal clock
        val remoteProgress = ReadingProgress(
            progressId = 2L,
            itemId = 42L,
            currentPage = 50, // Higher page!
            currentPosition = 50000L,
            sequenceNumber = 4L,
            vectorClock = "{\"deviceOffline\":1,\"deviceRemote\":1}",
            lastUpdate = 9000L // Wall clock is newer!
        )

        val conflict = SyncConflict(
            itemId = "42",
            itemType = "READING_PROGRESS",
            localData = SyncChange(
                itemId = "42",
                itemType = "READING_PROGRESS",
                operation = ChangeOperation.MODIFY,
                timestamp = 1000L,
                data = localProgress,
                sequenceNumber = 5L,
                vectorClock = "{\"deviceOffline\":2,\"deviceRemote\":1}"
            ),
            remoteData = SyncChange(
                itemId = "42",
                itemType = "READING_PROGRESS",
                operation = ChangeOperation.MODIFY,
                timestamp = 9000L,
                data = remoteProgress,
                sequenceNumber = 4L,
                vectorClock = "{\"deviceOffline\":1,\"deviceRemote\":1}"
            ),
            localTimestamp = 1000L,
            remoteTimestamp = 9000L
        )

        val insertedSlot = slot<ReadingProgress>()
        coEvery { readingProgressDao.insertProgress(capture(insertedSlot)) } returns Unit

        // Trigger merge directly
        syncEngine.mergeReadingProgress(conflict)

        coVerify(exactly = 1) { readingProgressDao.insertProgress(any()) }
        assertEquals(15, insertedSlot.captured.currentPage)
        assertEquals(5L, insertedSlot.captured.sequenceNumber)
    }

    @Test
    fun `mergeReadingProgress resolves using logical sequence numbers when clocks are concurrent`() = runBlocking {
        // Concurrent vector clocks, but local sequence number is higher
        val localProgress = ReadingProgress(
            progressId = 10L,
            itemId = 100L,
            currentPage = 20,
            sequenceNumber = 8L,
            vectorClock = "{\"nodeA\":2,\"nodeB\":1}"
        )
        val remoteProgress = ReadingProgress(
            progressId = 20L,
            itemId = 100L,
            currentPage = 80,
            sequenceNumber = 6L,
            vectorClock = "{\"nodeA\":1,\"nodeB\":2}"
        )

        val conflict = SyncConflict(
            itemId = "100",
            itemType = "READING_PROGRESS",
            localData = localProgress,
            remoteData = remoteProgress,
            localTimestamp = 2000L,
            remoteTimestamp = 3000L
        )

        val insertedSlot = slot<ReadingProgress>()
        coEvery { readingProgressDao.insertProgress(capture(insertedSlot)) } returns Unit

        syncEngine.mergeReadingProgress(conflict)

        coVerify(exactly = 1) { readingProgressDao.insertProgress(any()) }
        // Local wins because seq 8 > seq 6
        assertEquals(20, insertedSlot.captured.currentPage)
    }
}
