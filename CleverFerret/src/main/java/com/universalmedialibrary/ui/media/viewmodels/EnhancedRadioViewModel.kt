package com.universalmedialibrary.ui.media.viewmodels

import android.util.Log
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.Color
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.radio.RadioBrowserService
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

private const val TAG = "EnhancedRadioViewModel"

/**
 * Enhanced Radio ViewModel
 * 
 * Provides radio functionality for:
 * - FM Radio (requires device-specific hardware APIs)
 * - HD Radio (requires device-specific hardware APIs)
 * - Internet Radio (via RadioBrowserService)
 * - Old Time Radio (via archive.org)
 * 
 * Note: FM/HD Radio functionality requires device-specific hardware APIs
 * and is implemented as placeholders. Internet Radio is fully functional
 * via the RadioBrowserService.
 */
@HiltViewModel
class EnhancedRadioViewModel @Inject constructor(
    private val radioBrowserService: RadioBrowserService,
    private val exoPlayerService: ExoPlayerService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(EnhancedRadioState())
    val uiState: StateFlow<EnhancedRadioState> = _uiState.asStateFlow()
    
    private val _fmState = MutableStateFlow(FMRadioState())
    val fmState: StateFlow<FMRadioState> = _fmState.asStateFlow()
    
    private val _hdState = MutableStateFlow(HDRadioState())
    val hdState: StateFlow<HDRadioState> = _hdState.asStateFlow()
    
    init {
        loadCategories()
        loadPopularStations()
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
    
    private fun loadPopularStations() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            try {
                val stations = radioBrowserService.fetchTopStations(limit = 50)
                val uiStations = stations.map { station ->
                    RadioStation(
                        id = station.id.toString(),
                        name = station.name,
                        streamUrl = station.streamUrl ?: "",
                        logoUrl = station.logoUrl,
                        genre = station.genre ?: station.tags ?: "",
                        country = station.country,
                        isFavorite = false
                    )
                }
                _uiState.update { 
                    it.copy(
                        popularStations = uiStations,
                        isLoading = false,
                        error = null
                    )
                }
                Log.d(TAG, "Loaded ${uiStations.size} popular stations")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to load popular stations", e)
                _uiState.update { 
                    it.copy(
                        isLoading = false,
                        error = "Failed to load stations: ${e.message}"
                    )
                }
            }
        }
    }
    
    // ==========================================================================
    // FM RADIO CONTROLS (Hardware-dependent - placeholder implementations)
    // Note: Real FM radio requires device-specific hardware APIs
    // ==========================================================================
    
    fun startFMRadio() {
        viewModelScope.launch {
            _fmState.update { it.copy(isPlaying = true) }
            // TODO: Implement with device-specific FM radio API when available
        }
    }
    
    fun stopFMRadio() {
        viewModelScope.launch {
            _fmState.update { it.copy(isPlaying = false) }
        }
    }
    
    fun tuneFMFrequency(frequencyKhz: Int) {
        viewModelScope.launch {
            _fmState.update { it.copy(currentFrequency = frequencyKhz) }
        }
    }
    
    fun seekFMUp() {
        viewModelScope.launch {
            val newFreq = (_fmState.value.currentFrequency + 100).coerceAtMost(108000)
            _fmState.update { it.copy(currentFrequency = newFreq) }
        }
    }
    
    fun seekFMDown() {
        viewModelScope.launch {
            val newFreq = (_fmState.value.currentFrequency - 100).coerceAtLeast(87500)
            _fmState.update { it.copy(currentFrequency = newFreq) }
        }
    }
    
    fun toggleFMMute() {
        viewModelScope.launch {
            _fmState.update { it.copy(isMuted = !it.isMuted) }
        }
    }
    
    fun startFMRecording() {
        viewModelScope.launch {
            _fmState.update { it.copy(isRecording = true) }
        }
    }
    
    fun stopFMRecording() {
        viewModelScope.launch {
            _fmState.update { it.copy(isRecording = false) }
        }
    }
    
    // ==========================================================================
    // HD RADIO CONTROLS (Hardware-dependent - placeholder implementations)
    // Note: Real HD radio requires device-specific hardware APIs
    // ==========================================================================
    
    fun startHDRadio() {
        viewModelScope.launch {
            _hdState.update { it.copy(isPlaying = true) }
        }
    }
    
    fun stopHDRadio() {
        viewModelScope.launch {
            _hdState.update { it.copy(isPlaying = false) }
        }
    }
    
    fun tuneHDStation(frequency: Int, subchannel: Int = 1) {
        viewModelScope.launch {
            _hdState.update { 
                it.copy(
                    currentStation = HDStationInfo(
                        frequency = frequency,
                        callSign = null,
                        stationName = "HD ${frequency / 1000.0} MHz",
                        currentSubchannel = subchannel
                    )
                )
            }
        }
    }
    
    fun selectHDSubchannel(subchannel: Int) {
        viewModelScope.launch {
            _hdState.update { current ->
                current.copy(
                    currentStation = current.currentStation?.copy(currentSubchannel = subchannel)
                )
            }
        }
    }
    
    // ==========================================================================
    // INTERNET RADIO CONTROLS (Fully functional)
    // ==========================================================================
    
    fun playInternetStation(station: RadioStation) {
        viewModelScope.launch {
            try {
                _uiState.update { it.copy(nowPlaying = station) }
                
                // Use ExoPlayerService for actual playback
                exoPlayerService.loadMediaWithSession(
                    mediaPath = station.streamUrl,
                    title = station.name,
                    artist = station.genre
                )
                exoPlayerService.play()
                
                // Add to recently played
                val recentlyPlayed = _uiState.value.recentlyPlayed.toMutableList()
                recentlyPlayed.removeAll { it.id == station.id }
                recentlyPlayed.add(0, station)
                if (recentlyPlayed.size > 20) recentlyPlayed.removeLast()
                _uiState.update { it.copy(recentlyPlayed = recentlyPlayed) }
                
                Log.d(TAG, "Playing station: ${station.name}")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to play station: ${station.name}", e)
                _uiState.update { it.copy(error = "Failed to play station: ${e.message}") }
            }
        }
    }
    
    fun stopInternetRadio() {
        viewModelScope.launch {
            exoPlayerService.stop()
            _uiState.update { it.copy(nowPlaying = null) }
        }
    }
    
    fun searchStations(query: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isSearching = true, error = null) }
            try {
                val stations = radioBrowserService.searchStations(query = query, limit = 50)
                val uiStations = stations.map { station ->
                    val stationId = station.id.toString()
                    RadioStation(
                        id = stationId,
                        name = station.name,
                        streamUrl = station.streamUrl ?: "",
                        logoUrl = station.logoUrl,
                        genre = station.genre ?: station.tags ?: "",
                        country = station.country,
                        isFavorite = _uiState.value.favoriteStations.any { fav -> fav.id == stationId }
                    )
                }
                _uiState.update { 
                    it.copy(
                        searchResults = uiStations, 
                        isSearching = false
                    )
                }
                Log.d(TAG, "Search for '$query' returned ${uiStations.size} stations")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to search stations for '$query'", e)
                _uiState.update { 
                    it.copy(
                        searchResults = emptyList(), 
                        isSearching = false,
                        error = "Search failed: ${e.message}"
                    )
                }
            }
        }
    }
    
    fun loadStationsByCategory(categoryId: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true, selectedCategory = categoryId, error = null) }
            try {
                // Map category ID to a tag for radio-browser.info
                val tag = when (categoryId) {
                    "pop" -> "pop"
                    "rock" -> "rock"
                    "jazz" -> "jazz"
                    "classical" -> "classical"
                    "news" -> "news"
                    "sports" -> "sports"
                    "talk" -> "talk"
                    "country" -> "country"
                    "electronic" -> "electronic"
                    "hip-hop" -> "hip hop"
                    else -> categoryId
                }
                
                val stations = radioBrowserService.searchStations(query = "", tag = tag, limit = 50)
                val uiStations = stations.map { station ->
                    val stationId = station.id.toString()
                    RadioStation(
                        id = stationId,
                        name = station.name,
                        streamUrl = station.streamUrl ?: "",
                        logoUrl = station.logoUrl,
                        genre = station.genre ?: station.tags ?: "",
                        country = station.country,
                        isFavorite = _uiState.value.favoriteStations.any { fav -> fav.id == stationId }
                    )
                }
                _uiState.update { 
                    it.copy(
                        categoryStations = uiStations, 
                        isLoading = false
                    )
                }
                Log.d(TAG, "Loaded ${uiStations.size} stations for category '$categoryId'")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to load stations for category '$categoryId'", e)
                _uiState.update { 
                    it.copy(
                        categoryStations = emptyList(), 
                        isLoading = false,
                        error = "Failed to load category: ${e.message}"
                    )
                }
            }
        }
    }
    
    fun clearSearch() {
        _uiState.update { it.copy(searchResults = emptyList()) }
    }
    
    fun clearError() {
        _uiState.update { it.copy(error = null) }
    }
    
    // ==========================================================================
    // FAVORITES
    // ==========================================================================
    
    fun toggleFavorite(station: RadioStation) {
        viewModelScope.launch {
            val updatedFavorites = if (station.isFavorite) {
                _uiState.value.favoriteStations.filter { it.id != station.id }
            } else {
                _uiState.value.favoriteStations + station.copy(isFavorite = true)
            }
            _uiState.update { it.copy(favoriteStations = updatedFavorites) }
            // TODO: Persist favorites to database
        }
    }
    
    fun saveFMStationAsFavorite() {
        viewModelScope.launch {
            val freq = _fmState.value.currentFrequency
            val name = _fmState.value.stationName ?: "FM ${freq / 1000.0} MHz"
            
            val station = RadioStation(
                id = "fm_$freq",
                name = name,
                streamUrl = "fm://$freq",
                logoUrl = null,
                genre = "FM Radio",
                isFavorite = true
            )
            _uiState.update { 
                it.copy(favoriteStations = it.favoriteStations + station)
            }
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        // Stop playback when ViewModel is cleared
        exoPlayerService.stop()
    }
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
