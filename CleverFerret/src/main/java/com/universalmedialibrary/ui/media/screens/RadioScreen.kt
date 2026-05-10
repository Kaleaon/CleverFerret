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


// =============================================================================
// INTERNET RADIO PAGE
// =============================================================================


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
            contentDescription = title,
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


// =============================================================================
// NOW PLAYING BAR
// =============================================================================


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
