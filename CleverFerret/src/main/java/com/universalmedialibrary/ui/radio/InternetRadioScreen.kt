package com.universalmedialibrary.ui.radio

import androidx.compose.animation.core.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.clipToBounds
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.visualizer.ProjectMVisualizer
import com.universalmedialibrary.ui.visualizer.VisualizerStyle

/**
 * Internet Radio screen for streaming online radio stations
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun InternetRadioScreen(
    onNavigateBack: () -> Unit,
    onNavigateToRadioBrowser: () -> Unit = {},
    viewModel: InternetRadioViewModel = hiltViewModel()
) {
    val stations by viewModel.stations.collectAsState()
    val currentStation by viewModel.currentStation.collectAsState()
    val isPlaying by viewModel.isPlaying.collectAsState()
    val availableGenres by viewModel.availableGenres.collectAsState() // Hoisted to composable scope
    val visualizerState by viewModel.visualizerState.collectAsState()
    var searchQuery by remember { mutableStateOf("") }
    var selectedGenre by remember { mutableStateOf("All") }
    var showAddStationDialog by remember { mutableStateOf(false) }
    var showVisualizer by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Internet Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = onNavigateToRadioBrowser) {
                        Icon(Icons.Default.Public, "Browse Directory")
                    }
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

            // Current Playing with Visualizer
            currentStation?.let { station ->
                NowPlayingCard(
                    station = station,
                    isPlaying = isPlaying,
                    showVisualizer = showVisualizer,
                    visualizerState = visualizerState,
                    onTogglePlayback = { viewModel.togglePlayback() },
                    onToggleVisualizer = { showVisualizer = !showVisualizer }
                )
            }

            // Genre Tabs - Dynamically generated from available stations
            val genres = listOf("All") + availableGenres.sorted()
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
            },
            availableGenres = availableGenres
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
            // Logo
            station.logoUrl?.let { url ->
                AsyncImage(
                    
                    model = url,
                    contentDescription = "Media image",
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(8.dp)),
                    contentScale = androidx.compose.ui.layout.ContentScale.Crop
                )
                Spacer(modifier = Modifier.width(16.dp))
            }

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


@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddStationDialog(
    onDismiss: () -> Unit,
    onAdd: (String, String, String) -> Unit,
    availableGenres: List<String> = emptyList()
) {
    var name by remember { mutableStateOf("") }
    var url by remember { mutableStateOf("") }
    var genre by remember { mutableStateOf("") }
    var showGenreDropdown by remember { mutableStateOf(false) }
    
    // Suggest genres based on input
    val genreSuggestions = remember(genre, availableGenres) {
        if (genre.isBlank()) {
            availableGenres
        } else {
            availableGenres.filter { it.contains(genre, ignoreCase = true) }
        }
    }
    
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
                
                // Genre field with dropdown suggestions
                ExposedDropdownMenuBox(
                    expanded = showGenreDropdown && genreSuggestions.isNotEmpty(),
                    onExpandedChange = { showGenreDropdown = it }
                ) {
                    OutlinedTextField(
                        value = genre,
                        onValueChange = { 
                            genre = it
                            showGenreDropdown = true
                        },
                        label = { Text("Genre") },
                        modifier = Modifier
                            .fillMaxWidth()
                            .menuAnchor(),
                        singleLine = true,
                        placeholder = { Text("Select or type genre...") },
                        trailingIcon = {
                            ExposedDropdownMenuDefaults.TrailingIcon(expanded = showGenreDropdown)
                        }
                    )
                    
                    if (genreSuggestions.isNotEmpty()) {
                        ExposedDropdownMenu(
                            expanded = showGenreDropdown,
                            onDismissRequest = { showGenreDropdown = false }
                        ) {
                            genreSuggestions.forEach { suggestion ->
                                DropdownMenuItem(
                                    text = { Text(suggestion) },
                                    onClick = {
                                        genre = suggestion
                                        showGenreDropdown = false
                                    }
                                )
                            }
                            // Option to add custom genre
                            if (genre.isNotBlank() && genre !in availableGenres) {
                                HorizontalDivider()
                                DropdownMenuItem(
                                    text = { Text("Add \"$genre\" as new genre") },
                                    onClick = {
                                        showGenreDropdown = false
                                    },
                                    leadingIcon = {
                                        Icon(Icons.Default.Add, "Add")
                                    }
                                )
                            }
                        }
                    }
                }
                
                Text(
                    text = "Tip: Choose an existing genre or create a new one",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (name.isNotBlank() && url.isNotBlank()) {
                        onAdd(name, url, genre.ifBlank { "Other" })
                        onDismiss()
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

/**
 * Enhanced Now Playing Card with visualizer support and scrolling text
 */
@Composable
private fun NowPlayingCard(
    station: InternetRadioStation,
    isPlaying: Boolean,
    showVisualizer: Boolean,
    visualizerState: com.universalmedialibrary.services.visualizer.VisualizerState,
    onTogglePlayback: () -> Unit,
    onToggleVisualizer: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.fillMaxWidth()
        ) {
            // Visualizer Section (Toggleable)
            if (showVisualizer && isPlaying) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(180.dp)
                ) {
                    ProjectMVisualizer(
                        visualizerState = visualizerState,
                        style = VisualizerStyle.SPECTRUM_BARS,
                        modifier = Modifier.fillMaxSize()
                    )
                }
            }
            
            // Station Info Row
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
                    
                    // Scrolling station name
                    ScrollingText(
                        text = station.name,
                        style = MaterialTheme.typography.titleMedium.copy(
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        ),
                        modifier = Modifier.fillMaxWidth(0.9f)
                    )
                    
                    Text(
                        station.genre,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                    )
                }
                
                // Control Buttons Column
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    FilledIconButton(
                        onClick = onTogglePlayback
                    ) {
                        Icon(
                            if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            if (isPlaying) "Pause" else "Play"
                        )
                    }
                    
                    FilledTonalIconButton(
                        onClick = onToggleVisualizer
                    ) {
                        Icon(
                            Icons.Default.GraphicEq,
                            "Toggle Visualizer",
                            tint = if (showVisualizer) MaterialTheme.colorScheme.primary 
                                   else MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
    }
}

/**
 * Auto-scrolling text for long station names
 */
@Composable
private fun ScrollingText(
    text: String,
    style: androidx.compose.ui.text.TextStyle,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberScrollState()
    
    // Auto-scroll effect - only if text overflows
    LaunchedEffect(text, scrollState.maxValue) {
        // Only animate if text actually needs scrolling
        if (scrollState.maxValue > 0) {
            while (true) {
                // Scroll to end
                scrollState.animateScrollTo(
                    value = scrollState.maxValue,
                    animationSpec = tween(
                        durationMillis = (text.length * 100).coerceAtLeast(2000),
                        easing = LinearEasing
                    )
                )
                // Pause at end
                kotlinx.coroutines.delay(1000)
                // Scroll back to start
                scrollState.animateScrollTo(
                    value = 0,
                    animationSpec = tween(
                        durationMillis = 800,
                        easing = LinearEasing
                    )
                )
                // Pause at start
                kotlinx.coroutines.delay(1000)
            }
        }
    }
    
    Text(
        text = text,
        style = style,
        maxLines = 1,
        modifier = modifier
            .clipToBounds()
            .horizontalScroll(scrollState, enabled = false)
    )
}
