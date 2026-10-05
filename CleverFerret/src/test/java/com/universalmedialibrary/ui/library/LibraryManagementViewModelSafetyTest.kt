package com.universalmedialibrary.ui.library

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItemEntity
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.services.CalibreExportService
import com.universalmedialibrary.services.FileSafetyGuardrail
import com.universalmedialibrary.services.thumbnails.ThumbnailService
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.slot
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

        val mediaItem = MediaItemEntity(
            id = 100L,
            libraryId = 1L,
            title = "Test Item",
            filePath = "/path/to/item.epub",
            mediaType = "BOOK",
            coverPath = staleCacheFile.absolutePath
        )

        coEvery { mediaItemDao.getItemsForLibrary(1L) } returns listOf(mediaItem)
        coEvery { thumbnailService.generateThumbnail(any(), any()) } returns Result.success("/cache/new_thumb.jpg")

        viewModel.regenerateAllThumbnails(1L)
        testDispatcher.scheduler.advanceUntilIdle()

        verify { fileSafetyGuardrail.safeDeleteCacheFile(staleCacheFile.absolutePath) }
    }

    @Test
    fun `regenerateAllThumbnails preserves non-cache media files outside cache directory`() = runTest {
        val userMediaFile = File(mediaDir, "user_photo.jpg")
        userMediaFile.createNewFile()

        val mediaItem = MediaItemEntity(
            id = 101L,
            libraryId = 1L,
            title = "Photo Item",
            filePath = "/path/to/photo.jpg",
            mediaType = "IMAGE",
            coverPath = userMediaFile.absolutePath
        )

        coEvery { mediaItemDao.getItemsForLibrary(1L) } returns listOf(mediaItem)
        coEvery { thumbnailService.generateThumbnail(any(), any()) } returns Result.success("/cache/new_thumb.jpg")
        every { fileSafetyGuardrail.safeDeleteCacheFile(userMediaFile.absolutePath) } returns false

        viewModel.regenerateAllThumbnails(1L)
        testDispatcher.scheduler.advanceUntilIdle()

        verify { fileSafetyGuardrail.safeDeleteCacheFile(userMediaFile.absolutePath) }
        assertThat(userMediaFile.exists()).isTrue()
    }
}
