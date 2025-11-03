package com.universalmedialibrary.ui.midi

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.midi.MidiFile
import com.universalmedialibrary.data.midi.MidiPlaybackState
import com.universalmedialibrary.data.midi.MidiTrackInfo

/**
 * MIDI Player Screen
 * 
 * Displays MIDI file information and playback controls
 * Inspired by MuseScore's MIDI playback interface
 * 
 * Features:
 * - MIDI file metadata display
 * - Playback controls (play/pause/stop)
 * - Track list with mute/solo controls
 * - Tempo control
 * - Seek bar
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MidiPlayerScreen(
    midiFile: MidiFile,
    tracks: List<MidiTrackInfo>,
    playbackState: MidiPlaybackState,
    onPlayPause: () -> Unit,
    onStop: () -> Unit,
    onSeek: (Long) -> Unit,
    onTrackMute: (Long, Boolean) -> Unit,
    onTrackSolo: (Long, Boolean) -> Unit,
    onTempoChange: (Int) -> Unit,
    onBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(midiFile.title) },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // MIDI File Info
            MidiFileInfoCard(midiFile)
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Playback Controls
            PlaybackControls(
                playbackState = playbackState,
                onPlayPause = onPlayPause,
                onStop = onStop,
                onSeek = onSeek,
                onTempoChange = onTempoChange
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Track List
            Text(
                text = "Tracks",
                style = MaterialTheme.typography.titleMedium,
                modifier = Modifier.padding(horizontal = 16.dp)
            )
            
            LazyColumn(
                modifier = Modifier.weight(1f),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(tracks) { track ->
                    TrackItem(
                        track = track,
                        onMute = { onTrackMute(track.id, !track.isMuted) },
                        onSolo = { onTrackSolo(track.id, !track.isSolo) }
                    )
                }
            }
        }
    }
}

@Composable
private fun MidiFileInfoCard(midiFile: MidiFile) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            InfoRow("Composer", midiFile.composer ?: "Unknown")
            InfoRow("Tempo", "${midiFile.tempo} BPM")
            InfoRow("Time Signature", midiFile.timeSignature)
            if (midiFile.keySignature != null) {
                InfoRow("Key", midiFile.keySignature)
            }
            InfoRow("Tracks", midiFile.trackCount.toString())
            InfoRow("Duration", formatDuration(midiFile.durationMs))
        }
    }
}

@Composable
private fun InfoRow(label: String, value: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium
        )
    }
}

@Composable
private fun PlaybackControls(
    playbackState: MidiPlaybackState,
    onPlayPause: () -> Unit,
    onStop: () -> Unit,
    onSeek: (Long) -> Unit,
    onTempoChange: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp)
    ) {
        // Seek bar
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = formatDuration(playbackState.currentPosition),
                style = MaterialTheme.typography.bodySmall,
                modifier = Modifier.width(48.dp)
            )
            
            Slider(
                value = playbackState.currentPosition.toFloat(),
                onValueChange = { onSeek(it.toLong()) },
                valueRange = 0f..playbackState.duration.toFloat(),
                modifier = Modifier.weight(1f)
            )
            
            Text(
                text = formatDuration(playbackState.duration),
                style = MaterialTheme.typography.bodySmall,
                modifier = Modifier.width(48.dp)
            )
        }
        
        Spacer(modifier = Modifier.height(8.dp))
        
        // Control buttons
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.Center,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Stop button
            IconButton(onClick = onStop) {
                Icon(Icons.Default.Stop, contentDescription = "Stop")
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            // Play/Pause button
            FilledIconButton(
                onClick = onPlayPause,
                modifier = Modifier.size(64.dp)
            ) {
                Icon(
                    imageVector = if (playbackState.isPlaying) {
                        Icons.Default.Pause
                    } else {
                        Icons.Default.PlayArrow
                    },
                    contentDescription = if (playbackState.isPlaying) "Pause" else "Play",
                    modifier = Modifier.size(32.dp)
                )
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            // Tempo control
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(Icons.Default.Speed, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("${playbackState.currentTempo} BPM")
            }
        }
        
        // Error display
        if (playbackState.error != null) {
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = playbackState.error,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.error,
                modifier = Modifier.fillMaxWidth()
            )
        }
    }
}

@Composable
private fun TrackItem(
    track: MidiTrackInfo,
    onMute: () -> Unit,
    onSolo: () -> Unit
) {
    Card {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Track info
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = track.name ?: "Track ${track.trackNumber + 1}",
                    style = MaterialTheme.typography.titleSmall
                )
                Text(
                    text = track.instrument ?: "No instrument",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    text = "${track.noteCount} notes",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            // Mute button
            IconButton(onClick = onMute) {
                Icon(
                    imageVector = if (track.isMuted) {
                        Icons.Default.VolumeOff
                    } else {
                        Icons.Default.VolumeUp
                    },
                    contentDescription = if (track.isMuted) "Unmute" else "Mute",
                    tint = if (track.isMuted) {
                        MaterialTheme.colorScheme.error
                    } else {
                        MaterialTheme.colorScheme.onSurface
                    }
                )
            }
            
            // Solo button
            IconButton(onClick = onSolo) {
                Icon(
                    imageVector = Icons.Default.Star,
                    contentDescription = if (track.isSolo) "Unsolo" else "Solo",
                    tint = if (track.isSolo) {
                        MaterialTheme.colorScheme.primary
                    } else {
                        MaterialTheme.colorScheme.onSurfaceVariant
                    }
                )
            }
        }
    }
}

private fun formatDuration(ms: Long): String {
    val seconds = (ms / 1000) % 60
    val minutes = (ms / (1000 * 60)) % 60
    val hours = (ms / (1000 * 60 * 60))
    
    return if (hours > 0) {
        String.format("%d:%02d:%02d", hours, minutes, seconds)
    } else {
        String.format("%d:%02d", minutes, seconds)
    }
}
