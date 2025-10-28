package com.universalmedialibrary.services

import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.webfiction.WebFictionStory
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Helper service for filtering content based on parental controls
 * 
 * Provides utilities to:
 * - Filter lists of media items
 * - Check if content should be hidden
 * - Check if content requires PIN
 * - Apply filters to various content types
 */
@Singleton
class ContentFilterHelper @Inject constructor(
    private val parentalControlsSettings: ParentalControlsSettings
) {

    /**
     * Filter a list of media items based on parental controls
     */
    suspend fun filterMediaItems(items: List<MediaItem>): List<MediaItem> {
        val state = parentalControlsSettings.parentalControlsState
            .map { it }
            .first()
        
        if (!state.enabled) {
            return items // No filtering
        }

        return items.filter { item ->
            val rating = item.contentRating
            !parentalControlsSettings.shouldHideContent(rating)
        }
    }

    /**
     * Filter flow of media items
     */
    fun filterMediaItemsFlow(itemsFlow: Flow<List<MediaItem>>): Flow<List<MediaItem>> {
        return itemsFlow.map { items ->
            val state = parentalControlsSettings.parentalControlsState
                .map { it }
                .first()
            
            if (!state.enabled) {
                items
            } else {
                items.filter { item ->
                    !parentalControlsSettings.shouldHideContent(item.contentRating)
                }
            }
        }
    }

    /**
     * Filter web fiction stories
     */
    suspend fun filterStories(stories: List<WebFictionStory>): List<WebFictionStory> {
        val state = parentalControlsSettings.parentalControlsState
            .map { it }
            .first()
        
        if (!state.enabled) {
            return stories
        }

        return stories.filter { story ->
            !parentalControlsSettings.shouldHideContent(story.rating)
        }
    }

    /**
     * Check if content should be shown (not hidden)
     */
    suspend fun shouldShowContent(rating: String?): Boolean {
        return !parentalControlsSettings.shouldHideContent(rating)
    }

    /**
     * Check if content requires PIN to access
     */
    suspend fun requiresPin(rating: String?): Boolean {
        return parentalControlsSettings.requiresPinForAccess(rating)
    }

    /**
     * Check if content is allowed (not blocked)
     */
    suspend fun isContentAllowed(rating: String?): Boolean {
        return parentalControlsSettings.isContentAllowed(rating)
    }

    /**
     * Get content status for UI display
     */
    suspend fun getContentStatus(rating: String?): ContentStatus {
        val state = parentalControlsSettings.parentalControlsState
            .map { it }
            .first()
        
        if (!state.enabled) {
            return ContentStatus.Allowed
        }

        val shouldHide = parentalControlsSettings.shouldHideContent(rating)
        if (shouldHide) {
            return ContentStatus.Hidden
        }

        val requiresPin = parentalControlsSettings.requiresPinForAccess(rating)
        if (requiresPin) {
            return ContentStatus.Locked
        }

        val allowed = parentalControlsSettings.isContentAllowed(rating)
        return if (allowed) ContentStatus.Allowed else ContentStatus.Blocked
    }

    /**
     * Extension function to get first value from Flow
     */
    private suspend fun <T> Flow<T>.first(): T {
        var result: T? = null
        this.collect { value ->
            result = value
            return@collect
        }
        return result!!
    }
}

/**
 * Content status enum for UI handling
 */
enum class ContentStatus {
    /** Content is fully accessible */
    Allowed,
    
    /** Content is blocked but visible (show blocked message) */
    Blocked,
    
    /** Content requires PIN to access (show lock icon) */
    Locked,
    
    /** Content is completely hidden (don't show at all) */
    Hidden
}

/**
 * Data class for content with filter status
 */
data class FilteredContent<T>(
    val item: T,
    val status: ContentStatus,
    val rating: String?
)
