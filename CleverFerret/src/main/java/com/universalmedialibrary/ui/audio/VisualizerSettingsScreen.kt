package com.universalmedialibrary.ui.audio

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.audio.visualizer.VisualizerMode
import com.universalmedialibrary.audio.visualizer.VisualizerStyle

/**
 * Visualizer settings screen
 * Configure visualization mode, style, and preferences
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun VisualizerSettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: VisualizerViewModel = hiltViewModel()
) {
    val isEnabled by viewModel.isEnabled.collectAsState()
    val currentMode by viewModel.currentMode.collectAsState()
    val currentStyle by viewModel.currentStyle.collectAsState()
    val visualizerData by viewModel.visualizerData.collectAsState()
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Visualizer") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    // Enable/Disable toggle
                    Switch(
                        checked = isEnabled,
                        onCheckedChange = { viewModel.setEnabled(it) }
                    )
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Live preview
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = "Preview",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.padding(bottom = 8.dp)
                        )
                        
                        VisualizerCanvas(
                            data = visualizerData,
                            mode = currentMode,
                            style = currentStyle,
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                }
            }
            
            // Visualization mode
            item {
                Text(
                    text = "Visualization Mode",
                    style = MaterialTheme.typography.titleSmall,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
            }
            
            items(VisualizerMode.values().toList()) { mode ->
                VisualizerModeCard(
                    mode = mode,
                    isSelected = mode == currentMode,
                    onClick = { viewModel.setMode(mode) }
                )
            }
            
            // Visualization style
            item {
                Text(
                    text = "Color Style",
                    style = MaterialTheme.typography.titleSmall,
                    modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                )
            }
            
            items(VisualizerStyle.values().toList()) { style ->
                VisualizerStyleCard(
                    style = style,
                    isSelected = style == currentStyle,
                    onClick = { viewModel.setStyle(style) }
                )
            }
            
            // Info card
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.tertiaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Icon(
                            Icons.Default.Info,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onTertiaryContainer
                        )
                        
                        Column {
                            Text(
                                text = "About Visualizer",
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onTertiaryContainer
                            )
                            Spacer(Modifier.height(4.dp))
                            Text(
                                text = "Real-time audio visualization with FFT-based spectrum analysis. Renders at 60fps for smooth animations.",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onTertiaryContainer.copy(alpha = 0.8f)
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun VisualizerModeCard(
    mode: VisualizerMode,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected)
                MaterialTheme.colorScheme.primaryContainer
            else
                MaterialTheme.colorScheme.surface
        ),
        border = if (isSelected)
            CardDefaults.outlinedCardBorder().copy(width = 2.dp)
        else
            null
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = getModeIcon(mode),
                    contentDescription = null,
                    modifier = Modifier.size(32.dp),
                    tint = if (isSelected)
                        MaterialTheme.colorScheme.onPrimaryContainer
                    else
                        MaterialTheme.colorScheme.onSurface
                )
                
                Column {
                    Text(
                        text = getModeName(mode),
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = getModeDescription(mode),
                        style = MaterialTheme.typography.bodySmall,
                        color = if (isSelected)
                            MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            if (isSelected) {
                Icon(
                    Icons.Default.CheckCircle,
                    contentDescription = "Selected",
                    tint = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}

@Composable
private fun VisualizerStyleCard(
    style: VisualizerStyle,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected)
                MaterialTheme.colorScheme.primaryContainer
            else
                MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = getStyleName(style),
                style = MaterialTheme.typography.bodyLarge,
                fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Normal
            )
            
            if (isSelected) {
                Icon(
                    Icons.Default.Check,
                    contentDescription = "Selected",
                    tint = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}

private fun getModeIcon(mode: VisualizerMode) = when (mode) {
    VisualizerMode.SPECTRUM_BARS -> Icons.Default.BarChart
    VisualizerMode.SPECTRUM_LINES -> Icons.Default.ShowChart
    VisualizerMode.WAVEFORM -> Icons.Default.GraphicEq
    VisualizerMode.CIRCULAR -> Icons.Default.Album
    VisualizerMode.PARTICLE -> Icons.Default.BubbleChart
}

private fun getModeName(mode: VisualizerMode) = when (mode) {
    VisualizerMode.SPECTRUM_BARS -> "Spectrum Bars"
    VisualizerMode.SPECTRUM_LINES -> "Spectrum Lines"
    VisualizerMode.WAVEFORM -> "Waveform"
    VisualizerMode.CIRCULAR -> "Circular"
    VisualizerMode.PARTICLE -> "Particle System"
}

private fun getModeDescription(mode: VisualizerMode) = when (mode) {
    VisualizerMode.SPECTRUM_BARS -> "Classic frequency bars (Poweramp-style)"
    VisualizerMode.SPECTRUM_LINES -> "Smooth frequency curve"
    VisualizerMode.WAVEFORM -> "Oscilloscope-style amplitude"
    VisualizerMode.CIRCULAR -> "Radial spectrum display"
    VisualizerMode.PARTICLE -> "Dynamic particle visualization"
}

private fun getStyleName(style: VisualizerStyle) = when (style) {
    VisualizerStyle.DEFAULT -> "Default Gradient"
    VisualizerStyle.MONOCHROME -> "Monochrome"
    VisualizerStyle.RAINBOW -> "Rainbow Spectrum"
    VisualizerStyle.FIRE -> "Fire"
    VisualizerStyle.OCEAN -> "Ocean"
    VisualizerStyle.NEON -> "Neon"
    VisualizerStyle.MATERIAL_YOU -> "Material You"
}
