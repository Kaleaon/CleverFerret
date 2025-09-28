package com.universalmedialibrary.widget

import android.content.Context
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

/**
 * Simplified state manager for media widget (initial implementation)
 * 
 * This provides basic functionality for the widget without full dependency injection.
 * It serves as a foundation that can be enhanced with proper DI integration later.
 */
class MediaWidgetSimpleStateManager(
    private val context: Context
) {
    
    private val _widgetState = MutableStateFlow(MediaWidgetState())
    val widgetState: StateFlow<MediaWidgetState> = _widgetState.asStateFlow()
    
    init {
        // Initialize with default state showing "no media playing"
        updateToNoMediaState()
    }
    
    /**
     * Handle widget actions - basic implementation
     */
    fun handleAction(action: WidgetAction) {
        when (action) {
            is WidgetAction.PlayPause -> {
                // Toggle play/pause state for demonstration
                val currentState = _widgetState.value
                _widgetState.value = currentState.copy(
                    isPlaying = !currentState.isPlaying,
                    hasMedia = true,
                    title = if (!currentState.hasMedia) "Sample Title" else currentState.title,
                    artist = if (!currentState.hasMedia) "Sample Artist" else currentState.artist,
                    mediaType = if (!currentState.hasMedia) MediaType.MUSIC else currentState.mediaType
                )
            }
            is WidgetAction.SkipNext -> {
                // Simulate skip next
                val currentState = _widgetState.value
                if (currentState.hasMedia) {
                    _widgetState.value = currentState.copy(
                        title = "Next Track",
                        position = 0L
                    )
                }
            }
            is WidgetAction.SkipPrevious -> {
                // Simulate skip previous
                val currentState = _widgetState.value
                if (currentState.hasMedia) {
                    _widgetState.value = currentState.copy(
                        title = "Previous Track",
                        position = 0L
                    )
                }
            }
            is WidgetAction.SeekTo -> {
                // Update position
                val currentState = _widgetState.value
                _widgetState.value = currentState.copy(position = action.position)
            }
            is WidgetAction.OpenApp -> {
                // Will be handled by widget click action
            }
        }
    }
    
    /**
     * Update to no media playing state
     */
    private fun updateToNoMediaState() {
        _widgetState.value = MediaWidgetState(
            title = "",
            artist = "",
            isPlaying = false,
            hasMedia = false,
            mediaType = MediaType.UNKNOWN,
            canSkipNext = false,
            canSkipPrevious = false
        )
    }
    
    /**
     * Simulate media loading for testing
     */
    fun loadSampleMedia() {
        _widgetState.value = MediaWidgetState(
            title = "The Great Gatsby",
            artist = "F. Scott Fitzgerald",
            isPlaying = false,
            hasMedia = true,
            mediaType = MediaType.AUDIOBOOK,
            duration = 300000L, // 5 minutes
            position = 45000L,   // 45 seconds
            canSkipNext = true,
            canSkipPrevious = true
        )
    }
}