package com.universalmedialibrary.ui.library

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.data.repository.MetadataFetchResult
import com.universalmedialibrary.services.CalibreExportService
import com.universalmedialibrary.services.FileSafetyGuardrail
import com.universalmedialibrary.services.thumbnails.ThumbnailService
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.verify
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

@OptIn(ExperimentalCoroutinesApi::class)
class LibraryManagementViewModelSafetyTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @MockK(relaxed = true)
    lateinit var context: Context

    @MockK(relaxed = true)
    lateinit var libraryRepository: LibraryRepository

    @MockK(relaxed = true)
    lateinit var calibreExportService: CalibreExportService

    @MockK(relaxed = true)
    lateinit var mediaItemDao: MediaItemDao

    @MockK(relaxed = true)
    lateinit var metadataDao: MetadataDao

    @MockK(relaxed = true)
    lateinit var metadataFetchRepository: MetadataFetchRepository

    @MockK(relaxed = true)
    lateinit var thumbnailService: ThumbnailService

    @MockK(relaxed = true)
    lateinit var fileSafetyGuardrail: FileSafetyGuardrail

    private val testDispatcher = StandardTestDispatcher()
    private lateinit var viewModel: LibraryManagementViewModel

    private lateinit var cacheDir: File
    private lateinit var mediaDir: File

    @Before
    fun setUp() {
        MockKAnnotations.init(this)
        Dispatchers.setMain(testDispatcher)

        cacheDir = tempFolder.newFolder("cache")
        mediaDir = tempFolder.newFolder("user_media")

        viewModel = LibraryManagementViewModel(
            context,
            libraryRepository,
            calibreExportService,
            mediaItemDao,
            metadataDao,
            metadataFetchRepository,
            thumbnailService,
            fileSafetyGuardrail
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `regenerateAllThumbnails calls fileSafetyGuardrail safeDeleteCacheFile on old path`() = runTest {
        val staleCacheFile = File(cacheDir, "old_thumb.jpg")
        staleCacheFile.createNewFile()

        val mediaItem = MediaItem(
            itemId = 100L,
            libraryId = 1L,
            filePath = "/path/to/item.epub",
            fileName = "item.epub",
            fileExtension = "epub",
            fileSize = 1000L,
            mediaType = "BOOK",
            thumbnailPath = staleCacheFile.absolutePath
        )

        coEvery { mediaItemDao.getAllMediaItems() } returns listOf(mediaItem)
        coEvery { thumbnailService.generatePlaceholder(any()) } returns File("/cache/new_thumb.jpg")
        coEvery { thumbnailService.extractCoverFromEpub(any()) } returns File("/cache/new_thumb.jpg")

        viewModel.regenerateAllThumbnails()
        testDispatcher.scheduler.advanceUntilIdle()

        verify { fileSafetyGuardrail.safeDeleteCacheFile(staleCacheFile.absolutePath) }
    }

    @Test
    fun `regenerateAllThumbnails preserves non-cache media files outside cache directory`() = runTest {
        val userMediaFile = File(mediaDir, "user_photo.jpg")
        userMediaFile.createNewFile()

        val mediaItem = MediaItem(
            itemId = 101L,
            libraryId = 1L,
            filePath = "/path/to/photo.jpg",
            fileName = "photo.jpg",
            fileExtension = "jpg",
            fileSize = 1000L,
            mediaType = "IMAGE",
            thumbnailPath = userMediaFile.absolutePath
        )

        coEvery { mediaItemDao.getAllMediaItems() } returns listOf(mediaItem)
        coEvery { thumbnailService.generatePlaceholder(any()) } returns File("/cache/new_thumb.jpg")
        every { fileSafetyGuardrail.safeDeleteCacheFile(userMediaFile.absolutePath) } returns false

        viewModel.regenerateAllThumbnails()
        testDispatcher.scheduler.advanceUntilIdle()

        verify { fileSafetyGuardrail.safeDeleteCacheFile(userMediaFile.absolutePath) }
        assertThat(userMediaFile.exists()).isTrue()
    }

    @Test
    fun `bulkFetchMetadata processes items concurrently and updates task state`() = runTest {
        val mediaItem1 = MediaItem(
            itemId = 1L,
            libraryId = 1L,
            filePath = "/book1.epub",
            fileName = "book1.epub",
            fileExtension = "epub",
            fileSize = 100L,
            mediaType = "BOOK"
        )
        val mediaItem2 = MediaItem(
            itemId = 2L,
            libraryId = 1L,
            filePath = "/book2.epub",
            fileName = "book2.epub",
            fileExtension = "epub",
            fileSize = 100L,
            mediaType = "BOOK"
        )

        coEvery { mediaItemDao.getAllMediaItems() } returns listOf(mediaItem1, mediaItem2)
        coEvery { metadataFetchRepository.fetchMetadataForItem(any()) } returns MetadataFetchResult.Success(
            sources = listOf("Google Books"),
            metadata = com.universalmedialibrary.data.local.entity.MetadataCommon(itemId = 1L, title = "Test")
        )

        viewModel.bulkFetchMetadata()
        testDispatcher.scheduler.advanceUntilIdle()

        val taskState = viewModel.bulkMetadataTask.value
        assertThat(taskState?.status).isEqualTo(LibraryBackgroundTaskStatus.SUCCESS)
        assertThat(taskState?.message).contains("Updated metadata for 2 items")
    }

    @Test
    fun `bulkFetchMetadata handles failures and updates task state to failed`() = runTest {
        val mediaItem1 = MediaItem(
            itemId = 1L,
            libraryId = 1L,
            filePath = "/book1.epub",
            fileName = "book1.epub",
            fileExtension = "epub",
            fileSize = 100L,
            mediaType = "BOOK"
        )

        coEvery { mediaItemDao.getAllMediaItems() } returns listOf(mediaItem1)
        coEvery { metadataFetchRepository.fetchMetadataForItem(1L) } returns MetadataFetchResult.Error("API Limit")

        viewModel.bulkFetchMetadata()
        testDispatcher.scheduler.advanceUntilIdle()

        val taskState = viewModel.bulkMetadataTask.value
        assertThat(taskState?.status).isEqualTo(LibraryBackgroundTaskStatus.FAILED)
        assertThat(taskState?.message).contains("Completed with 1 failures")
    }
}
