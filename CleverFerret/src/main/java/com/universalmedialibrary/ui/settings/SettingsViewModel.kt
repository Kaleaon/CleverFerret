package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.local.entity.ReaderSettingsEntity
import com.universalmedialibrary.data.local.entity.ReaderSettings
import com.universalmedialibrary.data.local.entity.toEntity
import com.universalmedialibrary.data.settings.ApiSettings
import com.universalmedialibrary.data.settings.MusicApiSettings
import com.universalmedialibrary.data.settings.SecuritySettings
import com.universalmedialibrary.data.settings.GeneralSettings
import com.universalmedialibrary.ui.theme.ThemePalette
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
    private val readerSettingsRepository: com.universalmedialibrary.data.repository.ReaderSettingsRepository
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

    init {
        // Load settings from repository
        viewModelScope.launch {
            combine(
                settingsRepository.themeFlow,
                settingsRepository.darkModeFlow,
                settingsRepository.autoDownloadPodcastsFlow,
                settingsRepository.wifiOnlyDownloadsFlow,
                settingsRepository.notificationsEnabledFlow
            ) { theme, darkMode, autoDownload, wifiOnly, notifications ->
                SettingsUiState(
                    selectedTheme = theme,
                    darkMode = darkMode,
                    autoDownloadPodcasts = autoDownload,
                    wifiOnlyDownloads = wifiOnly,
                    notificationsEnabled = notifications
                )
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
            // Persist security settings - update individual settings in repository
            // For now, just update in-memory state since SecuritySettings hasn't been fully integrated
            // TODO: Add SecuritySettingsEntity and DAO for full persistence
        }
    }

    fun updateGeneralSettings(settings: GeneralSettings) {
        viewModelScope.launch {
            _generalSettings.value = settings
            // Persist general settings - update individual settings in repository
            // For now, just update in-memory state since GeneralSettings hasn't been fully integrated
            // TODO: Add GeneralSettingsEntity and DAO for full persistence
        }
    }
}

data class SettingsUiState(
    val selectedTheme: ThemePalette = ThemePalette.NAVY_GOLD,
    val darkMode: Boolean = true,
    val autoDownloadPodcasts: Boolean = false,
    val wifiOnlyDownloads: Boolean = true,
    val notificationsEnabled: Boolean = true
)
