package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import android.os.Environment
import android.util.Log
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.Color
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.radio.RadioBrowserService
import com.universalmedialibrary.services.radio.FMRadioService
import com.universalmedialibrary.services.exoplayer.ExoPlayerService
import com.universalmedialibrary.ui.media.screens.*
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import java.io.File
import javax.inject.Inject

private const val TAG = "EnhancedRadioViewModel"

/**
 * Enhanced Radio ViewModel
 * 
 * Provides radio functionality for:
 * - FM Radio (via FMRadioService with hardware support detection)
 * - HD Radio (requires device-specific hardware APIs)
 * - Internet Radio (via RadioBrowserService)
 * - Old Time Radio (via archive.org)
 */
@HiltViewModel
class EnhancedRadioViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val radioBrowserService: RadioBrowserService,
    private val fmRadioService: FMRadioService,
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
        observeFMRadioState()
    }
    
    /**
     * Observe FM Radio hardware state from FMRadioService
     */
    private fun observeFMRadioState() {
        viewModelScope.launch {
            fmRadioService.isAvailable.collect { available ->
                _fmState.update { it.copy(isHardwareAvailable = available) }
            }
        }
        viewModelScope.launch {
            fmRadioService.currentFrequency.collect { freq ->
                _fmState.update { it.copy(currentFrequency = freq) }
            }
        }
        viewModelScope.launch {
            fmRadioService.signalStrength.collect { strength ->
                _fmState.update { it.copy(signalStrength = strength) }
            }
        }
        viewModelScope.launch {
            fmRadioService.isPlaying.collect { playing ->
                _fmState.update { it.copy(isPlaying = playing) }
            }
        }
        viewModelScope.launch {
            fmRadioService.isRecording.collect { recording ->
                _fmState.update { it.copy(isRecording = recording) }
            }
        }
        viewModelScope.launch {
            fmRadioService.rdsData.collect { rds ->
                _fmState.update { 
                    it.copy(
                        stationName = rds?.stationName,
                        radioText = rds?.radioText
                    )
                }
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
    
    private fun loadPopularStations() {
        viewModelScope.launch {
            _uiState.update { it.copy(isLoading = true) }
            try {
                val stations = radioBrowserService.fetchTopStations(limit = 50)
                // Filter out stations with null/blank streamUrl to prevent playback failures
                val uiStations = stations.mapNotNull { station ->
                    val url = station.streamUrl?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
                    RadioStation(
                        id = station.id.toString(),
                        name = station.name,
                        streamUrl = url,
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
    // FM RADIO CONTROLS (Uses FMRadioService for hardware access)
    // ==========================================================================
    
    fun startFMRadio() {
        viewModelScope.launch {
            if (!fmRadioService.isAvailable.value) {
                _fmState.update { it.copy(error = "FM Radio hardware not available on this device") }
                return@launch
            }
            val initialized = fmRadioService.initialize()
            if (initialized) {
                fmRadioService.play()
                _fmState.update { it.copy(error = null) }
            } else {
                _fmState.update { it.copy(error = "Failed to initialize FM Radio") }
            }
        }
    }
    
    fun stopFMRadio() {
        viewModelScope.launch {
            fmRadioService.stop()
        }
    }
    
    fun tuneFMFrequency(frequencyKhz: Int) {
        viewModelScope.launch {
            val success = fmRadioService.tune(frequencyKhz)
            if (!success) {
                _fmState.update { it.copy(error = "Invalid frequency: $frequencyKhz") }
            }
        }
    }
    
    fun seekFMUp() {
        viewModelScope.launch {
            // Use scanUp for seeking to next station
            fmRadioService.scanUp()
        }
    }
    
    fun seekFMDown() {
        viewModelScope.launch {
            // Use scanDown for seeking to previous station
            fmRadioService.scanDown()
        }
    }
    
    fun toggleFMMute() {
        viewModelScope.launch {
            // Mute is handled by toggling playback state
            val currentMuted = _fmState.value.isMuted
            if (currentMuted) {
                fmRadioService.play()
            } else {
                fmRadioService.stop()
            }
            _fmState.update { it.copy(isMuted = !currentMuted) }
        }
    }
    
    fun startFMRecording() {
        viewModelScope.launch {
            try {
                // Use app-specific storage for Android 10+ compatibility
                val recordingDir = context.getExternalFilesDir(Environment.DIRECTORY_MUSIC)
                    ?.let { File(it, "FM_Recordings") }
                    ?: run {
                        _fmState.update { it.copy(error = "Cannot access storage") }
                        return@launch
                    }
                
                if (!recordingDir.exists() && !recordingDir.mkdirs()) {
                    _fmState.update { it.copy(error = "Failed to create recording directory") }
                    return@launch
                }
                
                val outputFile = File(recordingDir, "fm_recording_${System.currentTimeMillis()}.m4a")
                val success = fmRadioService.startRecording(outputFile)
                if (!success) {
                    _fmState.update { it.copy(error = "Failed to start recording") }
                }
            } catch (e: Exception) {
                _fmState.update { it.copy(error = "Recording error: ${e.message}") }
            }
        }
    }
    
    fun stopFMRecording() {
        viewModelScope.launch {
            fmRadioService.stopRecording()
        }
    }
    
    fun clearFMError() {
        _fmState.update { it.copy(error = null) }
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
                // Use ExoPlayerService for actual playback
                exoPlayerService.loadMediaWithSession(
                    mediaPath = station.streamUrl,
                    title = station.name,
                    artist = station.genre
                )
                exoPlayerService.play()
                
                // Update nowPlaying only after successful playback initiation
                _uiState.update { it.copy(nowPlaying = station) }
                
                // Add to recently played
                val recentlyPlayed = _uiState.value.recentlyPlayed.toMutableList()
                recentlyPlayed.removeAll { it.id == station.id }
                recentlyPlayed.add(0, station)
                if (recentlyPlayed.size > 20) recentlyPlayed.removeLast()
                _uiState.update { it.copy(recentlyPlayed = recentlyPlayed) }
                
                Log.d(TAG, "Playing station: ${station.name}")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to play station: ${station.name}", e)
                _uiState.update { it.copy(error = "Failed to play station: ${e.message}", nowPlaying = null) }
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
                // Filter out stations with null/blank streamUrl to prevent playback failures
                val uiStations = stations.mapNotNull { station ->
                    val url = station.streamUrl?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
                    val stationId = station.id.toString()
                    RadioStation(
                        id = stationId,
                        name = station.name,
                        streamUrl = url,
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
                // Filter out stations with null/blank streamUrl to prevent playback failures
                val uiStations = stations.mapNotNull { station ->
                    val url = station.streamUrl?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
                    val stationId = station.id.toString()
                    RadioStation(
                        id = stationId,
                        name = station.name,
                        streamUrl = url,
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
        // Stop all playback when ViewModel is cleared
        exoPlayerService.stop()
        fmRadioService.stop()
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
    val isMuted: Boolean = false,
    val isHardwareAvailable: Boolean = false,
    val error: String? = null
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
