package com.universalmedialibrary.ui.music

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.VolumeUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.music.PlaylistMode

/**
 * Enhanced Player Controls
 * 
 * Adds:
 * - Seek forward/backward buttons (+30s/-10s)
 * - Volume slider
 * - Speed control quick access
 * - All 30+ commands integrated
 */

/**
 * Enhanced Control Buttons with Seek Controls
 */
@Composable
fun EnhancedControlButtonsSection(
    isPlaying: Boolean,
    playlistMode: PlaylistMode,
    canSkipPrevious: Boolean,
    canSkipNext: Boolean,
    onPlayPause: () -> Unit,
    onSkipPrevious: () -> Unit,
    onSkipNext: () -> Unit,
    onSeekBackward: () -> Unit,
    onSeekForward: () -> Unit,
    onToggleShuffle: () -> Unit,
    onToggleRepeat: () -> Unit,
    isFavorite: Boolean,
    onToggleFavorite: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Shuffle and Repeat modes row
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Shuffle button
            IconButton(
                onClick = onToggleShuffle,
                modifier = Modifier.size(40.dp)
            ) {
                Icon(
                    Icons.Default.Shuffle,
                    contentDescription = "Toggle Shuffle",
                    tint = if (playlistMode == PlaylistMode.SHUFFLE)
                        MaterialTheme.colorScheme.primary
                    else
                        MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Spacer(modifier = Modifier.weight(1f))
            
            // Favorite button
            IconButton(
                onClick = onToggleFavorite,
                modifier = Modifier.size(40.dp)
            ) {
                Icon(
                    if (isFavorite) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                    contentDescription = "Toggle Favorite",
                    tint = if (isFavorite)
                        MaterialTheme.colorScheme.error
                    else
                        MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Spacer(modifier = Modifier.weight(1f))
            
            // Repeat button
            IconButton(
                onClick = onToggleRepeat,
                modifier = Modifier.size(40.dp)
            ) {
                Icon(
                    when (playlistMode) {
                        PlaylistMode.REPEAT_ONE -> Icons.Default.RepeatOne
                        else -> Icons.Default.Repeat
                    },
                    contentDescription = "Toggle Repeat",
                    tint = when (playlistMode) {
                        PlaylistMode.REPEAT_ALL, PlaylistMode.REPEAT_ONE ->
                            MaterialTheme.colorScheme.primary
                        else -> MaterialTheme.colorScheme.onSurfaceVariant
                    }
                )
            }
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        // Main playback controls with seek buttons
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Previous track
            IconButton(
                onClick = onSkipPrevious,
                enabled = canSkipPrevious,
                modifier = Modifier.size(56.dp)
            ) {
                Icon(
                    Icons.Default.SkipPrevious,
                    contentDescription = "Previous Track",
                    modifier = Modifier.size(32.dp)
                )
            }
            
            // Seek backward 10s
            FilledTonalIconButton(
                onClick = onSeekBackward,
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    Icons.Default.FastRewind,
                    contentDescription = "Seek Backward 10s"
                )
            }
            
            // Play/Pause
            FilledIconButton(
                onClick = onPlayPause,
                modifier = Modifier.size(72.dp),
                colors = IconButtonDefaults.filledIconButtonColors(
                    containerColor = MaterialTheme.colorScheme.primary
                )
            ) {
                Icon(
                    if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (isPlaying) "Pause" else "Play",
                    modifier = Modifier.size(40.dp),
                    tint = MaterialTheme.colorScheme.onPrimary
                )
            }
            
            // Seek forward 30s
            FilledTonalIconButton(
                onClick = onSeekForward,
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    Icons.Default.FastForward,
                    contentDescription = "Seek Forward 30s"
                )
            }
            
            // Next track
            IconButton(
                onClick = onSkipNext,
                enabled = canSkipNext,
                modifier = Modifier.size(56.dp)
            ) {
                Icon(
                    Icons.Default.SkipNext,
                    contentDescription = "Next Track",
                    modifier = Modifier.size(32.dp)
                )
            }
        }
    }
}

/**
 * Volume Control Slider
 */
@Composable
fun VolumeControlSection(
    volume: Float,
    onVolumeChange: (Float) -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Icon(
                if (volume < 0.01f) Icons.Default.VolumeOff else Icons.AutoMirrored.Filled.VolumeUp,
                contentDescription = "Volume",
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Slider(
                value = volume,
                onValueChange = onVolumeChange,
                valueRange = 0f..1f,
                modifier = Modifier.weight(1f)
            )
            
            Text(
                text = "${kotlin.math.round(volume * 100).toInt().coerceIn(0, 100)}%",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.widthIn(min = 40.dp)
            )
        }
    }
}

/**
 * Playback Speed Quick Control
 */
