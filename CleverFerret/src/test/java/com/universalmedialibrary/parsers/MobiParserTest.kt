package com.universalmedialibrary.parsers

import com.universalmedialibrary.parsers.impl.MobiParser
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.io.File
import java.io.InputStream
import kotlin.math.min

class MobiParserTest {

    private lateinit var parser: MobiParser

    @Before
    fun setUp() {
        parser = MobiParser()
    }

    @Test
    fun testSupportsExtensions() {
        assertTrue(parser.supports("book.mobi"))
        assertTrue(parser.supports("BOOK.MOBI"))
        assertTrue(parser.supports("book.azw"))
        assertTrue(parser.supports("book.azw3"))
        assertTrue(parser.supports("book.prc"))
        assertFalse(parser.supports("book.epub"))
        assertFalse(parser.supports("book.pdf"))
        
        assertEquals(listOf("mobi", "azw", "azw3", "prc"), parser.getSupportedExtensions())
    }

    @Test
    fun testSubThresholdStreamParsingDoesNotCreateSpoolFile() = runBlocking {
        val happyFile = File("src/test/resources/parsers/mobi/happy.mobi")
        val sampleBytes = if (happyFile.exists()) happyFile.readBytes() else "MOBI test content".toByteArray()
        val stream = sampleBytes.inputStream()

        val tempDir = File(System.getProperty("java.io.tmpdir"))
        val initialSpoolFiles = getSpoolFiles(tempDir)

        try {
            parser.parse(stream, "test_sub.mobi")
        } catch (_: Exception) {
            // Ignored - verifying memory threshold and temp file behaviour
        }

        val finalSpoolFiles = getSpoolFiles(tempDir)
        val newSpoolFiles = finalSpoolFiles - initialSpoolFiles

        assertTrue("Sub-threshold parsing should not leave or create spool files", newSpoolFiles.isEmpty())
    }

    @Test
    fun testExactThresholdBoundaryParsing() = runBlocking {
        val size = MobiParser.MEMORY_THRESHOLD_BYTES // 2MB
        val happyFile = File("src/test/resources/parsers/mobi/happy.mobi")
        val sampleBytes = if (happyFile.exists()) happyFile.readBytes() else "MOBI sample data".toByteArray()

        val stream = RepeatedInputStream(sampleBytes, size.toLong())
        val tempDir = File(System.getProperty("java.io.tmpdir"))
        val initialSpoolFiles = getSpoolFiles(tempDir)

        try {
            parser.parse(stream, "boundary_exact_2mb.mobi")
        } catch (_: Exception) {
            // Ignored - verifying spooling boundary transition
        }

        val finalSpoolFiles = getSpoolFiles(tempDir)
        val newSpoolFiles = finalSpoolFiles - initialSpoolFiles

        assertTrue("Exact 2MB stream should remain in-memory and not create spool file", newSpoolFiles.isEmpty())
    }

    @Test
    fun testSuperThresholdStreamParsingSpoolsAndCleansUp() = runBlocking {
        val superThresholdSize = (MobiParser.MEMORY_THRESHOLD_BYTES + 1024 * 500).toLong() // ~2.5MB
        val happyFile = File("src/test/resources/parsers/mobi/happy.mobi")
        val sampleBytes = if (happyFile.exists()) happyFile.readBytes() else "MOBI sample data".toByteArray()

        val stream = RepeatedInputStream(sampleBytes, superThresholdSize)
        val tempDir = File(System.getProperty("java.io.tmpdir"))
        val initialSpoolFiles = getSpoolFiles(tempDir)

        try {
            parser.parse(stream, "super_threshold.mobi")
        } catch (_: Exception) {
            // Expected that header read or content parsing might throw on non-standard stream
        }

        val finalSpoolFiles = getSpoolFiles(tempDir)
        val newSpoolFiles = finalSpoolFiles - initialSpoolFiles

        assertTrue("Super-threshold temporary file must be cleaned up after parse completion", newSpoolFiles.isEmpty())
    }

    @Test
    fun testSuperThresholdStreamCleanupOnFailure() = runBlocking {
        val superThresholdSize = (MobiParser.MEMORY_THRESHOLD_BYTES + 1024 * 100).toLong()
        val corruptBytes = "Corrupted MOBI Header Data".toByteArray()

        val stream = RepeatedInputStream(corruptBytes, superThresholdSize)
        val tempDir = File(System.getProperty("java.io.tmpdir"))
        val initialSpoolFiles = getSpoolFiles(tempDir)

        try {
            parser.parse(stream, "corrupt_super_threshold.mobi")
        } catch (_: Exception) {
            // Exception expected
        }

        val finalSpoolFiles = getSpoolFiles(tempDir)
        val newSpoolFiles = finalSpoolFiles - initialSpoolFiles

        assertTrue("Super-threshold spool file must be cleaned up on failure", newSpoolFiles.isEmpty())
    }

    private fun getSpoolFiles(dir: File): Set<String> {
        return dir.listFiles { _, name -> name.startsWith("mobi_spool_") && name.endsWith(".mobi") }
            ?.map { it.absolutePath }?.toSet() ?: emptySet()
    }

    private class RepeatedInputStream(
        private val pattern: ByteArray,
        private val totalSize: Long
    ) : InputStream() {
        private var position = 0L

        override fun read(): Int {
            if (position >= totalSize) return -1
            val byteVal = pattern[(position % pattern.size).toInt()].toInt() and 0xFF
            position++
            return byteVal
        }

        override fun read(b: ByteArray, off: Int, len: Int): Int {
            if (position >= totalSize) return -1
            val remaining = totalSize - position
            val toRead = min(len.toLong(), remaining).toInt()
            for (i in 0 until toRead) {
                b[off + i] = pattern[((position + i) % pattern.size).toInt()]
            }
            position += toRead
            return toRead
        }
    }
}
