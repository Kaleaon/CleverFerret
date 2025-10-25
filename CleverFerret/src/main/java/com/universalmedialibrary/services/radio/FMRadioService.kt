package com.universalmedialibrary.services.radio

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for FM radio tuning (hardware-dependent)
 * 
 * Note: FM radio hardware is rarely available on modern devices.
 * This is a stub implementation that reports FM radio as unavailable.
 * 
 * TODO: If FM radio support is needed, implement using appropriate hardware APIs
 * or streaming radio services instead.
 */
@Singleton
class FMRadioService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    // FM radio is not available on most modern devices
    private val _isAvailable = MutableStateFlow(false)
    val isAvailable: StateFlow<Boolean> = _isAvailable.asStateFlow()

    private val _currentFrequency = MutableStateFlow(0)
    val currentFrequency: StateFlow<Int> = _currentFrequency.asStateFlow()

    private val _signalStrength = MutableStateFlow(0)
    val signalStrength: StateFlow<Int> = _signalStrength.asStateFlow()

    private val _rdsData = MutableStateFlow<RDSData?>(null)
    val rdsData: StateFlow<RDSData?> = _rdsData.asStateFlow()

    /**
     * Initialize FM radio (stub - always returns false)
     */
    fun initialize(): Boolean {
        return false
    }

    /**
     * Tune to specific frequency (stub)
     */
    fun tune(frequencyKhz: Int): Boolean {
        return false
    }

    /**
     * Scan for next station (stub)
     */
    fun scanUp() {
        // No-op
    }

    /**
     * Scan for previous station (stub)
     */
    fun scanDown() {
        // No-op
    }

    /**
     * Get preset FM frequencies for region
     */
    fun getPopularFrequencies(): List<FMStation> {
        // Return popular FM frequencies as examples
        return listOf(
            FMStation("87.5 FM", 87500),
            FMStation("88.1 FM", 88100),
            FMStation("91.1 FM", 91100),
            FMStation("95.5 FM", 95500),
            FMStation("98.7 FM", 98700),
            FMStation("101.1 FM", 101100),
            FMStation("104.3 FM", 104300),
            FMStation("107.9 FM", 107900)
        )
    }

    /**
     * Release radio tuner (stub)
     */
    fun release() {
        // No-op
    }

    /**
     * Format frequency for display
     */
    fun formatFrequency(frequencyKhz: Int): String {
        val mhz = frequencyKhz / 1000.0
        return "%.1f FM".format(mhz)
    }
}

/**
 * RDS (Radio Data System) data
 */
data class RDSData(
    val stationName: String,
    val radioText: String, // Often contains song info
    val programType: String
)

/**
 * FM station preset
 */
data class FMStation(
    val name: String,
    val frequencyKhz: Int
) {
    val displayFrequency: String
        get() = "%.1f FM".format(frequencyKhz / 1000.0)
}
