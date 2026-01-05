package com.universalmedialibrary.services.manga.library

import kotlinx.serialization.Serializable

/**
 * Manga Library Models
 * 
 * Models for manga library, favorites, categories, and reading history
 * Inspired by Futon/Kotatsu library system
 */

/**
 * Manga in user's library
 */
@Serializable
data class LibraryManga(
    val id: Long,
    val sourceId: String,
    val url: String,
    val title: String,
    val coverUrl: String? = null,
    val author: String? = null,
    val description: String? = null,
    val categoryIds: Set<Long> = emptySet(),
    val addedAt: Long = System.currentTimeMillis(),
    val lastRead: Long = 0,
    val chaptersRead: Int = 0,
    val totalChapters: Int = 0,
    val unreadCount: Int = 0,
    val isFavorite: Boolean = false,
    val trackingIds: Map<String, String> = emptyMap() // service -> remoteId
)

/**
 * Category for organizing manga
 */
@Serializable
data class MangaCategory(
    val id: Long,
    val name: String,
    val order: Int = 0,
    val flags: Set<CategoryFlag> = emptySet(),
    val color: Int? = null,
    val mangaCount: Int = 0
)

/**
 * Category flags for behavior
 */
enum class CategoryFlag {
    INCLUDE_IN_UPDATES,    // Check for updates
    DOWNLOAD_NEW_CHAPTERS, // Auto-download new chapters
    HIDE_IF_EMPTY,         // Hide category if no manga
    DEFAULT                // Default category for new manga
}

/**
 * Reading history entry
 */
@Serializable
data class ReadingHistoryEntry(
    val id: Long,
    val mangaId: Long,
    val mangaTitle: String,
    val coverUrl: String? = null,
    val chapterId: Long,
    val chapterTitle: String,
    val page: Int,
    val totalPages: Int,
    val scroll: Int = 0,
    val timestamp: Long = System.currentTimeMillis(),
    val percent: Float = 0f
)

/**
 * Bookmark within a chapter
 */
@Serializable
data class MangaBookmark(
    val id: Long,
    val mangaId: Long,
    val chapterId: Long,
    val chapterTitle: String,
    val page: Int,
    val scroll: Int = 0,
    val createdAt: Long = System.currentTimeMillis(),
    val note: String? = null,
    val imagePreview: String? = null
)

/**
 * Download entry for offline reading
 */
@Serializable
data class MangaDownload(
    val id: Long,
    val mangaId: Long,
    val mangaTitle: String,
    val chapterId: Long,
    val chapterTitle: String,
    val chapterNumber: Float,
    val localPath: String,
    val size: Long = 0,
    val pageCount: Int = 0,
    val downloadedAt: Long = System.currentTimeMillis()
)

/**
 * Statistics for reading
 */
@Serializable
data class ReadingStatistics(
    val totalMangaRead: Int = 0,
    val totalChaptersRead: Int = 0,
    val totalPagesRead: Int = 0,
    val totalReadingTime: Long = 0, // in milliseconds
    val averageReadingSpeed: Float = 0f, // pages per minute
    val mostReadGenres: List<String> = emptyList(),
    val readingStreak: Int = 0,
    val longestStreak: Int = 0
)

/**
 * Library sort options
 */
enum class LibrarySortOrder {
    LAST_READ,
    UNREAD_COUNT,
    ALPHABETICAL,
    DATE_ADDED,
    LAST_UPDATED,
    TOTAL_CHAPTERS,
    RATING
}

/**
 * Library filter options
 */
@Serializable
data class LibraryFilter(
    val query: String? = null,
    val categories: Set<Long>? = null,
    val unreadOnly: Boolean = false,
    val downloadedOnly: Boolean = false,
    val completedOnly: Boolean = false,
    val sortOrder: LibrarySortOrder = LibrarySortOrder.LAST_READ,
    val sortDescending: Boolean = true
)
