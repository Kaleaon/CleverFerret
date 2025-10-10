package com.universalmedialibrary.ui.visualizer

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.cast.ChromecastManager
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Visualizer Screen with Chromecast Integration
 *
 * Displays audio visualizer and provides controls for casting
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun VisualizerScreen(
    onBack: () -> Unit,
    onNavigateToPresets: () -> Unit = {},
    viewModel: VisualizerViewModel = hiltViewModel()
) {
    val visualizerState by viewModel.visualizerState.collectAsState()
    val castState by viewModel.castState.collectAsState()
    val isVisualizerEnabled by viewModel.isVisualizerEnabled.collectAsState()
    val currentPreset by viewModel.currentPreset.collectAsState(initial = null)
    var currentStyle by remember { mutableStateOf(VisualizerStyle.SPECTRUM_BARS) }
    var showPresetBrowser by remember { mutableStateOf(false) }

    LaunchedEffect(Unit) {
        viewModel.initialize()
    }

    DisposableEffect(Unit) {
        onDispose {
            viewModel.cleanup()
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        text = "Audio Visualizer",
                        style = MaterialTheme.typography.titleMedium
                    ) 
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    // Chromecast button
                    if (castState.isCastAvailable) {
                        IconButton(
                            onClick = {
                                if (castState.isConnected) {
                                    viewModel.stopCasting()
                                } else {
                                    viewModel.startCasting()
                                }
                            }
                        ) {
                            Icon(
                                imageVector = if (castState.isConnected)
                                    Icons.Default.CastConnected
                                else
                                    Icons.Default.Cast,
                                contentDescription = "Cast",
                                tint = if (castState.isConnected)
                                    MaterialTheme.colorScheme.primary
                                else
                                    MaterialTheme.colorScheme.onSurface
                            )
                        }
                    }

                    // Browse presets
                    IconButton(
                        onClick = onNavigateToPresets
                    ) {
                        Icon(Icons.Default.Dashboard, "Browse Presets")
                    }
                    
                    // Toggle visualizer
                    IconButton(
                        onClick = { viewModel.toggleVisualizer() }
                    ) {
                        Icon(
                            imageVector = if (isVisualizerEnabled)
                                Icons.Default.Pause
                            else
                                Icons.Default.PlayArrow,
                            contentDescription = if (isVisualizerEnabled)
                                "Pause Visualizer"
                            else
                                "Start Visualizer"
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surface
                )
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Visualizer display
            ProjectMVisualizer(
                visualizerState = visualizerState,
                style = currentStyle,
                modifier = Modifier
                    .weight(1f)
                    .fillMaxWidth()
            )

            // Cast status banner
            if (castState.isConnected) {
                Surface(
                    modifier = Modifier.fillMaxWidth(),
                    color = MaterialTheme.colorScheme.primaryContainer,
                    tonalElevation = 2.dp
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        horizontalArrangement = Arrangement.Center,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.CastConnected, 
                            "Casting",
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "Casting to ${castState.deviceName ?: "Chromecast"}",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }

            // Current preset info
            if (currentPreset != null) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                text = currentPreset!!.name,
                                style = MaterialTheme.typography.titleSmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Text(
                                text = "by ${currentPreset!!.author}",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                            )
                        }
                        TextButton(onClick = onNavigateToPresets) {
                            Text("Browse")
                        }
                    }
                }
            }
            
            // Style selector
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "Visualizer Style",
                            style = MaterialTheme.typography.titleMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        TextButton(onClick = onNavigateToPresets) {
                            Text("${com.universalmedialibrary.services.visualizer.VisualizerPresetManager.DEFAULT_PRESETS.size} Presets")
                        }
                    }
                    Spacer(modifier = Modifier.height(12.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        VisualizerStyle.values().take(3).forEach { style ->
                            FilterChip(
                                selected = currentStyle == style,
                                onClick = { currentStyle = style },
                                label = {
                                    Text(
                                        text = style.name.replace("_", " ").lowercase()
                                            .replaceFirstChar { it.uppercase() },
                                        style = MaterialTheme.typography.labelMedium
                                    )
                                },
                                modifier = Modifier.weight(1f),
                                colors = FilterChipDefaults.filterChipColors(
                                    selectedContainerColor = MaterialTheme.colorScheme.primary,
                                    selectedLabelColor = MaterialTheme.colorScheme.onPrimary
                                )
                            )
                        }
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        VisualizerStyle.values().drop(3).forEach { style ->
                            FilterChip(
                                selected = currentStyle == style,
                                onClick = { currentStyle = style },
                                label = {
                                    Text(
                                        text = style.name.replace("_", " ").lowercase()
                                            .replaceFirstChar { it.uppercase() },
                                        style = MaterialTheme.typography.labelMedium
                                    )
                                },
                                modifier = Modifier.weight(1f),
                                colors = FilterChipDefaults.filterChipColors(
                                    selectedContainerColor = MaterialTheme.colorScheme.primary,
                                    selectedLabelColor = MaterialTheme.colorScheme.onPrimary
                                )
                            )
                        }
                    }
                }
            }

            // Frequency band display
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    FrequencyMeter(
                        label = "Bass",
                        level = visualizerState.frequencyBands.bass,
                        color = MaterialTheme.colorScheme.primary
                    )
                    FrequencyMeter(
                        label = "Mid",
                        level = visualizerState.frequencyBands.mid,
                        color = MaterialTheme.colorScheme.secondary
                    )
                    FrequencyMeter(
                        label = "Treble",
                        level = visualizerState.frequencyBands.treble,
                        color = MaterialTheme.colorScheme.tertiary
                    )
                }
            }
        }
    }
}

