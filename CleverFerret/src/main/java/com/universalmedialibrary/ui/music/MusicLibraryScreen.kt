package com.universalmedialibrary.ui.music

import android.Manifest
import android.os.Build
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController

/**
 * A screen that displays the music library.
 *
 * @param navController The NavController for navigating to other screens.
 * @param viewModel The view model for this screen.
 */
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
            TopAppBar(
                title = { Text("Music Library") },
                actions = {
                    if (!state.isLoading) {
                        TextButton(onClick = { viewModel.playAll() }) { Text("Play All") }
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
                    ListItem(
                        headlineContent = { Text(track.title ?: "Unknown") },
                        supportingContent = { Text(listOfNotNull(track.artist, track.album).joinToString(" • ")) },
                        modifier = Modifier.fillMaxWidth(),
                        trailingContent = {
                            TextButton(onClick = { viewModel.playTrack(track) }) { Text("Play") }
                        }
                    )
                    Divider()
                }
            }
        }
    }
}