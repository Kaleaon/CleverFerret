package com.universalmedialibrary.ui.podcast

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import com.universalmedialibrary.ui.icons.PhosphorIcons
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.services.podcast.EpisodePlaybackInfo
import com.universalmedialibrary.services.podcast.PodcastChapter
import kotlin.math.roundToInt

/**
 * Advanced Podcast Player Screen with chapters, speed controls, and smart features
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PodcastPlayerScreen(
    onNavigateBack: () -> Unit,
    onNavigateToShow: (String) -> Unit,
    viewModel: PodcastPlayerViewModel = hiltViewModel()
) {
    val playbackState by viewModel.playbackState.collectAsStateWithLifecycle()
    val currentEpisode by viewModel.currentEpisode.collectAsStateWithLifecycle()
    val playbackSettings by viewModel.playbackSettings.collectAsStateWithLifecycle()
    val chapters by viewModel.chapters.collectAsStateWithLifecycle()
    val queue by viewModel.episodeQueue.collectAsStateWithLifecycle()
    
    var currentPosition by remember { mutableLongStateOf(0L) }
    var isDragging by remember { mutableStateOf(false) }
    var showChapters by remember { mutableStateOf(false) }
    var showSpeedControls by remember { mutableStateOf(false) }
    
    // Update position periodically when playing
    LaunchedEffect(playbackState.isPlaying) {
        if (playbackState.isPlaying) {
            while (playbackState.isPlaying) {
                if (!isDragging) {
                    currentPosition = viewModel.getCurrentPosition()
                }
                kotlinx.coroutines.delay(1000)
            }
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        text = "Podcast Player",
                        style = MaterialTheme.typography.titleMedium
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.KeyboardArrowDown, contentDescription = "Back")
                    }
                },
                actions = {
                    // Sleep Timer
                    IconButton(onClick = { viewModel.toggleSleepTimer() }) {
                        Badge(
                            containerColor = if (playbackSettings.sleepTimerMinutes > 0) 
                                MaterialTheme.colorScheme.primary else Color.Transparent
                        ) {
                            if (playbackSettings.sleepTimerMinutes > 0) {
                                Text("${playbackSettings.sleepTimerMinutes}")
                            }
                        }
                        Icon(Icons.Default.Timer, contentDescription = "Sleep Timer")
                    }
                    
                    // More Options
                    IconButton(onClick = { /* TODO: Show more options */ }) {
                        Icon(Icons.Default.MoreVert, contentDescription = "More")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color.Transparent
                )
            )
        }
    ) { paddingValues ->
        
        if (currentEpisode != null) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .background(
                        brush = Brush.verticalGradient(
                            colors = listOf(
                                MaterialTheme.colorScheme.surface,
                                MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f)
                            )
                        )
                    )
            ) {
                
                // Episode Cover Section
                EpisodeCoverSection(
                    episode = currentEpisode,
                    onShowClick = { episode ->
                        onNavigateToShow(episode.episode.id)
                    }
                )
                
                Spacer(modifier = Modifier.height(24.dp))
                
                // Episode Information
                EpisodeInfoSection(
                    episode = currentEpisode,
                    modifier = Modifier.padding(horizontal = 24.dp)
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Progress Section
                PodcastProgressSection(
                    currentPosition = currentPosition,
                    duration = currentEpisode.episode.duration,
                    onSeek = { position ->
                        currentPosition = position
                        viewModel.seekTo(position)
                    },
                    onDragStart = { isDragging = true },
                    onDragEnd = { isDragging = false },
                    modifier = Modifier.padding(horizontal = 24.dp)
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Podcast Control Buttons
                PodcastControlButtonsSection(
                    isPlaying = playbackState.isPlaying,
                    playbackSpeed = playbackSettings.playbackSpeed,
                    skipSilence = playbackSettings.skipSilence,
                    canSkipPrevious = queue.size > 1,
                    canSkipNext = queue.size > 1,
                    onPlayPause = viewModel::togglePlayPause,
                    onSkipBackward = { viewModel.skipBackward(15) },
                    onSkipForward = { viewModel.skipForward(30) },
                    onSkipPrevious = viewModel::skipToPreviousEpisode,
                    onSkipNext = viewModel::skipToNextEpisode,
                    onSpeedClick = { showSpeedControls = !showSpeedControls },
                    modifier = Modifier.padding(horizontal = 24.dp)
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Speed Controls (when visible)
                if (showSpeedControls) {
                    SpeedControlsSection(
                        currentSpeed = playbackSettings.playbackSpeed,
                        skipSilence = playbackSettings.skipSilence,
                        onSpeedChange = viewModel::setPlaybackSpeed,
                        onToggleSkipSilence = viewModel::toggleSkipSilence,
                        modifier = Modifier.padding(horizontal = 24.dp)
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                }
                
                // Chapters Section
                if (chapters.isNotEmpty()) {
                    ChaptersSection(
                        chapters = chapters,
                        currentPosition = currentPosition,
                        expanded = showChapters,
                        onToggleExpanded = { showChapters = !showChapters },
                        onChapterClick = viewModel::jumpToChapter,
                        modifier = Modifier
                            .fillMaxWidth()
                            .weight(1f)
                            .padding(horizontal = 24.dp)
                    )
                } else {
                    Spacer(modifier = Modifier.weight(1f))
                }
            }
        } else {
            // No episode loaded state
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Icon(
                        Icons.Default.Podcasts,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        text = "No podcast playing",
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        text = "Select an episode from your library",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
        
        // Error state
        if (playbackState.hasError) {
            LaunchedEffect(playbackState.error) {
                // TODO: Show error snackbar
            }
        }
    }
}

@Composable
private fun EpisodeCoverSection(
    episode: EpisodePlaybackInfo,
    onShowClick: (EpisodePlaybackInfo) -> Unit
) {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .aspectRatio(1f)
            .padding(24.dp),
        contentAlignment = Alignment.Center
    ) {
        Card(
            modifier = Modifier
                .fillMaxSize()
                .clip(RoundedCornerShape(16.dp)),
            elevation = CardDefaults.cardElevation(defaultElevation = 8.dp),
            onClick = { onShowClick(episode) }
        ) {
            AsyncImage(
                model = ImageRequest.Builder(LocalContext.current)
                    .data("") // Episode/podcast cover would go here
                    .placeholder(android.R.drawable.ic_media_play)
                    .error(android.R.drawable.ic_media_play)
                    .build(),
                contentDescription = "Episode Cover",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
            )
        }
    }
}

@Composable
private fun EpisodeInfoSection(
    episode: EpisodePlaybackInfo,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = episode.episode.title,
            style = MaterialTheme.typography.headlineSmall.copy(
                fontWeight = FontWeight.Bold
            ),
            textAlign = TextAlign.Center,
            maxLines = 3,
            overflow = TextOverflow.Ellipsis
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        Text(
            text = "Podcast Name", // Would come from subscription data
            style = MaterialTheme.typography.titleMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        
        Spacer(modifier = Modifier.height(4.dp))
        
        Text(
            text = episode.episode.publishDate,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
    }
}

@Composable
private fun PodcastProgressSection(
    currentPosition: Long,
    duration: Long,
    onSeek: (Long) -> Unit,
    onDragStart: () -> Unit,
    onDragEnd: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier) {
        val progress = if (duration > 0) currentPosition.toFloat() / duration.toFloat() else 0f
        
        Slider(
            value = progress,
            onValueChange = { newProgress ->
                val newPosition = (newProgress * duration).toLong()
                onSeek(newPosition)
            },
            onValueChangeStarted = { onDragStart() },
            onValueChangeFinished = { onDragEnd() },
            modifier = Modifier.fillMaxWidth()
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                text = formatTime(currentPosition),
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Text(
                text = "-${formatTime(duration - currentPosition)}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun PodcastControlButtonsSection(
    isPlaying: Boolean,
    playbackSpeed: Float,
    skipSilence: Boolean,
    canSkipPrevious: Boolean,
    canSkipNext: Boolean,
    onPlayPause: () -> Unit,
    onSkipBackward: () -> Unit,
    onSkipForward: () -> Unit,
    onSkipPrevious: () -> Unit,
    onSkipNext: () -> Unit,
    onSpeedClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly,
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Previous Episode
        IconButton(
            onClick = onSkipPrevious,
            enabled = canSkipPrevious,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                Icons.Default.SkipPrevious,
                contentDescription = "Previous Episode",
                modifier = Modifier.size(24.dp)
            )
        }
        
        // Skip Backward 15s
        IconButton(
            onClick = onSkipBackward,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                Icons.Default.Replay,
                contentDescription = "Skip Back 15s",
                modifier = Modifier.size(24.dp)
            )
        }
        
        // Play/Pause
        FilledIconButton(
            onClick = onPlayPause,
            modifier = Modifier.size(64.dp)
        ) {
            Icon(
                if (isPlaying) PhosphorIcons.Pause else Icons.Default.PlayArrow,
                contentDescription = if (isPlaying) "Pause" else "Play",
                modifier = Modifier.size(32.dp)
            )
        }
        
        // Skip Forward 30s
        IconButton(
            onClick = onSkipForward,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                Icons.Default.Forward30,
                contentDescription = "Skip Forward 30s",
                modifier = Modifier.size(24.dp)
            )
        }
        
        // Next Episode
        IconButton(
            onClick = onSkipNext,
            enabled = canSkipNext,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                Icons.Default.SkipNext,
                contentDescription = "Next Episode",
                modifier = Modifier.size(24.dp)
            )
        }
    }
    
    // Secondary controls row
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly
    ) {
        // Playback Speed
        TextButton(onClick = onSpeedClick) {
            Text("${playbackSpeed}x")
        }
        
        // Skip Silence Indicator
        if (skipSilence) {
            Icon(
                Icons.Default.VolumeOff,
                contentDescription = "Skip Silence Enabled",
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(16.dp)
            )
        }
    }
}

