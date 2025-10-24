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
fun GenreDetailScreen(
    genreName: String,
    onNavigateBack: () -> Unit,
    onNavigateToPlayer: () -> Unit,
    viewModel: GenreDetailViewModel = hiltViewModel()
) {
    val genre by viewModel.genre.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()

    LaunchedEffect(genreName) {
        viewModel.loadGenre(genreName)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Genre") },
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
            genre?.let { genreData ->
                LazyColumn(
                    modifier = Modifier.fillMaxSize().padding(padding),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    item {
                        Column(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Surface(
                                modifier = Modifier.size(120.dp),
                                shape = RoundedCornerShape(8.dp),
                                color = MaterialTheme.colorScheme.tertiaryContainer
                            ) {
                                Icon(
                                    Icons.Default.Category,
                                    contentDescription = null,
                                    modifier = Modifier.padding(24.dp),
                                    tint = MaterialTheme.colorScheme.onTertiaryContainer
                                )
                            }
                            
                            Text(
                                text = genreData.displayName,
                                style = MaterialTheme.typography.headlineMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "${genreData.trackCount} tracks",
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }

                    item {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Button(
                                onClick = {
                                    viewModel.playGenre(genreData)
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
                                    viewModel.shuffleGenre(genreData)
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
                        Text(
                            text = "Tracks",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.padding(top = 8.dp)
                        )
                    }

                    items(genreData.tracks) { track ->
                        TrackListItem(
                            track = track,
                            compact = false,
                            onClick = {
                                viewModel.playTrack(track)
                                onNavigateToPlayer()
                            }
                        )
                    }
                }
            }
        }
    }
}

@HiltViewModel
class GenreDetailViewModel @Inject constructor(
    private val musicLibraryViewModel: MusicLibraryViewModel,
    private val playback: AudioPlaybackManager
) : ViewModel() {

    private val _genre = MutableStateFlow<Genre?>(null)
    val genre: StateFlow<Genre?> = _genre.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    fun loadGenre(genreName: String) {
        viewModelScope.launch {
            _isLoading.value = true
            val uiState = musicLibraryViewModel.uiState.value
            _genre.value = uiState.genres.find { it.name == genreName }
            _isLoading.value = false
        }
    }

    fun playGenre(genre: Genre) {
        val uris = genre.tracks.map { it.uri }
        if (uris.isNotEmpty()) {
            playback.setQueue(uris, 0, true)
        }
    }

    fun shuffleGenre(genre: Genre) {
        val uris = genre.tracks.shuffled().map { it.uri }
        if (uris.isNotEmpty()) {
            playback.setQueue(uris, 0, true)
        }
    }

    fun playTrack(track: Track) {
        playback.loadSingle(track.uri)
    }
}
