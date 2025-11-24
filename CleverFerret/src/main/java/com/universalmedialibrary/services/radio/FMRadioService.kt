package com.universalmedialibrary.services.radio

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.media.MediaRecorder
import android.os.Handler
import android.os.Looper
import androidx.core.content.ContextCompat
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import java.io.File
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for FM radio tuning.
 * 
 * NOTE: The Android 'RadioManager' System API is not available in the standard SDK used for this build.
 * To provide a "working" radio design as requested, this service implements:
 * 1. A Simulation Mode for Tuning (updates UI state, signal strength).
 * 2. Real Recording logic using MediaRecorder (with fallback to Mic if RADIO_TUNER source is hidden/unavailable).
 * 3. RDS Data simulation.
 * 
 * When building in a system environment with android.hardware.radio.* available, uncomment the RadioManager logic.
 */
@Singleton
class FMRadioService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val radioDnsService: RadioDnsService
) {

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    // Placeholder for real RadioManager
    // private var radioManager: RadioManager? = null
    // private var radioTuner: RadioTuner? = null
    
    private var recorder: MediaRecorder? = null

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

    private val _isRecording = MutableStateFlow(false)
    val isRecording: StateFlow<Boolean> = _isRecording.asStateFlow()

    init {
        checkFMHardwareAvailability()
    }

    private fun checkFMHardwareAvailability() {
        // In a real app, check PackageManager.FEATURE_BROADCAST_RADIO
        // For this simulation/stub build, we enable it if permissions are granted (or always true for demo)
        _isAvailable.value = true 
    }

    fun initialize(): Boolean {
        // Simulate initialization
        return true
    }

    fun tune(frequencyKhz: Int): Boolean {
        _currentFrequency.value = frequencyKhz
        
        // Simulate tuning delay and lock
        scope.launch {
            _signalStrength.value = 0
            delay(500)
            // Simulate finding a station at specific frequencies
            if (frequencyKhz % 1000 == 0 || frequencyKhz % 500 == 0) {
                _signalStrength.value = 95
                _rdsData.value = RDSData(
                    stationName = "SimRadio ${formatFrequency(frequencyKhz)}",
                    radioText = "Playing the hits...",
                    programType = "Pop"
                )
            } else {
                _signalStrength.value = 20 // Weak signal
                _rdsData.value = null
            }
        }
        return true
    }

    fun play() {
        _isPlaying.value = true
    }

    fun stop() {
        _isPlaying.value = false
        if (_isRecording.value) {
            stopRecording()
        }
    }

    fun scanUp() {
        // Simulate scan
        val current = _currentFrequency.value
        tune(current + 500) // Jump to next likely simulated station
    }

    fun scanDown() {
        val current = _currentFrequency.value
        tune(current - 500)
    }

    /**
     * Start recording FM audio using MediaRecorder.
     * Implements the recording feature found in the FMRadio.apk analysis.
     */
    fun startRecording(outputFile: File): Boolean {
        if (recorder != null) return false
        
        try {
            recorder = MediaRecorder().apply {
                // Try to use RADIO_TUNER source (1998) which is hidden but often available on FM devices
                try {
                    setAudioSource(1998) 
                } catch (e: Exception) {
                    // Fallback to MIC for simulation/testing on non-FM devices
                    setAudioSource(MediaRecorder.AudioSource.MIC)
                }
                
                setOutputFormat(MediaRecorder.OutputFormat.MPEG_4)
                setAudioEncoder(MediaRecorder.AudioEncoder.AAC)
                setAudioEncodingBitRate(128000)
                setAudioSamplingRate(44100)
                setOutputFile(outputFile.absolutePath)
                prepare()
                start()
            }
            _isRecording.value = true
            return true
        } catch (e: IOException) {
            e.printStackTrace()
            recorder = null
            return false
        } catch (e: Exception) {
            e.printStackTrace()
            recorder = null
            return false
        }
    }

    fun stopRecording() {
        try {
            recorder?.stop()
            recorder?.release()
        } catch (e: Exception) {
            e.printStackTrace()
        } finally {
            recorder = null
            _isRecording.value = false
        }
    }

    fun getPopularFrequencies(): List<FMStation> {
        // Return simulated presets
        return listOf(
            FMStation("SimHit 1", 89500),
            FMStation("SimNews", 92300),
            FMStation("SimClassic", 101500)
        )
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
