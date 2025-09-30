package com.universalmedialibrary.services.reader.model

/**
 * Supported book formats for the universal reader
 */
enum class BookFormat {
    EPUB, PDF, CBZ, CBR, UNKNOWN
}

/**
 * Enhanced book model with comprehensive metadata support
 */
data class Book(
    val id: String,
    val title: String,
    val author: String?,
    val series: String?,
    val seriesIndex: Double?,
    val format: BookFormat,
    val fileUri: String,
    val coverUri: String?,
    val language: String?,
    val tags: List<String> = emptyList(),
    val publisher: String? = null,
    val publishedDate: String? = null,
    val description: String? = null,
    val isbn: String? = null,
    val pageCount: Int? = null,
    val fileSize: Long = 0,
    val lastModified: Long = 0,
    val addedDate: Long = System.currentTimeMillis()
)

/**
 * Reading progress for a specific book
 */
data class ReadingProgress(
    val bookId: String,
    val currentLocator: String, // JSON serialized Locator
    val progressPercentage: Float,
    val currentPage: Int? = null,
    val totalPages: Int? = null,
    val lastReadTime: Long = System.currentTimeMillis()
)
