package com.universalmedialibrary.ui.visualizer

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.TrendingUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.visualizer.ColorScheme
import com.universalmedialibrary.services.visualizer.VisualizerParameters
import com.universalmedialibrary.services.visualizer.VisualizerPreset

/**
 * Parameter Editor Screen
 *
 * Allows users to create and edit custom visualizer presets
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ParameterEditorScreen(
    preset: VisualizerPreset? = null,
    onBack: () -> Unit,
    onSave: (VisualizerPreset) -> Unit
) {
    var name by remember { mutableStateOf(preset?.name ?: "Custom Preset") }
    var description by remember { mutableStateOf(preset?.description ?: "") }
    var baseStyle by remember { mutableStateOf(preset?.baseStyle ?: "spectrum_bars") }
    
    // Parameters
    var sensitivity by remember { mutableFloatStateOf(preset?.parameters?.sensitivity ?: 1.0f) }
    var smoothing by remember { mutableFloatStateOf(preset?.parameters?.smoothing ?: 0.5f) }
    var speed by remember { mutableFloatStateOf(preset?.parameters?.speed ?: 1.0f) }
    var bassBoost by remember { mutableFloatStateOf(preset?.parameters?.bassBoost ?: 1.0f) }
    var midBoost by remember { mutableFloatStateOf(preset?.parameters?.midBoost ?: 1.0f) }
    var trebleBoost by remember { mutableFloatStateOf(preset?.parameters?.trebleBoost ?: 1.0f) }
    
    // Colors
    var useCustomColors by remember { mutableStateOf(preset?.colorScheme != null) }
    var primaryColor by remember { mutableStateOf(preset?.colorScheme?.primary ?: "#FF0000") }
    var secondaryColor by remember { mutableStateOf(preset?.colorScheme?.secondary ?: "#00FF00") }
    var tertiaryColor by remember { mutableStateOf(preset?.colorScheme?.tertiary ?: "#0000FF") }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Parameter Editor") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(
                        onClick = {
                            val newPreset = VisualizerPreset(
                                id = preset?.id ?: "custom_${System.currentTimeMillis()}",
                                name = name,
                                author = "User",
                                description = description,
                                baseStyle = baseStyle,
                                parameters = VisualizerParameters(
                                    sensitivity = sensitivity,
                                    smoothing = smoothing,
                                    speed = speed,
                                    bassBoost = bassBoost,
                                    midBoost = midBoost,
                                    trebleBoost = trebleBoost
                                ),
                                colorScheme = if (useCustomColors) {
                                    ColorScheme(
                                        primary = primaryColor,
                                        secondary = secondaryColor,
                                        tertiary = tertiaryColor
                                    )
                                } else null,
                                tags = listOf("custom", "user-created")
                            )
                            onSave(newPreset)
                        }
                    ) {
                        Icon(Icons.Default.Save, "Save")
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
            // Basic Info
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = "Basic Information",
                        style = MaterialTheme.typography.titleMedium
                    )
                    
                    OutlinedTextField(
                        value = name,
                        onValueChange = { name = it },
                        label = { Text("Preset Name") },
                        modifier = Modifier.fillMaxWidth(),
                        singleLine = true
                    )
                    
                    OutlinedTextField(
                        value = description,
                        onValueChange = { description = it },
                        label = { Text("Description") },
                        modifier = Modifier.fillMaxWidth(),
                        maxLines = 3
                    )
                    
                    // Base Style Selector
                    Text(
                        text = "Base Style",
                        style = MaterialTheme.typography.labelMedium
                    )
                    
                    val styles = listOf(
                        "spectrum_bars" to "Spectrum Bars",
                        "waveform" to "Waveform",
                        "circular" to "Circular",
                        "particles" to "Particles",
                        "frequency_rings" to "Frequency Rings",
                        "oscilloscope" to "Oscilloscope",
                        "spectrograph" to "Spectrograph",
                        "lissajous" to "Lissajous",
                        "radial_waveform" to "Radial Waveform",
                        "beat_reactive" to "Beat Reactive",
                        "kaleidoscope" to "Kaleidoscope",
                        "fractal" to "Fractal",
                        "matrix_rain" to "Matrix Rain",
                        "dual_channel" to "Dual Channel",
                        "cube_3d" to "3D Cube"
                    )
                    
                    FlowRow(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        styles.forEach { (id, label) ->
                            FilterChip(
                                selected = baseStyle == id,
                                onClick = { baseStyle = id },
                                label = { Text(label, style = MaterialTheme.typography.labelSmall) }
                            )
                        }
                    }
                }
            }
            
            // Audio Parameters
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    Text(
                        text = "Audio Parameters",
                        style = MaterialTheme.typography.titleMedium
                    )
                    
                    ParameterSlider(
                        label = "Sensitivity",
                        value = sensitivity,
                        onValueChange = { sensitivity = it },
                        range = 0.1f..3.0f,
                        icon = Icons.AutoMirrored.Filled.TrendingUp
                    )
                    
                    ParameterSlider(
                        label = "Smoothing",
                        value = smoothing,
                        onValueChange = { smoothing = it },
                        range = 0.0f..1.0f,
                        icon = Icons.Default.LinearScale
                    )
                    
                    ParameterSlider(
                        label = "Speed",
                        value = speed,
                        onValueChange = { speed = it },
                        range = 0.1f..3.0f,
                        icon = Icons.Default.Speed
                    )
                }
            }
            
            // Frequency Boost
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    Text(
                        text = "Frequency Boost",
                        style = MaterialTheme.typography.titleMedium
                    )
                    
                    ParameterSlider(
                        label = "Bass Boost",
                        value = bassBoost,
                        onValueChange = { bassBoost = it },
                        range = 0.1f..3.0f,
                        icon = Icons.Default.GraphicEq
                    )
                    
                    ParameterSlider(
                        label = "Mid Boost",
                        value = midBoost,
                        onValueChange = { midBoost = it },
                        range = 0.1f..3.0f,
                        icon = Icons.Default.GraphicEq
                    )
                    
                    ParameterSlider(
                        label = "Treble Boost",
                        value = trebleBoost,
                        onValueChange = { trebleBoost = it },
                        range = 0.1f..3.0f,
                        icon = Icons.Default.GraphicEq
                    )
                }
            }
            
            // Color Customization
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "Custom Colors",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Switch(
                            checked = useCustomColors,
                            onCheckedChange = { useCustomColors = it }
                        )
                    }
                    
                    if (useCustomColors) {
                        Text(
                            text = "Enter hex color codes (e.g., #FF0000 for red)",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        
                        OutlinedTextField(
                            value = primaryColor,
                            onValueChange = { primaryColor = it },
                            label = { Text("Primary Color") },
                            modifier = Modifier.fillMaxWidth(),
                            singleLine = true,
                            leadingIcon = {
                                Icon(Icons.Default.Palette, null)
                            }
                        )
                        
                        OutlinedTextField(
                            value = secondaryColor,
                            onValueChange = { secondaryColor = it },
                            label = { Text("Secondary Color") },
                            modifier = Modifier.fillMaxWidth(),
                            singleLine = true,
                            leadingIcon = {
                                Icon(Icons.Default.Palette, null)
                            }
                        )
                        
                        OutlinedTextField(
                            value = tertiaryColor,
                            onValueChange = { tertiaryColor = it },
                            label = { Text("Tertiary Color") },
                            modifier = Modifier.fillMaxWidth(),
                            singleLine = true,
                            leadingIcon = {
                                Icon(Icons.Default.Palette, null)
                            }
                        )
                    } else {
                        Text(
                            text = "Using theme colors",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
            
            // Save Button
            Button(
                onClick = {
                    val newPreset = VisualizerPreset(
                        id = preset?.id ?: "custom_${System.currentTimeMillis()}",
                        name = name,
                        author = "User",
                        description = description,
                        baseStyle = baseStyle,
                        parameters = VisualizerParameters(
                            sensitivity = sensitivity,
                            smoothing = smoothing,
                            speed = speed,
                            bassBoost = bassBoost,
                            midBoost = midBoost,
                            trebleBoost = trebleBoost
                        ),
                        colorScheme = if (useCustomColors) {
                            ColorScheme(
                                primary = primaryColor,
                                secondary = secondaryColor,
                                tertiary = tertiaryColor
                            )
                        } else null,
                        tags = listOf("custom", "user-created")
                    )
                    onSave(newPreset)
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Save, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Save Preset")
            }
        }
    }
}

@Composable
private fun ParameterSlider(
    label: String,
    value: Float,
    onValueChange: (Float) -> Unit,
    range: ClosedFloatingPointRange<Float>,
    icon: androidx.compose.ui.graphics.vector.ImageVector
) {
    Column {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    icon,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = label,
                    style = MaterialTheme.typography.labelLarge
                )
            }
            Text(
                text = String.format(java.util.Locale.US, "%.2f", value),
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
        Slider(
            value = value,
            onValueChange = onValueChange,
            valueRange = range,
            modifier = Modifier.fillMaxWidth()
        )
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun FlowRow(
    modifier: Modifier = Modifier,
    horizontalArrangement: Arrangement.Horizontal = Arrangement.Start,
    verticalArrangement: Arrangement.Vertical = Arrangement.Top,
    content: @Composable () -> Unit
) {
    // Simple flow row implementation for older Compose versions
    androidx.compose.foundation.layout.FlowRow(
        modifier = modifier,
        horizontalArrangement = horizontalArrangement,
        verticalArrangement = verticalArrangement
    ) {
        content()
    }
}
