package com.universalmedialibrary.data.model

/**
 * Data class representing a search result
 * 
 * Used across PDF, EPUB, and other document search implementations
 */
data class SearchResult(
    val pageNumber: Int,
    val context: String,  // Surrounding text context
    val matchPosition: Int = 0,  // Position of match within page
    val highlightStart: Int = 0,  // Start of highlight in context
    val highlightEnd: Int = 0     // End of highlight in context
)
