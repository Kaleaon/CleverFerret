package com.universalmedialibrary.data.settings

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
