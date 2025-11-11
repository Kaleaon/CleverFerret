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
        contentTitle: String? = null,
        mediaType: String? = null,
        tags: Collection<String> = emptyList()
    ): DownloadSafetyResult =
        checkDownload(
            DownloadContentMetadata(
                rating = contentRating,
                title = contentTitle,
                mediaType = mediaType,
                tags = tags
            )
        )

    suspend fun checkDownload(metadata: DownloadContentMetadata): DownloadSafetyResult {
        val state = parentalControlsSettings.currentState()

        if (!state.enabled) {
            return DownloadSafetyResult.Allowed
        }

        if (parentalControlsSettings.shouldHideContent(
                state = state,
                rating = metadata.rating,
                mediaType = metadata.mediaType,
                tags = metadata.tags
            )
        ) {
            return DownloadSafetyResult.Blocked(
                reason = "This content is hidden by parental controls and cannot be downloaded."
            )
        }

        if (!parentalControlsSettings.isContentAllowed(
                state = state,
                rating = metadata.rating,
                mediaType = metadata.mediaType,
                tags = metadata.tags
            )
        ) {
            return DownloadSafetyResult.Blocked(
                reason = "This content rating (${metadata.rating}) is blocked by parental controls."
            )
        }

        if (!metadata.bypassPinCheck && parentalControlsSettings.requiresPinForAccess(
                state = state,
                rating = metadata.rating,
                mediaType = metadata.mediaType,
                tags = metadata.tags
            )
        ) {
            return DownloadSafetyResult.RequiresPin(
                contentTitle = metadata.title ?: "content",
                contentRating = metadata.rating
            )
        }

        return DownloadSafetyResult.Allowed
    }

    /**
     * Bulk check multiple items (for batch downloads)
     */
    suspend fun checkBulkDownload(
        items: List<DownloadContentMetadata>
    ): BulkDownloadSafetyResult {
        val results = items.map { metadata ->
            checkDownload(metadata)
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
        return checkDownload(
            DownloadContentMetadata(
                rating = story.rating,
                title = story.title,
                mediaType = "STORY",
                tags = story.tags
            )
        )
    }

    /**
     * Verify PIN for download
     */
    suspend fun verifyPinForDownload(pin: String): Boolean {
        return parentalControlsSettings.verifyPin(pin)
    }

}

data class DownloadContentMetadata(
    val rating: String?,
    val title: String? = null,
    val mediaType: String? = null,
    val tags: Collection<String> = emptyList(),
    val bypassPinCheck: Boolean = false
)

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

class ContentPinRequiredException(
    val contentTitle: String?,
    val contentRating: String?
) : IllegalStateException("Parental controls require a PIN to access this content.")
