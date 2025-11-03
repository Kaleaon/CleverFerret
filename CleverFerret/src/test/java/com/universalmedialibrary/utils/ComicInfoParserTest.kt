package com.universalmedialibrary.utils

import org.junit.Assert.*
import org.junit.Test

/**
 * Unit tests for ComicInfo data class
 * Note: XML parsing tests require Android framework (Xml.newPullParser)
 * and should be run as instrumentation tests or with Robolectric
 */
class ComicInfoParserTest {

    @Test
    fun testComicInfoDataClass() {
        // Test that the data class works correctly
        val comicInfo = ComicInfo(
            title = "Test Title",
            series = "Test Series",
            number = "1",
            writer = "Test Writer",
            publisher = "Test Publisher",
            pageCount = 24
        )

        assertEquals("Test Title", comicInfo.title)
        assertEquals("Test Series", comicInfo.series)
        assertEquals("1", comicInfo.number)
        assertEquals("Test Writer", comicInfo.writer)
        assertEquals("Test Publisher", comicInfo.publisher)
        assertEquals(24, comicInfo.pageCount)
    }

    @Test
    fun testComicInfoWithNullValues() {
        val comicInfo = ComicInfo(
            title = "Only Title"
        )

        assertEquals("Only Title", comicInfo.title)
        assertNull(comicInfo.series)
        assertNull(comicInfo.writer)
        assertNull(comicInfo.publisher)
        assertNull(comicInfo.pageCount)
    }

    @Test
    fun testComicInfoWithAllFields() {
        val comicInfo = ComicInfo(
            title = "Test Comic",
            series = "Test Series",
            number = "1",
            summary = "Test summary",
            writer = "Writer Name",
            penciller = "Penciller Name",
            inker = "Inker Name",
            colorist = "Colorist Name",
            letterer = "Letterer Name",
            coverArtist = "Cover Artist Name",
            editor = "Editor Name",
            publisher = "Publisher Name",
            genre = "Action",
            pageCount = 32,
            languageISO = "en",
            format = "Comic",
            ageRating = "Everyone",
            communityRating = 4.5f,
            year = 2023,
            month = 10,
            day = 15
        )

        assertEquals("Test Comic", comicInfo.title)
        assertEquals("Writer Name", comicInfo.writer)
        assertEquals("Penciller Name", comicInfo.penciller)
        assertEquals("Action", comicInfo.genre)
        assertEquals(32, comicInfo.pageCount)
        assertEquals(4.5f, comicInfo.communityRating!!, 0.01f)
        assertEquals(2023, comicInfo.year)
    }
}
