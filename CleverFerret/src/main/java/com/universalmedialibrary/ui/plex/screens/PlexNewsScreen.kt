package com.universalmedialibrary.ui.plex.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style News Screen
 * 
 * Calibre-style news recipe integration:
 * - Download news from various sources
 * - Multiple recipe support
 * - Scheduled downloads
 * - Offline reading
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexNewsScreen(
    state: NewsScreenState,
    onArticleClick: (NewsArticle) -> Unit,
    onFeedSelect: (NewsFeed) -> Unit,
    onRefresh: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showAddRecipeDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
        topBar = {
            NewsTopBar(
                onBackClick = onBackClick,
                onRefresh = onRefresh,
                onAddRecipe = { showAddRecipeDialog = true }
            )
        }
    ) { paddingValues ->
        if (state.feeds.isEmpty() && state.articles.isEmpty()) {
            NewsEmptyState(
                onAddRecipe = { showAddRecipeDialog = true }
            )
        } else {
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentPadding = PaddingValues(vertical = PlexSpacing.MD)
            ) {
                // Feed chips
                item {
                    FeedFilterRow(
                        feeds = state.feeds,
                        selectedFeed = state.selectedFeed,
                        onFeedSelect = onFeedSelect
                    )
                }
                
                // Loading indicator
                if (state.isLoading) {
                    item {
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(PlexSpacing.MD),
                            contentAlignment = Alignment.Center
                        ) {
                            CircularProgressIndicator(
                                color = PlexColors.AccentPrimary,
                                modifier = Modifier.size(24.dp)
                            )
                        }
                    }
                }
                
                // Featured article (first article)
                state.articles.firstOrNull()?.let { featured ->
                    item {
                        FeaturedArticleCard(
                            article = featured,
                            onClick = { onArticleClick(featured) }
                        )
                    }
                }
                
                // Rest of articles
                items(state.articles.drop(1)) { article ->
                    NewsArticleCard(
                        article = article,
                        onClick = { onArticleClick(article) }
                    )
                }
            }
        }
    }
    
    if (showAddRecipeDialog) {
        AddRecipeDialog(
            recipes = state.availableRecipes,
            onDismiss = { showAddRecipeDialog = false },
            onAddRecipe = { recipe -> /* Add recipe */ }
        )
    }
}

// =============================================================================
// TOP BAR
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun NewsTopBar(
    onBackClick: () -> Unit,
    onRefresh: () -> Unit,
    onAddRecipe: () -> Unit
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.Newspaper,
                    contentDescription = null,
                    tint = PlexColors.MediaTypes.Document,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(PlexSpacing.SM))
                Text(
                    text = "News",
                    style = PlexTypography.TitleMedium,
                    color = PlexColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(Icons.Default.ArrowBack, "Back", tint = PlexColors.TextPrimary)
            }
        },
        actions = {
            IconButton(onClick = onRefresh) {
                Icon(Icons.Default.Refresh, "Refresh", tint = PlexColors.TextSecondary)
            }
            IconButton(onClick = onAddRecipe) {
                Icon(Icons.Default.Add, "Add Recipe", tint = PlexColors.TextSecondary)
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = PlexColors.BackgroundElevated
        )
    )
}

// =============================================================================
// FEED FILTER
// =============================================================================

@Composable
private fun FeedFilterRow(
    feeds: List<NewsFeed>,
    selectedFeed: NewsFeed?,
    onFeedSelect: (NewsFeed) -> Unit
) {
    LazyRow(
        contentPadding = PaddingValues(horizontal = PlexSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
    ) {
        item {
            FilterChip(
                selected = selectedFeed == null,
                onClick = { onFeedSelect(NewsFeed.ALL) },
                label = { Text("All") },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = PlexColors.AccentPrimary.copy(alpha = 0.2f),
                    selectedLabelColor = PlexColors.AccentPrimary
                )
            )
        }
        items(feeds) { feed ->
            FilterChip(
                selected = selectedFeed?.id == feed.id,
                onClick = { onFeedSelect(feed) },
                label = { Text(feed.name) },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = PlexColors.AccentPrimary.copy(alpha = 0.2f),
                    selectedLabelColor = PlexColors.AccentPrimary
                )
            )
        }
    }
}

// =============================================================================
// ARTICLE CARDS
// =============================================================================

