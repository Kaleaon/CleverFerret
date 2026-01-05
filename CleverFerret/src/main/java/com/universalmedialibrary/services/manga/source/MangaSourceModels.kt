package com.universalmedialibrary.services.manga.source

import kotlinx.serialization.Serializable

/**
 * Manga Source Models
 * 
 * Models for online manga sources and catalogues
 * Compatible with Futon/Kotatsu parser library structures
 */

/**
 * Represents a manga from an online source
 */
@Serializable
data class OnlineManga(
    val id: Long,
    val sourceId: String,
    val url: String,
    val title: String,
    val altTitle: String? = null,
    val coverUrl: String? = null,
    val largeCoverUrl: String? = null,
    val author: String? = null,
    val description: String? = null,
    val tags: List<MangaTag> = emptyList(),
    val state: MangaState = MangaState.UNKNOWN,
    val contentRating: ContentRating = ContentRating.SAFE,
    val isNsfw: Boolean = false,
    val chapters: List<MangaChapter>? = null
)

/**
 * Represents a manga chapter
 */
@Serializable
data class MangaChapter(
    val id: Long,
    val mangaId: Long,
    val name: String,
    val number: Float,
    val volume: Int = 0,
    val url: String,
    val scanlator: String? = null,
    val uploadDate: Long = 0,
    val branch: String? = null
)

/**
 * Represents a manga page
 */
@Serializable
data class MangaPage(
    val id: Long,
    val chapterId: Long,
    val url: String,
    val preview: String? = null,
    val referer: String? = null
)

/**
 * Tag/genre for categorizing manga
 */
@Serializable
data class MangaTag(
    val key: String,
    val title: String,
    val source: String? = null
)

/**
 * Publication state of manga
 */
enum class MangaState {
    ONGOING,
    FINISHED,
    ABANDONED,
    PAUSED,
    UPCOMING,
    UNKNOWN
}

/**
 * Content rating/age restriction
 */
enum class ContentRating {
    SAFE,
    SUGGESTIVE,
    NSFW
}

/**
 * Manga source configuration
 */
@Serializable
data class MangaSource(
    val id: String,
    val name: String,
    val locale: String,
    val domain: String,
    val isEnabled: Boolean = true,
    val isPinned: Boolean = false,
    val sortOrder: Int = 0,
    val contentRating: ContentRating = ContentRating.SAFE,
    val favicon: String? = null,
    val isNsfwSource: Boolean = false
)

/**
 * Filter for searching manga
 */
@Serializable
data class MangaListFilter(
    val query: String? = null,
    val tags: Set<MangaTag> = emptySet(),
    val tagsExclude: Set<MangaTag> = emptySet(),
    val locale: String? = null,
    val states: Set<MangaState> = emptySet(),
    val contentRating: Set<ContentRating> = emptySet(),
    val sortOrder: SortOrder = SortOrder.UPDATED
)

/**
 * Sort order for manga lists
 */
enum class SortOrder {
    UPDATED,
    POPULARITY,
    RATING,
    NEWEST,
    ALPHABETICAL,
    ALPHABETICAL_DESC
}

/**
 * Paged list result
 */
@Serializable
data class MangaListPage(
    val manga: List<OnlineManga>,
    val hasNextPage: Boolean = false
)

/**
 * Manga update information
 */
@Serializable
data class MangaUpdate(
    val manga: OnlineManga,
    val newChapters: List<MangaChapter>,
    val timestamp: Long = System.currentTimeMillis()
)

/**
 * Download state for chapters
 */
enum class DownloadState {
    NOT_DOWNLOADED,
    QUEUED,
    DOWNLOADING,
    DOWNLOADED,
    ERROR
}

/**
 * Chapter download information
 */
@Serializable
data class ChapterDownload(
    val chapter: MangaChapter,
    val manga: OnlineManga,
    val state: DownloadState = DownloadState.NOT_DOWNLOADED,
    val progress: Float = 0f,
    val error: String? = null
)
