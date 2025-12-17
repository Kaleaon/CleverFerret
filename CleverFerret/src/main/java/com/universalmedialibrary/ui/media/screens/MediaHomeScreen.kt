package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

/**
 * Clean Media-Centric Home/Dashboard Screen
 * 
 * A beautiful, feature-rich home screen inspired by premium media apps:
 * - Hero carousel for featured content
 * - Continue reading/watching/listening section
 * - Recently added content rows
 * - Curated collections
 * - Quick access to all media types
 * - Personalized recommendations
 */

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun MediaHomeScreen(
    state: MediaHomeState,
    onItemClick: (MediaItem) -> Unit,
    onPlayClick: (MediaItem) -> Unit,
    onSeeAllClick: (String) -> Unit,
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberLazyListState()
    val showFloatingTopBar by remember {
        derivedStateOf { scrollState.firstVisibleItemIndex > 0 }
    }
    val heroCarouselPagerState = rememberPagerState(pageCount = { state.featuredItems.size })
    val coroutineScope = rememberCoroutineScope()
    
    // Auto-scroll hero carousel
    LaunchedEffect(state.featuredItems) {
        if (state.featuredItems.isNotEmpty()) {
            while (true) {
                delay(6000)
                val nextPage = (heroCarouselPagerState.currentPage + 1) % state.featuredItems.size
                heroCarouselPagerState.animateScrollToPage(nextPage)
            }
        }
    }
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
    ) {
        LazyColumn(
            state = scrollState,
            modifier = Modifier.fillMaxSize()
        ) {
            // Hero Carousel
            if (state.featuredItems.isNotEmpty()) {
                item {
                    HeroCarousel(
                        items = state.featuredItems,
                        pagerState = heroCarouselPagerState,
                        onItemClick = onItemClick,
                        onPlayClick = onPlayClick
                    )
                }
            }
            
            // Quick Stats Row
            item {
                QuickStatsRow(stats = state.libraryStats)
            }
            
            // Continue Section (Reading, Watching, Listening)
            if (state.continueItems.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "Continue Where You Left Off",
                        items = state.continueItems,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.SEARCH) }
                    ) { item ->
                        MediaWideCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = MediaSizes.CardXLarge
                        )
                    }
                }
            }
            
            // Recently Added Books
            if (state.recentBooks.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "Recently Added Books",
                        items = state.recentBooks,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.BOOKS) }
                    ) { item ->
                        MediaPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Recently Added Music
            if (state.recentMusic.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "Recently Added Music",
                        items = state.recentMusic,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.MUSIC) }
                    ) { item ->
                        MediaSquareCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            size = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Podcasts
            if (state.recentPodcasts.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "New Podcast Episodes",
                        items = state.recentPodcasts,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.PODCASTS) }
                    ) { item ->
                        MediaSquareCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            size = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Movies & TV (from Plex/Jellyfin/Emby)
            if (state.recentVideos.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "Recently Added Movies & TV",
                        items = state.recentVideos,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.MOVIES) }
                    ) { item ->
                        MediaPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Audiobooks
            if (state.recentAudiobooks.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "Recent Audiobooks",
                        items = state.recentAudiobooks,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.AUDIOBOOKS) }
                    ) { item ->
                        MediaPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Comics
            if (state.recentComics.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "Recently Added Comics",
                        items = state.recentComics,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.COMICS) }
                    ) { item ->
                        MediaPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Web Fiction
            if (state.recentFanfiction.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    MediaCarouselRow(
                        title = "Web Fiction Updates",
                        items = state.recentFanfiction,
                        onSeeAllClick = { onSeeAllClick(MediaRoutes.WEB_FICTION) }
                    ) { item ->
                        MediaPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = MediaSizes.CardMedium
                        )
                    }
                }
            }
            
            // Collections
            if (state.collections.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    CollectionsSection(
                        collections = state.collections,
                        onCollectionClick = { onSeeAllClick(MediaRoutes.collectionDetailRoute(it.id)) }
                    )
                }
            }
            
            // Quick Access Grid
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                QuickAccessGrid(
                    onCategoryClick = onSeeAllClick
                )
            }
            
            // Bottom padding
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.Huge))
            }
        }
        
        // Floating Top Bar (fades in on scroll)
        AnimatedVisibility(
            visible = showFloatingTopBar,
            enter = fadeIn() + slideInVertically(),
            exit = fadeOut() + slideOutVertically(),
            modifier = Modifier.align(Alignment.TopCenter)
        ) {
            PlexTopBar(
                onSearchClick = onSearchClick,
                onNotificationClick = onNotificationClick
            )
        }
    }
}