@Composable
private fun FrequencyMeter(
    label: String,
    level: Float,
    color: Color
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.labelMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Spacer(modifier = Modifier.height(8.dp))
        LinearProgressIndicator(
            progress = { level },
            modifier = Modifier
                .width(70.dp)
                .height(10.dp),
            color = color,
            trackColor = color.copy(alpha = 0.2f)
        )
        Spacer(modifier = Modifier.height(6.dp))
        Text(
            text = "${(level * 100).toInt()}%",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@HiltViewModel
class VisualizerViewModel @Inject constructor(
    private val audioVisualizerService: AudioVisualizerService,
    private val chromecastManager: ChromecastManager,
    private val audioPlaybackManager: AudioPlaybackManager
) : ViewModel() {

    val visualizerState = audioVisualizerService.visualizerState
    val castState = chromecastManager.castState
    val isVisualizerEnabled = audioVisualizerService.isEnabled
    
    private val _currentPreset = MutableStateFlow<com.universalmedialibrary.services.visualizer.VisualizerPreset?>(null)
    val currentPreset: StateFlow<com.universalmedialibrary.services.visualizer.VisualizerPreset?> = _currentPreset.asStateFlow()
    
    fun setPreset(preset: com.universalmedialibrary.services.visualizer.VisualizerPreset) {
        _currentPreset.value = preset
    }

    fun initialize() {
        // Initialize Chromecast
        chromecastManager.initialize()

        // Attach visualizer to the audio player
        audioVisualizerService.attachToPlayer(audioPlaybackManager.exoPlayer)
        audioVisualizerService.setEnabled(true)

        // Start updating cast with visualizer data
        viewModelScope.launch {
            while (isActive) {
                val state = visualizerState.value
                chromecastManager.updateVisualizerData(
                    bass = state.frequencyBands.bass,
                    mid = state.frequencyBands.mid,
                    treble = state.frequencyBands.treble,
                    spectrum = state.frequencyBands.spectrum
                )
                delay(50) // Update 20 times per second
            }
        }
    }

    fun toggleVisualizer() {
        audioVisualizerService.setEnabled(!isVisualizerEnabled.value)
    }

    fun startCasting() {
        chromecastManager.enableVisualizerCasting(true)
    }

    fun stopCasting() {
        chromecastManager.stopCasting()
    }

    fun cleanup() {
        audioVisualizerService.setEnabled(false)
    }

    override fun onCleared() {
        super.onCleared()
        audioVisualizerService.release()
    }
}
