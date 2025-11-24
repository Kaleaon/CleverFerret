package com.universalmedialibrary.services.radio

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.hardware.radio.ProgramSelector
import android.hardware.radio.RadioManager
import android.hardware.radio.RadioMetadata
import android.hardware.radio.RadioTuner
import android.os.Handler
import android.os.Looper
import androidx.core.content.ContextCompat
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
 * Service for FM radio tuning using Android Hardware Radio API.
 * Requires android.hardware.radio support and ACCESS_BROADCAST_RADIO permission.
 */
@Singleton
class FMRadioService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val radioDnsService: RadioDnsService
) {

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    private var radioManager: RadioManager? = null
    private var radioTuner: RadioTuner? = null
    private var fmModule: RadioManager.ModuleProperties? = null

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
        if (ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_BROADCAST_RADIO) 
            != PackageManager.PERMISSION_GRANTED) {
            _isAvailable.value = false
            return
        }

        try {
            radioManager = context.getSystemService(Context.RADIO_SERVICE) as? RadioManager
            val modules = ArrayList<RadioManager.ModuleProperties>()
            val result = radioManager?.listModules(modules)
            
            if (result != RadioManager.STATUS_OK) {
                _isAvailable.value = false
                return
            }

            // Find FM tuner module
            fmModule = modules.firstOrNull { module ->
                module.isImplementor("FM") || // Check for generic FM
                module.bands.any { band -> 
                    // Check if any band is FM
                    // Note: We can't easily check band type directly on older APIs without casting,
                    // but usually FM is around 87.5-108 MHz.
                    // Simply picking the first one that supports FM frequency range is a heuristic.
                    // But identifying by class is better if available.
                    // RadioManager.ModuleProperties doesn't have a clean "isFM" check, 
                    // but we can check band descriptors if we really want to be precise.
                    // For now, we'll assume if we have a tuner, we can try to use it.
                    true 
                }
            }
            // Better filter: look for classId if relevant, but ModuleProperties structure varies.
            // Let's assume if listModules returns something, we might have a radio.
            // Specifically we want a tuner, not an audio source if separated.
            
            // Let's try to find a module that looks like a radio tuner.
            fmModule = modules.firstOrNull()
            
            _isAvailable.value = fmModule != null

        } catch (e: Exception) {
            e.printStackTrace()
            _isAvailable.value = false
        }
    }

    fun initialize(): Boolean {
        if (!_isAvailable.value || fmModule == null) return false
        if (radioTuner != null) return true // Already initialized

        try {
            radioTuner = radioManager?.openTuner(
                fmModule!!.id,
                null, // BandConfig, null uses default
                true, // withAudio
                object : RadioTuner.Callback() {
                    override fun onProgramInfoChanged(info: RadioManager.ProgramInfo?) {
                        info?.let { updateProgramInfo(it) }
                    }

                    override fun onSignalStrength(strength: Int) {
                        // normalize strength to 0-100 if possible, or just pass it
                        _signalStrength.value = strength
                    }
                    
                    override fun onError(status: Int) {
                        // Handle error
                        if (status != RadioManager.STATUS_OK) {
                             _isPlaying.value = false
                        }
                    }
                },
                Handler(Looper.getMainLooper())
            )
            
            // Initial tune to a safe frequency or retrieve last used
            tune(87500)
            
            return radioTuner != null
        } catch (e: Exception) {
            e.printStackTrace()
            return false
        }
    }

    fun tune(frequencyKhz: Int): Boolean {
        val tuner = radioTuner ?: return false
        
        try {
            // Create a ProgramSelector for FM frequency
            // IdentifierType 1 is usually AM/FM Frequency in kHz
            val selector = ProgramSelector.createAmFmSelector(RadioManager.BAND_FM, frequencyKhz)
            tuner.tune(selector)
            _currentFrequency.value = frequencyKhz
            return true
        } catch (e: Exception) {
            e.printStackTrace()
            return false
        }
    }

    fun play() {
        if (radioTuner != null) {
            val res = radioTuner?.setMute(false)
            if (res == RadioManager.STATUS_OK) {
                _isPlaying.value = true
            }
        } else {
            if (initialize()) {
                play()
            }
        }
    }

    fun stop() {
        radioTuner?.setMute(true)
        _isPlaying.value = false
    }

    fun scanUp() {
        radioTuner?.scan(RadioTuner.DIRECTION_UP, true)
    }

    fun scanDown() {
        radioTuner?.scan(RadioTuner.DIRECTION_DOWN, true)
    }

    /**
     * Returns available presets.
     * Since we are not mocking, this should return stored presets or scan results.
     * For now, returning empty to avoid mockups.
     */
    fun getPopularFrequencies(): List<FMStation> {
        return emptyList()
    }

    fun release() {
        stop()
        radioTuner?.close()
        radioTuner = null
    }

    fun formatFrequency(frequencyKhz: Int): String {
        val mhz = frequencyKhz / 1000.0
        return "%.1f FM".format(mhz)
    }

    private fun updateProgramInfo(info: RadioManager.ProgramInfo) {
        // Extract frequency
        val freq = info.selector.primaryId.toInt()
        _currentFrequency.value = freq
        
        // Extract RDS
        val metadata = info.metadata
        if (metadata != null) {
            val stationName = metadata.getString(RadioMetadata.METADATA_KEY_RDS_PS) ?: ""
            val radioText = metadata.getString(RadioMetadata.METADATA_KEY_RDS_RT) ?: ""
            val pty = metadata.getInt(RadioMetadata.METADATA_KEY_RDS_PTY).toString()
            
            if (stationName.isNotEmpty() || radioText.isNotEmpty()) {
                _rdsData.value = RDSData(stationName, radioText, pty)
            }
            
            // RadioDNS lookup
            // Check if we have PI code (RDS PI)
            // METADATA_KEY_RDS_PI is mapped to 
            // We might need to get PI from selector or metadata if available
            // Usually PI is part of the unique ID of the station in the selector if it's a digital tuner,
            // but for analog FM, it comes via RDS.
            
            // NOTE: RadioMetadata keys for PI might vary or be absent in standard API 
            // depending on vendor implementation.
            
            // Attempt to get PI from metadata if available as an integer
            if (metadata.containsKey(RadioMetadata.METADATA_KEY_RDS_PI)) {
                val pi = metadata.getInt(RadioMetadata.METADATA_KEY_RDS_PI)
                if (pi != 0) {
                    val piHex = "%04X".format(pi)
                     scope.launch {
                        val mhz = freq / 1000.0
                        _dnsMetadata.value = radioDnsService.lookupFmStation(piHex, mhz)
                    }
                }
            }
        }
        
        // Signal strength is also often in ProgramInfo
        // info.signalStrength // if available in newer APIs
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
