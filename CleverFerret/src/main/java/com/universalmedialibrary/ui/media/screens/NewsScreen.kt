package com.universalmedialibrary.ui.media.screens

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
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric News Screen
 * 
 * Calibre-style news recipe integration:
 * - Download news from various sources
 * - Multiple recipe support
 * - Scheduled downloads
 * - Offline reading
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NewsScreen(
    state: NewsScreenState,
    onArticleClick: (NewsArticle) -> Unit,
    onFeedSelect: (NewsFeed) -> Unit,
    onRefresh: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showAddRecipeDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
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
                contentPadding = PaddingValues(vertical = MediaSpacing.MD)
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
                                .padding(MediaSpacing.MD),
                            contentAlignment = Alignment.Center
                        ) {
                            CircularProgressIndicator(
                                color = MediaColors.AccentPrimary,
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
                    tint = MediaColors.MediaTypes.Document,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "News",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(Icons.Default.ArrowBack, "Back", tint = MediaColors.TextPrimary)
            }
        },
        actions = {
            IconButton(onClick = onRefresh) {
                Icon(Icons.Default.Refresh, "Refresh", tint = MediaColors.TextSecondary)
            }
            IconButton(onClick = onAddRecipe) {
                Icon(Icons.Default.Add, "Add Recipe", tint = MediaColors.TextSecondary)
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
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
        contentPadding = PaddingValues(horizontal = MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
    ) {
        item {
            FilterChip(
                selected = selectedFeed == null,
                onClick = { onFeedSelect(NewsFeed.ALL) },
                label = { Text("All") },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                    selectedLabelColor = MediaColors.AccentPrimary
                )
            )
        }
        items(feeds) { feed ->
            FilterChip(
                selected = selectedFeed?.id == feed.id,
                onClick = { onFeedSelect(feed) },
                label = { Text(feed.name) },
                colors = FilterChipDefaults.filterChipColors(
                    selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                    selectedLabelColor = MediaColors.AccentPrimary
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
            .padding(MediaSpacing.MD)
            .clip(RoundedCornerShape(MediaCorners.LG))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
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
                        contentDescription = "Media image",
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Surface(
                        color = MediaColors.BackgroundSurface,
                        modifier = Modifier.fillMaxSize()
                    ) {
                        Icon(
                            imageVector = Icons.Default.Article,
                            contentDescription = null,
                            tint = MediaColors.TextTertiary,
                            modifier = Modifier
                                .size(64.dp)
                                .align(Alignment.Center)
                        )
                    }
                }
                
                // Feed badge
                Surface(
                    shape = RoundedCornerShape(MediaCorners.XS),
                    color = Color.Black.copy(alpha = 0.7f),
                    modifier = Modifier
                        .align(Alignment.TopStart)
                        .padding(MediaSpacing.SM)
                ) {
                    Text(
                        text = article.feedName,
                        style = MediaTypography.LabelSmall,
                        color = Color.White,
                        modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp)
                    )
                }
            }
            
            // Content
            Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                Text(
                    text = article.title,
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.SemiBold
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                article.summary?.let { summary ->
                    Text(
                        text = summary,
                        style = MediaTypography.BodySmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 3,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = article.publishedDate,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                    
                    if (article.isDownloaded) {
                        Icon(
                            imageVector = Icons.Default.OfflinePin,
                            contentDescription = "Downloaded",
                            tint = MediaColors.Success,
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
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.XS)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.Top
        ) {
            // Thumbnail
            Surface(
                modifier = Modifier
                    .size(80.dp)
                    .clip(RoundedCornerShape(MediaCorners.SM)),
                color = MediaColors.BackgroundSurface
            ) {
                if (article.imageUrl != null) {
                    AsyncImage(
                    
                        model = article.imageUrl,
                        contentDescription = "Media image",
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Icon(
                        imageVector = Icons.Default.Article,
                        contentDescription = null,
                        tint = MediaColors.TextTertiary,
                        modifier = Modifier.padding(MediaSpacing.MD)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = article.title,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.XS))
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = article.feedName,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.AccentPrimary
                    )
                    Text("•", color = MediaColors.TextTertiary)
                    Text(
                        text = article.publishedDate,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
                
                article.summary?.let { summary ->
                    Spacer(modifier = Modifier.height(MediaSpacing.XS))
                    Text(
                        text = summary,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
            
            if (article.isDownloaded) {
                Icon(
                    imageVector = Icons.Default.OfflinePin,
                    contentDescription = "Downloaded",
                    tint = MediaColors.Success,
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
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Newspaper,
            contentDescription = null,
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = "No News Sources",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = "Add news recipes to download articles",
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Button(
            onClick = onAddRecipe,
            colors = ButtonDefaults.buttonColors(
                containerColor = MediaColors.AccentPrimary
            )
        ) {
            Icon(Icons.Default.Add, null)
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
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
        title = { Text("Add News Recipe", color = MediaColors.TextPrimary) },
        text = {
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                items(recipes) { recipe ->
                    Surface(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(MediaCorners.SM))
                            .clickable { onAddRecipe(recipe) },
                        color = MediaColors.BackgroundSurface
                    ) {
                        Row(
                            modifier = Modifier.padding(MediaSpacing.MD),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.RssFeed,
                                contentDescription = null,
                                tint = MediaColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.width(MediaSpacing.MD))
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = recipe.name,
                                    style = MediaTypography.BodyMedium,
                                    color = MediaColors.TextPrimary
                                )
                                Text(
                                    text = recipe.description,
                                    style = MediaTypography.LabelSmall,
                                    color = MediaColors.TextSecondary
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
        containerColor = MediaColors.BackgroundElevated
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
