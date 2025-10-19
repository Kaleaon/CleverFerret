package com.universalmedialibrary.ui.audio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.audio.DACManager
import com.universalmedialibrary.audio.DACInfo
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class DACAudioViewModel @Inject constructor(
    private val dacManager: DACManager
) : ViewModel() {
    
    val availableDevices: StateFlow<List<DACInfo>> = dacManager.availableDevices
    val selectedDevice: StateFlow<DACInfo?> = dacManager.selectedDevice
    val exclusiveModeEnabled: StateFlow<Boolean> = dacManager.exclusiveModeEnabled
    
    fun refreshDevices() {
        viewModelScope.launch {
            dacManager.refreshDevices()
        }
    }
    
    fun selectDAC(dac: DACInfo) {
        viewModelScope.launch {
            dacManager.selectDAC(dac)
        }
    }
    
    fun setExclusiveMode(enabled: Boolean) {
        viewModelScope.launch {
            dacManager.enableExclusiveMode(enabled)
        }
    }
}
