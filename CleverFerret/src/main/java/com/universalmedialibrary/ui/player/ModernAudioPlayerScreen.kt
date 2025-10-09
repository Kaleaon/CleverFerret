package com.universalmedialibrary.ui.player

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Shadow
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

/**
 * Modern Audio Player with beautiful animations and glassmorphic design
 * Supports music, audiobooks, and podcasts
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernAudioPlayerScreen(
    onNavigateBack: () -> Unit,
    viewModel: ModernAudioPlayerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    
    // Animated vinyl rotation
    val infiniteTransition = rememberInfiniteTransition(label = "vinyl")
    val rotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(10000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "rotation"
    )

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color(0xFF1A1A2E),
                        Color(0xFF16213E),
                        Color(0xFF0F3460)
                    )
                )
            )
    ) {
        // Background blur effect
        uiState.currentTrack?.coverUrl?.let { coverUrl ->
            AsyncImage(
                model = coverUrl,
                contentDescription = null,
                modifier = Modifier
                    .fillMaxSize()
                    .blur(100.dp)
                    .scale(1.2f),
                contentScale = ContentScale.Crop,
                alpha = 0.3f
            )
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(24.dp),
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            // Top bar
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                IconButton(onClick = onNavigateBack) {
                    Icon(
                        Icons.Default.ExpandMore,
                        contentDescription = "Back",
                        tint = Color.White
                    )
                }

                Text(
                    text = "NOW PLAYING",
                    style = MaterialTheme.typography.labelLarge,
                    color = Color.White.copy(alpha = 0.7f),
                    letterSpacing = 2.sp
                )

                IconButton(onClick = { /* TODO: More options */ }) {
                    Icon(
                        Icons.Default.MoreVert,
                        contentDescription = "More",
                        tint = Color.White
                    )
                }
            }

            // Album art with vinyl effect
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f),
                contentAlignment = Alignment.Center
            ) {
                // Vinyl record rotating
                if (uiState.isPlaying) {
                    VinylRecord(
                        rotation = rotation,
                        modifier = Modifier
                            .fillMaxSize(0.9f)
                    )
                }

                // Album art
                Surface(
                    modifier = Modifier
                        .fillMaxSize(0.75f)
                        .rotate(if (uiState.isPlaying) rotation else 0f),
                    shape = CircleShape,
                    tonalElevation = 16.dp,
                    shadowElevation = 24.dp
                ) {
                    if (uiState.currentTrack?.coverUrl != null) {
                        AsyncImage(
                            model = uiState.currentTrack.coverUrl,
                            contentDescription = "Album Art",
                            modifier = Modifier.fillMaxSize(),
                            contentScale = ContentScale.Crop
                        )
                    } else {
                        Box(
                            modifier = Modifier
                                .fillMaxSize()
                                .background(
                                    Brush.linearGradient(
                                        colors = listOf(
                                            Color(0xFF4A148C),
                                            Color(0xFF9C27B0)
                                        )
                                    )
                                ),
                            contentAlignment = Alignment.Center
                        ) {
                            Icon(
                                Icons.Default.MusicNote,
                                contentDescription = null,
                                modifier = Modifier.size(120.dp),
                                tint = Color.White.copy(alpha = 0.5f)
                            )
                        }
                    }
                }
            }

            // Track info
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = uiState.currentTrack?.title ?: "No track",
                    style = MaterialTheme.typography.headlineSmall.copy(
                        fontWeight = FontWeight.Bold,
                        shadow = Shadow(
                            color = Color.Black.copy(alpha = 0.5f),
                            offset = Offset(0f, 4f),
                            blurRadius = 8f
                        )
                    ),
                    color = Color.White,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )

                Text(
                    text = uiState.currentTrack?.artist ?: "",
                    style = MaterialTheme.typography.bodyLarge,
                    color = Color.White.copy(alpha = 0.7f),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }

            // Progress bar
            Column(
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                LinearProgressIndicator(
                    progress = uiState.progress,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(4.dp)
                        .clip(RoundedCornerShape(2.dp)),
                    color = Color.White,
                    trackColor = Color.White.copy(alpha = 0.2f)
                )

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text(
                        text = formatTime(uiState.currentPosition),
                        style = MaterialTheme.typography.bodySmall,
                        color = Color.White.copy(alpha = 0.6f)
                    )
                    Text(
                        text = formatTime(uiState.duration),
                        style = MaterialTheme.typography.bodySmall,
                        color = Color.White.copy(alpha = 0.6f)
                    )
                }
            }

            // Controls
            PlaybackControls(
                isPlaying = uiState.isPlaying,
                onPlayPause = { viewModel.togglePlayPause() },
                onPrevious = { viewModel.previous() },
                onNext = { viewModel.next() },
                onShuffle = { viewModel.toggleShuffle() },
                onRepeat = { viewModel.toggleRepeat() },
                isShuffleEnabled = uiState.isShuffleEnabled,
                repeatMode = uiState.repeatMode
            )

            // Bottom actions
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                IconButton(onClick = { viewModel.toggleLike() }) {
                    Icon(
                        if (uiState.isLiked) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                        contentDescription = "Like",
                        tint = if (uiState.isLiked) Color(0xFFFF6B9D) else Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }

                IconButton(onClick = { /* TODO: Queue */ }) {
                    Icon(
                        Icons.Default.QueueMusic,
                        contentDescription = "Queue",
                        tint = Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }

                IconButton(onClick = { /* TODO: Add to playlist */ }) {
                    Icon(
                        Icons.Default.PlaylistAdd,
                        contentDescription = "Add to Playlist",
                        tint = Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }

                IconButton(onClick = { /* TODO: Share */ }) {
                    Icon(
                        Icons.Default.Share,
                        contentDescription = "Share",
                        tint = Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }
            }
        }
    }
}

