package com.universalmedialibrary.data.preferences

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.*
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.encodeToString
import kotlinx.serialization.decodeFromString
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Readium Navigator Preferences Store
 * 
 * Persists user reading preferences using DataStore to ensure:
 * - Preferences survive app upgrades
 * - Settings sync across devices (future)
 * - Per-book and global preferences
 * - Type-safe preference access
 * 
 * Based on Readium's Navigator Preferences system:
 * https://readium.org/kotlin-toolkit/guides/navigator-preferences/
 * 
 * Stores:
 * - EPUB preferences (font, theme, margins, etc.)
 * - PDF preferences (scroll mode, zoom, etc.)
 * - Audiobook preferences (speed, sleep timer, etc.)
 * - Comic preferences (reading mode, translation, etc.)
 * - Reading progress and bookmarks
 */
@Singleton
class ReadiumPreferencesStore @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private val Context.readiumPreferencesDataStore: DataStore<Preferences> by preferencesDataStore(
            name = "readium_preferences"
        )
        
        // EPUB Preferences Keys
        private val EPUB_FONT_FAMILY = stringPreferencesKey("epub_font_family")
        private val EPUB_FONT_SIZE = floatPreferencesKey("epub_font_size")
        private val EPUB_LINE_HEIGHT = floatPreferencesKey("epub_line_height")
        private val EPUB_THEME = stringPreferencesKey("epub_theme")
        private val EPUB_TEXT_ALIGN = stringPreferencesKey("epub_text_align")
        private val EPUB_COLUMN_COUNT = intPreferencesKey("epub_column_count")
        private val EPUB_WORD_SPACING = floatPreferencesKey("epub_word_spacing")
        private val EPUB_LETTER_SPACING = floatPreferencesKey("epub_letter_spacing")
        private val EPUB_PAGE_MARGINS = stringPreferencesKey("epub_page_margins")
        
        // PDF Preferences Keys
        private val PDF_SCROLL_MODE = stringPreferencesKey("pdf_scroll_mode")
        private val PDF_FIT_MODE = stringPreferencesKey("pdf_fit_mode")
        private val PDF_SPREAD_MODE = stringPreferencesKey("pdf_spread_mode")
        
        // Audiobook Preferences Keys
        private val AUDIOBOOK_PLAYBACK_SPEED = floatPreferencesKey("audiobook_speed")
        private val AUDIOBOOK_SLEEP_TIMER = intPreferencesKey("audiobook_sleep_timer")
        
        // Comic Preferences Keys
        private val COMIC_READING_MODE = stringPreferencesKey("comic_reading_mode")
        private val COMIC_TRANSLATION_ENABLED = booleanPreferencesKey("comic_translation_enabled")
        private val COMIC_TRANSLATION_LANG = stringPreferencesKey("comic_translation_lang")
        
        // Global Preferences Keys
        private val KEEP_SCREEN_ON = booleanPreferencesKey("keep_screen_on")
        private val AUTO_BRIGHTNESS = booleanPreferencesKey("auto_brightness")
        private val VOLUME_KEY_NAVIGATION = booleanPreferencesKey("volume_key_nav")
        
        // Per-Book Preferences (stored as JSON)
        private val BOOK_PREFERENCES_PREFIX = "book_pref_"
    }

    private val dataStore = context.readiumPreferencesDataStore
    private val json = Json { ignoreUnknownKeys = true }

    /**
     * Get EPUB preferences with fallback to defaults
     */
    val epubPreferences: Flow<EpubPreferences> = dataStore.data.map { prefs ->
        EpubPreferences(
            fontFamily = prefs[EPUB_FONT_FAMILY] ?: "serif",
            fontSize = prefs[EPUB_FONT_SIZE] ?: 100f,
            lineHeight = prefs[EPUB_LINE_HEIGHT] ?: 1.5f,
            theme = EpubTheme.valueOf(prefs[EPUB_THEME] ?: "AUTO"),
            textAlign = TextAlign.valueOf(prefs[EPUB_TEXT_ALIGN] ?: "JUSTIFY"),
            columnCount = prefs[EPUB_COLUMN_COUNT] ?: 1,
            wordSpacing = prefs[EPUB_WORD_SPACING] ?: 0f,
            letterSpacing = prefs[EPUB_LETTER_SPACING] ?: 0f,
            pageMargins = PageMargins.fromString(prefs[EPUB_PAGE_MARGINS])
        )
    }

    /**
     * Get PDF preferences
     */
    val pdfPreferences: Flow<PdfPreferences> = dataStore.data.map { prefs ->
        PdfPreferences(
            scrollMode = ScrollMode.valueOf(prefs[PDF_SCROLL_MODE] ?: "VERTICAL"),
            fitMode = FitMode.valueOf(prefs[PDF_FIT_MODE] ?: "WIDTH"),
            spreadMode = SpreadMode.valueOf(prefs[PDF_SPREAD_MODE] ?: "NONE")
        )
    }

    /**
     * Get audiobook preferences
     */
    val audiobookPreferences: Flow<AudiobookPreferences> = dataStore.data.map { prefs ->
        AudiobookPreferences(
            playbackSpeed = prefs[AUDIOBOOK_PLAYBACK_SPEED] ?: 1.0f,
            sleepTimerMinutes = prefs[AUDIOBOOK_SLEEP_TIMER] ?: 0
        )
    }

    /**
     * Get comic preferences
     */
    val comicPreferences: Flow<ComicPreferences> = dataStore.data.map { prefs ->
        ComicPreferences(
            readingMode = ReadingMode.valueOf(prefs[COMIC_READING_MODE] ?: "PAGE"),
            translationEnabled = prefs[COMIC_TRANSLATION_ENABLED] ?: false,
            translationLanguage = prefs[COMIC_TRANSLATION_LANG] ?: "en"
        )
    }

    /**
     * Get global preferences
     */
    val globalPreferences: Flow<GlobalPreferences> = dataStore.data.map { prefs ->
        GlobalPreferences(
            keepScreenOn = prefs[KEEP_SCREEN_ON] ?: false,
            autoBrightness = prefs[AUTO_BRIGHTNESS] ?: true,
            volumeKeyNavigation = prefs[VOLUME_KEY_NAVIGATION] ?: false
        )
    }

    /**
     * Save EPUB preferences
     */
    suspend fun saveEpubPreferences(preferences: EpubPreferences) {
        dataStore.edit { prefs ->
            prefs[EPUB_FONT_FAMILY] = preferences.fontFamily
            prefs[EPUB_FONT_SIZE] = preferences.fontSize
            prefs[EPUB_LINE_HEIGHT] = preferences.lineHeight
            prefs[EPUB_THEME] = preferences.theme.name
            prefs[EPUB_TEXT_ALIGN] = preferences.textAlign.name
            prefs[EPUB_COLUMN_COUNT] = preferences.columnCount
            prefs[EPUB_WORD_SPACING] = preferences.wordSpacing
            prefs[EPUB_LETTER_SPACING] = preferences.letterSpacing
            prefs[EPUB_PAGE_MARGINS] = preferences.pageMargins.toString()
        }
    }

    /**
     * Save PDF preferences
     */
    suspend fun savePdfPreferences(preferences: PdfPreferences) {
        dataStore.edit { prefs ->
            prefs[PDF_SCROLL_MODE] = preferences.scrollMode.name
            prefs[PDF_FIT_MODE] = preferences.fitMode.name
            prefs[PDF_SPREAD_MODE] = preferences.spreadMode.name
        }
    }

    /**
     * Save audiobook preferences
     */
    suspend fun saveAudiobookPreferences(preferences: AudiobookPreferences) {
        dataStore.edit { prefs ->
            prefs[AUDIOBOOK_PLAYBACK_SPEED] = preferences.playbackSpeed
            prefs[AUDIOBOOK_SLEEP_TIMER] = preferences.sleepTimerMinutes
        }
    }

    /**
     * Save comic preferences
     */
    suspend fun saveComicPreferences(preferences: ComicPreferences) {
        dataStore.edit { prefs ->
            prefs[COMIC_READING_MODE] = preferences.readingMode.name
            prefs[COMIC_TRANSLATION_ENABLED] = preferences.translationEnabled
            prefs[COMIC_TRANSLATION_LANG] = preferences.translationLanguage
        }
    }

    /**
     * Save global preferences
     */
    suspend fun saveGlobalPreferences(preferences: GlobalPreferences) {
        dataStore.edit { prefs ->
            prefs[KEEP_SCREEN_ON] = preferences.keepScreenOn
            prefs[AUTO_BRIGHTNESS] = preferences.autoBrightness
            prefs[VOLUME_KEY_NAVIGATION] = preferences.volumeKeyNavigation
        }
    }

    /**
     * Save per-book preferences (reading position, custom settings)
     */
    suspend fun saveBookPreferences(bookId: String, preferences: BookPreferences) {
        val key = stringPreferencesKey("${BOOK_PREFERENCES_PREFIX}$bookId")
        val jsonString = json.encodeToString(preferences)
        
        dataStore.edit { prefs ->
            prefs[key] = jsonString
        }
    }

    /**
     * Get per-book preferences
     */
    fun getBookPreferences(bookId: String): Flow<BookPreferences?> {
        val key = stringPreferencesKey("${BOOK_PREFERENCES_PREFIX}$bookId")
        return dataStore.data.map { prefs ->
            prefs[key]?.let { jsonString ->
                try {
                    json.decodeFromString<BookPreferences>(jsonString)
                } catch (e: Exception) {
                    null
                }
            }
        }
    }

    /**
     * Reset all preferences to defaults
     */
    suspend fun resetToDefaults() {
        dataStore.edit { it.clear() }
    }

    /**
     * Export all preferences to JSON for backup
     */
    suspend fun exportPreferences(): String {
        val allPrefs = dataStore.data.map { prefs ->
            prefs.asMap().mapKeys { it.key.name }.mapValues { it.value.toString() }
        }
        return json.encodeToString(allPrefs)
    }
}

