package com.universalmedialibrary.services.fanfiction.models

import java.time.LocalDate

/**
 * Comprehensive metadata for a fanfiction story
 */
data class StoryMetadata(
    val title: String,
    val author: String,
    val authorUrl: String? = null,
    val summary: String,
    val rating: String? = null,
    val warnings: List<String> = emptyList(),
    val fandoms: List<String> = emptyList(),
    val characters: List<String> = emptyList(),
    val relationships: List<String> = emptyList(),
    val tags: List<String> = emptyList(),
    val language: String = "English",
    val status: CompletionStatus = CompletionStatus.UNKNOWN,
    val wordCount: Int = 0,
    val chapterCount: Int = 0,
    val publishDate: LocalDate? = null,
    val updateDate: LocalDate? = null,
    val coverUrl: String? = null,
    val sourceUrl: String,
    val sourceSite: String
)

enum class CompletionStatus {
    IN_PROGRESS,
    COMPLETE,
    HIATUS,
    ABANDONED,
    UNKNOWN
}

/**
 * Individual chapter of a story
 */
data class Chapter(
    val number: Int,
    val title: String,
    val content: String, // HTML content
    val authorNote: String? = null,
    val wordCount: Int = 0
)

/**
 * Information about available updates for a story
 */
data class UpdateInfo(
    val hasUpdates: Boolean,
    val newChapters: Int,
    val currentChapterCount: Int,
    val lastUpdateDate: LocalDate?
)
