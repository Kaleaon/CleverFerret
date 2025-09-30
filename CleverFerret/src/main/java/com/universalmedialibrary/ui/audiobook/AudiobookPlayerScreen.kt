package com.universalmedialibrary.ui.audiobook

import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.List
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
import coil.compose.AsyncImage
import coil.request.ImageRequest
import java.util.Locale
import com.universalmedialibrary.services.audiobook.AudiobookBookmark
import com.universalmedialibrary.services.audiobook.AudiobookChapter
import com.universalmedialibrary.services.audiobook.AudiobookState
import com.universalmedialibrary.services.audiobook.HighlightedText
import kotlinx.coroutines.delay

/**
 * Professional audiobook player screen with synchronized read-along functionality
 *
 * Features:
 * - Beautiful album art with dynamic backgrounds
 * - Chapter navigation with synchronized text highlighting
 * - Advanced playback controls (speed, sleep timer, skip silence)
 * - Bookmark management with notes
 * - Professional animations and transitions
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AudiobookPlayerScreen(
    audiobookId: Long,
    viewModel: AudiobookPlayerViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit = {}
) {
    val audiobookState by viewModel.audiobookState.collectAsState()
    val synchronizationState by viewModel.synchronizationState.collectAsState()
    val highlightedText by viewModel.highlightedText.collectAsState()

    var showChapterList by remember { mutableStateOf(false) }
    var showBookmarks by remember { mutableStateOf(false) }
    var showSleepTimer by remember { mutableStateOf(false) }
    var showSynchronizedText by remember { mutableStateOf(false) }

    LaunchedEffect(audiobookId) {
        viewModel.loadAudiobook(audiobookId)
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        MaterialTheme.colorScheme.surface,
                        MaterialTheme.colorScheme.surfaceVariant
                    )
                )
            )
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Top App Bar
            AudiobookTopBar(
                title = audiobookState.title,
                author = audiobookState.author,
                onNavigateBack = onNavigateBack,
                onShowChapters = { showChapterList = true },
                onShowBookmarks = { showBookmarks = true },
                onToggleSynchronizedText = {
                    showSynchronizedText = !showSynchronizedText
                    viewModel.toggleSynchronizedReading()
                },
                synchronizedTextEnabled = synchronizationState.enabled
            )

            if (audiobookState.isLoading) {
                AudiobookLoadingState()
            } else if (audiobookState.hasError) {
                AudiobookErrorState(
                    error = audiobookState.error ?: "Unknown error",
                    onRetry = { viewModel.loadAudiobook(audiobookId) }
                )
            } else if (audiobookState.isLoaded) {
                // Main content
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(16.dp),
                    verticalArrangement = Arrangement.SpaceBetween
                ) {

                    // Album Art and Info Section
                    AudiobookArtSection(
                        title = audiobookState.title,
                        author = audiobookState.author,
                        currentChapter = audiobookState.currentChapter,
                        modifier = Modifier.weight(1f)
                    )

                    // Synchronized Text Display
                    if (showSynchronizedText && synchronizationState.enabled) {
                        SynchronizedTextDisplay(
                            highlightedText = highlightedText,
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 16.dp)
                        )
                    }

                    // Progress Section
                    AudiobookProgressSection(
                        currentPosition = audiobookState.currentPositionMs,
                        totalDuration = audiobookState.totalDuration,
                        currentChapter = audiobookState.currentChapter,
                        onSeek = viewModel::seekTo
                    )

                    // Playback Controls
                    AudiobookPlaybackControls(
                        isPlaying = viewModel.isPlaying.collectAsState().value,
                        playbackSpeed = audiobookState.playbackSpeed,
                        skipSilenceEnabled = audiobookState.skipSilenceEnabled,
                        onPlayPause = viewModel::togglePlayback,
                        onSkipForward = { viewModel.seekForward() },
                        onSkipBackward = { viewModel.seekBackward() },
                        onNextChapter = viewModel::nextChapter,
                        onPreviousChapter = viewModel::previousChapter,
                        onSpeedChange = viewModel::setPlaybackSpeed,
                        onToggleSkipSilence = viewModel::toggleSkipSilence,
                        onShowSleepTimer = { showSleepTimer = true }
                    )
                }
            }
        }

        // Modal Sheets
        if (showChapterList) {
            ChapterListBottomSheet(
                chapters = audiobookState.chapters,
                currentChapterIndex = audiobookState.currentChapterIndex,
                onChapterSelected = { index ->
                    viewModel.goToChapter(index)
                    showChapterList = false
                },
                onDismiss = { showChapterList = false }
            )
        }

        if (showBookmarks) {
            BookmarksBottomSheet(
                bookmarks = audiobookState.bookmarks,
                onBookmarkSelected = { bookmark ->
                    viewModel.jumpToBookmark(bookmark)
                    showBookmarks = false
                },
                onBookmarkDelete = { bookmark ->
                    // TODO: Add deleteBookmark method to ViewModel
                    // viewModel.deleteBookmark(bookmark)
                },
                onDismiss = { showBookmarks = false }
            )
        }

        if (showSleepTimer) {
            SleepTimerDialog(
                currentTimer = audiobookState.sleepTimerEndTime,
                onTimerSet = { minutes ->
                    viewModel.setSleepTimer(minutes.toInt())
                    showSleepTimer = false
                },
                onDismiss = { showSleepTimer = false }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AudiobookTopBar(
    title: String,
    author: String,
    onNavigateBack: () -> Unit,
    onShowChapters: () -> Unit,
    onShowBookmarks: () -> Unit,
    onToggleSynchronizedText: () -> Unit,
    synchronizedTextEnabled: Boolean
) {
    TopAppBar(
        title = {
            Column {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = author,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onNavigateBack) {
                Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
            }
        },
        actions = {
            IconButton(onClick = onToggleSynchronizedText) {
                Icon(
                    imageVector = if (synchronizedTextEnabled) PhosphorIcons.CloudSync else PhosphorIcons.CloudOff,
                    contentDescription = "Toggle Synchronized Reading",
                    tint = if (synchronizedTextEnabled) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            IconButton(onClick = onShowChapters) {
                Icon(Icons.AutoMirrored.Filled.List, contentDescription = "Chapters")
            }
            IconButton(onClick = onShowBookmarks) {
                Icon(PhosphorIcons.BookmarkBorder, contentDescription = "Bookmarks")
            }
        }
    )
}

@Composable
private fun AudiobookLoadingState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            CircularProgressIndicator()
            Text(
                text = "Loading audiobook...",
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun AudiobookErrorState(
    error: String,
    onRetry: () -> Unit
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                imageVector = PhosphorIcons.ErrorOutline,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.error,
                modifier = Modifier.size(48.dp)
            )
            Text(
                text = error,
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.error,
                textAlign = TextAlign.Center
            )
            Button(onClick = onRetry) {
                Text("Retry")
            }
        }
    }
}

@Composable
private fun AudiobookArtSection(
    title: String,
    author: String,
    currentChapter: AudiobookChapter?,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        // Album Art
        Card(
            modifier = Modifier
                .size(280.dp)
                .clip(RoundedCornerShape(16.dp)),
            elevation = CardDefaults.cardElevation(defaultElevation = 8.dp)
        ) {
            AsyncImage(
                model = ImageRequest.Builder(LocalContext.current)
                    .data("https://via.placeholder.com/280x280/4A90E2/FFFFFF?text=Audiobook")
                    .crossfade(true)
                    .build(),
                contentDescription = "Audiobook Cover",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
            )
        }

        Spacer(modifier = Modifier.height(24.dp))

        // Current Chapter Info
        currentChapter?.let { chapter ->
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        text = "Now Playing",
                        style = MaterialTheme.typography.labelMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        text = chapter.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium,
                        textAlign = TextAlign.Center,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        }
    }
}

@Composable
private fun SynchronizedTextDisplay(
    highlightedText: HighlightedText?,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = PhosphorIcons.Sync,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(16.dp)
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(
                    text = "Read Along",
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.primary
                )
            }

            Spacer(modifier = Modifier.height(8.dp))

            if (highlightedText != null) {
                Text(
                    text = highlightedText.text,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onPrimaryContainer,
                    fontWeight = FontWeight.Medium
                )

                // Confidence indicator
                if (highlightedText.confidence < 0.8f) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = "• Approximate synchronization",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                    )
                }
            } else {
                Text(
                    text = "Synchronizing...",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                )
            }
        }
    }
}

@Composable
private fun AudiobookProgressSection(
    currentPosition: Long,
    totalDuration: Long,
    currentChapter: AudiobookChapter?,
    onSeek: (Long) -> Unit
) {
    Column {
        // Progress Bar
        val progress = if (totalDuration > 0) {
            (currentPosition.toFloat() / totalDuration).coerceIn(0f, 1f)
        } else 0f

        Slider(
            value = progress,
            onValueChange = { newProgress ->
                val newPosition = (newProgress * totalDuration).toLong()
                onSeek(newPosition)
            },
            modifier = Modifier.fillMaxWidth()
        )

        // Time Labels
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
                text = formatTime(totalDuration),
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun AudiobookPlaybackControls(
    isPlaying: Boolean,
    playbackSpeed: Float,
    skipSilenceEnabled: Boolean,
    onPlayPause: () -> Unit,
    onSkipForward: () -> Unit,
    onSkipBackward: () -> Unit,
    onNextChapter: () -> Unit,
    onPreviousChapter: () -> Unit,
    onSpeedChange: (Float) -> Unit,
    onToggleSkipSilence: () -> Unit,
    onShowSleepTimer: () -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // Main Controls
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Previous Chapter
            IconButton(
                onClick = onPreviousChapter,
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    PhosphorIcons.SkipPrevious,
                    contentDescription = "Previous Chapter",
                    modifier = Modifier.size(32.dp)
                )
            }

            // Skip Backward
            IconButton(
                onClick = onSkipBackward,
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    PhosphorIcons.Replay30,
                    contentDescription = "Skip Backward 30s",
                    modifier = Modifier.size(28.dp)
                )
            }

            // Play/Pause
            FilledIconButton(
                onClick = onPlayPause,
                modifier = Modifier.size(64.dp)
            ) {
                Icon(
                    imageVector = if (isPlaying) PhosphorIcons.Pause else Icons.Default.PlayArrow,
                    contentDescription = if (isPlaying) "Pause" else "Play",
                    modifier = Modifier.size(32.dp)
                )
            }

            // Skip Forward
            IconButton(
                onClick = onSkipForward,
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    PhosphorIcons.Forward30,
                    contentDescription = "Skip Forward 30s",
                    modifier = Modifier.size(28.dp)
                )
            }

            // Next Chapter
            IconButton(
                onClick = onNextChapter,
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    PhosphorIcons.SkipNext,
                    contentDescription = "Next Chapter",
                    modifier = Modifier.size(32.dp)
                )
            }
        }

        // Secondary Controls
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Playback Speed
            TextButton(
                onClick = {
                    val newSpeed = when (playbackSpeed) {
                        0.5f -> 0.75f
                        0.75f -> 1.0f
                        1.0f -> 1.25f
                        1.25f -> 1.5f
                        1.5f -> 2.0f
                        2.0f -> 3.0f
                        else -> 0.5f
                    }
                    onSpeedChange(newSpeed)
                }
            ) {
                Text("${playbackSpeed}x")
            }

            // Skip Silence
            IconButton(
                onClick = onToggleSkipSilence
            ) {
                Icon(
                    imageVector = if (skipSilenceEnabled) PhosphorIcons.VolumeOff else PhosphorIcons.VolumeUp,
                    contentDescription = "Toggle Skip Silence",
                    tint = if (skipSilenceEnabled) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            // Sleep Timer
            IconButton(onClick = onShowSleepTimer) {
                Icon(PhosphorIcons.Timer, contentDescription = "Sleep Timer")
            }
        }
    }
}

// Additional composables for modal sheets would go here...
// (ChapterListBottomSheet, BookmarksBottomSheet, SleepTimerDialog)


@Composable
fun ChapterListBottomSheet(
    chapters: List<AudiobookChapter>,
    currentChapterIndex: Int,
    onChapterSelected: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    // TODO: Implement chapter list UI
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(300.dp)
            .background(MaterialTheme.colorScheme.surface),
        contentAlignment = Alignment.Center
    ) {
        Text("Chapter List Bottom Sheet")
    }
}

@Composable
fun BookmarksBottomSheet(
    bookmarks: List<AudiobookBookmark>,
    onBookmarkSelected: (AudiobookBookmark) -> Unit,
    onBookmarkDelete: (AudiobookBookmark) -> Unit,
    onDismiss: () -> Unit
) {
    // TODO: Implement bookmarks UI
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(300.dp)
            .background(MaterialTheme.colorScheme.surface),
        contentAlignment = Alignment.Center
    ) {
        Text("Bookmarks Bottom Sheet")
    }
}

@Composable
fun SleepTimerDialog(
    currentTimer: Long?,
    onTimerSet: (Long) -> Unit,
    onDismiss: () -> Unit
) {
    // TODO: Implement sleep timer dialog UI
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(200.dp)
            .background(MaterialTheme.colorScheme.surface),
        contentAlignment = Alignment.Center
    ) {
        Text("Sleep Timer Dialog")
    }
}
private fun formatTime(milliseconds: Long): String {
    val totalSeconds = milliseconds / 1000
    val hours = totalSeconds / 3600
    val minutes = (totalSeconds % 3600) / 60
    val seconds = totalSeconds % 60

    return if (hours > 0) {
        String.format(Locale.getDefault(), "%d:%02d:%02d", hours, minutes, seconds)
    } else {
        String.format(Locale.getDefault(), "%d:%02d", minutes, seconds)
    }
}
