package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.PlexServerDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.PlexServer
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class MediaRepositoryTest {

    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private val metadataDao = mockk<MetadataDao>(relaxed = true)
    private val extendedMetadataRepository = mockk<ExtendedMetadataRepository>(relaxed = true)
    private val plexServerDao = mockk<PlexServerDao>(relaxed = true)

    private lateinit var repository: MediaRepository

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
        repository = MediaRepository(
            mediaItemDao = mediaItemDao,
            metadataDao = metadataDao,
            extendedMetadataRepository = extendedMetadataRepository,
            plexServerDao = plexServerDao
        )
    }

    @Test
    fun `getMediaItemById normalizes relative Plex thumbnail path`() = runBlocking {
        val item = MediaItem(
            itemId = 10L,
            libraryId = 1L,
            filePath = "plex://machine-abc-123/99",
            fileName = "Plex Video",
            fileExtension = "",
            fileSize = 0L,
            fileHash = "99",
            mediaType = "MOVIE",
            hasThumbnail = true,
            thumbnailPath = "/library/metadata/99/thumb/555"
        )
        coEvery { mediaItemDao.getMediaItemById(10L) } returns item
        coEvery { plexServerDao.getServerByMachineId("machine-abc-123") } returns server

        val result = repository.getMediaItemById(10L)
        assertNotNull(result)
        val expected = "${server.url}/library/metadata/99/thumb/555?X-Plex-Token=test-token-xyz"
        assertEquals(expected, result?.thumbnailPath)
        assertTrue(result?.hasThumbnail == true)
    }

    @Test
    fun `getMediaItemById leaves local non-plex item unmodified`() = runBlocking {
        val item = MediaItem(
            itemId = 20L,
            libraryId = 1L,
            filePath = "/storage/emulated/0/Movies/sample.mp4",
            fileName = "sample.mp4",
            fileExtension = "mp4",
            fileSize = 1000L,
            fileHash = "hash",
            mediaType = "MOVIE",
            hasThumbnail = true,
            thumbnailPath = "/thumbnails/sample.jpg"
        )
        coEvery { mediaItemDao.getMediaItemById(20L) } returns item

        val result = repository.getMediaItemById(20L)
        assertNotNull(result)
        assertEquals("/thumbnails/sample.jpg", result?.thumbnailPath)
    }
}