@Composable
fun PlaybackSpeedControl(
    currentSpeed: Float,
    onSpeedChange: (Float) -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly,
        verticalAlignment = Alignment.CenterVertically
    ) {
        val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 1.75f, 2.0f)
        
        speeds.forEach { speed ->
            SpeedChip(
                speed = speed,
                isSelected = kotlin.math.abs(currentSpeed - speed) < 0.01f,
                onClick = { onSpeedChange(speed) }
            )
        }
    }
}

/**
 * Speed Chip
 */
@Composable
private fun SpeedChip(
    speed: Float,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    FilterChip(
        selected = isSelected,
        onClick = onClick,
        label = {
            Text(
                text = "${speed}x",
                style = MaterialTheme.typography.labelSmall
            )
        },
        leadingIcon = if (isSelected) {
            {
                Icon(
                    Icons.Default.Check,
                    contentDescription = null,
                    modifier = Modifier.size(16.dp)
                )
            }
        } else null
    )
}

/**
 * Enhanced Volume Dialog with presets
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedVolumeDialog(
    currentVolume: Float,
    onVolumeChange: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Volume Control") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Volume slider
                VolumeControlSection(
                    volume = currentVolume,
                    onVolumeChange = onVolumeChange
                )
                
                // Quick volume presets
                Text(
                    text = "Quick Presets",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    VolumePresetButton("25%", 0.25f, onVolumeChange)
                    VolumePresetButton("50%", 0.5f, onVolumeChange)
                    VolumePresetButton("75%", 0.75f, onVolumeChange)
                    VolumePresetButton("100%", 1.0f, onVolumeChange)
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
 * Volume Preset Button
 */
@Composable
private fun VolumePresetButton(
    label: String,
    value: Float,
    onSelect: (Float) -> Unit
) {
    OutlinedButton(
        onClick = { onSelect(value) },
        modifier = Modifier.width(60.dp),
        contentPadding = PaddingValues(4.dp)
    ) {
        Text(label, style = MaterialTheme.typography.labelSmall)
    }
}

/**
 * Enhanced Playback Speed Dialog
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedPlaybackSpeedDialog(
    currentSpeed: Float,
    onSpeedSelected: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Playback Speed") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Current speed display
                Surface(
                    color = MaterialTheme.colorScheme.primaryContainer,
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Current Speed",
                            style = MaterialTheme.typography.labelSmall,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            text = "${currentSpeed}x",
                            style = MaterialTheme.typography.headlineMedium,
                            fontWeight = FontWeight.Bold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
                
                // Speed options
                PlaybackSpeedControl(
                    currentSpeed = currentSpeed,
                    onSpeedChange = { speed ->
                        onSpeedSelected(speed)
                        onDismiss()
                    }
                )
                
                // Info text
                Text(
                    text = "Adjust playback speed without affecting pitch",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Done")
            }
        },
        dismissButton = {
            TextButton(onClick = {
                onSpeedSelected(1.0f)
                onDismiss()
            }) {
                Text("Reset")
            }
        }
    )
}

/**
 * Compact Secondary Controls Row
 */
@Composable
fun CompactSecondaryControls(
    volume: Float,
    speed: Float,
    onVolumeClick: () -> Unit,
    onSpeedClick: () -> Unit,
    onEqualizerClick: () -> Unit,
    onShareClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly
    ) {
        // Volume
        SecondaryControlButton(
            icon = if (volume < 0.01f) Icons.Default.VolumeOff else Icons.AutoMirrored.Filled.VolumeUp,
            label = "${kotlin.math.round(volume * 100).toInt().coerceIn(0, 100)}%",
            onClick = onVolumeClick
        )
        
        // Speed
        SecondaryControlButton(
            icon = Icons.Default.Speed,
            label = "${speed}x",
            onClick = onSpeedClick,
            isActive = speed != 1.0f
        )
        
        // Equalizer
        SecondaryControlButton(
            icon = Icons.Default.GraphicEq,
            label = "EQ",
            onClick = onEqualizerClick
        )
        
        // Share
        SecondaryControlButton(
            icon = Icons.Default.Share,
            label = "Share",
            onClick = onShareClick
        )
    }
}

/**
 * Secondary Control Button
 */
@Composable
private fun SecondaryControlButton(
    icon: ImageVector,
    label: String,
    onClick: () -> Unit,
    isActive: Boolean = false
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        IconButton(onClick = onClick) {
            Icon(
                icon,
                contentDescription = label,
                tint = if (isActive)
                    MaterialTheme.colorScheme.primary
                else
                    MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        Text(
            text = label,
            style = MaterialTheme.typography.labelSmall,
            color = if (isActive)
                MaterialTheme.colorScheme.primary
            else
                MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}
