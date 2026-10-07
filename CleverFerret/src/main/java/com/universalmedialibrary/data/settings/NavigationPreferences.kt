package com.universalmedialibrary.data.settings

import kotlinx.serialization.Serializable

/**
 * User preferences related to global navigation behaviors.
 */
enum class BottomGearPosition {
    LEFT,
    RIGHT;

    companion object {
        fun fromString(value: String?): BottomGearPosition = when (value?.uppercase()) {
            "LEFT" -> LEFT
            else -> RIGHT
        }
    }
}

/**
 * Persisted configuration for bottom navigation personalization.
 *
 * @param order Preferred ordering of navigation entry ids. Items not mentioned fall back to their default order.
 * @param hidden Set of navigation entry ids that should be hidden from the bottom bar.
 * @param pinned Pinned navigation route/preference ids for the 4 primary slots.
 */
@Serializable
data class BottomBarPreferences(
    val order: List<String> = emptyList(),
    val hidden: Set<String> = emptySet(),
    val pinned: List<String> = emptyList()
) {
    companion object {
        val Default = BottomBarPreferences()
        val DefaultPinnedRoutes = listOf("home", "library_details/1", "music", "library_details/4")
        val DefaultMediaPinnedRoutes = listOf("home", "books", "music", "movies")
    }
}

/**
 * Persisted quick-access customization for the media home screen.
 *
 * @param order Preferred ordering of quick-access route ids.
 * @param favorites Set of route ids marked as pinned/favorite by the user.
 */
@Serializable
data class QuickAccessPreferences(
    val order: List<String> = emptyList(),
    val favorites: Set<String> = emptySet()
) {
    companion object {
        val Default = QuickAccessPreferences()
    }
}
