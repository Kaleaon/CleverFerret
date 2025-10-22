package com.universalmedialibrary.services.visualizer

import android.content.Context
import android.media.audiofx.Visualizer
import androidx.media3.exoplayer.ExoPlayer
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.log10
import kotlin.math.sqrt

/**
 * Audio Visualizer Service inspired by projectM
 *
 * Captures audio data from ExoPlayer and provides real-time visualization data
 * for projectM-style visual effects that can be displayed and cast via Chromecast
 */
@Singleton
@androidx.media3.common.util.UnstableApi
class AudioVisualizerService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private var visualizer: Visualizer? = null
    private var captureSize = 0
    private var currentPlayer: ExoPlayer? = null

    private val _visualizerState = MutableStateFlow(VisualizerState())
    val visualizerState: StateFlow<VisualizerState> = _visualizerState.asStateFlow()

    private val _isEnabled = MutableStateFlow(false)
    val isEnabled: StateFlow<Boolean> = _isEnabled.asStateFlow()

    /**
     * Attach visualizer to an ExoPlayer instance
     */
    fun attachToPlayer(player: ExoPlayer) {
        try {
            // Only re-attach if player changed
            if (currentPlayer == player && visualizer != null && visualizer?.enabled == true) {
                return
            }
            
            release()
            currentPlayer = player

            // Get audio session ID from ExoPlayer
            val audioSessionId = player.audioSessionId
            
            // Validate audio session ID
            if (audioSessionId == 0) {
                _visualizerState.value = _visualizerState.value.copy(
                    error = "Invalid audio session ID. Player may not be ready."
                )
                return
            }

            visualizer = Visualizer(audioSessionId).apply {
                captureSize = Visualizer.getCaptureSizeRange()[1]
                scalingMode = Visualizer.SCALING_MODE_NORMALIZED

                // Set up data capture callback
                setDataCaptureListener(
                    object : Visualizer.OnDataCaptureListener {
                        override fun onWaveFormDataCapture(
                            visualizer: Visualizer?,
                            waveform: ByteArray?,
                            samplingRate: Int
                        ) {
                            waveform?.let { processWaveform(it) }
                        }

                        override fun onFftDataCapture(
                            visualizer: Visualizer?,
                            fft: ByteArray?,
                            samplingRate: Int
                        ) {
                            fft?.let { processFft(it) }
                        }
                    },
                    Visualizer.getMaxCaptureRate() / 2,
                    true,
                    true
                )

                enabled = true
                _isEnabled.value = true
            }
        } catch (e: Exception) {
            _visualizerState.value = _visualizerState.value.copy(
                error = "Failed to attach visualizer: ${e.message}"
            )
        }
    }

    /**
     * Process waveform data for projectM-style time-domain visualization
     */
    private fun processWaveform(waveform: ByteArray) {
        val normalized = waveform.map { byte ->
            ((byte.toInt() and 0xFF) - 128) / 128f
        }

        _visualizerState.value = _visualizerState.value.copy(
            waveform = normalized,
            timestamp = System.currentTimeMillis()
        )
    }

    /**
     * Process FFT data for frequency-domain visualization
     */
    private fun processFft(fft: ByteArray) {
        val magnitudes = mutableListOf<Float>()
        val numBands = fft.size / 2

        for (i in 0 until numBands step 2) {
            val real = fft[i].toInt()
            val imaginary = fft[i + 1].toInt()
            val magnitude = sqrt((real * real + imaginary * imaginary).toDouble()).toFloat()
            magnitudes.add(magnitude)
        }

        // Calculate frequency bands for projectM-style visualization
        val bands = calculateFrequencyBands(magnitudes)

        _visualizerState.value = _visualizerState.value.copy(
            fftData = magnitudes,
            frequencyBands = bands,
            timestamp = System.currentTimeMillis()
        )
    }

    /**
     * Calculate frequency bands similar to projectM's approach
     */
    private fun calculateFrequencyBands(magnitudes: List<Float>): FrequencyBands {
        val numBands = magnitudes.size
        if (numBands == 0) return FrequencyBands()

        val bassEnd = (numBands * 0.1).toInt()
        val midEnd = (numBands * 0.5).toInt()

        val bass = magnitudes.take(bassEnd).average().toFloat()
        val mid = magnitudes.subList(bassEnd, midEnd).average().toFloat()
        val treble = magnitudes.subList(midEnd, numBands).average().toFloat()

        return FrequencyBands(
            bass = normalizeLevel(bass),
            mid = normalizeLevel(mid),
            treble = normalizeLevel(treble),
            spectrum = magnitudes.map { normalizeLevel(it) }
        )
    }

    /**
     * Normalize audio level to 0.0-1.0 range
     */
    private fun normalizeLevel(level: Float): Float {
        return (level / 255f).coerceIn(0f, 1f)
    }

    /**
     * Calculate dB level from magnitude
     */
    private fun calculateDb(magnitude: Float): Float {
        return if (magnitude > 0) {
            (20 * log10(magnitude.toDouble())).toFloat()
        } else {
            -96f // Minimum dB
        }
    }

    /**
     * Enable or disable the visualizer
     */
    fun setEnabled(enabled: Boolean) {
        visualizer?.enabled = enabled
        _isEnabled.value = enabled
    }

    /**
     * Release visualizer resources
     */
    fun release() {
        try {
            visualizer?.enabled = false
            visualizer?.release()
            visualizer = null
            currentPlayer = null
            _isEnabled.value = false
            _visualizerState.value = VisualizerState()
        } catch (e: Exception) {
            // Ignore release errors
        }
    }
    
    /**
     * Get the currently attached player
     */
    fun getCurrentPlayer(): ExoPlayer? = currentPlayer
}

/**
 * State of the audio visualizer
 */
data class VisualizerState(
    val waveform: List<Float> = emptyList(),
    val fftData: List<Float> = emptyList(),
    val frequencyBands: FrequencyBands = FrequencyBands(),
    val timestamp: Long = 0,
    val error: String? = null
)

/**
 * Frequency band levels for easy visualization
 */
data class FrequencyBands(
    val bass: Float = 0f,
    val mid: Float = 0f,
    val treble: Float = 0f,
    val spectrum: List<Float> = emptyList()
)
