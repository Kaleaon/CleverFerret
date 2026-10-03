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


@HiltViewModel
class InternetRadioViewModel @Inject constructor(
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService,
    private val audioVisualizerService: AudioVisualizerService,
    private val radioStationDao: RadioStationDao
) : ViewModel() {

    private val _sampleStations = MutableStateFlow<List<InternetRadioStation>>(emptyList())

    // Combine sample stations with DB stations
    val stations: StateFlow<List<InternetRadioStation>> = combine(
        _sampleStations,
        radioStationDao.getAllStations()
    ) { samples, dbStations ->
        val mappedDbStations = dbStations.map { 
            InternetRadioStation(
                id = "db_${it.id}",
                name = it.name,
                url = it.streamUrl ?: "",
                genre = it.genre ?: "Unknown",
                bitrate = it.bitrate?.let { br -> "$br kbps" } ?: "Unknown",
                country = it.country ?: "",
                logoUrl = it.logoUrl
            )
        }
        samples + mappedDbStations
    }.stateIn(viewModelScope, SharingStarted.Lazily, emptyList())

    private val _currentStation = MutableStateFlow<InternetRadioStation?>(null)
    val currentStation: StateFlow<InternetRadioStation?> = _currentStation.asStateFlow()

    val playbackState = musicPlayerService.playbackState
    val isPlaying: StateFlow<Boolean> = playbackState.map { it.isPlaying }.stateIn(
        scope = viewModelScope,
        started = kotlinx.coroutines.flow.SharingStarted.WhileSubscribed(5000),
        initialValue = false
    )

    // Expose visualizer state for the UI
    val visualizerState: StateFlow<com.universalmedialibrary.services.visualizer.VisualizerState> = 
        audioVisualizerService.visualizerState

    // Dynamically extract available genres from all stations
    val availableGenres: StateFlow<List<String>> = stations.map { stationList ->
        stationList.map { it.genre }.distinct().filter { it.isNotBlank() }
    }.stateIn(
        scope = viewModelScope,
        started = kotlinx.coroutines.flow.SharingStarted.WhileSubscribed(5000),
        initialValue = emptyList()
    )

    init {
        loadSampleStations()
    }
    
    companion object {
        /**
         * Delay in milliseconds to allow ExoPlayer to initialize before attaching visualizer.
         * This ensures the audio session ID is available and the player is ready to provide audio data.
         */
        private const val PLAYER_INIT_DELAY_MS = 500L
    }

    private fun loadSampleStations() {
        _sampleStations.value = buildSampleStations()
    }

    fun togglePlayback() {
        if (playbackState.value.isPlaying) {
            musicPlayerService.pause()
        } else {
            musicPlayerService.play()
        }
    }
    
    fun selectStation(station: InternetRadioStation) {
        viewModelScope.launch {
            _currentStation.value = station
            // Play the radio stream using the music player service
            musicPlayerService.playTrackFromUri(
                uri = station.url,
                title = station.name,
                artist = "Internet Radio${if (station.genre.isNotBlank()) " - ${station.genre}" else ""}",
                album = station.bitrate,
                duration = 0L, // Streams have no duration
                albumArtUrl = null
            )
            
            // Attach visualizer to the player for audio visualization
            // Wait for player initialization before attaching visualizer
            kotlinx.coroutines.delay(PLAYER_INIT_DELAY_MS)
            try {
                val exoPlayerService = musicPlayerService.getExoPlayerService()
                exoPlayerService.getPlayer()?.let { player ->
                    audioVisualizerService.attachToPlayer(player)
                }
            } catch (e: Exception) {
                // Silently fail - visualizer is optional
                android.util.Log.w("InternetRadioViewModel", "Failed to attach visualizer: ${e.message}")
            }
        }
    }
    
    fun addCustomStation(name: String, url: String, genre: String) {
        viewModelScope.launch {
            val newStation = com.universalmedialibrary.data.local.entity.RadioStation(
                name = name,
                streamUrl = url,
                genre = genre
            )
            radioStationDao.insertStation(newStation)
        }
    }
}