@Composable
private fun PlaybackControls(
    isPlaying: Boolean,
    onPlayPause: () -> Unit,
    onPrevious: () -> Unit,
    onNext: () -> Unit,
    onShuffle: () -> Unit,
    onRepeat: () -> Unit,
    isShuffleEnabled: Boolean,
    repeatMode: RepeatMode
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly,
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Shuffle
        IconButton(onClick = onShuffle) {
            Icon(
                Icons.Default.Shuffle,
                contentDescription = "Shuffle",
                tint = if (isShuffleEnabled) Color(0xFF00E5FF) else Color.White.copy(alpha = 0.5f),
                modifier = Modifier.size(28.dp)
            )
        }

        // Previous
        Surface(
            shape = CircleShape,
            color = Color.White.copy(alpha = 0.1f),
            modifier = Modifier.size(64.dp)
        ) {
            IconButton(onClick = onPrevious) {
                Icon(
                    Icons.Default.SkipPrevious,
                    contentDescription = "Previous",
                    tint = Color.White,
                    modifier = Modifier.size(32.dp)
                )
            }
        }

        // Play/Pause
        val scale by animateFloatAsState(
            targetValue = if (isPlaying) 1f else 0.95f,
            animationSpec = tween(200),
            label = "playPauseScale"
        )

        Surface(
            shape = CircleShape,
            color = Color.White,
            modifier = Modifier
                .size(80.dp)
                .scale(scale),
            tonalElevation = 8.dp,
            shadowElevation = 16.dp
        ) {
            IconButton(onClick = onPlayPause) {
                Icon(
                    if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (isPlaying) "Pause" else "Play",
                    tint = Color(0xFF1A1A2E),
                    modifier = Modifier.size(40.dp)
                )
            }
        }

        // Next
        Surface(
            shape = CircleShape,
            color = Color.White.copy(alpha = 0.1f),
            modifier = Modifier.size(64.dp)
        ) {
            IconButton(onClick = onNext) {
                Icon(
                    Icons.Default.SkipNext,
                    contentDescription = "Next",
                    tint = Color.White,
                    modifier = Modifier.size(32.dp)
                )
            }
        }

        // Repeat
        IconButton(onClick = onRepeat) {
            Icon(
                when (repeatMode) {
                    RepeatMode.OFF -> Icons.Default.Repeat
                    RepeatMode.ALL -> Icons.Default.Repeat
                    RepeatMode.ONE -> Icons.Default.RepeatOne
                },
                contentDescription = "Repeat",
                tint = when (repeatMode) {
                    RepeatMode.OFF -> Color.White.copy(alpha = 0.5f)
                    else -> Color(0xFF00E5FF)
                },
                modifier = Modifier.size(28.dp)
            )
        }
    }
}

@Composable
private fun VinylRecord(
    rotation: Float,
    modifier: Modifier = Modifier
) {
    Canvas(modifier = modifier.rotate(rotation)) {
        val center = Offset(size.width / 2, size.height / 2)
        val radius = size.minDimension / 2

        // Draw vinyl grooves
        for (i in 10 until radius.toInt() step 8) {
            drawCircle(
                color = Color.Black.copy(alpha = 0.3f),
                radius = i.toFloat(),
                center = center,
                style = androidx.compose.ui.graphics.drawscope.Stroke(width = 1f)
            )
        }

        // Draw center hole
        drawCircle(
            color = Color.Black.copy(alpha = 0.5f),
            radius = radius * 0.15f,
            center = center
        )
    }
}

private fun formatTime(ms: Long): String {
    val seconds = (ms / 1000) % 60
    val minutes = (ms / (1000 * 60)) % 60
    val hours = (ms / (1000 * 60 * 60))
    
    return if (hours > 0) {
        String.format("%d:%02d:%02d", hours, minutes, seconds)
    } else {
        String.format("%d:%02d", minutes, seconds)
    }
}

enum class RepeatMode {
    OFF, ALL, ONE
}
