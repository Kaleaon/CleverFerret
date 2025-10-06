package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.settings.*
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
    private val settingsRepository: SettingsRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(SettingsUiState())
    val uiState: StateFlow<SettingsUiState> = _uiState.asStateFlow()

    private val _apiSettings = MutableStateFlow(ApiSettings())
    val apiSettings: StateFlow<ApiSettings> = _apiSettings.asStateFlow()

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
        }
    }

    fun updateComicApiSettings(settings: ComicApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(comicApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated
        }
    }

    fun updateAudiobookApiSettings(settings: AudiobookApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(audiobookApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated
        }
    }

    fun updateMovieTvApiSettings(settings: MovieTvApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(movieTvApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated
        }
    }

    fun updateMusicApiSettings(settings: MusicApiSettings) {
        viewModelScope.launch {
            val current = _apiSettings.value
            val updated = current.copy(musicApis = settings)
            settingsRepository.setApiSettings(updated)
            _apiSettings.value = updated
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
