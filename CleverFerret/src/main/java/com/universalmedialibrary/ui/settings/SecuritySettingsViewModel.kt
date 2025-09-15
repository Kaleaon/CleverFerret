package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.settings.SecuritySettings
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class SecuritySettingsViewModel @Inject constructor(
    // private val settingsRepository: SettingsRepository
) : ViewModel() {

    private val _securitySettings = MutableStateFlow(SecuritySettings())
    val securitySettings: StateFlow<SecuritySettings> = _securitySettings.asStateFlow()

    fun togglePinLock() {
        viewModelScope.launch {
            val current = _securitySettings.value
            _securitySettings.value = current.copy(enablePinLock = !current.enablePinLock)
        }
    }

    fun toggleBiometric() {
        viewModelScope.launch {
            val current = _securitySettings.value
            _securitySettings.value = current.copy(enableBiometric = !current.enableBiometric)
        }
    }

    fun toggleHideInRecents() {
        viewModelScope.launch {
            val current = _securitySettings.value
            _securitySettings.value = current.copy(hideContentInRecents = !current.hideContentInRecents)
        }
    }
}