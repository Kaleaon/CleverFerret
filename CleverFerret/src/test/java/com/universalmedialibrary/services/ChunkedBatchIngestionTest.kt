package com.universalmedialibrary.services

import androidx.room.RoomDatabase
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.AmbientSoundDao
import com.universalmedialibrary.data.local.dao.AudioPackDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDatabase
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioEpisode
import com.universalmedialibrary.services.ambient.AudioPackImporter
import com.universalmedialibrary.services.oldtimeradio.OldTimeRadioImportService
import com.universalmedialibrary.services.media.free.InternetArchiveMediaClient
import com.universalmedialibrary.services.media.free.MediaItemResult
import com.universalmedialibrary.services.media.free.MediaDownloadOption
import io.mockk.*
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Test
import java.io.File

class ChunkedBatchIngestionTest {

    private lateinit var appDatabase: AppDatabase
    private lateinit var mediaItemDao: MediaItemDao
    private lateinit var metadataDao: MetadataDao
    private lateinit var calibreReader: CalibreDatabaseReader
    private lateinit var calibreImportService: CalibreImportService

    private lateinit var otrDatabase: OldTimeRadioDatabase
    private lateinit var oldTimeRadioDao: OldTimeRadioDao
    private lateinit var iaClient: InternetArchiveMediaClient
    private lateinit var otrImportService: OldTimeRadioImportService

    @Before
    fun setUp() {
        appDatabase = mockk(relaxed = true)
        mediaItemDao = mockk(relaxed = true)
        metadataDao = mockk(relaxed = true)
        calibreReader = mockk(relaxed = true)

        // Mock withTransaction behavior for AppDatabase
        coEvery { appDatabase.withTransaction(captureLambda<suspend () -> Any>()) } answers {
            runBlocking { lambda<suspend () -> Any>().invoke() }
        }

        calibreImportService = CalibreImportService(
            database = appDatabase,
            mediaItemDao = mediaItemDao,
            metadataDao = metadataDao,
            calibreReader = calibreReader
        )

        otrDatabase = mockk(relaxed = true)
        oldTimeRadioDao = mockk(relaxed = true)
        iaClient = mockk(relaxed = true)

        coEvery { otrDatabase.withTransaction(captureLambda<suspend () -> Any>()) } answers {
            runBlocking { lambda<suspend () -> Any>().invoke() }
        }

        otrImportService = OldTimeRadioImportService(
            radioDatabase = otrDatabase,
            oldTimeRadioDao = oldTimeRadioDao,
            internetArchiveMediaClient = iaClient
        )
    }

    @Test
    fun `CalibreImportService processes items in chunks with pre-fetched bulk lookups`() = runBlocking {
        // Arrange
        val tempFile1 = File.createTempFile("book1", ".epub").apply { deleteOnExit() }
        val tempFile2 = File.createTempFile("book2", ".epub").apply { deleteOnExit() }
        val tempFile3 = File.createTempFile("book3", ".epub").apply { deleteOnExit() }

        val rawBooks = mapOf(
            1L to RawCalibreBook(id = 1, title = "Book 1", path = tempFile1.absolutePath, formats = listOf("EPUB")),
            2L to RawCalibreBook(id = 2, title = "Book 2", path = tempFile2.absolutePath, formats = listOf("EPUB")),
            3L to RawCalibreBook(id = 3, title = "Book 3", path = tempFile3.absolutePath, formats = listOf("EPUB"))
        )

        coEvery { calibreReader.readBooks(any()) } returns rawBooks
        coEvery { mediaItemDao.getExistingFilePaths(any()) } returns emptyList()
        coEvery { mediaItemDao.insertMediaItem(any()) } returns 100L

        val progressUpdates = mutableListOf<Pair<Int, Int>>()

        // Act
        calibreImportService.importCalibreDatabase(
            calibreDbPath = "/tmp/dummy.db",
            libraryRootPath = "/",
            libraryId = 1L,
            chunkSize = 2, // Process in chunks of 2
            onProgress = { imported, total -> progressUpdates.add(imported to total) }
        )

        // Assert
        // With 3 items and chunkSize 2, we expect 2 chunks
        coVerify(exactly = 2) { mediaItemDao.getExistingFilePaths(any()) }
        coVerify(exactly = 3) { mediaItemDao.insertMediaItem(any()) }
        assertThat(progressUpdates).containsExactly(2 to 3, 3 to 3)
    }

    @Test
    fun `OldTimeRadioImportService uses bulk getExistingUris and batch inserts in transaction`() = runBlocking {
        // Arrange
        val mockMediaItems = listOf(
            MediaItemResult(
                id = "item1",
                title = "Gunsmoke",
                type = com.universalmedialibrary.services.media.free.FreeMediaType.NATIONAL_SCREENING_ROOM,
                tags = listOf("Western"),
                downloadOptions = listOf(
                    MediaDownloadOption(url = "http://ia.org/gs1.mp3", format = "mp3", label = "Ep 1")
                )
            ),
            MediaItemResult(
                id = "item2",
                title = "The Shadow",
                type = com.universalmedialibrary.services.media.free.FreeMediaType.NATIONAL_SCREENING_ROOM,
                tags = listOf("Mystery"),
                downloadOptions = listOf(
                    MediaDownloadOption(url = "http://ia.org/sh1.mp3", format = "mp3", label = "Ep 1")
                )
            )
        )

        coEvery { iaClient.fetchMedia(any(), any(), any(), any(), any(), any()) } returns mockMediaItems
        coEvery { oldTimeRadioDao.getExistingUris(any()) } returns emptyList()

        val progressUpdates = mutableListOf<Pair<Int, Int>>()

        // Act
        val result = otrImportService.importFeaturedEpisodes(
            limit = 10,
            chunkSize = 250,
            onProgress = { imported, total -> progressUpdates.add(imported to total) }
        )

        // Assert
        assertThat(result.inserted).isEqualTo(2)
        coVerify(exactly = 1) { oldTimeRadioDao.getExistingUris(listOf("http://ia.org/gs1.mp3", "http://ia.org/sh1.mp3")) }
        coVerify(exactly = 1) { oldTimeRadioDao.insertEpisodes(any()) }
        // Verify individual getEpisodeByUri was NOT called inside a loop
        coVerify(exactly = 0) { oldTimeRadioDao.getEpisodeByUri(any()) }
    }
}
