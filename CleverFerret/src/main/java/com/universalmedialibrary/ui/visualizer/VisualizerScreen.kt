package com.universalmedialibrary.ui.visualizer

import androidx.compose.foundation.layout.*
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
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.services.cast.ChromecastManager
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.delay
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
    viewModel: VisualizerViewModel = hiltViewModel()
) {
    val visualizerState by viewModel.visualizerState.collectAsState()
    val castState by viewModel.castState.collectAsState()
    val isVisualizerEnabled by viewModel.isVisualizerEnabled.collectAsState()
    var currentStyle by remember { mutableStateOf(VisualizerStyle.SPECTRUM_BARS) }

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
                title = { Text("Audio Visualizer") },
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
                                    // Open cast dialog - would need MediaRouteButton for full implementation
                                    viewModel.startCasting()
                                }
                            }
                        ) {
                            Icon(
                                imageVector = if (castState.isConnected)
                                    Icons.Default.Cast
                                else
                                    Icons.Default.CastConnected,
                                contentDescription = "Cast",
                                tint = if (castState.isConnected)
                                    MaterialTheme.colorScheme.primary
                                else
                                    MaterialTheme.colorScheme.onSurface
                            )
                        }
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
                }
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

            // Cast status
            if (castState.isConnected) {
                Surface(
                    modifier = Modifier.fillMaxWidth(),
                    color = MaterialTheme.colorScheme.primaryContainer
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.Center,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(Icons.Default.Cast, "Casting")
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Casting to ${castState.deviceName ?: "Chromecast"}")
                    }
                }
            }

            // Style selector
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "Visualizer Style",
                        style = MaterialTheme.typography.titleMedium
                    )
                    Spacer(modifier = Modifier.height(8.dp))
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
                                        text = style.name.replace("_", " "),
                                        style = MaterialTheme.typography.bodySmall
                                    )
                                },
                                modifier = Modifier.weight(1f)
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
                                        text = style.name.replace("_", " "),
                                        style = MaterialTheme.typography.bodySmall
                                    )
                                },
                                modifier = Modifier.weight(1f)
                            )
                        }
                    }
                }
            }

            // Frequency band display
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    FrequencyMeter(
                        label = "Bass",
                        level = visualizerState.frequencyBands.bass
                    )
                    FrequencyMeter(
                        label = "Mid",
                        level = visualizerState.frequencyBands.mid
                    )
                    FrequencyMeter(
                        label = "Treble",
                        level = visualizerState.frequencyBands.treble
                    )
                }
            }
        }
    }
}

@Composable
private fun FrequencyMeter(
    label: String,
    level: Float
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.labelSmall
        )
        Spacer(modifier = Modifier.height(4.dp))
        LinearProgressIndicator(
            progress = { level },
            modifier = Modifier
                .width(60.dp)
                .height(8.dp),
        )
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            text = "${(level * 100).toInt()}%",
            style = MaterialTheme.typography.bodySmall
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
