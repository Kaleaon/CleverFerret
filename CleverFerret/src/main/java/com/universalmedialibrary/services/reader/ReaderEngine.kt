package com.universalmedialibrary.services.reader.core

import android.content.Context
import kotlinx.coroutines.flow.Flow
import android.net.Uri

/**
 * Locator represents a specific location in a book across all formats.
 * This is modeled after the Readium specification for consistent positioning.
 */
data class Locator(
    val href: String, // Chapter/page identifier
    val locations: Map<String, Any?> = emptyMap(), // Position data (CFI, page number, etc.)
    val text: String? = null // Text excerpt at this location
)

/**
 * Universal reader engine interface for all book formats.
 * Provides consistent API across EPUB, PDF, CBZ/CBR formats.
 */
interface ReaderEngine {
    val bookId: String
    val currentLocator: Flow<Locator>

    /**
     * Open a book from the specified source
     */
    suspend fun open(context: Context, source: BookSource): Result<Unit>

    /**
     * Navigate to a specific location in the book
     */
    suspend fun goTo(locator: Locator): Result<Unit>

    /**
     * Move to the next page/section
     * @return true if successful, false if at end of book
     */
    suspend fun next(): Boolean

    /**
     * Move to the previous page/section
     * @return true if successful, false if at beginning of book
     */
    suspend fun previous(): Boolean

    /**
     * Search for text within the book
     * @return list of locations where the query was found
     */
    suspend fun search(query: String): List<Locator>

    /**
     * Close the book and release resources
     */
    suspend fun close()
}

/**
 * Source for opening books - can be local files or remote streams
 */
sealed class BookSource {
    data class File(val uri: Uri) : BookSource()
    data class Stream(val url: String, val headers: Map<String, String> = emptyMap()) : BookSource()
}
