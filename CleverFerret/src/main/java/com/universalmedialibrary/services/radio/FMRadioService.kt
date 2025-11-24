package com.universalmedialibrary.services.radio

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for FM radio tuning.
 * Stubbed implementation as hardware RadioManager is not available in this build environment.
 */
@Singleton
class FMRadioService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val radioDnsService: RadioDnsService
) {

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    private val _isAvailable = MutableStateFlow(false)
    val isAvailable: StateFlow<Boolean> = _isAvailable.asStateFlow()

    private val _currentFrequency = MutableStateFlow(87500) // Default start of FM band
    val currentFrequency: StateFlow<Int> = _currentFrequency.asStateFlow()

    private val _signalStrength = MutableStateFlow(0)
    val signalStrength: StateFlow<Int> = _signalStrength.asStateFlow()

    private val _rdsData = MutableStateFlow<RDSData?>(null)
    val rdsData: StateFlow<RDSData?> = _rdsData.asStateFlow()

    private val _dnsMetadata = MutableStateFlow<RadioDnsService.StationMetadata?>(null)
    val dnsMetadata: StateFlow<RadioDnsService.StationMetadata?> = _dnsMetadata.asStateFlow()

    private val _isPlaying = MutableStateFlow(false)
    val isPlaying: StateFlow<Boolean> = _isPlaying.asStateFlow()

    init {
        checkFMHardwareAvailability()
    }

    private fun checkFMHardwareAvailability() {
        // Stub: Force unavailable in this environment
        _isAvailable.value = false
    }

    fun initialize(): Boolean {
        return false
    }

    fun tune(frequencyKhz: Int): Boolean {
        _currentFrequency.value = frequencyKhz
        return false
    }

    fun play() {
        // No-op
    }

    fun stop() {
        _isPlaying.value = false
    }

    fun scanUp() {
        // No-op
    }

    fun scanDown() {
        // No-op
    }

    /**
     * Returns available presets.
     */
    fun getPopularFrequencies(): List<FMStation> {
        return emptyList()
    }

    fun release() {
        stop()
    }

    fun formatFrequency(frequencyKhz: Int): String {
        val mhz = frequencyKhz / 1000.0
        return "%.1f FM".format(mhz)
    }
}

data class RDSData(
    val stationName: String,
    val radioText: String,
    val programType: String
)

data class FMStation(
    val name: String,
    val frequencyKhz: Int,
    val piCode: String? = null
) {
    val displayFrequency: String
        get() = "%.1f FM".format(frequencyKhz / 1000.0)
}