@Composable
private fun SpeedControlsSection(
    currentSpeed: Float,
    skipSilence: Boolean,
    onSpeedChange: (Float) -> Unit,
    onToggleSkipSilence: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Playback Controls",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Speed buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                val speeds = listOf(0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 2.0f)
                speeds.forEach { speed ->
                    FilterChip(
                        onClick = { onSpeedChange(speed) },
                        selected = currentSpeed == speed,
                        label = { Text("${speed}x") }
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Skip Silence toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text("Skip Silence")
                Switch(
                    checked = skipSilence,
                    onCheckedChange = { onToggleSkipSilence() }
                )
            }
        }
    }
}

@Composable
private fun ChaptersSection(
    chapters: List<PodcastChapter>,
    currentPosition: Long,
    expanded: Boolean,
    onToggleExpanded: () -> Unit,
    onChapterClick: (Int) -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column {
            // Header
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Chapters (${chapters.size})",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                
                IconButton(onClick = onToggleExpanded) {
                    Icon(
                        if (expanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                        contentDescription = if (expanded) "Collapse" else "Expand"
                    )
                }
            }
            
            // Chapters list
            if (expanded) {
                LazyColumn(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    items(chapters.withIndex().toList()) { (index, chapter) ->
                        val isActive = currentPosition >= chapter.startTime && 
                                      currentPosition < chapter.endTime
                        
                        ListItem(
                            headlineContent = { 
                                Text(
                                    text = chapter.title,
                                    fontWeight = if (isActive) FontWeight.Bold else FontWeight.Normal,
                                    color = if (isActive) MaterialTheme.colorScheme.primary 
                                           else MaterialTheme.colorScheme.onSurface
                                )
                            },
                            supportingContent = { 
                                Text(formatTime(chapter.startTime)) 
                            },
                            modifier = Modifier.fillMaxWidth(),
                            colors = ListItemDefaults.colors(
                                containerColor = if (isActive) 
                                    MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
                                    else Color.Transparent
                            )
                        ) {
                            onChapterClick(index)
                        }
                    }
                }
            }
        }
    }
}

private fun formatTime(milliseconds: Long): String {
    val seconds = (milliseconds / 1000).toInt()
    val minutes = seconds / 60
    val remainingSeconds = seconds % 60
    
    return if (minutes >= 60) {
        val hours = minutes / 60
        val remainingMinutes = minutes % 60
        "%d:%02d:%02d".format(hours, remainingMinutes, remainingSeconds)
    } else {
        "%d:%02d".format(minutes, remainingSeconds)
    }
}