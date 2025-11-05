package com.universalmedialibrary.services.radio

import android.content.Context
import io.mockk.mockk
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.test.runTest
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test

/**
 * Unit tests for HDRadioService
 */
class HDRadioServiceTest {

    private lateinit var context: Context
    private lateinit var hdRadioService: HDRadioService

    @Before
    fun setup() {
        context = mockk(relaxed = true)
        hdRadioService = HDRadioService(context)
    }

    @Test
    fun `test HD stations are loaded on initialization`() = runTest {
        // When the service is initialized
        val stations = hdRadioService.hdStations.first()
        
        // Then stations should be available
        assertTrue(stations.isNotEmpty())
    }

    @Test
    fun `test get stations by frequency returns correct stations`() = runTest {
        // Given a frequency with multiple HD channels
        val frequency = 98700 // 98.7 FM
        
        // When getting stations by frequency
        val stations = hdRadioService.getStationsByFrequency(frequency)
        
        // Then it should return all channels on that frequency
        assertTrue(stations.isNotEmpty())
        assertTrue(stations.all { it.frequency == frequency })
        
        // And should have multiple channels
        val channels = stations.map { it.channel }.distinct()
        assertTrue(channels.size > 1)
    }

    @Test
    fun `test get available frequencies returns unique sorted list`() {
        // When getting available frequencies
        val frequencies = hdRadioService.getAvailableFrequencies()
        
        // Then it should return a sorted list
        assertEquals(frequencies, frequencies.sorted())
        
        // And all should be unique
        assertEquals(frequencies.size, frequencies.distinct().size)
        
        // And all should be in FM band
        frequencies.forEach { freq ->
            assertTrue(freq >= 87500)
            assertTrue(freq <= 108000)
        }
    }

    @Test
    fun `test search stations by call sign`() {
        // Given a search query for a call sign
        val query = "WFMT"
        
        // When searching
        val results = hdRadioService.searchStations(query)
        
        // Then it should return matching stations
        assertTrue(results.isNotEmpty())
        assertTrue(results.all { it.callSign.contains(query, ignoreCase = true) })
    }

    @Test
    fun `test search stations by city`() {
        // Given a search query for a city
        val query = "Chicago"
        
        // When searching
        val results = hdRadioService.searchStations(query)
        
        // Then it should return matching stations
        assertTrue(results.isNotEmpty())
        assertTrue(results.all { it.city.contains(query, ignoreCase = true) })
    }

    @Test
    fun `test search stations by state`() {
        // Given a search query for a state abbreviation
        val query = "IL"

        // When searching
        val results = hdRadioService.searchStations(query)

        // Then it should return matching stations
        assertTrue(results.isNotEmpty())
        assertTrue(results.all { it.state.contains(query, ignoreCase = true) })
    }

    @Test
    fun `test search stations by frequency fragment`() {
        // Given a frequency fragment
        val query = "98.7"

        // When searching
        val results = hdRadioService.searchStations(query)

        // Then it should return matching stations
        assertTrue(results.isNotEmpty())
        assertTrue(
            results.all { station ->
                station.displayFrequency.contains(query) ||
                station.frequency.toString().contains(query.filter { it.isDigit() })
            }
        )
    }

    @Test
    fun `test search stations with empty query returns all stations`() = runTest {
        // Given an empty search query
        val query = ""
        
        // When searching
        val results = hdRadioService.searchStations(query)
        val allStations = hdRadioService.hdStations.first()
        
        // Then it should return all stations
        assertEquals(allStations.size, results.size)
    }

    @Test
    fun `test get stations by genre filters correctly`() {
        // Given a specific genre
        val genre = "Classical"
        
        // When filtering by genre
        val results = hdRadioService.getStationsByGenre(genre)
        
        // Then all results should match the genre
        assertTrue(results.isNotEmpty())
        assertTrue(results.all { it.genre.equals(genre, ignoreCase = true) })
    }

    @Test
    fun `test get stations by genre All returns all stations`() = runTest {
        // Given "All" genre
        val genre = "All"
        
        // When filtering by genre
        val results = hdRadioService.getStationsByGenre(genre)
        val allStations = hdRadioService.hdStations.first()
        
        // Then it should return all stations
        assertEquals(allStations.size, results.size)
    }

