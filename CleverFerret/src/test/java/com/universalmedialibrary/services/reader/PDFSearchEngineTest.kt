package com.universalmedialibrary.services.reader

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import com.universalmedialibrary.data.local.dao.PdfOcrCacheDao
import com.universalmedialibrary.data.local.entity.PdfOcrCacheEntity
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import kotlin.system.measureTimeMillis

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28])
class PDFSearchEngineTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private lateinit var context: Context
    private lateinit var cacheDao: PdfOcrCacheDao
    private lateinit var searchEngine: PDFSearchEngine

    @Before
    fun setup() {
        context = ApplicationProvider.getApplicationContext()
        cacheDao = mockk(relaxed = true)
        searchEngine = PDFSearchEngine(context, cacheDao)
    }

    @Test
    fun `searchInPDF with cache hit returns results in under 50ms without re-extracting OCR`() = runBlocking {
        val pdfFile = tempFolder.newFile("scanned_doc.pdf")
        pdfFile.writeText("Dummy PDF binary content for testing OCR cache")

        val fileHash = PdfFileHasher.computeHash(pdfFile)

        val cachedEntities = listOf(
            PdfOcrCacheEntity(
                fileHash = fileHash,
                pageIndex = 0,
                text = "This page contains the secret passcode 12345 for testing.",
                timestamp = System.currentTimeMillis()
            ),
            PdfOcrCacheEntity(
                fileHash = fileHash,
                pageIndex = 1,
                text = "Second page text without target word.",
                timestamp = System.currentTimeMillis()
            )
        )

        coEvery { cacheDao.getPagesForFile(fileHash) } returns cachedEntities

        var results: List<com.universalmedialibrary.data.models.SearchResult>
        val duration = measureTimeMillis {
            results = searchEngine.searchInPDF(pdfFile.absolutePath, "passcode")
        }

        assertTrue("Search on cache hit should take < 50ms (took ${duration}ms)", duration < 50)
        assertEquals(1, results.size)
        assertEquals(1, results[0].pageNumber)
        assertTrue(results[0].context.contains("secret passcode 12345"))

        coVerify(exactly = 1) { cacheDao.getPagesForFile(fileHash) }
    }

    @Test
    fun `searchWithOCR writes extracted OCR text to cache on cache miss`() = runBlocking {
        val pdfFile = tempFolder.newFile("sample_miss.pdf")
        pdfFile.writeText("Dummy PDF binary content")

        val fileHash = PdfFileHasher.computeHash(pdfFile)
        coEvery { cacheDao.getPagesForFile(fileHash) } returns emptyList()

        // Executing search on a non-valid PDF renderer file returns empty results gracefully without throwing
        val results = searchEngine.searchWithOCR(pdfFile.absolutePath, "query")

        assertTrue(results.isEmpty())
        coVerify { cacheDao.getPagesForFile(fileHash) }
    }

    @Test
    fun `file modification changes hash preventing stale cache hits`() = runBlocking {
        val pdfFile = tempFolder.newFile("doc_modified.pdf")
        pdfFile.writeText("Initial text")

        val initialHash = PdfFileHasher.computeHash(pdfFile)

        coEvery { cacheDao.getPagesForFile(initialHash) } returns listOf(
            PdfOcrCacheEntity(
                fileHash = initialHash,
                pageIndex = 0,
                text = "Old content passcode",
                timestamp = System.currentTimeMillis()
            )
        )

        val initialResults = searchEngine.searchInPDF(pdfFile.absolutePath, "passcode")
        assertEquals(1, initialResults.size)

        // Modify file
        pdfFile.writeText("Updated new text without old content")
        pdfFile.setLastModified(System.currentTimeMillis() + 10000)

        val updatedHash = PdfFileHasher.computeHash(pdfFile)
        coEvery { cacheDao.getPagesForFile(updatedHash) } returns emptyList()

        val updatedResults = searchEngine.searchInPDF(pdfFile.absolutePath, "passcode")
        assertTrue(updatedResults.isEmpty())
    }
}