/**
 * EPUB Reading Preferences
 * Based on Readium Navigator preferences
 */
@Serializable
data class EpubPreferences(
    val fontFamily: String = "serif",
    val fontSize: Float = 100f,
    val lineHeight: Float = 1.5f,
    val theme: EpubTheme = EpubTheme.AUTO,
    val textAlign: TextAlign = TextAlign.JUSTIFY,
    val columnCount: Int = 1,
    val wordSpacing: Float = 0f,
    val letterSpacing: Float = 0f,
    val pageMargins: PageMargins = PageMargins()
)

@Serializable
enum class EpubTheme {
    AUTO, LIGHT, DARK, SEPIA
}

@Serializable
enum class TextAlign {
    LEFT, RIGHT, CENTER, JUSTIFY, START
}

@Serializable
data class PageMargins(
    val top: Float = 20f,
    val bottom: Float = 20f,
    val left: Float = 20f,
    val right: Float = 20f
) {
    override fun toString(): String = "$top,$bottom,$left,$right"
    
    companion object {
        fun fromString(value: String?): PageMargins {
            if (value == null) return PageMargins()
            val parts = value.split(",").mapNotNull { it.toFloatOrNull() }
            return if (parts.size == 4) {
                PageMargins(parts[0], parts[1], parts[2], parts[3])
            } else {
                PageMargins()
            }
        }
    }
}

