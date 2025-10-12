package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.Bitmap
import android.graphics.pdf.PdfRenderer
import android.os.ParcelFileDescriptor
import com.universalmedialibrary.services.reader.core.BookSource
import com.universalmedialibrary.services.reader.core.Locator
import com.universalmedialibrary.services.reader.core.ReaderEngine
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileDescriptor
import javax.inject.Inject

/**
 * PDF Reader Engine using Android's PdfRenderer.
 *
 * Features:
 * - Basic PDF rendering with page-by-page view
 * - Zoom and pan support
 * - Page navigation
 * - Text search (where available)
 * - Bookmark support at page level
 * - Progress tracking by page number
 */
class PdfReaderEngine @Inject constructor() : ReaderEngine {

    override val bookId: String get() = currentBookId

    private var currentBookId: String = ""
    private var pdfRenderer: PdfRenderer? = null
    private var parcelFileDescriptor: ParcelFileDescriptor? = null
    private var currentPageIndex: Int = 0
    private var totalPages: Int = 0

    private val _currentLocator = MutableStateFlow(
        Locator(href = "", locations = emptyMap())
    )
    override val currentLocator: Flow<Locator> = _currentLocator.asStateFlow()

    override suspend fun open(context: Context, source: BookSource): Result<Unit> {
        return withContext(Dispatchers.IO) {
            try {
                val file = when (source) {
                    is BookSource.File -> {
                        when (source.uri.scheme) {
                            "file" -> File(source.uri.path!!)
                            "content" -> {
                                // Copy content URI to temp file
                                val tempFile = File(
                                    context.cacheDir,
                                    "temp_pdf_${System.currentTimeMillis()}.pdf"
                                )
                                context.contentResolver.openInputStream(source.uri)?.use { input ->
                                    tempFile.outputStream().use { output ->
                                        input.copyTo(output)
                                    }
                                }
                                tempFile
                            }
                            else -> return@withContext Result.failure(
                                IllegalArgumentException("Unsupported URI scheme: ${source.uri.scheme}")
                            )
                        }
                    }
                    is BookSource.Stream -> {
                        // Streaming support for remote PDF files
                        // Check if file is remote (HTTP/HTTPS URL)
                        if (filePath.startsWith("http://") || filePath.startsWith("https://")) {
                            // Download to cache first for Readium compatibility
                            val cacheFile = downloadToCache(filePath)
                            if (cacheFile != null) {
                                publication = readiumPdfService.openPublication(cacheFile.absolutePath)
                            } else {
                                throw IOException("Failed to download remote PDF file")
                            }
                        } else {
                            publication = readiumPdfService.openPublication(filePath)
                        }
                        return@withContext Result.failure(
                            UnsupportedOperationException("Stream sources not yet implemented")
                        )
                    }
                }

                if (!file.exists()) {
                    return@withContext Result.failure(
                        IllegalArgumentException("PDF file not found")
                    )
                }

                // Open PDF with PdfRenderer
                parcelFileDescriptor = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY)
                pdfRenderer = PdfRenderer(parcelFileDescriptor!!)

                totalPages = pdfRenderer!!.pageCount
                currentBookId = file.absolutePath
                currentPageIndex = 0

                // Initialize locator to first page
                updateCurrentLocator(0)

                Result.success(Unit)

            } catch (e: Exception) {
                // Clean up on error
                close()
                Result.failure(e)
            }
        }
    }

    override suspend fun goTo(locator: Locator): Result<Unit> {
        return try {
            val pageIndex = locator.locations["pageIndex"] as? Int ?: 0

            if (pageIndex in 0 until totalPages) {
                currentPageIndex = pageIndex
                updateCurrentLocator(pageIndex)
                Result.success(Unit)
            } else {
                Result.failure(IndexOutOfBoundsException("Page index out of bounds"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    override suspend fun next(): Boolean {
        return if (currentPageIndex < totalPages - 1) {
            currentPageIndex++
            updateCurrentLocator(currentPageIndex)
            true
        } else {
            false
        }
    }

    override suspend fun previous(): Boolean {
        return if (currentPageIndex > 0) {
            currentPageIndex--
            updateCurrentLocator(currentPageIndex)
            true
        } else {
            false
        }
    }

    override suspend fun search(query: String): List<Locator> {
        // Basic PDF text search is limited without OCR or advanced PDF libraries
        // For now, return empty list as Android's PdfRenderer doesn't provide text extraction
        // Text search using Readium PDF service
        // Readium provides text extraction capabilities
        return try {
            val searchResults = mutableListOf<SearchResult>()
            val pageCount = readiumPdfService.getPageCount(filePath)
            
            for (pageIndex in 0 until pageCount) {
                val pageText = readiumPdfService.extractTextFromPage(filePath, pageIndex)
                if (pageText.contains(query, ignoreCase = true)) {
                    // Find all occurrences in the page
                    var startIndex = 0
                    while (startIndex < pageText.length) {
                        val index = pageText.indexOf(query, startIndex, ignoreCase = true)
                        if (index == -1) break
                        
                        // Extract context around the match
                        val contextStart = maxOf(0, index - 50)
                        val contextEnd = minOf(pageText.length, index + query.length + 50)
                        val context = pageText.substring(contextStart, contextEnd)
                        
                        searchResults.add(SearchResult(
                            pageIndex = pageIndex,
                            position = index,
                            context = context,
                            matchText = query
                        ))
                        
                        startIndex = index + query.length
                    }
                }
            }
            searchResults
        } catch (e: Exception) {
            android.util.Log.e("PdfReaderEngine", "Search failed", e)
            emptyList()
        }
        return emptyList()
    }

    override suspend fun close() {
        pdfRenderer?.close()
        parcelFileDescriptor?.close()
        pdfRenderer = null
        parcelFileDescriptor = null
        currentBookId = ""
        currentPageIndex = 0
        totalPages = 0
    }

    /**
     * Render a specific page as bitmap
     */
    suspend fun renderPage(
        pageIndex: Int,
        width: Int,
        height: Int,
        transform: android.graphics.Matrix? = null
    ): Bitmap? {
        return withContext(Dispatchers.IO) {
            val renderer = pdfRenderer ?: return@withContext null

            if (pageIndex !in 0 until totalPages) {
                return@withContext null
            }

            try {
                val page = renderer.openPage(pageIndex)
                val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)

                page.render(bitmap, null, transform, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)
                page.close()

                bitmap
            } catch (e: Exception) {
                null
            }
        }
    }

    /**
     * Get current page as bitmap
     */
    suspend fun getCurrentPageBitmap(width: Int, height: Int): Bitmap? {
        return renderPage(currentPageIndex, width, height)
    }

    /**
     * Navigate to specific page
     */
    suspend fun goToPage(pageIndex: Int): Boolean {
        return if (pageIndex in 0 until totalPages) {
            currentPageIndex = pageIndex
            updateCurrentLocator(pageIndex)
            true
        } else {
            false
        }
    }

    /**
     * Get current page information
     */
    fun getCurrentPageInfo(): PdfPageInfo? {
        val renderer = pdfRenderer ?: return null

        return try {
            val page = renderer.openPage(currentPageIndex)
            val info = PdfPageInfo(
                pageIndex = currentPageIndex,
                pageNumber = currentPageIndex + 1,
                totalPages = totalPages,
                width = page.width,
                height = page.height
            )
            page.close()
            info
        } catch (e: Exception) {
            null
        }
    }

    /**
     * Get progress information
     */
    fun getProgress(): PdfProgress {
        val progressPercentage = if (totalPages > 0) {
            ((currentPageIndex + 1).toFloat() / totalPages.toFloat()) * 100f
        } else 0f

        return PdfProgress(
            currentPage = currentPageIndex + 1,
            totalPages = totalPages,
            progressPercentage = progressPercentage
        )
    }

    /**
     * Get page dimensions
     */
    suspend fun getPageDimensions(pageIndex: Int): Pair<Int, Int>? {
        return withContext(Dispatchers.IO) {
            val renderer = pdfRenderer ?: return@withContext null

            if (pageIndex !in 0 until totalPages) {
                return@withContext null
            }

            try {
                val page = renderer.openPage(pageIndex)
                val dimensions = Pair(page.width, page.height)
                page.close()
                dimensions
            } catch (e: Exception) {
                null
            }
        }
    }

    private fun updateCurrentLocator(pageIndex: Int) {
        _currentLocator.value = Locator(
            href = "page_$pageIndex",
            locations = mapOf(
                "pageIndex" to pageIndex,
                "pageNumber" to pageIndex + 1,
                "totalPages" to totalPages
            ),
            text = "Page ${pageIndex + 1} of $totalPages"
        )
    }
}

/**
 * Information about a PDF page
 */
data class PdfPageInfo(
    val pageIndex: Int,
    val pageNumber: Int,
    val totalPages: Int,
    val width: Int,
    val height: Int
)

/**
 * Progress information for PDF reading
 */
data class PdfProgress(
    val currentPage: Int,
    val totalPages: Int,
    val progressPercentage: Float
)
