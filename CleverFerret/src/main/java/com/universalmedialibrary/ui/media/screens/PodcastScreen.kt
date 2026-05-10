package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

/**
 * Clean Media-Centric Podcast Screen
 * 
 * Comprehensive podcast management with:
 * - Subscribed shows
 * - Episode queue
 * - Downloads
 * - Discover new podcasts
 * 
 * Features:
 * - Episode playback with speed control
 * - Background download management
 * - OPML import/export
 * - Multi-directory search
 */

@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun PodcastScreen(
    state: PodcastScreenState,
    onShowClick: (PodcastShow) -> Unit,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onPlayEpisode: (PodcastEpisode) -> Unit,
    onDownloadEpisode: (PodcastEpisode) -> Unit,
    onDiscoverClick: () -> Unit,
    onImportOPML: () -> Unit,
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onOpenNowPlaying: () -> Unit = {},
    onPlayPause: () -> Unit = {},
    onSeekForward: () -> Unit = {},
    onSeekBackward: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    val tabs = listOf("Shows", "Episodes", "Queue", "Downloads")
    val pagerState = rememberPagerState(pageCount = { tabs.size })
    val coroutineScope = rememberCoroutineScope()
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            PodcastTopBar(
                onBackClick = onBackClick,
                onSearchClick = onSearchClick,
                onDiscoverClick = onDiscoverClick,
                onImportClick = onImportOPML
            )
        },
        bottomBar = {
            if (state.nowPlaying != null) {
                PodcastMiniPlayer(
                    episode = state.nowPlaying,
                    onTap = onOpenNowPlaying,
                    onPlayPause = onPlayPause,
                    onSeekForward = onSeekForward,
                    onSeekBackward = onSeekBackward
                )
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Tab row
            TabRow(
                selectedTabIndex = pagerState.currentPage,
                containerColor = Color.Transparent,
                contentColor = MediaColors.TextPrimary,
                indicator = { tabPositions ->
                    if (tabPositions.isNotEmpty() && pagerState.currentPage < tabPositions.size) {
                        TabRowDefaults.SecondaryIndicator(
                            modifier = Modifier
                                .fillMaxWidth()
                                .wrapContentSize(Alignment.BottomStart)
                                .offset(x = tabPositions[pagerState.currentPage].left)
                                .width(tabPositions[pagerState.currentPage].width),
                            color = MediaColors.AccentPrimary
                        )
                    }
                },
                divider = {}
            ) {
                tabs.forEachIndexed { index, title ->
                    Tab(
                        selected = pagerState.currentPage == index,
                        onClick = {
                            coroutineScope.launch {
                                pagerState.animateScrollToPage(index)
                            }
                        },
                        text = {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                Text(
                                    text = title,
                                    style = MediaTypography.LabelLarge,
                                    color = if (pagerState.currentPage == index)
                                        MediaColors.AccentPrimary
                                    else
                                        MediaColors.TextSecondary
                                )
                                // Badge for queue/downloads count
                                val count = when (index) {
                                    2 -> state.queuedEpisodes.size
                                    3 -> state.downloadedEpisodes.size
                                    else -> 0
                                }
                                if (count > 0) {
                                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                                    Surface(
                                        shape = CircleShape,
                                        color = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                                        modifier = Modifier.size(20.dp)
                                    ) {
                                        Box(contentAlignment = Alignment.Center) {
                                            Text(
                                                text = count.toString(),
                                                style = MediaTypography.LabelSmall,
                                                color = MediaColors.AccentPrimary
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    )
                }
            }
            
            // Content pager
            HorizontalPager(
                state = pagerState,
                modifier = Modifier.fillMaxSize()
            ) { page ->
                when (page) {
                    0 -> PodcastShowsPage(
                        shows = state.subscribedShows,
                        onShowClick = onShowClick
                    )
                    1 -> PodcastEpisodesPage(
                        episodes = state.latestEpisodes,
                        onEpisodeClick = onEpisodeClick,
                        onPlayEpisode = onPlayEpisode,
                        onDownloadEpisode = onDownloadEpisode,
                        currentEpisode = state.nowPlaying
                    )
                    2 -> PodcastQueuePage(
                        episodes = state.queuedEpisodes,
                        onEpisodeClick = onEpisodeClick,
                        onPlayEpisode = onPlayEpisode
                    )
                    3 -> PodcastDownloadsPage(
                        episodes = state.downloadedEpisodes,
                        onEpisodeClick = onEpisodeClick,
                        onPlayEpisode = onPlayEpisode
                    )
                }
            }
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================


// =============================================================================
// SHOWS PAGE
// =============================================================================

@Composable
private fun PodcastShowsPage(
    shows: List<PodcastShow>,
    onShowClick: (PodcastShow) -> Unit
) {
    if (shows.isEmpty()) {
        PodcastEmptyState(
            icon = Icons.Outlined.Podcasts,
            title = "No subscriptions yet",
            subtitle = "Discover new podcasts to subscribe"
        )
        return
    }
    
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 150.dp),
        contentPadding = PaddingValues(MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG),
        modifier = Modifier.fillMaxSize()
    ) {
        items(shows) { show ->
            PodcastShowCard(
                show = show,
                onClick = { onShowClick(show) }
            )
        }
    }
}


// =============================================================================
// EPISODES PAGE
// =============================================================================



// =============================================================================
// QUEUE & DOWNLOADS PAGES
// =============================================================================

@Composable
private fun PodcastQueuePage(
    episodes: List<PodcastEpisode>,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onPlayEpisode: (PodcastEpisode) -> Unit
) {
    if (episodes.isEmpty()) {
        PodcastEmptyState(
            icon = Icons.Outlined.QueueMusic,
            title = "Queue is empty",
            subtitle = "Add episodes to your queue"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        itemsIndexed(episodes) { index, episode ->
            QueueEpisodeItem(
                episode = episode,
                position = index + 1,
                onClick = { onEpisodeClick(episode) },
                onPlay = { onPlayEpisode(episode) }
            )
        }
    }
}


@Composable
private fun PodcastDownloadsPage(
    episodes: List<PodcastEpisode>,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onPlayEpisode: (PodcastEpisode) -> Unit
) {
    if (episodes.isEmpty()) {
        PodcastEmptyState(
            icon = Icons.Outlined.Download,
            title = "No downloads",
            subtitle = "Downloaded episodes appear here for offline listening"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        items(episodes) { episode ->
            DownloadedEpisodeItem(
                episode = episode,
                onClick = { onEpisodeClick(episode) },
                onPlay = { onPlayEpisode(episode) }
            )
        }
    }
}


// =============================================================================
// MINI PLAYER
// =============================================================================


// =============================================================================
// EMPTY STATE
// =============================================================================

@Composable
private fun PodcastEmptyState(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    title: String,
    subtitle: String
) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = icon,
            contentDescription = "Media image",
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(64.dp)
        )
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        Text(
            text = title,
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextSecondary
        )
        Spacer(modifier = Modifier.height(MediaSpacing.XS))
        Text(
            text = subtitle,
            style = MediaTypography.BodySmall,
            color = MediaColors.TextTertiary
        )
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class PodcastScreenState(
    val subscribedShows: List<PodcastShow> = emptyList(),
    val latestEpisodes: List<PodcastEpisode> = emptyList(),
    val queuedEpisodes: List<PodcastEpisode> = emptyList(),
    val downloadedEpisodes: List<PodcastEpisode> = emptyList(),
    val nowPlaying: PodcastEpisode? = null,
    val isLoading: Boolean = false
)

data class PodcastShow(
    val id: String,
    val title: String,
    val author: String,
    val artworkUrl: String?,
    val description: String?,
    val episodeCount: Int,
    val unplayedCount: Int,
    val lastUpdated: String?
)

data class PodcastEpisode(
    val id: String,
    val showId: String,
    val showTitle: String,
    val showArtworkUrl: String?,
    val title: String,
    val description: String?,
    val audioUrl: String? = null,
    val publishedDate: String,
    val duration: String,
    val progress: Float = 0f,
    val remainingTime: String? = null,
    val isNew: Boolean = false,
    val isDownloaded: Boolean = false,
    val isPlaying: Boolean = false,
    val fileSize: String? = null,
    val playbackSpeed: Float? = null
)
