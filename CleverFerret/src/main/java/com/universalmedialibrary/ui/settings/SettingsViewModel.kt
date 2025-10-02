package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.settings.ApiSettings
import com.universalmedialibrary.data.settings.GeneralSettings
import com.universalmedialibrary.data.settings.ReaderSettings
import com.universalmedialibrary.data.settings.SecuritySettings
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.stateIn
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for managing application settings
 */
@HiltViewModel
class SettingsViewModel @Inject constructor(
    // Repository dependencies can be added here as needed
) : ViewModel() {

    private val _uiState = MutableStateFlow(SettingsUiState())
    val uiState: StateFlow<SettingsUiState> = _uiState.asStateFlow()
    
    // Expose individual settings as StateFlows for easier access
    val generalSettings: StateFlow<GeneralSettings> = 
        _uiState.map { it.generalSettings }
            .stateIn(viewModelScope, SharingStarted.Eagerly, GeneralSettings())
    
    val securitySettings: StateFlow<SecuritySettings> = 
        _uiState.map { it.securitySettings }
            .stateIn(viewModelScope, SharingStarted.Eagerly, SecuritySettings())
    
    val apiSettings: StateFlow<ApiSettings> = 
        _uiState.map { it.apiSettings }
            .stateIn(viewModelScope, SharingStarted.Eagerly, ApiSettings())
    
    val readerSettings: StateFlow<ReaderSettings> = 
        _uiState.map { it.readerSettings }
            .stateIn(viewModelScope, SharingStarted.Eagerly, ReaderSettings())

    /**
     * UI state for settings screen
     */
    data class SettingsUiState(
        val generalSettings: GeneralSettings = GeneralSettings(),
        val securitySettings: SecuritySettings = SecuritySettings(),
        val apiSettings: ApiSettings = ApiSettings(),
        val readerSettings: ReaderSettings = ReaderSettings(),
        val isLoading: Boolean = false,
        val error: String? = null
    )

    /**
     * Update general settings
     */
    fun updateGeneralSettings(settings: GeneralSettings) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(generalSettings = settings)
            // TODO: Persist settings to repository
        }
    }

    /**
     * Update security settings
     */
    fun updateSecuritySettings(settings: SecuritySettings) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(securitySettings = settings)
            // TODO: Persist settings to repository
        }
    }

    /**
     * Update API settings
     */
    fun updateApiSettings(settings: ApiSettings) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(apiSettings = settings)
            // TODO: Persist settings to repository
        }
    }

    fun updateBookApiSettings(bookApis: com.universalmedialibrary.data.settings.BookApiSettings) {
        updateApiSettings(apiSettings.value.copy(bookApis = bookApis))
    }

    fun updateComicApiSettings(comicApis: com.universalmedialibrary.data.settings.ComicApiSettings) {
        updateApiSettings(apiSettings.value.copy(comicApis = comicApis))
    }

    fun updateAudiobookApiSettings(audiobookApis: com.universalmedialibrary.data.settings.AudiobookApiSettings) {
        updateApiSettings(apiSettings.value.copy(audiobookApis = audiobookApis))
    }

    fun updateMovieTvApiSettings(movieTvApis: com.universalmedialibrary.data.settings.MovieTvApiSettings) {
        updateApiSettings(apiSettings.value.copy(movieTvApis = movieTvApis))
    }

    fun updateMusicApiSettings(musicApis: com.universalmedialibrary.data.settings.MusicApiSettings) {
        updateApiSettings(apiSettings.value.copy(musicApis = musicApis))
    }

    /**
     * Update reader settings
     */
    fun updateReaderSettings(settings: ReaderSettings) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(readerSettings = settings)
            // TODO: Persist settings to repository
        }
    }

    /**
     * Clear any error messages
     */
    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }
}
