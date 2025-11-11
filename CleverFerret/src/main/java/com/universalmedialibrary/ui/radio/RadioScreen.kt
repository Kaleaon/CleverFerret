package com.universalmedialibrary.ui.radio

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
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
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.entity.RadioStation
import com.universalmedialibrary.services.radio.NowPlayingInfo
import com.universalmedialibrary.ui.theme.*

/**
 * Radio Screen - Internet radio streaming with metallic theme
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RadioScreen(
    onBack: () -> Unit,
    viewModel: RadioViewModel = hiltViewModel()
) {
    val allStations by viewModel.allStations.collectAsState()
    val favoriteStations by viewModel.favoriteStations.collectAsState()
    val recentlyPlayed by viewModel.recentlyPlayed.collectAsState()
    val currentStation by viewModel.currentStation.collectAsState()
    val playbackState by viewModel.playbackState.collectAsState()
    val uiState by viewModel.uiState.collectAsState()
    val nowPlayingInfo by viewModel.nowPlayingInfo.collectAsState()
    val isIdentifying by viewModel.isIdentifying.collectAsState()

    var selectedTab by remember { mutableIntStateOf(0) }

    CleverFerretTheme(palette = ThemePalette.ROYAL_SILVER) {
        Scaffold(
            topBar = {
                MetallicTopAppBar(
                    title = {
                        Text(
                            "Radio Streaming",
                            fontWeight = FontWeight.Bold
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = onBack) {
                            Icon(Icons.Default.ArrowBack, "Back")
                        }
                    },
                    actions = {
                        IconButton(onClick = { viewModel.setShowAddStationDialog(true) }) {
                            Icon(Icons.Default.Add, "Add Station")
                        }
                    }
                )
            },
            floatingActionButton = {
                if (currentStation != null) {
                    MetallicFAB(
                        onClick = { viewModel.stop() },
                        icon = {
                            Icon(Icons.Default.Stop, "Stop")
                        }
                    )
                }
            },
            bottomBar = {
                RadioMediaPlayerBar(
                    isVisible = currentStation != null,
                    station = currentStation,
                    nowPlayingInfo = nowPlayingInfo,
                    isPlaying = playbackState.isPlaying,
                    isIdentifying = isIdentifying,
                    onPlayPause = { viewModel.togglePlayback() },
                    onSkipNext = { viewModel.playNextStation() },
                    onSkipPrevious = { viewModel.playPreviousStation() },
                    onIdentifySong = { viewModel.identifyCurrentSong() }
                )
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                // Currently playing station with song info
                currentStation?.let { station ->
                    MetallicAccentBox(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp)
                    ) {
                        Column(
                            verticalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Column(modifier = Modifier.weight(1f)) {
                                    MetallicText(
                                        text = "Now Playing",
                                        style = MaterialTheme.typography.labelSmall
                                    )
                                    Text(
                                        text = station.name,
                                        style = MaterialTheme.typography.titleMedium,
                                        fontWeight = FontWeight.Bold
                                    )
                                    Text(
                                        text = station.genre ?: "Radio",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }

                                if (playbackState.isPlaying) {
                                    MetallicBadge(text = "LIVE")
                                }
                            }
                            
                            // Song identification display
                            nowPlayingInfo?.let { info ->
                                Divider(
                                    modifier = Modifier.padding(vertical = 4.dp),
                                    color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.3f)
                                )
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween,
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Row(
                                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                                        verticalAlignment = Alignment.CenterVertically,
                                        modifier = Modifier.weight(1f)
                                    ) {
                                        Icon(
                                            Icons.Default.MusicNote,
                                            contentDescription = null,
                                            modifier = Modifier.size(20.dp),
                                            tint = MaterialTheme.colorScheme.primary
                                        )
                                        Column {
                                            Text(
                                                text = info.title,
                                                style = MaterialTheme.typography.bodyMedium,
                                                fontWeight = FontWeight.SemiBold
                                            )
                                            Text(
                                                text = info.artist,
                                                style = MaterialTheme.typography.bodySmall,
                                                color = MaterialTheme.colorScheme.onSurfaceVariant
                                            )
                                        }
                                    }
                                    
                                    IconButton(
                                        onClick = { viewModel.identifyCurrentSong() },
                                        modifier = Modifier.size(32.dp)
                                    ) {
                                        Icon(
                                            Icons.Default.Refresh,
                                            "Refresh Song Info",
                                            modifier = Modifier.size(18.dp),
                                            tint = MaterialTheme.colorScheme.primary
                                        )
                                    }
                                }
                            }
                        }
                    }
                }

                // Tabs
                TabRow(selectedTabIndex = selectedTab) {
                    Tab(
                        selected = selectedTab == 0,
                        onClick = { selectedTab = 0 },
                        text = { Text("All Stations") }
                    )
                    Tab(
                        selected = selectedTab == 1,
                        onClick = { selectedTab = 1 },
                        text = { Text("Favorites") }
                    )
                    Tab(
                        selected = selectedTab == 2,
                        onClick = { selectedTab = 2 },
                        text = { Text("Recent") }
                    )
                }

                // Station list
                when (selectedTab) {
                    0 -> StationList(
                        stations = allStations,
                        currentStation = currentStation,
                        onPlayStation = { viewModel.playStation(it) },
                        onToggleFavorite = { viewModel.toggleFavorite(it) },
                        onDeleteStation = { viewModel.deleteStation(it) }
                    )
                    1 -> StationList(
                        stations = favoriteStations,
                        currentStation = currentStation,
                        onPlayStation = { viewModel.playStation(it) },
                        onToggleFavorite = { viewModel.toggleFavorite(it) },
                        onDeleteStation = { viewModel.deleteStation(it) }
                    )
                    2 -> StationList(
                        stations = recentlyPlayed,
                        currentStation = currentStation,
                        onPlayStation = { viewModel.playStation(it) },
                        onToggleFavorite = { viewModel.toggleFavorite(it) },
                        onDeleteStation = { viewModel.deleteStation(it) }
                    )
                }
            }

            // Add station dialog
            if (uiState.showAddStationDialog) {
                AddRadioStationDialog(
                    onDismiss = { viewModel.setShowAddStationDialog(false) },
                    onAdd = { name, url, description, genre ->
                        viewModel.addCustomStation(name, url, description, genre)
                    }
                )
            }

            // Error snackbar
            uiState.error?.let { error ->
                Snackbar(
                    modifier = Modifier.padding(16.dp),
                    action = {
                        TextButton(onClick = { viewModel.clearError() }) {
                            Text("Dismiss")
                        }
                    }
                ) {
                    Text(error)
                }
            }
        }
    }
}

@Composable
private fun RadioMediaPlayerBar(
    isVisible: Boolean,
    station: RadioStation?,
    nowPlayingInfo: NowPlayingInfo?,
    isPlaying: Boolean,
    isIdentifying: Boolean,
    onPlayPause: () -> Unit,
    onSkipNext: () -> Unit,
    onSkipPrevious: () -> Unit,
    onIdentifySong: () -> Unit
) {
    AnimatedVisibility(
        visible = isVisible,
        enter = slideInVertically(initialOffsetY = { it }) + fadeIn(),
        exit = slideOutVertically(targetOffsetY = { it }) + fadeOut()
    ) {
        Surface(
            tonalElevation = 8.dp,
            shadowElevation = 8.dp
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 12.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                val coverUrl = nowPlayingInfo?.albumArt ?: station?.logoUrl
                Box(
                    modifier = Modifier
                        .size(52.dp)
                        .clip(RoundedCornerShape(12.dp))
                ) {
                    if (coverUrl != null) {
                        AsyncImage(
                            model = coverUrl,
                            contentDescription = station?.name ?: "Station artwork",
                            modifier = Modifier.fillMaxSize(),
                            contentScale = ContentScale.Crop
                        )
                    } else {
                        val colors = listOf(
                            MaterialTheme.colorScheme.primary,
                            MaterialTheme.colorScheme.secondaryContainer
                        )
                        Box(
                            modifier = Modifier
                                .fillMaxSize()
                                .background(Brush.linearGradient(colors)),
                            contentAlignment = Alignment.Center
                        ) {
                            Icon(
                                imageVector = Icons.Default.Radio,
                                contentDescription = null,
                                tint = Color.White.copy(alpha = 0.8f),
                                modifier = Modifier.size(24.dp)
                            )
                        }
                    }
                }

                Column(
                    modifier = Modifier.weight(1f),
                    verticalArrangement = Arrangement.spacedBy(2.dp)
                ) {
                    Text(
                        text = station?.name ?: "Radio",
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.SemiBold,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    Text(
                        text = nowPlayingInfo?.displayText
                            ?: station?.genre
                            ?: "Tap identify to detect song info",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    nowPlayingInfo?.source?.takeIf { it.isNotBlank() }?.let { source ->
                        Text(
                            text = source,
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f),
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }

                Row(
                    horizontalArrangement = Arrangement.spacedBy(4.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(
                        onClick = onSkipPrevious,
                        enabled = station != null
                    ) {
                        Icon(Icons.Default.SkipPrevious, "Previous station")
                    }

                    FilledTonalIconButton(
                        onClick = onPlayPause,
                        enabled = station != null
                    ) {
                        Icon(
                            if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            if (isPlaying) "Pause" else "Play"
                        )
                    }

                    if (isIdentifying) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(28.dp),
                            strokeWidth = 2.dp
                        )
                    } else {
                        IconButton(
                            onClick = onIdentifySong,
                            enabled = station != null
                        ) {
                            Icon(Icons.Default.Search, "Identify song")
                        }
                    }

                    IconButton(
                        onClick = onSkipNext,
                        enabled = station != null
                    ) {
                        Icon(Icons.Default.SkipNext, "Next station")
                    }
                }
            }
        }
    }
}

@Composable
private fun StationList(
    stations: List<RadioStation>,
    currentStation: RadioStation?,
    onPlayStation: (RadioStation) -> Unit,
    onToggleFavorite: (RadioStation) -> Unit,
    onDeleteStation: (RadioStation) -> Unit
) {
    if (stations.isEmpty()) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(32.dp),
            contentAlignment = Alignment.Center
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Icon(
                    Icons.Default.Radio,
                    contentDescription = null,
                    modifier = Modifier.size(80.dp),
                    tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    text = "No Radio Stations",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = "Add stations to get started",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    } else {
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(stations) { station ->
                RadioStationCard(
                    station = station,
                    isPlaying = station.id == currentStation?.id,
                    onPlay = { onPlayStation(station) },
                    onToggleFavorite = { onToggleFavorite(station) },
                    onDelete = { onDeleteStation(station) }
                )
            }
        }
    }
}

@Composable
private fun RadioStationCard(
    station: RadioStation,
    isPlaying: Boolean,
    onPlay: () -> Unit,
    onToggleFavorite: () -> Unit,
    onDelete: () -> Unit
) {
    MetallicCard(
        modifier = Modifier.fillMaxWidth(),
        onClick = onPlay
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Station logo/icon
            Surface(
                modifier = Modifier.size(60.dp),
                shape = MaterialTheme.shapes.medium,
                color = MaterialTheme.colorScheme.surfaceVariant
            ) {
                if (station.logoUrl != null) {
                    AsyncImage(
                        model = station.logoUrl,
                        contentDescription = "Station Logo",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Icon(
                        Icons.Default.Radio,
                        contentDescription = null,
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(12.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                }
            }

            Spacer(modifier = Modifier.width(16.dp))

            // Station info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = station.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    station.genre?.let {
                        MetallicBadge(text = it)
                    }

                    station.bitrate?.let {
                        Text(
                            text = "${it}kbps",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                station.description?.let {
                    Text(
                        text = it,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        modifier = Modifier.padding(top = 4.dp)
                    )
                }
            }

            // Controls
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                IconButton(onClick = onToggleFavorite) {
                    Icon(
                        if (station.isFavorite) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                        contentDescription = "Favorite",
                        tint = if (station.isFavorite)
                            MaterialTheme.colorScheme.primary
                        else
                            MaterialTheme.colorScheme.onSurface
                    )
                }

                MetallicIconButton(
                    onClick = onPlay,
                    icon = {
                        Icon(
                            if (isPlaying) Icons.Default.Stop else Icons.Default.PlayArrow,
                            contentDescription = if (isPlaying) "Stop" else "Play"
                        )
                    }
                )
            }
        }
    }
}

@Composable
private fun AddRadioStationDialog(
    onDismiss: () -> Unit,
    onAdd: (String, String, String?, String?) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var streamUrl by remember { mutableStateOf("") }
    var description by remember { mutableStateOf("") }
    var genre by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Radio Station") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Station Name") },
                    placeholder = { Text("e.g., BBC Radio 1") },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = streamUrl,
                    onValueChange = { streamUrl = it },
                    label = { Text("Stream URL") },
                    placeholder = { Text("https://example.com/stream.mp3") },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = description,
                    onValueChange = { description = it },
                    label = { Text("Description (optional)") },
                    placeholder = { Text("e.g., Pop music from London") },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = genre,
                    onValueChange = { genre = it },
                    label = { Text("Genre (optional)") },
                    placeholder = { Text("e.g., Pop, Rock, Jazz") },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            MetallicButton(
                text = "Add",
                onClick = {
                    onAdd(
                        name,
                        streamUrl,
                        description.ifBlank { null },
                        genre.ifBlank { null }
                    )
                },
                enabled = name.isNotBlank() && streamUrl.isNotBlank()
            )
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
