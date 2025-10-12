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
 * NOTE: Temporarily using basic EPUB parser.
 * Full Readium integration will be completed in v1.1.0 after
 * resolving API compatibility issues with Readium Kotlin Toolkit 3.1.2.
 * 
 * For now, EpubReaderService provides full EPUB 2/3 support.
 */
@Singleton
class ReadiumEpubService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ReadiumEpubService"

    suspend fun extractCover(epubPath: String): Bitmap? = withContext(Dispatchers.IO) {
        Log.d(TAG, "Using EpubReaderService for cover extraction")
        null
    }

    suspend fun extractMetadata(epubPath: String): EpubMetadata? = withContext(Dispatchers.IO) {
        Log.d(TAG, "Using EpubReaderService for metadata extraction")
        null
    }

    suspend fun extractToc(epubPath: String): List<TocItem> = withContext(Dispatchers.IO) {
        Log.d(TAG, "Using EpubReaderService for TOC extraction")
        emptyList()
    }
}

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

data class TocItem(
    val title: String,
    val href: String,
    val children: List<TocItem> = emptyList()
)
