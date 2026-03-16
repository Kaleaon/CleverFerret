package com.universalmedialibrary.ui.oldtimeradio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.oldtimeradio.OTRSeries
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class OldTimeRadioViewModel @Inject constructor(
    private val oldTimeRadioDao: OldTimeRadioDao,
    private val importService: com.universalmedialibrary.services.oldtimeradio.OldTimeRadioImportService
) : ViewModel() {

    private val _series = MutableStateFlow<List<OTRSeries>>(emptyList())
    val series: StateFlow<List<OTRSeries>> = _series.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    init {
        viewModelScope.launch {
            val count = oldTimeRadioDao.getEpisodeCount()
            if (count == 0) {
                runCatching { importService.importFeaturedEpisodes() }
            }
            loadSeries()
        }
    }

    private fun loadSeries() {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                val seriesInfoList = oldTimeRadioDao.getAllSeries()
                
                // Convert SeriesInfo to OTRSeries with episodes
                val seriesList = seriesInfoList.map { info ->
                    val episodes = oldTimeRadioDao.getEpisodesBySeries(info.series_title)
                    OTRSeries(
                        seriesTitle = info.series_title,
                        episodeCount = info.episodeCount,
                        category = info.category,
                        genre = info.genre,
                        network = info.network,
                        firstAirDate = info.firstAirDate,
                        lastAirDate = info.lastAirDate,
                        episodes = emptyList() // Episodes loaded on-demand via Flow
                    )
                }
                
                _series.value = seriesList
            } catch (e: Exception) {
                // Handle error - could emit error state
                _series.value = emptyList()
            } finally {
                _isLoading.value = false
            }
        }
    }
}
