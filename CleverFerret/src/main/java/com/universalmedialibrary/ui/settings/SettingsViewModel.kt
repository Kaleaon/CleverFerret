package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.theme.ThemePalette
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SettingsViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(SettingsUiState())
    val uiState: StateFlow<SettingsUiState> = _uiState.asStateFlow()
    
    fun setTheme(palette: ThemePalette) {
        _uiState.value = _uiState.value.copy(selectedTheme = palette)
        // TODO: Persist to SharedPreferences
    }
    
    fun setDarkMode(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(darkMode = enabled)
        // TODO: Persist to SharedPreferences
    }
    
    fun setAutoDownload(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(autoDownloadPodcasts = enabled)
        // TODO: Persist to SharedPreferences
    }
    
    fun setWifiOnlyDownloads(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(wifiOnlyDownloads = enabled)
        // TODO: Persist to SharedPreferences
    }
    
    fun setNotificationsEnabled(enabled: Boolean) {
        _uiState.value = _uiState.value.copy(notificationsEnabled = enabled)
        // TODO: Persist to SharedPreferences
    }
}

data class SettingsUiState(
    val selectedTheme: ThemePalette = ThemePalette.NAVY_GOLD,
    val darkMode: Boolean = true,
    val autoDownloadPodcasts: Boolean = false,
    val wifiOnlyDownloads: Boolean = true,
    val notificationsEnabled: Boolean = true
)