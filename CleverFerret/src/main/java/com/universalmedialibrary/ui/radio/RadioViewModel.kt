package com.universalmedialibrary.ui.radio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation
import com.universalmedialibrary.services.radio.NowPlayingInfo
import com.universalmedialibrary.services.radio.RadioIdentificationService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RadioViewModel @Inject constructor(
    private val radioStationDao: RadioStationDao,
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService,
    private val radioIdentificationService: RadioIdentificationService,
    private val radioBrowserService: com.universalmedialibrary.services.radio.RadioBrowserService
) : ViewModel() {
    
    // Expose now playing info from identification service
    val nowPlayingInfo: StateFlow<NowPlayingInfo?> = radioIdentificationService.nowPlaying
    val isIdentifying: StateFlow<Boolean> = radioIdentificationService.isIdentifying

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

    val playbackState = musicPlayerService.playbackState

    init {
        loadDefaultStations()
    }

    fun playStation(station: RadioStation) {
        viewModelScope.launch {
            startStationPlayback(station)
        }
    }

    fun togglePlayback() {
        if (_currentStation.value == null) {
            return
        }
        musicPlayerService.togglePlayPause()
    }

    fun playNextStation() {
        viewModelScope.launch {
            val stations = allStations.value
            if (stations.isEmpty()) return@launch

            val current = _currentStation.value
            val nextStation = if (current != null) {
                val currentIndex = stations.indexOfFirst { it.id == current.id }
                val nextIndex = if (currentIndex == -1) 0 else (currentIndex + 1) % stations.size
                stations[nextIndex]
            } else {
                stations.first()
            }
            startStationPlayback(nextStation)
        }
    }

    fun playPreviousStation() {
        viewModelScope.launch {
            val stations = allStations.value
            if (stations.isEmpty()) return@launch

            val current = _currentStation.value
            val previousStation = if (current != null) {
                val currentIndex = stations.indexOfFirst { it.id == current.id }
                val previousIndex = when {
                    currentIndex == -1 -> stations.lastIndex
                    currentIndex == 0 -> stations.lastIndex
                    else -> currentIndex - 1
                }
                stations[previousIndex]
            } else {
                stations.last()
            }
            startStationPlayback(previousStation)
        }
    }

    fun stop() {
        musicPlayerService.stop()
        _currentStation.value = null
        radioIdentificationService.clearNowPlaying()
    }

    fun toggleFavorite(station: RadioStation) {
        viewModelScope.launch {
            radioStationDao.updateFavoriteStatus(station.id, !station.isFavorite)
        }
    }
    
    /**
     * Identify currently playing song on radio
     * Uses audio fingerprinting to recognize songs
     */
    fun identifyCurrentSong() {
        viewModelScope.launch {
            val station = _currentStation.value
            if (station == null) {
                _uiState.value = _uiState.value.copy(
                    error = "No station is currently playing"
                )
                return@launch
            }
            if (isIdentifying.value) {
                return@launch
            }

            // Provide immediate feedback while identification runs (placeholder)
            radioIdentificationService.updateNowPlaying(
                NowPlayingInfo(
                    artist = station.name,
                    title = "Identifying current song…",
                    album = station.description ?: station.genre,
                    albumArt = station.logoUrl,
                    source = "Song Identification",
                    confidence = 0.0f,
                    timestamp = System.currentTimeMillis()
                )
            )

            // Audio fingerprinting requires:
            // 1. Extracting audio samples from ExoPlayer audio output
            // 2. Sending to identification service (ACRCloud, Shazam, etc.)
            // 3. Receiving metadata about the identified track
            
            // This is a placeholder implementation showing the feature interface
            radioIdentificationService.updateNowPlaying(
                NowPlayingInfo(
                    artist = "Song Recognition",
                    title = "Feature requires API key configuration",
                    albumArt = station.logoUrl,
                    source = "Audio Fingerprinting Service",
                    confidence = 0.0f,
                    timestamp = System.currentTimeMillis()
                )
            )
            
            // Full implementation would look like:
            // val audioSample = exoPlayerService.captureAudioSample()
            // val result = acrCloudService.identify(audioSample)
            // radioIdentificationService.updateNowPlaying(result.toNowPlayingInfo())
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

    private suspend fun startStationPlayback(station: RadioStation) {
        try {
            // Stop current playback
            musicPlayerService.stop()

            // Play new station via music player service
            musicPlayerService.playTrackFromUri(
                uri = station.streamUrl,
                title = station.name,
                artist = "Internet Radio${station.genre?.let { " - $it" } ?: ""}",
                album = station.description ?: station.country ?: "Radio Station",
                duration = 0L, // Streams have no duration
                albumArtUrl = station.logoUrl
            )

            // Update current station
            _currentStation.value = station

            // Record play in database
            radioStationDao.recordPlay(station.id, System.currentTimeMillis())

            updateStationNowPlayingMetadata(station)
        } catch (e: Exception) {
            _uiState.value = _uiState.value.copy(
                error = "Failed to play station: ${e.message}"
            )
        }
    }

    private fun updateStationNowPlayingMetadata(station: RadioStation) {
        radioIdentificationService.updateNowPlaying(
            NowPlayingInfo(
                artist = station.name,
                title = station.description ?: station.genre ?: "Live broadcast",
                album = station.genre ?: station.country,
                albumArt = station.logoUrl,
                source = "Station Metadata",
                confidence = 0.2f,
                timestamp = System.currentTimeMillis()
            )
        )
    }

    private fun loadDefaultStations() {
        viewModelScope.launch {
            val existingStations = radioStationDao.getAllStations().first()
            if (existingStations.isNotEmpty()) {
                return@launch
            }

            val seeded = runCatching {
                radioBrowserService.fetchTopStations(limit = 60)
            }.getOrElse { emptyList() }

            val stationsToInsert = if (seeded.isNotEmpty()) {
                seeded
            } else {
                listOf(
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
            }

            radioStationDao.insertStations(stationsToInsert)
        }
    }
}

data class RadioUiState(
    val error: String? = null,
    val showAddStationDialog: Boolean = false
)
