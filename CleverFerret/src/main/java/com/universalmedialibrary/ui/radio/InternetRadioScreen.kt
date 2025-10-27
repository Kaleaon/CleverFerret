package com.universalmedialibrary.ui.radio

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Internet Radio screen for streaming online radio stations
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun InternetRadioScreen(
    onNavigateBack: () -> Unit,
    viewModel: InternetRadioViewModel = hiltViewModel()
) {
    val stations by viewModel.stations.collectAsState()
    val currentStation by viewModel.currentStation.collectAsState()
    val isPlaying by viewModel.isPlaying.collectAsState()
    var searchQuery by remember { mutableStateOf("") }
    var selectedGenre by remember { mutableStateOf("All") }
    var showAddStationDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Internet Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showAddStationDialog = true }) {
                        Icon(Icons.Default.Add, "Add Station")
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
            // Search Bar
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { searchQuery = it },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                placeholder = { Text("Search stations...") },
                leadingIcon = {
                    Icon(Icons.Default.Search, "Search")
                },
                singleLine = true,
                shape = RoundedCornerShape(24.dp)
            )

            // Current Playing
            currentStation?.let { station ->
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
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                "Now Playing",
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                            )
                            Text(
                                station.name,
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Text(
                                station.genre,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                            )
                        }
                        
                        FilledIconButton(
                            onClick = { viewModel.togglePlayback() }
                        ) {
                            Icon(
                                if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                                if (isPlaying) "Pause" else "Play"
                            )
                        }
                    }
                }
            }

            // Genre Tabs
            val genres = listOf("All", "News", "Music", "Talk", "Sports", "Jazz", "Classical")
            ScrollableTabRow(
                selectedTabIndex = genres.indexOf(selectedGenre).coerceAtLeast(0),
                modifier = Modifier.fillMaxWidth(),
                edgePadding = 16.dp
            ) {
                genres.forEach { genre ->
                    Tab(
                        selected = selectedGenre == genre,
                        onClick = { selectedGenre = genre },
                        text = { Text(genre) }
                    )
                }
            }

            // Station List
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(
                    stations.filter {
                        val matchesSearch = searchQuery.isEmpty() || 
                            it.name.contains(searchQuery, ignoreCase = true) ||
                            it.genre.contains(searchQuery, ignoreCase = true)
                        val matchesGenre = selectedGenre == "All" || it.genre.equals(selectedGenre, ignoreCase = true)
                        matchesSearch && matchesGenre
                    }
                ) { station ->
                    InternetRadioStationCard(
                        station = station,
                        isPlaying = currentStation == station && isPlaying,
                        onClick = { viewModel.selectStation(station) }
                    )
                }
            }
        }
    }
    
    // Add Station Dialog
    if (showAddStationDialog) {
        AddStationDialog(
            onDismiss = { showAddStationDialog = false },
            onAdd = { name, url, genre ->
                viewModel.addCustomStation(name, url, genre)
                showAddStationDialog = false
            }
        )
    }
}

@Composable
private fun InternetRadioStationCard(
    station: InternetRadioStation,
    isPlaying: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = if (isPlaying)
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
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    station.name,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        station.genre,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text("•", style = MaterialTheme.typography.bodySmall)
                    Text(
                        station.bitrate,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            if (isPlaying) {
                Icon(
                    Icons.Default.GraphicEq,
                    "Playing",
                    tint = MaterialTheme.colorScheme.primary
                )
            } else {
                Icon(
                    Icons.Default.PlayArrow,
                    "Play",
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

data class InternetRadioStation(
    val id: String,
    val name: String,
    val url: String,
    val genre: String,
    val bitrate: String,
    val country: String = ""
)

@HiltViewModel
class InternetRadioViewModel @Inject constructor(
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService
) : ViewModel() {

    private val _stations = MutableStateFlow<List<InternetRadioStation>>(emptyList())
    val stations: StateFlow<List<InternetRadioStation>> = _stations.asStateFlow()

    private val _currentStation = MutableStateFlow<InternetRadioStation?>(null)
    val currentStation: StateFlow<InternetRadioStation?> = _currentStation.asStateFlow()

    val playbackState = musicPlayerService.playbackState
    val isPlaying: StateFlow<Boolean> = playbackState.map { it.isPlaying }.stateIn(
        scope = viewModelScope,
        started = kotlinx.coroutines.flow.SharingStarted.WhileSubscribed(5000),
        initialValue = false
    )

    init {
        loadSampleStations()
    }

    private fun loadSampleStations() {
        // Sample stations - these would come from a service/API in production
        _stations.value = listOf(
            InternetRadioStation("1", "NPR News", "https://npr-ice.streamguys1.com/live.mp3", "News", "128 kbps"),
            InternetRadioStation("2", "Jazz FM", "https://jazz-wr01.ice.infomaniak.ch/jazz-wr01-128.mp3", "Jazz", "128 kbps"),
            InternetRadioStation("3", "Classical Music", "https://stream.live.vc.bbcmedia.co.uk/bbc_radio_three", "Classical", "320 kbps"),
            InternetRadioStation("4", "Rock Radio", "https://stream.rockradio.com/rock", "Rock", "128 kbps"),
            InternetRadioStation("5", "Electronic Music", "https://stream.electronicmusic.com/main", "Electronic", "256 kbps"),
            InternetRadioStation("6", "Talk Radio", "https://stream.talkradio.com/main", "Talk", "64 kbps"),
            InternetRadioStation("7", "Sports Radio", "https://stream.sportsradio.com/main", "Sports", "128 kbps")
        )
    }

    fun selectStation(station: InternetRadioStation) {
        viewModelScope.launch {
            try {
                _currentStation.value = station
                // Play radio station via music player service
                musicPlayerService.playTrackFromUri(
                    uri = station.url,
                    title = station.name,
                    artist = "Internet Radio",
                    album = station.genre,
                    duration = 0L, // Streams have no duration
                    albumArtUrl = null
                )
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun togglePlayback() {
        if (playbackState.value.isPlaying) {
            musicPlayerService.pause()
        } else {
            musicPlayerService.play()
        }
    }
    
    fun addCustomStation(name: String, url: String, genre: String) {
        val newStation = InternetRadioStation(
            id = (stations.value.size + 1).toString(),
            name = name,
            url = url,
            genre = genre,
            bitrate = "128 kbps"
        )
        _stations.value = _stations.value + newStation
    }
}

@Composable
private fun AddStationDialog(
    onDismiss: () -> Unit,
    onAdd: (String, String, String) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var url by remember { mutableStateOf("") }
    var genre by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Radio Station") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Station Name") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                OutlinedTextField(
                    value = url,
                    onValueChange = { url = it },
                    label = { Text("Stream URL") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true,
                    placeholder = { Text("https://...") }
                )
                OutlinedTextField(
                    value = genre,
                    onValueChange = { genre = it },
                    label = { Text("Genre") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (name.isNotBlank() && url.isNotBlank()) {
                        onAdd(name, url, genre.ifBlank { "Other" })
                    }
                },
                enabled = name.isNotBlank() && url.isNotBlank()
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
