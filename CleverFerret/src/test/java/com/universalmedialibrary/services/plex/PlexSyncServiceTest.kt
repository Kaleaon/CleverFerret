package com.universalmedialibrary.services.plex

import android.content.Context
import androidx.room.withTransaction
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.PlexMediaItemDao
import com.universalmedialibrary.data.local.dao.PlexServerDao
import com.universalmedialibrary.data.local.dao.PlexSyncDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.services.cache.MediaDownloadScheduler
import com.universalmedialibrary.services.ingestion.IngestionPipeline
import io.mockk.Runs
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.just
import io.mockk.mockk
import io.mockk.mockkStatic
import io.mockk.slot
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class PlexSyncServiceTest {

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

    private lateinit var syncService: PlexSyncService

    private val server = PlexServer(
        serverId = 1L,
        name = "HomePlex",
        host = "plex.local",
        port = 32400,
        token = "test-token-xyz",
        machineIdentifier = "machine-abc-123"
    )

    @Before
    fun setUp() {
        mockkStatic("androidx.room.RoomDatabaseKt")
        val transactionLambda = slot<suspend () -> Any?>()
        coEvery { database.withTransaction(capture(transactionLambda)) } coAnswers {
            transactionLambda.captured.invoke()
        }

        syncService = PlexSyncService(
            context = context,
            database = database,
            plexServerDao = plexServerDao,
            plexMediaItemDao = plexMediaItemDao,
            plexSyncDao = plexSyncDao,
            mediaItemDao = mediaItemDao,
            libraryDao = libraryDao,
            authService = authService,
            ingestionPipeline = ingestionPipeline,
            downloadScheduler = downloadScheduler
        )
    }

    @Test
    fun `buildAuthenticatedThumbnailUrl builds correct absolute URL`() {
        val thumb = "/library/metadata/42/thumb/12345"
        val result = syncService.buildAuthenticatedThumbnailUrl(server, thumb)
        val expected = "${server.url}/library/metadata/42/thumb/12345?X-Plex-Token=test-token-xyz"
        assertEquals(expected, result)
    }

    @Test
    fun `normalizeExistingPlexThumbnails heals relative thumbnails in database`() = runBlocking {
        val relativeItem = MediaItem(
            itemId = 101L,
            libraryId = 1L,
            filePath = "plex://machine-abc-123/42",
            fileName = "Sample Movie",
            fileExtension = "",
            fileSize = 0L,
            fileHash = "42",
            mediaType = "MOVIE",
            hasThumbnail = true,
            thumbnailPath = "/library/metadata/42/thumb/12345"
        )
        val alreadyNormalizedItem = MediaItem(
            itemId = 102L,
            libraryId = 1L,
            filePath = "plex://machine-abc-123/43",
            fileName = "Sample Show",
            fileExtension = "",
            fileSize = 0L,
            fileHash = "43",
            mediaType = "TV_SHOW",
            hasThumbnail = true,
            thumbnailPath = "${server.url}/library/metadata/43/thumb/99999?X-Plex-Token=test-token-xyz"
        )

        coEvery { mediaItemDao.getPlexMediaItemsByServer("machine-abc-123") } returns listOf(
            relativeItem,
            alreadyNormalizedItem
        )
        coEvery { mediaItemDao.updateThumbnail(any(), any(), any()) } just Runs

        syncService.normalizeExistingPlexThumbnails(server)

        val expectedUrl = "${server.url}/library/metadata/42/thumb/12345?X-Plex-Token=test-token-xyz"
        coVerify(exactly = 1) {
            mediaItemDao.updateThumbnail(101L, expectedUrl, true)
        }
        coVerify(exactly = 0) {
            mediaItemDao.updateThumbnail(102L, any(), any())
        }
    }
}
