package com.universalmedialibrary.ui.music.hivefy

import android.content.Intent
import android.net.Uri
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.OpenInNew
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Tag
import androidx.compose.material3.AssistChip
import androidx.compose.material3.AssistChipDefaults
import androidx.compose.material3.ElevatedCard
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import kotlinx.coroutines.launch
import com.universalmedialibrary.data.music.hivefy.SaavnAlbum
import com.universalmedialibrary.data.music.hivefy.SaavnLanguage
import com.universalmedialibrary.data.music.hivefy.SaavnPlaylist
import com.universalmedialibrary.data.music.hivefy.SaavnSong
import com.universalmedialibrary.data.music.hivefy.primaryArtistLine

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HivefyMusicScreen(
    onBack: () -> Unit,
    viewModel: HivefyMusicViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }
    val context = LocalContext.current
    val coroutineScope = rememberCoroutineScope()

    var previewPlaylist by remember { mutableStateOf<SaavnPlaylist?>(null) }

    LaunchedEffect(Unit) {
        viewModel.events.collect { event ->
            when (event) {
                is HivefyMusicViewModel.HivefyMusicEvent.Message ->
                    snackbarHostState.showSnackbar(event.text)
            }
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Hivefy Discovery") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.refresh(forceRefresh = true) }) {
                        Icon(Icons.Default.Refresh, contentDescription = "Refresh Hivefy data")
                    }
                }
            )
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp, vertical = 8.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            LanguageSelector(
                selected = uiState.selectedLanguage,
                onLanguageSelected = viewModel::selectLanguage
            )

            AnimatedVisibility(visible = uiState.errorMessage != null) {
                ErrorBanner(
                    message = uiState.errorMessage ?: "",
                    onRetry = { viewModel.refresh(forceRefresh = true) }
                )
            }

            AnimatedVisibility(visible = uiState.lastFetchedTimestamp != null) {
                val timestamp = uiState.lastFetchedTimestamp
                if (timestamp != null) {
                    Text(
                        text = "Last synced: ${android.text.format.DateUtils.getRelativeTimeSpanString(timestamp)}",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            if (uiState.isLoading && !uiState.hasContent) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(1f),
                    contentAlignment = Alignment.Center
                ) {
                    androidx.compose.material3.CircularProgressIndicator()
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(24.dp),
                    contentPadding = PaddingValues(bottom = 32.dp)
                ) {
                    if (uiState.playlists.isNotEmpty()) {
                        item {
                            SectionHeader("Featured Playlists")
                        }
                        item {
                            HivefyPlaylistRow(
                                playlists = uiState.playlists,
                                onPlaylistClick = { previewPlaylist = it },
                                onPlay = { viewModel.playPlaylist(it) }
                            )
                        }
                    }

                    if (uiState.albums.isNotEmpty()) {
                        item {
                            SectionHeader("New & Trending Albums")
                        }
                        item {
                            HivefyAlbumRow(
                                albums = uiState.albums,
                                onPlay = { album ->
                                    val firstSong = album.songs.firstOrNull()
                                    if (firstSong != null) {
                                        viewModel.playSong(firstSong)
                                    }
                                }
                            )
                        }
                    }

                    if (!uiState.hasContent && !uiState.isLoading) {
                        item {
                            EmptyState(onRetry = { viewModel.refresh(true) })
                        }
                    }
                }
            }
        }
    }

    previewPlaylist?.let { playlist ->
        ModalBottomSheet(
            onDismissRequest = { previewPlaylist = null }
        ) {
            PlaylistPreviewSheet(
                playlist = playlist,
                onPlaySong = { viewModel.playSong(it) },
                onOpenExternally = {
                    val safeIntent = Intent(Intent.ACTION_VIEW, Uri.parse(playlist.url)).apply {
                        addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    }
                    if (safeIntent.resolveActivity(context.packageManager) != null) {
                        context.startActivity(safeIntent)
                    } else {
                        coroutineScope.launch {
                            snackbarHostState.showSnackbar("No application available to open Hivefy link.")
                        }
                    }
                }
            )
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun LanguageSelector(
    selected: SaavnLanguage,
    onLanguageSelected: (SaavnLanguage) -> Unit
) {
    FlowRow(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(8.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        SaavnLanguage.values().forEach { language ->
            AssistChip(
                onClick = { onLanguageSelected(language) },
                label = { Text(language.displayName) },
                leadingIcon = {
                    if (language == selected) {
                        Icon(Icons.Default.Tag, contentDescription = null)
                    }
                },
                colors = androidx.compose.material3.AssistChipDefaults.assistChipColors(
                    containerColor = if (language == selected)
                        MaterialTheme.colorScheme.primaryContainer
                    else
                        MaterialTheme.colorScheme.surfaceVariant
                )
            )
        }
    }
}

@Composable
private fun SectionHeader(title: String) {
    Text(
        text = title,
        style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.SemiBold)
    )
}

@Composable
private fun HivefyPlaylistRow(
    playlists: List<SaavnPlaylist>,
    onPlaylistClick: (SaavnPlaylist) -> Unit,
    onPlay: (SaavnPlaylist) -> Unit
) {
    LazyRow(
        horizontalArrangement = Arrangement.spacedBy(16.dp),
        contentPadding = PaddingValues(horizontal = 4.dp)
    ) {
        items(playlists, key = { it.id }) { playlist ->
            ElevatedCard(
                modifier = Modifier
                    .width(220.dp)
                    .height(240.dp)
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(12.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    AsyncImage(
                        model = playlist.artworkUrl,
                        contentDescription = null,
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(120.dp)
                    )
                    Text(
                        text = playlist.title,
                        style = MaterialTheme.typography.titleMedium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    Text(
                        text = playlist.primaryArtistLine() ?: "${playlist.songCount} songs",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        TextButton(onClick = { onPlaylistClick(playlist) }) {
                            Text("Details")
                        }
                        IconButton(onClick = { onPlay(playlist) }) {
                            Icon(Icons.Default.PlayArrow, contentDescription = "Play playlist")
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun HivefyAlbumRow(
    albums: List<SaavnAlbum>,
    onPlay: (SaavnAlbum) -> Unit
) {
    LazyRow(
        horizontalArrangement = Arrangement.spacedBy(16.dp),
        contentPadding = PaddingValues(horizontal = 4.dp)
    ) {
        items(albums, key = { it.id }) { album ->
            ElevatedCard(
                modifier = Modifier
                    .width(200.dp)
                    .height(220.dp)
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(12.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    AsyncImage(
                        model = album.artworkUrl,
                        contentDescription = null,
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(120.dp)
                    )
                    Text(
                        text = album.title,
                        style = MaterialTheme.typography.titleMedium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    Text(
                        text = album.artistNames ?: "Various artists",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    TextButton(onClick = { onPlay(album) }) {
                        Icon(Icons.Default.PlayArrow, contentDescription = null)
                        Spacer(Modifier.width(4.dp))
                        Text("Play first track")
                    }
                }
            }
        }
    }
}

@Composable
private fun PlaylistPreviewSheet(
    playlist: SaavnPlaylist,
    onPlaySong: (SaavnSong) -> Unit,
    onOpenExternally: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = playlist.title,
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.SemiBold
        )
        Text(
            text = playlist.description ?: "${playlist.songCount} curated songs from Hivefy",
            style = MaterialTheme.typography.bodyMedium
        )
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(max = 400.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(playlist.songs, key = { it.id }) { song ->
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(
                        modifier = Modifier.weight(1f),
                        verticalArrangement = Arrangement.spacedBy(2.dp)
                    ) {
                        Text(
                            text = song.title,
                            style = MaterialTheme.typography.bodyLarge,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                        Text(
                            text = song.primaryArtists.joinToString { it.name },
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    IconButton(onClick = { onPlaySong(song) }) {
                        Icon(Icons.Default.PlayArrow, contentDescription = "Play preview")
                    }
                }
            }
        }
        Row(
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            OutlinedButton(onClick = onOpenExternally) {
                Icon(Icons.Default.OpenInNew, contentDescription = null)
                Spacer(Modifier.width(4.dp))
                Text("Open in JioSaavn")
            }
        }
    }
}

@Composable
private fun ErrorBanner(message: String, onRetry: () -> Unit) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .background(
                MaterialTheme.colorScheme.errorContainer,
                MaterialTheme.shapes.medium
            )
            .padding(12.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Icon(Icons.Default.Info, contentDescription = null)
            Text(
                text = message,
                style = MaterialTheme.typography.bodyMedium
            )
        }
        TextButton(onClick = onRetry) {
            Text("Retry")
        }
    }
}

@Composable
private fun EmptyState(onRetry: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 48.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Icon(
            imageVector = Icons.Default.Info,
            contentDescription = null,
            tint = MaterialTheme.colorScheme.primary,
            modifier = Modifier.size(48.dp)
        )
        Text(
            text = "No Hivefy picks available yet",
            style = MaterialTheme.typography.titleMedium
        )
        Text(
            text = "Try refreshing or choose a different language.",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        TextButton(onClick = onRetry) {
            Text("Refresh now")
        }
    }
}
