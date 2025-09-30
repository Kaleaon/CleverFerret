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
    val localPath: String? = null
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
