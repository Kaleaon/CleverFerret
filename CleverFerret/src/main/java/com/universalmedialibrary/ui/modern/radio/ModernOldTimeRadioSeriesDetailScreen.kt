package com.universalmedialibrary.ui.modern.radio

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioEpisode
import com.universalmedialibrary.ui.media.components.MediaPosterCardSkeleton
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.domain.ModernUiState
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.oldtimeradio.OldTimeRadioSeriesViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ModernOldTimeRadioSeriesDetailScreen(
    seriesTitle: String,
    onNavigateBack: () -> Unit,
    onNavigateToPlayer: (Long) -> Unit,
    viewModel: OldTimeRadioSeriesViewModel = hiltViewModel()
) {
    val episodes by viewModel.episodes.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()

    LaunchedEffect(seriesTitle) {
        viewModel.loadSeries(seriesTitle)
    }

    val uiState: ModernUiState<List<OldTimeRadioEpisode>> = remember(isLoading, episodes) {
        when {
            isLoading -> ModernUiState.Loading
            episodes.isEmpty() -> ModernUiState.Empty
            else -> ModernUiState.Success(episodes)
        }
    }

    Scaffold(
        topBar = {
            CFTopBar(
                title = seriesTitle,
                onBack = onNavigateBack
            )
        }
    ) { padding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            when (uiState) {
                is ModernUiState.Loading -> {
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(CFSpacing.lg),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.md)
                    ) {
                        repeat(5) {
                            Card(
                                modifier = Modifier.fillMaxWidth(),
                                colors = CardDefaults.cardColors(
                                    containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
                                )
                            ) {
                                Row(
                                    modifier = Modifier.padding(CFSpacing.md),
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    MediaPosterCardSkeleton(width = 40.dp)
                                    Spacer(modifier = Modifier.width(CFSpacing.md))
                                    Column(modifier = Modifier.weight(1f)) {
                                        Text(
                                            "Loading episode details...",
                                            style = MaterialTheme.typography.titleMedium,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                        Text(
                                            "Please wait",
                                            style = MaterialTheme.typography.bodySmall,
                                            color = MaterialTheme.colorScheme.onSurfaceVariant
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
                is ModernUiState.Empty -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CFEmptyState(
                            icon = Icons.Default.Radio,
                            title = "No Episodes Found",
                            body = "No old-time radio episodes are available for $seriesTitle.",
                            actionLabel = "Retry",
                            onAction = { viewModel.loadSeries(seriesTitle) }
                        )
                    }
                }
                is ModernUiState.Success -> {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        contentPadding = PaddingValues(CFSpacing.lg),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.md)
                    ) {
                        items(episodes) { episode ->
                            EpisodeCard(
                                episode = episode,
                                onClick = { onNavigateToPlayer(episode.id) }
                            )
                        }
                    }
                }
                is ModernUiState.Error -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CFEmptyState(
                            icon = Icons.Default.Warning,
                            title = "Error Loading Series",
                            body = (uiState as ModernUiState.Error).message,
                            actionLabel = "Retry",
                            onAction = { viewModel.loadSeries(seriesTitle) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun EpisodeCard(
    episode: OldTimeRadioEpisode,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 1.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(CFSpacing.lg),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier.size(40.dp),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    Icons.Default.PlayCircle,
                    contentDescription = "Play Episode",
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.size(32.dp)
                )
            }

            Spacer(modifier = Modifier.width(CFSpacing.md))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = episode.displayTitle,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.xs)
                ) {
                    Text(
                        text = episode.displayDate,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        text = "•",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Text(
                        text = episode.displayDuration,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            if (episode.isComplete) {
                Icon(
                    Icons.Default.CheckCircle,
                    contentDescription = "Completed",
                    tint = MaterialTheme.colorScheme.secondary,
                    modifier = Modifier.size(16.dp)
                )
            }
        }
    }
}
