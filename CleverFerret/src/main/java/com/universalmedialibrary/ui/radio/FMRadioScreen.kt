package com.universalmedialibrary.ui.radio

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.radio.FMRadioService
import com.universalmedialibrary.services.radio.FMStation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * FM Radio screen with tuner interface
 * Inspired by RevampedFMRadio design for hardware FM support
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FMRadioScreen(
    onNavigateBack: () -> Unit,
    viewModel: FMRadioViewModel = hiltViewModel()
) {
    val currentFrequency by viewModel.currentFrequency.collectAsState()
    val isPlaying by viewModel.isPlaying.collectAsState()
    val rdsData by viewModel.rdsData.collectAsState()
    val presets by viewModel.presets.collectAsState()
    val signalStrength by viewModel.signalStrength.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("FM Radio") },
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
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Frequency Display
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                ),
                elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(24.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        text = viewModel.formatFrequency(currentFrequency),
                        style = MaterialTheme.typography.displayLarge,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    // RDS Station Name
                    rdsData?.let {
                        Text(
                            text = it.stationName,
                            style = MaterialTheme.typography.titleMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        if (it.radioText.isNotEmpty()) {
                            Text(
                                text = it.radioText,
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(16.dp))
                    
                    // Signal Strength Indicator
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        Icon(
                            Icons.Default.SignalCellularAlt,
                            "Signal",
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        LinearProgressIndicator(
                            progress = signalStrength / 100f,
                            modifier = Modifier.width(100.dp)
                        )
                    }
                }
            }

            // Tuning Controls
            Card(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    // Scan Buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly
                    ) {
                        IconButton(
                            onClick = { viewModel.scanDown() },
                            modifier = Modifier.size(64.dp)
                        ) {
                            Icon(
                                Icons.Default.SkipPrevious,
                                "Scan Down",
                                modifier = Modifier.size(32.dp)
                            )
                        }
                        
                        FilledIconButton(
                            onClick = { viewModel.togglePlayback() },
                            modifier = Modifier.size(80.dp)
                        ) {
                            Icon(
                                if (isPlaying) Icons.Default.Stop else Icons.Default.PlayArrow,
                                if (isPlaying) "Stop" else "Play",
                                modifier = Modifier.size(40.dp)
                            )
                        }
                        
                        IconButton(
                            onClick = { viewModel.scanUp() },
                            modifier = Modifier.size(64.dp)
                        ) {
                            Icon(
                                Icons.Default.SkipNext,
                                "Scan Up",
                                modifier = Modifier.size(32.dp)
                            )
                        }
                    }
                    
                    // Fine Tune
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(onClick = { viewModel.tuneDown() }) {
                            Icon(Icons.Default.Remove, "Tune Down")
                        }
                        
                        Text("Fine Tune", style = MaterialTheme.typography.labelMedium)
                        
                        IconButton(onClick = { viewModel.tuneUp() }) {
                            Icon(Icons.Default.Add, "Tune Up")
                        }
                    }
                }
            }

            // Presets
            Text(
                "Station Presets",
                style = MaterialTheme.typography.titleMedium,
                modifier = Modifier.align(Alignment.Start)
            )
            
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(presets) { station ->
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { viewModel.tuneToStation(station) },
                        colors = CardDefaults.cardColors(
                            containerColor = if (currentFrequency == station.frequencyKhz)
                                MaterialTheme.colorScheme.secondaryContainer
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
                            Column {
                                Text(
                                    station.name,
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Bold
                                )
                                Text(
                                    station.displayFrequency,
                                    style = MaterialTheme.typography.bodyMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            
                            if (currentFrequency == station.frequencyKhz && isPlaying) {
                                Icon(
                                    Icons.Default.GraphicEq,
                                    "Playing",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

@HiltViewModel
class FMRadioViewModel @Inject constructor(
    private val fmRadioService: FMRadioService
) : ViewModel() {

    val currentFrequency = fmRadioService.currentFrequency
    val isPlaying = fmRadioService.isPlaying
    val rdsData = fmRadioService.rdsData
    val signalStrength = fmRadioService.signalStrength

    private val _presets = MutableStateFlow<List<FMStation>>(emptyList())
    val presets: StateFlow<List<FMStation>> = _presets.asStateFlow()

    init {
        loadPresets()
    }

    private fun loadPresets() {
        _presets.value = fmRadioService.getPopularFrequencies()
    }

    fun togglePlayback() {
        if (isPlaying.value) {
            fmRadioService.stop()
        } else {
            fmRadioService.play()
        }
    }

    fun scanUp() {
        fmRadioService.scanUp()
    }

    fun scanDown() {
        fmRadioService.scanDown()
    }

    fun tuneUp() {
        val newFreq = currentFrequency.value + 50 // 0.05 MHz
        if (newFreq <= 108000) {
            fmRadioService.tune(newFreq)
        }
    }

    fun tuneDown() {
        val newFreq = currentFrequency.value - 50 // 0.05 MHz
        if (newFreq >= 87500) {
            fmRadioService.tune(newFreq)
        }
    }

    fun tuneToStation(station: FMStation) {
        viewModelScope.launch {
            fmRadioService.tune(station.frequencyKhz)
            if (!isPlaying.value) {
                fmRadioService.play()
            }
        }
    }

    fun formatFrequency(frequencyKhz: Int): String {
        return fmRadioService.formatFrequency(frequencyKhz)
    }

    override fun onCleared() {
        super.onCleared()
        fmRadioService.release()
    }
}
