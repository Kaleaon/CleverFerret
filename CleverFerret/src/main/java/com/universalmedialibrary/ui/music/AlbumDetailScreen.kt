package com.universalmedialibrary.ui.music

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import coil.compose.AsyncImage
import com.universalmedialibrary.data.repository.MusicRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AlbumDetailScreen(
    albumName: String,
    onNavigateBack: () -> Unit,
    onNavigateToPlayer: () -> Unit,
    viewModel: AlbumDetailViewModel = hiltViewModel()
) {
    val album by viewModel.album.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()

    LaunchedEffect(albumName) {
        viewModel.loadAlbum(albumName)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Album") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    var showMenu by remember { mutableStateOf(false) }
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, "More")
                    }
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        DropdownMenuItem(
                            text = { Text("Shuffle Album") },
                            onClick = {
                                album?.let { viewModel.shuffleAlbum(it) }
                                onNavigateToPlayer()
                                showMenu = false
                            },
                            leadingIcon = { Icon(Icons.Default.Shuffle, null) }
                        )
                        DropdownMenuItem(
                            text = { Text("Add to Queue") },
                            onClick = {
                                album?.let { viewModel.addAlbumToQueue(it) }
                                showMenu = false
                            },
                            leadingIcon = { Icon(Icons.Default.PlaylistAdd, null) }
                        )
                    }
                }
            )
        }
    ) { padding ->
        if (isLoading) {
            Box(
                modifier = Modifier.fillMaxSize().padding(padding),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator()
            }
        } else {
            album?.let { albumData ->
                LazyColumn(
                    modifier = Modifier.fillMaxSize().padding(padding),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // Album Header
                    item {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            // Album art
                            Card(
                                modifier = Modifier.size(160.dp),
                                shape = RoundedCornerShape(8.dp)
                            ) {
                                if (albumData.artworkUri != null) {
                                    AsyncImage(
                                        model = albumData.artworkUri,
                                        contentDescription = "Album art",
                                        modifier = Modifier.fillMaxSize(),
                                        contentScale = ContentScale.Crop
                                    )
                                } else {
                                    Icon(
                                        Icons.Default.Album,
                                        contentDescription = null,
                                        modifier = Modifier.fillMaxSize().padding(32.dp),
                                        tint = MaterialTheme.colorScheme.primary
                                    )
                                }
                            }

                            // Album info
                            Column(
                                modifier = Modifier.weight(1f),
                                verticalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                Text(
                                    text = albumData.displayName,
                                    style = MaterialTheme.typography.titleLarge,
                                    fontWeight = FontWeight.Bold,
                                    maxLines = 2,
                                    overflow = TextOverflow.Ellipsis
                                )
                                Text(
                                    text = albumData.displayArtist,
                                    style = MaterialTheme.typography.titleMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                                if (albumData.year != null) {
                                    Text(
                                        text = albumData.displayYear,
                                        style = MaterialTheme.typography.bodyMedium,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                                Text(
                                    text = "${albumData.trackCount} tracks",
                                    style = MaterialTheme.typography.bodyMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }

                    // Play buttons
                    item {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Button(
                                onClick = {
                                    viewModel.playAlbum(albumData)
                                    onNavigateToPlayer()
                                },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.PlayArrow, null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Play")
                            }
                            OutlinedButton(
                                onClick = {
                                    viewModel.shuffleAlbum(albumData)
                                    onNavigateToPlayer()
                                },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.Shuffle, null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Shuffle")
                            }
                        }
                    }

                    item {
                        Divider()
                    }

                    // Track list header
                    item {
                        Text(
                            text = "Tracks",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }

                    // Track list
                    itemsIndexed(albumData.tracks) { index, track ->
                        ListItem(
                            headlineContent = { Text(track.title ?: "Unknown") },
                            supportingContent = {
                                Text(
                                    "${track.displayArtist} • ${track.displayDuration}",
                                    maxLines = 1,
                                    overflow = TextOverflow.Ellipsis
                                )
                            },
                            leadingContent = {
                                Text(
                                    text = (track.trackNumber ?: (index + 1)).toString(),
                                    style = MaterialTheme.typography.titleMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    modifier = Modifier.width(32.dp)
                                )
                            },
                            trailingContent = {
                                IconButton(onClick = {
                                    viewModel.playAlbum(albumData, index)
                                    onNavigateToPlayer()
                                }) {
                                    Icon(Icons.Default.PlayArrow, "Play")
                                }
                            },
                            modifier = Modifier.clickable {
                                viewModel.playAlbum(albumData, index)
                                onNavigateToPlayer()
                            }
                        )
                    }
                }
            } ?: run {
                Box(
                    modifier = Modifier.fillMaxSize().padding(padding),
                    contentAlignment = Alignment.Center
                ) {
                    Text("Album not found")
                }
            }
        }
    }
}

@HiltViewModel
class AlbumDetailViewModel @Inject constructor(
    private val musicRepository: MusicRepository,
    private val musicPlayerService: com.universalmedialibrary.services.music.AdvancedMusicPlayerService
) : ViewModel() {

    private val _album = MutableStateFlow<Album?>(null)
    val album: StateFlow<Album?> = _album.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    fun loadAlbum(albumName: String) {
        viewModelScope.launch {
            _isLoading.value = true
            _album.value = musicRepository.getAlbum(albumName)
            _isLoading.value = false
        }
    }

    fun playAlbum(album: Album, startIndex: Int = 0) {
        viewModelScope.launch {
            val tracks = album.tracks
            if (tracks.isNotEmpty()) {
                val trackToPlay = tracks.getOrNull(startIndex) ?: tracks.first()
                    musicPlayerService.playTrackFromUri(
                        uri = trackToPlay.uri.toString(),
                        title = trackToPlay.title ?: "Unknown",
                        artist = trackToPlay.artist,
                        album = trackToPlay.album,
                        duration = trackToPlay.duration,
                        albumArtUrl = trackToPlay.albumArtUri?.toString()
                    )
            }
        }
    }

    fun shuffleAlbum(album: Album) {
        viewModelScope.launch {
            val tracks = album.tracks.shuffled()
            if (tracks.isNotEmpty()) {
                val firstTrack = tracks.first()
                    musicPlayerService.playTrackFromUri(
                        uri = firstTrack.uri.toString(),
                        title = firstTrack.title ?: "Unknown",
                        artist = firstTrack.artist,
                        album = firstTrack.album,
                        duration = firstTrack.duration,
                        albumArtUrl = firstTrack.albumArtUri?.toString()
                    )
            }
        }
    }

    fun addAlbumToQueue(album: Album) {
        // Queue functionality would require implementation of a persistent queue system
        // For now, this is a placeholder - in production, tracks would be added to 
        // the music player's queue for sequential playback
        viewModelScope.launch {
            // Future: musicPlayerService.addToQueue(album.tracks)
        }
    }
}
