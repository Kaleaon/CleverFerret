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
 */
@Serializable
data class BottomBarPreferences(
    val order: List<String> = emptyList(),
    val hidden: Set<String> = emptySet()
) {
    companion object {
        val Default = BottomBarPreferences()
    }
}
