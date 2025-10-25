package com.universalmedialibrary.services.radio

import android.content.Context
import android.hardware.radio.RadioManager
import android.hardware.radio.RadioTuner
import android.os.Build
import androidx.annotation.RequiresApi
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for FM radio tuning (hardware-dependent)
 * 
 * Features:
 * - Tune to FM frequencies
 * - Scan for stations
 * - Signal strength detection
 * - RDS data parsing (station name, song info)
 * 
 * Note: Requires device with FM radio hardware
 * Most modern phones don't have FM radio chips
 */
@Singleton
class FMRadioService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private var radioManager: RadioManager? = null
    private var radioTuner: RadioTuner? = null

    private val _isAvailable = MutableStateFlow(false)
    val isAvailable: StateFlow<Boolean> = _isAvailable.asStateFlow()

    private val _currentFrequency = MutableStateFlow(0)
    val currentFrequency: StateFlow<Int> = _currentFrequency.asStateFlow()

    private val _signalStrength = MutableStateFlow(0)
    val signalStrength: StateFlow<Int> = _signalStrength.asStateFlow()

    private val _rdsData = MutableStateFlow<RDSData?>(null)
    val rdsData: StateFlow<RDSData?> = _rdsData.asStateFlow()

    init {
        checkAvailability()
    }

    /**
     * Check if FM radio hardware is available
     */
    private fun checkAvailability() {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                radioManager = context.getSystemService(Context.RADIO_SERVICE) as? RadioManager
                val properties = radioManager?.listModules()
                _isAvailable.value = properties?.isNotEmpty() == true
            } else {
                _isAvailable.value = false
            }
        } catch (e: Exception) {
            _isAvailable.value = false
        }
    }

    /**
     * Initialize FM radio
     */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun initialize(): Boolean {
        if (!_isAvailable.value) return false

        try {
            val modules = radioManager?.listModules() ?: return false
            if (modules.isEmpty()) return false

            // Get FM module
            val fmModule = modules.firstOrNull { 
                it.isBandSupported(RadioManager.BAND_FM)
            } ?: return false

            // Open tuner
            val config = RadioManager.FmBandConfig.Builder(
                RadioManager.FmBandDescriptor(
                    RadioManager.REGION_ITU_1,
                    RadioManager.BAND_FM,
                    87500, // Lower limit: 87.5 MHz
                    108000, // Upper limit: 108.0 MHz
                    50, // Spacing: 50 kHz
                    true // Stereo supported
                )
            ).build()

            radioTuner = radioManager?.openTuner(
                fmModule.id,
                config,
                true, // With audio
                createCallback()
            )

            return radioTuner != null
        } catch (e: Exception) {
            return false
        }
    }

    /**
     * Tune to specific frequency (in kHz)
     * Example: 101.1 FM = 101100 kHz
     */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun tune(frequencyKhz: Int): Boolean {
        return try {
            radioTuner?.tune(frequencyKhz, 0) ?: false
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Scan for next station
     */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun scanUp() {
        radioTuner?.scan(RadioTuner.DIRECTION_UP, true)
    }

    /**
     * Scan for previous station
     */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun scanDown() {
        radioTuner?.scan(RadioTuner.DIRECTION_DOWN, true)
    }

    /**
     * Create radio tuner callback
     */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun createCallback(): RadioTuner.Callback {
        return object : RadioTuner.Callback() {
            override fun onProgramInfoChanged(info: RadioManager.ProgramInfo?) {
                info?.let {
                    _currentFrequency.value = it.channel
                    _signalStrength.value = it.signalStrength
                    
                    // Parse RDS data if available
                    parseRdsData(it)
                }
            }

            override fun onError(status: Int) {
                // Handle error
            }
        }
    }

    /**
     * Parse RDS (Radio Data System) information
     * Contains station name, song info, etc.
     */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun parseRdsData(info: RadioManager.ProgramInfo) {
        // RDS data parsing
        // Note: Actual implementation depends on Android version and device
        val metadata = info.metadata
        
        val stationName = metadata?.getString(RadioManager.METADATA_KEY_RDS_PS)
        val radioText = metadata?.getString(RadioManager.METADATA_KEY_RDS_RT)
        val programType = metadata?.getString(RadioManager.METADATA_KEY_RDS_PTY)

        if (stationName != null || radioText != null) {
            _rdsData.value = RDSData(
                stationName = stationName ?: "Unknown",
                radioText = radioText ?: "",
                programType = programType ?: "Unknown"
            )
        }
    }

    /**
     * Get preset FM frequencies for region
     */
    fun getPopularFrequencies(): List<FMStation> {
        // Return popular FM frequencies
        // This should be customized based on user's location
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
     * Release radio tuner
     */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun release() {
        radioTuner?.close()
        radioTuner = null
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
