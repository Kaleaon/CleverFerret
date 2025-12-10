package com.universalmedialibrary.ui.plex.screens

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
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Web Fiction Screen
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
fun PlexWebFictionScreen(
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
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
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
                contentColor = PlexColors.TextPrimary,
                indicator = { tabPositions ->
                    TabRowDefaults.SecondaryIndicator(
                        modifier = Modifier.tabIndicatorOffset(tabPositions[selectedTab]),
                        color = PlexColors.AccentPrimary
                    )
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
                                    style = PlexTypography.LabelLarge,
                                    color = if (selectedTab == index)
                                        PlexColors.AccentPrimary
                                    else
                                        PlexColors.TextSecondary
                                )
                                if (index == 1 && state.unreadUpdates > 0) {
                                    Spacer(modifier = Modifier.width(PlexSpacing.XS))
                                    Surface(
                                        shape = CircleShape,
                                        color = PlexColors.AccentPrimary
                                    ) {
                                        Text(
                                            text = state.unreadUpdates.toString(),
                                            style = PlexTypography.LabelSmall,
                                            color = Color.Black,
                                            fontWeight = FontWeight.Bold,
                                            modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = 2.dp)
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun WebFictionTopBar(
    onBackClick: () -> Unit,
    onRefresh: () -> Unit,
    onAddByUrl: () -> Unit,
    isRefreshing: Boolean
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.Article,
                    contentDescription = null,
                    tint = PlexColors.MediaTypes.Document,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(PlexSpacing.SM))
                Text(
                    text = "Web Fiction",
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
            if (isRefreshing) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    color = PlexColors.AccentPrimary,
                    strokeWidth = 2.dp
                )
                Spacer(modifier = Modifier.width(PlexSpacing.MD))
            } else {
                IconButton(onClick = onRefresh) {
                    Icon(
                        imageVector = Icons.Default.Refresh,
                        contentDescription = "Check for updates",
                        tint = PlexColors.TextSecondary
                    )
                }
            }
            IconButton(onClick = onAddByUrl) {
                Icon(
                    imageVector = Icons.Default.AddLink,
                    contentDescription = "Add by URL",
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
        contentPadding = PaddingValues(PlexSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
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
private fun WebFictionStoryCard(
    story: WebFictionStory,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(PlexSpacing.MD)
        ) {
            // Cover
            Surface(
                modifier = Modifier
                    .size(width = 80.dp, height = 120.dp)
                    .clip(RoundedCornerShape(PlexCorners.SM)),
                color = PlexColors.BackgroundSurface
            ) {
                if (story.coverUrl != null) {
                    AsyncImage(
                        model = story.coverUrl,
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Box(
                        contentAlignment = Alignment.Center,
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = Icons.Default.MenuBook,
                            contentDescription = null,
                            tint = story.source.color.copy(alpha = 0.5f),
                            modifier = Modifier.size(32.dp)
                        )
                    }
                }
                
                // Progress overlay
                if (story.readProgress > 0) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.BottomCenter
                    ) {
                        LinearProgressIndicator(
                            progress = { story.readProgress },
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(4.dp),
                            color = PlexColors.AccentPrimary,
                            trackColor = PlexColors.ProgressBackground
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.width(PlexSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                // Source badge
                Surface(
                    shape = RoundedCornerShape(PlexCorners.XS),
                    color = story.source.color.copy(alpha = 0.2f)
                ) {
                    Text(
                        text = story.source.displayName,
                        style = PlexTypography.LabelSmall,
                        color = story.source.color,
                        modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = 2.dp)
                    )
                }
                
                Spacer(modifier = Modifier.height(PlexSpacing.XS))
                
                // Title
                Text(
                    text = story.title,
                    style = PlexTypography.BodyLarge,
                    color = PlexColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                
                // Author
                Text(
                    text = "by ${story.author}",
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                
                // Stats row
                Row(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Chapter count
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.MenuBook,
                            contentDescription = null,
                            tint = PlexColors.TextTertiary,
                            modifier = Modifier.size(14.dp)
                        )
                        Spacer(modifier = Modifier.width(2.dp))
                        Text(
                            text = "${story.chapterCount} ch",
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                    }
                    
                    // Word count
                    if (story.wordCount != null) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                imageVector = Icons.Default.TextFields,
                                contentDescription = null,
                                tint = PlexColors.TextTertiary,
                                modifier = Modifier.size(14.dp)
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = formatWordCount(story.wordCount),
                                style = PlexTypography.LabelSmall,
                                color = PlexColors.TextTertiary
                            )
                        }
                    }
                    
                    // Status
                    story.status?.let { status ->
                        StatusBadge(status = status)
                    }
                }
                
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                
                // Tags (first few)
                if (story.tags.isNotEmpty()) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.XS),
                        modifier = Modifier.horizontalScroll(rememberScrollState())
                    ) {
                        story.tags.take(4).forEach { tag ->
                            Surface(
                                shape = RoundedCornerShape(PlexCorners.XS),
                                color = PlexColors.BackgroundSurface
                            ) {
                                Text(
                                    text = tag,
                                    style = PlexTypography.LabelSmall,
                                    color = PlexColors.TextTertiary,
                                    modifier = Modifier.padding(horizontal = PlexSpacing.XS, vertical = 2.dp)
                                )
                            }
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                
                // Update info
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    if (story.unreadChapters > 0) {
                        Surface(
                            shape = RoundedCornerShape(PlexCorners.XS),
                            color = PlexColors.AccentPrimary.copy(alpha = 0.2f)
                        ) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = PlexSpacing.XS)
                            ) {
                                Icon(
                                    imageVector = Icons.Default.NewReleases,
                                    contentDescription = null,
                                    tint = PlexColors.AccentPrimary,
                                    modifier = Modifier.size(14.dp)
                                )
                                Spacer(modifier = Modifier.width(PlexSpacing.XS))
                                Text(
                                    text = "${story.unreadChapters} new",
                                    style = PlexTypography.LabelSmall,
                                    color = PlexColors.AccentPrimary,
                                    fontWeight = FontWeight.SemiBold
                                )
                            }
                        }
                    } else {
                        Text(
                            text = "Updated ${story.lastUpdated}",
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextTertiary
                        )
                    }
                    
                    Text(
                        text = "${story.readChapters}/${story.chapterCount}",
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary
                    )
                }
            }
        }
    }
}

