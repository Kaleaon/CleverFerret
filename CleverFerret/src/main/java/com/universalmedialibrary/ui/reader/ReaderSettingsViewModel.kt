package com.universalmedialibrary.ui.reader

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.ReaderSettings
import com.universalmedialibrary.data.repository.ReaderSettingsRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Reader Settings Screen
 *
 * Manages:
 * - Loading and saving reader settings (global or per-book)
 * - Real-time preview updates
 * - Settings validation and persistence
 */
@HiltViewModel
class ReaderSettingsViewModel @Inject constructor(
    private val readerSettingsRepository: ReaderSettingsRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(ReaderSettingsUiState())
    val uiState: StateFlow<ReaderSettingsUiState> = _uiState.asStateFlow()

    private val _currentMediaId = MutableStateFlow<Long?>(null)

    /**
     * Reader settings flow that updates based on current media ID
     */
    val readerSettings: StateFlow<ReaderSettings> = _currentMediaId
        .flatMapLatest { mediaId ->
            if (mediaId != null) {
                readerSettingsRepository.getReaderSettingsFlow(mediaId)
            } else {
                readerSettingsRepository.getGlobalSettingsFlow().map { global ->
                    ReaderSettings.merge(global, null)
                }
            }
        }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = ReaderSettings.merge(ReaderSettings.default(), null)
        )

    /**
     * Load settings for a specific media ID (null for global settings)
     */
    fun loadSettings(mediaId: Long?) {
        _currentMediaId.value = mediaId
        _uiState.update { it.copy(mediaId = mediaId, isLoading = false) }
    }

    /**
     * Update theme setting
     */
    fun updateTheme(theme: String) {
        viewModelScope.launch {
            try {
                val mediaId = _currentMediaId.value
                readerSettingsRepository.updateTheme(mediaId, theme)

                // Apply theme (unified theming replaces backgroundColor/textColor)
                updateThemeInternal(mediaId, theme)

            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update theme: ${e.message}") }
            }
        }
    }

    /**
     * Update font family
     */
    fun updateFontFamily(fontFamily: String) {
        viewModelScope.launch {
            try {
                updateFontFamilyInternal(_currentMediaId.value, fontFamily)
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update font family: ${e.message}") }
            }
        }
    }

    /**
     * Update font size
     */
    fun updateFontSize(fontSize: Int) {
        viewModelScope.launch {
            try {
                readerSettingsRepository.updateFontSize(_currentMediaId.value, fontSize)
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update font size: ${e.message}") }
            }
        }
    }

    /**
     * Update line spacing
     */
    fun updateLineHeight(lineHeight: Float) {
        viewModelScope.launch {
            try {
                readerSettingsRepository.updateLineHeight(_currentMediaId.value, lineHeight)
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update line spacing: ${e.message}") }
            }
        }
    }

    /**
     * Update margins
     */
    fun updateMargins(margins: Margins) {
        viewModelScope.launch {
            try {
                // Margins are global settings only, not per-book
                readerSettingsRepository.updateGlobalSetting { current ->
                    current.copy(
                        marginLeft = margins.left,
                        marginRight = margins.right,
                        marginTop = margins.top,
                        marginBottom = margins.bottom
                    )
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update margins: ${e.message}") }
            }
        }
    }

    /**
     * Update text alignment
     */
    fun updateTextAlignment(alignment: String) {
        viewModelScope.launch {
            try {
                readerSettingsRepository.updateTextAlignment(_currentMediaId.value, alignment)
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update text alignment: ${e.message}") }
            }
        }
    }

    /**
     * Update brightness
     */
    fun updateBrightness(brightness: Float) {
        viewModelScope.launch {
            try {
                val mediaId = _currentMediaId.value
                if (mediaId != null) {
                    readerSettingsRepository.updateBookSetting(mediaId) { current ->
                        (current ?: com.universalmedialibrary.data.local.entity.BookReaderSettingsEntity(bookId = mediaId)).copy(
                            brightness = brightness
                        )
                    }
                } else {
                    readerSettingsRepository.updateGlobalSetting { current ->
                        current.copy(brightness = brightness)
                    }
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update brightness: ${e.message}") }
            }
        }
    }

    /**
     * Update keep screen on setting
     */
    fun updateKeepScreenOn(keepScreenOn: Boolean) {
        viewModelScope.launch {
            try {
                // keepScreenOn is global setting only, not per-book
                readerSettingsRepository.updateGlobalSetting { current ->
                    current.copy(keepScreenOn = keepScreenOn)
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to update keep screen on: ${e.message}") }
            }
        }
    }

    /**
     * Update theme setting (replaces background/text color)
     */
    private suspend fun updateThemeInternal(mediaId: Long?, theme: String) {
        if (mediaId != null) {
            readerSettingsRepository.updateBookSetting(mediaId) { current ->
                (current ?: com.universalmedialibrary.data.local.entity.BookReaderSettingsEntity(bookId = mediaId)).copy(
                    theme = theme
                )
            }
        } else {
            readerSettingsRepository.updateGlobalSetting { current ->
                current.copy(theme = theme)
            }
        }
    }

    /**
     * Update font family setting
     */
    private suspend fun updateFontFamilyInternal(mediaId: Long?, fontFamily: String) {
        if (mediaId != null) {
            readerSettingsRepository.updateBookSetting(mediaId) { current ->
                (current ?: com.universalmedialibrary.data.local.entity.BookReaderSettingsEntity(bookId = mediaId)).copy(
                    fontFamily = fontFamily
                )
            }
        } else {
            readerSettingsRepository.updateGlobalSetting { current ->
                current.copy(fontFamily = fontFamily)
            }
        }
    }

    /**
     * Reset book settings to global defaults
     */
    fun resetToGlobalDefaults() {
        viewModelScope.launch {
            try {
                val mediaId = _currentMediaId.value
                if (mediaId != null) {
                    readerSettingsRepository.removeBookSettings(mediaId)
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = "Failed to reset to defaults: ${e.message}") }
            }
        }
    }

    /**
     * Get theme colors based on theme name
     */
    private fun getThemeColors(theme: String): Pair<String, String> {
        return when (theme) {
            "LIGHT" -> "#FFFFFF" to "#000000"
            "DARK" -> "#121212" to "#E0E0E0"
            "SEPIA" -> "#F7F1E6" to "#5D4E37"
            "EINK" -> "#F5F5F0" to "#222222"
            else -> "#FFFFFF" to "#000000" // Default to light
        }
    }
}

/**
 * UI State for Reader Settings Screen
 */
data class ReaderSettingsUiState(
    val mediaId: Long? = null,
    val isLoading: Boolean = true,
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val isGlobalSettings: Boolean get() = mediaId == null
}
