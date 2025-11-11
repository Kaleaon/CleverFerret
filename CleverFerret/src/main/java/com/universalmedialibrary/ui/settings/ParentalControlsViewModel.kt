package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.data.settings.ParentalControlsSettings.BookRatingLevel
import com.universalmedialibrary.data.settings.ParentalControlsSettings.GameRatingLevel
import com.universalmedialibrary.data.settings.ParentalControlsSettings.MovieRatingLevel
import com.universalmedialibrary.data.settings.ParentalControlsSettings.TagBlockCategory
import com.universalmedialibrary.data.settings.ParentalControlsSettings.TvRatingLevel
import com.universalmedialibrary.data.settings.ParentalControlsState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for Parental Controls Settings Screen
 */
@HiltViewModel
class ParentalControlsViewModel @Inject constructor(
    private val parentalControlsSettings: ParentalControlsSettings
) : ViewModel() {

    private val _uiState = MutableStateFlow(ParentalControlsUiState())
    val uiState: StateFlow<ParentalControlsUiState> = _uiState.asStateFlow()

    init {
        loadParentalControlsState()
    }

    /**
     * Load current parental controls state
     */
    private fun loadParentalControlsState() {
        viewModelScope.launch {
            parentalControlsSettings.parentalControlsState.collect { state ->
                _uiState.value = _uiState.value.copy(state = state)
            }
        }
    }

    /**
     * Toggle parental controls on/off
     */
    fun toggleParentalControls() {
        viewModelScope.launch {
            val currentState = _uiState.value.state
            if (currentState.enabled) {
                // Disabling - may need PIN if settings are locked
                if (currentState.lockSettings && currentState.hasPinSet) {
                    showPinDialog(PinDialogType.VERIFY)
                } else {
                    parentalControlsSettings.disable()
                }
            } else {
                // Enabling - no PIN needed
                parentalControlsSettings.enable()
            }
        }
    }

    /**
     * Show PIN dialog
     */
    fun showPinDialog(type: PinDialogType) {
        _uiState.value = _uiState.value.copy(
            showPinDialog = true,
            pinDialogType = type,
            pinError = null
        )
    }

    /**
     * Dismiss PIN dialog
     */
    fun dismissPinDialog() {
        _uiState.value = _uiState.value.copy(
            showPinDialog = false,
            pinError = null
        )
    }

    /**
     * Handle PIN dialog confirmation
     */
    fun handlePinDialog(pin: String) {
        viewModelScope.launch {
            when (_uiState.value.pinDialogType) {
                PinDialogType.SET -> {
                    // Set new PIN
                    parentalControlsSettings.setPin(pin)
                    _uiState.value = _uiState.value.copy(
                        showPinDialog = false,
                        pinError = null,
                        successMessage = "PIN set successfully"
                    )
                }
                
                PinDialogType.CHANGE -> {
                    // Change PIN
                    parentalControlsSettings.setPin(pin)
                    _uiState.value = _uiState.value.copy(
                        showPinDialog = false,
                        pinError = null,
                        successMessage = "PIN changed successfully"
                    )
                }
                
                PinDialogType.CLEAR -> {
                    // Verify PIN before clearing
                    val valid = parentalControlsSettings.verifyPin(pin)
                    if (valid) {
                        parentalControlsSettings.clearPin()
                        _uiState.value = _uiState.value.copy(
                            showPinDialog = false,
                            pinError = null,
                            successMessage = "PIN cleared"
                        )
                    } else {
                        _uiState.value = _uiState.value.copy(
                            pinError = "Incorrect PIN"
                        )
                    }
                }
                
                PinDialogType.VERIFY -> {
                    // Verify PIN for settings access
                    val valid = parentalControlsSettings.verifyPin(pin)
                    if (valid) {
                        // Allow the action (disable parental controls)
                        parentalControlsSettings.disable()
                        _uiState.value = _uiState.value.copy(
                            showPinDialog = false,
                            pinError = null
                        )
                    } else {
                        _uiState.value = _uiState.value.copy(
                            pinError = "Incorrect PIN"
                        )
                    }
                }
            }
        }
    }

    /**
     * Set block explicit content
     */
    fun setBlockExplicit(block: Boolean) {
        viewModelScope.launch {
            parentalControlsSettings.setBlockExplicit(block)
        }
    }

    /**
     * Set block mature content
     */
    fun setBlockMature(block: Boolean) {
        viewModelScope.launch {
            parentalControlsSettings.setBlockMature(block)
        }
    }

    /**
     * Set hide adult content
     */
    fun setHideAdultContent(hide: Boolean) {
        viewModelScope.launch {
            parentalControlsSettings.setHideAdultContent(hide)
        }
    }

    /**
     * Allow or disallow adult content sources
     */
    fun setAllowAdultSources(allow: Boolean) {
        viewModelScope.launch {
            parentalControlsSettings.setAllowAdultSources(allow)
        }
    }

    /**
     * Set require PIN for adult content
     */
    fun setRequirePinForAdult(require: Boolean) {
        viewModelScope.launch {
            parentalControlsSettings.setRequirePinForAdult(require)
        }
    }

    /**
     * Set lock settings
     */
    fun setLockSettings(lock: Boolean) {
        viewModelScope.launch {
            parentalControlsSettings.setLockSettings(lock)
        }
    }

    fun setMovieRatingLimit(limit: MovieRatingLevel) {
        viewModelScope.launch {
            parentalControlsSettings.setMovieRatingLimit(limit)
        }
    }

    fun setTvRatingLimit(limit: TvRatingLevel) {
        viewModelScope.launch {
            parentalControlsSettings.setTvRatingLimit(limit)
        }
    }

    fun setGameRatingLimit(limit: GameRatingLevel) {
        viewModelScope.launch {
            parentalControlsSettings.setGameRatingLimit(limit)
        }
    }

    fun setBookRatingLimit(limit: BookRatingLevel) {
        viewModelScope.launch {
            parentalControlsSettings.setBookRatingLimit(limit)
        }
    }

    fun toggleTagCategory(category: TagBlockCategory) {
        viewModelScope.launch {
            val current = _uiState.value.state.blockedTagCategories.toMutableSet()
            if (!current.add(category)) {
                current.remove(category)
            }
            parentalControlsSettings.setBlockedTagCategories(current)
        }
    }

    fun addBlockedTag(tag: String) {
        viewModelScope.launch {
            parentalControlsSettings.addBlockedTag(tag)
        }
    }

    fun removeBlockedTag(tag: String) {
        viewModelScope.launch {
            parentalControlsSettings.removeBlockedTag(tag)
        }
    }

    /**
     * Clear success message
     */
    fun clearSuccess() {
        _uiState.value = _uiState.value.copy(successMessage = null)
    }

    /**
     * Reset parental controls to defaults
     */
    fun resetToDefaults() {
        viewModelScope.launch {
            parentalControlsSettings.reset()
            _uiState.value = _uiState.value.copy(
                successMessage = "Parental controls reset"
            )
        }
    }
}

/**
 * UI State for Parental Controls Screen
 */
data class ParentalControlsUiState(
    val state: ParentalControlsState = ParentalControlsState(),
    val showPinDialog: Boolean = false,
    val pinDialogType: PinDialogType = PinDialogType.SET,
    val pinError: String? = null,
    val successMessage: String? = null
)
