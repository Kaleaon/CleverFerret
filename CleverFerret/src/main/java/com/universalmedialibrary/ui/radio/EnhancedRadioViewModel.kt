package com.universalmedialibrary.ui.radio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.radio.FMRadioService
import com.universalmedialibrary.services.radio.NowPlayingInfo
import com.universalmedialibrary.services.radio.RadioIdentificationService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class EnhancedRadioViewModel @Inject constructor(
    private val radioIdentificationService: RadioIdentificationService,
    private val fmRadioService: FMRadioService
) : ViewModel() {

    val nowPlaying = radioIdentificationService.nowPlaying
    val isIdentifying = radioIdentificationService.isIdentifying
    val fmRadioAvailable = fmRadioService.isAvailable

    init {
        viewModelScope.launch {
            radioIdentificationService.initialize()
        }
    }

    fun identifySong() {
        viewModelScope.launch {
            // This would capture audio and identify it
            // Requires ACRCloud or similar SDK
            
            // For now, just simulate
            radioIdentificationService.updateNowPlaying(
                NowPlayingInfo(
                    artist = "Identifying...",
                    title = "Please wait",
                    source = "Processing",
                    confidence = 0.0f,
                    timestamp = System.currentTimeMillis()
                )
            )
        }
    }
}
