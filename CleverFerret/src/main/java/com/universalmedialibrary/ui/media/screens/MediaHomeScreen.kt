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
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
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
 * - Welcome screen for new users with empty library
 */

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun MediaHomeScreen(
    state: MediaHomeState,
    onItemClick: (MediaItem) -> Unit,
    onPlayClick: (MediaItem) -> Unit,
    onSeeAllClick: (String) -> Unit,
    onQuickAccessCategoryClick: (String) -> Unit,
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit,
    onAddLocalFilesClick: () -> Unit = {},
    onSubscribePodcastsClick: () -> Unit = {},
    onRetry: () -> Unit,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberLazyListState()
    val showFloatingTopBar by remember {
        derivedStateOf { scrollState.firstVisibleItemIndex > 0 }
    }
    val heroCarouselPagerState = rememberPagerState(pageCount = { state.featuredItems.size })
    val coroutineScope = rememberCoroutineScope()
    
    // Check if library is empty
    val isLibraryEmpty = remember(state) {
        state.featuredItems.isEmpty() &&
        state.continueItems.isEmpty() &&
        state.recentBooks.isEmpty() &&
        state.recentMusic.isEmpty() &&
        state.recentPodcasts.isEmpty() &&
        state.recentVideos.isEmpty() &&
        state.recentAudiobooks.isEmpty() &&
        state.recentComics.isEmpty() &&
        state.recentFanfiction.isEmpty() &&
        state.libraryStats.totalBooks == 0 &&
        state.libraryStats.totalMusic == 0 &&
        state.libraryStats.totalAudiobooks == 0 &&
        state.libraryStats.totalVideos == 0
    }
    
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
    
    // Scaffold with sticky top header
    Scaffold(
        topBar = {
            StickyContentLibraryHeader(
                onSearchClick = onSearchClick,
                onNotificationClick = onNotificationClick
            )
        },
        containerColor = MaterialTheme.colorScheme.background
    ) { paddingValues ->
    Box(
        modifier = modifier
            .fillMaxSize()
            .padding(paddingValues)
            .background(MaterialTheme.colorScheme.background)
    ) {
        // Handle error, loading, and content states
        if (state.error != null) {
            ErrorStateContent(
                error = state.error,
                onRetry = onRetry,
                modifier = Modifier.align(Alignment.Center)
            )
        } else if (state.isLoading) {
            LoadingStateContent(
                modifier = Modifier.align(Alignment.Center)
            )
        } else {
            LazyColumn(
                state = scrollState,
                modifier = Modifier
                    .fillMaxSize()
                    .padding(bottom = MediaSpacing.Huge) // Extra padding for bottom nav
            ) {
                // Welcome section (Get Started) for empty library - now always at top after sticky header
                if (isLibraryEmpty) {
                    item {
                        WelcomeSection(
                            onSearchClick = onSearchClick,
                            onBrowseClick = { onSeeAllClick(MediaRoutes.OPDS_BROWSER) },
                            onAddLocalFilesClick = onAddLocalFilesClick,
                            onSubscribePodcastsClick = onSubscribePodcastsClick
                        )
                    }
                }

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

                // Quick Stats Row - always show if library has content OR show minimal version for empty
                item {
                    if (!isLibraryEmpty) {
                        QuickStatsRow(stats = state.libraryStats)
                    }
                }

                // Continue Section (Reading, Watching, Listening) - matching mockup "Continue Watching"
                if (state.continueItems.isNotEmpty()) {
                    item {
                        Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                        ContinueWatchingRow(
                            title = "Continue Watching",
                            items = state.continueItems,
                            onSeeAllClick = { onSeeAllClick(MediaRoutes.SEARCH) },
                            onItemClick = onItemClick
                        )
                    }
                }

                // Recently Added - Combined Grid Section (matching mockup)
                item {
                    val recentlyAddedItems = remember(state) {
                        (state.recentBooks.take(2) +
                         state.recentMusic.take(1) +
                         state.recentVideos.take(2) +
                         state.recentComics.take(1) +
                         state.recentPodcasts.take(1) +
                         state.recentAudiobooks.take(1))
                            .take(6) // Show max 6 items in grid
                    }
                    
                    if (recentlyAddedItems.isNotEmpty()) {
                        Column {
                            Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                            RecentlyAddedGridSection(
                                title = "Recently Added",
                                items = recentlyAddedItems,
                                onItemClick = onItemClick
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
                
                // Quick Access Grid - ALWAYS show this
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    QuickAccessGrid(
                        lastOpenedCategory = state.lastOpenedCategory,
                        onCategoryClick = onQuickAccessCategoryClick
                    )
                }
                
                // Bottom padding
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.Huge))
                }
            }
        }
        
        // Floating Top Bar (fades in on scroll) - kept for visual feedback
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
    } // End Scaffold
}

// =============================================================================
// WELCOME SECTION (Empty Library State)
// =============================================================================

@Composable
private fun WelcomeSection(
    onSearchClick: () -> Unit,
    onBrowseClick: () -> Unit,
    onAddLocalFilesClick: () -> Unit,
    onSubscribePodcastsClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
            .padding(top = MediaSpacing.LG, bottom = MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Welcome Icon
        Surface(
            modifier = Modifier.size(80.dp),
            shape = CircleShape,
            color = MaterialTheme.colorScheme.primary.copy(alpha = 0.15f)
        ) {
            Icon(
                imageVector = Icons.Default.LibraryBooks,
                contentDescription = "Library icon",
                modifier = Modifier
                    .padding(MediaSpacing.LG)
                    .fillMaxSize(),
                tint = MaterialTheme.colorScheme.primary
            )
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Welcome Title
        Text(
            text = "Welcome to CleverFerret",
            style = MediaTypography.TitleLarge,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold,
            textAlign = TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        // Subtitle
        Text(
            text = "Your universal media library",
            style = MediaTypography.BodyLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.XL))
        
        // Getting Started Card
        Surface(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(MediaCorners.Card),
            color = MaterialTheme.colorScheme.surfaceVariant,
            tonalElevation = 2.dp
        ) {
            Column(
                modifier = Modifier.padding(MediaSpacing.LG)
            ) {
                Text(
                    text = "Get Started",
                    style = MediaTypography.TitleSmall,
                    color = MaterialTheme.colorScheme.onSurface,
                    fontWeight = FontWeight.SemiBold
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                
                GettingStartedItem(
                    icon = Icons.Default.FolderOpen,
                    title = "Add Local Files",
                    description = "Import books, music, and videos from your device",
                    onClick = onAddLocalFilesClick
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                GettingStartedItem(
                    icon = Icons.Default.CloudDownload,
                    title = "Browse OPDS Catalogs",
                    description = "Discover free ebooks from online libraries",
                    onClick = onBrowseClick
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                GettingStartedItem(
                    icon = Icons.Default.Podcasts,
                    title = "Subscribe to Podcasts",
                    description = "Add your favorite podcast feeds",
                    onClick = onSubscribePodcastsClick
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                GettingStartedItem(
                    icon = Icons.Default.Search,
                    title = "Search & Discover",
                    description = "Find content across all your media",
                    onClick = onSearchClick
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.XL))
        
        // Hint text
        Text(
            text = "Explore the categories below to start building your library",
            style = MediaTypography.BodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
    }
}

@Composable
private fun GettingStartedItem(
    icon: ImageVector,
    title: String,
    description: String,
    onClick: (() -> Unit)? = null
) {
    val interactionModifier = if (onClick != null) {
        Modifier.clickable(onClick = onClick)
    } else {
        Modifier
    }
    
    Row(
        modifier = interactionModifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Surface(
            modifier = Modifier.size(40.dp),
            shape = RoundedCornerShape(MediaCorners.SM),
            color = MaterialTheme.colorScheme.primary.copy(alpha = 0.1f)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = title,
                modifier = Modifier
                    .padding(MediaSpacing.SM)
                    .fillMaxSize(),
                tint = MaterialTheme.colorScheme.primary
            )
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MediaTypography.BodyMedium,
                color = MaterialTheme.colorScheme.onSurface,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = description,
                style = MediaTypography.BodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        
        if (onClick != null) {
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Navigate to $title",
                modifier = Modifier.size(MediaSizes.IconMD),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
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
                    contentDescription = "$label statistics",
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
                    contentDescription = "${collection.name} collection",
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
    lastOpenedCategory: String?,
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
            lastOpenedCategory = lastOpenedCategory,
            onCategoryClick = onCategoryClick
        )
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun QuickAccessFlowGrid(
    items: List<QuickAccessItem>,
    lastOpenedCategory: String?,
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
                    isHighlighted = item.id == lastOpenedCategory,
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
    isHighlighted: Boolean,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .aspectRatio(1f),
        shape = RoundedCornerShape(MediaCorners.Card),
        color = if (isHighlighted) {
            MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.35f)
        } else {
            MaterialTheme.colorScheme.surface
        },
        border = if (isHighlighted) {
            BorderStroke(1.dp, MaterialTheme.colorScheme.primary)
        } else {
            null
        },
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
                    contentDescription = item.label,
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

            if (isHighlighted) {
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = "Last opened",
                    style = MediaTypography.LabelSmall,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.SemiBold
                )
            }
        }
    }
}

// =============================================================================
// CONTENT LIBRARY HEADER (Matching mockup)
// =============================================================================

@Composable
private fun ContentLibraryHeader(
    onSearchClick: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.background.copy(alpha = 0.8f),
        tonalElevation = 0.dp
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .statusBarsPadding()
                .padding(horizontal = MediaSpacing.LG, vertical = MediaSpacing.LG),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            // "Content Library" branding matching mockup
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                Text(
                    text = "Content ",
                    style = MediaTypography.TitleMedium,
                    color = MaterialTheme.colorScheme.onBackground,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Library",
                    style = MediaTypography.TitleMedium,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }
            
            // Search button - circular style matching mockup
            Surface(
                modifier = Modifier.size(40.dp),
                shape = CircleShape,
                color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.05f),
                onClick = onSearchClick
            ) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = "Search",
                        tint = MaterialTheme.colorScheme.onBackground,
                        modifier = Modifier.size(MediaSizes.IconMD)
                    )
                }
            }
        }
    }
}

