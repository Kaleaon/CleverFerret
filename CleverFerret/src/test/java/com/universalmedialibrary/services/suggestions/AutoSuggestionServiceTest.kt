package com.universalmedialibrary.services.suggestions

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.SmartCollectionDao
import com.universalmedialibrary.data.local.dao.TagHierarchyDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.collections.SmartCollectionEngine
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class AutoSuggestionServiceTest {

    private val smartCollectionEngine = mockk<SmartCollectionEngine>(relaxed = true)
    private val tagRepository = mockk<TagRepository>(relaxed = true)
    private val tagHierarchyDao = mockk<TagHierarchyDao>(relaxed = true)
    private val smartCollectionDao = mockk<SmartCollectionDao>(relaxed = true)
    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private val metadataDao = mockk<MetadataDao>(relaxed = true)

    private lateinit var service: AutoSuggestionService

    @Before
    fun setUp() {
        service = AutoSuggestionService(
            smartCollectionEngine,
            tagRepository,
            tagHierarchyDao,
            smartCollectionDao,
            mediaItemDao,
            metadataDao
        )
    }

    @Test
    fun `suggestBookSeries groups books correctly by series patterns`() = runTest {
        val book1 = createMediaItem(1L, "Harry Potter - Book 1.epub")
        val book2 = createMediaItem(2L, "Harry Potter - Book 2.epub")
        val book3 = createMediaItem(3L, "Wheel of Time - Vol 1.epub")
        val book4 = createMediaItem(4L, "Wheel of Time - Vol 2.epub")

        coEvery { smartCollectionDao.detectPotentialSeriesBooks() } returns listOf(book1, book2, book3, book4)

        val suggestions = service.suggestBookSeries()

        assertEquals(2, suggestions.size)
        val hpSuggestion = suggestions.find { it.seriesName == "Harry Potter" }
        val wotSuggestion = suggestions.find { it.seriesName == "Wheel of Time" }

        assertTrue(hpSuggestion != null)
        assertEquals("Book N", hpSuggestion?.detectedPattern)
        assertEquals(listOf(1L, 2L), hpSuggestion?.books)

        assertTrue(wotSuggestion != null)
        assertEquals("Volume N", wotSuggestion?.detectedPattern)
        assertEquals(listOf(3L, 4L), wotSuggestion?.books)
    }

    @Test
    fun `suggestBookSeries detects hash and part patterns`() = runTest {
        val book1 = createMediaItem(1L, "Dune - #1.epub")
        val book2 = createMediaItem(2L, "Dune - #2.epub")
        val book3 = createMediaItem(3L, "Foundation - Part 1.epub")
        val book4 = createMediaItem(4L, "Foundation - Part 2.epub")

        coEvery { smartCollectionDao.detectPotentialSeriesBooks() } returns listOf(book1, book2, book3, book4)

        val suggestions = service.suggestBookSeries()

        val duneSuggestion = suggestions.find { it.seriesName == "Dune" }
        assertEquals("#N", duneSuggestion?.detectedPattern)

        val foundationSuggestion = suggestions.find { it.seriesName == "Foundation" }
        assertEquals("Part N", foundationSuggestion?.detectedPattern)
    }

    private fun createMediaItem(id: Long, fileName: String): MediaItem {
        return MediaItem(
            itemId = id,
            libraryId = 1L,
            filePath = "/library/$fileName",
            fileName = fileName,
            fileExtension = fileName.substringAfterLast('.'),
            fileSize = 1000000L,
            mediaType = "BOOK"
        )
    }
}
