package com.universalmedialibrary.services.integration

import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.ProgressSyncJournalDao
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.data.local.entity.ProgressSyncJournal
import com.universalmedialibrary.services.integration.emby.EmbyApi
import com.universalmedialibrary.services.integration.emby.EmbyIntegrationService
import com.universalmedialibrary.services.integration.emby.EmbySyncAdapter
import com.universalmedialibrary.services.integration.jellyfin.JellyfinApi
import com.universalmedialibrary.services.integration.jellyfin.JellyfinIntegrationService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinSyncAdapter
import io.mockk.*
import kotlinx.coroutines.runBlocking
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import retrofit2.Response

class JellyfinAndEmbySyncAdapterTest {

    private val database = mockk<AppDatabase>(relaxed = true)
    private val progressJournalDao = mockk<ProgressSyncJournalDao>(relaxed = true)

    private val jellyfinIntegration = mockk<JellyfinIntegrationService>(relaxed = true)
    private val jellyfinApi = mockk<JellyfinApi>(relaxed = true)

    private val embyIntegration = mockk<EmbyIntegrationService>(relaxed = true)
    private val embyApi = mockk<EmbyApi>(relaxed = true)

    private lateinit var jellyfinAdapter: JellyfinSyncAdapter
    private lateinit var embyAdapter: EmbySyncAdapter

    private val jellyfinServer = JellyfinServer(
        id = 1L,
        name = "HomeJellyfin",
        host = "jellyfin.local",
        port = 8096,
        apiKey = "jf-token-123"
    )

    private val embyServer = EmbyServer(
        id = 2L,
        name = "HomeEmby",
        host = "emby.local",
        port = 8096,
        apiKey = "emby-token-456"
    )

    @Before
    fun setUp() {
        every { database.progressSyncJournalDao() } returns progressJournalDao
        coEvery { jellyfinIntegration.createApi(any()) } returns jellyfinApi
        coEvery { embyIntegration.createApi(any()) } returns embyApi

        jellyfinAdapter = JellyfinSyncAdapter(
            database = database,
            jellyfinIntegration = jellyfinIntegration,
            progressSyncJournalDao = progressJournalDao
        )

        embyAdapter = EmbySyncAdapter(
            database = database,
            embyIntegration = embyIntegration,
            progressSyncJournalDao = progressJournalDao
        )
    }

    @Test
    fun `JellyfinSyncAdapter reports progress to Sessions Playing Progress endpoint`() = runBlocking {
        coEvery {
            jellyfinApi.reportPlaybackProgress(
                token = "jf-token-123",
                itemId = "jf-item-42",
                positionTicks = 50000000L,
                isPaused = true
            )
        } returns Response.success(Unit)

        val result = jellyfinAdapter.reportPlaybackProgress(
            server = jellyfinServer,
            itemId = "jf-item-42",
            positionTicks = 50000000L,
            isPaused = true
        )

        assertTrue(result.isSuccess)
        coVerify(exactly = 1) {
            jellyfinApi.reportPlaybackProgress(
                token = "jf-token-123",
                itemId = "jf-item-42",
                positionTicks = 50000000L,
                isPaused = true
            )
        }
    }

    @Test
    fun `JellyfinSyncAdapter reports stopped to Sessions Playing Stopped endpoint`() = runBlocking {
        coEvery {
            jellyfinApi.reportPlaybackStopped(
                token = "jf-token-123",
                itemId = "jf-item-42",
                positionTicks = 60000000L
            )
        } returns Response.success(Unit)

        val result = jellyfinAdapter.reportPlaybackStopped(
            server = jellyfinServer,
            itemId = "jf-item-42",
            positionTicks = 60000000L
        )

        assertTrue(result.isSuccess)
        coVerify(exactly = 1) {
            jellyfinApi.reportPlaybackStopped(
                token = "jf-token-123",
                itemId = "jf-item-42",
                positionTicks = 60000000L
            )
        }
    }

    @Test
    fun `JellyfinSyncAdapter consumes pending progress journal sequentially and marks processed upon HTTP 200`() = runBlocking {
        val entry1 = ProgressSyncJournal(
            id = 10L,
            itemId = "item-1",
            position = 1000L,
            actionType = "SEEK",
            sequenceNumber = 1L
        )
        val entry2 = ProgressSyncJournal(
            id = 11L,
            itemId = "item-1",
            position = 2000L,
            actionType = "STOP",
            sequenceNumber = 2L
        )

        coEvery { progressJournalDao.getPendingEvents() } returns listOf(entry2, entry1) // out of order
        coEvery { jellyfinApi.reportPlaybackProgress(any(), any(), any(), any()) } returns Response.success(Unit)
        coEvery { jellyfinApi.reportPlaybackStopped(any(), any(), any()) } returns Response.success(Unit)

        val result = jellyfinAdapter.processPendingJournal(jellyfinServer)

        assertTrue(result.isSuccess)
        assertEquals(2, result.getOrNull())

        coVerify(exactly = 1) { progressJournalDao.markProcessed(10L, any()) }
        coVerify(exactly = 1) { progressJournalDao.markProcessed(11L, any()) }
    }

    @Test
    fun `EmbySyncAdapter reports progress and stopped to REST endpoints`() = runBlocking {
        coEvery {
            embyApi.reportPlaybackProgress(
                token = "emby-token-456",
                itemId = "emby-item-7",
                positionTicks = 120000000L,
                isPaused = false
            )
        } returns Response.success(Unit)

        coEvery {
            embyApi.reportPlaybackStopped(
                token = "emby-token-456",
                itemId = "emby-item-7",
                positionTicks = 150000000L
            )
        } returns Response.success(Unit)

        val progressRes = embyAdapter.reportPlaybackProgress(
            server = embyServer,
            itemId = "emby-item-7",
            positionTicks = 120000000L,
            isPaused = false
        )
        val stopRes = embyAdapter.reportPlaybackStopped(
            server = embyServer,
            itemId = "emby-item-7",
            positionTicks = 150000000L
        )

        assertTrue(progressRes.isSuccess)
        assertTrue(stopRes.isSuccess)
    }
}
