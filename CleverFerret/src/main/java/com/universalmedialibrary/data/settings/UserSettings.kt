package com.universalmedialibrary.data.settings

import kotlinx.serialization.Serializable

/**
 * Settings for reader visual customization and behavior.
 * Note: This class seems to be a duplicate of [com.universalmedialibrary.data.settings.ReaderSettings].
 *
 * @property fontSize The font size for text.
 * @property lineSpacing The spacing between lines of text.
 * @property isBold Whether to render text in bold.
 * @property isItalic Whether to render text in italics.
 * @property textColor The color of the text.
 * @property backgroundColor The background color of the reader view.
 * @property fadeEdgeEnabled Whether to show a fade effect at the edges of the content.
 * @property margins The margin around the reader content.
 * @property isDarkMode Whether dark mode is enabled.
 * @property theme The name of the selected theme ("Light", "Dark", "System").
 * @property isJustified Whether to justify the text alignment.
 * @property columnsCount The number of columns to display.
 * @property pageAnimation The animation to use for page turns.
 * @property autoScrollEnabled Whether automatic scrolling is enabled.
 * @property autoScrollSpeed The speed of automatic scrolling in pixels per second.
 * @property autoScrollMode The mode for automatic scrolling.
 * @property volumeKeyPaging Whether to use the volume keys to turn pages.
 * @property tapToPagingEnabled Whether tapping the screen turns pages.
 * @property swipeToPageEnabled Whether swiping the screen turns pages.
 * @property customGestures A map of custom gestures to actions.
 * @property ttsEnabled Whether Text-to-Speech is enabled.
 * @property ttsSpeed The speed of the Text-to-Speech voice.
 * @property ttsPitch The pitch of the Text-to-Speech voice.
 * @property ttsVoice The selected Text-to-Speech voice.
 * @property autoBookmark Whether to automatically save a bookmark on exit.
 * @property syncReadingProgress Whether to sync reading progress across devices.
 * @property highContrast Whether to use a high-contrast mode for accessibility.
 * @property dyslexiaFont Whether to use a font designed for people with dyslexia.
 * @property reduceAnimation Whether to reduce animations for accessibility.
 */
@Serializable
data class ReaderSettings(
    // Visual controls
    val fontSize: Float = 16f,
    val lineSpacing: Float = 1.5f,
    val isBold: Boolean = false,
    val isItalic: Boolean = false,
    val textColor: Int = 0xFF000000.toInt(), // Black
    val backgroundColor: Int = 0xFFFFFFFF.toInt(), // White
    val fadeEdgeEnabled: Boolean = true,
    val margins: Float = 16f,

    // Theme settings
    val isDarkMode: Boolean = false,
    val theme: String = "System", // "Light", "Dark", "System"

    // Layout and paging
    val isJustified: Boolean = false,
    val columnsCount: Int = 1,
    val pageAnimation: String = "Slide", // "Slide", "Fade", "None"

    // Auto-scroll settings
    val autoScrollEnabled: Boolean = false,
    val autoScrollSpeed: Float = 30f, // pixels per second
    val autoScrollMode: AutoScrollMode = AutoScrollMode.ROLLING_BLIND,

    // Paging controls
    val volumeKeyPaging: Boolean = true,
    val tapToPagingEnabled: Boolean = true,
    val swipeToPageEnabled: Boolean = true,
    val customGestures: Map<String, String> = emptyMap(),

    // TTS settings
    val ttsEnabled: Boolean = false,
    val ttsSpeed: Float = 1.0f,
    val ttsPitch: Float = 1.0f,
    val ttsVoice: String = "",

    // Bookmarks and progress
    val autoBookmark: Boolean = true,
    val syncReadingProgress: Boolean = false,

    // Accessibility
    val highContrast: Boolean = false,
    val dyslexiaFont: Boolean = false,
    val reduceAnimation: Boolean = false
)

/**
 * The available modes for automatic scrolling.
 * Note: This seems to be a duplicate of [com.universalmedialibrary.data.settings.AutoScrollMode].
 */
enum class AutoScrollMode {
    /** A smooth, continuous scroll, like a rolling blind. */
    ROLLING_BLIND,
    /** Scroll by a fixed number of pixels at a time. */
    BY_PIXEL,
    /** Scroll one line at a time. */
    BY_LINE
}

/**
 * A container for all application settings.
 * Note: This seems to be a duplicate of [com.universalmedialibrary.data.settings.AppSettings].
 *
 * @property apiSettings The API-related settings.
 * @property readerSettings The reader-related settings.
 * @property securitySettings The security-related settings.
 * @property generalSettings The general application settings.
 */
@Serializable
data class AppSettings(
    val apiSettings: ApiSettings = ApiSettings(),
    val readerSettings: ReaderSettings = ReaderSettings(),
    val securitySettings: SecuritySettings = SecuritySettings(),
    val generalSettings: GeneralSettings = GeneralSettings()
)

/**
 * Represents the security-related settings for the application.
 * Note: This seems to be a duplicate of [com.universalmedialibrary.data.settings.SecuritySettings].
 *
 * @property passwordProtectionEnabled Whether password protection is enabled.
 * @property passwordHash The hash of the user's password.
 * @property biometricEnabled Whether biometric unlock is enabled.
 * @property autoLockTimeout The time in milliseconds before the app automatically locks.
 */
@Serializable
data class SecuritySettings(
    val passwordProtectionEnabled: Boolean = false,
    val passwordHash: String = "",
    val biometricEnabled: Boolean = false,
    val autoLockTimeout: Long = 300000L // 5 minutes in milliseconds
)

/**
 * Represents the general application settings.
 * Note: This seems to be a duplicate of [com.universalmedialibrary.data.settings.GeneralSettings].
 *
 * @property language The selected application language.
 * @property defaultLibrary The ID of the default library to open on startup.
 * @property importOnStartup Whether to automatically import new files on startup.
 * @property notificationsEnabled Whether to show notifications.
 * @property analyticsEnabled Whether to send anonymous usage analytics.
 * @property crashReportingEnabled Whether to send crash reports.
 */
@Serializable
data class GeneralSettings(
    val language: String = "System",
    val defaultLibrary: Long? = null,
    val importOnStartup: Boolean = false,
    val notificationsEnabled: Boolean = true,
    val analyticsEnabled: Boolean = false,
    val crashReportingEnabled: Boolean = true
)