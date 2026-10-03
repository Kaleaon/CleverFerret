package com.universalmedialibrary.ui.radio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

data class InternetRadioStation(
    val id: String,
    val name: String,
    val url: String,
    val genre: String,
    val bitrate: String,
    val country: String = "",
    val logoUrl: String? = null
)
