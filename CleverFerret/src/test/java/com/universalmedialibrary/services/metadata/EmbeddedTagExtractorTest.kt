package com.universalmedialibrary.services.metadata

import android.content.Context
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito.mock

class EmbeddedTagExtractorTest {

    private lateinit var context: Context
    private lateinit var ffmpegExtractor: FFmpegMetadataExtractor
    private lateinit var extractor: EmbeddedTagExtractor

    @Before
    fun setUp() {
        context = mock(Context::class.java)
        ffmpegExtractor = mock(FFmpegMetadataExtractor::class.java)
        extractor = EmbeddedTagExtractor(context, ffmpegExtractor)
    }

    @Test
    fun testParseTrackNumber() {
        assertEquals(3, EmbeddedTagExtractor.parseTrackNumber("3"))
        assertEquals(3, EmbeddedTagExtractor.parseTrackNumber("3/12"))
        assertEquals(3, EmbeddedTagExtractor.parseTrackNumber("3-12"))
        assertEquals(1, EmbeddedTagExtractor.parseTrackNumber("  01  "))
        assertNull(EmbeddedTagExtractor.parseTrackNumber(null))
        assertNull(EmbeddedTagExtractor.parseTrackNumber(""))
        assertNull(EmbeddedTagExtractor.parseTrackNumber("abc"))
    }

    @Test
    fun testParseTrackTotal() {
        assertEquals(12, EmbeddedTagExtractor.parseTrackTotal("3/12"))
        assertEquals(12, EmbeddedTagExtractor.parseTrackTotal("3-12"))
        assertNull(EmbeddedTagExtractor.parseTrackTotal("3"))
        assertNull(EmbeddedTagExtractor.parseTrackTotal(null))
    }

    @Test
    fun testParseDiscNumberAndTotal() {
        assertEquals(1, EmbeddedTagExtractor.parseDiscNumber("1/2"))
        assertEquals(2, EmbeddedTagExtractor.parseDiscTotal("1/2"))
        assertEquals(1, EmbeddedTagExtractor.parseDiscNumber("1-2"))
        assertEquals(2, EmbeddedTagExtractor.parseDiscTotal("1-2"))
        assertEquals(2, EmbeddedTagExtractor.parseDiscNumber("2"))
        assertNull(EmbeddedTagExtractor.parseDiscTotal("2"))
    }
}
