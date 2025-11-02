package com.universalmedialibrary.ui.models

import com.universalmedialibrary.ui.theme.MetallicThemeVariant
import com.universalmedialibrary.ui.theme.UnifiedThemePalette

/**
 * Comprehensive Settings Models for CleverFerret
 * 
 * These models represent all configurable app settings that can be
 * persisted using DataStore or Room database.
 */

/**
 * Font Family options for E-Reader
 */
enum class FontFamily(val displayName: String) {
    SYSTEM("System"),
    SERIF("Serif"),
    SANS_SERIF("Sans Serif"),
    MONOSPACE("Monospace"),
    CURSIVE("Cursive")
}

/**
 * Reader Theme options
 */
enum class ReaderTheme(val displayName: String) {
    LIGHT("Light"),
    SEPIA("Sepia"),
    DARK("Dark"),
    BLACK("Black")
}

/**
 * Text Alignment options
 */
enum class TextAlignment(val displayName: String) {
    LEFT("Left"),
    CENTER("Center"),
    JUSTIFY("Justify")
}

/**
 * Page Animation styles
 */
enum class PageAnimation(val displayName: String) {
    SLIDE("Slide"),
    FADE("Fade"),
    CURL("Page Curl"),
    NONE("None")
}

/**
 * Cloud Storage Providers
 */
enum class CloudProvider(val displayName: String) {
    NONE("None"),
    GOOGLE_DRIVE("Google Drive"),
    DROPBOX("Dropbox"),
    ONEDRIVE("OneDrive"),
    WEBDAV("WebDAV")
}

/**
 * Sidebar Position for navigation rail
 */
enum class SidebarPosition(val displayName: String) {
    LEFT("Left"),
    RIGHT("Right")
}

/**
 * API Keys for external services
 */
data class ApiKeys(
    val tmdbKey: String = "",
    val googleBooksKey: String = "",
    val comicVineKey: String = "",
    val spotifyClientId: String = "",
    val spotifyClientSecret: String = "",
    val musicBrainzUserAgent: String = "",
    val lastFmKey: String = "",
    val openLibraryKey: String = ""
)

/**
 * E-Reader Settings
 */
data class ReaderSettings(
    val fontSize: Float = 16f,
    val fontFamily: FontFamily = FontFamily.SERIF,
    val theme: ReaderTheme = ReaderTheme.SEPIA,
    val lineHeight: Float = 1.5f,
    val pageMargin: Float = 16f,
    val pageAnimation: PageAnimation = PageAnimation.SLIDE,
    val hyphenation: Boolean = true,
    val textAlignment: TextAlignment = TextAlignment.JUSTIFY,
    val brightnessControl: Boolean = false,
    val customBrightness: Float = 0.5f,
    val keepScreenOn: Boolean = false,
    val screenTimeoutMinutes: Int = 5, // Extended screen timeout in minutes (0 = system default)
    val volumeKeysNavigation: Boolean = true
)

/**
 * Audiobook Playback Settings
 */
data class AudiobookSettings(
    val playbackSpeed: Float = 1.0f,
    val sleepTimerMinutes: Int = 0,
    val autoPlay: Boolean = false,
    val skipSilence: Boolean = false,
    val rewindSeconds: Int = 15,
    val forwardSeconds: Int = 30,
    val rememberPosition: Boolean = true,
    val backgroundPlayback: Boolean = true
)

/**
 * Metadata Management Settings
 */
data class MetadataSettings(
    val ocrEnabled: Boolean = false,
    val nerEnabled: Boolean = false,
    val autoFetchMetadata: Boolean = true,
    val autoDownloadCovers: Boolean = true,
    val comparisonViewEnabled: Boolean = true,
    val preferLocalMetadata: Boolean = false,
    val embedMetadataInFiles: Boolean = false,
    val metadataLanguage: String = "en"
)

/**
 * Cloud Sync Settings
 */
data class CloudSyncSettings(
    val enabled: Boolean = false,
    val provider: CloudProvider = CloudProvider.NONE,
    val syncOnWifiOnly: Boolean = true,
    val syncMetadata: Boolean = true,
    val syncProgress: Boolean = true,
    val syncAnnotations: Boolean = true,
    val syncSettings: Boolean = false,
    val autoSync: Boolean = true,
    val syncInterval: Int = 60 // minutes
)

/**
 * Interface/UI Settings
 */
data class InterfaceSettings(
    val sidebarPosition: SidebarPosition = SidebarPosition.LEFT,
    val gridColumns: Int = 4,
    val themePalette: UnifiedThemePalette = UnifiedThemePalette.NAVY_GOLD,
    val metallicTheme: MetallicThemeVariant = MetallicThemeVariant.GOLD_ROYAL_BLUE,
    val enableShimmerEffects: Boolean = true,
    val dynamicColors: Boolean = false,
    val darkMode: Boolean = true,
    val showThumbnails: Boolean = true,
    val compactView: Boolean = false,
    val animationsEnabled: Boolean = true
)

/**
 * Import Settings (e.g., Calibre import)
 */
data class ImportSettings(
    val calibreDatabasePath: String = "",
    val calibreLibraryRoot: String = "",
    val autoImportOnStartup: Boolean = false,
    val importMetadata: Boolean = true,
    val importCovers: Boolean = true,
    val importSeries: Boolean = true,
    val importTags: Boolean = true,
    val importRatings: Boolean = true,
    val preserveCalibreIds: Boolean = true
)

/**
 * Master App Settings container
 */
data class AppSettings(
    val apiKeys: ApiKeys = ApiKeys(),
    val reader: ReaderSettings = ReaderSettings(),
    val audiobook: AudiobookSettings = AudiobookSettings(),
    val metadata: MetadataSettings = MetadataSettings(),
    val cloudSync: CloudSyncSettings = CloudSyncSettings(),
    val interface_: InterfaceSettings = InterfaceSettings(),
    val import: ImportSettings = ImportSettings(),
    val version: Int = 1
)
