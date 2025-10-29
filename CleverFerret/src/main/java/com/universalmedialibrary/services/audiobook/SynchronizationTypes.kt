package com.universalmedialibrary.services.audiobook

/**
 * Common data classes for audiobook synchronization
 * 
 * Note: SynchronizationState and HighlightedText are defined in AudiobookModels.kt
 */

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
