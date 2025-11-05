package com.universalmedialibrary.services.radio

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for HD Radio (digital radio) streaming via Internet
 * 
 * HD Radio provides high-quality digital audio and additional data services.
 * This implementation accesses HD Radio stations via their internet streams.
 * 
 * Features:
 * - Main channel (HD1) and sub-channels (HD2, HD3, etc.)
 * - Artist and song information
 * - Album art
 * - Station metadata
 */
@Singleton
class HDRadioService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private val _hdStations = MutableStateFlow<List<HDRadioStation>>(emptyList())
    val hdStations: StateFlow<List<HDRadioStation>> = _hdStations.asStateFlow()

    private val _currentStation = MutableStateFlow<HDRadioStation?>(null)
    val currentStation: StateFlow<HDRadioStation?> = _currentStation.asStateFlow()

    private val _isPlaying = MutableStateFlow(false)
    val isPlaying: StateFlow<Boolean> = _isPlaying.asStateFlow()

    private val stationComparator = compareBy<HDRadioStation> { it.frequency }
        .thenBy { it.channel }

    init {
        loadHDStations()
    }

    /**
     * Load available HD Radio stations
     * In a real implementation, this would fetch from an API or database
     */
    private fun loadHDStations() {
        setStations(
            listOf(
            HDRadioStation(
                callSign = "WFMT-HD1",
                name = "WFMT 98.7 HD1",
                frequency = 98700,
                channel = "HD1",
                description = "Classical music from Chicago",
                streamUrl = "https://stream.wfmt.com/main",
                genre = "Classical",
                city = "Chicago",
                state = "IL",
                hasArtistInfo = true,
                hasAlbumArt = true
            ),
            HDRadioStation(
                callSign = "WFMT-HD2",
                name = "WFMT 98.7 HD2",
                frequency = 98700,
                channel = "HD2",
                description = "Jazz from WDCB",
                streamUrl = "https://stream.wfmt.com/hd2",
                genre = "Jazz",
                city = "Chicago",
                state = "IL",
                hasArtistInfo = true,
                hasAlbumArt = true
            ),
            HDRadioStation(
                callSign = "WXRT-HD1",
                name = "WXRT 93.1 HD1",
                frequency = 93100,
                channel = "HD1",
                description = "Chicago's Finest Rock",
                streamUrl = "https://stream.wxrt.com/main",
                genre = "Rock",
                city = "Chicago",
                state = "IL",
                hasArtistInfo = true,
                hasAlbumArt = true
            ),
            HDRadioStation(
                callSign = "WBEZ-HD1",
                name = "WBEZ 91.5 HD1",
                frequency = 91500,
                channel = "HD1",
                description = "Chicago Public Radio News and Talk",
                streamUrl = "https://stream.wbez.org/main",
                genre = "News/Talk",
                city = "Chicago",
                state = "IL",
                hasArtistInfo = false,
                hasAlbumArt = false
            ),
            HDRadioStation(
                callSign = "WBEZ-HD2",
                name = "WBEZ 91.5 HD2",
                frequency = 91500,
                channel = "HD2",
                description = "BBC World Service",
                streamUrl = "https://stream.wbez.org/hd2",
                genre = "News",
                city = "Chicago",
                state = "IL",
                hasArtistInfo = false,
                hasAlbumArt = false
            ),
            HDRadioStation(
                callSign = "KCRW-HD1",
                name = "KCRW 89.9 HD1",
                frequency = 89900,
                channel = "HD1",
                description = "Eclectic music and NPR News",
                streamUrl = "https://kcrw.streamguys1.com/kcrw_128k_mp3_on_air",
                genre = "Eclectic",
                city = "Santa Monica",
                state = "CA",
                hasArtistInfo = true,
                hasAlbumArt = true
            ),
            HDRadioStation(
                callSign = "KCRW-HD2",
                name = "KCRW 89.9 HD2",
                frequency = 89900,
                channel = "HD2",
                description = "Eclectic24 - Music 24/7",
                streamUrl = "https://kcrw.streamguys1.com/kcrw_128k_mp3_e24",
                genre = "Eclectic",
                city = "Santa Monica",
                state = "CA",
                hasArtistInfo = true,
                hasAlbumArt = true
            ),
            HDRadioStation(
                callSign = "KQED-HD1",
                name = "KQED 88.5 HD1",
                frequency = 88500,
                channel = "HD1",
                description = "NPR News and Public Radio",
                streamUrl = "https://streams.kqed.org/kqedradio",
                genre = "News/Talk",
                city = "San Francisco",
                state = "CA",
                hasArtistInfo = false,
                hasAlbumArt = false
            )
          )
        )
    }

    private fun setStations(stations: List<HDRadioStation>) {
        _hdStations.value = stations.sortedWith(stationComparator)
    }

    /**
     * Get HD stations by frequency
     */
    fun getStationsByFrequency(frequencyKhz: Int): List<HDRadioStation> {
        return _hdStations.value.filter { it.frequency == frequencyKhz }
    }

    /**
     * Get all unique frequencies with HD Radio
     */
    fun getAvailableFrequencies(): List<Int> {
        return _hdStations.value.map { it.frequency }.distinct().sorted()
    }

    /**
     * Search HD stations by query
     */
    fun searchStations(query: String): List<HDRadioStation> {
        val trimmedQuery = query.trim()
        if (trimmedQuery.isBlank()) return _hdStations.value
        
        val lowerQuery = trimmedQuery.lowercase()
        val digitQuery = trimmedQuery.filter { it.isDigit() }

        return _hdStations.value.filter { station ->
            val matchesName = station.name.lowercase().contains(lowerQuery)
            val matchesCallSign = station.callSign.lowercase().contains(lowerQuery)
            val matchesDescription = station.description?.lowercase()?.contains(lowerQuery) == true
            val matchesCity = station.city.lowercase().contains(lowerQuery)
            val matchesState = station.state.lowercase().contains(lowerQuery)
            val matchesGenre = station.genre.lowercase().contains(lowerQuery)
            val matchesChannel = station.channel.lowercase().contains(lowerQuery)
            val matchesDisplayFrequency = station.displayFrequency.lowercase().contains(lowerQuery)
            val matchesRawFrequency = digitQuery.isNotEmpty() && station.frequency.toString().contains(digitQuery)

            matchesName ||
            matchesCallSign ||
            matchesDescription ||
            matchesCity ||
            matchesState ||
            matchesGenre ||
            matchesChannel ||
            matchesDisplayFrequency ||
            matchesRawFrequency
        }
    }

    /**
     * Add one or more HD radio stations to the in-memory catalog.
     * Stations with duplicate call signs are ignored.
     *
     * @return the list of stations that were actually added.
     */
    fun addStations(stations: List<HDRadioStation>): List<HDRadioStation> {
        if (stations.isEmpty()) return emptyList()

        val current = _hdStations.value.toMutableList()
        val existingCallSigns = current.map { it.callSign.uppercase() }.toMutableSet()
        val added = mutableListOf<HDRadioStation>()

        stations.forEach { station ->
            val normalizedCallSign = station.callSign.uppercase()
            if (existingCallSigns.add(normalizedCallSign)) {
                current.add(station)
                added.add(station)
            }
        }

        if (added.isNotEmpty()) {
            setStations(current)
        }

        return added
    }

    fun addStation(station: HDRadioStation): Boolean {
        return addStations(listOf(station)).isNotEmpty()
    }

    /**
     * Filter stations by genre
     */
    fun getStationsByGenre(genre: String): List<HDRadioStation> {
        if (genre == "All") return _hdStations.value
        return _hdStations.value.filter { it.genre.equals(genre, ignoreCase = true) }
    }

    /**
     * Get available genres
     */
    fun getAvailableGenres(): List<String> {
        return listOf("All") + _hdStations.value.map { it.genre }.distinct().sorted()
    }

    /**
     * Set current playing station
     */
    fun setCurrentStation(station: HDRadioStation?) {
        _currentStation.value = station
    }

    /**
     * Set playing state
     */
    fun setPlaying(playing: Boolean) {
        _isPlaying.value = playing
    }
}

/**
 * HD Radio Station
 * 
 * HD Radio is a digital radio standard that provides:
 * - CD-quality audio
 * - Multiple channels per frequency (HD1, HD2, HD3, etc.)
 * - Artist, song, and album information
 * - Album artwork
 * - No subscription fees
 */
data class HDRadioStation(
    val callSign: String,              // e.g., "WXRT-HD1"
    val name: String,                  // e.g., "WXRT 93.1 HD1"
    val frequency: Int,                // Frequency in kHz (e.g., 93100 for 93.1 FM)
    val channel: String,               // "HD1", "HD2", "HD3", etc.
    val description: String?,          // Station description
    val streamUrl: String,             // Internet stream URL
    val genre: String,                 // Music genre or format
    val city: String,                  // City
    val state: String,                 // State abbreviation
    val hasArtistInfo: Boolean,        // Whether station provides artist info
    val hasAlbumArt: Boolean,          // Whether station provides album art
    val website: String? = null,       // Station website
    val phone: String? = null          // Station phone number
) {
    val displayFrequency: String
        get() = "%.1f FM".format(frequency / 1000.0)
        
    val fullName: String
        get() = if (name.contains(channel, ignoreCase = true)) name else "$name $channel"
}
