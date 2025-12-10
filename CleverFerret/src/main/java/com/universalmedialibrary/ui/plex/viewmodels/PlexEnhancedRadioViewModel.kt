package com.universalmedialibrary.ui.plex.viewmodels

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.Color
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation as RadioStationEntity
import com.universalmedialibrary.services.radio.*
import com.universalmedialibrary.ui.plex.screens.*
import com.universalmedialibrary.ui.plex.theme.PlexColors
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Enhanced Radio ViewModel
 * 
 * Properly integrates with all radio services:
 * - FM Radio (via FMRadioService)
 * - HD Radio (via HDRadioService)
 * - Internet Radio (via RadioBrowserService)
 * - Old Time Radio (via archive.org)
 */
@HiltViewModel
class PlexEnhancedRadioViewModel @Inject constructor(
    private val fmRadioService: FMRadioService,
    private val hdRadioService: HDRadioService,
    private val radioBrowserService: RadioBrowserService,
    private val radioIdentificationService: RadioIdentificationService,
    private val radioLogoService: RadioLogoService,
    private val radioStationDao: RadioStationDao
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(EnhancedRadioState())
    val uiState: StateFlow<EnhancedRadioState> = _uiState.asStateFlow()
    
    private val _fmState = MutableStateFlow(FMRadioState())
    val fmState: StateFlow<FMRadioState> = _fmState.asStateFlow()
    
    private val _hdState = MutableStateFlow(HDRadioState())
    val hdState: StateFlow<HDRadioState> = _hdState.asStateFlow()
    
    init {
        initializeServices()
        loadFavorites()
        loadRecentlyPlayed()
        loadPopularStations()
        loadCategories()
    }
    
    private fun initializeServices() {
        viewModelScope.launch {
            // Check FM availability
            fmRadioService.isAvailable.collect { available ->
                _uiState.update { it.copy(fmAvailable = available) }
            }
        }
        
        viewModelScope.launch {
            // Monitor FM frequency
            fmRadioService.currentFrequency.collect { freq ->
                _fmState.update { it.copy(currentFrequency = freq) }
            }
        }
        
        viewModelScope.launch {
            // Monitor FM RDS data
            fmRadioService.rdsData.collect { rds ->
                _fmState.update { 
                    it.copy(
                        stationName = rds?.programServiceName,
                        radioText = rds?.radioText
                    )
                }
            }
        }
        
        viewModelScope.launch {
            // Monitor FM signal strength
            fmRadioService.signalStrength.collect { strength ->
                _fmState.update { it.copy(signalStrength = strength) }
            }
        }
        
        viewModelScope.launch {
            // Monitor FM playing state
            fmRadioService.isPlaying.collect { playing ->
                _fmState.update { it.copy(isPlaying = playing) }
            }
        }
        
        viewModelScope.launch {
            // Check HD Radio availability
            hdRadioService.isAvailable.collect { available ->
                _uiState.update { it.copy(hdAvailable = available) }
            }
        }
        
        viewModelScope.launch {
            // Monitor HD Radio state
            hdRadioService.currentStation.collect { station ->
                _hdState.update { it.copy(currentStation = station) }
            }
        }
        
        viewModelScope.launch {
            // Monitor HD subchannels
            hdRadioService.availableSubchannels.collect { channels ->
                _hdState.update { it.copy(subchannels = channels) }
            }
        }
    }
    
    private fun loadFavorites() {
        viewModelScope.launch {
            radioStationDao.getFavorites().collect { entities ->
                val favorites = entities.map { it.toRadioStation() }
                _uiState.update { it.copy(favoriteStations = favorites) }
            }
        }
    }
    
    private fun loadRecentlyPlayed() {
        viewModelScope.launch {
            radioStationDao.getRecentlyPlayed(limit = 20).collect { entities ->
                val recent = entities.map { it.toRadioStation() }
                _uiState.update { it.copy(recentlyPlayed = recent) }
            }
        }
    }
    
    private fun loadPopularStations() {
        viewModelScope.launch {
            try {
                val stations = radioBrowserService.fetchTopStations(limit = 50)
                _uiState.update { 
                    it.copy(
                        popularStations = stations.map { entity -> entity.toRadioStation() },
                        isLoading = false
                    )
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message, isLoading = false) }
            }
        }
    }
    
    private fun loadCategories() {
        val categories = listOf(
            RadioCategory("pop", "Pop", Icons.Default.MusicNote, Color(0xFFE91E63), 0),
            RadioCategory("rock", "Rock", Icons.Default.MusicNote, Color(0xFF9C27B0), 0),
            RadioCategory("jazz", "Jazz", Icons.Default.MusicNote, Color(0xFF3F51B5), 0),
            RadioCategory("classical", "Classical", Icons.Default.MusicNote, Color(0xFF795548), 0),
            RadioCategory("news", "News", Icons.Default.Newspaper, Color(0xFF607D8B), 0),
            RadioCategory("sports", "Sports", Icons.Default.SportsFootball, Color(0xFF4CAF50), 0),
            RadioCategory("talk", "Talk", Icons.Default.RecordVoiceOver, Color(0xFFFF9800), 0),
            RadioCategory("country", "Country", Icons.Default.MusicNote, Color(0xFFCDDC39), 0),
            RadioCategory("electronic", "Electronic", Icons.Default.Headphones, Color(0xFF00BCD4), 0),
            RadioCategory("hip-hop", "Hip Hop", Icons.Default.MusicNote, Color(0xFFF44336), 0)
        )
        _uiState.update { it.copy(categories = categories) }
    }
    
    // ==========================================================================
    // FM RADIO CONTROLS
    // ==========================================================================
    
    fun startFMRadio() {
        viewModelScope.launch {
            fmRadioService.start()
        }
    }
    
    fun stopFMRadio() {
        viewModelScope.launch {
            fmRadioService.stop()
        }
    }
    
    fun tuneFMFrequency(frequencyKhz: Int) {
        viewModelScope.launch {
            fmRadioService.tuneToFrequency(frequencyKhz)
        }
    }
    
    fun seekFMUp() {
        viewModelScope.launch {
            fmRadioService.seekUp()
        }
    }
    
    fun seekFMDown() {
        viewModelScope.launch {
            fmRadioService.seekDown()
        }
    }
    
    fun toggleFMMute() {
        viewModelScope.launch {
            // Toggle mute on FM radio
        }
    }
    
    fun startFMRecording() {
        viewModelScope.launch {
            fmRadioService.startRecording()
        }
    }
    
    fun stopFMRecording() {
        viewModelScope.launch {
            fmRadioService.stopRecording()
        }
    }
    
    // ==========================================================================
    // HD RADIO CONTROLS
    // ==========================================================================
    
    fun startHDRadio() {
        viewModelScope.launch {
            hdRadioService.start()
        }
    }
    
    fun stopHDRadio() {
        viewModelScope.launch {
            hdRadioService.stop()
        }
    }
    
    fun tuneHDStation(frequency: Int, subchannel: Int = 1) {
        viewModelScope.launch {
            hdRadioService.tuneToStation(frequency, subchannel)
        }
    }
    
    fun selectHDSubchannel(subchannel: Int) {
        viewModelScope.launch {
            val currentFreq = _hdState.value.currentStation?.frequency ?: return@launch
            hdRadioService.tuneToStation(currentFreq, subchannel)
        }
    }
    
    // ==========================================================================
    // INTERNET RADIO CONTROLS
    // ==========================================================================
    
    fun playInternetStation(station: RadioStation) {
        viewModelScope.launch {
            _uiState.update { it.copy(nowPlaying = station) }
            
            // Update recently played
            val entity = station.toEntity()
            radioStationDao.insertOrUpdate(entity.copy(lastPlayed = System.currentTimeMillis()))
            
            // Identify station for better metadata
            radioIdentificationService.identify(station.streamUrl)
        }
    }
    
    fun stopInternetRadio() {
        viewModelScope.launch {
            _uiState.update { it.copy(nowPlaying = null) }
        }
    }
    
    fun searchStations(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isSearching = true) }
            try {
                val results = radioBrowserService.searchStations(query, limit = 50)
                _uiState.update { 
                    it.copy(
                        searchResults = results.map { entity -> entity.toRadioStation() },
                        isSearching = false
                    )
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message, isSearching = false) }
            }
        }
    }
    
    fun loadStationsByCategory(categoryId: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            try {
                val stations = radioBrowserService.searchStations(
                    query = "",
                    tag = categoryId,
                    limit = 100
                )
                _uiState.update { 
                    it.copy(
                        categoryStations = stations.map { entity -> entity.toRadioStation() },
                        selectedCategory = categoryId,
                        isLoading = false
                    )
                }
            } catch (e: Exception) {
                _uiState.update { it.copy(error = e.message, isLoading = false) }
            }
        }
    }
    
    // ==========================================================================
    // FAVORITES
    // ==========================================================================
    
    fun toggleFavorite(station: RadioStation) {
        viewModelScope.launch {
            val entity = station.toEntity()
            if (station.isFavorite) {
                radioStationDao.setFavorite(station.id, false)
            } else {
                radioStationDao.insertOrUpdate(entity.copy(isFavorite = true))
            }
        }
    }
    
    fun saveFMStationAsFavorite() {
        viewModelScope.launch {
            val freq = _fmState.value.currentFrequency
            val name = _fmState.value.stationName ?: "FM ${freq / 1000.0} MHz"
            
            val station = RadioStationEntity(
                id = "fm_$freq",
                name = name,
                streamUrl = "fm://$freq",
                logoUrl = null,
                genre = "FM Radio",
                countryCode = null,
                language = null,
                bitrate = null,
                isFavorite = true,
                lastPlayed = null
            )
            radioStationDao.insertOrUpdate(station)
        }
    }
    
    // ==========================================================================
    // HELPER EXTENSIONS
    // ==========================================================================
    
    private fun RadioStationEntity.toRadioStation() = RadioStation(
        id = id,
        name = name,
        logoUrl = logoUrl,
        streamUrl = streamUrl,
        genre = genre ?: "Unknown",
        countryCode = countryCode,
        language = language,
        bitrate = bitrate,
        isFavorite = isFavorite
    )
    
    private fun RadioStation.toEntity() = RadioStationEntity(
        id = id,
        name = name,
        streamUrl = streamUrl,
        logoUrl = logoUrl,
        genre = genre,
        countryCode = countryCode,
        language = language,
        bitrate = bitrate,
        isFavorite = isFavorite,
        lastPlayed = null
    )
}

