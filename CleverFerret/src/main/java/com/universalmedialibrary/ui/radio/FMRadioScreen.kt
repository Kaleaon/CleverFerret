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
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation
import com.universalmedialibrary.services.radio.FMRadioService
import com.universalmedialibrary.services.radio.FMStation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collect
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
    val isAvailable by viewModel.isAvailable.collectAsState()
    val rdsData by viewModel.rdsData.collectAsState()
    val dnsMetadata by viewModel.dnsMetadata.collectAsState()
    val presets by viewModel.presets.collectAsState(initial = emptyList())
    val signalStrength by viewModel.signalStrength.collectAsState()
    val hasInternetStream by viewModel.hasInternetStream.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("FM Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.saveCurrentStation() }) {
                        Icon(Icons.Default.FavoriteBorder, "Save to Favorites")
                    }
                }
            )
        }
    ) { padding ->
        if (!isAvailable) {
             Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentAlignment = Alignment.Center
            ) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(
                        Icons.Default.Radio,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.error
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        "FM Radio Unavailable",
                        style = MaterialTheme.typography.titleLarge,
                        color = MaterialTheme.colorScheme.error
                    )
                    Text(
                        "No FM radio hardware detected or permission denied.",
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
        } else {
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
                        // RadioDNS Logo
                        dnsMetadata?.logoUrl?.let { url ->
                            AsyncImage(
                                model = url,
                                contentDescription = "Station Logo",
                                modifier = Modifier
                                    .size(120.dp)
                                    .clip(RoundedCornerShape(16.dp))
                                    .background(MaterialTheme.colorScheme.surface),
                                contentScale = ContentScale.Fit
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                        }

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

                        // Internet Stream Available
                        if (hasInternetStream) {
                            Spacer(modifier = Modifier.height(16.dp))
                            Button(
                                onClick = { /* TODO: Switch to internet radio */ },
                                colors = ButtonDefaults.buttonColors(
                                    containerColor = MaterialTheme.colorScheme.tertiary
                                )
                            ) {
                                Icon(Icons.Default.WifiTethering, null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Switch to Internet Radio")
                            }
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
                    "Favorite Stations",
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
                                .clickable { 
                                    station.frequencyKhz?.let { viewModel.tuneToStation(it) }
                                },
                            colors = CardDefaults.cardColors(
                                containerColor = if (station.frequencyKhz == currentFrequency)
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
                                    station.frequencyKhz?.let { freq ->
                                        Text(
                                            viewModel.formatFrequency(freq),
                                            style = MaterialTheme.typography.bodyMedium,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                }
                                
                                if (station.frequencyKhz == currentFrequency && isPlaying) {
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
}

@HiltViewModel
class FMRadioViewModel @Inject constructor(
    private val fmRadioService: FMRadioService,
    private val radioStationDao: RadioStationDao
) : ViewModel() {

    val currentFrequency = fmRadioService.currentFrequency
    val isPlaying = fmRadioService.isPlaying
    val isAvailable = fmRadioService.isAvailable
    val rdsData = fmRadioService.rdsData
    val dnsMetadata = fmRadioService.dnsMetadata
    val signalStrength = fmRadioService.signalStrength

    private val _hasInternetStream = MutableStateFlow(false)
    val hasInternetStream: StateFlow<Boolean> = _hasInternetStream.asStateFlow()
    
    // Load favorites from DB where frequencyKhz is not null
    // Note: Logic here assumes we want to filter for FM stations.
    // RadioStation entity has isFavorite flag.
    val presets = radioStationDao.getFavoriteStations()

    init {
        viewModelScope.launch {
            dnsMetadata.collect { metadata ->
                _hasInternetStream.value = !metadata?.streamUrl.isNullOrEmpty()
            }
        }
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

    fun tuneToStation(frequencyKhz: Int) {
        viewModelScope.launch {
            fmRadioService.tune(frequencyKhz)
            if (!isPlaying.value) {
                fmRadioService.play()
            }
        }
    }
    
    fun saveCurrentStation() {
        viewModelScope.launch {
            val freq = currentFrequency.value
            val rds = rdsData.value
            val dns = dnsMetadata.value
            
            val name = rds?.stationName?.ifEmpty { null } 
                ?: dns?.name 
                ?: formatFrequency(freq)
                
            val station = RadioStation(
                name = name,
                frequencyKhz = freq,
                description = rds?.radioText,
                isFavorite = true,
                streamUrl = dns?.streamUrl, // Save stream URL if available
                logoUrl = dns?.logoUrl
            )
            
            // Check if already exists? For now just insert/replace
            radioStationDao.insertStation(station)
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
