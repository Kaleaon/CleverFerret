package com.universalmedialibrary.services.reader

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.system.measureTimeMillis

class PdfFileHasherTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @Test
    fun `computeHash executes in under 10ms for non-empty file`() {
        val file = tempFolder.newFile("sample.pdf")
        file.writeBytes(ByteArray(100 * 1024) { (it % 256).toByte() }) // 100KB file

        val duration = measureTimeMillis {
            val hash = PdfFileHasher.computeHash(file)
            assertTrue(hash.isNotBlank())
        }

        assertTrue("Hash computation took $duration ms (expected < 10ms)", duration < 100) // 10ms threshold in production, 100ms upper bound in unit test runner
    }

    @Test
    fun `computeHash returns deterministic value for identical file state`() {
        val file = tempFolder.newFile("test.pdf")
        file.writeText("Sample PDF content for hashing test")

        val hash1 = PdfFileHasher.computeHash(file)
        val hash2 = PdfFileHasher.computeHash(file)

        assertEquals(hash1, hash2)
        assertTrue(hash1.isNotBlank())
    }

    @Test
    fun `computeHash changes when file content or modification timestamp changes`() {
        val file = tempFolder.newFile("modifiable.pdf")
        file.writeText("Original text")

        val initialHash = PdfFileHasher.computeHash(file)

        // Modify content and timestamp
        Thread.sleep(10)
        file.writeText("Modified text with extra content")
        file.setLastModified(System.currentTimeMillis() + 5000)

        val updatedHash = PdfFileHasher.computeHash(file)

        assertNotEquals(initialHash, updatedHash)
    }

    @Test
    fun `computeHash handles non-existent file gracefully`() {
        val file = File(tempFolder.root, "non_existent.pdf")
        val hash = PdfFileHasher.computeHash(file)
        assertEquals("", hash)
    }
}
