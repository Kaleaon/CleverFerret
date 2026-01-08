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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PodcastTopBar(
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit,
    onDiscoverClick: () -> Unit,
    onImportClick: () -> Unit
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.Podcasts,
                    contentDescription = "Media image",
                    tint = MediaColors.MediaTypes.Podcast,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "Podcasts",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextPrimary
                )
            }
        },
        actions = {
            IconButton(onClick = onDiscoverClick) {
                Icon(
                    imageVector = Icons.Default.Explore,
                    contentDescription = "Discover",
                    tint = MediaColors.TextSecondary
                )
            }
            IconButton(onClick = onSearchClick) {
                Icon(
                    imageVector = Icons.Default.Search,
                    contentDescription = "Search",
                    tint = MediaColors.TextSecondary
                )
            }
            IconButton(onClick = onImportClick) {
                Icon(
                    imageVector = Icons.Default.FileUpload,
                    contentDescription = "Import OPML",
                    tint = MediaColors.TextSecondary
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}

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

@Composable
private fun PodcastShowCard(
    show: PodcastShow,
    onClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .width(150.dp)
            .clickable(onClick = onClick)
    ) {
        Box(
            modifier = Modifier
                .size(150.dp)
                .clip(RoundedCornerShape(MediaCorners.MD))
        ) {
            if (show.artworkUrl != null) {
                AsyncImage(
                    
                    model = show.artworkUrl,
                    contentDescription = show.title,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Surface(
                    color = MediaColors.BackgroundSurface,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Icon(
                        imageVector = Icons.Default.Podcasts,
                        contentDescription = "Media image",
                        tint = MediaColors.MediaTypes.Podcast.copy(alpha = 0.5f),
                        modifier = Modifier
                            .padding(MediaSpacing.XL)
                            .fillMaxSize()
                    )
                }
            }
            
            // Unplayed badge
            if (show.unplayedCount > 0) {
                Box(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(MediaSpacing.XS)
                ) {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.AccentPrimary
                    ) {
                        Text(
                            text = if (show.unplayedCount > 99) "99+" else show.unplayedCount.toString(),
                            style = MediaTypography.LabelSmall,
                            color = Color.Black,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
                        )
                    }
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = show.title,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextPrimary,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis,
            fontWeight = FontWeight.Medium
        )
        
        Text(
            text = show.author,
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextSecondary,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
    }
}

// =============================================================================
// EPISODES PAGE
// =============================================================================

@Composable
private fun PodcastEpisodesPage(
    episodes: List<PodcastEpisode>,
    onEpisodeClick: (PodcastEpisode) -> Unit,
    onPlayEpisode: (PodcastEpisode) -> Unit,
    onDownloadEpisode: (PodcastEpisode) -> Unit,
    currentEpisode: PodcastEpisode?
) {
    if (episodes.isEmpty()) {
        PodcastEmptyState(
            icon = Icons.Outlined.Headphones,
            title = "No episodes yet",
            subtitle = "Subscribe to shows to see new episodes"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        items(episodes) { episode ->
            PodcastEpisodeCard(
                episode = episode,
                isPlaying = currentEpisode?.id == episode.id,
                onClick = { onEpisodeClick(episode) },
                onPlay = { onPlayEpisode(episode) },
                onDownload = { onDownloadEpisode(episode) }
            )
        }
    }
}

@Composable
private fun PodcastEpisodeCard(
    episode: PodcastEpisode,
    isPlaying: Boolean,
    onClick: () -> Unit,
    onPlay: () -> Unit,
    onDownload: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.XS)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = if (isPlaying) MediaColors.AccentPrimary.copy(alpha = 0.1f) else MediaColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier.padding(MediaSpacing.MD)
        ) {
            Row(verticalAlignment = Alignment.Top) {
                // Show artwork
                Surface(
                    modifier = Modifier
                        .size(72.dp)
                        .clip(RoundedCornerShape(MediaCorners.SM)),
                    color = MediaColors.BackgroundSurface
                ) {
                    if (episode.showArtworkUrl != null) {
                        AsyncImage(
                    
                            model = episode.showArtworkUrl,
                            contentDescription = "Media image",
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                Column(modifier = Modifier.weight(1f)) {
                    // Show name
                    Text(
                        text = episode.showTitle,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.MediaTypes.Podcast,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    Spacer(modifier = Modifier.height(2.dp))
                    
                    // Episode title
                    Text(
                        text = episode.title,
                        style = MediaTypography.BodyMedium,
                        color = if (isPlaying) MediaColors.AccentPrimary else MediaColors.TextPrimary,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = if (episode.isNew) FontWeight.SemiBold else FontWeight.Normal
                    )
                    
                    Spacer(modifier = Modifier.height(MediaSpacing.XS))
                    
                    // Meta info
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = episode.publishedDate,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                        Text("•", color = MediaColors.TextTertiary)
                        Text(
                            text = episode.duration,
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                        if (episode.isDownloaded) {
                            Icon(
                                imageVector = Icons.Default.DownloadDone,
                                contentDescription = "Downloaded",
                                tint = MediaColors.Success,
                                modifier = Modifier.size(14.dp)
                            )
                        }
                        if (episode.isNew) {
                            Surface(
                                shape = RoundedCornerShape(MediaCorners.XS),
                                color = MediaColors.AccentPrimary.copy(alpha = 0.2f)
                            ) {
                                Text(
                                    text = "NEW",
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.AccentPrimary,
                                    fontWeight = FontWeight.Bold,
                                    modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 1.dp)
                                )
                            }
                        }
                    }
                }
            }
            
            // Description
            if (episode.description != null) {
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Text(
                    text = episode.description,
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Progress bar
            if (episode.progress > 0) {
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Row(verticalAlignment = Alignment.CenterVertically) {
                    LinearProgressIndicator(
                        progress = { episode.progress },
                        modifier = Modifier
                            .weight(1f)
                            .height(3.dp)
                            .clip(RoundedCornerShape(MediaCorners.Full)),
                        color = MediaColors.AccentPrimary,
                        trackColor = MediaColors.ProgressBackground
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Text(
                        text = episode.remainingTime ?: "",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            // Action buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                Button(
                    onClick = onPlay,
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MediaColors.AccentPrimary
                    ),
                    contentPadding = PaddingValues(vertical = MediaSpacing.SM)
                ) {
                    Icon(
                        imageVector = if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Text(
                        text = if (episode.progress > 0) "Continue" else "Play",
                        style = MediaTypography.LabelMedium,
                        color = Color.Black
                    )
                }
                
                if (!episode.isDownloaded) {
                    OutlinedButton(
                        onClick = onDownload,
                        colors = ButtonDefaults.outlinedButtonColors(
                            contentColor = MediaColors.TextSecondary
                        ),
                        border = BorderStroke(1.dp, MediaColors.Border)
                    ) {
                        Icon(
                            imageVector = Icons.Default.Download,
                            contentDescription = "Download",
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
                
                IconButton(onClick = { /* More options */ }) {
                    Icon(
                        imageVector = Icons.Default.MoreVert,
                        contentDescription = "More",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}

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
private fun QueueEpisodeItem(
    episode: PodcastEpisode,
    position: Int,
    onClick: () -> Unit,
    onPlay: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Position
        Text(
            text = position.toString(),
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextTertiary,
            modifier = Modifier.width(32.dp)
        )
        
        // Drag handle
        Icon(
            imageVector = Icons.Default.DragHandle,
            contentDescription = "Reorder",
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(24.dp)
        )
        
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        
        // Artwork
        Surface(
            modifier = Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(MediaCorners.XS)),
            color = MediaColors.BackgroundSurface
        ) {
            if (episode.showArtworkUrl != null) {
                AsyncImage(
                    
                    model = episode.showArtworkUrl,
                    contentDescription = "Media image",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = episode.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            Text(
                text = "${episode.showTitle} • ${episode.duration}",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
        
        IconButton(onClick = onPlay) {
            Icon(
                imageVector = Icons.Default.PlayCircle,
                contentDescription = "Play",
                tint = MediaColors.AccentPrimary
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

@Composable
private fun DownloadedEpisodeItem(
    episode: PodcastEpisode,
    onClick: () -> Unit,
    onPlay: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Artwork
        Surface(
            modifier = Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(MediaCorners.SM)),
            color = MediaColors.BackgroundSurface
        ) {
            if (episode.showArtworkUrl != null) {
                AsyncImage(
                    
                    model = episode.showArtworkUrl,
                    contentDescription = "Media image",
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = episode.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )
            
            Spacer(modifier = Modifier.height(2.dp))
            
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                Text(
                    text = episode.showTitle,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Icon(
                    imageVector = Icons.Default.DownloadDone,
                    contentDescription = "Media image",
                    tint = MediaColors.Success,
                    modifier = Modifier.size(14.dp)
                )
                Text(
                    text = episode.fileSize ?: "",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
            }
            
            if (episode.progress > 0) {
                Spacer(modifier = Modifier.height(MediaSpacing.XS))
                LinearProgressIndicator(
                    progress = { episode.progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(2.dp)
                        .clip(RoundedCornerShape(MediaCorners.Full)),
                    color = MediaColors.AccentPrimary,
                    trackColor = MediaColors.ProgressBackground
                )
            }
        }
        
        IconButton(onClick = onPlay) {
            Surface(
                shape = CircleShape,
                color = MediaColors.AccentPrimary
            ) {
                Icon(
                    imageVector = Icons.Default.PlayArrow,
                    contentDescription = "Play",
                    tint = Color.Black,
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
        }
    }
}

// =============================================================================
// MINI PLAYER
// =============================================================================

@Composable
private fun PodcastMiniPlayer(
    episode: PodcastEpisode,
    onTap: () -> Unit,
    onPlayPause: () -> Unit,
    onSeekForward: () -> Unit,
    onSeekBackward: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD
    ) {
        Column {
            LinearProgressIndicator(
                progress = { episode.progress },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(2.dp),
                color = MediaColors.AccentPrimary,
                trackColor = MediaColors.ProgressBackground
            )
            
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Show artwork
                Surface(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(MediaCorners.XS)),
                    color = MediaColors.BackgroundSurface
                ) {
                    if (episode.showArtworkUrl != null) {
                        AsyncImage(
                    
                            model = episode.showArtworkUrl,
                            contentDescription = "Media image",
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = episode.title,
                        style = MediaTypography.BodyMedium,
                        color = MediaColors.TextPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = episode.showTitle,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Speed indicator
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = MediaColors.BackgroundSurface
                ) {
                    Text(
                        text = episode.playbackSpeed?.let { "${it}x" } ?: "1x",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = MediaSpacing.XS)
                    )
                }
                
                IconButton(onClick = onSeekBackward) {
                    Icon(
                        imageVector = Icons.Default.Replay30,
                        contentDescription = "Rewind 30 seconds",
                        tint = MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onPlayPause) {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.AccentPrimary,
                        modifier = Modifier.size(36.dp)
                    ) {
                        Icon(
                            imageVector = if (episode.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                            contentDescription = if (episode.isPlaying) "Pause" else "Play",
                            tint = Color.Black,
                            modifier = Modifier.padding(6.dp)
                        )
                    }
                }
                
                IconButton(onClick = onSeekForward) {
                    Icon(
                        imageVector = Icons.Default.Forward30,
                        contentDescription = "Forward 30 seconds",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}

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
