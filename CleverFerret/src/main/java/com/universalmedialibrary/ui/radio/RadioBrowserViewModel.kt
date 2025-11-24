package com.universalmedialibrary.ui.radio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation
import com.universalmedialibrary.services.radio.RadioBrowserService
import com.universalmedialibrary.services.radio.RadioLogoService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import javax.inject.Inject
import java.io.File

@HiltViewModel
class RadioBrowserViewModel @Inject constructor(
    private val radioBrowserService: RadioBrowserService,
    private val radioStationDao: RadioStationDao,
    private val radioLogoService: RadioLogoService
) : ViewModel() {

    private val _uiState = MutableStateFlow(RadioBrowserUiState())
    val uiState: StateFlow<RadioBrowserUiState> = _uiState.asStateFlow()

    fun loadTopStations() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            try {
                val stations = radioBrowserService.fetchTopStations(limit = 50)
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    stations = stations,
                    error = null
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load stations: ${e.message}"
                )
            }
        }
    }

    fun searchStations(query: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            try {
                val stations = radioBrowserService.searchStations(query)
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    stations = stations,
                    error = null
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Search failed: ${e.message}"
                )
            }
        }
    }

    fun addStation(station: RadioStation, cacheDir: File) {
        viewModelScope.launch {
            // Save to DB
            val id = radioStationDao.insertStation(station)
            
            // Ensure logo is cached
            radioLogoService.ensureStationLogo(station.copy(id = id), cacheDir)
            
            _uiState.value = _uiState.value.copy(message = "Station added to library")
        }
    }
}

data class RadioBrowserUiState(
    val isLoading: Boolean = false,
    val stations: List<RadioStation> = emptyList(),
    val error: String? = null,
    val message: String? = null
)
