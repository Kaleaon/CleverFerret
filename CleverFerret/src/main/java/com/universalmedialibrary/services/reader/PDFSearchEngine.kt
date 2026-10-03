package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.pdf.PdfRenderer
import android.os.ParcelFileDescriptor
import android.util.Log
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import com.universalmedialibrary.data.models.SearchResult
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
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
 * - Full-text search across all pages using Apache Tika for text extraction
 * - Context extraction around matches
 * - Case-sensitive and whole word options
 * - OCR fallback for scanned PDFs using ML Kit Text Recognition
 *
 * Text extraction strategy:
 * 1. Primary: Apache Tika (uses PDFBox internally) for native PDF text extraction
 * 2. Fallback: PdfRenderer bitmap rendering + ML Kit OCR for scanned/image-based PDFs
 */
@Singleton
class PDFSearchEngine @Inject constructor(
    @ApplicationContext private val context: Context
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
                // Tika extraction returned no text - fall back to PdfRenderer + ML Kit OCR
                Log.w(TAG, "Tika extracted no text, falling back to PdfRenderer + ML Kit OCR")
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
     * Tika's AutoDetectParser will use PDFBox internally for PDF files, providing
     * reliable text extraction from native (non-scanned) PDFs.
     *
     * @param file The PDF file to extract text from
     * @return A list of strings, one per page, or null if extraction fails entirely.
     *         Individual pages may be empty if they contain no extractable text.
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

            // Attempt to split by page using form feed characters (PDF page breaks)
            // Many PDF extractors insert form feed (\f) between pages
            val pages = fullText.split('\u000C') // Form feed character
            val pageCount = metadata.get("xmpTPg:NPages")?.toIntOrNull()

            if (pages.size > 1) {
                // Tika inserted page separators - use them directly
                Log.d(TAG, "Tika extracted text with ${pages.size} page separators")
                pages
            } else if (pageCount != null && pageCount > 1) {
                // No page separators but we know the page count - split evenly as approximation
                // This is a best-effort heuristic; the text is still searchable
                Log.d(TAG, "No page separators found, approximating $pageCount pages")
                splitTextIntoPages(fullText, pageCount)
            } else {
                // Single page or unknown page count - treat entire text as page 1
                listOf(fullText)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Tika PDF text extraction failed: ${e.message}", e)
            null
        }
    }

    /**
     * Split extracted text approximately evenly across a known number of pages.
     * This is used when Tika does not insert page-break characters but we know the page count.
     */
    private fun splitTextIntoPages(text: String, pageCount: Int): List<String> {
        if (pageCount <= 1) return listOf(text)

        val lines = text.lines()
        val linesPerPage = (lines.size + pageCount - 1) / pageCount // ceiling division
        return lines.chunked(linesPerPage) { it.joinToString("\n") }
    }

    /**
     * Extract text from a single PDF page using PdfRenderer to render a bitmap
     * and ML Kit Text Recognition for OCR.
     *
     * This is used as a fallback when Apache Tika cannot extract text
     * (e.g., for scanned/image-based PDFs).
     *
     * @param page The PdfRenderer.Page to render
     * @param pageIndex The page index (for logging)
     * @return The OCR-extracted text, or empty string if OCR fails
     */
    private suspend fun extractTextFromPageWithOCR(
        page: PdfRenderer.Page,
        pageIndex: Int
    ): String {
        return try {
            // Render the page to a bitmap at a resolution suitable for OCR
            // Use 2x scale for better OCR accuracy
            val scale = 2
            val width = page.width * scale
            val height = page.height * scale
            val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)

            // Render the page onto the bitmap
            page.render(bitmap, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)

            // Use ML Kit to recognize text from the rendered bitmap
            val inputImage = InputImage.fromBitmap(bitmap, 0)
            val visionText = textRecognizer.process(inputImage).await()

            // Clean up bitmap to free memory
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

            // Check whole word if needed
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

        // Add ellipsis if context is truncated
        if (start > 0) context = "...$context"
        if (end < text.length) context = "$context..."

        return context.trim()
    }

    /**
     * Search using OCR for scanned PDFs
     *
     * Renders each page as a bitmap using PdfRenderer and uses
     * ML Kit Text Recognition to extract text for searching.
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

            val fileDescriptor = ParcelFileDescriptor.open(
                file,
                ParcelFileDescriptor.MODE_READ_ONLY
            )

            val pdfRenderer = PdfRenderer(fileDescriptor)

            try {
                Log.d(TAG, "Starting OCR search across ${pdfRenderer.pageCount} pages")
                for (pageIndex in 0 until pdfRenderer.pageCount) {
                    val page = pdfRenderer.openPage(pageIndex)

                    try {
                        val pageText = extractTextFromPageWithOCR(page, pageIndex)

                        if (pageText.isNotBlank()) {
                            val matches = findMatches(pageText, query, matchCase, false)

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
                    } finally {
                        page.close()
                    }
                }
            } finally {
                pdfRenderer.close()
                fileDescriptor.close()
            }

        } catch (e: Exception) {
            Log.e(TAG, "OCR search failed for PDF: $filePath", e)
        }

        return@withContext results
    }
}
