package com.universalmedialibrary.ui.plex.screens

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
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*
import kotlinx.coroutines.launch

/**
 * Plex-Style Radio Screen
 * 
 * Unified radio experience combining:
 * - Internet Radio (Radio Browser directory)
 * - FM Radio (if hardware available)
 * - HD Radio (if hardware available)
 * - Old Time Radio archives
 * 
 * Features:
 * - Category browsing
 * - Search by name, genre, country
 * - Favorites management
 * - Now playing visualization
 * - Station metadata (logo, genre, bitrate)
 */

@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun PlexRadioScreen(
    state: RadioScreenState,
    onStationClick: (RadioStation) -> Unit,
    onFavoriteToggle: (RadioStation) -> Unit,
    onCategoryClick: (RadioCategory) -> Unit,
    onSearchClick: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val tabs = listOf("Internet", "FM", "HD", "Old Time")
    val pagerState = rememberPagerState(pageCount = { tabs.size })
    val coroutineScope = rememberCoroutineScope()
    
    Scaffold(
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
        topBar = {
            RadioTopBar(
                onBackClick = onBackClick,
                onSearchClick = onSearchClick
            )
        },
        bottomBar = {
            if (state.nowPlaying != null) {
                RadioNowPlayingBar(
                    station = state.nowPlaying,
                    onTap = { /* Open full player */ }
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
                contentColor = PlexColors.TextPrimary,
                indicator = { tabPositions ->
                    TabRowDefaults.SecondaryIndicator(
                        modifier = Modifier.tabIndicatorOffset(tabPositions[pagerState.currentPage]),
                        color = PlexColors.AccentPrimary
                    )
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
                            Text(
                                text = title,
                                style = PlexTypography.LabelLarge,
                                color = if (pagerState.currentPage == index)
                                    PlexColors.AccentPrimary
                                else
                                    PlexColors.TextSecondary
                            )
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
                    0 -> InternetRadioPage(
                        state = state,
                        onStationClick = onStationClick,
                        onFavoriteToggle = onFavoriteToggle,
                        onCategoryClick = onCategoryClick
                    )
                    1 -> FMRadioPage(
                        stations = state.fmStations,
                        isAvailable = state.fmAvailable,
                        onStationClick = onStationClick,
                        onFavoriteToggle = onFavoriteToggle
                    )
                    2 -> HDRadioPage(
                        stations = state.hdStations,
                        isAvailable = state.hdAvailable,
                        onStationClick = onStationClick,
                        onFavoriteToggle = onFavoriteToggle
                    )
                    3 -> OldTimeRadioPage(
                        shows = state.oldTimeShows,
                        onShowClick = { /* Navigate to show */ }
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
private fun RadioTopBar(
    onBackClick: () -> Unit,
    onSearchClick: () -> Unit
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.Radio,
                    contentDescription = null,
                    tint = PlexColors.MediaPodcast,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(PlexSpacing.SM))
                Text(
                    text = "Radio",
                    style = PlexTypography.TitleMedium,
                    color = PlexColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = PlexColors.TextPrimary
                )
            }
        },
        actions = {
            IconButton(onClick = onSearchClick) {
                Icon(
                    imageVector = Icons.Default.Search,
                    contentDescription = "Search",
                    tint = PlexColors.TextSecondary
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = PlexColors.BackgroundElevated
        )
    )
}

// =============================================================================
// INTERNET RADIO PAGE
// =============================================================================

@Composable
private fun InternetRadioPage(
    state: RadioScreenState,
    onStationClick: (RadioStation) -> Unit,
    onFavoriteToggle: (RadioStation) -> Unit,
    onCategoryClick: (RadioCategory) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(vertical = PlexSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        // Favorites section
        if (state.favoriteStations.isNotEmpty()) {
            item {
                SectionHeader(title = "Favorites", icon = Icons.Default.Favorite)
            }
            item {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = PlexSpacing.MD),
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
                ) {
                    items(state.favoriteStations) { station ->
                        RadioStationCard(
                            station = station,
                            onClick = { onStationClick(station) },
                            onFavorite = { onFavoriteToggle(station) }
                        )
                    }
                }
            }
            item { Spacer(modifier = Modifier.height(PlexSpacing.LG)) }
        }
        
        // Categories section
        item {
            SectionHeader(title = "Browse by Category", icon = Icons.Default.Category)
        }
        item {
            LazyRow(
                contentPadding = PaddingValues(horizontal = PlexSpacing.MD),
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
            ) {
                items(state.categories) { category ->
                    CategoryCard(
                        category = category,
                        onClick = { onCategoryClick(category) }
                    )
                }
            }
        }
        
        item { Spacer(modifier = Modifier.height(PlexSpacing.LG)) }
        
        // Popular stations section
        item {
            SectionHeader(title = "Popular Stations", icon = Icons.Default.TrendingUp)
        }
        items(state.popularStations) { station ->
            RadioStationListItem(
                station = station,
                isPlaying = state.nowPlaying?.id == station.id,
                onClick = { onStationClick(station) },
                onFavorite = { onFavoriteToggle(station) }
            )
        }
        
        item { Spacer(modifier = Modifier.height(PlexSpacing.LG)) }
        
        // Recently played section
        if (state.recentlyPlayed.isNotEmpty()) {
            item {
                SectionHeader(title = "Recently Played", icon = Icons.Default.History)
            }
            items(state.recentlyPlayed) { station ->
                RadioStationListItem(
                    station = station,
                    isPlaying = state.nowPlaying?.id == station.id,
                    onClick = { onStationClick(station) },
                    onFavorite = { onFavoriteToggle(station) }
                )
            }
        }
    }
}

@Composable
private fun SectionHeader(
    title: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            tint = PlexColors.AccentPrimary,
            modifier = Modifier.size(20.dp)
        )
        Spacer(modifier = Modifier.width(PlexSpacing.SM))
        Text(
            text = title,
            style = PlexTypography.TitleSmall,
            color = PlexColors.TextPrimary,
            fontWeight = FontWeight.SemiBold
        )
    }
}

@Composable
private fun RadioStationCard(
    station: RadioStation,
    onClick: () -> Unit,
    onFavorite: () -> Unit
) {
    Surface(
        modifier = Modifier
            .width(140.dp)
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(PlexSpacing.MD)
        ) {
            Box(
                modifier = Modifier
                    .size(100.dp)
                    .clip(CircleShape),
                contentAlignment = Alignment.Center
            ) {
                if (station.logoUrl != null) {
                    AsyncImage(
                        model = station.logoUrl,
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Surface(
                        color = station.genreColor.copy(alpha = 0.2f),
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = Icons.Default.Radio,
                            contentDescription = null,
                            tint = station.genreColor,
                            modifier = Modifier.padding(PlexSpacing.LG)
                        )
                    }
                }
                
                // Favorite indicator
                if (station.isFavorite) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(4.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Filled.Favorite,
                            contentDescription = null,
                            tint = PlexColors.Error,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.SM))
            
            Text(
                text = station.name,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                textAlign = TextAlign.Center,
                fontWeight = FontWeight.Medium
            )
            
            Text(
                text = station.genre,
                style = PlexTypography.LabelSmall,
                color = PlexColors.TextSecondary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                textAlign = TextAlign.Center
            )
        }
    }
}

