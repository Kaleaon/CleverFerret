package com.universalmedialibrary.ui.audio

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.audio.ParametricEqualizer

/**
 * 10-Band Parametric Equalizer Screen
 * Professional audio equalization with presets
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EqualizerScreen(
    onNavigateBack: () -> Unit,
    viewModel: EqualizerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val currentPreset by viewModel.currentPreset.collectAsState()
    val enabled by viewModel.enabled.collectAsState()
    
    var showPresetDialog by remember { mutableStateOf(false) }
    var showSaveDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Equalizer") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    // Enable/Disable toggle
                    Switch(
                        checked = enabled,
                        onCheckedChange = { viewModel.setEnabled(it) }
                    )
                    
                    // Preset menu
                    IconButton(onClick = { showPresetDialog = true }) {
                        Icon(Icons.Default.Tune, "Presets")
                    }
                    
                    // Save preset
                    IconButton(onClick = { showSaveDialog = true }) {
                        Icon(Icons.Default.Save, "Save Preset")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
        ) {
            // Current preset name
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column {
                        Text(
                            text = currentPreset.name,
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = if (enabled) "Enabled" else "Disabled",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        )
                    }
                    
                    Icon(
                        Icons.Default.GraphicEq,
                        contentDescription = null,
                        modifier = Modifier.size(32.dp),
                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // EQ Bands
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                currentPreset.bands.forEachIndexed { index, band ->
                    EQBandSlider(
                        frequency = formatFrequency(band.frequency),
                        gain = band.gain,
                        onGainChange = { newGain ->
                            viewModel.updateBand(index, newGain)
                        },
                        modifier = Modifier.weight(1f)
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Quick preset buttons
            Text(
                text = "Quick Presets",
                style = MaterialTheme.typography.titleSmall,
                modifier = Modifier.padding(bottom = 8.dp)
            )
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                PresetChip("Flat", enabled) { viewModel.applyPreset(ParametricEqualizer.FLAT) }
                PresetChip("Bass", enabled) { viewModel.applyPreset(ParametricEqualizer.BASS_BOOST) }
                PresetChip("Vocal", enabled) { viewModel.applyPreset(ParametricEqualizer.VOCAL_BOOST) }
            }
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                PresetChip("Rock", enabled) { viewModel.applyPreset(ParametricEqualizer.ROCK) }
                PresetChip("Classical", enabled) { viewModel.applyPreset(ParametricEqualizer.CLASSICAL) }
                PresetChip("Jazz", enabled) { viewModel.applyPreset(ParametricEqualizer.JAZZ) }
            }
        }
    }
    
    // Preset selection dialog
    if (showPresetDialog) {
        PresetSelectionDialog(
            presets = ParametricEqualizer.getAllPresets(),
            onPresetSelected = { preset ->
                viewModel.applyPreset(preset)
                showPresetDialog = false
            },
            onDismiss = { showPresetDialog = false }
        )
    }
    
    // Save preset dialog
    if (showSaveDialog) {
        SavePresetDialog(
            onSave = { name, deviceId ->
                viewModel.savePreset(name, deviceId)
                showSaveDialog = false
            },
            onDismiss = { showSaveDialog = false }
        )
    }
}

@Composable
private fun EQBandSlider(
    frequency: String,
    gain: Float,
    onGainChange: (Float) -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.padding(horizontal = 4.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Gain value display
        Text(
            text = String.format("%+.1f", gain),
            style = MaterialTheme.typography.labelSmall,
            fontWeight = FontWeight.Bold,
            modifier = Modifier.padding(bottom = 4.dp)
        )
        
        // Vertical slider
        Box(
            modifier = Modifier
                .width(40.dp)
                .height(200.dp)
                .background(
                    MaterialTheme.colorScheme.surfaceVariant,
                    RoundedCornerShape(20.dp)
                )
        ) {
            // Center line (0 dB)
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(2.dp)
                    .align(Alignment.Center)
                    .background(MaterialTheme.colorScheme.outline.copy(alpha = 0.3f))
            )
            
            // Slider
            Slider(
                value = gain,
                onValueChange = onGainChange,
                valueRange = -12f..12f,
                modifier = Modifier
                    .height(200.dp)
                    .rotate(-90f)
                    .offset(y = (-80).dp, x = (-80).dp)
            )
        }
        
        // Frequency label
        Text(
            text = frequency,
            style = MaterialTheme.typography.labelSmall,
            modifier = Modifier.padding(top = 8.dp)
        )
    }
}

@Composable
private fun PresetChip(
    label: String,
    enabled: Boolean,
    onClick: () -> Unit
) {
    FilterChip(
        selected = false,
        onClick = onClick,
        label = { Text(label) },
        enabled = enabled,
        modifier = Modifier.height(32.dp)
    )
}

@Composable
private fun PresetSelectionDialog(
    presets: List<ParametricEqualizer.EQPreset>,
    onPresetSelected: (ParametricEqualizer.EQPreset) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("EQ Presets") },
        text = {
            LazyColumn {
                items(presets) { preset ->
                    TextButton(
                        onClick = { onPresetSelected(preset) },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text(
                            text = preset.name,
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                }
            }
        },
        confirmButton = {},
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@Composable
private fun SavePresetDialog(
    onSave: (String, String?) -> Unit,
    onDismiss: () -> Unit
) {
    var presetName by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Save EQ Preset") },
        text = {
            Column {
                OutlinedTextField(
                    value = presetName,
                    onValueChange = { presetName = it },
                    label = { Text("Preset Name") },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (presetName.isNotBlank()) {
                        onSave(presetName, null)
                    }
                },
                enabled = presetName.isNotBlank()
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

private fun formatFrequency(hz: Float): String {
    return when {
        hz >= 1000 -> "${(hz / 1000).toInt()}k"
        else -> "${hz.toInt()}"
    }
}
