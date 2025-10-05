package com.universalmedialibrary.ui.music

import android.Manifest
import android.os.Build
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.ui.theme.MetallicButton
import com.universalmedialibrary.ui.theme.MetallicCard
import com.universalmedialibrary.ui.theme.MetallicTopAppBar
import com.universalmedialibrary.ui.theme.MetallicIconButton

@Composable
fun MusicLibraryScreen(
    navController: NavController,
    viewModel: MusicLibraryViewModel = hiltViewModel()
) {
    var permissionGranted by remember { mutableStateOf(true) }
    // In a real implementation, request READ_MEDIA_AUDIO (33+) or READ_EXTERNAL_STORAGE (<33)

    LaunchedEffect(Unit) {
        if (permissionGranted) viewModel.scan()
    }

    val state by viewModel.uiState.collectAsState()

    Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = { Text("Music Library") },
                actions = {
                    if (!state.isLoading) {
                        MetallicButton(
                            text = "Play All",
                            onClick = { viewModel.playAll() }
                        )
                    }
                }
            )
        }
    ) { padding ->
        if (state.isLoading) {
            Box(modifier = Modifier.fillMaxSize().padding(padding), contentAlignment = androidx.compose.ui.Alignment.Center) {
                CircularProgressIndicator()
            }
        } else {
            LazyColumn(
                modifier = Modifier.fillMaxSize().padding(padding),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(state.tracks) { track ->
                    MetallicCard(
                        modifier = Modifier.fillMaxWidth(),
                        onClick = { viewModel.playTrack(track) }
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = androidx.compose.ui.Alignment.CenterVertically
                        ) {
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = track.title ?: "Unknown",
                                    style = MaterialTheme.typography.titleMedium
                                )
                                Text(
                                    text = listOfNotNull(track.artist, track.album).joinToString(" • "),
                                    style = MaterialTheme.typography.bodyMedium,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                            MetallicIconButton(
                                onClick = { viewModel.playTrack(track) },
                                icon = {
                                    Icon(Icons.Default.PlayArrow, "Play")
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}
