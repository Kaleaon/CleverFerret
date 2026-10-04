package com.universalmedialibrary.ui.reader

import com.universalmedialibrary.data.local.entity.ComicReadingSession
import com.universalmedialibrary.data.preferences.ComicPreferences
import com.universalmedialibrary.ui.viewer.common.ReadingDirection
import com.universalmedialibrary.ui.viewer.common.ReadingMode
import org.junit.Assert.*
import org.junit.Test

class ComicReaderRtlWebtoonTest {

    @Test
    fun testComicReadingSessionDefaults() {
        val session = ComicReadingSession(
            comicId = 1L,
            comicFilePath = "/tmp/manga.cbz",
            comicTitle = "Test Manga"
        )
        assertEquals("PAGE", session.readingMode)
        assertFalse(session.isRightToLeft)
        assertEquals("LEFT_TO_RIGHT", session.readingDirection)
    }

    @Test
    fun testComicReadingSessionRtlAndWebtoon() {
        val session = ComicReadingSession(
            comicId = 2L,
            comicFilePath = "/tmp/webtoon.cbz",
            comicTitle = "Test Webtoon",
            readingMode = "WEBTOON",
            isRightToLeft = true,
            readingDirection = "RIGHT_TO_LEFT"
        )
        assertEquals("WEBTOON", session.readingMode)
        assertTrue(session.isRightToLeft)
        assertEquals("RIGHT_TO_LEFT", session.readingDirection)
    }

    @Test
    fun testComicPreferencesDefaults() {
        val prefs = ComicPreferences()
        assertEquals(ReadingMode.PAGE_BY_PAGE, prefs.readingMode)
        assertEquals(ReadingDirection.LEFT_TO_RIGHT, prefs.readingDirection)
        assertFalse(prefs.translationEnabled)
    }

    @Test
    fun testRtlNavigationInversion() {
        var index = 5
        val totalPages = 10

        fun triggerNextPage(isRtl: Boolean) {
            if (isRtl) {
                if (index > 0) index -= 1
            } else {
                if (index < totalPages - 1) index += 1
            }
        }

        fun triggerPrevPage(isRtl: Boolean) {
            if (isRtl) {
                if (index < totalPages - 1) index += 1
            } else {
                if (index > 0) index -= 1
            }
        }

        // Standard LTR
        triggerNextPage(isRtl = false)
        assertEquals(6, index)
        triggerPrevPage(isRtl = false)
        assertEquals(5, index)

        // Manga RTL
        triggerNextPage(isRtl = true)
        assertEquals(4, index) // Inverted: next page decrements index
        triggerPrevPage(isRtl = true)
        assertEquals(5, index) // Inverted: prev page increments index
    }
}
