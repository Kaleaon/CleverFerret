package com.universalmedialibrary.ui.music

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.selection.selectable
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.VolumeUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * Playback speed control dialog
 */
@Composable
fun PlaybackSpeedDialog(
    currentSpeed: Float,
    onSpeedSelected: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 1.75f, 2.0f)
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Playback Speed") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                speeds.forEach { speed ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .selectable(
                                selected = currentSpeed == speed,
                                onClick = {
                                    onSpeedSelected(speed)
                                    onDismiss()
                                }
                            )
                            .padding(vertical = 8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = currentSpeed == speed,
                            onClick = null
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "${speed}x",
                            style = MaterialTheme.typography.bodyLarge
                        )
                        if (speed == 1.0f) {
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = "(Normal)",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
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

/**
 * Equalizer dialog with presets
 */
@Composable
fun EqualizerDialog(
    currentPreset: String,
    onPresetSelected: (String) -> Unit,
    onDismiss: () -> Unit
) {
    val presets = listOf(
        "Normal" to "Flat response",
        "Pop" to "Emphasis on vocals",
        "Rock" to "Enhanced bass and treble",
        "Jazz" to "Smooth mids and highs",
        "Classical" to "Natural acoustic",
        "Hip Hop" to "Heavy bass",
        "Electronic" to "Punchy bass and highs",
        "Acoustic" to "Warm natural sound"
    )
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Equalizer Preset") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                presets.forEach { (name, description) ->
                    ListItem(
                        headlineContent = { Text(name) },
                        supportingContent = { Text(description, style = MaterialTheme.typography.bodySmall) },
                        leadingContent = {
                            RadioButton(
                                selected = currentPreset == name,
                                onClick = { 
                                    onPresetSelected(name)
                                    onDismiss()
                                }
                            )
                        },
                        modifier = Modifier.clickable {
                            onPresetSelected(name)
                            onDismiss()
                        }
                    )
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

/**
 * Volume control dialog
 */
@Composable
fun VolumeDialog(
    currentVolume: Float,
    onVolumeChange: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Volume Control") },
        text = {
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Icon(
                    if (currentVolume > 0.5f) Icons.AutoMirrored.Filled.VolumeUp 
                    else if (currentVolume > 0f) Icons.Default.VolumeDown
                    else Icons.Default.VolumeOff,
                    contentDescription = null,
                    modifier = Modifier.size(48.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                
                Text(
                    text = "${(currentVolume * 100).toInt()}%",
                    style = MaterialTheme.typography.headlineMedium
                )
                
                Slider(
                    value = currentVolume,
                    onValueChange = onVolumeChange,
                    modifier = Modifier.fillMaxWidth()
                )
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    TextButton(onClick = { onVolumeChange(0f) }) {
                        Text("Mute")
                    }
                    TextButton(onClick = { onVolumeChange(1f) }) {
                        Text("Max")
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Done")
            }
        }
    )
}

/**
 * Sleep timer dialog
 */
@Composable
fun SleepTimerDialog(
    onTimerSet: (minutes: Int) -> Unit,
    onDismiss: () -> Unit
) {
    val durations = listOf(5, 10, 15, 30, 45, 60, 90, 120)
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Sleep Timer") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(
                    "Stop playback after:",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                durations.forEach { minutes ->
                    OutlinedButton(
                        onClick = {
                            onTimerSet(minutes)
                            onDismiss()
                        },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text(
                            text = if (minutes >= 60) "${minutes / 60} hour${if (minutes > 60) "s" else ""}" 
                            else "$minutes minutes"
                        )
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

/**
 * Add to playlist dialog
 */
@Composable
fun AddToPlaylistDialog(
    playlists: List<String>,
    onPlaylistSelected: (String) -> Unit,
    onCreateNew: () -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add to Playlist") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedButton(
                    onClick = {
                        onCreateNew()
                        onDismiss()
                    },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Add, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Create New Playlist")
                }
                
                if (playlists.isNotEmpty()) {
                    HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp))
                    
                    playlists.forEach { playlist ->
                        ListItem(
                            headlineContent = { Text(playlist) },
                            leadingContent = {
                                Icon(Icons.Default.PlaylistPlay, contentDescription = "Play playlist")
                            },
                            modifier = Modifier.clickable {
                                onPlaylistSelected(playlist)
                                onDismiss()
                            }
                        )
                    }
                } else {
                    Text(
                        "No playlists yet. Create one!",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(vertical = 8.dp)
                    )
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
