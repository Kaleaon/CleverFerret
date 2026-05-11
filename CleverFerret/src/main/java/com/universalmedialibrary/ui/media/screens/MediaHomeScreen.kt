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
import androidx.compose.ui.platform.testTag
import coil.compose.AsyncImage
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.navigation.HomeSectionRouteContract
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.roundToInt

internal const val MEDIA_HOME_TOP_BAR_TAG = "media_home_top_bar"
internal const val MEDIA_HOME_TOP_BAR_NAV_TAG = "media_home_top_bar_nav_icon"
internal const val MEDIA_HOME_TOP_BAR_SEARCH_TAG = "media_home_top_bar_search"
internal const val MEDIA_HOME_TOP_BAR_NOTIFICATIONS_TAG = "media_home_top_bar_notifications"

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
    onNavigationClick: () -> Unit = {},
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
                onNavigationClick = onNavigationClick,
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
                                onSeeAllClick = { onSeeAllClick(HomeSectionRouteContract.COMICS.seeAllRoute()) }
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
                                onSeeAllClick = { onSeeAllClick(HomeSectionRouteContract.COMICS.seeAllRoute()) }
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
                                onSeeAllClick = { onSeeAllClick(HomeSectionRouteContract.WEB_FICTION.seeAllRoute()) }
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
                        items = state.quickAccessItems,
                        onCategoryClick = onQuickAccessCategoryClick,
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


private const val HERO_CAROUSEL_AUTO_ADVANCE_INTERVAL_MS = 6000L
private const val HERO_CAROUSEL_IDLE_RESUME_DELAY_MS = 1800L

// =============================================================================
// QUICK STATS ROW
// =============================================================================



// =============================================================================
// COLLECTIONS SECTION
// =============================================================================



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
        }
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



@OptIn(ExperimentalMaterial3Api::class)

// =============================================================================
// CONTINUE WATCHING ROW (Matching mockup with metallic borders)
// =============================================================================




// =============================================================================
// RECENTLY ADDED GRID SECTION (Matching mockup)
// =============================================================================



// =============================================================================
// TOP BAR (Legacy - kept for floating top bar on scroll)
// =============================================================================


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
    val lastOpenedCategory: String? = null,
    val hasConfiguredContentSource: Boolean = false,
    val showOnboardingTips: Boolean = false,
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