// =============================================================================
// STICKY CONTENT LIBRARY HEADER (Fixed at top)
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun StickyContentLibraryHeader(
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit
) {
    TopAppBar(
        title = {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(0.dp)
            ) {
                Text(
                    text = "Content ",
                    style = MediaTypography.TitleMedium,
                    color = MaterialTheme.colorScheme.onBackground,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Library",
                    style = MediaTypography.TitleMedium,
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold
                )
            }
        },
        actions = {
            // Notifications button
            IconButton(onClick = onNotificationClick) {
                Icon(
                    imageVector = Icons.Default.Notifications,
                    contentDescription = "Notifications",
                    tint = MaterialTheme.colorScheme.onBackground
                )
            }
            // Search button
            IconButton(onClick = onSearchClick) {
                Icon(
                    imageVector = Icons.Default.Search,
                    contentDescription = "Search",
                    tint = MaterialTheme.colorScheme.onBackground
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MaterialTheme.colorScheme.background,
            titleContentColor = MaterialTheme.colorScheme.onBackground
        )
    )
}

// =============================================================================
// CONTINUE WATCHING ROW (Matching mockup with metallic borders)
// =============================================================================

@Composable
private fun ContinueWatchingRow(
    title: String,
    items: List<MediaItem>,
    onSeeAllClick: () -> Unit,
    onItemClick: (MediaItem) -> Unit
) {
    Column(modifier = Modifier.fillMaxWidth()) {
        // Header
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = MediaSpacing.LG),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = title,
                style = MediaTypography.TitleSmall,
                color = MaterialTheme.colorScheme.onBackground,
                fontWeight = FontWeight.Bold
            )
            
            TextButton(onClick = onSeeAllClick) {
                Text(
                    text = "View All",
                    style = MediaTypography.LabelMedium,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        // Items with metallic borders
        LazyRow(
            contentPadding = PaddingValues(horizontal = MediaSpacing.LG),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.LG)
        ) {
            items(items) { item ->
                MetallicBorderCard(
                    item = item,
                    onClick = { onItemClick(item) }
                )
            }
        }
    }
}

