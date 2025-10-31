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
import com.universalmedialibrary.data.local.entity.RadioStation
import com.universalmedialibrary.services.radio.HDRadioService
import com.universalmedialibrary.services.radio.HDRadioStation
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * HD Radio screen for high-quality digital radio streaming
 * 
 * HD Radio features:
 * - CD-quality audio
 * - Multiple channels per frequency (HD1, HD2, HD3)
 * - Artist and song information
 * - Album artwork
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HDRadioScreen(
    onNavigateBack: () -> Unit,
    viewModel: HDRadioViewModel = hiltViewModel()
) {
    val stations by viewModel.stations.collectAsState()
    val currentStation by viewModel.currentStation.collectAsState()
    val genres by viewModel.genres.collectAsState()
    
    var searchQuery by remember { mutableStateOf("") }
    var selectedGenre by remember { mutableStateOf("All") }
    var showGenreMenu by remember { mutableStateOf(false) }

    val filteredStations = remember(stations, searchQuery, selectedGenre) {
        stations.filter { station ->
            (searchQuery.isEmpty() || 
             station.name.contains(searchQuery, ignoreCase = true) ||
             station.callSign.contains(searchQuery, ignoreCase = true) ||
             station.description?.contains(searchQuery, ignoreCase = true) == true) &&
            (selectedGenre == "All" || station.genre.equals(selectedGenre, ignoreCase = true))
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("HD Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    // Genre filter
                    Box {
                        IconButton(onClick = { showGenreMenu = true }) {
                            Icon(Icons.Default.FilterList, "Filter by Genre")
                        }
                        DropdownMenu(
                            expanded = showGenreMenu,
                            onDismissRequest = { showGenreMenu = false }
                        ) {
                            genres.forEach { genre ->
                                DropdownMenuItem(
                                    text = { Text(genre) },
                                    onClick = {
                                        selectedGenre = genre
                                        showGenreMenu = false
                                    }
                                )
                            }
                        }
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
            // Info Card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.secondaryContainer
                )
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.Radio,
                        contentDescription = null,
                        modifier = Modifier.size(40.dp),
                        tint = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                    Column {
                        Text(
                            "HD Radio",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            "Digital radio with CD-quality audio",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSecondaryContainer.copy(alpha = 0.7f)
                        )
                    }
                }
            }

            // Search Bar
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { searchQuery = it },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp),
                placeholder = { Text("Search HD Radio stations...") },
                leadingIcon = {
                    Icon(Icons.Default.Search, "Search")
                },
                trailingIcon = {
                    if (searchQuery.isNotEmpty()) {
                        IconButton(onClick = { searchQuery = "" }) {
                            Icon(Icons.Default.Clear, "Clear")
                        }
                    }
                },
                singleLine = true,
                shape = RoundedCornerShape(24.dp)
            )

            Spacer(modifier = Modifier.height(8.dp))

            // Genre Filter Chip
            if (selectedGenre != "All") {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    FilterChip(
                        selected = true,
                        onClick = { selectedGenre = "All" },
                        label = { Text(selectedGenre) },
                        trailingIcon = {
                            Icon(
                                Icons.Default.Close,
                                contentDescription = "Clear filter",
                                modifier = Modifier.size(18.dp)
                            )
                        }
                    )
                }
                Spacer(modifier = Modifier.height(8.dp))
            }

            // Stations List
            LazyColumn(
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                items(filteredStations, key = { it.callSign }) { station ->
                    HDRadioStationCard(
                        station = station,
                        isPlaying = currentStation == station,
                        onClick = { viewModel.playStation(station) }
                    )
                }
                
                if (filteredStations.isEmpty()) {
                    item {
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(32.dp),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(
                                "No HD Radio stations found",
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun HDRadioStationCard(
    station: HDRadioStation,
    isPlaying: Boolean,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = if (isPlaying)
                MaterialTheme.colorScheme.primaryContainer
            else
                MaterialTheme.colorScheme.surface
        ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = if (isPlaying) 4.dp else 2.dp
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
                // Station name and channel
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        station.displayFrequency,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = if (isPlaying) 
                            MaterialTheme.colorScheme.onPrimaryContainer
                        else 
                            MaterialTheme.colorScheme.onSurface
                    )
                    Surface(
                        color = if (isPlaying)
                            MaterialTheme.colorScheme.primary
                        else
                            MaterialTheme.colorScheme.secondaryContainer,
                        shape = RoundedCornerShape(4.dp)
                    ) {
                        Text(
                            station.channel,
                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                            style = MaterialTheme.typography.labelSmall,
                            fontWeight = FontWeight.Bold,
                            color = if (isPlaying)
                                MaterialTheme.colorScheme.onPrimary
                            else
                                MaterialTheme.colorScheme.onSecondaryContainer
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(4.dp))
                
                // Call sign
                Text(
                    station.callSign,
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Medium,
                    color = if (isPlaying)
                        MaterialTheme.colorScheme.onPrimaryContainer
                    else
                        MaterialTheme.colorScheme.onSurface
                )
                
                // Description
                station.description?.let {
                    Text(
                        it,
                        style = MaterialTheme.typography.bodySmall,
                        color = if (isPlaying)
                            MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                Spacer(modifier = Modifier.height(4.dp))
                
                // Location and genre
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.Place,
                        contentDescription = null,
                        modifier = Modifier.size(14.dp),
                        tint = if (isPlaying)
                            MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.6f)
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        "${station.city}, ${station.state}",
                        style = MaterialTheme.typography.labelSmall,
                        color = if (isPlaying)
                            MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text("•", style = MaterialTheme.typography.labelSmall)
                    Text(
                        station.genre,
                        style = MaterialTheme.typography.labelSmall,
                        color = if (isPlaying)
                            MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        else
                            MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                // Features
                if (station.hasArtistInfo || station.hasAlbumArt) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        if (station.hasArtistInfo) {
                            AssistChip(
                                onClick = {},
                                label = { Text("Artist Info", style = MaterialTheme.typography.labelSmall) },
                                leadingIcon = {
                                    Icon(
                                        Icons.Default.Info,
                                        contentDescription = null,
                                        modifier = Modifier.size(16.dp)
                                    )
                                },
                                modifier = Modifier.height(24.dp)
                            )
                        }
                        if (station.hasAlbumArt) {
                            AssistChip(
                                onClick = {},
                                label = { Text("Album Art", style = MaterialTheme.typography.labelSmall) },
                                leadingIcon = {
                                    Icon(
                                        Icons.Default.Image,
                                        contentDescription = null,
                                        modifier = Modifier.size(16.dp)
                                    )
                                },
                                modifier = Modifier.height(24.dp)
                            )
                        }
                    }
                }
            }
            
            // Play indicator
            if (isPlaying) {
                Icon(
                    Icons.Default.GraphicEq,
                    contentDescription = "Playing",
                    modifier = Modifier.size(32.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
            } else {
                Icon(
                    Icons.Default.PlayArrow,
                    contentDescription = "Play",
                    modifier = Modifier.size(32.dp),
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@HiltViewModel
class HDRadioViewModel @Inject constructor(
    private val hdRadioService: HDRadioService,
    private val radioStationDao: com.universalmedialibrary.data.local.dao.RadioStationDao,
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService
) : ViewModel() {

    val stations: StateFlow<List<HDRadioStation>> = hdRadioService.hdStations
    val currentStation: StateFlow<HDRadioStation?> = hdRadioService.currentStation
    val genres: StateFlow<List<String>> = MutableStateFlow(hdRadioService.getAvailableGenres())

    fun playStation(station: HDRadioStation) {
        viewModelScope.launch {
            try {
                // Stop current playback
                musicPlayerService.stop()

                // Play station via music player service
                musicPlayerService.playTrackFromUri(
                    uri = station.streamUrl,
                    title = station.name,
                    artist = "HD Radio - ${station.genre}",
                    album = "${station.city}, ${station.state}",
                    duration = 0L, // Streams have no duration
                    albumArtUrl = null
                )

                // Update HD Radio service state
                hdRadioService.setCurrentStation(station)
                hdRadioService.setPlaying(true)

            } catch (e: Exception) {
                // Error handling - in real implementation would update UI state
            }
        }
    }
}
