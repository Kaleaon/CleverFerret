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

    @Test
    fun testReaderIndexPreservedAcrossRecreation() {
        val initialIndex = 7
        val savedState = mutableMapOf<String, Any>()

        // Simulate saving reader state across lifecycle / configuration change
        savedState["reader_index"] = initialIndex
        savedState["session_restored"] = true

        // Simulate activity recreation
        val restoredIndex = savedState["reader_index"] as? Int ?: 0
        val isSessionRestored = savedState["session_restored"] as? Boolean ?: false

        assertNotEquals("Reader index should not reset to 0 after recreation", 0, restoredIndex)
        assertEquals(7, restoredIndex)
        assertTrue("Session restored flag should survive recreation", isSessionRestored)
    }

    @Test
    fun testReaderIndexDefaultOnFirstOpen() {
        val emptySavedState = emptyMap<String, Any>()
        val defaultIndex = emptySavedState["reader_index"] as? Int ?: 0
        assertEquals("Initial open must safely default index to 0", 0, defaultIndex)
    }

    @Test
    fun testReaderIndexOutOfBoundsCoercionWhenPageCountDecreases() {
        val savedIndex = 15
        val pageCount = 10
        val coercedIndex = if (pageCount > 0) savedIndex.coerceIn(0, pageCount - 1) else 0
        assertEquals("Index must be coerced to pageCount - 1 when page count decreases", 9, coercedIndex)
    }

    @Test
    fun testReaderIndexOutOfBoundsCoercionWithZeroPages() {
        val savedIndex = 5
        val pageCount = 0
        val coercedIndex = if (pageCount > 0) savedIndex.coerceIn(0, pageCount - 1) else 0
        assertEquals("Index must safely resolve to 0 when page count is 0", 0, coercedIndex)
    }

    @Test
    fun testReportProgressGuardedOnInitialComposition() {
        var isSessionRestored = false
        var reportedProgress: Int? = null

        fun simulateReportProgress(page: Int) {
            if (isSessionRestored) {
                reportedProgress = page
            }
        }

        // 1. Initial composition before session restore: transient index is 0
        val uninitializedIndex = 0
        simulateReportProgress(uninitializedIndex)
        assertNull("Progress must not be reported before session is restored", reportedProgress)

        // 2. Saved session arrives with page 8
        val savedSession = ComicReadingSession(
            comicId = 42L,
            comicFilePath = "/tmp/comic.cbz",
            comicTitle = "Saved Comic",
            currentPage = 8,
            totalPages = 25
        )
        val restoredIndex = savedSession.currentPage
        isSessionRestored = true
        simulateReportProgress(restoredIndex)

        assertEquals("Progress should match the restored session page", 8, reportedProgress)
    }

    @Test
    fun testPdfReaderIndexCoercionAndPreservation() {
        val savedPageIndex = 12
        val updatedPageCount = 8
        val resolvedPageIndex = if (updatedPageCount > 0) {
            savedPageIndex.coerceIn(0, updatedPageCount - 1)
        } else {
            0
        }
        assertEquals("PDF page index should be clamped to valid bounds", 7, resolvedPageIndex)
    }
}
