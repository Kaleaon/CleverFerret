package com.universalmedialibrary.services.music

import android.annotation.SuppressLint
import android.content.Context
import android.content.SharedPreferences
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Per-Device Audio Profile Service
 * 
 * Manages different audio settings (EQ, effects) for different output devices:
 * - Headphones (wired/wireless)
 * - Speakers (internal/external)
 * - Car audio (USB/Bluetooth)
 * - Bluetooth devices
 * 
 * Automatically switches profiles when audio output changes.
 */
@Singleton
class AudioProfileService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val audioEffectsService: AudioEffectsService
) {
    
    private val TAG = "AudioProfileService"
    private val prefs: SharedPreferences = context.getSharedPreferences("audio_profiles", Context.MODE_PRIVATE)
    
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    
    private val _currentProfile = MutableStateFlow<AudioProfile?>(null)
    val currentProfile: StateFlow<AudioProfile?> = _currentProfile.asStateFlow()
    
    private val _currentDeviceType = MutableStateFlow(AudioDeviceType.UNKNOWN)
    val currentDeviceType: StateFlow<AudioDeviceType> = _currentDeviceType.asStateFlow()
    
    /**
     * Initialize and detect current audio device
     */
    fun initialize() {
        detectCurrentDevice()
        loadAndApplyProfile()
    }
    
    /**
     * Detect current audio output device
     */
    fun detectCurrentDevice(): AudioDeviceType {
        val deviceType = detectDevice()
        _currentDeviceType.value = deviceType
        return deviceType
    }
    
    private fun detectDevice(): AudioDeviceType {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return detectLegacyDevice()
        }

        val devices = audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)
        for (device in devices) {
            mapDeviceType(device)?.let { return it }
        }
        return detectLegacyDevice()
    }

    private fun detectLegacyDevice(): AudioDeviceType {
        return when {
            audioManager.isBluetoothA2dpOn || audioManager.isBluetoothScoOn -> AudioDeviceType.BLUETOOTH_HEADPHONE
            audioManager.isWiredHeadsetOn -> AudioDeviceType.WIRED_HEADPHONE
            else -> AudioDeviceType.PHONE_SPEAKER
        }
    }

    @SuppressLint("SwitchIntDef")
    private fun mapDeviceType(device: AudioDeviceInfo): AudioDeviceType? {
        return when (device.type) {
            AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
            AudioDeviceInfo.TYPE_WIRED_HEADSET,
            AudioDeviceInfo.TYPE_LINE_ANALOG,
            AudioDeviceInfo.TYPE_LINE_DIGITAL,
            AudioDeviceInfo.TYPE_AUX_LINE -> AudioDeviceType.WIRED_HEADPHONE

            AudioDeviceInfo.TYPE_USB_HEADSET,
            AudioDeviceInfo.TYPE_USB_DEVICE,
            AudioDeviceInfo.TYPE_USB_ACCESSORY -> AudioDeviceType.USB_AUDIO

            AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            AudioDeviceInfo.TYPE_BLE_HEADSET,
            AudioDeviceInfo.TYPE_BLE_SPEAKER,
            AudioDeviceInfo.TYPE_BLE_BROADCAST -> {
                val productName = device.productName?.toString()?.lowercase() ?: ""
                if (productName.contains("car") || productName.contains("auto")) {
                    AudioDeviceType.CAR_BLUETOOTH
                } else {
                    AudioDeviceType.BLUETOOTH_HEADPHONE
                }
            }

            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER_SAFE,
            AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
            AudioDeviceInfo.TYPE_TELEPHONY -> AudioDeviceType.PHONE_SPEAKER

            AudioDeviceInfo.TYPE_HDMI,
            AudioDeviceInfo.TYPE_HDMI_ARC,
            AudioDeviceInfo.TYPE_HDMI_EARC,
            AudioDeviceInfo.TYPE_DOCK,
            AudioDeviceInfo.TYPE_DOCK_ANALOG,
            AudioDeviceInfo.TYPE_BUS -> AudioDeviceType.DOCK

            AudioDeviceInfo.TYPE_IP,
            AudioDeviceInfo.TYPE_MULTICHANNEL_GROUP,
            AudioDeviceInfo.TYPE_FM,
            AudioDeviceInfo.TYPE_FM_TUNER,
            AudioDeviceInfo.TYPE_REMOTE_SUBMIX,
            AudioDeviceInfo.TYPE_TV_TUNER,
            AudioDeviceInfo.TYPE_UNKNOWN -> AudioDeviceType.UNKNOWN

            else -> null
        }
    }
    
    /**
     * Load and apply profile for current device
     */
    fun loadAndApplyProfile() {
        val deviceType = _currentDeviceType.value
        val profile = loadProfile(deviceType)
        
        if (profile != null) {
            applyProfile(profile)
            _currentProfile.value = profile
        }
    }
    
    /**
     * Apply an audio profile
     */
    fun applyProfile(profile: AudioProfile) {
        try {
            // Apply EQ preset
            audioEffectsService.applyEqualizerPreset(profile.eqPreset)
            
            // Apply bass boost
            audioEffectsService.setBassBoost(profile.bassBoost, enabled = profile.bassBoost > 0)
            
            // Apply reverb
            audioEffectsService.setReverb(
                when (profile.reverbPreset) {
                    0 -> ReverbPreset.NONE
                    1 -> ReverbPreset.SMALL_ROOM
                    2 -> ReverbPreset.MEDIUM_ROOM
                    3 -> ReverbPreset.LARGE_ROOM
                    4 -> ReverbPreset.MEDIUM_HALL
                    5 -> ReverbPreset.LARGE_HALL
                    6 -> ReverbPreset.PLATE
                    else -> ReverbPreset.NONE
                },
                enabled = profile.reverbPreset > 0
            )
            
            _currentProfile.value = profile
            Log.d(TAG, "Applied profile for ${_currentDeviceType.value}")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to apply profile", e)
        }
    }
    
    /**
     * Save current settings as a profile for the device type
     */
    fun saveProfile(deviceType: AudioDeviceType, profile: AudioProfile) {
        val key = "profile_${deviceType.name.lowercase()}"
        prefs.edit().apply {
            putInt("${key}_eq", profile.eqPreset.ordinal)
            putInt("${key}_bass", profile.bassBoost)
            putInt("${key}_reverb", profile.reverbPreset)
            putString("${key}_name", profile.name)
            apply()
        }
        
        // If this is the current device, apply immediately
        if (deviceType == _currentDeviceType.value) {
            applyProfile(profile)
        }
    }
    
    /**
     * Load profile for a device type
     */
    fun loadProfile(deviceType: AudioDeviceType): AudioProfile? {
        val key = "profile_${deviceType.name.lowercase()}"
        
        if (!prefs.contains("${key}_eq")) {
            // Return default profile for this device type
            return getDefaultProfile(deviceType)
        }
        
        val eqOrdinal = prefs.getInt("${key}_eq", 0)
        val eqPreset = EqualizerPreset.values().getOrNull(eqOrdinal) ?: EqualizerPreset.FLAT
        
        return AudioProfile(
            name = prefs.getString("${key}_name", deviceType.displayName) ?: deviceType.displayName,
            deviceType = deviceType,
            eqPreset = eqPreset,
            bassBoost = prefs.getInt("${key}_bass", 0),
            reverbPreset = prefs.getInt("${key}_reverb", 0)
        )
    }
    
    /**
     * Get default profile for device type
     */
    private fun getDefaultProfile(deviceType: AudioDeviceType): AudioProfile {
        return when (deviceType) {
            AudioDeviceType.WIRED_HEADPHONE -> AudioProfile(
                name = "Headphones",
                deviceType = deviceType,
                eqPreset = EqualizerPreset.FLAT,
                bassBoost = 300,
                reverbPreset = 0
            )
            AudioDeviceType.BLUETOOTH_HEADPHONE -> AudioProfile(
                name = "Bluetooth",
                deviceType = deviceType,
                eqPreset = EqualizerPreset.BASS_BOOST,
                bassBoost = 400,
                reverbPreset = 0
            )
            AudioDeviceType.PHONE_SPEAKER -> AudioProfile(
                name = "Phone Speaker",
                deviceType = deviceType,
                eqPreset = EqualizerPreset.VOCAL,
                bassBoost = 600,
                reverbPreset = 1 // Small room
            )
            AudioDeviceType.CAR_BLUETOOTH -> AudioProfile(
                name = "Car Audio",
                deviceType = deviceType,
                eqPreset = EqualizerPreset.BASS_BOOST,
                bassBoost = 500,
                reverbPreset = 0
            )
            AudioDeviceType.USB_AUDIO -> AudioProfile(
                name = "USB Audio",
                deviceType = deviceType,
                eqPreset = EqualizerPreset.FLAT,
                bassBoost = 0,
                reverbPreset = 0
            )
            AudioDeviceType.DOCK -> AudioProfile(
                name = "Dock",
                deviceType = deviceType,
                eqPreset = EqualizerPreset.FLAT,
                bassBoost = 200,
                reverbPreset = 0
            )
            else -> AudioProfile(
                name = "Default",
                deviceType = deviceType,
                eqPreset = EqualizerPreset.FLAT,
                bassBoost = 0,
                reverbPreset = 0
            )
        }
    }
    
    /**
     * Get all saved profiles
     */
    fun getAllProfiles(): List<AudioProfile> {
        return AudioDeviceType.values().mapNotNull { deviceType ->
            loadProfile(deviceType)
        }
    }
    
    /**
     * Delete a profile (revert to default)
     */
    fun deleteProfile(deviceType: AudioDeviceType) {
        val key = "profile_${deviceType.name.lowercase()}"
        prefs.edit().apply {
            remove("${key}_eq")
            remove("${key}_bass")
            remove("${key}_reverb")
            remove("${key}_name")
            apply()
        }
    }
}

/**
 * Audio device types
 */
enum class AudioDeviceType(val displayName: String) {
    WIRED_HEADPHONE("Wired Headphones"),
    BLUETOOTH_HEADPHONE("Bluetooth Headphones"),
    PHONE_SPEAKER("Phone Speaker"),
    CAR_BLUETOOTH("Car Audio"),
    USB_AUDIO("USB Audio"),
    DOCK("Dock/External Speaker"),
    UNKNOWN("Unknown Device")
}

/**
 * Audio profile for a device
 */
data class AudioProfile(
    val name: String,
    val deviceType: AudioDeviceType,
    val eqPreset: EqualizerPreset,
    val bassBoost: Int, // 0-1000
    val reverbPreset: Int // 0-6
)
