package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.local.dao.SecuritySettingsDao
import com.universalmedialibrary.data.local.dao.GeneralSettingsDao
import com.universalmedialibrary.data.local.entity.ReaderSettingsEntity
import com.universalmedialibrary.data.local.entity.ReaderSettings
import com.universalmedialibrary.data.local.entity.SecuritySettingsEntity
import com.universalmedialibrary.data.local.entity.GeneralSettingsEntity
import com.universalmedialibrary.data.local.entity.toEntity
import com.universalmedialibrary.data.settings.ApiSettings
import com.universalmedialibrary.data.settings.BookApiSettings
import com.universalmedialibrary.data.settings.ComicApiSettings
import com.universalmedialibrary.data.settings.AudiobookApiSettings
import com.universalmedialibrary.data.settings.MovieTvApiSettings
import com.universalmedialibrary.data.settings.MusicApiSettings
import com.universalmedialibrary.data.settings.ArtworkApiSettings
import com.universalmedialibrary.data.settings.LyricsApiSettings
import com.universalmedialibrary.data.settings.SecuritySettings
import com.universalmedialibrary.data.settings.GeneralSettings
import com.universalmedialibrary.data.settings.AppTheme
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.data.settings.BottomBarPreferences
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SettingsViewModel @Inject constructor(
    private val settingsRepository: SettingsRepository,
    private val apiKeyRepository: APIKeyRepository,
    private val readerSettingsRepository: com.universalmedialibrary.data.repository.ReaderSettingsRepository,
    private val securitySettingsDao: SecuritySettingsDao,
    private val generalSettingsDao: GeneralSettingsDao
) : ViewModel() {

    private val _uiState = MutableStateFlow(SettingsUiState())
    val uiState: StateFlow<SettingsUiState> = _uiState.asStateFlow()

    private val _apiSettings = MutableStateFlow(ApiSettings())
    val apiSettings: StateFlow<ApiSettings> = _apiSettings.asStateFlow()

    private val _readerSettings = MutableStateFlow(ReaderSettings.fromEntity(ReaderSettingsEntity()))
    val readerSettings: StateFlow<ReaderSettings> = _readerSettings.asStateFlow()

    private val _securitySettings = MutableStateFlow(SecuritySettings())
    val securitySettings: StateFlow<SecuritySettings> = _securitySettings.asStateFlow()

    private val _generalSettings = MutableStateFlow(GeneralSettings())
    val generalSettings: StateFlow<GeneralSettings> = _generalSettings.asStateFlow()

    private val _showDebugBugButton = MutableStateFlow(true)
    val showDebugBugButton: StateFlow<Boolean> = _showDebugBugButton.asStateFlow()

    init {
        // Load settings from repository
        viewModelScope.launch {
            combine(
                settingsRepository.themeFlow,
                settingsRepository.darkModeFlow,
                settingsRepository.autoDownloadPodcastsFlow,
                settingsRepository.wifiOnlyDownloadsFlow,
                settingsRepository.notificationsEnabledFlow,
                settingsRepository.bottomGearPositionFlow,
                settingsRepository.miniPlayerBackgroundModeFlow,
                settingsRepository.bottomBarPreferencesFlow,
                settingsRepository.reduceMotionFlow
            ) { values: Array<Any?> ->
                createSettingsUiState(values)
            }.collect { newState ->
                _uiState.value = newState
            }
        }

        // Load API settings
        viewModelScope.launch {
            settingsRepository.apiSettingsFlow.collect { settings ->
                _apiSettings.value = settings
            }
        }

        // Load debug bug button setting
        viewModelScope.launch {
            settingsRepository.showDebugBugButtonFlow.collect { enabled ->
                _showDebugBugButton.value = enabled
            }
        }
    }

    fun setTheme(palette: ThemePalette) {
        viewModelScope.launch {
            settingsRepository.setTheme(palette)
        }
    }

    fun setDarkMode(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setDarkMode(enabled)
        }
    }

    fun setAutoDownload(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setAutoDownloadPodcasts(enabled)
        }
    }

    fun setWifiOnlyDownloads(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setWifiOnlyDownloads(enabled)
        }
    }

    fun setNotificationsEnabled(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setNotificationsEnabled(enabled)
        }
    }

    fun setBottomGearPosition(position: BottomGearPosition) {
        viewModelScope.launch {
            settingsRepository.setBottomGearPosition(position)
        }
    }

    fun setMiniPlayerBackgroundMode(mode: MiniPlayerBackgroundMode) {
        viewModelScope.launch {
            settingsRepository.setMiniPlayerBackgroundMode(mode)
        }
    }

    fun setShowDebugBugButton(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setShowDebugBugButton(enabled)
        }
    }

    fun setReduceMotion(enabled: Boolean) {
        viewModelScope.launch {
            settingsRepository.setReduceMotion(enabled)
        }
    }

    fun updateBottomBarPreferences(order: List<String>, hidden: Set<String>) {
        viewModelScope.launch {
            settingsRepository.setBottomBarPreferences(
                BottomBarPreferences(order = order, hidden = hidden)
            )
        }
    }

    fun resetBottomBarPreferences() {
        viewModelScope.launch {
            settingsRepository.setBottomBarPreferences(BottomBarPreferences.Default)
        }
    }

    fun updateBookApiSettings(settings: BookApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(bookApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated

            // Also save to APIKeyRepository for actual service usage
            if (settings.googleBooksApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("google_books", settings.googleBooksApiKey, "books")
            }
            if (settings.isbnDbApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("isbn_db", settings.isbnDbApiKey, "books")
            }
            if (settings.goodreadsApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("goodreads", settings.goodreadsApiKey, "books")
            }
            if (settings.amazonApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("amazon", settings.amazonApiKey, "books")
            }
            if (settings.libraryThingApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("library_thing", settings.libraryThingApiKey, "books")
            }
            if (settings.worldCatApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("worldcat", settings.worldCatApiKey, "books")
            }
        }
    }

    fun updateComicApiSettings(settings: ComicApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(comicApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated

            // Also save to APIKeyRepository for actual service usage
            if (settings.comicVineApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("comicvine", settings.comicVineApiKey, "comics")
            }
        }
    }

    fun updateAudiobookApiSettings(settings: AudiobookApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(audiobookApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated

            // Also save to APIKeyRepository for actual service usage
            if (settings.overDriveApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("overdrive", settings.overDriveApiKey, "audiobooks")
            }
            if (settings.audibleApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("audible", settings.audibleApiKey, "audiobooks")
            }
        }
    }

    fun updateMovieTvApiSettings(settings: MovieTvApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(movieTvApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated

            // Also save to APIKeyRepository for actual service usage
            if (settings.tmdbApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("tmdb", settings.tmdbApiKey, "movies")
            }
            if (settings.omdbApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("omdb", settings.omdbApiKey, "movies")
            }
            if (settings.imdbApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("imdb", settings.imdbApiKey, "movies")
            }
            if (settings.tvdbApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("tvdb", settings.tvdbApiKey, "movies")
            }
            if (settings.nytApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("nyt_reviews", settings.nytApiKey, "movies")
            }
            if (settings.youtubeApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("youtube", settings.youtubeApiKey, "movies")
            }
            if (settings.guideboxApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("guidebox", settings.guideboxApiKey, "movies")
            }
        }
    }

    fun updateMusicApiSettings(settings: MusicApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(musicApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated

            // Also save to APIKeyRepository for actual service usage
            if (settings.spotifyClientId.isNotBlank()) {
                apiKeyRepository.saveAPIKey("spotify", settings.spotifyClientId, "music")
            }
            if (settings.discogsApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("discogs", settings.discogsApiKey, "music")
            }
            if (settings.lastFmApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("lastfm", settings.lastFmApiKey, "music")
            }
            if (settings.audioDBApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("audiodb", settings.audioDBApiKey, "music")
            }
            if (settings.napsterApiKey.isNotBlank()) {
                apiKeyRepository.saveAPIKey("napster", settings.napsterApiKey, "music")
            }
        }
    }

    fun updateReaderSettings(settings: ReaderSettings) {
        viewModelScope.launch {
            _readerSettings.value = settings
            // Persist to repository - convert view model to entity
            readerSettingsRepository.updateGlobalSettings(settings.toEntity())
        }
    }

    fun updateSecuritySettings(settings: SecuritySettings) {
        viewModelScope.launch {
            _securitySettings.value = settings
            // Persist to database
            securitySettingsDao.insertSettings(settings.toEntity())
        }
    }

    fun updateGeneralSettings(settings: GeneralSettings) {
        viewModelScope.launch {
            _generalSettings.value = settings
            // Persist to database
            generalSettingsDao.insertSettings(settings.toEntity())
        }
    }
    
    /**
     * Convert SecuritySettings to SecuritySettingsEntity for persistence
     */
    private fun SecuritySettings.toEntity() = SecuritySettingsEntity(
        id = 1,
        requireBiometric = enableBiometric,
        lockTimeoutMinutes = (autoLockTimeout / 60000).toInt(), // Convert ms to minutes
        allowScreenshots = allowScreenshots, // Now using the actual field from SecuritySettings
        hideInRecents = hideContentInRecents,
        requireAuthForContentChanges = requireAuthForExport,
        lastUpdated = System.currentTimeMillis()
    )
    
    /**
     * Convert GeneralSettings to GeneralSettingsEntity for persistence
     * Now using actual fields from GeneralSettings data class
     */
    private fun GeneralSettings.toEntity() = GeneralSettingsEntity(
        id = 1,
        languageCode = language,
        themeMode = when(theme) {
            AppTheme.LIGHT -> "light"
            AppTheme.DARK -> "dark"
            AppTheme.SYSTEM -> "auto"
        },
        themePalette = themePalette, // Now using the actual field from GeneralSettings
        defaultFontSize = defaultFontSize, // Now using the actual field from GeneralSettings
        useDynamicColors = useDynamicColors, // Now using the actual field from GeneralSettings
        enableAnimations = enableAnimations, // Now using the actual field from GeneralSettings
        autoPlayNext = autoPlayNext, // Now using the actual field from GeneralSettings
        defaultPlaybackSpeed = defaultPlaybackSpeed, // Now using the actual field from GeneralSettings
        rememberPlaybackPosition = rememberPlaybackPosition, // Now using the actual field from GeneralSettings
        skipIntroSeconds = skipIntroSeconds, // Now using the actual field from GeneralSettings
        skipOutroSeconds = skipOutroSeconds, // Now using the actual field from GeneralSettings
        lastUpdated = System.currentTimeMillis()
    )

    @Suppress("UNCHECKED_CAST")
    private fun createSettingsUiState(values: Array<Any?>): SettingsUiState {
        val theme = values[0] as ThemePalette
        val darkMode = values[1] as Boolean
        val autoDownload = values[2] as Boolean
        val wifiOnly = values[3] as Boolean
        val notificationsEnabled = values[4] as Boolean
        val bottomGear = values[5] as BottomGearPosition
        val backgroundMode = values[6] as MiniPlayerBackgroundMode
        val bottomBarPrefs = values[7] as BottomBarPreferences
        val reduceMotion = values[8] as Boolean

        return SettingsUiState(
            selectedTheme = theme,
            darkMode = darkMode,
            autoDownloadPodcasts = autoDownload,
            wifiOnlyDownloads = wifiOnly,
            notificationsEnabled = notificationsEnabled,
            bottomGearPosition = bottomGear,
            miniPlayerBackgroundMode = backgroundMode,
            bottomBarPreferences = bottomBarPrefs,
            reduceMotion = reduceMotion
        )
    }
}

data class SettingsUiState(
    val selectedTheme: ThemePalette = ThemePalette.NAVY_GOLD,
    val darkMode: Boolean = true,
    val autoDownloadPodcasts: Boolean = false,
    val wifiOnlyDownloads: Boolean = true,
    val notificationsEnabled: Boolean = true,
    val bottomGearPosition: BottomGearPosition = BottomGearPosition.RIGHT,
    val miniPlayerBackgroundMode: MiniPlayerBackgroundMode = MiniPlayerBackgroundMode.THEME,
    val bottomBarPreferences: BottomBarPreferences = BottomBarPreferences.Default,
    val reduceMotion: Boolean = false
)