/**
 * PDF Reading Preferences
 */
@Serializable
data class PdfPreferences(
    val scrollMode: ScrollMode = ScrollMode.VERTICAL,
    val fitMode: FitMode = FitMode.WIDTH,
    val spreadMode: SpreadMode = SpreadMode.NONE
)

@Serializable
enum class ScrollMode {
    VERTICAL, HORIZONTAL, WRAPPED
}

@Serializable
enum class FitMode {
    WIDTH, HEIGHT, CONTAIN, COVER, AUTO
}

@Serializable
enum class SpreadMode {
    NONE, AUTO, ALWAYS
}

/**
 * Audiobook Playback Preferences
 */
@Serializable
data class AudiobookPreferences(
    val playbackSpeed: Float = 1.0f,
    val sleepTimerMinutes: Int = 0
)

/**
 * Comic Reading Preferences
 */
@Serializable
data class ComicPreferences(
    val readingMode: ReadingMode = ReadingMode.PAGE,
    val translationEnabled: Boolean = false,
    val translationLanguage: String = "en"
)

@Serializable
enum class ReadingMode {
    PAGE, PANEL, LONG_STRIP
}

/**
 * Global App Preferences
 */
@Serializable
data class GlobalPreferences(
    val keepScreenOn: Boolean = false,
    val autoBrightness: Boolean = true,
    val volumeKeyNavigation: Boolean = false
)

/**
 * Per-Book Preferences
 * Stores book-specific settings and reading position
 */
@Serializable
data class BookPreferences(
    val bookId: String,
    val lastReadPosition: String? = null,  // Readium Locator as JSON
    val currentPage: Int = 0,
    val currentChapter: Int = 0,
    val customFontSize: Float? = null,
    val customTheme: String? = null,
    val bookmarks: List<String> = emptyList(),  // Locators as JSON
    val highlights: List<String> = emptyList(), // Locators as JSON
    val lastReadTime: Long = System.currentTimeMillis()
)
