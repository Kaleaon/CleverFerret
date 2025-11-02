package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.AudioDeviceType
import com.universalmedialibrary.services.music.AudioProfile
import com.universalmedialibrary.services.music.AudioProfileService
import com.universalmedialibrary.services.music.EqualizerPreset
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AudioProfilesViewModel @Inject constructor(
    private val musicPlayerService: AdvancedMusicPlayerService
) : ViewModel() {
    
    private val audioProfileService = musicPlayerService.getAudioProfileService()
    
    private val _currentDeviceType = MutableStateFlow(audioProfileService.detectCurrentDevice())
    val currentDeviceType: StateFlow<AudioDeviceType> = _currentDeviceType.asStateFlow()
    
    private val _autoSwitchEnabled = MutableStateFlow(true)
    val autoSwitchEnabled: StateFlow<Boolean> = _autoSwitchEnabled.asStateFlow()
    
    private val _profiles = MutableStateFlow<Map<AudioDeviceType, AudioProfile>>(emptyMap())
    val profiles: StateFlow<Map<AudioDeviceType, AudioProfile>> = _profiles.asStateFlow()
    
    init {
        loadAllProfiles()
    }
    
    private fun loadAllProfiles() {
        viewModelScope.launch {
            val profileMap = mutableMapOf<AudioDeviceType, AudioProfile>()
            AudioDeviceType.values().forEach { deviceType ->
                audioProfileService.loadProfile(deviceType)?.let { profile ->
                    profileMap[deviceType] = profile
                }
            }
            _profiles.value = profileMap
        }
    }
    
    fun updateProfile(deviceType: AudioDeviceType, eqPreset: EqualizerPreset, bassBoost: Int, reverbPreset: Int) {
        viewModelScope.launch {
            val profile = AudioProfile(
                name = deviceType.displayName,
                deviceType = deviceType,
                eqPreset = eqPreset,
                bassBoost = bassBoost,
                reverbPreset = reverbPreset
            )
            audioProfileService.saveProfile(deviceType, profile)
            loadAllProfiles()
        }
    }
    
    fun resetProfile(deviceType: AudioDeviceType) {
        viewModelScope.launch {
            // Load default profile and save it
            val defaultProfile = audioProfileService.loadProfile(deviceType)
            if (defaultProfile != null) {
                audioProfileService.saveProfile(deviceType, defaultProfile)
            }
            loadAllProfiles()
        }
    }
    
    fun setAutoSwitchEnabled(enabled: Boolean) {
        _autoSwitchEnabled.value = enabled
        // Note: Auto-switching is always active in AudioProfileService.
        // This toggle is for UI state only. To disable auto-switching,
        // the AudioProfileService would need a new method added.
    }
    
    fun refreshCurrentDevice() {
        viewModelScope.launch {
            _currentDeviceType.value = audioProfileService.detectCurrentDevice()
            audioProfileService.loadAndApplyProfile()
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AudioProfilesScreen(
    viewModel: AudioProfilesViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit = {}
) {
    val currentDevice by viewModel.currentDeviceType.collectAsState()
    val autoSwitchEnabled by viewModel.autoSwitchEnabled.collectAsState()
    val profiles by viewModel.profiles.collectAsState()
    
    var expandedDevice by remember { mutableStateOf<AudioDeviceType?>(currentDevice) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Audio Profiles") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Info Card
            ElevatedCard {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(Icons.Default.Info, "Info", tint = MaterialTheme.colorScheme.primary)
                        Text(
                            "Audio Profiles",
                            style = MaterialTheme.typography.titleMedium,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                    Text(
                        "Automatically apply different audio settings based on your output device. " +
                        "Each device type can have custom EQ, bass boost, and reverb settings.",
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
            
            // Current Device Card
            ElevatedCard(
                colors = CardDefaults.elevatedCardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            getDeviceIcon(currentDevice),
                            "Current Device",
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            "Current Device",
                            style = MaterialTheme.typography.titleMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                    Text(
                        getDeviceName(currentDevice),
                        style = MaterialTheme.typography.headlineSmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    TextButton(onClick = { viewModel.refreshCurrentDevice() }) {
                        Text("Refresh Device Detection")
                    }
                }
            }
            
            // Auto-Switch Toggle
            ElevatedCard {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            "Auto-Switch Profiles",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Text(
                            "Automatically switch audio profiles when device changes",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    Switch(
                        checked = autoSwitchEnabled,
                        onCheckedChange = { viewModel.setAutoSwitchEnabled(it) }
                    )
                }
            }
            
            // Device Profiles List
            Text(
                "Device Profiles",
                style = MaterialTheme.typography.titleLarge
            )
            
            AudioDeviceType.values().filter { it != AudioDeviceType.UNKNOWN }.forEach { deviceType ->
                DeviceProfileCard(
                    deviceType = deviceType,
                    profile = profiles[deviceType],
                    isExpanded = expandedDevice == deviceType,
                    isCurrent = deviceType == currentDevice,
                    onExpandToggle = {
                        expandedDevice = if (expandedDevice == deviceType) null else deviceType
                    },
                    onSave = { eqPreset, bassBoost, reverbPreset ->
                        viewModel.updateProfile(deviceType, eqPreset, bassBoost, reverbPreset)
                    },
                    onReset = {
                        viewModel.resetProfile(deviceType)
                    }
                )
            }
        }
    }
}

@Composable
fun DeviceProfileCard(
    deviceType: AudioDeviceType,
    profile: AudioProfile?,
    isExpanded: Boolean,
    isCurrent: Boolean,
    onExpandToggle: () -> Unit,
    onSave: (EqualizerPreset, Int, Int) -> Unit,
    onReset: () -> Unit
) {
    var eqPreset by remember(profile) { mutableStateOf(profile?.eqPreset ?: EqualizerPreset.FLAT) }
    var bassBoost by remember(profile) { mutableStateOf(profile?.bassBoost ?: 500) }
    var reverbPreset by remember(profile) { mutableStateOf(profile?.reverbPreset ?: 0) }
    
    ElevatedCard(
        colors = if (isCurrent) {
            CardDefaults.elevatedCardColors(
                containerColor = MaterialTheme.colorScheme.secondaryContainer
            )
        } else {
            CardDefaults.elevatedCardColors()
        }
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            // Header
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(12.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(
                        getDeviceIcon(deviceType),
                        "Device Type",
                        tint = if (isCurrent) 
                            MaterialTheme.colorScheme.onSecondaryContainer 
                        else 
                            MaterialTheme.colorScheme.onSurface
                    )
                    Column {
                        Text(
                            getDeviceName(deviceType),
                            style = MaterialTheme.typography.titleMedium
                        )
                        if (isCurrent) {
                            Text(
                                "Active Now",
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.primary
                            )
                        }
                    }
                }
                IconButton(onClick = onExpandToggle) {
                    Icon(
                        if (isExpanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                        "Expand/Collapse"
                    )
                }
            }
            
            // Expanded Content
            if (isExpanded) {
                Spacer(modifier = Modifier.height(16.dp))
                HorizontalDivider()
                Spacer(modifier = Modifier.height(16.dp))
                
                // EQ Preset
                Text("Equalizer Preset", style = MaterialTheme.typography.labelLarge)
                Spacer(modifier = Modifier.height(8.dp))
                var eqExpanded by remember { mutableStateOf(false) }
                ExposedDropdownMenuBox(
                    expanded = eqExpanded,
                    onExpandedChange = { eqExpanded = it }
                ) {
                    OutlinedTextField(
                        value = eqPreset.name.replace("_", " "),
                        onValueChange = { },
                        readOnly = true,
                        label = { Text("EQ Preset") },
                        trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = eqExpanded) },
                        modifier = Modifier.fillMaxWidth().menuAnchor()
                    )
                    ExposedDropdownMenu(
                        expanded = eqExpanded,
                        onDismissRequest = { eqExpanded = false }
                    ) {
                        EqualizerPreset.values().forEach { preset ->
                            DropdownMenuItem(
                                text = { Text(preset.name.replace("_", " ")) },
                                onClick = {
                                    eqPreset = preset
                                    eqExpanded = false
                                }
                            )
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Bass Boost
                Text("Bass Boost: $bassBoost", style = MaterialTheme.typography.labelLarge)
                Slider(
                    value = bassBoost.toFloat(),
                    onValueChange = { bassBoost = it.toInt() },
                    valueRange = 0f..1000f,
                    modifier = Modifier.fillMaxWidth()
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Reverb Preset
                Text("Reverb Preset", style = MaterialTheme.typography.labelLarge)
                Spacer(modifier = Modifier.height(8.dp))
                var reverbExpanded by remember { mutableStateOf(false) }
                ExposedDropdownMenuBox(
                    expanded = reverbExpanded,
                    onExpandedChange = { reverbExpanded = it }
                ) {
                    OutlinedTextField(
                        value = getReverbPresetName(reverbPreset),
                        onValueChange = { },
                        readOnly = true,
                        label = { Text("Reverb") },
                        trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = reverbExpanded) },
                        modifier = Modifier.fillMaxWidth().menuAnchor()
                    )
                    ExposedDropdownMenu(
                        expanded = reverbExpanded,
                        onDismissRequest = { reverbExpanded = false }
                    ) {
                        (0..6).forEach { preset ->
                            DropdownMenuItem(
                                text = { Text(getReverbPresetName(preset)) },
                                onClick = {
                                    reverbPreset = preset
                                    reverbExpanded = false
                                }
                            )
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Action Buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    OutlinedButton(
                        onClick = onReset,
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Reset to Default")
                    }
                    Button(
                        onClick = { onSave(eqPreset, bassBoost, reverbPreset) },
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Save Profile")
                    }
                }
            }
        }
    }
}

fun getDeviceIcon(deviceType: AudioDeviceType) = when (deviceType) {
    AudioDeviceType.WIRED_HEADPHONE -> Icons.Default.Headset
    AudioDeviceType.BLUETOOTH_HEADPHONE -> Icons.Default.Headphones
    AudioDeviceType.PHONE_SPEAKER -> Icons.Default.PhoneAndroid
    AudioDeviceType.CAR_BLUETOOTH -> Icons.Default.DirectionsCar
    AudioDeviceType.USB_AUDIO -> Icons.Default.Usb
    AudioDeviceType.DOCK -> Icons.Default.Speaker
    AudioDeviceType.UNKNOWN -> Icons.Default.QuestionMark
}

fun getDeviceName(deviceType: AudioDeviceType) = deviceType.displayName

fun getReverbPresetName(preset: Int) = when (preset) {
    0 -> "None"
    1 -> "Small Room"
    2 -> "Medium Room"
    3 -> "Large Room"
    4 -> "Medium Hall"
    5 -> "Large Hall"
    6 -> "Plate"
    else -> "None"
}
