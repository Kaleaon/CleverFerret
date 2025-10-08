package com.universalmedialibrary.ui.cast

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.cast.ChromecastManager
import com.universalmedialibrary.services.visualizer.AudioVisualizerService
import com.universalmedialibrary.ui.theme.CleverFerretMediaLibraryTheme
import com.universalmedialibrary.ui.visualizer.ProjectMVisualizer
import com.universalmedialibrary.ui.visualizer.VisualizerStyle
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

/**
 * Expanded Cast Controls Activity
 *
 * Shows full-screen controls when casting, including visualizer
 */
@AndroidEntryPoint
class ExpandedControlsActivity : ComponentActivity() {

    @Inject
    lateinit var chromecastManager: ChromecastManager

    @Inject
    lateinit var visualizerService: AudioVisualizerService

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            CleverFerretMediaLibraryTheme {
                ExpandedControlsScreen(
                    chromecastManager = chromecastManager,
                    visualizerService = visualizerService,
                    onBack = { finish() }
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ExpandedControlsScreen(
    chromecastManager: ChromecastManager,
    visualizerService: AudioVisualizerService,
    onBack: () -> Unit
) {
    val castState by chromecastManager.castState.collectAsState()
    val visualizerState by visualizerService.visualizerState.collectAsState()
    var showVisualizer by remember { mutableStateOf(false) }
    var visualizerStyle by remember { mutableStateOf(VisualizerStyle.SPECTRUM_BARS) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Casting to ${castState.deviceName ?: "Chromecast"}") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    TextButton(onClick = { showVisualizer = !showVisualizer }) {
                        Text(if (showVisualizer) "Hide Visualizer" else "Show Visualizer")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            if (showVisualizer) {
                ProjectMVisualizer(
                    visualizerState = visualizerState,
                    style = visualizerStyle,
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth()
                )

                // Visualizer style selector
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    VisualizerStyle.values().forEach { style ->
                        FilterChip(
                            selected = visualizerStyle == style,
                            onClick = { visualizerStyle = style },
                            label = { Text(style.name.replace("_", " ")) }
                        )
                    }
                }
            } else {
                Text(
                    text = "Media is casting",
                    style = MaterialTheme.typography.headlineMedium
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = castState.deviceName ?: "Unknown device",
                    style = MaterialTheme.typography.bodyLarge
                )
            }

            // Cast controls would go here
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.Center
            ) {
                Button(
                    onClick = { chromecastManager.stopCasting() }
                ) {
                    Text("Stop Casting")
                }
            }
        }
    }
}