// =============================================================================
// HERO CAROUSEL
// =============================================================================

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun HeroCarousel(
    items: List<MediaItem>,
    pagerState: PagerState,
    onItemClick: (MediaItem) -> Unit,
    onPlayClick: (MediaItem) -> Unit
) {
    Box {
        HorizontalPager(
            state = pagerState,
            modifier = Modifier.fillMaxWidth()
        ) { page ->
            MediaHeroCard(
                item = items[page],
                onClick = { onItemClick(items[page]) },
                onPlayClick = { onPlayClick(items[page]) }
            )
        }
        
        // Page indicators
        Row(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .padding(bottom = MediaSpacing.LG),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            items.forEachIndexed { index, _ ->
                Box(
                    modifier = Modifier
                        .size(if (pagerState.currentPage == index) 24.dp else 8.dp, 4.dp)
                        .clip(RoundedCornerShape(MediaCorners.Full))
                        .background(
                            if (pagerState.currentPage == index) 
                                MediaColors.AccentPrimary 
                            else 
                                MediaColors.TextTertiary.copy(alpha = 0.5f)
                        )
                        .animateContentSize()
                )
            }
        }
    }
}

// =============================================================================
// QUICK STATS ROW
// =============================================================================

@Composable
private fun QuickStatsRow(stats: HomeLibraryStats) {
    BoxWithConstraints(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.MD)
    ) {
        val isCompact = maxWidth < 420.dp
        val spacing = MediaSpacing.MD
        val items = listOf(
            Triple(Icons.Default.MenuBook, stats.totalBooks.toString(), "Books"),
            Triple(Icons.Default.MusicNote, stats.totalMusic.toString(), "Tracks"),
            Triple(Icons.Default.Headphones, stats.totalAudiobooks.toString(), "Audiobooks"),
            Triple(Icons.Default.Movie, stats.totalVideos.toString(), "Videos")
        )

        if (isCompact) {
            Column(verticalArrangement = Arrangement.spacedBy(spacing)) {
                Row(horizontalArrangement = Arrangement.spacedBy(spacing)) {
                    items.take(2).forEach { (icon, value, label) ->
                        StatCard(
                            icon = icon,
                            value = value,
                            label = label,
                            color = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
                Row(horizontalArrangement = Arrangement.spacedBy(spacing)) {
                    items.drop(2).forEach { (icon, value, label) ->
                        StatCard(
                            icon = icon,
                            value = value,
                            label = label,
                            color = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.weight(1f)
                        )
                    }
                }
            }
        } else {
            Row(horizontalArrangement = Arrangement.spacedBy(spacing)) {
                items.forEach { (icon, value, label) ->
                    StatCard(
                        icon = icon,
                        value = value,
                        label = label,
                        color = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.weight(1f)
                    )
                }
            }
        }
    }
}

@Composable
private fun StatCard(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    value: String,
    label: String,
    color: Color,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(MediaCorners.Card),
        color = MaterialTheme.colorScheme.surface
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Surface(
                shape = CircleShape,
                color = color.copy(alpha = 0.15f),
                modifier = Modifier.size(40.dp)
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    modifier = Modifier
                        .padding(MediaSpacing.SM)
                        .fillMaxSize(),
                    tint = color
                )
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
            
            Column(modifier = Modifier.weight(1f, fill = false)) {
                Text(
                    text = value,
                    style = MediaTypography.TitleMedium,
                    color = MaterialTheme.colorScheme.onSurface,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = label,
                    style = MediaTypography.LabelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    maxLines = 1,
                    softWrap = false,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

// =============================================================================
// COLLECTIONS SECTION
// =============================================================================

@Composable
private fun CollectionsSection(
    collections: List<HomeCollection>,
    onCollectionClick: (HomeCollection) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
    ) {
        Text(
            text = "Your Collections",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            items(collections) { collection ->
                CollectionCard(
                    collection = collection,
                    onClick = { onCollectionClick(collection) }
                )
            }
        }
    }
}

@Composable
private fun CollectionCard(
    collection: HomeCollection,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .width(200.dp)
            .height(120.dp),
        shape = RoundedCornerShape(MediaCorners.Card),
        onClick = onClick
    ) {
        Box {
            // Background gradient
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(
                        Brush.linearGradient(
                            colors = listOf(
                                collection.color.copy(alpha = 0.6f),
                                collection.color.copy(alpha = 0.2f)
                            )
                        )
                    )
            )
            
            // Content
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(MediaSpacing.MD),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Icon(
                    imageVector = collection.icon,
                    contentDescription = null,
                    modifier = Modifier.size(MediaSizes.IconLG),
                    tint = MediaColors.TextPrimary
                )
                
                Column {
                    Text(
                        text = collection.name,
                        style = MediaTypography.TitleSmall,
                        color = MediaColors.TextPrimary,
                        maxLines = 1
                    )
                    Text(
                        text = "${collection.itemCount} items",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}

// =============================================================================
// QUICK ACCESS GRID
// =============================================================================

@Composable
private fun QuickAccessGrid(
    onCategoryClick: (String) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
    ) {
        Text(
            text = "Explore Your Library",
            style = MediaTypography.TitleMedium,
            color = MaterialTheme.colorScheme.onBackground
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        val categories = listOf(
            QuickAccessItem(MediaRoutes.BOOKS, "Books", Icons.Default.MenuBook, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.AUDIOBOOKS, "Audiobooks", Icons.Default.Headphones, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.COMICS, "Comics", Icons.Default.AutoStories, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.MUSIC, "Music", Icons.Default.MusicNote, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.PODCASTS, "Podcasts", Icons.Default.Podcasts, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.RADIO, "Radio", Icons.Default.Radio, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.MOVIES, "Movies", Icons.Default.Movie, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.TV_SHOWS, "TV Shows", Icons.Default.Tv, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.WEB_FICTION, "Web Fiction", Icons.Default.Language, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.DOCUMENTS, "Documents", Icons.Default.Description, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.OPDS_BROWSER, "OPDS", Icons.Default.CloudDownload, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.AMBIENT_SOUNDS, "Ambient", Icons.Default.Spa, MediaColors.AccentPrimary),
            QuickAccessItem(MediaRoutes.COLLECTIONS, "Collections", Icons.Default.Collections, MediaColors.AccentPrimary)
        )
        
        QuickAccessFlowGrid(
            items = categories,
            onCategoryClick = onCategoryClick
        )
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun QuickAccessFlowGrid(
    items: List<QuickAccessItem>,
    onCategoryClick: (String) -> Unit
) {
    BoxWithConstraints(modifier = Modifier.fillMaxWidth()) {
        val columns = if (maxWidth < 360.dp) 2 else 3
        val spacing = MediaSpacing.MD
        val cardWidth = (maxWidth - spacing * (columns - 1)) / columns

        FlowRow(
            maxItemsInEachRow = columns,
            horizontalArrangement = Arrangement.spacedBy(spacing),
            verticalArrangement = Arrangement.spacedBy(spacing),
            modifier = Modifier.fillMaxWidth()
        ) {
            items.forEach { item ->
                QuickAccessCard(
                    item = item,
                    onClick = { onCategoryClick(item.id) },
                    modifier = Modifier.width(cardWidth)
                )
            }
        }
    }
}

@Composable
private fun QuickAccessCard(
    item: QuickAccessItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .aspectRatio(1f),
        shape = RoundedCornerShape(MediaCorners.Card),
        color = MaterialTheme.colorScheme.surface,
        onClick = onClick
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(MediaSpacing.SM),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Surface(
                shape = CircleShape,
                color = MaterialTheme.colorScheme.primary.copy(alpha = 0.15f),
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    imageVector = item.icon,
                    contentDescription = null,
                    modifier = Modifier
                        .padding(MediaSpacing.SM)
                        .fillMaxSize(),
                    tint = MaterialTheme.colorScheme.primary
                )
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Text(
                text = item.label,
                style = MediaTypography.LabelMedium,
                color = MaterialTheme.colorScheme.onSurface,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================

@Composable
private fun PlexTopBar(
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.Background.copy(alpha = 0.95f),
        tonalElevation = MediaElevation.SM
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .statusBarsPadding()
                .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.SM),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "CleverFerret",
                style = MediaTypography.TitleMedium,
                color = MediaColors.AccentPrimary,
                fontWeight = FontWeight.Bold
            )
            
            Row(horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)) {
                IconButton(onClick = onSearchClick) {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = "Search",
                        tint = MediaColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onNotificationClick) {
                    Icon(
                        imageVector = Icons.Default.Notifications,
                        contentDescription = "Notifications",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        }
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

/**
 * State holder for the home screen
 */
data class MediaHomeState(
    val isLoading: Boolean = false,
    val featuredItems: List<MediaItem> = emptyList(),
    val continueItems: List<MediaItem> = emptyList(),
    val recentBooks: List<MediaItem> = emptyList(),
    val recentAudiobooks: List<MediaItem> = emptyList(),
    val recentComics: List<MediaItem> = emptyList(),
    val recentMusic: List<MediaItem> = emptyList(),
    val recentPodcasts: List<MediaItem> = emptyList(),
    val recentVideos: List<MediaItem> = emptyList(),
    val recentFanfiction: List<MediaItem> = emptyList(),
    val collections: List<HomeCollection> = emptyList(),
    val libraryStats: HomeLibraryStats = HomeLibraryStats()
)

data class HomeLibraryStats(
    val totalBooks: Int = 0,
    val totalAudiobooks: Int = 0,
    val totalComics: Int = 0,
    val totalMusic: Int = 0,
    val totalPodcasts: Int = 0,
    val totalVideos: Int = 0,
    val totalFanfiction: Int = 0
)

data class HomeCollection(
    val id: String,
    val name: String,
    val itemCount: Int,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color
)

private data class QuickAccessItem(
    val id: String,
    val label: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color
)
