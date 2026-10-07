package com.universalmedialibrary.services.organization

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import io.mockk.mockk
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class SeriesManagementServiceTest {

    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private val metadataDao = mockk<MetadataDao>(relaxed = true)

    private lateinit var service: SeriesManagementService

    @Before
    fun setUp() {
        service = SeriesManagementService(mediaItemDao, metadataDao)
    }

    @Test
    fun `autoDetectSeries extracts series prefix and calculates confidence`() = runTest {
        val book1 = createMediaItem(1L, "Harry Potter and the Sorcerer's Stone")
        val book2 = createMediaItem(2L, "Harry Potter and the Chamber of Secrets")
        val book3 = createMediaItem(3L, "Harry Potter and the Prisoner of Azkaban")

        val suggestions = service.autoDetectSeries(listOf(book1, book2, book3))

        assertEquals(1, suggestions.size)
        val suggestion = suggestions[0]
        assertEquals("Harry Potter", suggestion.seriesName)
        assertEquals(3, suggestion.books.size)
        assertTrue(suggestion.confidence > 0f)
    }

    @Test
    fun `autoDetectSeries detects volume prefixes`() = runTest {
        val book1 = createMediaItem(1L, "Berserk Volume 1")
        val book2 = createMediaItem(2L, "Berserk Volume 2")

        val suggestions = service.autoDetectSeries(listOf(book1, book2))

        assertEquals(1, suggestions.size)
        assertEquals("Berserk", suggestions[0].seriesName)
    }

    private fun createMediaItem(id: Long, titleWithExt: String): MediaItem {
        val fileName = if (titleWithExt.contains('.')) titleWithExt else "$titleWithExt.epub"
        return MediaItem(
            itemId = id,
            libraryId = 1L,
            filePath = "/library/$fileName",
            fileName = fileName,
            fileExtension = "epub",
            fileSize = 1000000L,
            mediaType = "BOOK"
        )
    }
}
