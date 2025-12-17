package com.universalmedialibrary.ui.oldtimeradio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioEpisode
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class OldTimeRadioSeriesViewModel @Inject constructor(
    private val oldTimeRadioDao: OldTimeRadioDao
) : ViewModel() {

    private val _episodes = MutableStateFlow<List<OldTimeRadioEpisode>>(emptyList())
    val episodes: StateFlow<List<OldTimeRadioEpisode>> = _episodes.asStateFlow()
    
    private val _seriesTitle = MutableStateFlow<String>("")
    val seriesTitle: StateFlow<String> = _seriesTitle.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    fun loadSeries(title: String) {
        _seriesTitle.value = title
        _isLoading.value = true
        viewModelScope.launch {
            oldTimeRadioDao.getEpisodesBySeries(title).collectLatest {
                _episodes.value = it
                _isLoading.value = false
            }
        }
    }

    fun playEpisode(episode: OldTimeRadioEpisode) {
        // This would interface with the playback manager
        // For now, it's handled by the UI navigation to the player
    }
}
