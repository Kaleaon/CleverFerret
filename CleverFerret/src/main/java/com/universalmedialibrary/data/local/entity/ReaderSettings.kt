package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for global reader settings (defaults)
 */
@Entity(tableName = "reader_settings")
data class ReaderSettingsEntity(
    @PrimaryKey
    val id: Long = 1, // Singleton for global settings

    // Theme settings
    val theme: String = "SYSTEM", // LIGHT, DARK, SEPIA, SYSTEM
    val backgroundColor: String = "#FFFFFF",
    val textColor: String = "#000000",

    // Typography settings
    val fontFamily: String = "DEFAULT", // DEFAULT, SERIF, SANS_SERIF, MONOSPACE
    val fontSize: Int = 16, // in sp
    val lineSpacing: Float = 1.2f, // line height multiplier
    val letterSpacing: Float = 0.0f, // em units

    // Layout settings
    val marginLeft: Int = 16, // in dp
    val marginRight: Int = 16, // in dp
    val marginTop: Int = 16, // in dp
    val marginBottom: Int = 16, // in dp
    val paragraphSpacing: Int = 8, // in dp

    // Reading settings
    val textAlignment: String = "JUSTIFY", // LEFT, CENTER, RIGHT, JUSTIFY
    val hyphenation: Boolean = true,
    val pageTransition: String = "SLIDE", // SLIDE, FADE, CURL, NONE
    val keepScreenOn: Boolean = true,
    val fullscreen: Boolean = false,

    // Advanced settings
    val brightness: Float = 0.5f, // 0.0 to 1.0
    val contrast: Float = 1.0f, // 0.5 to 2.0
    val nightMode: Boolean = false,
    val blueLight: Boolean = false,

    val lastModified: Long = System.currentTimeMillis()
)

/**
 * Entity for per-book reader settings overrides
 */
@Entity(
    tableName = "book_reader_settings",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["mediaId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["mediaId"], unique = true),
        Index(value = ["lastModified"])
    ]
)
data class BookReaderSettingsEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val mediaId: Long, // Reference to MediaItem

    // Theme settings overrides (null means use global)
    val theme: String? = null,
    val backgroundColor: String? = null,
    val textColor: String? = null,

    // Typography settings overrides
    val fontFamily: String? = null,
    val fontSize: Int? = null,
    val lineSpacing: Float? = null,
    val letterSpacing: Float? = null,

    // Layout settings overrides
    val marginLeft: Int? = null,
    val marginRight: Int? = null,
    val marginTop: Int? = null,
    val marginBottom: Int? = null,
    val paragraphSpacing: Int? = null,

    // Reading settings overrides
    val textAlignment: String? = null,
    val hyphenation: Boolean? = null,
    val pageTransition: String? = null,
    val keepScreenOn: Boolean? = null,
    val fullscreen: Boolean? = null,

    // Advanced settings overrides
    val brightness: Float? = null,
    val contrast: Float? = null,
    val nightMode: Boolean? = null,
    val blueLight: Boolean? = null,

    // Reading position for this book
    val currentChapter: Int = 0,
    val currentPosition: Long = 0, // Position within chapter in characters
    val totalProgress: Float = 0.0f, // 0.0 to 1.0

    val lastModified: Long = System.currentTimeMillis()
)

/**
 * Data class for combined reader settings (global + book overrides)
 */
data class ReaderSettings(
    // Theme settings
    val theme: String,
    val backgroundColor: String,
    val textColor: String,

    // Typography settings
    val fontFamily: String,
    val fontSize: Int,
    val lineSpacing: Float,
    val letterSpacing: Float,

    // Layout settings
    val marginLeft: Int,
    val marginRight: Int,
    val marginTop: Int,
    val marginBottom: Int,
    val paragraphSpacing: Int,

    // Reading settings
    val textAlignment: String,
    val hyphenation: Boolean,
    val pageTransition: String,
    val keepScreenOn: Boolean,
    val fullscreen: Boolean,

    // Advanced settings
    val brightness: Float,
    val contrast: Float,
    val nightMode: Boolean,
    val blueLight: Boolean,

    // Reading position (only for book-specific settings)
    val currentChapter: Int = 0,
    val currentPosition: Long = 0,
    val totalProgress: Float = 0.0f
) {
    companion object {
        /**
         * Merge global settings with book-specific overrides
         */
        fun merge(global: ReaderSettingsEntity, book: BookReaderSettingsEntity?): ReaderSettings {
            return ReaderSettings(
                theme = book?.theme ?: global.theme,
                backgroundColor = book?.backgroundColor ?: global.backgroundColor,
                textColor = book?.textColor ?: global.textColor,
                fontFamily = book?.fontFamily ?: global.fontFamily,
                fontSize = book?.fontSize ?: global.fontSize,
                lineSpacing = book?.lineSpacing ?: global.lineSpacing,
                letterSpacing = book?.letterSpacing ?: global.letterSpacing,
                marginLeft = book?.marginLeft ?: global.marginLeft,
                marginRight = book?.marginRight ?: global.marginRight,
                marginTop = book?.marginTop ?: global.marginTop,
                marginBottom = book?.marginBottom ?: global.marginBottom,
                paragraphSpacing = book?.paragraphSpacing ?: global.paragraphSpacing,
                textAlignment = book?.textAlignment ?: global.textAlignment,
                hyphenation = book?.hyphenation ?: global.hyphenation,
                pageTransition = book?.pageTransition ?: global.pageTransition,
                keepScreenOn = book?.keepScreenOn ?: global.keepScreenOn,
                fullscreen = book?.fullscreen ?: global.fullscreen,
                brightness = book?.brightness ?: global.brightness,
                contrast = book?.contrast ?: global.contrast,
                nightMode = book?.nightMode ?: global.nightMode,
                blueLight = book?.blueLight ?: global.blueLight,
                currentChapter = book?.currentChapter ?: 0,
                currentPosition = book?.currentPosition ?: 0,
                totalProgress = book?.totalProgress ?: 0.0f
            )
        }

        /**
         * Create default global settings
         */
        fun default(): ReaderSettingsEntity = ReaderSettingsEntity()
    }
}

/**
 * Enums for reader setting values
 */
enum class ReaderTheme {
    LIGHT, DARK, SEPIA, SYSTEM
}

enum class FontFamily {
    DEFAULT, SERIF, SANS_SERIF, MONOSPACE
}

enum class TextAlignment {
    LEFT, CENTER, RIGHT, JUSTIFY
}

enum class PageTransition {
    SLIDE, FADE, CURL, NONE
}
