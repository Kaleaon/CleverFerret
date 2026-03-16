package com.universalmedialibrary.ui.radio

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.radio.HDRadioService
import com.universalmedialibrary.services.radio.HDRadioStation
import com.universalmedialibrary.services.radio.HDRadioStationDirectory
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import kotlin.math.roundToInt
import javax.inject.Inject

@HiltViewModel
class HDRadioViewModel @Inject constructor(
    private val hdRadioService: HDRadioService,
    private val hdRadioDirectory: HDRadioStationDirectory,
    @Suppress("unused") private val radioStationDao: com.universalmedialibrary.data.local.dao.RadioStationDao,
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService
) : ViewModel() {
    val stations: StateFlow<List<HDRadioStation>> = hdRadioService.hdStations
    val currentStation: StateFlow<HDRadioStation?> = hdRadioService.currentStation
    val genres: StateFlow<List<String>> = hdRadioService.hdStations
        .map { stations ->
            val genres = stations.map { it.genre }.distinct().sorted()
            listOf("All") + genres
        }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = hdRadioService.getAvailableGenres()
        )

    private val _uiState = MutableStateFlow(HDRadioUiState())
    val uiState: StateFlow<HDRadioUiState> = _uiState.asStateFlow()

    fun searchStations(query: String): List<HDRadioStation> {
        return hdRadioService.searchStations(query)
    }

    fun openManualDialog() {
        _uiState.update { it.copy(showAddManualDialog = true, message = null, error = null) }
    }

    fun closeManualDialog() {
        _uiState.update { it.copy(showAddManualDialog = false) }
    }

    fun openZipDialog() {
        _uiState.update {
            it.copy(
                showAddByZipDialog = true,
                message = null,
                error = null,
                zipLookup = HDRadioZipLookupState()
            )
        }
    }

    fun closeZipDialog() {
        _uiState.update {
            it.copy(
                showAddByZipDialog = false,
                zipLookup = HDRadioZipLookupState()
            )
        }
    }

    fun addCustomStation(
        callSign: String,
        name: String,
        frequencyMhz: String,
        channel: String,
        streamUrl: String,
        description: String?,
        city: String,
        state: String,
        genre: String,
        hasArtistInfo: Boolean,
        hasAlbumArt: Boolean
    ) {
        val trimmedCallSign = callSign.trim().uppercase()
        val trimmedName = name.trim()
        val trimmedStreamUrl = streamUrl.trim()
        val trimmedCity = city.trim()
        val trimmedState = state.trim().uppercase()

        if (trimmedCallSign.isEmpty() ||
            trimmedName.isEmpty() ||
            trimmedStreamUrl.isEmpty() ||
            trimmedCity.isEmpty() ||
            trimmedState.length !in 2..3
        ) {
            _uiState.update { it.copy(error = "Please fill in all required fields.") }
            return
        }

        val frequencyValue = frequencyMhz.trim().replace(',', '.').toDoubleOrNull()
        if (frequencyValue == null || frequencyValue < 87.5 || frequencyValue > 108.0) {
            _uiState.update { it.copy(error = "Enter a valid FM frequency between 87.5 and 108.0 MHz.") }
            return
        }

        val frequencyKhz = (frequencyValue * 1000).roundToInt()
        val normalizedChannel = channel.trim().ifBlank { "HD1" }.uppercase()
        val normalizedGenre = genre.trim().ifBlank { "Variety" }
        val normalizedDescription = description?.trim()?.ifBlank { null }

        val station = HDRadioStation(
            callSign = trimmedCallSign,
            name = trimmedName,
            frequency = frequencyKhz,
            channel = normalizedChannel,
            description = normalizedDescription,
            streamUrl = trimmedStreamUrl,
            genre = normalizedGenre,
            city = trimmedCity,
            state = trimmedState,
            hasArtistInfo = hasArtistInfo,
            hasAlbumArt = hasAlbumArt
        )

        val added = hdRadioService.addStations(listOf(station))
        _uiState.update {
            if (added.isEmpty()) {
                it.copy(error = "Station ${station.callSign} already exists in your HD list.")
            } else {
                it.copy(
                    showAddManualDialog = false,
                    message = "Added ${station.fullName} (${station.displayFrequency})"
                )
            }
        }
    }

    fun lookupStationsByZip(zip: String) {
        val normalizedZip = zip.filter { it.isDigit() }
        if (normalizedZip.length != 5) {
            _uiState.update {
                it.copy(
                    zipLookup = it.zipLookup.copy(
                        zip = zip,
                        isLoading = false,
                        stations = emptyList(),
                        locationLabel = null
                    ),
                    error = "Enter a valid 5-digit ZIP code."
                )
            }
            return
        }

        _uiState.update {
            it.copy(
                zipLookup = it.zipLookup.copy(
                    zip = normalizedZip,
                    isLoading = true,
                    stations = emptyList(),
                    locationLabel = null
                ),
                error = null,
                message = null
            )
        }

        viewModelScope.launch {
            val result = hdRadioDirectory.lookupByZip(normalizedZip)
            _uiState.update {
                if (result == null) {
                    it.copy(
                        zipLookup = it.zipLookup.copy(
                            zip = normalizedZip,
                            isLoading = false,
                            stations = emptyList(),
                            locationLabel = null
                        ),
                        error = "No HD Radio stations found for ZIP $normalizedZip."
                    )
                } else {
                    it.copy(
                        zipLookup = it.zipLookup.copy(
                            zip = normalizedZip,
                            isLoading = false,
                            stations = result.stations,
                            locationLabel = "${result.city}, ${result.state}"
                        ),
                        error = null
                    )
                }
            }
        }
    }

    fun addStationsFromZipLookup() {
        val lookup = _uiState.value.zipLookup
        if (lookup.stations.isEmpty()) {
            _uiState.update { it.copy(error = "Search for a ZIP code first.") }
            return
        }

        val added = hdRadioService.addStations(lookup.stations)
        _uiState.update {
            val message = if (added.isEmpty()) {
                "All stations for ${lookup.locationLabel ?: lookup.zip} are already in your list."
            } else {
                "Added ${added.size} HD station${if (added.size == 1) "" else "s"} for ${lookup.locationLabel ?: lookup.zip}."
            }

            it.copy(
                showAddByZipDialog = false,
                zipLookup = HDRadioZipLookupState(),
                message = message,
                error = null
            )
        }
    }

    fun clearFeedback() {
        _uiState.update { it.copy(message = null, error = null) }
    }

    fun playStation(station: HDRadioStation) {
        viewModelScope.launch {
            try {
                // Stop current playback
                musicPlayerService.stop()

                // Play station via music player service
                musicPlayerService.playTrackFromUri(
                    uri = station.streamUrl,
                    title = station.name,
                    artist = "HD Radio - ${station.genre}",
                    album = "${station.city}, ${station.state}",
                    duration = 0L, // Streams have no duration
                    albumArtUrl = null
                )

                // Update HD Radio service state
                hdRadioService.setCurrentStation(station)
                hdRadioService.setPlaying(true)

            } catch (e: Exception) {
                // Log error and handle gracefully
                android.util.Log.e("HDRadioViewModel", "Error playing station: ${station.name}", e)
                // In a production app, would show a toast or update error state
            }
        }
    }
}

data class HDRadioUiState(
    val showAddManualDialog: Boolean = false,
    val showAddByZipDialog: Boolean = false,
    val zipLookup: HDRadioZipLookupState = HDRadioZipLookupState(),
    val message: String? = null,
    val error: String? = null
)

data class HDRadioZipLookupState(
    val zip: String = "",
    val isLoading: Boolean = false,
    val stations: List<HDRadioStation> = emptyList(),
    val locationLabel: String? = null
)
