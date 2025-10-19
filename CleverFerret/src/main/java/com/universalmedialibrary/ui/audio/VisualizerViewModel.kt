package com.universalmedialibrary.ui.audio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.audio.visualizer.AudioVisualizer
import com.universalmedialibrary.audio.visualizer.VisualizerMode
import com.universalmedialibrary.audio.visualizer.VisualizerStyle
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class VisualizerViewModel @Inject constructor(
    private val audioVisualizer: AudioVisualizer
) : ViewModel() {
    
    val isEnabled: StateFlow<Boolean> = audioVisualizer.isEnabled
    val currentMode: StateFlow<VisualizerMode> = audioVisualizer.currentMode
    val currentStyle: StateFlow<VisualizerStyle> = audioVisualizer.currentStyle
    val visualizerData = audioVisualizer.visualizerData
    
    fun setEnabled(enabled: Boolean) {
        viewModelScope.launch {
            audioVisualizer.setEnabled(enabled)
        }
    }
    
    fun setMode(mode: VisualizerMode) {
        viewModelScope.launch {
            audioVisualizer.setMode(mode)
        }
    }
    
    fun setStyle(style: VisualizerStyle) {
        viewModelScope.launch {
            audioVisualizer.setStyle(style)
        }
    }
    
    fun initializeForAudioSession(sessionId: Int) {
        viewModelScope.launch {
            audioVisualizer.initialize(sessionId)
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        audioVisualizer.release()
    }
}
