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
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

/**
 * Clean Media-Centric Radio Screen
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
fun RadioScreen(
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
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
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
                            Text(
                                text = title,
                                style = MediaTypography.LabelLarge,
                                color = if (pagerState.currentPage == index)
                                    MediaColors.AccentPrimary
                                else
                                    MediaColors.TextSecondary
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
                    contentDescription = "Radio",
                    tint = MediaColors.MediaTypes.Radio,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "Radio",
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
            IconButton(onClick = onSearchClick) {
                Icon(
                    imageVector = Icons.Default.Search,
                    contentDescription = "Search",
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
        contentPadding = PaddingValues(vertical = MediaSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        // Favorites section
        if (state.favoriteStations.isNotEmpty()) {
            item {
                SectionHeader(title = "Favorites", icon = Icons.Default.Favorite)
            }
            item {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = MediaSpacing.MD),
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
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
            item { Spacer(modifier = Modifier.height(MediaSpacing.LG)) }
        }
        
        // Categories section
        item {
            SectionHeader(title = "Browse by Category", icon = Icons.Default.Category)
        }
        item {
            LazyRow(
                contentPadding = PaddingValues(horizontal = MediaSpacing.MD),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
            ) {
                items(state.categories) { category ->
                    CategoryCard(
                        category = category,
                        onClick = { onCategoryClick(category) }
                    )
                }
            }
        }
        
        item { Spacer(modifier = Modifier.height(MediaSpacing.LG)) }
        
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
        
        item { Spacer(modifier = Modifier.height(MediaSpacing.LG)) }
        
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
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            tint = MediaColors.AccentPrimary,
            modifier = Modifier.size(20.dp)
        )
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        Text(
            text = title,
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextPrimary,
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
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(MediaSpacing.MD)
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
                            modifier = Modifier.padding(MediaSpacing.LG)
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
                            tint = MediaColors.Error,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Text(
                text = station.name,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                textAlign = TextAlign.Center,
                fontWeight = FontWeight.Medium
            )
            
            Text(
                text = station.genre,
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary,
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
                if (isPlaying) MediaColors.AccentPrimary.copy(alpha = 0.1f) else Color.Transparent
            )
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Station logo
        Surface(
            modifier = Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(MediaCorners.SM)),
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
                    modifier = Modifier.padding(MediaSpacing.MD)
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
                        tint = MediaColors.AccentPrimary,
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Station info
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = station.name,
                style = MediaTypography.BodyMedium,
                color = if (isPlaying) MediaColors.AccentPrimary else MediaColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = if (isPlaying) FontWeight.SemiBold else FontWeight.Normal
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = station.genre,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary
                )
                
                station.country?.let { country ->
                    Text("•", color = MediaColors.TextTertiary)
                    Text(
                        text = country,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                station.bitrate?.let { bitrate ->
                    Text("•", color = MediaColors.TextTertiary)
                    Text(
                        text = "$bitrate kbps",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
            
            // Current track info
            station.currentTrack?.let { track ->
                Spacer(modifier = Modifier.height(2.dp))
                Text(
                    text = "♪ $track",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.AccentPrimary,
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
                tint = if (station.isFavorite) MediaColors.Error else MediaColors.TextTertiary
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
            .clip(RoundedCornerShape(MediaCorners.MD))
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
                Spacer(modifier = Modifier.height(MediaSpacing.XS))
                Text(
                    text = category.name,
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextPrimary,
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
        contentPadding = PaddingValues(vertical = MediaSpacing.MD),
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
        contentPadding = PaddingValues(vertical = MediaSpacing.MD),
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
        contentPadding = PaddingValues(MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
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
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier.padding(MediaSpacing.MD)
        ) {
            // Show image
            Surface(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(MediaCorners.SM)),
                color = MediaColors.BackgroundSurface
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
                            tint = MediaColors.TextTertiary,
                            modifier = Modifier.size(48.dp)
                        )
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
                text = "${show.episodeCount} episodes",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextSecondary
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
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.MD
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Station logo
            Surface(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(MediaCorners.SM)),
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
                        modifier = Modifier.padding(MediaSpacing.SM)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            // Station info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = station.name,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                
                station.currentTrack?.let { track ->
                    Text(
                        text = track,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.AccentPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                } ?: Text(
                    text = station.genre,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary
                )
            }
            
            // Playback controls
            IconButton(onClick = { /* Stop */ }) {
                Icon(
                    imageVector = Icons.Default.Stop,
                    contentDescription = "Stop",
                    tint = MediaColors.TextSecondary
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

@Composable
private fun RadioUnavailableState(
    title: String,
    message: String
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.SignalCellularNodata,
            contentDescription = null,
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        Text(
            text = title,
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            textAlign = TextAlign.Center
        )
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        Text(
            text = message,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
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
    val genreColor: Color = MediaColors.MediaTypes.Radio,
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
