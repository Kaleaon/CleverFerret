package com.universalmedialibrary.services

import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.webfiction.WebFictionStory
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Safety checker for download operations
 * 
 * Verifies that content being downloaded is allowed
 * under current parental controls settings
 */
@Singleton
class DownloadSafetyChecker @Inject constructor(
    private val parentalControlsSettings: ParentalControlsSettings
) {

    /**
     * Check if a download is safe to proceed
     * 
     * @param contentRating Content rating (e.g., "Explicit", "Mature", etc.)
     * @return DownloadSafetyResult with status and message
     */
    suspend fun checkDownload(
        contentRating: String?,
        contentTitle: String? = null
    ): DownloadSafetyResult {
        val state = parentalControlsSettings.parentalControlsState
            .getFirst()
        
        // If parental controls disabled, allow everything
        if (!state.enabled) {
            return DownloadSafetyResult.Allowed
        }

        // Check if content should be hidden
        if (parentalControlsSettings.shouldHideContent(contentRating)) {
            return DownloadSafetyResult.Blocked(
                reason = "This content is hidden by parental controls and cannot be downloaded."
            )
        }

        // Check if content is allowed
        if (!parentalControlsSettings.isContentAllowed(contentRating)) {
            return DownloadSafetyResult.Blocked(
                reason = "This content rating ($contentRating) is blocked by parental controls."
            )
        }

        // Check if PIN is required
        if (parentalControlsSettings.requiresPinForAccess(contentRating)) {
            return DownloadSafetyResult.RequiresPin(
                contentTitle = contentTitle ?: "content",
                contentRating = contentRating
            )
        }

        return DownloadSafetyResult.Allowed
    }

    /**
     * Bulk check multiple items (for batch downloads)
     */
    suspend fun checkBulkDownload(
        items: List<Pair<String?, String?>> // (rating, title) pairs
    ): BulkDownloadSafetyResult {
        val results = items.map { (rating, title) ->
            checkDownload(rating, title)
        }

        val blocked = results.filterIsInstance<DownloadSafetyResult.Blocked>()
        val requirePin = results.filterIsInstance<DownloadSafetyResult.RequiresPin>()
        val allowed = results.filterIsInstance<DownloadSafetyResult.Allowed>()

        return when {
            blocked.isNotEmpty() -> BulkDownloadSafetyResult.PartiallyBlocked(
                allowedCount = allowed.size,
                blockedCount = blocked.size,
                requiresPinCount = requirePin.size,
                blockedReasons = blocked.map { it.reason }
            )
            requirePin.isNotEmpty() -> BulkDownloadSafetyResult.RequiresPin(
                itemsRequiringPin = requirePin.size
            )
            else -> BulkDownloadSafetyResult.AllAllowed(
                totalCount = allowed.size
            )
        }
    }

    /**
     * Check web fiction story
     */
    suspend fun checkStoryDownload(story: WebFictionStory): DownloadSafetyResult {
        return checkDownload(story.rating, story.title)
    }

    /**
     * Verify PIN for download
     */
    suspend fun verifyPinForDownload(pin: String): Boolean {
        return parentalControlsSettings.verifyPin(pin)
    }

    /**
     * Get first element from Flow
     */
    private suspend fun <T> kotlinx.coroutines.flow.Flow<T>.getFirst(): T {
        var result: T? = null
        this.collect { value ->
            result = value
            return@collect
        }
        return result!!
    }
}

/**
 * Result of download safety check
 */
sealed class DownloadSafetyResult {
    /** Download is allowed */
    object Allowed : DownloadSafetyResult()
    
    /** Download is blocked */
    data class Blocked(val reason: String) : DownloadSafetyResult()
    
    /** Download requires PIN verification */
    data class RequiresPin(
        val contentTitle: String,
        val contentRating: String?
    ) : DownloadSafetyResult()
}

/**
 * Result of bulk download safety check
 */
sealed class BulkDownloadSafetyResult {
    /** All items allowed */
    data class AllAllowed(val totalCount: Int) : BulkDownloadSafetyResult()
    
    /** Some items blocked */
    data class PartiallyBlocked(
        val allowedCount: Int,
        val blockedCount: Int,
        val requiresPinCount: Int,
        val blockedReasons: List<String>
    ) : BulkDownloadSafetyResult()
    
    /** Items require PIN */
    data class RequiresPin(val itemsRequiringPin: Int) : BulkDownloadSafetyResult()
}

/**
 * Exception thrown when download is blocked
 */
class DownloadBlockedException(
    message: String,
    val contentRating: String?
) : Exception(message)
