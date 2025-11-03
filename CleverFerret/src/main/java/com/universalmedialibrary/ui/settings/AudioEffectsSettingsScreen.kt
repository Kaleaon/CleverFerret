package com.universalmedialibrary.ui.settings

import android.util.Log
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import com.universalmedialibrary.services.music.EqualizerPreset
import com.universalmedialibrary.services.music.ReverbPreset
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Audio Effects Settings Screen
 *
 * Provides UI controls for:
 * - Equalizer presets (8 presets)
 * - Bass boost (0-1000 strength)
 * - Reverb effects (7 presets)
 * - ReplayGain normalization
 * - ReplayGain preamp adjustment
 *
 * Usage in navigation:
 * ```
 * composable("settings/audio-effects") {
 *     AudioEffectsSettingsScreen(
 *         viewModel = hiltViewModel(),
 *         onNavigateBack = { navController.popBackStack() }
 *     )
 * }
 * ```
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AudioEffectsSettingsScreen(
    viewModel: AudioEffectsViewModel,
    onNavigateBack: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    val state by viewModel.state.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Audio Effects") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.resetToDefaults() }) {
                        Icon(Icons.Default.RestartAlt, "Reset to defaults")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Equalizer Section
            ElevatedCard(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(Icons.Default.Equalizer, contentDescription = null)
                        Text(
                            "Equalizer Preset",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }
                    
                    Text(
                        "Choose a preset EQ profile for your audio",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    
                    // EQ Preset Dropdown
                    var expandedEq by remember { mutableStateOf(false) }
                    ExposedDropdownMenuBox(
                        expanded = expandedEq,
                        onExpandedChange = { expandedEq = it }
                    ) {
                        OutlinedTextField(
                            value = state.selectedEqPreset.name.replace("_", " "),
                            onValueChange = {},
                            readOnly = true,
                            label = { Text("EQ Preset") },
                            trailingIcon = {
                                ExposedDropdownMenuDefaults.TrailingIcon(expanded = expandedEq)
                            },
                            modifier = Modifier
                                .fillMaxWidth()
                                .menuAnchor()
                        )
                        ExposedDropdownMenu(
                            expanded = expandedEq,
                            onDismissRequest = { expandedEq = false }
                        ) {
                            EqualizerPreset.values().forEach { preset ->
                                DropdownMenuItem(
                                    text = { Text(preset.name.replace("_", " ")) },
                                    onClick = {
                                        viewModel.setEqPreset(preset)
                                        expandedEq = false
                                    }
                                )
                            }
                        }
                    }
                }
            }

            // Bass Boost Section
            ElevatedCard(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(Icons.Default.GraphicEq, contentDescription = null)
                        Text(
                            "Bass Boost",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }
                    
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text("Strength")
                        Text(
                            "${state.bassBoostStrength}/1000",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                    
                    Slider(
                        value = state.bassBoostStrength.toFloat(),
                        onValueChange = { viewModel.setBassBoost(it.toInt()) },
                        valueRange = 0f..1000f,
                        steps = 99,
                        modifier = Modifier.fillMaxWidth()
                    )
                    
                    Text(
                        "Increase bass frequencies for deeper sound",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Reverb Section
            ElevatedCard(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Icon(Icons.Default.Audiotrack, contentDescription = null)
                            Text(
                                "Reverb",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold
                            )
                        }
                        Switch(
                            checked = state.reverbEnabled,
                            onCheckedChange = { viewModel.setReverbEnabled(it) }
                        )
                    }
                    
                    if (state.reverbEnabled) {
                        var expandedReverb by remember { mutableStateOf(false) }
                        ExposedDropdownMenuBox(
                            expanded = expandedReverb,
                            onExpandedChange = { expandedReverb = it }
                        ) {
                            OutlinedTextField(
                                value = state.reverbPreset.name.replace("_", " "),
                                onValueChange = {},
                                readOnly = true,
                                label = { Text("Reverb Type") },
                                trailingIcon = {
                                    ExposedDropdownMenuDefaults.TrailingIcon(expanded = expandedReverb)
                                },
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .menuAnchor()
                            )
                            ExposedDropdownMenu(
                                expanded = expandedReverb,
                                onDismissRequest = { expandedReverb = false }
                            ) {
                                ReverbPreset.values().filter { it != ReverbPreset.NONE }.forEach { preset ->
                                    DropdownMenuItem(
                                        text = { Text(preset.name.replace("_", " ")) },
                                        onClick = {
                                            viewModel.setReverbPreset(preset)
                                            expandedReverb = false
                                        }
                                    )
                                }
                            }
                        }
                    }
                }
            }

            // ReplayGain Section
            ElevatedCard(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Icon(Icons.Default.VolumeUp, contentDescription = null)
                            Text(
                                "ReplayGain",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold
                            )
                        }
                        Switch(
                            checked = state.replayGainEnabled,
                            onCheckedChange = { viewModel.setReplayGainEnabled(it) }
                        )
                    }
                    
                    Text(
                        "Normalize volume across tracks to prevent loud/quiet jumps",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    
                    if (state.replayGainEnabled) {
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Preamp Adjustment")
                            Text(
                                "${if (state.replayGainPreamp >= 0) "+" else ""}${state.replayGainPreamp} dB",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.primary
                            )
                        }
                        
                        Slider(
                            value = state.replayGainPreamp.toFloat(),
                            onValueChange = { viewModel.setReplayGainPreamp(it.toInt()) },
                            valueRange = -15f..15f,
                            steps = 29,
                            modifier = Modifier.fillMaxWidth()
                        )
                        
                        Text(
                            "Fine-tune overall volume (negative = quieter, positive = louder)",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }

            // Info Card
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
                )
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Icon(
                        Icons.Default.Info,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Column {
                        Text(
                            "Audio effects are applied in real-time during playback and saved per device type.",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
            }
        }
    }
}

