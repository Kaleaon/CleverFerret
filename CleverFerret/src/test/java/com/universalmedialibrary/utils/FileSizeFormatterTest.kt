package com.universalmedialibrary.utils

import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.After
import org.junit.Test
import java.util.Locale

class FileSizeFormatterTest {

    private lateinit var originalLocale: Locale

    @Before
    fun setUp() {
        originalLocale = Locale.getDefault()
        Locale.setDefault(Locale.US)
    }

    @After
    fun tearDown() {
        Locale.setDefault(originalLocale)
    }

    @Test
    fun testNegativeAndZeroBytes() {
        assertEquals("0 B", FileSizeFormatter.formatFileSize(-100L))
        assertEquals("0 B", FileSizeFormatter.formatFileSize(0L))
        assertEquals("0 B", (-100L).formatFileSize())
        assertEquals("0 B", 0L.formatFileSize())
    }

    @Test
    fun testSubKilobyteExactBytes() {
        assertEquals("1 B", FileSizeFormatter.formatFileSize(1L))
        assertEquals("500 B", FileSizeFormatter.formatFileSize(500L))
        assertEquals("1023 B", FileSizeFormatter.formatFileSize(1023L))
        assertEquals("500 B", 500L.formatFileSize())
    }

    @Test
    fun testKilobytes() {
        assertEquals("1.0 KB", FileSizeFormatter.formatFileSize(1024L))
        assertEquals("1.5 KB", FileSizeFormatter.formatFileSize(1536L))
        assertEquals("1.5 KB", 1536L.formatFileSize())
    }

    @Test
    fun testMegabytes() {
        val megabyteBytes = (20.4 * 1024 * 1024).toLong()
        assertEquals("20.4 MB", FileSizeFormatter.formatFileSize(megabyteBytes))
        assertEquals("20.4 MB", megabyteBytes.formatFileSize())
    }

    @Test
    fun testGigabytes() {
        val gigabyteBytes = (1.2 * 1024 * 1024 * 1024).toLong()
        assertEquals("1.2 GB", FileSizeFormatter.formatFileSize(gigabyteBytes))
        assertEquals("1.2 GB", gigabyteBytes.formatFileSize())
    }

    @Test
    fun testTerabytes() {
        val terabyteBytes = (3.5 * 1024.0 * 1024.0 * 1024.0 * 1024.0).toLong()
        assertEquals("3.5 TB", FileSizeFormatter.formatFileSize(terabyteBytes))
        assertEquals("3.5 TB", terabyteBytes.formatFileSize())
    }

    @Test
    fun testGermanLocaleSeparator() {
        Locale.setDefault(Locale.GERMANY)
        assertEquals("1,5 KB", FileSizeFormatter.formatFileSize(1536L))
    }
}