@Composable
private fun RadioStationListItem(
    station: RadioStation,
    isPlaying: Boolean,
    onClick: () -> Unit,
    onFavorite: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .background(
                if (isPlaying) PlexColors.AccentPrimary.copy(alpha = 0.1f) else Color.Transparent
            )
            .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Station logo
        Surface(
            modifier = Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(PlexCorners.SM)),
            color = station.genreColor.copy(alpha = 0.2f)
        ) {
            if (station.logoUrl != null) {
                AsyncImage(
                    model = station.logoUrl,
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Icon(
                    imageVector = Icons.Default.Radio,
                    contentDescription = null,
                    tint = station.genreColor,
                    modifier = Modifier.padding(PlexSpacing.MD)
                )
            }
            
            // Playing indicator
            if (isPlaying) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(Color.Black.copy(alpha = 0.5f)),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.VolumeUp,
                        contentDescription = "Playing",
                        tint = PlexColors.AccentPrimary,
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(PlexSpacing.MD))
        
        // Station info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = station.name,
                style = PlexTypography.BodyMedium,
                color = if (isPlaying) PlexColors.AccentPrimary else PlexColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = if (isPlaying) FontWeight.SemiBold else FontWeight.Normal
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = station.genre,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextSecondary
                )
                
                station.country?.let { country ->
                    Text("•", color = PlexColors.TextTertiary)
                    Text(
                        text = country,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
                
                station.bitrate?.let { bitrate ->
                    Text("•", color = PlexColors.TextTertiary)
                    Text(
                        text = "$bitrate kbps",
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
            }
            
            // Current track info
            station.currentTrack?.let { track ->
                Spacer(modifier = Modifier.height(2.dp))
                Text(
                    text = "♪ $track",
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.AccentPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
        
        // Favorite button
        IconButton(onClick = onFavorite) {
            Icon(
                imageVector = if (station.isFavorite) Icons.Filled.Favorite else Icons.Outlined.FavoriteBorder,
                contentDescription = if (station.isFavorite) "Remove from favorites" else "Add to favorites",
                tint = if (station.isFavorite) PlexColors.Error else PlexColors.TextTertiary
            )
        }
    }
}

@Composable
private fun CategoryCard(
    category: RadioCategory,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .width(120.dp)
            .height(80.dp)
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = category.color.copy(alpha = 0.3f)
    ) {
        Box(
            contentAlignment = Alignment.Center,
            modifier = Modifier.fillMaxSize()
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(
                    imageVector = category.icon,
                    contentDescription = null,
                    tint = category.color,
                    modifier = Modifier.size(28.dp)
                )
                Spacer(modifier = Modifier.height(PlexSpacing.XS))
                Text(
                    text = category.name,
                    style = PlexTypography.LabelMedium,
                    color = PlexColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
            }
        }
    }
}

// =============================================================================
// FM RADIO PAGE
// =============================================================================

@Composable
private fun FMRadioPage(
    stations: List<RadioStation>,
    isAvailable: Boolean,
    onStationClick: (RadioStation) -> Unit,
    onFavoriteToggle: (RadioStation) -> Unit
) {
    if (!isAvailable) {
        RadioUnavailableState(
            title = "FM Radio Not Available",
            message = "Your device doesn't support FM radio or no headphones are connected"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = PlexSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        items(stations) { station ->
            RadioStationListItem(
                station = station,
                isPlaying = false,
                onClick = { onStationClick(station) },
                onFavorite = { onFavoriteToggle(station) }
            )
        }
    }
}

// =============================================================================
// HD RADIO PAGE
// =============================================================================

@Composable
private fun HDRadioPage(
    stations: List<RadioStation>,
    isAvailable: Boolean,
    onStationClick: (RadioStation) -> Unit,
    onFavoriteToggle: (RadioStation) -> Unit
) {
    if (!isAvailable) {
        RadioUnavailableState(
            title = "HD Radio Not Available",
            message = "Your device doesn't support HD Radio"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = PlexSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        items(stations) { station ->
            RadioStationListItem(
                station = station,
                isPlaying = false,
                onClick = { onStationClick(station) },
                onFavorite = { onFavoriteToggle(station) }
            )
        }
    }
}

// =============================================================================
// OLD TIME RADIO PAGE
// =============================================================================

@Composable
private fun OldTimeRadioPage(
    shows: List<OldTimeRadioShow>,
    onShowClick: (OldTimeRadioShow) -> Unit
) {
    if (shows.isEmpty()) {
        RadioEmptyState(
            icon = Icons.Outlined.Radio,
            title = "No Old Time Radio Shows",
            subtitle = "Import your classic radio collection"
        )
        return
    }
    
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 150.dp),
        contentPadding = PaddingValues(PlexSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        items(shows) { show ->
            OldTimeRadioShowCard(
                show = show,
                onClick = { onShowClick(show) }
            )
        }
    }
}

@Composable
private fun OldTimeRadioShowCard(
    show: OldTimeRadioShow,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier.padding(PlexSpacing.MD)
        ) {
            // Show image
            Surface(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(PlexCorners.SM)),
                color = PlexColors.BackgroundSurface
            ) {
                if (show.imageUrl != null) {
                    AsyncImage(
                        model = show.imageUrl,
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Box(contentAlignment = Alignment.Center) {
                        Icon(
                            imageVector = Icons.Default.Radio,
                            contentDescription = null,
                            tint = PlexColors.TextTertiary,
                            modifier = Modifier.size(48.dp)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.SM))
            
            Text(
                text = show.title,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            Text(
                text = "${show.episodeCount} episodes",
                style = PlexTypography.LabelSmall,
                color = PlexColors.TextSecondary
            )
        }
    }
}

// =============================================================================
// NOW PLAYING BAR
// =============================================================================

@Composable
private fun RadioNowPlayingBar(
    station: RadioStation,
    onTap: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onTap),
        color = PlexColors.BackgroundElevated,
        tonalElevation = PlexElevation.MD
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(PlexSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Station logo
            Surface(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(PlexCorners.SM)),
                color = station.genreColor.copy(alpha = 0.2f)
            ) {
                if (station.logoUrl != null) {
                    AsyncImage(
                        model = station.logoUrl,
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Icon(
                        imageVector = Icons.Default.Radio,
                        contentDescription = null,
                        tint = station.genreColor,
                        modifier = Modifier.padding(PlexSpacing.SM)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(PlexSpacing.MD))
            
            // Station info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = station.name,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                
                station.currentTrack?.let { track ->
                    Text(
                        text = track,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.AccentPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                } ?: Text(
                    text = station.genre,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextSecondary
                )
            }
            
            // Playback controls
            IconButton(onClick = { /* Stop */ }) {
                Icon(
                    imageVector = Icons.Default.Stop,
                    contentDescription = "Stop",
                    tint = PlexColors.TextSecondary
                )
            }
        }
    }
}

// =============================================================================
// EMPTY & UNAVAILABLE STATES
// =============================================================================

@Composable
private fun RadioEmptyState(
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
            contentDescription = null,
            tint = PlexColors.TextTertiary,
            modifier = Modifier.size(64.dp)
        )
        Spacer(modifier = Modifier.height(PlexSpacing.MD))
        Text(
            text = title,
            style = PlexTypography.TitleSmall,
            color = PlexColors.TextSecondary
        )
        Spacer(modifier = Modifier.height(PlexSpacing.XS))
        Text(
            text = subtitle,
            style = PlexTypography.BodySmall,
            color = PlexColors.TextTertiary
        )
    }
}

@Composable
private fun RadioUnavailableState(
    title: String,
    message: String
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.SignalCellularNodata,
            contentDescription = null,
            tint = PlexColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        Spacer(modifier = Modifier.height(PlexSpacing.MD))
        Text(
            text = title,
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary,
            textAlign = TextAlign.Center
        )
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        Text(
            text = message,
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary,
            textAlign = TextAlign.Center
        )
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class RadioScreenState(
    val favoriteStations: List<RadioStation> = emptyList(),
    val popularStations: List<RadioStation> = emptyList(),
    val recentlyPlayed: List<RadioStation> = emptyList(),
    val categories: List<RadioCategory> = emptyList(),
    val fmStations: List<RadioStation> = emptyList(),
    val hdStations: List<RadioStation> = emptyList(),
    val oldTimeShows: List<OldTimeRadioShow> = emptyList(),
    val nowPlaying: RadioStation? = null,
    val fmAvailable: Boolean = false,
    val hdAvailable: Boolean = false,
    val isLoading: Boolean = false
)

data class RadioStation(
    val id: String,
    val name: String,
    val logoUrl: String?,
    val streamUrl: String,
    val genre: String,
    val genreColor: Color = PlexColors.MediaPodcast,
    val country: String? = null,
    val bitrate: Int? = null,
    val isFavorite: Boolean = false,
    val currentTrack: String? = null
)

data class RadioCategory(
    val id: String,
    val name: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color,
    val stationCount: Int
)

data class OldTimeRadioShow(
    val id: String,
    val title: String,
    val imageUrl: String?,
    val episodeCount: Int,
    val description: String?
)
