package com.universalmedialibrary.data.repository

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.services.metadata.BookMetadata
import com.universalmedialibrary.services.metadata.BookMetadataResult
import com.universalmedialibrary.services.metadata.UnifiedMetadataFacade
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test
import java.util.concurrent.atomic.AtomicInteger

@OptIn(ExperimentalCoroutinesApi::class)
class MetadataFetchRepositoryConcurrencyTest {

    @MockK(relaxed = true)
    lateinit var unifiedMetadataFacade: UnifiedMetadataFacade

    @MockK(relaxed = true)
    lateinit var mediaItemDao: MediaItemDao

    @MockK(relaxed = true)
    lateinit var metadataDao: MetadataDao

    @MockK(relaxed = true)
    lateinit var metadataStagingRepository: MetadataStagingRepository

    private val testDispatcher = StandardTestDispatcher()
    private lateinit var repository: MetadataFetchRepository

    @Before
    fun setUp() {
        MockKAnnotations.init(this)
        Dispatchers.setMain(testDispatcher)

        repository = MetadataFetchRepository(
            unifiedMetadataFacade,
            mediaItemDao,
            metadataDao,
            metadataStagingRepository
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `fetchMetadataForLibrary fetches items concurrently and reports progress`() = runTest {
        val libraryId = 1L
        val items = (1..10).map { id ->
            MediaItem(
                itemId = id.toLong(),
                libraryId = libraryId,
                filePath = "/path/book_$id.epub",
                fileName = "book_$id.epub",
                fileExtension = "epub",
                fileSize = 1000L,
                mediaType = "BOOK",
                hasMetadata = false
            )
        }

        coEvery { mediaItemDao.getMediaItemsByLibrary(libraryId) } returns flowOf(items)
        items.forEach { item ->
            coEvery { mediaItemDao.getMediaItemById(item.itemId) } returns item
        }

        coEvery { unifiedMetadataFacade.searchBookMetadata(any(), any(), any()) } answers {
            BookMetadataResult(
                metadata = BookMetadata(
                    title = "Fetched Title",
                    source = "Test"
                ),
                sources = listOf("Test")
            )
        }

        val progressCount = AtomicInteger(0)
        val result = repository.fetchMetadataForLibrary(libraryId) { completed, total ->
            progressCount.incrementAndGet()
            assertThat(total).isEqualTo(10)
        }

        assertThat(result.totalItems).isEqualTo(10)
        assertThat(result.successCount).isEqualTo(10)
        assertThat(result.failureCount).isEqualTo(0)
        assertThat(result.results.size).isEqualTo(10)
        assertThat(progressCount.get()).isEqualTo(10)
    }

    @Test
    fun `fetchMetadataForLibrary handles mixed success and errors safely`() = runTest {
        val libraryId = 2L
        val items = (1..6).map { id ->
            MediaItem(
                itemId = id.toLong(),
                libraryId = libraryId,
                filePath = "/path/book_$id.epub",
                fileName = "book_$id.epub",
                fileExtension = "epub",
                fileSize = 1000L,
                mediaType = "BOOK",
                hasMetadata = false
            )
        }

        coEvery { mediaItemDao.getMediaItemsByLibrary(libraryId) } returns flowOf(items)
        items.forEach { item ->
            coEvery { mediaItemDao.getMediaItemById(item.itemId) } returns item
            if (item.itemId % 2L == 0L) {
                coEvery { unifiedMetadataFacade.searchBookMetadata(title = "book_${item.itemId}", query = any(), isbn = any(), author = any()) } throws RuntimeException("Network error")
            } else {
                coEvery { unifiedMetadataFacade.searchBookMetadata(title = "book_${item.itemId}", query = any(), isbn = any(), author = any()) } returns BookMetadataResult(
                    metadata = BookMetadata(title = "Title ${item.itemId}", source = "Test"),
                    sources = listOf("Test")
                )
            }
        }

        val result = repository.fetchMetadataForLibrary(libraryId)

        assertThat(result.totalItems).isEqualTo(6)
        assertThat(result.successCount).isEqualTo(3)
        assertThat(result.failureCount).isEqualTo(3)
    }
}
