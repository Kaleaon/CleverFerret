package com.universalmedialibrary.ui.detail

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.CollectionRepository
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.FileSafetyGuardrail
import com.universalmedialibrary.services.ai.AIMetadataService
import com.universalmedialibrary.services.thumbnails.ThumbnailService
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.verify
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
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
class MediaItemDetailViewModelSafetyTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @MockK(relaxed = true)
    lateinit var mediaItemDao: MediaItemDao

    @MockK(relaxed = true)
    lateinit var metadataDao: MetadataDao

    @MockK(relaxed = true)
    lateinit var readingProgressDao: ReadingProgressDao

    @MockK(relaxed = true)
    lateinit var metadataFetchRepository: MetadataFetchRepository

    @MockK(relaxed = true)
    lateinit var collectionRepository: CollectionRepository

    @MockK(relaxed = true)
    lateinit var tagRepository: TagRepository

    @MockK(relaxed = true)
    lateinit var aiMetadataService: AIMetadataService

    @MockK(relaxed = true)
    lateinit var thumbnailService: ThumbnailService

    @MockK(relaxed = true)
    lateinit var fileSafetyGuardrail: FileSafetyGuardrail

    private val testDispatcher = StandardTestDispatcher()
    private lateinit var viewModel: MediaItemDetailViewModel

    private lateinit var cacheDir: File
    private lateinit var mediaDir: File

    @Before
    fun setUp() {
        MockKAnnotations.init(this)
        Dispatchers.setMain(testDispatcher)

        cacheDir = tempFolder.newFolder("cache")
        mediaDir = tempFolder.newFolder("user_media")

        coEvery { readingProgressDao.getProgress(any()) } returns flowOf(null)
        coEvery { tagRepository.getTagsForItem(any()) } returns flowOf(emptyList())

        viewModel = MediaItemDetailViewModel(
            mediaItemDao,
            metadataDao,
            readingProgressDao,
            metadataFetchRepository,
            collectionRepository,
            tagRepository,
            aiMetadataService,
            thumbnailService,
            fileSafetyGuardrail
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `regenerateThumbnail delegates stale cover cleanup to fileSafetyGuardrail`() = runTest {
        val staleCover = File(cacheDir, "old_cover.jpg")
        staleCover.createNewFile()

        val mediaItem = MediaItem(
            itemId = 200L,
            libraryId = 1L,
            filePath = "/path/book.pdf",
            fileName = "book.pdf",
            fileExtension = "pdf",
            fileSize = 1000L,
            mediaType = "BOOK",
            thumbnailPath = staleCover.absolutePath
        )

        coEvery { mediaItemDao.getMediaItemById(200L) } returns mediaItem
        coEvery { thumbnailService.generatePlaceholder(any()) } returns File("/cache/new_cover.jpg")

        viewModel.loadMediaItem(200L)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.regenerateThumbnail()
        testDispatcher.scheduler.advanceUntilIdle()

        verify { fileSafetyGuardrail.safeDeleteCacheFile(staleCover.absolutePath) }
    }

    @Test
    fun `regenerateThumbnail does not delete non-cache media file outside cache boundaries`() = runTest {
        val userCoverFile = File(mediaDir, "important_cover.png")
        userCoverFile.createNewFile()

        val mediaItem = MediaItem(
            itemId = 201L,
            libraryId = 1L,
            filePath = "/path/music.flac",
            fileName = "music.flac",
            fileExtension = "flac",
            fileSize = 1000L,
            mediaType = "AUDIO",
            thumbnailPath = userCoverFile.absolutePath
        )

        coEvery { mediaItemDao.getMediaItemById(201L) } returns mediaItem
        coEvery { thumbnailService.generatePlaceholder(any()) } returns File("/cache/generated_cover.jpg")
        every { fileSafetyGuardrail.safeDeleteCacheFile(userCoverFile.absolutePath) } returns false

        viewModel.loadMediaItem(201L)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.regenerateThumbnail()
        testDispatcher.scheduler.advanceUntilIdle()

        verify { fileSafetyGuardrail.safeDeleteCacheFile(userCoverFile.absolutePath) }
        assertThat(userCoverFile.exists()).isTrue()
    }
}
