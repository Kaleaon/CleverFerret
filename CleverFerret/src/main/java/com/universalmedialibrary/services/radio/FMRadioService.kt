package com.universalmedialibrary.services.radio

import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.media.AudioManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for FM radio tuning (hardware-dependent)
 * 
 * Implements FM radio support for devices with hardware FM chips.
 * Based on RevampedFMRadio architecture for Qualcomm/MediaTek SoCs.
 * 
 * Hardware FM radio is available on some devices with Qualcomm/MediaTek chips.
 * This service detects availability and provides tuning functionality.
 */
@Singleton
class FMRadioService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

    private val _isAvailable = MutableStateFlow(false)
    val isAvailable: StateFlow<Boolean> = _isAvailable.asStateFlow()

    private val _currentFrequency = MutableStateFlow(88000) // Default: 88.0 MHz
    val currentFrequency: StateFlow<Int> = _currentFrequency.asStateFlow()

    private val _signalStrength = MutableStateFlow(0)
    val signalStrength: StateFlow<Int> = _signalStrength.asStateFlow()

    private val _rdsData = MutableStateFlow<RDSData?>(null)
    val rdsData: StateFlow<RDSData?> = _rdsData.asStateFlow()

    private val _isPlaying = MutableStateFlow(false)
    val isPlaying: StateFlow<Boolean> = _isPlaying.asStateFlow()

    init {
        checkFMHardwareAvailability()
    }

    /**
     * Check if FM radio hardware is available
     * Uses intent-based detection similar to RevampedFMRadio
     */
    private fun checkFMHardwareAvailability() {
        try {
            // Check for FM radio receiver via intent filter
            val intent = Intent("com.android.fmradio.intent.action.FM")
            val receivers = context.packageManager.queryBroadcastReceivers(intent, 0)
            
            // Also check for common FM radio package names
            val fmPackages = listOf(
                "com.android.fmradio",
                "com.caf.fmradio",
                "com.qcom.fmradio",
                "com.mediatek.fmradio"
            )
            
            val hasFMPackage = fmPackages.any { packageName ->
                try {
                    context.packageManager.getPackageInfo(packageName, 0)
                    true
                } catch (e: Exception) {
                    false
                }
            }
            
            _isAvailable.value = receivers.isNotEmpty() || hasFMPackage
        } catch (e: Exception) {
            _isAvailable.value = false
        }
    }

    /**
     * Initialize FM radio
     * Returns true if initialization successful
     */
    fun initialize(): Boolean {
        if (!_isAvailable.value) return false
        
        // Initialize FM radio hardware
        // This would typically involve starting the FM receiver service
        return false // Stub - requires platform-specific implementation
    }

    /**
     * Tune to specific frequency (in kHz)
     * Example: 101.1 FM = 101100 kHz
     */
    fun tune(frequencyKhz: Int): Boolean {
        if (!_isAvailable.value) return false
        
        // Validate frequency range (FM band: 87.5 - 108.0 MHz)
        if (frequencyKhz < 87500 || frequencyKhz > 108000) {
            return false
        }
        
        _currentFrequency.value = frequencyKhz
        // Platform-specific tuning would happen here
        return false // Stub
    }

    /**
     * Start playing FM radio
     */
    fun play() {
        if (_isAvailable.value) {
            _isPlaying.value = true
            // Platform-specific playback start
        }
    }

    /**
     * Stop playing FM radio
     */
    fun stop() {
        _isPlaying.value = false
        // Platform-specific playback stop
    }

    /**
     * Scan for next station
     */
    fun scanUp() {
        if (!_isAvailable.value || !_isPlaying.value) return
        
        // Scan upward for next strong signal
        val nextFreq = _currentFrequency.value + 100 // 0.1 MHz steps
        if (nextFreq <= 108000) {
            tune(nextFreq)
        }
    }

    /**
     * Scan for previous station
     */
    fun scanDown() {
        if (!_isAvailable.value || !_isPlaying.value) return
        
        // Scan downward for next strong signal
        val prevFreq = _currentFrequency.value - 100 // 0.1 MHz steps
        if (prevFreq >= 87500) {
            tune(prevFreq)
        }
    }

    /**
     * Get preset FM frequencies for region
     */
    fun getPopularFrequencies(): List<FMStation> {
        // Common FM frequencies - can be customized based on location
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
     * Release radio tuner resources
     */
    fun release() {
        stop()
        // Release platform-specific resources
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
