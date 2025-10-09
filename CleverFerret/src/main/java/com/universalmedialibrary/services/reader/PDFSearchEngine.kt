package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.pdf.PdfRenderer
import android.os.ParcelFileDescriptor
import android.util.Log
import com.universalmedialibrary.ui.components.SearchResult
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * PDF Search Engine
 *
 * Provides text search functionality for PDF documents with:
 * - Full-text search across all pages
 * - Context extraction around matches
 * - Case-sensitive and whole word options
 * - OCR support for scanned PDFs (future enhancement)
 *
 * Note: This implementation uses Android's PdfRenderer which has limited
 * text extraction capabilities. For production, consider integrating a
 * library like Apache PDFBox or implementing OCR with ML Kit.
 */
@Singleton
class PDFSearchEngine @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private val TAG = "PDFSearchEngine"

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

            val fileDescriptor = ParcelFileDescriptor.open(
                file,
                ParcelFileDescriptor.MODE_READ_ONLY
            )
            
            val pdfRenderer = PdfRenderer(fileDescriptor)

            try {
                // Search through each page
                for (pageIndex in 0 until pdfRenderer.pageCount) {
                    val page = pdfRenderer.openPage(pageIndex)
                    
                    try {
                        // Note: PdfRenderer doesn't provide text extraction
                        // This is a placeholder for demonstration
                        // In production, use a library that supports text extraction
                        
                        // For now, we'll indicate this limitation
                        // Real implementation would extract text and search
                        val pageText = extractTextFromPage(page, pageIndex)
                        
                        if (pageText.isNotBlank()) {
                            val matches = findMatches(
                                pageText,
                                query,
                                matchCase,
                                wholeWord
                            )
                            
                            matches.forEach { matchIndex ->
                                val context = extractContext(pageText, matchIndex, query.length)
                                results.add(
                                    SearchResult(
                                        pageNumber = pageIndex + 1,
                                        context = context,
                                        matchPosition = matchIndex,
                                        highlightStart = context.indexOf(
                                            if (matchCase) query else query.lowercase()
                                        ),
                                        highlightEnd = context.indexOf(
                                            if (matchCase) query else query.lowercase()
                                        ) + query.length
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
            Log.e(TAG, "Error searching PDF: $filePath", e)
        }

        return@withContext results
    }

    /**
     * Extract text from a PDF page
     * 
     * Note: This is a placeholder. Android's PdfRenderer doesn't directly support
     * text extraction. This would need to be implemented using:
     * 1. Apache PDFBox for Android
     * 2. ML Kit Text Recognition (OCR) for scanned PDFs
     * 3. External PDF processing service
     */
    private fun extractTextFromPage(page: PdfRenderer.Page, pageIndex: Int): String {
        // Placeholder implementation
        // Real implementation would extract actual text from the PDF
        
        // For demonstration, return empty string to indicate limitation
        Log.w(TAG, "Text extraction not fully implemented. Page $pageIndex")
        
        // TODO: Integrate text extraction library
        // Options:
        // 1. Apache PDFBox: implementation("com.tom_roush:pdfbox-android:2.0.27.0")
        // 2. ML Kit OCR for scanned PDFs
        // 3. iText for PDF manipulation
        
        return ""
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
     * Future implementation with ML Kit Text Recognition
     */
    suspend fun searchWithOCR(
        filePath: String,
        query: String,
        matchCase: Boolean = false
    ): List<SearchResult> = withContext(Dispatchers.IO) {
        // TODO: Implement OCR-based search using ML Kit
        // This would:
        // 1. Render each PDF page as a bitmap
        // 2. Use ML Kit Text Recognition to extract text
        // 3. Search the extracted text
        // 4. Return results with page coordinates
        
        Log.w(TAG, "OCR search not yet implemented")
        emptyList()
    }
}

/**
 * Helper extension to check if character is a letter or digit
 */
private fun Char.isLetterOrDigit(): Boolean {
    return this.isLetter() || this.isDigit()
}
