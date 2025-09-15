package com.universalmedialibrary.ui.reader

/**
 * Reading statistics and progress tracking
 */
data class ReadingStats(
    val totalPages: Int,
    val currentPage: Int,
    val readingProgress: Float,
    val timeSpentReading: Long, // in milliseconds
    val averageReadingSpeed: Float, // pages per hour
    val sessionStartTime: Long = System.currentTimeMillis(),
    val totalReadingTime: Long = 0L,
    val wordsRead: Int = 0,
    val averageWordsPerMinute: Float = 0f,
    val sessionsCount: Int = 0,
    val bookmarksCount: Int = 0,
    val notesCount: Int = 0
)