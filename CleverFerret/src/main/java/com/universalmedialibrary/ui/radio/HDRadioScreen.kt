package com.universalmedialibrary.ui.radio

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.radio.HDRadioStation

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
    val uiState by viewModel.uiState.collectAsState()

    var searchQuery by remember { mutableStateOf("") }
    var selectedGenre by remember { mutableStateOf("All") }
    var showGenreMenu by remember { mutableStateOf(false) }
    var showAddMenu by remember { mutableStateOf(false) }

    val snackbarHostState = remember { SnackbarHostState() }

    LaunchedEffect(uiState.message) {
        uiState.message?.let {
            snackbarHostState.showSnackbar(message = it)
            viewModel.clearFeedback()
        }
    }

    LaunchedEffect(uiState.error) {
        uiState.error?.let {
            snackbarHostState.showSnackbar(message = it, duration = SnackbarDuration.Long)
            viewModel.clearFeedback()
        }
    }

    val filteredStations = remember(stations, searchQuery, selectedGenre) {
        val query = searchQuery.trim()
        val baseStations = if (query.isEmpty()) {
            stations
        } else {
            viewModel.searchStations(query)
        }

        baseStations.filter { station ->
            selectedGenre == "All" || station.genre.equals(selectedGenre, ignoreCase = true)
        }
    }

    Scaffold(
        snackbarHost = { SnackbarHost(snackbarHostState) },
        topBar = {
            TopAppBar(
                title = { Text("HD Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showAddMenu = true }) {
                        Icon(Icons.Default.Add, "Add HD Station")
                    }
                    DropdownMenu(
                        expanded = showAddMenu,
                        onDismissRequest = { showAddMenu = false }
                    ) {
                        DropdownMenuItem(
                            text = { Text("Add Custom Station") },
                            leadingIcon = { Icon(Icons.Default.LibraryAdd, contentDescription = "Add to library") },
                            onClick = {
                                showAddMenu = false
                                viewModel.openManualDialog()
                            }
                        )
                        DropdownMenuItem(
                            text = { Text("Find by ZIP Code") },
                            leadingIcon = { Icon(Icons.Default.LocationOn, contentDescription = "Location") },
                            onClick = {
                                showAddMenu = false
                                viewModel.openZipDialog()
                            }
                        )
                    }
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
                        contentDescription = "Media image",
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

      if (uiState.showAddManualDialog) {
          AddHDRadioStationDialog(
              onDismiss = { viewModel.closeManualDialog() },
              onAddStation = { callSign, name, frequencyMhz, channel, streamUrl, description, city, state, genre, hasArtistInfo, hasAlbumArt ->
                  viewModel.addCustomStation(
                      callSign = callSign,
                      name = name,
                      frequencyMhz = frequencyMhz,
                      channel = channel,
                      streamUrl = streamUrl,
                      description = description,
                      city = city,
                      state = state,
                      genre = genre,
                      hasArtistInfo = hasArtistInfo,
                      hasAlbumArt = hasAlbumArt
                  )
              }
          )
      }

      if (uiState.showAddByZipDialog) {
          AddHDRadioStationsByZipDialog(
              state = uiState.zipLookup,
              onDismiss = { viewModel.closeZipDialog() },
              onLookup = { zip -> viewModel.lookupStationsByZip(zip) },
              onAddStations = { viewModel.addStationsFromZipLookup() }
          )
      }
    }
}

@Composable
private fun AddHDRadioStationDialog(
    onDismiss: () -> Unit,
    onAddStation: (callSign: String, name: String, frequencyMhz: String, channel: String, streamUrl: String, description: String?, city: String, state: String, genre: String, hasArtistInfo: Boolean, hasAlbumArt: Boolean) -> Unit
) {
    var callSign by remember { mutableStateOf("") }
    var name by remember { mutableStateOf("") }
    var frequency by remember { mutableStateOf("") }
    var channel by remember { mutableStateOf("HD1") }
    var streamUrl by remember { mutableStateOf("") }
    var description by remember { mutableStateOf("") }
    var city by remember { mutableStateOf("") }
    var state by remember { mutableStateOf("") }
    var genre by remember { mutableStateOf("") }
    var hasArtistInfo by remember { mutableStateOf(true) }
    var hasAlbumArt by remember { mutableStateOf(true) }

    val canSubmit = callSign.isNotBlank() &&
        name.isNotBlank() &&
        frequency.isNotBlank() &&
        streamUrl.isNotBlank() &&
        city.isNotBlank() &&
        state.isNotBlank()

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add HD Radio Station") },
        text = {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .verticalScroll(rememberScrollState()),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                OutlinedTextField(
                    value = callSign,
                    onValueChange = { callSign = it.uppercase().take(12) },
                    label = { Text("Call Sign") },
                    placeholder = { Text("e.g., WNPR-HD2") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Station Name") },
                    placeholder = { Text("e.g., NPR News HD2") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = frequency,
                    onValueChange = { frequency = it.filter { ch -> ch.isDigit() || ch == '.' || ch == ',' }.take(6) },
                    label = { Text("Frequency (MHz)") },
                    placeholder = { Text("e.g., 90.3") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = channel,
                    onValueChange = { channel = it.uppercase().take(6) },
                    label = { Text("HD Channel") },
                    placeholder = { Text("HD1") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = streamUrl,
                    onValueChange = { streamUrl = it },
                    label = { Text("Stream URL") },
                    placeholder = { Text("https://example.com/stream") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = description,
                    onValueChange = { description = it },
                    label = { Text("Description (optional)") },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = genre,
                    onValueChange = { genre = it },
                    label = { Text("Genre") },
                    placeholder = { Text("e.g., Jazz") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    OutlinedTextField(
                        value = city,
                        onValueChange = { city = it },
                        label = { Text("City") },
                        singleLine = true,
                        modifier = Modifier.weight(1f)
                    )

                    OutlinedTextField(
                        value = state,
                        onValueChange = { state = it.uppercase().take(3) },
                        label = { Text("State") },
                        placeholder = { Text("IL") },
                        singleLine = true,
                        modifier = Modifier.widthIn(min = 96.dp)
                    )
                }

                Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Checkbox(checked = hasArtistInfo, onCheckedChange = { hasArtistInfo = it })
                        Text("Includes artist info")
                    }
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Checkbox(checked = hasAlbumArt, onCheckedChange = { hasAlbumArt = it })
                        Text("Includes album art")
                    }
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    onAddStation(
                        callSign.trim(),
                        name.trim(),
                        frequency.trim(),
                        channel.trim(),
                        streamUrl.trim(),
                        description.trim().ifBlank { null },
                        city.trim(),
                        state.trim(),
                        genre.trim(),
                        hasArtistInfo,
                        hasAlbumArt
                    )
                },
                enabled = canSubmit
            ) {
                Text("Add Station")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) { Text("Cancel") }
        }
    )
}

@Composable
private fun AddHDRadioStationsByZipDialog(
    state: HDRadioZipLookupState,
    onDismiss: () -> Unit,
    onLookup: (String) -> Unit,
    onAddStations: () -> Unit
) {
    var zipInput by remember { mutableStateOf(state.zip) }

    LaunchedEffect(state.zip) {
        if (state.zip.isNotEmpty()) {
            zipInput = state.zip
        }
    }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Find HD Stations by ZIP") },
        text = {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .verticalScroll(rememberScrollState()),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                OutlinedTextField(
                    value = zipInput,
                    onValueChange = { input -> zipInput = input.filter { it.isDigit() }.take(5) },
                    label = { Text("ZIP Code") },
                    placeholder = { Text("e.g., 60601") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                Button(
                    onClick = { onLookup(zipInput) },
                    enabled = zipInput.length == 5
                ) {
                    Text("Lookup Stations")
                }

                if (state.isLoading) {
                    LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
                }

                state.locationLabel?.let { location ->
                    Text(
                        text = location,
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.SemiBold
                    )
                }

                if (state.stations.isNotEmpty()) {
                    state.stations.forEach { station ->
                        Surface(
                            shape = RoundedCornerShape(8.dp),
                            color = MaterialTheme.colorScheme.surfaceVariant,
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Column(
                                modifier = Modifier.padding(12.dp),
                                verticalArrangement = Arrangement.spacedBy(4.dp)
                            ) {
                                Text(
                                    text = "${station.displayFrequency} • ${station.callSign}",
                                    style = MaterialTheme.typography.bodyMedium,
                                    fontWeight = FontWeight.SemiBold
                                )
                                Text(
                                    text = station.name,
                                    style = MaterialTheme.typography.bodySmall,
                                    maxLines = 1,
                                    overflow = TextOverflow.Ellipsis
                                )
                                Text(
                                    text = "${station.city}, ${station.state} • ${station.genre}",
                                    style = MaterialTheme.typography.labelSmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
                } else if (!state.isLoading && state.zip.isNotEmpty()) {
                    Text(
                        text = "No stations available for ${state.zip} in the built-in directory.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = onAddStations,
                enabled = state.stations.isNotEmpty()
            ) {
                val count = state.stations.size
                Text("Add ${count} Station${if (count == 1) "" else "s"}")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) { Text("Close") }
        }
    )
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
                        contentDescription = "Media image",
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
                                        contentDescription = "Media image",
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
                                        contentDescription = "Media image",
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

