package com.universalmedialibrary.services

import com.universalmedialibrary.data.local.entity.MediaItem
import org.junit.Assert.*
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

class ScanProgressTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @Test
    fun countEligibleFiles_countsMatchingMediaFilesCorrectly() {
        val root = tempFolder.newFolder("library")
        val bookFile = File(root, "test_book.epub").apply { createNewFile() }
        val musicFile = File(root, "song.mp3").apply { createNewFile() }
        val movieFile = File(root, "movie.mp4").apply { createNewFile() }
        val nonMediaFile = File(root, "notes.abc").apply { createNewFile() }

        val subDir = File(root, "subdir").apply { mkdir() }
        val nestedBook = File(subDir, "nested.pdf").apply { createNewFile() }

        val count = countEligibleFiles(root, null)
        assertEquals(4, count) // epub, mp3, mp4, pdf
    }

    @Test
    fun scanProgress_percentageCalculation() {
        val progress = MediaScannerService.ScanProgress(
            isScanning = true,
            scannedCount = 25,
            totalEstimatedCount = 100,
            progressPercentage = 25.0f,
            isIndeterminate = false
        )

        assertEquals(25.0f, progress.progressPercentage!!, 0.01f)
        assertFalse(progress.isIndeterminate)
        assertEquals(100, progress.totalEstimatedCount)
        assertEquals(25, progress.scannedCount)
    }

    @Test
    fun scanProgress_indeterminateFallbackWhenTotalZero() {
        val progress = MediaScannerService.ScanProgress(
            isScanning = true,
            scannedCount = 5,
            totalEstimatedCount = 0,
            progressPercentage = null,
            isIndeterminate = true
        )

        assertNull(progress.progressPercentage)
        assertTrue(progress.isIndeterminate)
    }

    @Test
    fun cancelScan_resetsScanProgress() {
        MediaScannerService.cancelScan()
        val current = MediaScannerService.scanProgress.value

        assertFalse(current.isScanning)
        assertEquals("Scan canceled", current.statusText)
    }
}
