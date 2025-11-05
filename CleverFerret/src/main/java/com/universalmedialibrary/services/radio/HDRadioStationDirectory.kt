package com.universalmedialibrary.services.radio

import javax.inject.Inject
import javax.inject.Singleton

/**
 * Directory of HD Radio stations available by ZIP code.
 *
 * This provides a curated subset of HD radio stations for popular metropolitan
 * areas so that users can quickly bootstrap their HD station list without
 * manually entering each station.
 */
@Singleton
class HDRadioStationDirectory @Inject constructor() {

    /**
     * Lookup HD radio stations by a US ZIP code.
     *
     * @param zipCode The user-provided ZIP code. Non-digit characters are ignored.
     * @return [HDRadioDirectoryResult] containing location metadata and station
     *         listings, or `null` if the ZIP code is not in the directory.
     */
    fun lookupByZip(zipCode: String): HDRadioDirectoryResult? {
        val normalizedZip = zipCode.filter { it.isDigit() }
        if (normalizedZip.length != 5) return null

        return directory.firstOrNull { it.zip == normalizedZip }?.let { entry ->
            HDRadioDirectoryResult(
                zip = entry.zip,
                city = entry.city,
                state = entry.state,
                stations = entry.stations
            )
        }
    }

    /**
     * List all ZIP codes that have directory coverage.
     */
    fun supportedZips(): List<String> = directory.map { it.zip }

    private data class DirectoryEntry(
        val zip: String,
        val city: String,
        val state: String,
        val stations: List<HDRadioStation>
    )

    private val stationComparator = compareBy<HDRadioStation> { it.frequency }
        .thenBy { it.channel }

    private val directory: List<DirectoryEntry> = listOf(
        DirectoryEntry(
            zip = "60601",
            city = "Chicago",
            state = "IL",
            stations = listOf(
                HDRadioStation(
                    callSign = "WDRV-HD2",
                    name = "The Drive 97.1 HD2",
                    frequency = 97100,
                    channel = "HD2",
                    description = "Chicago's Classic Rock Deep Cuts",
                    streamUrl = "https://stream.wdrv.com/hd2",
                    genre = "Classic Rock",
                    city = "Chicago",
                    state = "IL",
                    hasArtistInfo = true,
                    hasAlbumArt = true
                ),
                HDRadioStation(
                    callSign = "WSHE-HD3",
                    name = "SHE 100.3 HD3",
                    frequency = 100300,
                    channel = "HD3",
                    description = "Throwback Hits",
                    streamUrl = "https://live.wshechicago.com/hd3",
                    genre = "Throwback",
                    city = "Chicago",
                    state = "IL",
                    hasArtistInfo = true,
                    hasAlbumArt = false
                )
            ).sortedWith(stationComparator)
        ),
        DirectoryEntry(
            zip = "90012",
            city = "Los Angeles",
            state = "CA",
            stations = listOf(
                HDRadioStation(
                    callSign = "KPCC-HD2",
                    name = "LAist 89.3 HD2",
                    frequency = 89300,
                    channel = "HD2",
                    description = "News and Culture from LAist",
                    streamUrl = "https://streams.scpr.org/laist",
                    genre = "News/Talk",
                    city = "Los Angeles",
                    state = "CA",
                    hasArtistInfo = false,
                    hasAlbumArt = false
                ),
                HDRadioStation(
                    callSign = "KLOS-HD2",
                    name = "KLOS 95.5 HD2",
                    frequency = 95500,
                    channel = "HD2",
                    description = "Mursic - Alternative Rock",
                    streamUrl = "https://stream.955klos.com/klos-hd2",
                    genre = "Alternative",
                    city = "Los Angeles",
                    state = "CA",
                    hasArtistInfo = true,
                    hasAlbumArt = true
                ),
                HDRadioStation(
                    callSign = "KUSC-HD3",
                    name = "KUSC 91.5 HD3",
                    frequency = 91500,
                    channel = "HD3",
                    description = "Classical California Kids",
                    streamUrl = "https://streams.kusc.org/kusc-kids",
                    genre = "Classical",
                    city = "Los Angeles",
                    state = "CA",
                    hasArtistInfo = true,
                    hasAlbumArt = true
                )
            ).sortedWith(stationComparator)
        ),
        DirectoryEntry(
            zip = "10001",
            city = "New York",
            state = "NY",
            stations = listOf(
                HDRadioStation(
                    callSign = "WNYC-HD2",
                    name = "WNYC 93.9 HD2",
                    frequency = 93900,
                    channel = "HD2",
                    description = "Classical 24",
                    streamUrl = "https://fm939.wnyc.org/wnycfm-hd2",
                    genre = "Classical",
                    city = "New York",
                    state = "NY",
                    hasArtistInfo = true,
                    hasAlbumArt = true
                ),
                HDRadioStation(
                    callSign = "WBGO-HD2",
                    name = "WBGO Jazz HD2",
                    frequency = 88300,
                    channel = "HD2",
                    description = "The Jazz Bee",
                    streamUrl = "https://wbgo.streamguys1.com/wbgo-hd2",
                    genre = "Jazz",
                    city = "Newark",
                    state = "NJ",
                    hasArtistInfo = true,
                    hasAlbumArt = true
                ),
                HDRadioStation(
                    callSign = "WXNY-HD3",
                    name = "La X 96.3 HD3",
                    frequency = 96300,
                    channel = "HD3",
                    description = "Latin Pop y Mas",
                    streamUrl = "https://stream.lax963.com/hd3",
                    genre = "Latin",
                    city = "New York",
                    state = "NY",
                    hasArtistInfo = true,
                    hasAlbumArt = true
                )
            ).sortedWith(stationComparator)
        )
    )
}

data class HDRadioDirectoryResult(
    val zip: String,
    val city: String,
    val state: String,
    val stations: List<HDRadioStation>
)
