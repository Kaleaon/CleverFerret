package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Reader settings for ebooks and documents
 *
 * Stores user preferences for reading experience including:
 * - Typography (font, size, line height)
 * - Layout (margins, alignment)
 * - Behavior (page turn animations, gestures)
 * - Display (brightness, color scheme)
 */
@Entity(tableName = "reader_settings")
data class ReaderSettingsEntity(
    @PrimaryKey
    val id: Long = 1, // Single row for global settings

    // Typography
    val fontSize: Int = 18,
    val fontFamily: String = "System Default",
    val lineHeight: Float = 1.5f,  // Line spacing multiplier
    val letterSpacing: Float = 0f,  // Letter spacing in pixels
    val fontWeight: String = "Normal",  // Normal, Medium, Bold
    
    // Layout
    val marginTop: Int = 32,      // in dp
    val marginBottom: Int = 32,   // in dp
    val marginLeft: Int = 24,     // in dp
    val marginRight: Int = 24,    // in dp
    val textAlignment: String = "Left",  // Left, Center, Justify
    val paragraphSpacing: Int = 8,  // in dp
    
    // Page Turn Settings
    val pageTurnAnimation: String = "Slide",  // Slide, Fade, Curl, None
    val pageTurnSpeed: String = "Normal",  // Slow, Normal, Fast
    val tapToTurnPages: Boolean = true,
    val swipeToTurnPages: Boolean = true,
    val volumeKeysToTurnPages: Boolean = true,
    
    // Display
    val theme: String = "Auto",  // Auto, Light, Dark, Sepia
    val brightness: Float = -1f,  // -1 for system, 0-1 for custom
    val nightMode: Boolean = false,
    val autoNightMode: Boolean = true,
    val nightModeStart: String = "22:00",
    val nightModeEnd: String = "07:00",
    
    // Reading Experience
    val enableHyphenation: Boolean = true,
    val enablePageNumbers: Boolean = true,
    val enableProgressIndicator: Boolean = true,
    val fullScreenMode: Boolean = false,
    val keepScreenOn: Boolean = true,
    
    // Advanced
    val enableDictionaryLookup: Boolean = true,
    val enableTextSelection: Boolean = true,
    val enableTranslation: Boolean = true,
    val scrollingMode: Boolean = false,  // false = page mode, true = scroll mode
    
    val updatedAt: Long = System.currentTimeMillis()
)

/**
 * Book-specific reader settings that override global settings
 */
@Entity(tableName = "book_reader_settings")
data class BookReaderSettingsEntity(
    @PrimaryKey
    val bookId: Long,
    
    // Override any global settings for this specific book
    val fontSize: Int? = null,
    val fontFamily: String? = null,
    val lineHeight: Float? = null,
    val theme: String? = null,
    val brightness: Float? = null,
    
    // Book-specific state
    val currentPage: Int = 0,
    val currentChapter: Int = 0,
    val currentPosition: Float = 0f,  // Percentage through book
    val lastReadAt: Long = System.currentTimeMillis(),
    
    val updatedAt: Long = System.currentTimeMillis()
)

/**
 * Page turn animation types
 */
enum class PageTurnAnimation {
    SLIDE,
    FADE,
    CURL,
    FLIP,
    NONE
}

/**
 * Page turn speed settings
 */
enum class PageTurnSpeed(val durationMs: Long) {
    SLOW(500),
    NORMAL(300),
    FAST(150)
}

/**
 * Reading themes
 */
enum class ReadingTheme {
    AUTO,    // Follow system
    LIGHT,   // White background
    DARK,    // Dark background
    SEPIA,   // Warm sepia tone
    NIGHT    // OLED black
}

/**
 * Text alignment options
 */
enum class TextAlignment {
    LEFT,
    CENTER,
    RIGHT,
    JUSTIFY
}
