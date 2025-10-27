package com.universalmedialibrary.services.webfiction

/**
 * Data models for web fiction services
 */

data class WebFictionSite(
    val id: String,
    val name: String,
    val baseUrl: String,
    val supportedTypes: List<String>, // "fanfiction", "original", "translation"
    val isActive: Boolean = true,
    val requiresLogin: Boolean = false,
    val rateLimitDelay: Long = 1000L, // milliseconds between requests
    val customHeaders: Map<String, String> = emptyMap()
)

data class WebFictionStory(
    val id: String,
    val url: String,
    val title: String,
    val author: String?,
    val description: String?,
    val status: StoryStatus,
    val genre: String?,
    val fandom: String?,
    val language: String?,
    val wordCount: Long?,
    val chapterCount: Int?,
    val lastUpdated: Long?,
    val rating: String?,
    val warnings: List<String> = emptyList(),
    val tags: List<String> = emptyList(),
    val isCompleted: Boolean = false,
    val downloadStatus: DownloadStatus = DownloadStatus.NOT_DOWNLOADED,
    val localPath: String? = null,
    // Fields used by ViewModel
    val site: String? = null,
    val totalChapters: Int? = chapterCount,
    val coverUrl: String? = null,
    val chapters: List<WebFictionChapter> = emptyList(),
    val updatedAt: Long? = lastUpdated
)

enum class StoryStatus {
    ONGOING,
    COMPLETED,
    HIATUS,
    CANCELLED,
    UNKNOWN
}

enum class DownloadStatus {
    NOT_DOWNLOADED,
    DOWNLOADING,
    DOWNLOADED,
    FAILED,
    OUTDATED
}

data class WebFictionChapter(
    val id: String,
    val storyId: String,
    val number: Int,
    val title: String?,
    val content: String,
    val publishDate: Long?,
    val wordCount: Int?,
    val notes: String?
)

data class WebFictionDownloadProgress(
    val storyId: String,
    val totalChapters: Int,
    val downloadedChapters: Int,
    val currentChapter: String?,
    val progress: Float, // 0.0 to 1.0
    val status: DownloadStatus,
    val errorMessage: String? = null
)

sealed class WebFictionResult {
    data class Success<T>(val data: T) : WebFictionResult()
    data class Error(val message: String, val exception: Throwable? = null) : WebFictionResult()
    object Loading : WebFictionResult()
}

/**
 * Tag information for categorizing and browsing stories
 */
data class WebFictionTag(
    val id: String,
    val name: String,
    val displayName: String,
    val category: TagCategory = TagCategory.GENERAL,
    val count: Int = 0, // Number of stories with this tag
    val description: String? = null,
    val parentTag: String? = null // For hierarchical tags
)

enum class TagCategory {
    GENRE,          // Genre tags (sci-fi, romance, etc.)
    THEME,          // Theme tags (transformation, growth, etc.)
    CHARACTER,      // Character types
    RATING,         // Content rating
    STATUS,         // Story status
    TRANSFORMATION, // Transformation-specific (for Metabods)
    GENERAL         // General/uncategorized
}

/**
 * Search/filter criteria for browsing stories by tags
 */
data class StorySearchCriteria(
    val tags: List<String> = emptyList(),           // Tags to include
    val excludeTags: List<String> = emptyList(),    // Tags to exclude
    val tagMatchMode: TagMatchMode = TagMatchMode.ANY,
    val minWordCount: Long? = null,
    val maxWordCount: Long? = null,
    val status: StoryStatus? = null,
    val rating: String? = null,
    val sortBy: StorySortField = StorySortField.UPDATED,
    val sortOrder: SortOrder = SortOrder.DESCENDING,
    val limit: Int = 50,                            // Max results
    val offset: Int = 0                             // For pagination
)

enum class TagMatchMode {
    ANY,  // Match stories with ANY of the selected tags (OR)
    ALL   // Match stories with ALL selected tags (AND)
}

enum class StorySortField {
    TITLE,
    AUTHOR,
    UPDATED,
    CREATED,
    WORD_COUNT,
    CHAPTER_COUNT,
    RATING,
    VIEWS
}

enum class SortOrder {
    ASCENDING,
    DESCENDING
}

/**
 * Result of a story search/browse operation
 */
data class StorySearchResult(
    val stories: List<WebFictionStory>,
    val totalCount: Int,
    val hasMore: Boolean,
    val nextOffset: Int?
)
