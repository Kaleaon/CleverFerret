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
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

/**
 * Plex-Style Home/Dashboard Screen
 * 
 * A beautiful, feature-rich home screen inspired by Plex:
 * - Hero carousel for featured content
 * - Continue reading/watching/listening section
 * - Recently added content rows
 * - Curated collections
 * - Quick access to all media types
 * - Personalized recommendations
 */

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun PlexHomeScreen(
    state: PlexHomeState,
    onItemClick: (PlexMediaItem) -> Unit,
    onPlayClick: (PlexMediaItem) -> Unit,
    onSeeAllClick: (String) -> Unit,
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberLazyListState()
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
            .background(PlexColors.Background)
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
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "Continue Where You Left Off",
                        items = state.continueItems,
                        onSeeAllClick = { onSeeAllClick("continue") }
                    ) { item ->
                        PlexWideCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = PlexSizes.CardXLarge
                        )
                    }
                }
            }
            
            // Recently Added Books
            if (state.recentBooks.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "Recently Added Books",
                        items = state.recentBooks,
                        onSeeAllClick = { onSeeAllClick("books") }
                    ) { item ->
                        PlexPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Recently Added Music
            if (state.recentMusic.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "Recently Added Music",
                        items = state.recentMusic,
                        onSeeAllClick = { onSeeAllClick("music") }
                    ) { item ->
                        PlexSquareCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            size = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Podcasts
            if (state.recentPodcasts.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "New Podcast Episodes",
                        items = state.recentPodcasts,
                        onSeeAllClick = { onSeeAllClick("podcasts") }
                    ) { item ->
                        PlexSquareCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            size = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Movies & TV (from Plex/Jellyfin/Emby)
            if (state.recentVideos.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "Recently Added Movies & TV",
                        items = state.recentVideos,
                        onSeeAllClick = { onSeeAllClick("videos") }
                    ) { item ->
                        PlexPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Audiobooks
            if (state.recentAudiobooks.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "Recent Audiobooks",
                        items = state.recentAudiobooks,
                        onSeeAllClick = { onSeeAllClick("audiobooks") }
                    ) { item ->
                        PlexPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Comics
            if (state.recentComics.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "Recently Added Comics",
                        items = state.recentComics,
                        onSeeAllClick = { onSeeAllClick("comics") }
                    ) { item ->
                        PlexPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Web Fiction
            if (state.recentFanfiction.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    PlexCarouselRow(
                        title = "Web Fiction Updates",
                        items = state.recentFanfiction,
                        onSeeAllClick = { onSeeAllClick("webfiction") }
                    ) { item ->
                        PlexPosterCard(
                            item = item,
                            onClick = { onItemClick(item) },
                            width = PlexSizes.CardMedium
                        )
                    }
                }
            }
            
            // Collections
            if (state.collections.isNotEmpty()) {
                item {
                    Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                    CollectionsSection(
                        collections = state.collections,
                        onCollectionClick = { onSeeAllClick("collection_${it.id}") }
                    )
                }
            }
            
            // Quick Access Grid
            item {
                Spacer(modifier = Modifier.height(PlexSpacing.SectionGap))
                QuickAccessGrid(
                    onCategoryClick = onSeeAllClick
                )
            }
            
            // Bottom padding
            item {
                Spacer(modifier = Modifier.height(PlexSpacing.Huge))
            }
        }
        
        // Floating Top Bar (fades in on scroll)
        AnimatedVisibility(
            visible = scrollState.firstVisibleItemIndex > 0,
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
    items: List<PlexMediaItem>,
    pagerState: PagerState,
    onItemClick: (PlexMediaItem) -> Unit,
    onPlayClick: (PlexMediaItem) -> Unit
) {
    Box {
        HorizontalPager(
            state = pagerState,
            modifier = Modifier.fillMaxWidth()
        ) { page ->
            PlexHeroCard(
                item = items[page],
                onClick = { onItemClick(items[page]) },
                onPlayClick = { onPlayClick(items[page]) }
            )
        }
        
        // Page indicators
        Row(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .padding(bottom = PlexSpacing.LG),
            horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
        ) {
            items.forEachIndexed { index, _ ->
                Box(
                    modifier = Modifier
                        .size(if (pagerState.currentPage == index) 24.dp else 8.dp, 4.dp)
                        .clip(RoundedCornerShape(PlexCorners.Full))
                        .background(
                            if (pagerState.currentPage == index) 
                                PlexColors.AccentPrimary 
                            else 
                                PlexColors.TextTertiary.copy(alpha = 0.5f)
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
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.ScreenHorizontal, vertical = PlexSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
    ) {
        StatCard(
            icon = Icons.Default.MenuBook,
            value = stats.totalBooks.toString(),
            label = "Books",
            color = PlexColors.MediaTypes.Book,
            modifier = Modifier.weight(1f)
        )
        StatCard(
            icon = Icons.Default.MusicNote,
            value = stats.totalMusic.toString(),
            label = "Tracks",
            color = PlexColors.MediaTypes.Music,
            modifier = Modifier.weight(1f)
        )
        StatCard(
            icon = Icons.Default.Headphones,
            value = stats.totalAudiobooks.toString(),
            label = "Audiobooks",
            color = PlexColors.MediaTypes.Audiobook,
            modifier = Modifier.weight(1f)
        )
        StatCard(
            icon = Icons.Default.Movie,
            value = stats.totalVideos.toString(),
            label = "Videos",
            color = PlexColors.MediaTypes.Movie,
            modifier = Modifier.weight(1f)
        )
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
        shape = RoundedCornerShape(PlexCorners.Card),
        color = PlexColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(PlexSpacing.MD),
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
                        .padding(PlexSpacing.SM)
                        .fillMaxSize(),
                    tint = color
                )
            }
            
            Spacer(modifier = Modifier.width(PlexSpacing.SM))
            
            Column {
                Text(
                    text = value,
                    style = PlexTypography.TitleMedium,
                    color = PlexColors.TextPrimary,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = label,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextTertiary
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
            .padding(horizontal = PlexSpacing.ScreenHorizontal)
    ) {
        Text(
            text = "Your Collections",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.MD))
        
        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
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
        shape = RoundedCornerShape(PlexCorners.Card),
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
                    .padding(PlexSpacing.MD),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Icon(
                    imageVector = collection.icon,
                    contentDescription = null,
                    modifier = Modifier.size(PlexSizes.IconLG),
                    tint = PlexColors.TextPrimary
                )
                
                Column {
                    Text(
                        text = collection.name,
                        style = PlexTypography.TitleSmall,
                        color = PlexColors.TextPrimary,
                        maxLines = 1
                    )
                    Text(
                        text = "${collection.itemCount} items",
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary
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
            .padding(horizontal = PlexSpacing.ScreenHorizontal)
    ) {
        Text(
            text = "Explore Your Library",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.MD))
        
        val categories = listOf(
            QuickAccessItem("books", "Books", Icons.Default.MenuBook, PlexColors.MediaTypes.Book),
            QuickAccessItem("audiobooks", "Audiobooks", Icons.Default.Headphones, PlexColors.MediaTypes.Audiobook),
            QuickAccessItem("comics", "Comics", Icons.Default.AutoStories, PlexColors.MediaTypes.Comic),
            QuickAccessItem("music", "Music", Icons.Default.MusicNote, PlexColors.MediaTypes.Music),
            QuickAccessItem("podcasts", "Podcasts", Icons.Default.Podcasts, PlexColors.MediaTypes.Podcast),
            QuickAccessItem("radio", "Radio", Icons.Default.Radio, PlexColors.MediaTypes.Radio),
            QuickAccessItem("videos", "Videos", Icons.Default.Movie, PlexColors.MediaTypes.Movie),
            QuickAccessItem("webfiction", "Web Fiction", Icons.Default.Language, PlexColors.MediaTypes.Fanfiction),
            QuickAccessItem("documents", "Documents", Icons.Default.Description, PlexColors.MediaTypes.Document),
            QuickAccessItem("opds", "OPDS", Icons.Default.CloudDownload, PlexColors.AccentSecondary),
            QuickAccessItem("ambient", "Ambient", Icons.Default.Spa, PlexColors.AccentTertiary),
            QuickAccessItem("collections", "Collections", Icons.Default.Collections, PlexColors.AccentPrimary)
        )
        
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 100.dp),
            horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
            verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
            modifier = Modifier.height(280.dp),
            userScrollEnabled = false
        ) {
            items(
                items = categories,
                key = { it.id }
            ) { item: QuickAccessItem ->
                QuickAccessCard(
                    item = item,
                    onClick = { onCategoryClick(item.id) }
                )
            }
        }
    }
}

@Composable
private fun QuickAccessCard(
    item: QuickAccessItem,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .aspectRatio(1f),
        shape = RoundedCornerShape(PlexCorners.Card),
        color = PlexColors.BackgroundElevated,
        onClick = onClick
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(PlexSpacing.SM),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Surface(
                shape = CircleShape,
                color = item.color.copy(alpha = 0.15f),
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    imageVector = item.icon,
                    contentDescription = null,
                    modifier = Modifier
                        .padding(PlexSpacing.SM)
                        .fillMaxSize(),
                    tint = item.color
                )
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.SM))
            
            Text(
                text = item.label,
                style = PlexTypography.LabelMedium,
                color = PlexColors.TextPrimary
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
        color = PlexColors.Background.copy(alpha = 0.95f),
        tonalElevation = PlexElevation.SM
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .statusBarsPadding()
                .padding(horizontal = PlexSpacing.ScreenHorizontal, vertical = PlexSpacing.SM),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "CleverFerret",
                style = PlexTypography.TitleMedium,
                color = PlexColors.AccentPrimary,
                fontWeight = FontWeight.Bold
            )
            
            Row(horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)) {
                IconButton(onClick = onSearchClick) {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = "Search",
                        tint = PlexColors.TextSecondary
                    )
                }
                
                IconButton(onClick = onNotificationClick) {
                    Icon(
                        imageVector = Icons.Default.Notifications,
                        contentDescription = "Notifications",
                        tint = PlexColors.TextSecondary
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
data class PlexHomeState(
    val isLoading: Boolean = false,
    val featuredItems: List<PlexMediaItem> = emptyList(),
    val continueItems: List<PlexMediaItem> = emptyList(),
    val recentBooks: List<PlexMediaItem> = emptyList(),
    val recentAudiobooks: List<PlexMediaItem> = emptyList(),
    val recentComics: List<PlexMediaItem> = emptyList(),
    val recentMusic: List<PlexMediaItem> = emptyList(),
    val recentPodcasts: List<PlexMediaItem> = emptyList(),
    val recentVideos: List<PlexMediaItem> = emptyList(),
    val recentFanfiction: List<PlexMediaItem> = emptyList(),
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
