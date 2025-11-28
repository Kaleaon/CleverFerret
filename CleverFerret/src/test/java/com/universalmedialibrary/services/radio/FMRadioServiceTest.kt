package com.universalmedialibrary.services.radio

import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioManager
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertTrue
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test

/**
 * Unit tests for FMRadioService
 */
class FMRadioServiceTest {

    private lateinit var context: Context
    private lateinit var audioManager: AudioManager
    private lateinit var packageManager: PackageManager
    private lateinit var fmRadioService: FMRadioService

    @Before
    fun setup() {
        context = mockk(relaxed = true)
        audioManager = mockk(relaxed = true)
        packageManager = mockk(relaxed = true)
        
        every { context.getSystemService(Context.AUDIO_SERVICE) } returns audioManager
        every { context.packageManager } returns packageManager
        
        fmRadioService = FMRadioService(context)
    }

    @Test
    fun `test tune to valid frequency`() = runTest {
        // Given a valid frequency
        val validFrequency = 101100 // 101.1 FM
        
        // When tuning to that frequency
        val result = fmRadioService.tune(validFrequency)
        
        // Then it should succeed
        assertTrue(result)
        assertEquals(validFrequency, fmRadioService.currentFrequency.first())
    }

    @Test
    fun `test tune to frequency below minimum`() = runTest {
        // Given a frequency below the FM band minimum (87.5 MHz)
        val tooLowFrequency = 85000 // 85.0 FM
        
        // When tuning to that frequency
        val result = fmRadioService.tune(tooLowFrequency)
        
        // Then it should fail
        assertFalse(result)
    }

    @Test
    fun `test tune to frequency above maximum`() = runTest {
        // Given a frequency above the FM band maximum (108.0 MHz)
        val tooHighFrequency = 110000 // 110.0 FM
        
        // When tuning to that frequency
        val result = fmRadioService.tune(tooHighFrequency)
        
        // Then it should fail
        assertFalse(result)
    }

    @Test
    fun `test scan up wraps around to first station`() = runTest {
        // Given we're at the highest frequency
        fmRadioService.tune(107900) // 107.9 FM
        
        // When scanning up
        fmRadioService.scanUp()
        
        // Then it should wrap to the first station
        val currentFreq = fmRadioService.currentFrequency.first()
        assertEquals(87500, currentFreq) // Should wrap to 87.5 FM
    }

    @Test
    fun `test scan down wraps around to last station`() = runTest {
        // Given we're at the lowest frequency
        fmRadioService.tune(87500) // 87.5 FM
        
        // When scanning down
        fmRadioService.scanDown()
        
        // Then it should wrap to the last station
        val currentFreq = fmRadioService.currentFrequency.first()
        assertEquals(107900, currentFreq) // Should wrap to 107.9 FM
    }

    @Test
    fun `test RDS data is populated for strong signal`() = runTest {
        // Given we tune to a preset station
        val presetFrequency = 88100 // 88.1 FM
        
        // When tuning to that frequency
        fmRadioService.tune(presetFrequency)
        
        // Then RDS data should be available (signal strength > 50)
        val rdsData = fmRadioService.rdsData.first()
        assertNotNull(rdsData)
        assertEquals("88.1 FM", rdsData?.stationName)
    }

    @Test
    fun `test signal strength decreases with distance from preset`() = runTest {
        // Given we tune exactly to a preset
        val presetFrequency = 101100 // 101.1 FM
        fmRadioService.tune(presetFrequency)
        val exactSignal = fmRadioService.signalStrength.first()
        
        // When we tune away from the preset
        val offsetFrequency = 101200 // 101.2 FM
        fmRadioService.tune(offsetFrequency)
        val offsetSignal = fmRadioService.signalStrength.first()
        
        // Then signal strength should be lower
        assertTrue(offsetSignal < exactSignal)
    }

    @Test
    fun `test format frequency displays correctly`() {
        // Given various frequencies
        val testCases = mapOf(
            88000 to "88.0 FM",
            101100 to "101.1 FM",
            95500 to "95.5 FM",
            107900 to "107.9 FM"
        )
        
        // When formatting each frequency
        testCases.forEach { (freq, expected) ->
            // Then it should format correctly
            assertEquals(expected, fmRadioService.formatFrequency(freq))
        }
    }

    @Test
    fun `test play and stop toggle correctly`() = runTest {
        // Given the service is not playing
        assertFalse(fmRadioService.isPlaying.first())
        
        // When we start playing
        fmRadioService.play()
        
        // Then it should be playing
        assertTrue(fmRadioService.isPlaying.first())
        
        // When we stop
        fmRadioService.stop()
        
        // Then it should not be playing
        assertFalse(fmRadioService.isPlaying.first())
    }

    @Test
    fun `test get popular frequencies returns list`() {
        // When getting popular frequencies
        val frequencies = fmRadioService.getPopularFrequencies()
        
        // Then it should return a non-empty list
        assertTrue(frequencies.isNotEmpty())
        
        // And all frequencies should be within FM band
        frequencies.forEach { station ->
            assertTrue(station.frequencyKhz >= 87500)
            assertTrue(station.frequencyKhz <= 108000)
        }
    }

    @Test
    fun `test initialize returns true`() {
        // When initializing the service
        val result = fmRadioService.initialize()
        
        // Then it should succeed (for simulation mode)
        assertTrue(result)
    }

    @Test
    fun `test scan up finds next station`() = runTest {
        // Given we're at 88.1 FM
        fmRadioService.tune(88100)
        val startFreq = fmRadioService.currentFrequency.first()
        
        // When scanning up
        fmRadioService.scanUp()
        
        // Then we should be at a higher frequency
        val endFreq = fmRadioService.currentFrequency.first()
        assertTrue(endFreq > startFreq)
    }

    @Test
    fun `test scan down finds previous station`() = runTest {
        // Given we're at 101.1 FM
        fmRadioService.tune(101100)
        val startFreq = fmRadioService.currentFrequency.first()
        
        // When scanning down
        fmRadioService.scanDown()
        
        // Then we should be at a lower frequency
        val endFreq = fmRadioService.currentFrequency.first()
        assertTrue(endFreq < startFreq)
    }
}
