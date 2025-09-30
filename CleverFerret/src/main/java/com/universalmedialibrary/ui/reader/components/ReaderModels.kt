package com.universalmedialibrary.ui.reader.components

/**
 * Models for reader components
 */

data class Bookmark(
    val id: String,
    val position: Int,
    val page: Int?,
    val chapterTitle: String?,
    val note: String?,
    val createdAt: Long = System.currentTimeMillis()
)

data class SearchResult(
    val position: Int,
    val page: Int?,
    val context: String,
    val matchText: String,
    val beforeText: String,
    val afterText: String
)

data class TableOfContentsItem(
    val id: String,
    val title: String,
    val position: Int,
    val page: Int?,
    val level: Int = 0,
    val children: List<TableOfContentsItem> = emptyList()
)

data class ReadingStats(
    val totalPages: Int,
    val currentPage: Int,
    val readingProgress: Float,
    val timeSpentReading: Long, // in milliseconds
    val averageReadingSpeed: Float, // pages per hour
    val sessionStartTime: Long = System.currentTimeMillis(),
    val totalReadingTime: Long = 0L
)
