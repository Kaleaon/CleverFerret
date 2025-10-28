package com.universalmedialibrary.services.audiobook

/**
 * Data classes for Audiobook functionality
 */

/**
 * Audiobook chapter information
 */
data class AudioChapter(
    val index: Int,
    val title: String,
    val startTimeMs: Long,
    val durationMs: Long
)

// Type alias for consistency
typealias AudiobookChapter = AudioChapter

/**
 * Represents the current state of audiobook playback
 */
data class AudiobookState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val hasError: Boolean = false,
    val error: String? = null,
    val audiobook: Audiobook? = null,
    val currentChapter: Int = 0, // Current chapter index
    val totalChapters: Int = 0, // Total number of chapters
    val currentChapterIndex: Int = 0, // Alternative name for currentChapter
    val currentPosition: Long = 0, // milliseconds
    val currentPositionMs: Long = 0, // milliseconds (alternative name)
    val duration: Long = 0, // milliseconds
    val totalDuration: Long = 0, // milliseconds
    val isPlaying: Boolean = false,
    val playbackSpeed: Float = 1.0f,
    val skipSilenceEnabled: Boolean = false,
    val chapters: List<AudiobookChapter> = emptyList(), // List of all chapters
    val bookmarks: List<AudiobookBookmark> = emptyList()
)

/**
 * Represents an audiobook
 */
data class Audiobook(
    val id: String,
    val title: String,
    val author: String? = null,
    val narrator: String? = null,
    val description: String? = null,
    val coverPath: String? = null,
    val duration: Long = 0, // seconds
    val chapters: List<AudioChapter> = emptyList(),
    val filePath: String
)

/**
 * Represents a bookmark in an audiobook
 */
data class AudiobookBookmark(
    val id: String,
    val audiobookId: String,
    val chapterIndex: Int,
    val position: Long, // milliseconds
    val currentPosition: Long, // milliseconds (alternative name)
    val title: String,
    val note: String? = null,
    val createdAt: Long = System.currentTimeMillis()
)

/**
 * Represents the state of text synchronization for read-along
 */
data class SynchronizationState(
    val isEnabled: Boolean = false,
    val isActive: Boolean = false,
    val currentWordIndex: Int = -1,
    val currentSentenceIndex: Int = -1,
    val confidence: Float = 0f
)

/**
 * Represents synchronized text for audiobook read-along
 */
data class SynchronizedText(
    val audiobookId: String,
    val content: String,
    val timestamps: List<TextTimestamp> = emptyList()
)

/**
 * Represents a timestamp for synchronized text
 */
data class TextTimestamp(
    val startTimeMs: Long,
    val endTimeMs: Long,
    val text: String,
    val wordIndex: Int,
    val sentenceIndex: Int
)

/**
 * Represents highlighted text during read-along
 */
data class HighlightedText(
    val text: String,
    val startOffset: Int,
    val endOffset: Int,
    val timestamp: Long
)