@Composable
private fun FeaturedArticleCard(
    article: NewsArticle,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(PlexSpacing.MD)
            .clip(RoundedCornerShape(PlexCorners.LG))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Column {
            // Image
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp)
            ) {
                if (article.imageUrl != null) {
                    AsyncImage(
                        model = article.imageUrl,
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Surface(
                        color = PlexColors.BackgroundSurface,
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = Icons.Default.Article,
                            contentDescription = null,
                            tint = PlexColors.TextTertiary,
                            modifier = Modifier
                                .size(64.dp)
                                .align(Alignment.Center)
                        )
                    }
                }
                
                // Feed badge
                Surface(
                    shape = RoundedCornerShape(PlexCorners.XS),
                    color = Color.Black.copy(alpha = 0.7f),
                    modifier = Modifier
                        .align(Alignment.TopStart)
                        .padding(PlexSpacing.SM)
                ) {
                    Text(
                        text = article.feedName,
                        style = PlexTypography.LabelSmall,
                        color = Color.White,
                        modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = 2.dp)
                    )
                }
            }
            
            // Content
            Column(modifier = Modifier.padding(PlexSpacing.MD)) {
                Text(
                    text = article.title,
                    style = PlexTypography.TitleSmall,
                    color = PlexColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.SemiBold
                )
                
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                
                article.summary?.let { summary ->
                    Text(
                        text = summary,
                        style = PlexTypography.BodySmall,
                        color = PlexColors.TextSecondary,
                        maxLines = 3,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                Spacer(modifier = Modifier.height(PlexSpacing.SM))
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = article.publishedDate,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                    
                    if (article.isDownloaded) {
                        Icon(
                            imageVector = Icons.Default.OfflinePin,
                            contentDescription = "Downloaded",
                            tint = PlexColors.Success,
                            modifier = Modifier.size(16.dp)
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun NewsArticleCard(
    article: NewsArticle,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = PlexSpacing.MD, vertical = PlexSpacing.XS)
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(PlexSpacing.MD),
            verticalAlignment = Alignment.Top
        ) {
            // Thumbnail
            Surface(
                modifier = Modifier
                    .size(80.dp)
                    .clip(RoundedCornerShape(PlexCorners.SM)),
                color = PlexColors.BackgroundSurface
            ) {
                if (article.imageUrl != null) {
                    AsyncImage(
                        model = article.imageUrl,
                        contentDescription = null,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Icon(
                        imageVector = Icons.Default.Article,
                        contentDescription = null,
                        tint = PlexColors.TextTertiary,
                        modifier = Modifier.padding(PlexSpacing.MD)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(PlexSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = article.title,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                
                Spacer(modifier = Modifier.height(PlexSpacing.XS))
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = article.feedName,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.AccentPrimary
                    )
                    Text("•", color = PlexColors.TextTertiary)
                    Text(
                        text = article.publishedDate,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary
                    )
                }
                
                article.summary?.let { summary ->
                    Spacer(modifier = Modifier.height(PlexSpacing.XS))
                    Text(
                        text = summary,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
            
            if (article.isDownloaded) {
                Icon(
                    imageVector = Icons.Default.OfflinePin,
                    contentDescription = "Downloaded",
                    tint = PlexColors.Success,
                    modifier = Modifier.size(16.dp)
                )
            }
        }
    }
}

// =============================================================================
// EMPTY STATE
// =============================================================================

@Composable
private fun NewsEmptyState(
    onAddRecipe: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Newspaper,
            contentDescription = null,
            tint = PlexColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = "No News Sources",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = "Add news recipes to download articles",
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Button(
            onClick = onAddRecipe,
            colors = ButtonDefaults.buttonColors(
                containerColor = PlexColors.AccentPrimary
            )
        ) {
            Icon(Icons.Default.Add, null)
            Spacer(modifier = Modifier.width(PlexSpacing.SM))
            Text("Add News Recipe")
        }
    }
}

// =============================================================================
// DIALOGS
// =============================================================================

@Composable
private fun AddRecipeDialog(
    recipes: List<NewsRecipe>,
    onDismiss: () -> Unit,
    onAddRecipe: (NewsRecipe) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add News Recipe", color = PlexColors.TextPrimary) },
        text = {
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
            ) {
                items(recipes) { recipe ->
                    Surface(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(PlexCorners.SM))
                            .clickable { onAddRecipe(recipe) },
                        color = PlexColors.BackgroundSurface
                    ) {
                        Row(
                            modifier = Modifier.padding(PlexSpacing.MD),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.RssFeed,
                                contentDescription = null,
                                tint = PlexColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.width(PlexSpacing.MD))
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = recipe.name,
                                    style = PlexTypography.BodyMedium,
                                    color = PlexColors.TextPrimary
                                )
                                Text(
                                    text = recipe.description,
                                    style = PlexTypography.LabelSmall,
                                    color = PlexColors.TextSecondary
                                )
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {},
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = PlexColors.BackgroundElevated
    )
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class NewsScreenState(
    val feeds: List<NewsFeed> = emptyList(),
    val selectedFeed: NewsFeed? = null,
    val articles: List<NewsArticle> = emptyList(),
    val availableRecipes: List<NewsRecipe> = emptyList(),
    val isLoading: Boolean = false
)

data class NewsFeed(
    val id: String,
    val name: String,
    val iconUrl: String? = null
) {
    companion object {
        val ALL = NewsFeed(id = "all", name = "All")
    }
}

data class NewsArticle(
    val id: String,
    val title: String,
    val summary: String?,
    val content: String?,
    val imageUrl: String?,
    val feedName: String,
    val feedId: String,
    val publishedDate: String,
    val isDownloaded: Boolean = false,
    val isRead: Boolean = false
)

data class NewsRecipe(
    val id: String,
    val name: String,
    val description: String,
    val url: String
)