@Composable
private fun StatusBadge(status: StoryStatus) {
    Surface(
        shape = RoundedCornerShape(PlexCorners.XS),
        color = when (status) {
            StoryStatus.ONGOING -> PlexColors.Success.copy(alpha = 0.2f)
            StoryStatus.COMPLETED -> PlexColors.Info.copy(alpha = 0.2f)
            StoryStatus.HIATUS -> PlexColors.Warning.copy(alpha = 0.2f)
            StoryStatus.DROPPED -> PlexColors.Error.copy(alpha = 0.2f)
        }
    ) {
        Text(
            text = status.displayName,
            style = PlexTypography.LabelSmall,
            color = when (status) {
                StoryStatus.ONGOING -> PlexColors.Success
                StoryStatus.COMPLETED -> PlexColors.Info
                StoryStatus.HIATUS -> PlexColors.Warning
                StoryStatus.DROPPED -> PlexColors.Error
            },
            modifier = Modifier.padding(horizontal = PlexSpacing.XS, vertical = 1.dp)
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
        contentPadding = PaddingValues(vertical = PlexSpacing.SM),
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

@Composable
private fun UpdateItem(
    update: WebFictionUpdate,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.SM),
        verticalAlignment = Alignment.Top
    ) {
        // Story cover
        Surface(
            modifier = Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(PlexCorners.XS)),
            color = PlexColors.BackgroundSurface
        ) {
            if (update.storyCoverUrl != null) {
                AsyncImage(
                    model = update.storyCoverUrl,
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = Icons.Default.MenuBook,
                        contentDescription = null,
                        tint = update.source.color.copy(alpha = 0.5f),
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(PlexSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
            ) {
                Text(
                    text = update.storyTitle,
                    style = PlexTypography.LabelSmall,
                    color = update.source.color,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.weight(1f, fill = false)
                )
                
                if (!update.isRead) {
                    Box(
                        modifier = Modifier
                            .size(8.dp)
                            .background(PlexColors.AccentPrimary, CircleShape)
                    )
                }
            }
            
            Text(
                text = update.chapter.title,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextPrimary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                fontWeight = if (!update.isRead) FontWeight.SemiBold else FontWeight.Normal
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = update.timestamp,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextTertiary
                )
                
                update.chapter.wordCount?.let { words ->
                    Text("•", color = PlexColors.TextTertiary)
                    Text(
                        text = formatWordCount(words),
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
            }
        }
        
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = null,
            tint = PlexColors.TextTertiary,
            modifier = Modifier.size(20.dp)
        )
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
        contentPadding = PaddingValues(PlexSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
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

@Composable
private fun SourceCard(
    source: WebFictionSource,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(PlexSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Source icon
            Surface(
                shape = RoundedCornerShape(PlexCorners.SM),
                color = source.color.copy(alpha = 0.2f),
                modifier = Modifier.size(56.dp)
            ) {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = source.icon,
                        contentDescription = null,
                        tint = source.color,
                        modifier = Modifier.size(28.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(PlexSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = source.displayName,
                    style = PlexTypography.BodyLarge,
                    color = PlexColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = source.description,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextSecondary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(PlexSpacing.XS))
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
                ) {
                    source.categories.take(3).forEach { category ->
                        Surface(
                            shape = RoundedCornerShape(PlexCorners.XS),
                            color = PlexColors.BackgroundSurface
                        ) {
                            Text(
                                text = category,
                                style = PlexTypography.LabelSmall,
                                color = PlexColors.TextTertiary,
                                modifier = Modifier.padding(horizontal = PlexSpacing.XS, vertical = 1.dp)
                            )
                        }
                    }
                }
            }
            
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = null,
                tint = PlexColors.TextTertiary
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

data class WebFictionChapter(
    val id: String,
    val storyId: String,
    val title: String,
    val chapterNumber: Int,
    val wordCount: Long? = null,
    val publishedDate: String,
    val url: String
)

data class WebFictionUpdate(
    val storyId: String,
    val storyTitle: String,
    val storyCoverUrl: String?,
    val source: WebFictionSource,
    val chapter: WebFictionChapter,
    val timestamp: String,
    val isRead: Boolean = false
)

data class WebFictionSource(
    val id: String,
    val displayName: String,
    val description: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color,
    val categories: List<String>,
    val baseUrl: String,
    val supportsDownload: Boolean = true
) {
    companion object {
        val ROYAL_ROAD = WebFictionSource(
            id = "royalroad",
            displayName = "Royal Road",
            description = "Home of web serials, LitRPG, and progression fantasy",
            icon = Icons.Default.AutoStories,
            color = Color(0xFF2E7D32),  // Green
            categories = listOf("LitRPG", "Fantasy", "Sci-Fi"),
            baseUrl = "https://www.royalroad.com"
        )
        
        val AO3 = WebFictionSource(
            id = "ao3",
            displayName = "Archive of Our Own",
            description = "Fan-created works across all fandoms",
            icon = Icons.Default.Favorite,
            color = Color(0xFF990000),  // AO3 Red
            categories = listOf("Fanfiction", "Original Works"),
            baseUrl = "https://archiveofourown.org"
        )
        
        val FFN = WebFictionSource(
            id = "ffn",
            displayName = "FanFiction.Net",
            description = "The largest archive of fanfiction stories",
            icon = Icons.Default.MenuBook,
            color = Color(0xFF0066CC),  // FFN Blue
            categories = listOf("Anime", "Books", "Games", "Movies"),
            baseUrl = "https://www.fanfiction.net"
        )
        
        val WATTPAD = WebFictionSource(
            id = "wattpad",
            displayName = "Wattpad",
            description = "Social storytelling platform",
            icon = Icons.Default.Edit,
            color = Color(0xFFFF500A),  // Wattpad Orange
            categories = listOf("Romance", "Teen Fiction", "Werewolf"),
            baseUrl = "https://www.wattpad.com"
        )
        
        val SCRIBBLEHUB = WebFictionSource(
            id = "scribblehub",
            displayName = "ScribbleHub",
            description = "Reading and writing community for web novels",
            icon = Icons.Default.Create,
            color = Color(0xFF9C27B0),  // Purple
            categories = listOf("Fantasy", "Isekai", "LitRPG"),
            baseUrl = "https://www.scribblehub.com"
        )
        
        val SPACEBATTLES = WebFictionSource(
            id = "spacebattles",
            displayName = "SpaceBattles",
            description = "Forums for creative writing and discussion",
            icon = Icons.Default.RocketLaunch,
            color = Color(0xFF455A64),  // Blue Grey
            categories = listOf("Crossover", "Alt-History", "Sci-Fi"),
            baseUrl = "https://forums.spacebattles.com"
        )
    }
}

enum class StoryStatus(val displayName: String) {
    ONGOING("Ongoing"),
    COMPLETED("Completed"),
    HIATUS("Hiatus"),
    DROPPED("Dropped")
}
