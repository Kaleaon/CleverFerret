package com.universalmedialibrary.ui.media.screens

import android.provider.Settings
import androidx.compose.animation.*
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.*
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.interaction.collectIsDraggedAsState
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
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.*
import androidx.compose.runtime.snapshotFlow
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.isTraversalGroup
import androidx.compose.ui.semantics.role
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.traversalIndex
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.roundToInt

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
    isRefreshing: Boolean,
    onItemClick: (MediaItem) -> Unit,
    onPlayClick: (MediaItem) -> Unit,
    onSeeAllClick: (String) -> Unit,
    onQuickAccessCategoryClick: (String) -> Unit,
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit,
    onAddLocalFilesClick: () -> Unit = {},
    onSubscribePodcastsClick: () -> Unit = {},
    onRefresh: () -> Unit,
    onQuickAccessPreferencesChange: (order: List<String>, favorites: Set<String>) -> Unit = { _, _ -> },
    onDismissWelcomeTips: () -> Unit = {},
    onRetry: () -> Unit,
    reduceMotionEnabled: Boolean = false,
    modifier: Modifier = Modifier
) {
    val reducedMotionEnabled = isReducedMotionEnabled()
    val scrollState = rememberLazyListState()
    val showFloatingTopBar by remember {
        derivedStateOf { scrollState.firstVisibleItemIndex > 0 }
    }
    val heroCarouselPagerState = rememberPagerState(pageCount = { state.featuredItems.size })
    val isHeroCarouselBeingDragged by heroCarouselPagerState.interactionSource.collectIsDraggedAsState()
    val isPullToRefreshEnabled by remember(scrollState, state.error, state.isLoading, isHeroCarouselBeingDragged) {
        derivedStateOf {
            scrollState.firstVisibleItemIndex == 0 &&
                scrollState.firstVisibleItemScrollOffset == 0 &&
                state.error == null &&
                !state.isLoading &&
                !isHeroCarouselBeingDragged
        }
    }
    
    val context = LocalContext.current
    val platformAnimationsDisabled = remember(context) {
        Settings.Global.getFloat(
            context.contentResolver,
            Settings.Global.ANIMATOR_DURATION_SCALE,
            1f
        ) == 0f
    }
    val shouldReduceMotion = reduceMotionEnabled || platformAnimationsDisabled

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
    
    // Auto-scroll hero carousel (disabled when reduced motion is enabled)
    LaunchedEffect(state.featuredItems, shouldReduceMotion) {
        if (state.featuredItems.isNotEmpty() && !shouldReduceMotion) {
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
                modifier = Modifier.fillMaxSize()
            )
        } else {
            PullToRefreshBox(
                isRefreshing = isRefreshing,
                onRefresh = onRefresh,
                isEnabled = isPullToRefreshEnabled,
                modifier = Modifier.fillMaxSize()
            ) {
                // Welcome section (Get Started) for empty library - now always at top after sticky header
                if (isLibraryEmpty) {
                    item(key = "welcome-section") {
                        AnimatedSectionContainer(
                            sectionKey = "welcome-section",
                            sectionIndex = 0,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
                            WelcomeSection(
                                onSearchClick = onSearchClick,
                                onBrowseClick = { onSeeAllClick(MediaRoutes.OPDS_BROWSER) },
                                onAddLocalFilesClick = onAddLocalFilesClick,
                                onSubscribePodcastsClick = onSubscribePodcastsClick
                            )
                        }
                if (isLibraryEmpty && state.showOnboardingTips) {
                    item {
                        WelcomeSection(
                            onSearchClick = onSearchClick,
                            onBrowseClick = { onSeeAllClick(MediaRoutes.OPDS_BROWSER) },
                            onAddLocalFilesClick = onAddLocalFilesClick,
                            onSubscribePodcastsClick = onSubscribePodcastsClick,
                            canDismiss = state.hasConfiguredContentSource,
                            onDismiss = onDismissWelcomeTips
                        )
                    }
                }

                // Hero Carousel
                if (state.featuredItems.isNotEmpty()) {
                    item(key = "hero-carousel") {
                        AnimatedSectionContainer(
                            sectionKey = "hero-carousel",
                            sectionIndex = 1,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
                            HeroCarousel(
                                items = state.featuredItems,
                                pagerState = heroCarouselPagerState,
                                onItemClick = onItemClick,
                                onPlayClick = onPlayClick
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
                // Quick Stats Row - always show if library has content OR show minimal version for empty
                item(key = "quick-stats") {
                    if (!isLibraryEmpty) {
                        AnimatedSectionContainer(
                            sectionKey = "quick-stats",
                            sectionIndex = 2,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
                            QuickStatsRow(stats = state.libraryStats)
                        }
                    }

                    // Quick Stats Row - always show if library has content OR show minimal version for empty
                    item {
                        if (!isLibraryEmpty) {
                            QuickStatsRow(stats = state.libraryStats)
                // Continue Section (Reading, Watching, Listening) - matching mockup "Continue Watching"
                if (state.continueItems.isNotEmpty()) {
                    item(key = "continue-section") {
                        AnimatedSectionContainer(
                            sectionKey = "continue-section",
                            sectionIndex = 3,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
                            Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                            ContinueWatchingRow(
                                title = "Continue Watching",
                                items = state.continueItems,
                                onSeeAllClick = { onSeeAllClick(MediaRoutes.SEARCH) },
                                onItemClick = onItemClick
                            )
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
                // Recently Added - Combined Grid Section (matching mockup)
                item(key = "recently-added") {
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
                        AnimatedSectionContainer(
                            sectionKey = "recently-added",
                            sectionIndex = 4,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
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
                }

                // Partial empty-state guidance for mixed libraries
                if (!isLibraryEmpty) {
                    item {
                        val emptySections = remember(state) {
                            buildList {
                                if (state.libraryStats.totalBooks == 0 && state.recentBooks.isEmpty()) {
                                    add(EmptySectionHint("Books", MediaRoutes.BOOKS, Icons.Default.MenuBook))
                                }
                                if (state.libraryStats.totalMusic == 0 && state.recentMusic.isEmpty()) {
                                    add(EmptySectionHint("Music", MediaRoutes.MUSIC, Icons.Default.MusicNote))
                                }
                                if (state.libraryStats.totalPodcasts == 0 && state.recentPodcasts.isEmpty()) {
                                    add(EmptySectionHint("Podcasts", MediaRoutes.PODCASTS, Icons.Default.Podcasts))
                                }
                                if (state.libraryStats.totalAudiobooks == 0 && state.recentAudiobooks.isEmpty()) {
                                    add(EmptySectionHint("Audiobooks", MediaRoutes.AUDIOBOOKS, Icons.Default.Headphones))
                                }
                                if (state.libraryStats.totalVideos == 0 && state.recentVideos.isEmpty()) {
                                    add(EmptySectionHint("Videos", MediaRoutes.MOVIES, Icons.Default.Movie))
                                }
                                if (state.libraryStats.totalComics == 0 && state.recentComics.isEmpty()) {
                                    add(EmptySectionHint("Comics", MediaRoutes.COMICS, Icons.Default.AutoStories))
                                }
                                if (state.libraryStats.totalFanfiction == 0 && state.recentFanfiction.isEmpty()) {
                                    add(EmptySectionHint("Web Fiction", MediaRoutes.WEB_FICTION, Icons.Default.Public))
                                }
                            }
                        }

                        if (emptySections.isNotEmpty()) {
                            Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                            EmptySectionGuidanceRow(
                                emptySections = emptySections,
                                onSectionClick = onSeeAllClick
                            )
                        }
                    }
                }
                
                // Comics
                if (state.recentComics.isNotEmpty()) {
                    item(key = "recent-comics") {
                        AnimatedSectionContainer(
                            sectionKey = "recent-comics",
                            sectionIndex = 5,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
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
                }
                
                // Web Fiction
                if (state.recentFanfiction.isNotEmpty()) {
                    item(key = "recent-fanfiction") {
                        AnimatedSectionContainer(
                            sectionKey = "recent-fanfiction",
                            sectionIndex = 6,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
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
                            onCategoryClick = onSeeAllClick
                        )
                    }

                    // Bottom padding
                    item {
                        Spacer(modifier = Modifier.height(MediaSpacing.Huge))
                    }
                        }
                    }
                }
                
                // Collections
                if (state.collections.isNotEmpty()) {
                    item(key = "collections") {
                        AnimatedSectionContainer(
                            sectionKey = "collections",
                            sectionIndex = 7,
                            reducedMotionEnabled = reducedMotionEnabled
                        ) {
                            Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                            CollectionsSection(
                                collections = state.collections,
                                onCollectionClick = { onSeeAllClick(MediaRoutes.collectionDetailRoute(it.id)) }
                            )
                        }
                    }
                }
                
                // Quick Access Grid - ALWAYS show this
                item(key = "quick-access") {
                    AnimatedSectionContainer(
                        sectionKey = "quick-access",
                        sectionIndex = 8,
                        reducedMotionEnabled = reducedMotionEnabled
                    ) {
                        Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                        QuickAccessGrid(
                            onCategoryClick = onSeeAllClick
                        )
                    }
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                    QuickAccessGrid(
                        lastOpenedCategory = state.lastOpenedCategory,
                        onCategoryClick = onQuickAccessCategoryClick
                        items = state.quickAccessItems,
                        onCategoryClick = onSeeAllClick,
                        onPreferencesChange = onQuickAccessPreferencesChange
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

internal data class EmptySectionHint(
    val name: String,
    val route: String,
    val icon: ImageVector
)

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
    var lastPagerInteractionTimestamp by remember(pagerState) { mutableLongStateOf(0L) }

    LaunchedEffect(pagerState) {
        snapshotFlow { pagerState.isScrollInProgress }
            .collect {
                lastPagerInteractionTimestamp = System.currentTimeMillis()
            }
    }

    LaunchedEffect(pagerState, items.size) {
        if (items.size <= 1) return@LaunchedEffect

        while (true) {
            delay(HERO_CAROUSEL_AUTO_ADVANCE_INTERVAL_MS)

            val itemCount = items.size
            if (itemCount <= 1) continue

            val now = System.currentTimeMillis()
            val userRecentlyInteracted =
                now - lastPagerInteractionTimestamp < HERO_CAROUSEL_IDLE_RESUME_DELAY_MS

            if (pagerState.isScrollInProgress || userRecentlyInteracted) continue

            val currentPage = pagerState.currentPage.coerceIn(0, itemCount - 1)
            val nextPage = (currentPage + 1) % itemCount
            pagerState.animateScrollToPage(nextPage)
        }
    }

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

private const val HERO_CAROUSEL_AUTO_ADVANCE_INTERVAL_MS = 6000L
private const val HERO_CAROUSEL_IDLE_RESUME_DELAY_MS = 1800L

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
            color = MediaColors.TextPrimary,
            modifier = Modifier.semantics { heading() }
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
    items: List<QuickAccessItem>,
    onCategoryClick: (String) -> Unit,
    onPreferencesChange: (order: List<String>, favorites: Set<String>) -> Unit
) {
    var reorderMode by remember { mutableStateOf(false) }
    var editableItems by remember(items) { mutableStateOf(items) }

    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Explore Your Library",
                style = MediaTypography.TitleMedium,
                color = MaterialTheme.colorScheme.onBackground
            )
            if (reorderMode) {
                TextButton(
                    onClick = {
                        reorderMode = false
                        onPreferencesChange(
                            editableItems.map { it.id },
                            editableItems.filter { it.isFavorite }.mapTo(mutableSetOf()) { it.id }
                        )
                    }
                ) {
                    Text("Done")
                }
            }
        }

        if (reorderMode) {
            Text(
                text = "Long-press enabled reorder mode: use arrows to reorder and star to pin favorites.",
                style = MediaTypography.BodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
        }

        Spacer(modifier = Modifier.height(MediaSpacing.MD))

        QuickAccessFlowGrid(
            items = editableItems,
            reorderMode = reorderMode,
            onCategoryClick = onCategoryClick,
            onEnableReorder = { reorderMode = true },
            onMoveItem = { fromIndex, toIndex ->
                if (fromIndex in editableItems.indices && toIndex in editableItems.indices) {
                    editableItems = editableItems.toMutableList().apply {
                        add(toIndex, removeAt(fromIndex))
                    }
                }
            },
            onToggleFavorite = { id ->
                editableItems = editableItems.map { item ->
                    if (item.id == id) item.copy(isFavorite = !item.isFavorite) else item
                }
            }
        )
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun QuickAccessFlowGrid(
    items: List<QuickAccessItem>,
    lastOpenedCategory: String?,
    onCategoryClick: (String) -> Unit
    reorderMode: Boolean,
    onCategoryClick: (String) -> Unit,
    onEnableReorder: () -> Unit,
    onMoveItem: (fromIndex: Int, toIndex: Int) -> Unit,
    onToggleFavorite: (String) -> Unit
) {
    BoxWithConstraints(modifier = Modifier.fillMaxWidth()) {
        val columns = if (maxWidth < 360.dp) 2 else 3
        val spacing = MediaSpacing.MD
        val cardWidth = (maxWidth - spacing * (columns - 1)) / columns

        FlowRow(
            maxItemsInEachRow = columns,
            horizontalArrangement = Arrangement.spacedBy(spacing),
            verticalArrangement = Arrangement.spacedBy(spacing),
            modifier = Modifier
                .fillMaxWidth()
                .semantics { isTraversalGroup = true }
        ) {
            items.forEachIndexed { index, item ->
                QuickAccessCard(
                    item = item,
                    isHighlighted = item.id == lastOpenedCategory,
                    reorderMode = reorderMode,
                    canMoveUp = index > 0,
                    canMoveDown = index < items.lastIndex,
                    onClick = { onCategoryClick(item.id) },
                    onLongClick = onEnableReorder,
                    onMoveUp = { onMoveItem(index, index - 1) },
                    onMoveDown = { onMoveItem(index, index + 1) },
                    onToggleFavorite = { onToggleFavorite(item.id) },
                    modifier = Modifier.width(cardWidth)
                )
            }
        }
    }
}

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun QuickAccessCard(
    item: QuickAccessItem,
    isHighlighted: Boolean,
    reorderMode: Boolean,
    canMoveUp: Boolean,
    canMoveDown: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    onMoveUp: () -> Unit,
    onMoveDown: () -> Unit,
    onToggleFavorite: () -> Unit,
    modifier: Modifier = Modifier
) {
    val cardContentDescription = stringResource(
        id = R.string.cd_open_category,
        item.label
    )
    val quickAccessAlphas = MediaColors.quickAccessCardAlphas()

    Surface(
        modifier = modifier
            .aspectRatio(1f)
            .combinedClickable(
                onClick = { if (!reorderMode) onClick() },
                onLongClick = onLongClick
            ),
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
        color = MaterialTheme.colorScheme.surface
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(MediaSpacing.SM),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            if (reorderMode) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(onClick = onMoveUp, enabled = canMoveUp) {
                        Icon(Icons.Default.KeyboardArrowUp, contentDescription = "Move up")
                    }
                    IconButton(onClick = onToggleFavorite) {
                        Icon(
                            imageVector = if (item.isFavorite) Icons.Default.Star else Icons.Default.StarBorder,
                            contentDescription = if (item.isFavorite) "Unpin favorite" else "Pin favorite",
                            tint = if (item.isFavorite) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    IconButton(onClick = onMoveDown, enabled = canMoveDown) {
                        Icon(Icons.Default.KeyboardArrowDown, contentDescription = "Move down")
                    }
                }
            } else if (item.isFavorite) {
                Icon(
                    imageVector = Icons.Default.Star,
                    contentDescription = "Favorite",
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.align(Alignment.End)
                )
            }

            Surface(
                shape = CircleShape,
                color = MaterialTheme.colorScheme.primary.copy(alpha = quickAccessAlphas.chip),
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
    val progress = item.progress.coerceIn(0f, 1f)
    val hasProgress = progress > 0f && progress < 1f
    val progressTrackColor = MaterialTheme.colorScheme.surfaceContainerHighest
    val progressBackgroundColor = MaterialTheme.colorScheme.surface.copy(alpha = 0.92f)

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
                if (hasProgress) {
                    Box(
                        modifier = Modifier
                            .align(Alignment.BottomCenter)
                            .fillMaxWidth()
                            .height(6.dp)
                            .background(progressTrackColor)
                    ) {
                        Box(
                            modifier = Modifier
                                .fillMaxHeight()
                                .fillMaxWidth(progress)
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
        val subtitleText = remember(item) { item.remainingLabel() }
        if (subtitleText.isNotEmpty()) {
            Surface(
                color = progressBackgroundColor,
                shape = RoundedCornerShape(MediaCorners.SM)
            ) {
                Text(
                    text = subtitleText,
                    style = MediaTypography.BodySmall,
                    color = MaterialTheme.colorScheme.onSurface,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                )
            }
        }
    }
}

private fun MediaItem.remainingLabel(): String {
    val clampedProgress = progress.coerceIn(0f, 1f)
    if (clampedProgress <= 0f || clampedProgress >= 1f) {
        return subtitle ?: duration.orEmpty()
    }

    if (!remainingTimeText.isNullOrBlank()) {
        return "${remainingTimeText.trim()} left"
    }

    val parsedDurationSeconds = parseDurationToSeconds(duration)
    if (parsedDurationSeconds != null) {
        val remainingSeconds = (parsedDurationSeconds * (1f - clampedProgress)).roundToInt()
        return "${formatRemainingTime(remainingSeconds)} left"
    }

    if (!subtitle.isNullOrBlank()) {
        return subtitle
    }

    val remainingPercent = ((1f - clampedProgress) * 100).roundToInt().coerceIn(1, 99)
    return "$remainingPercent% remaining"
}

private fun parseDurationToSeconds(duration: String?): Int? {
    if (duration.isNullOrBlank()) return null
    val normalized = duration.trim().lowercase()
    val hours = "(\\d+)\\s*h".toRegex().find(normalized)?.groupValues?.get(1)?.toIntOrNull() ?: 0
    val minutes = "(\\d+)\\s*m".toRegex().find(normalized)?.groupValues?.get(1)?.toIntOrNull() ?: 0
    val seconds = "(\\d+)\\s*s".toRegex().find(normalized)?.groupValues?.get(1)?.toIntOrNull() ?: 0
    if (hours == 0 && minutes == 0 && seconds == 0) return null
    return (hours * 3600) + (minutes * 60) + seconds
}

private fun formatRemainingTime(totalSeconds: Int): String {
    val safeSeconds = totalSeconds.coerceAtLeast(0)
    val hours = safeSeconds / 3600
    val minutes = (safeSeconds % 3600) / 60

    return when {
        hours > 0 -> "${hours}h ${minutes}m"
        minutes > 0 -> "${minutes}m"
        else -> "<1m"
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
            fontWeight = FontWeight.Bold,
            modifier = Modifier.semantics { heading() }
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
    val quickAccessItems: List<QuickAccessItem> = defaultQuickAccessItems
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

data class QuickAccessItem(
    val id: String,
    val label: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color,
    val isFavorite: Boolean = false
)

val defaultQuickAccessItems = listOf(
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
    val shimmerBrush = rememberShimmerBrush()

    LazyColumn(
        modifier = modifier
            .fillMaxSize()
            .padding(bottom = MediaSpacing.Huge)
    ) {
        item {
            HeroSkeletonRow(brush = shimmerBrush)
        }

        item {
            QuickStatsSkeletonRow(brush = shimmerBrush)
        }

        item {
            Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
            QuickAccessSkeletonGrid(brush = shimmerBrush)
        }

        item {
            Spacer(modifier = Modifier.height(MediaSpacing.Huge))
        }
    }
}

@Composable
private fun rememberShimmerBrush(): Brush {
    val transition = rememberInfiniteTransition(label = "home_loading_shimmer")
    val translateX by transition.animateFloat(
        initialValue = 0f,
        targetValue = 1000f,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis = 1200, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "home_loading_shimmer_translate"
    )

    return Brush.linearGradient(
        colors = listOf(
            MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.7f),
            MaterialTheme.colorScheme.surfaceVariant,
            MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.7f)
        ),
        start = Offset(translateX - 500f, 0f),
        end = Offset(translateX, 0f)
    )
}

@Composable
private fun HeroSkeletonRow(brush: Brush) {
    Box(modifier = Modifier.fillMaxWidth()) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(MediaSizes.HeroHeight)
                .background(brush)
        )

        Row(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .padding(bottom = MediaSpacing.LG),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            repeat(3) { index ->
                Box(
                    modifier = Modifier
                        .size(if (index == 0) 24.dp else 8.dp, 4.dp)
                        .clip(RoundedCornerShape(MediaCorners.Full))
                        .background(MaterialTheme.colorScheme.onSurface.copy(alpha = 0.25f))
                )
            }
        }
    }
}

@Composable
private fun QuickStatsSkeletonRow(brush: Brush) {
    BoxWithConstraints(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal, vertical = MediaSpacing.MD)
    ) {
        val isCompact = maxWidth < 420.dp
        val spacing = MediaSpacing.MD

        val statCard: @Composable (Modifier) -> Unit = { cardModifier ->
            Box(
                modifier = cardModifier
                    .height(72.dp)
                    .clip(RoundedCornerShape(MediaCorners.Card))
                    .background(brush)
            )
        }

        if (isCompact) {
            Column(verticalArrangement = Arrangement.spacedBy(spacing)) {
                Row(horizontalArrangement = Arrangement.spacedBy(spacing)) {
                    repeat(2) { statCard(Modifier.weight(1f)) }
                }
                Row(horizontalArrangement = Arrangement.spacedBy(spacing)) {
                    repeat(2) { statCard(Modifier.weight(1f)) }
                }
            }
        } else {
            Row(horizontalArrangement = Arrangement.spacedBy(spacing)) {
                repeat(4) { statCard(Modifier.weight(1f)) }
            }
        }
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun QuickAccessSkeletonGrid(brush: Brush) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth(0.5f)
                .height(24.dp)
                .clip(RoundedCornerShape(MediaCorners.XS))
                .background(brush)
        )

        Spacer(modifier = Modifier.height(MediaSpacing.MD))

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
                repeat(13) {
                    Box(
                        modifier = Modifier
                            .width(cardWidth)
                            .aspectRatio(1f)
                            .clip(RoundedCornerShape(MediaCorners.Card))
                            .background(brush)
                    )
                }
            }
        }
    }
}
