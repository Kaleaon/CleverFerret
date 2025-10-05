package com.universalmedialibrary.ui.radio

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RadioViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val radioStationDao: RadioStationDao,
    private val playbackManager: AudioPlaybackManager
) : ViewModel() {
    
    val allStations = radioStationDao.getAllStations()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
    
    val favoriteStations = radioStationDao.getFavoriteStations()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
    
    val recentlyPlayed = radioStationDao.getRecentlyPlayed()
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
    
    private val _uiState = MutableStateFlow(RadioUiState())
    val uiState: StateFlow<RadioUiState> = _uiState.asStateFlow()
    
    private val _currentStation = MutableStateFlow<RadioStation?>(null)
    val currentStation: StateFlow<RadioStation?> = _currentStation.asStateFlow()
    
    val playbackState = playbackManager.state
    
    init {
        loadDefaultStations()
    }
    
    fun playStation(station: RadioStation) {
        viewModelScope.launch {
            try {
                // Stop current playback
                playbackManager.stop()
                
                // Play new station
                val uri = Uri.parse(station.streamUrl)
                playbackManager.loadSingle(uri, playWhenReady = true)
                
                // Update current station
                _currentStation.value = station
                
                // Record play in database
                radioStationDao.recordPlay(station.id, System.currentTimeMillis())
                
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to play station: ${e.message}"
                )
            }
        }
    }
    
    fun stop() {
        playbackManager.stop()
        _currentStation.value = null
    }
    
    fun toggleFavorite(station: RadioStation) {
        viewModelScope.launch {
            radioStationDao.updateFavoriteStatus(station.id, !station.isFavorite)
        }
    }
    
    fun addCustomStation(
        name: String,
        streamUrl: String,
        description: String? = null,
        genre: String? = null
    ) {
        viewModelScope.launch {
            try {
                val station = RadioStation(
                    name = name,
                    streamUrl = streamUrl,
                    description = description,
                    genre = genre
                )
                radioStationDao.insertStation(station)
                
                _uiState.value = _uiState.value.copy(
                    error = null,
                    showAddStationDialog = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to add station: ${e.message}"
                )
            }
        }
    }
    
    fun deleteStation(station: RadioStation) {
        viewModelScope.launch {
            radioStationDao.deleteStation(station)
        }
    }
    
    fun setShowAddStationDialog(show: Boolean) {
        _uiState.value = _uiState.value.copy(showAddStationDialog = show)
    }
    
    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }
    
    private fun loadDefaultStations() {
        viewModelScope.launch {
            // Check if we have any stations
            val count = allStations.firstOrNull()?.size ?: 0
            
            if (count == 0) {
                // Add some default popular stations
                val defaultStations = listOf(
                    RadioStation(
                        name = "BBC Radio 1",
                        description = "The UK's biggest radio station",
                        streamUrl = "http://stream.live.vc.bbcmedia.co.uk/bbc_radio_one",
                        websiteUrl = "https://www.bbc.co.uk/radio1",
                        genre = "Pop",
                        country = "UK",
                        language = "English",
                        bitrate = 128,
                        codec = "aac"
                    ),
                    RadioStation(
                        name = "NPR News",
                        description = "National Public Radio news and talk",
                        streamUrl = "https://npr-ice.streamguys1.com/live.mp3",
                        websiteUrl = "https://www.npr.org",
                        genre = "News",
                        country = "USA",
                        language = "English",
                        bitrate = 128,
                        codec = "mp3"
                    ),
                    RadioStation(
                        name = "Classical KUSC",
                        description = "Classical music from Los Angeles",
                        streamUrl = "https://stream.kusc.org/kusc-mp3",
                        websiteUrl = "https://www.kusc.org",
                        genre = "Classical",
                        country = "USA",
                        language = "English",
                        bitrate = 128,
                        codec = "mp3"
                    ),
                    RadioStation(
                        name = "Jazz FM",
                        description = "Smooth jazz and soul",
                        streamUrl = "https://edge-bauerse-01-gos2.sharp-stream.com/jazz.mp3",
                        websiteUrl = "https://www.jazzfm.com",
                        genre = "Jazz",
                        country = "UK",
                        language = "English",
                        bitrate = 128,
                        codec = "mp3"
                    ),
                    RadioStation(
                        name = "SomaFM Groove Salad",
                        description = "Ambient/downtempo electronic",
                        streamUrl = "https://ice2.somafm.com/groovesalad-128-mp3",
                        websiteUrl = "https://somafm.com/groovesalad/",
                        genre = "Electronic",
                        country = "USA",
                        language = "English",
                        bitrate = 128,
                        codec = "mp3"
                    )
                )
                
                radioStationDao.insertStations(defaultStations)
            }
        }
    }
}

data class RadioUiState(
    val error: String? = null,
    val showAddStationDialog: Boolean = false
)