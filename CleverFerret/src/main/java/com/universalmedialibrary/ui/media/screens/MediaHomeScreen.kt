package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AutoStories
import androidx.compose.material.icons.filled.CloudDownload
import androidx.compose.material.icons.filled.Collections
import androidx.compose.material.icons.filled.Description
import androidx.compose.material.icons.filled.Headphones
import androidx.compose.material.icons.filled.KeyboardArrowDown
import androidx.compose.material.icons.filled.KeyboardArrowUp
import androidx.compose.material.icons.filled.Language
import androidx.compose.material.icons.filled.MenuBook
import androidx.compose.material.icons.filled.Movie
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material.icons.filled.Podcasts
import androidx.compose.material.icons.filled.Radio
import androidx.compose.material.icons.filled.Spa
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.filled.StarBorder
import androidx.compose.material.icons.filled.Tv
import androidx.compose.material3.BorderStroke
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.runtime.Composable
import androidx.compose.runtime.derivedStateOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.isTraversalGroup
import androidx.compose.ui.semantics.role
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.MediaItem
import com.universalmedialibrary.ui.media.navigation.HomeSectionRouteContract
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.theme.MediaColors
import com.universalmedialibrary.ui.media.theme.MediaCorners
import com.universalmedialibrary.ui.media.theme.MediaSizes
import com.universalmedialibrary.ui.media.theme.MediaSpacing
import com.universalmedialibrary.ui.media.theme.MediaTypography
import com.universalmedialibrary.ui.media.theme.isReducedMotionEnabled