/**
 * Card with metallic gold gradient border matching mockup design
 */
@Composable
private fun MetallicBorderCard(
    item: MediaItem,
    onClick: () -> Unit
) {
    val primaryColor = MaterialTheme.colorScheme.primary
    val metallicGradient = Brush.linearGradient(
        colors = listOf(
            primaryColor.copy(alpha = 0.7f),
            primaryColor,
            primaryColor.copy(alpha = 0.9f),
            primaryColor.copy(alpha = 0.7f)
        )
    )
    
    Column(
        modifier = Modifier
            .width(140.dp)
            .clickable(onClick = onClick)
    ) {
        // Card with metallic border
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(MediaSizes.PosterAspectRatio)
        ) {
            // Metallic border background
            Box(
                modifier = Modifier
                    .matchParentSize()
                    .padding(0.dp)
                    .background(
                        brush = metallicGradient,
                        shape = RoundedCornerShape(10.dp)
                    )
            )
            
            // Inner card with image
            Box(
                modifier = Modifier
                    .matchParentSize()
                    .padding(2.dp) // Border thickness
                    .clip(RoundedCornerShape(8.dp))
                    .background(MaterialTheme.colorScheme.surface)
            ) {
                // Cover image
                if (item.imageUrl != null) {
                    AsyncImage(
                    
                        model = item.imageUrl,
                        contentDescription = item.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    // Placeholder
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(MaterialTheme.colorScheme.surfaceVariant),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = MaterialTheme.colorScheme.primary.copy(alpha = 0.5f)
                        )
                    }
                }
                
                // Progress bar at bottom
                if (item.progress > 0f) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.BottomCenter)
                            .fillMaxWidth()
                            .height(4.dp)
                            .background(Color.Black.copy(alpha = 0.5f))
                    ) {
                        Box(
                            modifier = Modifier
                                .fillMaxHeight()
                                .fillMaxWidth(item.progress)
                                .background(MaterialTheme.colorScheme.primary)
                        )
                    }
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        // Title
        Text(
            text = item.title,
            style = MediaTypography.BodyMedium,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        
        // Subtitle (remaining time or metadata)
        val subtitleText = when {
            item.duration != null -> item.duration
            item.subtitle != null -> item.subtitle
            else -> ""
        }
        if (subtitleText.isNotEmpty()) {
            Text(
                text = subtitleText,
                style = MediaTypography.BodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

// =============================================================================
// RECENTLY ADDED GRID SECTION (Matching mockup)
// =============================================================================

@Composable
private fun RecentlyAddedGridSection(
    title: String,
    items: List<MediaItem>,
    onItemClick: (MediaItem) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.LG)
    ) {
        // Header
        Text(
            text = title,
            style = MediaTypography.TitleSmall,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        
        // 2-column grid
        val columns = 2
        val rows = (items.size + columns - 1) / columns
        
        Column(
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG)
        ) {
            for (row in 0 until rows) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.LG)
                ) {
                    for (col in 0 until columns) {
                        val index = row * columns + col
                        if (index < items.size) {
                            Box(modifier = Modifier.weight(1f)) {
                                RecentlyAddedGridItem(
                                    item = items[index],
                                    onClick = { onItemClick(items[index]) }
                                )
                            }
                        } else {
                            Spacer(modifier = Modifier.weight(1f))
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun RecentlyAddedGridItem(
    item: MediaItem,
    onClick: () -> Unit
) {
    val primaryColor = MaterialTheme.colorScheme.primary
    val metallicGradient = Brush.linearGradient(
        colors = listOf(
            primaryColor.copy(alpha = 0.7f),
            primaryColor,
            primaryColor.copy(alpha = 0.9f),
            primaryColor.copy(alpha = 0.7f)
        )
    )
    
    // Choose aspect ratio based on media type
    val aspectRatio = when (item.mediaType) {
        MediaType.MUSIC, MediaType.PODCAST -> 1f // Square for albums/podcasts
        else -> MediaSizes.PosterAspectRatio // 2:3 for movies, books, etc.
    }
    
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
    ) {
        // Card with metallic border
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(aspectRatio)
        ) {
            // Metallic border background
            Box(
                modifier = Modifier
                    .matchParentSize()
                    .background(
                        brush = metallicGradient,
                        shape = RoundedCornerShape(10.dp)
                    )
            )
            
            // Inner card
            Box(
                modifier = Modifier
                    .matchParentSize()
                    .padding(2.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .background(MaterialTheme.colorScheme.surface)
            ) {
                // Cover image
                if (item.imageUrl != null) {
                    AsyncImage(
                    
                        model = item.imageUrl,
                        contentDescription = item.title,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(MaterialTheme.colorScheme.surfaceVariant),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = MaterialTheme.colorScheme.primary.copy(alpha = 0.5f)
                        )
                    }
                }
                
                // Media type indicator badge (top right)
                Surface(
                    modifier = Modifier
                        .align(Alignment.TopEnd)
                        .padding(MediaSpacing.SM),
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = Color.Black.copy(alpha = 0.7f)
                ) {
                    Box(
                        modifier = Modifier.padding(MediaSpacing.XS),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = item.mediaType.icon,
                            contentDescription = "Media image",
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        // Title
        Text(
            text = item.title,
            style = MediaTypography.BodyMedium,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
        
        // Subtitle
        item.subtitle?.let { subtitle ->
            Text(
                text = subtitle,
                style = MediaTypography.BodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

// =============================================================================
// TOP BAR (Legacy - kept for floating top bar on scroll)
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
    val error: String? = null,
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
    val libraryStats: HomeLibraryStats = HomeLibraryStats(),
    val lastOpenedCategory: String? = null
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

// =============================================================================
// ERROR STATE
// =============================================================================

@Composable
private fun ErrorStateContent(
    error: String,
    onRetry: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        // Error Icon
        Surface(
            modifier = Modifier.size(80.dp),
            shape = CircleShape,
            color = MaterialTheme.colorScheme.errorContainer
        ) {
            Icon(
                imageVector = Icons.Default.ErrorOutline,
                contentDescription = "Error loading library",
                modifier = Modifier
                    .padding(MediaSpacing.LG)
                    .fillMaxSize(),
                tint = MaterialTheme.colorScheme.error
            )
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Error Title
        Text(
            text = "Unable to Load Library",
            style = MediaTypography.TitleLarge,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold,
            textAlign = TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        // Error Message
        Text(
            text = error,
            style = MediaTypography.BodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.XL))
        
        // Retry Button
        Button(
            onClick = onRetry,
            modifier = Modifier.fillMaxWidth(0.6f)
        ) {
            Icon(
                imageVector = Icons.Default.Refresh,
                contentDescription = "Retry loading",
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
            Text("Retry")
        }
    }
}

// =============================================================================
// LOADING STATE
// =============================================================================

@Composable
private fun LoadingStateContent(
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxWidth()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        CircularProgressIndicator(
            modifier = Modifier.size(48.dp),
            color = MaterialTheme.colorScheme.primary,
            strokeWidth = 4.dp
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = "Loading your library...",
            style = MediaTypography.BodyLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
    }
}
