package com.universalmedialibrary.services.plex

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.services.cache.MediaDownloadScheduler
import com.universalmedialibrary.services.ingestion.IngestionPipeline
import io.mockk.*
import kotlinx.coroutines.runBlocking
import okhttp3.ResponseBody.Companion.toResponseBody
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import retrofit2.Response

class PlexSyncAdapterJournalTest {

    private val context = mockk<Context>(relaxed = true)
    private val database = mockk<AppDatabase>(relaxed = true)
    private val plexServerDao = mockk<PlexServerDao>(relaxed = true)
    private val plexMediaItemDao = mockk<PlexMediaItemDao>(relaxed = true)
    private val plexSyncDao = mockk<PlexSyncDao>(relaxed = true)
    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private val libraryDao = mockk<LibraryDao>(relaxed = true)
    private val authService = mockk<PlexAuthService>(relaxed = true)
    private val ingestionPipeline = mockk<IngestionPipeline>(relaxed = true)
    private val downloadScheduler = mockk<MediaDownloadScheduler>(relaxed = true)
    private val progressJournalDao = mockk<ProgressSyncJournalDao>(relaxed = true)
    private val api = mockk<PlexApi>(relaxed = true)

    private lateinit var syncAdapter: PlexSyncAdapter

    private val server = PlexServer(
        serverId = 1L,
        name = "HomePlex",
        host = "plex.local",
        port = 32400,
        token = "test-token-xyz",
        machineIdentifier = "machine-abc-123"
    )

    private val plexMediaItem = PlexMediaItem(
        id = 10L,
        serverId = 1L,
        plexRatingKey = "9999",
        localMediaItemId = 42L,
        title = "Test Movie",
        type = "movie",
        libraryName = "Movies",
        librarySectionId = "1"
    )

    @Before
    fun setUp() {
        syncAdapter = PlexSyncAdapter(
            context = context,
            database = database,
            plexServerDao = plexServerDao,
            plexMediaItemDao = plexMediaItemDao,
            plexSyncDao = plexSyncDao,
            mediaItemDao = mediaItemDao,
            libraryDao = libraryDao,
            authService = authService,
            ingestionPipeline = ingestionPipeline,
            downloadScheduler = downloadScheduler,
            progressSyncJournalDao = progressJournalDao
        )

        coEvery { plexMediaItemDao.getMediaItemByRatingKey("9999") } returns plexMediaItem
        coEvery { plexMediaItemDao.getMediaItemByLocalId(42L) } returns plexMediaItem
    }

    @Test
    fun `processPendingJournal successfully processes offline rewind events and updates Plex`() = runBlocking {
        // Arrange: A rewind event where position goes backwards (from 120000ms down to 30000ms)
        val rewindEntry = ProgressSyncJournal(
            id = 101L,
            itemId = "9999",
            position = 30000L,
            actionType = "SEEK",
            sequenceNumber = 2L,
            vectorClock = "{\"clientA\":2}",
            createdAt = System.currentTimeMillis(),
            isProcessed = false
        )

        coEvery { progressJournalDao.getPendingEvents() } returns listOf(rewindEntry)
        coEvery {
            api.updateProgress(
                token = server.token,
                time = 30000L,
                state = "paused",
                ratingKey = "9999",
                key = "/library/metadata/9999"
            )
        } returns Response.success(Unit)

        // Act
        val result = syncAdapter.processPendingJournal(server, api)

        // Assert
        assertTrue(result.isSuccess)
        assertEquals(1, result.getOrNull())

        coVerify(exactly = 1) {
            api.updateProgress(
                token = server.token,
                time = 30000L,
                state = "paused",
                ratingKey = "9999",
                key = "/library/metadata/9999"
            )
        }
        coVerify(exactly = 1) {
            progressJournalDao.markProcessed(101L, any())
        }
    }

    @Test
    fun `processPendingJournal does not mark entry as processed when Plex response is non-200`() = runBlocking {
        val entry = ProgressSyncJournal(
            id = 102L,
            itemId = "9999",
            position = 45000L,
            actionType = "PAUSE",
            sequenceNumber = 3L,
            vectorClock = "{\"clientA\":3}",
            createdAt = System.currentTimeMillis(),
            isProcessed = false
        )

        coEvery { progressJournalDao.getPendingEvents() } returns listOf(entry)
        coEvery {
            api.updateProgress(any(), any(), any(), any(), any(), any())
        } returns Response.error(500, "Internal Server Error".toResponseBody())

        val result = syncAdapter.processPendingJournal(server, api)

        assertTrue(result.isSuccess)
        assertEquals(0, result.getOrNull())

        // Verify markProcessed was NOT called
        coVerify(exactly = 0) {
            progressJournalDao.markProcessed(102L, any())
        }
    }

    @Test
    fun `processPendingJournal enforces sequential ordered replay per media item`() = runBlocking {
        val entry1 = ProgressSyncJournal(
            id = 1L,
            itemId = "9999",
            position = 10000L,
            actionType = "SEEK",
            sequenceNumber = 1L
        )
        val entry2 = ProgressSyncJournal(
            id = 2L,
            itemId = "9999",
            position = 5000L,
            actionType = "SEEK", // Rewind
            sequenceNumber = 2L
        )

        // Return out of order from query to test sorting
        coEvery { progressJournalDao.getPendingEvents() } returns listOf(entry2, entry1)

        val executionOrder = mutableListOf<Long>()
        coEvery {
            api.updateProgress(
                token = any(),
                time = capture(executionOrder),
                state = any(),
                ratingKey = any(),
                key = any()
            )
        } returns Response.success(Unit)

        val result = syncAdapter.processPendingJournal(server, api)
        assertTrue(result.isSuccess)
        assertEquals(2, result.getOrNull())

        // First was 10000L (seq 1), then 5000L (seq 2)
        assertEquals(listOf(10000L, 5000L), executionOrder)
        coVerify(exactly = 1) { progressJournalDao.markProcessed(1L, any()) }
        coVerify(exactly = 1) { progressJournalDao.markProcessed(2L, any()) }
    }
}