@OptIn(ExperimentalMaterial3Api::class)
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
    val shouldReduceMotion = reduceMotionEnabled || isReducedMotionEnabled()
    val scrollState = rememberLazyListState()
    val showFloatingTopBar by remember {
        derivedStateOf { scrollState.firstVisibleItemIndex > 0 }
    }
    val heroCarouselPagerState = rememberPagerState(
        pageCount = { state.featuredItems.size.coerceAtLeast(1) }
    )
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
            state.collections.isEmpty() &&
            state.libraryStats.totalBooks == 0 &&
            state.libraryStats.totalMusic == 0 &&
            state.libraryStats.totalAudiobooks == 0 &&
            state.libraryStats.totalVideos == 0 &&
            state.libraryStats.totalComics == 0 &&
            state.libraryStats.totalPodcasts == 0 &&
            state.libraryStats.totalFanfiction == 0
    }
    val recentlyAddedItems = remember(state) {
        (
            state.recentBooks.take(2) +
                state.recentMusic.take(1) +
                state.recentVideos.take(2) +
                state.recentComics.take(1) +
                state.recentPodcasts.take(1) +
                state.recentAudiobooks.take(1)
            ).take(6)
    }
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
                add(EmptySectionHint("Web Fiction", MediaRoutes.WEB_FICTION, Icons.Default.Language))
            }
        }
    }

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
            when {
                state.error != null -> {
                    ErrorStateContent(
                        error = state.error,
                        onRetry = onRetry,
                        modifier = Modifier.align(Alignment.Center)
                    )
                }

                state.isLoading -> {
                    LoadingStateContent(modifier = Modifier.fillMaxSize())
                }

                else -> {
                    PullToRefreshBox(
                        isRefreshing = isRefreshing,
                        onRefresh = onRefresh,
                        modifier = Modifier.fillMaxSize()
                    ) {
                        LazyColumn(
                            state = scrollState,
                            modifier = Modifier.fillMaxSize(),
                            contentPadding = PaddingValues(bottom = MediaSpacing.Huge)
                        ) {
                            if (isLibraryEmpty || state.showOnboardingTips) {
                                item(key = "welcome") {
                                    WelcomeSection(
                                        onSearchClick = onSearchClick,
                                        onBrowseClick = { onSeeAllClick(MediaRoutes.OPDS_BROWSER) },
                                        onAddLocalFilesClick = onAddLocalFilesClick,
                                        onSubscribePodcastsClick = onSubscribePodcastsClick,
                                        canDismiss = state.showOnboardingTips && state.hasConfiguredContentSource,
                                        onDismiss = onDismissWelcomeTips
                                    )
                                }
                            }

                            if (state.featuredItems.isNotEmpty()) {
                                item(key = "hero-carousel") {
                                    HeroCarousel(
                                        items = state.featuredItems,
                                        pagerState = heroCarouselPagerState,
                                        onItemClick = onItemClick,
                                        onPlayClick = onPlayClick,
                                        autoAdvanceEnabled = !shouldReduceMotion
                                    )
                                }
                            }

                            if (!isLibraryEmpty) {
                                item(key = "quick-stats") {
                                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                                    QuickStatsRow(stats = state.libraryStats)
                                }
                            }

                            if (state.continueItems.isNotEmpty()) {
                                item(key = "continue-section") {
                                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                                    ContinueWatchingRow(
                                        title = "Continue",
                                        items = state.continueItems,
                                        onSeeAllClick = { onSeeAllClick(MediaRoutes.SEARCH) },
                                        onItemClick = onItemClick
                                    )
                                }
                            }

                            if (recentlyAddedItems.isNotEmpty()) {
                                item(key = "recently-added") {
                                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                                    RecentlyAddedGridSection(
                                        title = "Recently Added",
                                        items = recentlyAddedItems,
                                        onItemClick = onItemClick
                                    )
                                }
                            }

                            if (!isLibraryEmpty && emptySections.isNotEmpty()) {
                                item(key = "empty-guidance") {
                                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                                    EmptySectionGuidanceRow(
                                        emptySections = emptySections,
                                        onSectionClick = onSeeAllClick
                                    )
                                }
                            }

                            if (state.recentComics.isNotEmpty()) {
                                item(key = "recent-comics") {
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

                            if (state.recentFanfiction.isNotEmpty()) {
                                item(key = "recent-fanfiction") {
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

                            if (state.collections.isNotEmpty()) {
                                item(key = "collections") {
                                    Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                                    CollectionsSection(
                                        collections = state.collections,
                                        onCollectionClick = { onSeeAllClick(MediaRoutes.collectionDetailRoute(it.id)) }
                                    )
                                }
                            }

                            item(key = "quick-access") {
                                Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
                                QuickAccessGrid(
                                    items = state.quickAccessItems,
                                    lastOpenedCategory = state.lastOpenedCategory,
                                    onCategoryClick = onQuickAccessCategoryClick,
                                    onPreferencesChange = onQuickAccessPreferencesChange
                                )
                            }
                        }
                    }
                }
            }

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
}

@Composable
private fun ErrorStateContent(
    error: String,
    onRetry: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .padding(MediaSpacing.ScreenHorizontal)
            .fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
    ) {
        Text(
            text = "We couldn’t load your library",
            style = MediaTypography.TitleLarge,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = error,
            style = MediaTypography.BodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Button(onClick = onRetry) {
            Text("Try again")
        }
    }
}

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
        item { HeroSkeletonRow(brush = shimmerBrush) }
        item { QuickStatsSkeletonRow(brush = shimmerBrush) }
        item {
            Spacer(modifier = Modifier.height(MediaSpacing.SectionGap))
            QuickAccessSkeletonGrid(brush = shimmerBrush)
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
    }
}

@Composable
private fun QuickAccessGrid(
    items: List<QuickAccessItem>,
    lastOpenedCategory: String?,
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
            TextButton(
                onClick = {
                    if (reorderMode) {
                        onPreferencesChange(
                            editableItems.map { it.id },
                            editableItems.filter { it.isFavorite }.mapTo(mutableSetOf()) { it.id }
                        )
                    }
                    reorderMode = !reorderMode
                }
            ) {
                Text(if (reorderMode) "Done" else "Customize")
            }
        }

        if (reorderMode) {
            Text(
                text = "Use the arrow buttons to reorder shortcuts and the star to pin favorites.",
                style = MediaTypography.BodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
        }

        Spacer(modifier = Modifier.height(MediaSpacing.MD))

        QuickAccessFlowGrid(
            items = editableItems,
            lastOpenedCategory = lastOpenedCategory,
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
    val cardContentDescription = stringResource(R.string.cd_open_category, item.label)
    val quickAccessAlphas = MediaColors.quickAccessCardAlphas()

    Surface(
        modifier = modifier
            .aspectRatio(1f)
            .semantics {
                role = Role.Button
                contentDescription = cardContentDescription
            }
            .combinedClickable(
                role = Role.Button,
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
                            tint = if (item.isFavorite) {
                                MaterialTheme.colorScheme.primary
                            } else {
                                MaterialTheme.colorScheme.onSurfaceVariant
                            }
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
                style = MediaTypography.LabelLarge,
                color = MaterialTheme.colorScheme.onSurface,
                fontWeight = FontWeight.SemiBold
            )
        }
    }
}
