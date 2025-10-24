package com.universalmedialibrary.ui.music

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
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ArtistDetailScreen(
    artistName: String,
    onNavigateBack: () -> Unit,
    onNavigateToPlayer: () -> Unit,
    onNavigateToAlbum: (String) -> Unit = {},
    viewModel: ArtistDetailViewModel = hiltViewModel()
) {
    val artist by viewModel.artist.collectAsState()
    val albums by viewModel.albums.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()

    LaunchedEffect(artistName) {
        viewModel.loadArtist(artistName)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Artist") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
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
            artist?.let { artistData ->
                LazyColumn(
                    modifier = Modifier.fillMaxSize().padding(padding),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    // Artist header
                    item {
                        Column(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Surface(
                                modifier = Modifier.size(120.dp),
                                shape = RoundedCornerShape(60.dp),
                                color = MaterialTheme.colorScheme.primaryContainer
                            ) {
                                Icon(
                                    Icons.Default.Person,
                                    contentDescription = null,
                                    modifier = Modifier.padding(24.dp),
                                    tint = MaterialTheme.colorScheme.onPrimaryContainer
                                )
                            }
                            
                            Text(
                                text = artistData.displayName,
                                style = MaterialTheme.typography.headlineMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "${artistData.albumCount} albums • ${artistData.trackCount} tracks",
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }

                    // Action buttons
                    item {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Button(
                                onClick = {
                                    viewModel.playArtist(artistData)
                                    onNavigateToPlayer()
                                },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.PlayArrow, null)
                                Spacer(Modifier.width(8.dp))
                                Text("Play All")
                            }
                            OutlinedButton(
                                onClick = {
                                    viewModel.shuffleArtist(artistData)
                                    onNavigateToPlayer()
                                },
                                modifier = Modifier.weight(1f)
                            ) {
                                Icon(Icons.Default.Shuffle, null)
                                Spacer(Modifier.width(8.dp))
                                Text("Shuffle")
                            }
                        }
                    }

                    item {
                        Divider()
                    }

                    // Albums section
                    item {
                        Text(
                            text = "Albums",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }

                    items(albums) { album ->
                        AlbumListItem(
                            album = album,
                            onClick = { onNavigateToAlbum(album.name) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun AlbumListItem(album: Album, onClick: () -> Unit) {
    ListItem(
        headlineContent = { Text(album.displayName) },
        supportingContent = {
            Text("${album.year ?: ""} • ${album.trackCount} tracks")
        },
        leadingContent = {
            Surface(
                modifier = Modifier.size(56.dp),
                shape = RoundedCornerShape(4.dp),
                color = MaterialTheme.colorScheme.surfaceVariant
            ) {
                Icon(
                    Icons.Default.Album,
                    contentDescription = null,
                    modifier = Modifier.padding(12.dp)
                )
            }
        },
        trailingContent = {
            Icon(Icons.Default.ChevronRight, null)
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}

@HiltViewModel
class ArtistDetailViewModel @Inject constructor(
    private val musicLibraryViewModel: MusicLibraryViewModel,
    private val playback: AudioPlaybackManager
) : ViewModel() {

    private val _artist = MutableStateFlow<Artist?>(null)
    val artist: StateFlow<Artist?> = _artist.asStateFlow()

    private val _albums = MutableStateFlow<List<Album>>(emptyList())
    val albums: StateFlow<List<Album>> = _albums.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    fun loadArtist(artistName: String) {
        viewModelScope.launch {
            _isLoading.value = true
            val uiState = musicLibraryViewModel.uiState.value
            _artist.value = uiState.artists.find { it.name == artistName }
            _albums.value = uiState.albums.filter { it.artist == artistName }
            _isLoading.value = false
        }
    }

    fun playArtist(artist: Artist) {
        val uris = artist.tracks.map { it.uri }
        if (uris.isNotEmpty()) {
            playback.setQueue(uris, 0, true)
        }
    }

    fun shuffleArtist(artist: Artist) {
        val uris = artist.tracks.shuffled().map { it.uri }
        if (uris.isNotEmpty()) {
            playback.setQueue(uris, 0, true)
        }
    }
}