    @Test
    fun `test get available genres includes All and sorted genres`() {
        // When getting available genres
        val genres = hdRadioService.getAvailableGenres()
        
        // Then it should include "All" as first option
        assertEquals("All", genres.first())
        
        // And the rest should be sorted
        val genresWithoutAll = genres.drop(1)
        assertEquals(genresWithoutAll, genresWithoutAll.sorted())
    }

    @Test
    fun `test set current station updates state`() = runTest {
        // Given an HD Radio station
        val allStations = hdRadioService.hdStations.first()
        val station = allStations.first()
        
        // When setting it as current
        hdRadioService.setCurrentStation(station)
        
        // Then the current station should be updated
        assertEquals(station, hdRadioService.currentStation.first())
    }

    @Test
    fun `test set playing updates state`() = runTest {
        // Given the service is not playing
        assertFalse(hdRadioService.isPlaying.first())
        
        // When setting playing to true
        hdRadioService.setPlaying(true)
        
        // Then it should be playing
        assertTrue(hdRadioService.isPlaying.first())
        
        // When setting playing to false
        hdRadioService.setPlaying(false)
        
        // Then it should not be playing
        assertFalse(hdRadioService.isPlaying.first())
    }

    @Test
    fun `test HD Radio station display frequency format`() {
        // Given an HD Radio station
        val station = HDRadioStation(
            callSign = "TEST-HD1",
            name = "Test Station",
            frequency = 101100,
            channel = "HD1",
            description = "Test",
            streamUrl = "http://test.com",
            genre = "Test",
            city = "Test City",
            state = "TS",
            hasArtistInfo = true,
            hasAlbumArt = true
        )
        
        // When getting display frequency
        val displayFreq = station.displayFrequency
        
        // Then it should be formatted correctly
        assertEquals("101.1 FM", displayFreq)
    }

    @Test
    fun `test HD Radio station full name includes channel`() {
        // Given an HD Radio station
        val station = HDRadioStation(
            callSign = "WXRT-HD2",
            name = "WXRT 93.1",
            frequency = 93100,
            channel = "HD2",
            description = "Test",
            streamUrl = "http://test.com",
            genre = "Rock",
            city = "Chicago",
            state = "IL",
            hasArtistInfo = true,
            hasAlbumArt = true
        )
        
        // When getting full name
        val fullName = station.fullName
        
        // Then it should include the channel
        assertEquals("WXRT 93.1 HD2", fullName)
    }

    @Test
    fun `test multiple channels exist for same frequency`() = runTest {
        // Given all HD stations
        val allStations = hdRadioService.hdStations.first()
        
        // When grouping by frequency
        val stationsByFreq = allStations.groupBy { it.frequency }
        
        // Then some frequencies should have multiple channels
        val multiChannelFreqs = stationsByFreq.filter { it.value.size > 1 }
        assertTrue(multiChannelFreqs.isNotEmpty())
        
        // And each should have different channel identifiers
        multiChannelFreqs.values.forEach { stations ->
            val channels = stations.map { it.channel }
            assertEquals(channels.size, channels.distinct().size)
        }
    }

    @Test
    fun `test search is case insensitive`() {
        // Given a lowercase search query
        val query = "wfmt"
        
        // When searching
        val results = hdRadioService.searchStations(query)
        
        // Then it should find stations regardless of case
        assertTrue(results.isNotEmpty())
        assertTrue(results.any { it.callSign.contains("WFMT") })
    }

    @Test
    fun `test all stations have required fields`() = runTest {
        // Given all HD stations
        val allStations = hdRadioService.hdStations.first()
        
        // Then all should have required fields
        allStations.forEach { station ->
            assertTrue(station.callSign.isNotBlank())
            assertTrue(station.name.isNotBlank())
            assertTrue(station.frequency > 0)
            assertTrue(station.channel.isNotBlank())
            assertTrue(station.streamUrl.isNotBlank())
            assertTrue(station.genre.isNotBlank())
            assertTrue(station.city.isNotBlank())
            assertTrue(station.state.isNotBlank())
        }
    }
}
