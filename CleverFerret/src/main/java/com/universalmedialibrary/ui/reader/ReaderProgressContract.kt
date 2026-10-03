package com.universalmedialibrary.ui.reader

/**
 * Shared reader progress contract used by EPUB/PDF/Comic readers.
 */
data class ReaderPositionUpdate(
    val itemId: Long,
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int = 1,
    val currentPosition: Long = 0L
) {
    val percentage: Float
        get() = if (totalPages <= 0) 0f else (currentPage.toFloat() / totalPages.toFloat()) * 100f
}

