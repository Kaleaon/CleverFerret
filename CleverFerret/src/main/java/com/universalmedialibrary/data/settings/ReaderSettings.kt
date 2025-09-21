package com.universalmedialibrary.data.settings

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents the settings for the e-reader and media viewers.
 *
 * @property id The unique identifier for the settings entry.
 * @property fontSize The font size for text rendering.
 * @property lineSpacing The line spacing for text.
 * @property fontFamily The name of the font family to use.
 * @property backgroundColor The background color of the reader.
 * @property textColor The text color.
 * @property theme The selected reader theme.
 * @property pageAnimation The animation to use for page turns.
 * @property autoScrollSpeed The speed for automatic scrolling.
 * @property autoScrollMode The mode for automatic scrolling.
 * @property keepScreenOn Whether to keep the screen on while reading.
 * @property fullScreenMode Whether to display content in full-screen mode.
 * @property showPageNumbers Whether to display page numbers.
 * @property showProgressBar Whether to display a progress bar.
 * @property marginHorizontal The horizontal margin for the reader content.
 * @property marginVertical The vertical margin for the reader content.
 * @property enableGestures Whether to enable touch gestures for navigation.
 * @property volumeKeyNavigation Whether to use the volume keys for navigation.
 * @property tapToTurn Whether to allow tapping to turn pages.
 * @property swipeToTurn Whether to allow swiping to turn pages.
 */
@Entity(tableName = "reader_settings")
data class ReaderSettings(
    @PrimaryKey
    val id: String = "default",
    val fontSize: Float = 16f,
    val lineSpacing: Float = 1.5f,
    val fontFamily: String = "Default",
    val backgroundColor: String = "#FFFFFF",
    val textColor: String = "#000000",
    val theme: ReaderTheme = ReaderTheme.LIGHT,
    val pageAnimation: PageAnimation = PageAnimation.SLIDE,
    val autoScrollSpeed: Float = 1.0f,
    val autoScrollMode: AutoScrollMode = AutoScrollMode.OFF,
    val keepScreenOn: Boolean = true,
    val fullScreenMode: Boolean = false,
    val showPageNumbers: Boolean = true,
    val showProgressBar: Boolean = true,
    val marginHorizontal: Float = 16f,
    val marginVertical: Float = 20f,
    val enableGestures: Boolean = true,
    val volumeKeyNavigation: Boolean = true,
    val tapToTurn: Boolean = true,
    val swipeToTurn: Boolean = true
)

/**
 * The available themes for the reader view.
 */
enum class ReaderTheme {
    /** A standard light theme. */
    LIGHT,
    /** A standard dark theme. */
    DARK,
    /** A sepia-toned theme for comfortable reading. */
    SEPIA,
    /** A high-contrast dark theme for night reading. */
    NIGHT
}

/**
 * The available animations for turning pages.
 */
enum class PageAnimation {
    /** No animation. */
    NONE,
    /** A horizontal sliding animation. */
    SLIDE,
    /** A cross-fade animation. */
    FADE,
    /** A 3D page-flipping animation. */
    FLIP
}

/**
 * The available modes for automatic scrolling.
 */
enum class AutoScrollMode {
    /** Automatic scrolling is disabled. */
    OFF,
    /** A slow scrolling speed. */
    SLOW,
    /** A medium scrolling speed. */
    MEDIUM,
    /** A fast scrolling speed. */
    FAST,
    /** A custom scrolling speed defined by the user. */
    CUSTOM
}