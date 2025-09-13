package com.universalmedialibrary.ui.player.components

import androidx.compose.foundation.background
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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.viewer.common.VideoSettings

data class SubtitleTrack(
    val id: Int,
    val language: String,
    val label: String,
    val isSelected: Boolean = false
)

data class AudioTrack(
    val id: Int,
    val language: String,
    val label: String,
    val channels: String,
    val isSelected: Boolean = false
)

data class Chapter(
    val id: Int,
    val title: String,
    val startTime: Long,
    val duration: Long
)

@Composable
fun TopControlsBar(
    title: String,
    currentChapter: String?,
    onBack: () -> Unit,
    onCast: () -> Unit,
    onPip: () -> Unit,
    onSettings: () -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(80.dp)
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color.Black.copy(alpha = 0.8f),
                        Color.Transparent
                    )
                )
            )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBack) {
                Icon(
                    Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = Color.White,
                    modifier = Modifier.size(24.dp)
                )
            }

            Column(
                modifier = Modifier
                    .weight(1f)
                    .padding(horizontal = 16.dp)
            ) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    color = Color.White,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                if (currentChapter != null) {
                    Text(
                        text = currentChapter,
                        style = MaterialTheme.typography.bodySmall,
                        color = Color.White.copy(alpha = 0.7f),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }

            Row {
                IconButton(onClick = onCast) {
                    Icon(
                        Icons.Default.Cast,
                        contentDescription = "Cast",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
                IconButton(onClick = onPip) {
                    Icon(
                        Icons.Default.PictureInPicture,
                        contentDescription = "Picture in Picture",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
                IconButton(onClick = onSettings) {
                    Icon(
                        Icons.Default.Settings,
                        contentDescription = "Settings",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}

@Composable
fun BottomControlsBar(
    isPlaying: Boolean,
    currentPosition: Long,
    duration: Long,
    playbackSpeed: Float,
    volume: Float,
    onPlayPause: () -> Unit,
    onSeek: (Long) -> Unit,
    onRewind: () -> Unit,
    onForward: () -> Unit,
    onVolumeChange: (Float) -> Unit,
    onFullscreen: () -> Unit,
    onSpeedChange: (Float) -> Unit,
    onSubtitles: () -> Unit,
    onAudioTracks: () -> Unit,
    onChapters: (() -> Unit)? = null
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(140.dp)
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color.Transparent,
                        Color.Black.copy(alpha = 0.8f)
                    )
                )
            )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .align(Alignment.BottomStart)
                .padding(16.dp)
        ) {
            // Progress bar
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = formatTime(currentPosition),
                    color = Color.White,
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.width(60.dp)
                )
                
                Slider(
                    value = currentPosition.toFloat(),
                    onValueChange = { onSeek(it.toLong()) },
                    valueRange = 0f..duration.toFloat(),
                    modifier = Modifier.weight(1f),
                    colors = SliderDefaults.colors(
                        thumbColor = MaterialTheme.colorScheme.primary,
                        activeTrackColor = MaterialTheme.colorScheme.primary,
                        inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                    )
                )
                
                Text(
                    text = formatTime(duration),
                    color = Color.White,
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.width(60.dp)
                )
            }

            Spacer(modifier = Modifier.height(8.dp))

            // Control buttons row 1
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Rewind
                IconButton(onClick = onRewind) {
                    Icon(
                        Icons.Default.Replay10,
                        contentDescription = "Rewind 10s",
                        tint = Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }

                // Play/Pause
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primary
                    ),
                    shape = MaterialTheme.shapes.extraLarge,
                    modifier = Modifier.size(56.dp)
                ) {
                    IconButton(
                        onClick = onPlayPause,
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (isPlaying) "Pause" else "Play",
                            modifier = Modifier.size(32.dp),
                            tint = Color.Black
                        )
                    }
                }

                // Forward
                IconButton(onClick = onForward) {
                    Icon(
                        Icons.Default.Forward10,
                        contentDescription = "Forward 10s",
                        tint = Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }

                // Volume control
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.width(100.dp)
                ) {
                    IconButton(
                        onClick = { onVolumeChange(if (volume > 0) 0f else 0.8f) },
                        modifier = Modifier.size(32.dp)
                    ) {
                        Icon(
                            imageVector = when {
                                volume == 0f -> Icons.Default.VolumeOff
                                volume < 0.5f -> Icons.Default.VolumeDown
                                else -> Icons.Default.VolumeUp
                            },
                            contentDescription = "Volume",
                            tint = Color.White,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                    Slider(
                        value = volume,
                        onValueChange = onVolumeChange,
                        modifier = Modifier.width(60.dp),
                        colors = SliderDefaults.colors(
                            thumbColor = MaterialTheme.colorScheme.primary,
                            activeTrackColor = MaterialTheme.colorScheme.primary,
                            inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                        )
                    )
                }

                // Fullscreen
                IconButton(onClick = onFullscreen) {
                    Icon(
                        Icons.Default.Fullscreen,
                        contentDescription = "Fullscreen",
                        tint = Color.White,
                        modifier = Modifier.size(24.dp)
                    )
                }
            }

            Spacer(modifier = Modifier.height(4.dp))

            // Control buttons row 2
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Playback speed
                TextButton(
                    onClick = { 
                        val newSpeed = when (playbackSpeed) {
                            0.25f -> 0.5f
                            0.5f -> 0.75f
                            0.75f -> 1.0f
                            1.0f -> 1.25f
                            1.25f -> 1.5f
                            1.5f -> 2.0f
                            2.0f -> 3.0f
                            else -> 0.25f
                        }
                        onSpeedChange(newSpeed)
                    }
                ) {
                    Text(
                        text = "${playbackSpeed}x",
                        color = Color.White,
                        style = MaterialTheme.typography.bodySmall
                    )
                }

                // Subtitles
                IconButton(onClick = onSubtitles) {
                    Icon(
                        Icons.Default.Subtitles,
                        contentDescription = "Subtitles",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }

                // Audio tracks
                IconButton(onClick = onAudioTracks) {
                    Icon(
                        Icons.Default.AudioFile,
                        contentDescription = "Audio Tracks",
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                }

                // Chapters (if available)
                if (onChapters != null) {
                    IconButton(onClick = onChapters) {
                        Icon(
                            Icons.Default.Bookmark,
                            contentDescription = "Chapters",
                            tint = Color.White,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                } else {
                    Spacer(modifier = Modifier.size(48.dp))
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun VideoSettingsSheet(
    settings: VideoSettings,
    onDismiss: () -> Unit,
    onSettingsChanged: (VideoSettings) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        modifier = Modifier.fillMaxHeight(0.7f)
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Text(
                    text = "Video Settings",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium
                )
            }

            item {
                Card {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = "Playback",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Medium
                        )
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Remember Position")
                            Switch(
                                checked = settings.rememberPosition,
                                onCheckedChange = { 
                                    onSettingsChanged(settings.copy(rememberPosition = it))
                                }
                            )
                        }
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Auto Next Episode")
                            Switch(
                                checked = settings.autoNextEpisode,
                                onCheckedChange = { 
                                    onSettingsChanged(settings.copy(autoNextEpisode = it))
                                }
                            )
                        }
                    }
                }
            }

            item {
                Card {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = "Controls",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Medium
                        )
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Gesture Controls")
                            Switch(
                                checked = settings.gestureControls,
                                onCheckedChange = { 
                                    onSettingsChanged(settings.copy(gestureControls = it))
                                }
                            )
                        }
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text("Picture-in-Picture")
                            Switch(
                                checked = settings.pipModeEnabled,
                                onCheckedChange = { 
                                    onSettingsChanged(settings.copy(pipModeEnabled = it))
                                }
                            )
                        }
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SubtitleTracksSheet(
    tracks: List<SubtitleTrack>,
    selectedTrack: Int,
    onDismiss: () -> Unit,
    onTrackSelected: (Int) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    text = "Subtitle Tracks",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            item {
                ListItem(
                    headlineContent = { Text("None") },
                    leadingContent = {
                        RadioButton(
                            selected = selectedTrack == -1,
                            onClick = { onTrackSelected(-1) }
                        )
                    },
                    modifier = Modifier.clickable { onTrackSelected(-1) }
                )
            }

            items(tracks) { track ->
                ListItem(
                    headlineContent = { Text(track.label) },
                    supportingContent = { Text(track.language) },
                    leadingContent = {
                        RadioButton(
                            selected = selectedTrack == track.id,
                            onClick = { onTrackSelected(track.id) }
                        )
                    },
                    modifier = Modifier.clickable { onTrackSelected(track.id) }
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AudioTracksSheet(
    tracks: List<AudioTrack>,
    selectedTrack: Int,
    onDismiss: () -> Unit,
    onTrackSelected: (Int) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    text = "Audio Tracks",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            items(tracks) { track ->
                ListItem(
                    headlineContent = { Text(track.label) },
                    supportingContent = { 
                        Text("${track.language} • ${track.channels}")
                    },
                    leadingContent = {
                        RadioButton(
                            selected = selectedTrack == track.id,
                            onClick = { onTrackSelected(track.id) }
                        )
                    },
                    modifier = Modifier.clickable { onTrackSelected(track.id) }
                )
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ChaptersSheet(
    chapters: List<Chapter>,
    currentChapter: String?,
    onDismiss: () -> Unit,
    onChapterSelected: (Chapter) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            item {
                Text(
                    text = "Chapters",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            items(chapters) { chapter ->
                ListItem(
                    headlineContent = { Text(chapter.title) },
                    supportingContent = { 
                        Text(formatTime(chapter.startTime))
                    },
                    leadingContent = {
                        if (currentChapter == chapter.title) {
                            Icon(
                                Icons.Default.PlayArrow,
                                contentDescription = "Current chapter",
                                tint = MaterialTheme.colorScheme.primary
                            )
                        }
                    },
                    modifier = Modifier.clickable { onChapterSelected(chapter) }
                )
            }
        }
    }
}

private fun formatTime(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val hours = seconds / 3600
    val minutes = (seconds % 3600) / 60
    val secs = seconds % 60
    
    return if (hours > 0) {
        String.format("%d:%02d:%02d", hours, minutes, secs)
    } else {
        String.format("%d:%02d", minutes, secs)
    }
}