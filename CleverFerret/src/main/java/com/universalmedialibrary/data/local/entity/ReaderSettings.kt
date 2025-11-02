package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
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
    
    // Enhanced Reading Features (LibreraReader-inspired)
    // Color Scheme
    val colorScheme: String = "Classic Day",  // From ReaderColorScheme options
    
    // Reading Ruler
    val rulerEnabled: Boolean = false,
    val rulerHeight: Int = 60,  // in dp
    val rulerColor: String = "#808080",  // Gray
    val rulerAlpha: Float = 0.3f,  // 0-1
    val rulerPosition: Float = 0.5f,  // 0-1, vertical position
    
    // RSVP Speed Reading
    val rsvpEnabled: Boolean = false,
    val rsvpWpm: Int = 250,  // Words per minute (100-600)
    val rsvpFontSize: Int = 32,  // sp
    
    // Enhanced Auto-Scroll
    val autoScrollEnabled: Boolean = false,
    val autoScrollSpeedMultiplier: Float = 1.0f,  // 0.1x - 5.0x
    
    val updatedAt: Long = System.currentTimeMillis()
)

/**
 * Book-specific reader settings that override global settings
 */
@Entity(
    tableName = "book_reader_settings",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["bookId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["bookId"], unique = true),
        Index(value = ["lastReadAt"])
    ]
)
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

/**
 * Auto scroll mode options
 */
enum class AutoScrollMode {
    OFF,
    SLOW,
    MEDIUM,
    FAST,
    CUSTOM
}

/**
 * Combined reader settings (view model)
 * Merges global and book-specific settings for UI
 */
data class ReaderSettings(
    val fontSize: Int,
    val fontFamily: String,
    val lineHeight: Float,
    val theme: String,
    val brightness: Float,
    val currentPage: Int,
    val currentChapter: Int,
    val currentPosition: Float,
    val lastReadAt: Long,
    val marginTop: Int,
    val marginBottom: Int,
    val marginLeft: Int,
    val marginRight: Int,
    val keepScreenOn: Boolean,
    val fullScreenMode: Boolean,
    val enablePageNumbers: Boolean = true,
    val enableProgressIndicator: Boolean = true,
    val enableHyphenation: Boolean = true,
    val tapToTurnPages: Boolean = true,
    val swipeToTurnPages: Boolean = true,
    val volumeKeysToTurnPages: Boolean = true,
    val enableGestures: Boolean = true,
    val pageAnimation: String = "None",
    val autoScrollSpeed: Int = 30,
    val autoScrollMode: String = "OFF",
    val textAlignment: String = "Left",
    
    // Enhanced Reading Features
    val colorScheme: String = "Classic Day",
    val rulerEnabled: Boolean = false,
    val rulerHeight: Int = 60,
    val rulerColor: String = "#808080",
    val rulerAlpha: Float = 0.3f,
    val rulerPosition: Float = 0.5f,
    val rsvpEnabled: Boolean = false,
    val rsvpWpm: Int = 250,
    val rsvpFontSize: Int = 32,
    val autoScrollEnabled: Boolean = false,
    val autoScrollSpeedMultiplier: Float = 1.0f
) {
    // Computed properties for backward compatibility with old UI code
    val backgroundColor: String
        get() = when (theme) {
            "Dark" -> "#000000"
            "Sepia" -> "#F4ECD8"
            "Light" -> "#FFFFFF"
            else -> "#FFFFFF" // Auto defaults to light
        }
    
    val textColor: String
        get() = when (theme) {
            "Dark" -> "#FFFFFF"
            "Sepia" -> "#5F4B32"
            "Light" -> "#000000"
            else -> "#000000" // Auto defaults to dark text
        }
    
    companion object {
        /**
         * Create default settings from global settings only
         */
        fun default(): ReaderSettingsEntity {
            return ReaderSettingsEntity()
        }

        /**
         * Convert global entity to view model (for UI that doesn't need book-specific settings)
         */
        fun fromEntity(entity: ReaderSettingsEntity): ReaderSettings {
            return ReaderSettings(
                fontSize = entity.fontSize,
                fontFamily = entity.fontFamily,
                lineHeight = entity.lineHeight,
                theme = entity.theme,
                brightness = entity.brightness,
                currentPage = 0,
                currentChapter = 0,
                currentPosition = 0f,
                lastReadAt = 0,
                marginTop = entity.marginTop,
                marginBottom = entity.marginBottom,
                marginLeft = entity.marginLeft,
                marginRight = entity.marginRight,
                keepScreenOn = entity.keepScreenOn,
                fullScreenMode = entity.fullScreenMode,
                enablePageNumbers = entity.enablePageNumbers,
                enableProgressIndicator = entity.enableProgressIndicator,
                enableHyphenation = entity.enableHyphenation,
                tapToTurnPages = entity.tapToTurnPages,
                swipeToTurnPages = entity.swipeToTurnPages,
                volumeKeysToTurnPages = entity.volumeKeysToTurnPages,
                enableGestures = entity.tapToTurnPages || entity.swipeToTurnPages, // Derived from other fields
                pageAnimation = entity.pageTurnAnimation,
                autoScrollSpeed = 30, // Default - not in entity
                autoScrollMode = "OFF", // Default - not in entity
                textAlignment = entity.textAlignment,
                
                // Enhanced Reading Features
                colorScheme = entity.colorScheme,
                rulerEnabled = entity.rulerEnabled,
                rulerHeight = entity.rulerHeight,
                rulerColor = entity.rulerColor,
                rulerAlpha = entity.rulerAlpha,
                rulerPosition = entity.rulerPosition,
                rsvpEnabled = entity.rsvpEnabled,
                rsvpWpm = entity.rsvpWpm,
                rsvpFontSize = entity.rsvpFontSize,
                autoScrollEnabled = entity.autoScrollEnabled,
                autoScrollSpeedMultiplier = entity.autoScrollSpeedMultiplier
            )
        }

        /**
         * Merge global and book-specific settings
         * Book settings override global where specified
         */
        fun merge(global: ReaderSettingsEntity, book: BookReaderSettingsEntity?): ReaderSettings {
            return ReaderSettings(
                fontSize = book?.fontSize ?: global.fontSize,
                fontFamily = book?.fontFamily ?: global.fontFamily,
                lineHeight = book?.lineHeight ?: global.lineHeight,
                theme = book?.theme ?: global.theme,
                brightness = book?.brightness ?: global.brightness,
                currentPage = book?.currentPage ?: 0,
                currentChapter = book?.currentChapter ?: 0,
                currentPosition = book?.currentPosition ?: 0f,
                lastReadAt = book?.lastReadAt ?: 0,
                marginTop = global.marginTop,
                marginBottom = global.marginBottom,
                marginLeft = global.marginLeft,
                marginRight = global.marginRight,
                keepScreenOn = global.keepScreenOn,
                fullScreenMode = global.fullScreenMode,
                enablePageNumbers = global.enablePageNumbers,
                enableProgressIndicator = global.enableProgressIndicator,
                enableHyphenation = global.enableHyphenation,
                tapToTurnPages = global.tapToTurnPages,
                swipeToTurnPages = global.swipeToTurnPages,
                volumeKeysToTurnPages = global.volumeKeysToTurnPages,
                enableGestures = global.tapToTurnPages || global.swipeToTurnPages, // Derived
                pageAnimation = global.pageTurnAnimation,
                autoScrollSpeed = 30, // Default - not in entity
                autoScrollMode = "OFF", // Default - not in entity
                textAlignment = global.textAlignment,
                
                // Enhanced Reading Features
                colorScheme = global.colorScheme,
                rulerEnabled = global.rulerEnabled,
                rulerHeight = global.rulerHeight,
                rulerColor = global.rulerColor,
                rulerAlpha = global.rulerAlpha,
                rulerPosition = global.rulerPosition,
                rsvpEnabled = global.rsvpEnabled,
                rsvpWpm = global.rsvpWpm,
                rsvpFontSize = global.rsvpFontSize,
                autoScrollEnabled = global.autoScrollEnabled,
                autoScrollSpeedMultiplier = global.autoScrollSpeedMultiplier
            )
        }
    }
}