/**
 * ViewModel for Audio Effects Settings
 */
@HiltViewModel
class AudioEffectsViewModel @Inject constructor(
    private val musicPlayerService: AdvancedMusicPlayerService
) : ViewModel() {
    
    private val _state = MutableStateFlow(AudioEffectsState())
    val state: StateFlow<AudioEffectsState> = _state.asStateFlow()
    
    init {
        // Load current settings from service
        loadCurrentSettings()
    }
    
    private fun loadCurrentSettings() {
        viewModelScope.launch {
            try {
                val snapshot = musicPlayerService.getAudioEffectsSnapshot()
                _state.value = AudioEffectsState(
                    selectedEqPreset = snapshot.eqPreset,
                    bassBoostStrength = snapshot.bassBoostStrength,
                    reverbEnabled = snapshot.reverbEnabled,
                    reverbPreset = snapshot.reverbPreset,
                    replayGainEnabled = snapshot.replayGainEnabled,
                    replayGainPreamp = snapshot.replayGainPreamp
                )
            } catch (e: Exception) {
                Log.w("AudioEffectsViewModel", "Unable to load audio effects snapshot", e)
                _state.value = AudioEffectsState()
            }
        }
    }
    
    fun setEqPreset(preset: EqualizerPreset) {
        viewModelScope.launch {
            _state.value = _state.value.copy(selectedEqPreset = preset)
            musicPlayerService.setEqualizerPreset(preset.ordinal)
        }
    }
    
    fun setBassBoost(strength: Int) {
        viewModelScope.launch {
            _state.value = _state.value.copy(bassBoostStrength = strength)
            musicPlayerService.setBassBoost(strength)
        }
    }
    
    fun setReverbEnabled(enabled: Boolean) {
        viewModelScope.launch {
            _state.value = _state.value.copy(reverbEnabled = enabled)
            musicPlayerService.enableReverb(enabled)
        }
    }
    
    fun setReverbPreset(preset: ReverbPreset) {
        viewModelScope.launch {
            _state.value = _state.value.copy(reverbPreset = preset)
            musicPlayerService.setReverbPreset(preset)
        }
    }
    
    fun setReplayGainEnabled(enabled: Boolean) {
        viewModelScope.launch {
            _state.value = _state.value.copy(replayGainEnabled = enabled)
            musicPlayerService.setReplayGainEnabled(enabled)
        }
    }
    
    fun setReplayGainPreamp(preamp: Int) {
        viewModelScope.launch {
            _state.value = _state.value.copy(replayGainPreamp = preamp)
            musicPlayerService.setReplayGainPreamp(preamp)
        }
    }
    
    fun resetToDefaults() {
        _state.value = AudioEffectsState()
        // Apply defaults to service
        viewModelScope.launch {
            musicPlayerService.setEqualizerPreset(EqualizerPreset.FLAT.ordinal)
            musicPlayerService.setBassBoost(0)
            musicPlayerService.setReverbPreset(ReverbPreset.SMALL_ROOM)
            musicPlayerService.enableReverb(false)
            musicPlayerService.setReplayGainEnabled(true)
            musicPlayerService.setReplayGainPreamp(0)
        }
    }
}

/**
 * Audio Effects Settings State
 */
data class AudioEffectsState(
    val selectedEqPreset: EqualizerPreset = EqualizerPreset.FLAT,
    val bassBoostStrength: Int = 0,
    val reverbEnabled: Boolean = false,
    val reverbPreset: ReverbPreset = ReverbPreset.SMALL_ROOM,
    val replayGainEnabled: Boolean = true,
    val replayGainPreamp: Int = 0
)
