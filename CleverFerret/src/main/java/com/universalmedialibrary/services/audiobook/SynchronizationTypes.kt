package com.universalmedialibrary.services.audiobook

/**
 * Common data classes for audiobook synchronization
 */

/**
 * State for general synchronization functionality used by AudiobookService
 */
data class SynchronizationState(
    val available: Boolean = false,
    val enabled: Boolean = false,
    val currentHighlight: HighlightedText? = null,
    val error: String? = null
)

/**
 * Represents highlighted text in synchronized reading
 */
data class HighlightedText(
    val text: String,
    val startPosition: Int,
    val endPosition: Int,
    val chapterIndex: Int,
    val confidence: Float = 1.0f
)

/**
 * State for synchronized reading service processing
 */
data class SyncProcessingState(
    val isProcessing: Boolean = false,
    val isReady: Boolean = false,
    val progress: Float = 0f,
    val status: String = "",
    val error: String? = null
)