/**
 * Convert ReaderSettings view model back to entity for persistence
 */
fun ReaderSettings.toEntity(): ReaderSettingsEntity {
    return ReaderSettingsEntity(
        id = 1L, // Global settings always use ID 1
        fontSize = this.fontSize,
        fontFamily = this.fontFamily,
        lineHeight = this.lineHeight,
        theme = this.theme,
        brightness = this.brightness,
        marginTop = this.marginTop,
        marginBottom = this.marginBottom,
        marginLeft = this.marginLeft,
        marginRight = this.marginRight,
        keepScreenOn = this.keepScreenOn,
        fullScreenMode = this.fullScreenMode,
        enablePageNumbers = this.enablePageNumbers,
        enableProgressIndicator = this.enableProgressIndicator,
        enableHyphenation = this.enableHyphenation,
        tapToTurnPages = this.tapToTurnPages,
        swipeToTurnPages = this.swipeToTurnPages,
        volumeKeysToTurnPages = this.volumeKeysToTurnPages,
        pageTurnAnimation = this.pageAnimation,
        textAlignment = this.textAlignment,
        
        // Enhanced Reading Features
        colorScheme = this.colorScheme,
        rulerEnabled = this.rulerEnabled,
        rulerHeight = this.rulerHeight,
        rulerColor = this.rulerColor,
        rulerAlpha = this.rulerAlpha,
        rulerPosition = this.rulerPosition,
        rsvpEnabled = this.rsvpEnabled,
        rsvpWpm = this.rsvpWpm,
        rsvpFontSize = this.rsvpFontSize,
        autoScrollEnabled = this.autoScrollEnabled,
        autoScrollSpeedMultiplier = this.autoScrollSpeedMultiplier
        // Note: enableGestures, autoScrollSpeed, autoScrollMode are UI-only fields not persisted
    )
}
