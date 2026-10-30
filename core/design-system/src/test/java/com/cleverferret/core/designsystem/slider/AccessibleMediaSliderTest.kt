package com.cleverferret.core.designsystem.slider

import org.junit.Assert.assertEquals
import org.junit.Test

class AccessibleMediaSliderTest {

    @Test
    fun testFormatMsTime() {
        val result = formatMsTime(65000L, 180000L)
        assertEquals("1:05 / 3:00", result)
    }

    @Test
    fun testFormatMsTimeZero() {
        val result = formatMsTime(0L, 0L)
        assertEquals("0:00 / 0:00", result)
    }

    @Test
    fun testMediaChapterMarker() {
        val marker = MediaChapterMarker(120000L, "Chapter 1")
        assertEquals(120000L, marker.positionMs)
        assertEquals("Chapter 1", marker.title)
    }
}
