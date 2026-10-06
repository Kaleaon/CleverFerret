package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.pdf.PdfRenderer
import android.os.ParcelFileDescriptor
import android.util.Log
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import com.universalmedialibrary.data.local.dao.PdfOcrCacheDao
import com.universalmedialibrary.data.local.entity.PdfOcrCacheEntity
import com.universalmedialibrary.data.models.SearchResult
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import org.apache.tika.metadata.Metadata
import org.apache.tika.parser.AutoDetectParser
import org.apache.tika.parser.ParseContext
import org.apache.tika.sax.BodyContentHandler
import java.io.File
import java.io.FileInputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * PDF Search Engine
 *
 * Provides text search functionality for PDF documents with:
 * - Persistent Room OCR cache (pdf_ocr_cache) keyed by deterministic PDF file hash
 * - Sub-50ms cache-hit response without rendering bitmaps
 * - Parallel background / fallback OCR extraction across pages using ML Kit Text Recognition
 * - Full-text search across native text pages using Apache Tika
 * - Context extraction around matches, case sensitivity, and whole word options
 */
@Singleton
class PDFSearchEngine @Inject constructor(
    @ApplicationContext private val context: Context,
    private val pdfOcrCacheDao: PdfOcrCacheDao? = null
) {

    private val TAG = "PDFSearchEngine"

    private val textRecognizer by lazy {
        TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)
    }

    /**
     * Search for text in a PDF document
     *
     * @param filePath Path to the PDF file
     * @param query Search query
     * @param matchCase Whether to match case
     * @param wholeWord Whether to match whole words only
     * @return List of search results with page numbers and context
     */
    suspend fun searchInPDF(
        filePath: String,
        query: String,
        matchCase: Boolean = false,
        wholeWord: Boolean = false
    ): List<SearchResult> = withContext(Dispatchers.IO) {
        val results = mutableListOf<SearchResult>()

        if (query.isBlank()) return@withContext results

        try {
            val file = File(filePath)
            if (!file.exists()) {
                Log.e(TAG, "PDF file not found: $filePath")
                return@withContext results
            }

            // Step 0: Check fast persistent Room OCR cache before rendering/parsing
            val fileHash = PdfFileHasher.computeHash(file)
            val cachedPages = if (fileHash.isNotBlank()) {
                pdfOcrCacheDao?.getPagesForFile(fileHash)
            } else null

            if (!cachedPages.isNullOrEmpty()) {
                Log.d(TAG, "OCR Cache HIT for $fileHash (${cachedPages.size} pages)")
                for (cachedPage in cachedPages) {
                    if (cachedPage.text.isNotBlank()) {
                        val matches = findMatches(cachedPage.text, query, matchCase, wholeWord)
                        matches.forEach { matchIndex ->
                            val contextStr = extractContext(cachedPage.text, matchIndex, query.length)
                            val highlightStartPos = contextStr.indexOf(query, ignoreCase = !matchCase)
                            results.add(
                                SearchResult(
                                    pageNumber = cachedPage.pageIndex + 1,
                                    context = contextStr,
                                    matchPosition = matchIndex,
                                    highlightStart = highlightStartPos,
                                    highlightEnd = highlightStartPos + query.length
                                )
                            )
                        }
                    }
                }
                return@withContext results
            }

            // Primary approach: Extract text using Apache Tika (which uses PDFBox internally)
            val pageTexts = extractTextWithTika(file)

            if (pageTexts != null && pageTexts.any { it.isNotBlank() }) {
                // Tika extraction succeeded - search through extracted text
                Log.d(TAG, "Using Apache Tika text extraction for ${pageTexts.size} pages")
                for ((pageIndex, pageText) in pageTexts.withIndex()) {
                    if (pageText.isNotBlank()) {
                        val matches = findMatches(pageText, query, matchCase, wholeWord)

                        matches.forEach { matchIndex ->
                            val context = extractContext(pageText, matchIndex, query.length)
                            val highlightStartPos = context.indexOf(query, ignoreCase = !matchCase)
                            results.add(
                                SearchResult(
                                    pageNumber = pageIndex + 1,
                                    context = context,
                                    matchPosition = matchIndex,
                                    highlightStart = highlightStartPos,
                                    highlightEnd = highlightStartPos + query.length
                                )
                            )
                        }
                    }
                }
            } else {
                // Tika extraction returned no text - fall back to parallel PdfRenderer + ML Kit OCR
                Log.w(TAG, "Tika extracted no text, falling back to parallel PdfRenderer + ML Kit OCR")
                val ocrResults = searchWithOCR(filePath, query, matchCase)
                results.addAll(ocrResults)
            }

        } catch (e: Exception) {
            Log.e(TAG, "Error searching PDF: $filePath", e)
        }

        return@withContext results
    }

    /**
     * Extract text from a PDF using Apache Tika, split by page.
     *
     * @param file The PDF file to extract text from
     * @return A list of strings, one per page, or null if extraction fails entirely.
     */
    private fun extractTextWithTika(file: File): List<String>? {
        return try {
            val metadata = Metadata()
            val handler = BodyContentHandler(-1) // No limit on content length
            val parser = AutoDetectParser()
            val parseContext = ParseContext()

            FileInputStream(file).use { fis ->
                parser.parse(fis, handler, metadata, parseContext)
            }

            val fullText = handler.toString()
            if (fullText.isBlank()) {
                Log.w(TAG, "Tika extracted empty text from PDF: ${file.name}")
                return null
            }

            val pages = fullText.split('\u000C') // Form feed character
            val pageCount = metadata.get("xmpTPg:NPages")?.toIntOrNull()

            if (pages.size > 1) {
                Log.d(TAG, "Tika extracted text with ${pages.size} page separators")
                pages
            } else if (pageCount != null && pageCount > 1) {
                Log.d(TAG, "No page separators found, approximating $pageCount pages")
                splitTextIntoPages(fullText, pageCount)
            } else {
                listOf(fullText)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Tika PDF text extraction failed: ${e.message}", e)
            null
        }
    }

    /**
     * Split extracted text approximately evenly across a known number of pages.
     */
    private fun splitTextIntoPages(text: String, pageCount: Int): List<String> {
        if (pageCount <= 1) return listOf(text)

        val lines = text.lines()
        val linesPerPage = (lines.size + pageCount - 1) / pageCount
        return lines.chunked(linesPerPage) { it.joinToString("\n") }
    }

    /**
     * Extract text from a single PDF page using PdfRenderer to render a bitmap
     * and ML Kit Text Recognition for OCR.
     */
    private suspend fun extractTextFromPageWithOCR(
        page: PdfRenderer.Page,
        pageIndex: Int
    ): String {
        return try {
            val scale = 2
            val width = page.width * scale
            val height = page.height * scale
            val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)

            page.render(bitmap, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)

            val inputImage = InputImage.fromBitmap(bitmap, 0)
            val visionText = textRecognizer.process(inputImage).await()

            bitmap.recycle()

            val extractedText = visionText.text
            if (extractedText.isNotBlank()) {
                Log.d(TAG, "OCR extracted ${extractedText.length} chars from page $pageIndex")
            } else {
                Log.d(TAG, "OCR found no text on page $pageIndex")
            }

            extractedText
        } catch (e: Exception) {
            Log.e(TAG, "OCR text extraction failed for page $pageIndex: ${e.message}", e)
            ""
        }
    }

    /**
     * Extract text across all pages using parallel OCR bounded by a Semaphore.
     */
    suspend fun extractAllPagesWithParallelOCR(file: File, pageCount: Int): List<String> = coroutineScope {
        val semaphore = Semaphore(4)
        val tasks = (0 until pageCount).map { pageIndex ->
            async(Dispatchers.IO) {
                semaphore.withPermit {
                    extractSinglePageTextWithOCR(file, pageIndex)
                }
            }
        }
        tasks.awaitAll()
    }

    private suspend fun extractSinglePageTextWithOCR(file: File, pageIndex: Int): String {
        return try {
            ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY).use { pfd ->
                PdfRenderer(pfd).use { renderer ->
                    if (pageIndex < 0 || pageIndex >= renderer.pageCount) return ""
                    renderer.openPage(pageIndex).use { page ->
                        extractTextFromPageWithOCR(page, pageIndex)
                    }
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "OCR extraction failed for page $pageIndex of ${file.name}", e)
            ""
        }
    }

    /**
     * Find all matches of query in text
     */
    private fun findMatches(
        text: String,
        query: String,
        matchCase: Boolean,
        wholeWord: Boolean
    ): List<Int> {
        val matches = mutableListOf<Int>()
        val searchText = if (matchCase) text else text.lowercase()
        val searchQuery = if (matchCase) query else query.lowercase()

        var startIndex = 0
        while (true) {
            val index = searchText.indexOf(searchQuery, startIndex)
            if (index == -1) break

            if (wholeWord) {
                val isWholeWord = (index == 0 || !searchText[index - 1].isLetterOrDigit()) &&
                    (index + searchQuery.length >= searchText.length ||
                     !searchText[index + searchQuery.length].isLetterOrDigit())

                if (isWholeWord) {
                    matches.add(index)
                }
            } else {
                matches.add(index)
            }

            startIndex = index + 1
        }

        return matches
    }

    /**
     * Extract context around a match
     */
    private fun extractContext(
        text: String,
        matchIndex: Int,
        queryLength: Int,
        contextRadius: Int = 50
    ): String {
        val start = maxOf(0, matchIndex - contextRadius)
        val end = minOf(text.length, matchIndex + queryLength + contextRadius)

        var context = text.substring(start, end)

        if (start > 0) context = "...$context"
        if (end < text.length) context = "$context..."

        return context.trim()
    }

    /**
     * Search using OCR for scanned PDFs with Room cache lookup and parallel page extraction.
     *
     * @param filePath Path to the PDF file
     * @param query Search query
     * @param matchCase Whether to match case
     * @return List of search results with page numbers and context
     */
    suspend fun searchWithOCR(
        filePath: String,
        query: String,
        matchCase: Boolean = false
    ): List<SearchResult> = withContext(Dispatchers.IO) {
        val results = mutableListOf<SearchResult>()

        try {
            val file = File(filePath)
            if (!file.exists()) {
                Log.e(TAG, "PDF file not found for OCR search: $filePath")
                return@withContext results
            }

            val fileHash = PdfFileHasher.computeHash(file)

            // Step 1: Check Room OCR cache
            val cachedPages = if (fileHash.isNotBlank()) {
                pdfOcrCacheDao?.getPagesForFile(fileHash)
            } else null

            if (!cachedPages.isNullOrEmpty()) {
                Log.d(TAG, "OCR Cache HIT for hash $fileHash (${cachedPages.size} pages)")
                for (cachedPage in cachedPages) {
                    if (cachedPage.text.isNotBlank()) {
                        val matches = findMatches(cachedPage.text, query, matchCase, false)
                        matches.forEach { matchIndex ->
                            val contextStr = extractContext(cachedPage.text, matchIndex, query.length)
                            val highlightStartPos = contextStr.indexOf(query, ignoreCase = !matchCase)
                            results.add(
                                SearchResult(
                                    pageNumber = cachedPage.pageIndex + 1,
                                    context = contextStr,
                                    matchPosition = matchIndex,
                                    highlightStart = highlightStartPos,
                                    highlightEnd = highlightStartPos + query.length
                                )
                            )
                        }
                    }
                }
                return@withContext results
            }

            // Step 2: Cache miss - parallel OCR extraction
            Log.d(TAG, "OCR Cache MISS for hash $fileHash - running parallel OCR extraction")

            val pageCount = getPdfPageCount(file)
            if (pageCount <= 0) return@withContext results

            val extractedTexts = extractAllPagesWithParallelOCR(file, pageCount)

            // Step 3: Write extracted text to pdf_ocr_cache
            if (fileHash.isNotBlank() && pdfOcrCacheDao != null) {
                val now = System.currentTimeMillis()
                val entities = extractedTexts.mapIndexed { pageIdx, text ->
                    PdfOcrCacheEntity(
                        fileHash = fileHash,
                        pageIndex = pageIdx,
                        text = text,
                        timestamp = now,
                        fileSize = file.length(),
                        lastModified = file.lastModified()
                    )
                }
                pdfOcrCacheDao.insertAll(entities)
                // Cleanup rule: prune entries older than 30 days
                pdfOcrCacheDao.deleteOlderThan(now - 30L * 24 * 60 * 60 * 1000)
            }

            // Step 4: Perform search matching on extracted page texts
            for ((pageIdx, pageText) in extractedTexts.withIndex()) {
                if (pageText.isNotBlank()) {
                    val matches = findMatches(pageText, query, matchCase, false)
                    matches.forEach { matchIndex ->
                        val contextStr = extractContext(pageText, matchIndex, query.length)
                        val highlightStartPos = contextStr.indexOf(query, ignoreCase = !matchCase)
                        results.add(
                            SearchResult(
                                pageNumber = pageIdx + 1,
                                context = contextStr,
                                matchPosition = matchIndex,
                                highlightStart = highlightStartPos,
                                highlightEnd = highlightStartPos + query.length
                            )
                        )
                    }
                }
            }

        } catch (e: Exception) {
            Log.e(TAG, "OCR search failed for PDF: $filePath", e)
        }

        return@withContext results
    }

    private fun getPdfPageCount(file: File): Int {
        return try {
            ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY).use { pfd ->
                PdfRenderer(pfd).use { renderer ->
                    renderer.pageCount
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to get PDF page count for ${file.path}", e)
            0
        }
    }
}
