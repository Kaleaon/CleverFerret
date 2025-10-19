package com.universalmedialibrary.audio

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioDeviceInfo
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Build
import androidx.annotation.RequiresApi
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * USB DAC and audio device manager
 * Handles detection, selection, and configuration of audio output devices
 */
@Singleton
class DACManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    
    private val _selectedDevice = MutableStateFlow<DACInfo?>(null)
    val selectedDevice: StateFlow<DACInfo?> = _selectedDevice.asStateFlow()
    
    private val _availableDevices = MutableStateFlow<List<DACInfo>>(emptyList())
    val availableDevices: StateFlow<List<DACInfo>> = _availableDevices.asStateFlow()
    
    private val _exclusiveModeEnabled = MutableStateFlow(false)
    val exclusiveModeEnabled: StateFlow<Boolean> = _exclusiveModeEnabled.asStateFlow()
    
    init {
        refreshDevices()
    }
    
    /**
     * Detect all connected audio output devices
     */
    fun refreshDevices() {
        val devices = audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)
            .filter { isAudioOutputDevice(it) }
            .map { createDACInfo(it) }
        
        _availableDevices.value = devices
        
        // Auto-select USB DAC if available
        if (_selectedDevice.value == null) {
            devices.firstOrNull { it.isUSBDAC }?.let { selectDAC(it) }
        }
    }
    
    /**
     * Select a specific audio output device
     */
    fun selectDAC(dac: DACInfo) {
        _selectedDevice.value = dac
        // Note: Actual device routing happens in AudioPlaybackManager
    }
    
    /**
     * Enable bit-perfect (exclusive) audio mode
     */
    @RequiresApi(Build.VERSION_CODES.M)
    fun enableExclusiveMode(enabled: Boolean): Boolean {
        _exclusiveModeEnabled.value = enabled
        
        if (!enabled) return true
        
        val device = _selectedDevice.value?.deviceInfo ?: return false
        
        return try {
            // Test if exclusive mode is supported
            val attributes = AudioAttributes.Builder()
                .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                .setUsage(AudioAttributes.USAGE_MEDIA)
                .setFlags(AudioAttributes.FLAG_LOW_LATENCY)
                .build()
            
            val deviceMaxSampleRate = (device.sampleRates?.maxOrNull() ?: 48000)
            
            val format = AudioFormat.Builder()
                .setEncoding(AudioFormat.ENCODING_PCM_24BIT_PACKED)
                .setSampleRate(deviceMaxSampleRate)
                .setChannelMask(AudioFormat.CHANNEL_OUT_STEREO)
                .build()
            
            val track = AudioTrack.Builder()
                .setAudioAttributes(attributes)
                .setAudioFormat(format)
                .setTransferMode(AudioTrack.MODE_STREAM)
                .setBufferSizeInBytes(AudioTrack.getMinBufferSize(
                    deviceMaxSampleRate,
                    AudioFormat.CHANNEL_OUT_STEREO,
                    AudioFormat.ENCODING_PCM_24BIT_PACKED
                ))
                .build()
            
            track.release()
            true
        } catch (e: Exception) {
            _exclusiveModeEnabled.value = false
            false
        }
    }
    
    private fun isAudioOutputDevice(device: AudioDeviceInfo): Boolean {
        return device.type in listOf(
            AudioDeviceInfo.TYPE_USB_DEVICE,
            AudioDeviceInfo.TYPE_USB_ACCESSORY,
            AudioDeviceInfo.TYPE_USB_HEADSET,
            AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
            AudioDeviceInfo.TYPE_WIRED_HEADSET,
            AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
            AudioDeviceInfo.TYPE_AUX_LINE
        )
    }
    
    private fun createDACInfo(device: AudioDeviceInfo): DACInfo {
        val maxSampleRate = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            device.sampleRates?.maxOrNull() ?: 48000
        } else {
            48000
        }
        
        val isUSB = device.type in listOf(
            AudioDeviceInfo.TYPE_USB_DEVICE,
            AudioDeviceInfo.TYPE_USB_ACCESSORY,
            AudioDeviceInfo.TYPE_USB_HEADSET
        )
        
        val calculatedMaxSampleRate = maxSampleRate
        
        return DACInfo(
            deviceInfo = device,
            name = getDeviceName(device),
            maxSampleRate = calculatedMaxSampleRate,
            maxBitDepth = if (calculatedMaxSampleRate >= 96000) 24 else 16,
            supportedFormats = getSupportedFormats(device),
            isUSBDAC = isUSB,
            isBluetooth = device.type == AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
            isWired = device.type in listOf(
                AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
                AudioDeviceInfo.TYPE_WIRED_HEADSET,
                AudioDeviceInfo.TYPE_AUX_LINE
            )
        )
    }
    
    private fun getDeviceName(device: AudioDeviceInfo): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            device.productName.toString().ifEmpty { getDefaultName(device) }
        } else {
            getDefaultName(device)
        }
    }
    
    private fun getDefaultName(device: AudioDeviceInfo): String {
        return when (device.type) {
            AudioDeviceInfo.TYPE_USB_DEVICE -> "USB DAC"
            AudioDeviceInfo.TYPE_USB_ACCESSORY -> "USB Audio"
            AudioDeviceInfo.TYPE_USB_HEADSET -> "USB Headset"
            AudioDeviceInfo.TYPE_BLUETOOTH_A2DP -> "Bluetooth Audio"
            AudioDeviceInfo.TYPE_WIRED_HEADPHONES -> "Wired Headphones"
            AudioDeviceInfo.TYPE_WIRED_HEADSET -> "Wired Headset"
            AudioDeviceInfo.TYPE_AUX_LINE -> "Line Out"
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER -> "Phone Speaker"
            else -> "Audio Device"
        }
    }
    
    private fun getSupportedFormats(device: AudioDeviceInfo): List<Int> {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            device.encodings?.toList() ?: listOf(AudioFormat.ENCODING_PCM_16BIT)
        } else {
            listOf(AudioFormat.ENCODING_PCM_16BIT)
        }
    }
}

/**
 * DAC information data class
 */
data class DACInfo(
    val deviceInfo: AudioDeviceInfo,
    val name: String,
    val maxSampleRate: Int,
    val maxBitDepth: Int,
    val supportedFormats: List<Int>,
    val isUSBDAC: Boolean,
    val isBluetooth: Boolean = false,
    val isWired: Boolean = false
) {
    val displaySpecs: String
        get() = "${maxSampleRate / 1000}kHz / ${maxBitDepth}bit"
    
    val isHiResCapable: Boolean
        get() = maxSampleRate >= 96000 && maxBitDepth >= 24
    
    val qualityBadge: String
        get() = when {
            maxSampleRate >= 192000 -> "Studio"
            maxSampleRate >= 96000 -> "Hi-Res"
            isUSBDAC -> "USB"
            isBluetooth -> "BT"
            else -> "Standard"
        }
}
