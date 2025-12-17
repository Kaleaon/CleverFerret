package com.universalmedialibrary.ui.media.viewmodels

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.Color
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Enhanced Radio ViewModel
 * 
 * Provides radio functionality for:
 * - FM Radio
 * - HD Radio  
 * - Internet Radio (via RadioBrowserService)
 * - Old Time Radio (via archive.org)
 * 
 * Note: This is a simplified implementation. Full integration with
 * hardware radio services (FM/HD) requires device-specific APIs.
 */
@HiltViewModel
class EnhancedRadioViewModel @Inject constructor() : ViewModel() {
    
    private val _uiState = MutableStateFlow(EnhancedRadioState())
    val uiState: StateFlow<EnhancedRadioState> = _uiState.asStateFlow()
    
    private val _fmState = MutableStateFlow(FMRadioState())
    val fmState: StateFlow<FMRadioState> = _fmState.asStateFlow()
    
    private val _hdState = MutableStateFlow(HDRadioState())
    val hdState: StateFlow<HDRadioState> = _hdState.asStateFlow()
    
    init {
        loadCategories()
        loadSampleStations()
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
    
    private fun loadSampleStations() {
        // Load sample/placeholder stations for UI development
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = false) }
        }
    }
    
    // ==========================================================================
    // FM RADIO CONTROLS (Placeholder implementations)
    // ==========================================================================
    
    fun startFMRadio() {
        viewModelScope.launch {
            _fmState.update { it.copy(isPlaying = true) }
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
    // HD RADIO CONTROLS (Placeholder implementations)
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
    // INTERNET RADIO CONTROLS
    // ==========================================================================
    
    fun playInternetStation(station: RadioStation) {
        viewModelScope.launch {
            _uiState.update { it.copy(nowPlaying = station) }
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
            // Placeholder - would call RadioBrowserService
            _uiState.update { it.copy(searchResults = emptyList(), isSearching = false) }
        }
    }
    
    fun loadStationsByCategory(categoryId: String) {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true, selectedCategory = categoryId) }
            // Placeholder - would call RadioBrowserService
            _uiState.update { it.copy(categoryStations = emptyList(), isLoading = false) }
        }
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
