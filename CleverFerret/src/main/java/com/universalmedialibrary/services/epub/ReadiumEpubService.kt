package com.universalmedialibrary.services.epub

import android.content.Context
import android.graphics.Bitmap
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Readium EPUB Service
 * 
 * Modern EPUB parsing service using Readium Kotlin Toolkit
 * Provides:
 * - EPUB 2 & 3 support
 * - Cover artwork extraction
 * - Metadata parsing (title, author, publisher, etc.)
 * - Table of contents (TOC) extraction
 * - Resource access (images, fonts, etc.)
 * 
 * NOTE: This service is currently disabled due to Readium API changes in v3.1.2.
 * EPUB functionality is provided by EpubReaderService instead.
 * This will be re-enabled in v1.1.0 after completing the API migration.
 */
@Singleton
class ReadiumEpubService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ReadiumEpubService"

    /**
     * Extract cover image from EPUB file
     * 
     * NOTE: Temporarily disabled due to API changes
     * 
     * @param epubPath Path to EPUB file
     * @return Bitmap of cover image or null if not found
     */
    suspend fun extractCover(epubPath: String): Bitmap? = withContext(Dispatchers.IO) {
        Log.w(TAG, "ReadiumEpubService is currently disabled. Use EpubReaderService for EPUB support.")
        null
    }

    /**
     * Extract metadata from EPUB file
     * 
     * NOTE: Temporarily disabled due to API changes
     * 
     * @param epubPath Path to EPUB file
     * @return EpubMetadata or null if failed
     */
    suspend fun extractMetadata(epubPath: String): EpubMetadata? = withContext(Dispatchers.IO) {
        Log.w(TAG, "ReadiumEpubService is currently disabled. Use EpubReaderService for EPUB support.")
        null
    }

    /**
     * Extract table of contents - DISABLED
     */
    suspend fun extractToc(epubPath: String): List<TocItem> = withContext(Dispatchers.IO) {
        Log.w(TAG, "ReadiumEpubService is currently disabled.")
        emptyList()
    }
}

/**
 * EPUB Metadata
 */
data class EpubMetadata(
    val title: String,
    val authors: List<String> = emptyList(),
    val publisher: String? = null,
    val publishedDate: String? = null,
    val description: String? = null,
    val subjects: List<String> = emptyList(),
    val language: String? = null,
    val identifier: String? = null,
    val rights: String? = null,
    val numberOfPages: Int = 0
)

/**
 * Table of Contents Item
 */
data class TocItem(
    val title: String,
    val href: String,
    val children: List<TocItem> = emptyList()
)