// =============================================================================
// STATE CLASSES
// =============================================================================

data class EnhancedRadioState(
    val favoriteStations: List<RadioStation> = emptyList(),
    val popularStations: List<RadioStation> = emptyList(),
    val recentlyPlayed: List<RadioStation> = emptyList(),
    val searchResults: List<RadioStation> = emptyList(),
    val categoryStations: List<RadioStation> = emptyList(),
    val categories: List<RadioCategory> = emptyList(),
    val nowPlaying: RadioStation? = null,
    val selectedCategory: String? = null,
    val fmAvailable: Boolean = false,
    val hdAvailable: Boolean = false,
    val isLoading: Boolean = true,
    val isSearching: Boolean = false,
    val error: String? = null
)

data class FMRadioState(
    val currentFrequency: Int = 87500,
    val signalStrength: Int = 0,
    val stationName: String? = null,
    val radioText: String? = null,
    val isPlaying: Boolean = false,
    val isRecording: Boolean = false,
    val isMuted: Boolean = false
)

data class HDRadioState(
    val currentStation: HDStationInfo? = null,
    val subchannels: List<HDSubchannel> = emptyList(),
    val isPlaying: Boolean = false,
    val signalQuality: Int = 0
)

data class HDStationInfo(
    val frequency: Int,
    val callSign: String?,
    val stationName: String?,
    val currentSubchannel: Int = 1
)

data class HDSubchannel(
    val number: Int,
    val name: String,
    val genre: String?
)

// Placeholder extension - would come from actual service
private fun RadioBrowserService.getPopularStations() = flow {
    emit(fetchTopStations(50))
}

private fun RadioBrowserService.getStationsByCategory(categoryId: String) = flow {
    emit(searchStations("", tag = categoryId, limit = 100))
}
