package com.universalmedialibrary.ui.music

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * Context menu for track long-press actions
 */
@Composable
fun TrackContextMenu(
    track: Track,
    onDismiss: () -> Unit,
    onPlayNext: () -> Unit,
    onAddToQueue: () -> Unit,
    onAddToPlaylist: () -> Unit,
    onManageTags: () -> Unit,
    onGoToAlbum: () -> Unit,
    onGoToArtist: () -> Unit,
    onShare: () -> Unit,
    onShowInfo: () -> Unit
) {
    DropdownMenu(
        expanded = true,
        onDismissRequest = onDismiss
    ) {
        DropdownMenuItem(
            text = { Text("Play Next") },
            onClick = {
                onPlayNext()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.PlayArrow, null) }
        )
        DropdownMenuItem(
            text = { Text("Add to Queue") },
            onClick = {
                onAddToQueue()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.PlaylistAdd, null) }
        )
        DropdownMenuItem(
            text = { Text("Add to Playlist") },
            onClick = {
                onAddToPlaylist()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.Add, null) }
        )
        
        Divider()
        
        DropdownMenuItem(
            text = { Text("Manage Tags") },
            onClick = {
                onManageTags()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.Label, null) }
        )
        
        Divider()
        
        DropdownMenuItem(
            text = { Text("Go to Album") },
            onClick = {
                onGoToAlbum()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.Album, null) }
        )
        DropdownMenuItem(
            text = { Text("Go to Artist") },
            onClick = {
                onGoToArtist()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.Person, null) }
        )
        
        Divider()
        
        DropdownMenuItem(
            text = { Text("Share") },
            onClick = {
                onShare()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.Share, null) }
        )
        DropdownMenuItem(
            text = { Text("Track Info") },
            onClick = {
                onShowInfo()
                onDismiss()
            },
            leadingIcon = { Icon(Icons.Default.Info, null) }
        )
    }
}

/**
 * Track info dialog showing all metadata
 */
@Composable
fun TrackInfoDialog(
    track: Track,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Track Information") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                InfoRow("Title", track.title ?: "Unknown")
                InfoRow("Artist", track.displayArtist)
                InfoRow("Album", track.displayAlbum)
                if (track.albumArtist != track.artist) {
                    InfoRow("Album Artist", track.albumArtist ?: "")
                }
                InfoRow("Genre", track.displayGenre)
                if (track.year != null) {
                    InfoRow("Year", track.displayYear)
                }
                InfoRow("Duration", track.displayDuration)
                if (track.trackNumber != null) {
                    InfoRow("Track Number", track.trackNumber.toString())
                }
                if (track.bitrate != null && track.bitrate > 0) {
                    InfoRow("Bitrate", track.displayBitrate)
                }
                if (track.mimeType != null) {
                    InfoRow("Format", track.mimeType)
                }
                if (track.path != null) {
                    InfoRow("Path", track.path)
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

@Composable
private fun InfoRow(label: String, value: String) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium,
            modifier = Modifier.weight(1f, fill = false)
        )
    }
}
