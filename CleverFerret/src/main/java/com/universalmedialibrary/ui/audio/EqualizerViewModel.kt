package com.universalmedialibrary.ui.audio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.audio.ParametricEqualizer
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class EqualizerViewModel @Inject constructor(
    private val equalizer: ParametricEqualizer
) : ViewModel() {
    
    data class EqualizerUiState(
        val isInitialized: Boolean = false,
        val error: String? = null
    )
    
    private val _uiState = MutableStateFlow(EqualizerUiState())
    val uiState: StateFlow<EqualizerUiState> = _uiState.asStateFlow()
    
    val currentPreset = equalizer.currentPreset
    val enabled = equalizer.enabled
    
    fun setEnabled(enabled: Boolean) {
        equalizer.setEnabled(enabled)
    }
    
    fun applyPreset(preset: ParametricEqualizer.EQPreset) {
        viewModelScope.launch {
            equalizer.applyPreset(preset)
        }
    }
    
    fun updateBand(index: Int, gain: Float) {
        viewModelScope.launch {
            equalizer.updateBand(index, gain)
        }
    }
    
    fun savePreset(name: String, deviceId: String?) {
        viewModelScope.launch {
            val preset = equalizer.savePreset(name, deviceId)
            // TODO: Save to database via repository
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        equalizer.release()
    }
}
