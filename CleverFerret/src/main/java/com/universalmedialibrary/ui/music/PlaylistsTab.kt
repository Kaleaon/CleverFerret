package com.universalmedialibrary.ui.music

import android.text.format.DateUtils
import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun PlaylistsTab(
    playlists: List<PlaylistSummary>,
    onCreatePlaylist: (String) -> Unit,
    onPlayPlaylist: (Long) -> Unit,
    onShufflePlaylist: (Long) -> Unit,
    onQueuePlaylist: (Long, Boolean) -> Unit,
    onRenamePlaylist: (Long, String) -> Unit,
    onDeletePlaylist: (Long) -> Unit
) {
    var showCreateDialog by remember { mutableStateOf(false) }
    var showRenameDialog by remember { mutableStateOf<PlaylistSummary?>(null) }
    var showDeleteDialog by remember { mutableStateOf<PlaylistSummary?>(null) }
    var playlistNameInput by remember { mutableStateOf("") }
    var expandedMenuId by remember { mutableStateOf<Long?>(null) }

    Box(modifier = Modifier.fillMaxSize()) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Playlists",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.SemiBold
                )
                ExtendedFloatingActionButton(
                    onClick = {
                        playlistNameInput = ""
                        showCreateDialog = true
                    }
                ) {
                    Icon(Icons.Default.Add, contentDescription = "Create playlist")
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("New Playlist")
                }
            }

            if (playlists.isEmpty()) {
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(top = 24.dp),
                    tonalElevation = 2.dp,
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(24.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Icon(
                            Icons.Default.PlaylistPlay,
                            contentDescription = "No playlists",
                            modifier = Modifier.size(72.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            "No playlists yet",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.SemiBold
                        )
                        Text(
                            "Create your first playlist to start organising favorite tracks and moods.",
                            style = MaterialTheme.typography.bodyMedium,
                            textAlign = TextAlign.Center,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        OutlinedButton(onClick = { showCreateDialog = true }) {
                            Icon(Icons.Default.Add, contentDescription = "Create playlist")
                            Spacer(Modifier.width(8.dp))
                            Text("Create Playlist")
                        }
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    verticalArrangement = Arrangement.spacedBy(12.dp),
                    contentPadding = PaddingValues(bottom = 96.dp)
                ) {
                    items(playlists) { summary ->
                        PlaylistCard(
                            summary = summary,
                            expandedMenuId = expandedMenuId,
                            onExpandMenu = { expandedMenuId = it },
                            onDismissMenu = { expandedMenuId = null },
                            onPlay = { onPlayPlaylist(summary.id) },
                            onShuffle = { onShufflePlaylist(summary.id) },
                            onQueue = { playNext -> onQueuePlaylist(summary.id, playNext) },
                            onRename = {
                                playlistNameInput = summary.name
                                showRenameDialog = summary
                                expandedMenuId = null
                            },
                            onDelete = {
                                showDeleteDialog = summary
                                expandedMenuId = null
                            }
                        )
                    }
                }
            }
        }

        if (showCreateDialog) {
            PlaylistNameDialog(
                title = "Create Playlist",
                initialValue = playlistNameInput,
                onConfirm = { name ->
                    onCreatePlaylist(name.trim())
                    playlistNameInput = ""
                    showCreateDialog = false
                },
                onDismiss = { showCreateDialog = false }
            )
        }

        showRenameDialog?.let { summary ->
            PlaylistNameDialog(
                title = "Rename Playlist",
                initialValue = summary.name,
                onConfirm = { newName ->
                    onRenamePlaylist(summary.id, newName.trim())
                    playlistNameInput = ""
                    showRenameDialog = null
                },
                onDismiss = { showRenameDialog = null }
            )
        }

        showDeleteDialog?.let { summary ->
            AlertDialog(
                onDismissRequest = { showDeleteDialog = null },
                title = { Text("Delete Playlist") },
                text = {
                    Text("Are you sure you want to delete \"${summary.name}\"? This cannot be undone.")
                },
                confirmButton = {
                    TextButton(onClick = {
                        onDeletePlaylist(summary.id)
                        showDeleteDialog = null
                    }) {
                        Text("Delete")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showDeleteDialog = null }) {
                        Text("Cancel")
                    }
                }
            )
        }
    }
}
