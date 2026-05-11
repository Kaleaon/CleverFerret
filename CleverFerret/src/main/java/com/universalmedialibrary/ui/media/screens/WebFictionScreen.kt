package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
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

/**
 * Clean Media-Centric Web Fiction Screen
 * 
 * Manages web serials and fanfiction from multiple sources:
 * - Royal Road
 * - Archive of Our Own (AO3)
 * - FanFiction.Net
 * - Wattpad
 * - SpaceBattles/SufficientVelocity
 * - And more...
 * 
 * Features:
 * - Chapter tracking & notifications
 * - Offline reading with download
 * - Source browser integration
 * - Parental controls
 * - Reading progress sync
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun WebFictionScreen(
    state: WebFictionScreenState,
    onStoryClick: (WebFictionStory) -> Unit,
    onChapterClick: (WebFictionChapter) -> Unit,
    onSourceClick: (WebFictionSource) -> Unit,
    onRefresh: () -> Unit,
    onAddByUrl: () -> Unit,
    onBrowseSource: (WebFictionSource) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var selectedTab by remember { mutableStateOf(0) }
    val tabs = listOf("Following", "Recent Updates", "Browse")
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            WebFictionTopBar(
                onBackClick = onBackClick,
                onRefresh = onRefresh,
                onAddByUrl = onAddByUrl,
                isRefreshing = state.isRefreshing
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Tab row
            TabRow(
                selectedTabIndex = selectedTab,
                containerColor = Color.Transparent,
                contentColor = MediaColors.TextPrimary,
                indicator = { tabPositions ->
                    if (tabPositions.isNotEmpty() && selectedTab < tabPositions.size) {
                        TabRowDefaults.SecondaryIndicator(
                            modifier = Modifier
                                .fillMaxWidth()
                                .wrapContentSize(Alignment.BottomStart)
                                .offset(x = tabPositions[selectedTab].left)
                                .width(tabPositions[selectedTab].width),
                            color = MediaColors.AccentPrimary
                        )
                    }
                },
                divider = {}
            ) {
                tabs.forEachIndexed { index, title ->
                    Tab(
                        selected = selectedTab == index,
                        onClick = { selectedTab = index },
                        text = {
                            Row(verticalAlignment = Alignment.CenterVertically) {
                                Text(
                                    text = title,
                                    style = MediaTypography.LabelLarge,
                                    color = if (selectedTab == index)
                                        MediaColors.AccentPrimary
                                    else
                                        MediaColors.TextSecondary
                                )
                                if (index == 1 && state.unreadUpdates > 0) {
                                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                                    Surface(
                                        shape = CircleShape,
                                        color = MediaColors.AccentPrimary
                                    ) {
                                        Text(
                                            text = state.unreadUpdates.toString(),
                                            style = MediaTypography.LabelSmall,
                                            color = Color.Black,
                                            fontWeight = FontWeight.Bold,
                                            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
                                        )
                                    }
                                }
                            }
                        }
                    )
                }
            }
            
            // Content
            when (selectedTab) {
                0 -> FollowingStoriesPage(
                    stories = state.followedStories,
                    onStoryClick = onStoryClick
                )
                1 -> RecentUpdatesPage(
                    updates = state.recentUpdates,
                    onChapterClick = onChapterClick
                )
                2 -> BrowseSourcesPage(
                    sources = state.sources,
                    onSourceClick = onBrowseSource
                )
            }
        }
    }
}

// =============================================================================
// TOP BAR
// =============================================================================


// =============================================================================
// FOLLOWING PAGE
// =============================================================================

@Composable
private fun FollowingStoriesPage(
    stories: List<WebFictionStory>,
    onStoryClick: (WebFictionStory) -> Unit
) {
    if (stories.isEmpty()) {
        WebFictionEmptyState(
            icon = Icons.Outlined.BookmarkBorder,
            title = "Not following any stories",
            subtitle = "Browse sources or add by URL to start following"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items = stories, key = { it.id }) { story ->
            WebFictionStoryCard(
                story = story,
                onClick = { onStoryClick(story) }
            )
        }
    }
}


@Composable
private fun StatusBadge(status: StoryStatus) {
    Surface(
        shape = RoundedCornerShape(MediaCorners.XS),
        color = when (status) {
            StoryStatus.ONGOING -> MediaColors.Success.copy(alpha = 0.2f)
            StoryStatus.COMPLETED -> MediaColors.Info.copy(alpha = 0.2f)
            StoryStatus.HIATUS -> MediaColors.Warning.copy(alpha = 0.2f)
            StoryStatus.DROPPED -> MediaColors.Error.copy(alpha = 0.2f)
        }
    ) {
        Text(
            text = status.displayName,
            style = MediaTypography.LabelSmall,
            color = when (status) {
                StoryStatus.ONGOING -> MediaColors.Success
                StoryStatus.COMPLETED -> MediaColors.Info
                StoryStatus.HIATUS -> MediaColors.Warning
                StoryStatus.DROPPED -> MediaColors.Error
            },
            modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 1.dp)
        )
    }
}

private fun formatWordCount(count: Long): String {
    return when {
        count >= 1_000_000 -> "%.1fM words".format(count / 1_000_000.0)
        count >= 1_000 -> "%.1fK words".format(count / 1_000.0)
        else -> "$count words"
    }
}

// =============================================================================
// RECENT UPDATES PAGE
// =============================================================================

@Composable
private fun RecentUpdatesPage(
    updates: List<WebFictionUpdate>,
    onChapterClick: (WebFictionChapter) -> Unit
) {
    if (updates.isEmpty()) {
        WebFictionEmptyState(
            icon = Icons.Outlined.Update,
            title = "No recent updates",
            subtitle = "Check back later for new chapters"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.SM),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items = updates, key = { it.chapter.id }) { update ->
            UpdateItem(
                update = update,
                onClick = { onChapterClick(update.chapter) }
            )
        }
    }
}


// =============================================================================
// BROWSE SOURCES PAGE
// =============================================================================

@Composable
private fun BrowseSourcesPage(
    sources: List<WebFictionSource>,
    onSourceClick: (WebFictionSource) -> Unit
) {
    if (sources.isEmpty()) {
        WebFictionEmptyState(
            icon = Icons.Outlined.Explore,
            title = "No sources available",
            subtitle = "Sources will appear here when configured"
        )
        return
    }
    
    LazyColumn(
        contentPadding = PaddingValues(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        items(items = sources, key = { it.id }) { source ->
            SourceCard(
                source = source,
                onClick = { onSourceClick(source) }
            )
        }
    }
}


// =============================================================================
// EMPTY STATE
// =============================================================================

@Composable
private fun WebFictionEmptyState(
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

data class WebFictionScreenState(
    val followedStories: List<WebFictionStory> = emptyList(),
    val recentUpdates: List<WebFictionUpdate> = emptyList(),
    val sources: List<WebFictionSource> = emptyList(),
    val unreadUpdates: Int = 0,
    val isRefreshing: Boolean = false
)

data class WebFictionStory(
    val id: String,
    val title: String,
    val author: String,
    val coverUrl: String?,
    val description: String?,
    val source: WebFictionSource,
    val chapterCount: Int,
    val readChapters: Int = 0,
    val unreadChapters: Int = 0,
    val wordCount: Long? = null,
    val status: StoryStatus? = null,
    val tags: List<String> = emptyList(),
    val readProgress: Float = 0f,
    val lastUpdated: String,
    val url: String
)


enum class StoryStatus(val displayName: String) {
    ONGOING("Ongoing"),
    COMPLETED("Completed"),
    HIATUS("Hiatus"),
    DROPPED("Dropped")
}
