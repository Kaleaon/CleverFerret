package com.universalmedialibrary.ui.home

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.components.AncientArchitectElevatedCard
import com.universalmedialibrary.ui.components.AncientArchitectCard
import com.universalmedialibrary.ui.theme.AncientArchitectShapes
import com.universalmedialibrary.ui.theme.LocalIsAncientArchitect
import com.universalmedialibrary.ui.theme.ancientArchitectColors

/**
 * Home Screen - Dashboard
 * 
 * Showcase, Search, and Recent Items.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(
    onNavigateToMedia: (String, Long) -> Unit,
    onNavigateToSearch: () -> Unit,
    onNavigateToSettings: () -> Unit,
    onNavigateToLibrary: () -> Unit,
    viewModel: HomeViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val isAncientArchitect = LocalIsAncientArchitect.current
    
    Box(modifier = Modifier.fillMaxSize()) {
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .statusBarsPadding(), // Handle status bar padding
            contentPadding = PaddingValues(bottom = 80.dp), // Space for bottom bar
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Top Space for Search and Settings
            item {
                Spacer(modifier = Modifier.height(16.dp))
            }

            // Search Bar Section
            item {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp)
                ) {
                    SearchBarButton(onClick = onNavigateToSearch)
                }
            }

            // Showcase Section
            uiState.showcaseItem?.let { showcase ->
                item {
                    Column(modifier = Modifier.padding(horizontal = 16.dp)) {
                        Text(
                            text = "Featured",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier.padding(bottom = 12.dp)
                        )
                        ShowcaseCard(
                            item = showcase,
                            onClick = { onNavigateToMedia(showcase.type, showcase.id) }
                        )
                    }
                }
            } ?: item {
                 // Fallback/Welcome if no showcase
                 if (!uiState.isLoading) {
                     WelcomeSection(userName = uiState.userName ?: "Traveler")
                 }
            }
            
            // Continue Reading Section
            if (uiState.continueItems.isNotEmpty()) {
                item {
                    Column {
                        SectionHeader(
                            title = "Continue Reading",
                            icon = Icons.Default.AutoStories,
                            modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp)
                        )
                        LazyRow(
                            contentPadding = PaddingValues(horizontal = 16.dp),
                            horizontalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            items(uiState.continueItems) { item ->
                                MediaItemCard(
                                    item = item,
                                    onClick = { onNavigateToMedia(item.type, item.id) }
                                )
                            }
                        }
                    }
                }
            }
            
            // Recently Added (using Recent Items from VM which we need to populate)
            if (uiState.recentItems.isNotEmpty()) {
                 item {
                    Column {
                        SectionHeader(
                            title = "Recently Added",
                            icon = Icons.Default.NewReleases,
                            modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp)
                        )
                        LazyRow(
                            contentPadding = PaddingValues(horizontal = 16.dp),
                            horizontalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            items(uiState.recentItems) { item ->
                                MediaItemCard(
                                    item = item,
                                    onClick = { onNavigateToMedia(item.type, item.id) }
                                )
                            }
                        }
                    }
                }
            }
        }

        // Floating Settings Gear (Top Right)
        IconButton(
            onClick = onNavigateToSettings,
            modifier = Modifier
                .align(Alignment.TopEnd)
                .statusBarsPadding() // Ensure it doesn't clip under status bar
                .padding(16.dp)
                .size(48.dp)
        ) {
            // Use a themed surface/background for visibility
            Surface(
                shape = if (isAncientArchitect) AncientArchitectShapes.beveledSmall else MaterialTheme.shapes.small,
                color = MaterialTheme.colorScheme.surface.copy(alpha = 0.7f),
                modifier = Modifier.fillMaxSize(),
                tonalElevation = 4.dp
            ) {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = Icons.Default.Settings,
                        contentDescription = "Settings",
                        tint = MaterialTheme.colorScheme.onSurface
                    )
                }
            }
        }
        
        if (uiState.isLoading) {
            CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
        }
    }
}

@Composable
fun SearchBarButton(onClick: () -> Unit) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .height(56.dp)
            .padding(end = 64.dp) // Space for settings gear
            .clickable(onClick = onClick),
        shape = if (LocalIsAncientArchitect.current) AncientArchitectShapes.beveledSmall else RoundedCornerShape(28.dp),
        color = MaterialTheme.colorScheme.surfaceVariant,
        tonalElevation = 2.dp
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.padding(horizontal = 16.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Search,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.width(16.dp))
            Text(
                text = "Search library...",
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
            )
        }
    }
}

@Composable
fun ShowcaseCard(
    item: MediaItemUiModel,
    onClick: () -> Unit
) {
    val isAncient = LocalIsAncientArchitect.current
    
    if (isAncient) {
        AncientArchitectElevatedCard(
            onClick = onClick,
            modifier = Modifier
                .fillMaxWidth()
                .height(220.dp)
        ) {
            ShowcaseContent(item)
        }
    } else {
        Card(
            onClick = onClick,
            modifier = Modifier
                .fillMaxWidth()
                .height(220.dp),
            elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
        ) {
            ShowcaseContent(item)
        }
    }
}

@Composable
private fun ShowcaseContent(item: MediaItemUiModel) {
    Box(modifier = Modifier.fillMaxSize()) {
        if (item.artworkUrl != null) {
            AsyncImage(
                model = item.artworkUrl,
                contentDescription = null,
                contentScale = ContentScale.Crop,
                modifier = Modifier.fillMaxSize()
            )
            // Gradient overlay for text readability
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .clickable { /* consume click */ }
            )
        } else {
            // Fallback background
            Surface(
                color = MaterialTheme.colorScheme.primaryContainer,
                modifier = Modifier.fillMaxSize()
            ) {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = Icons.Default.Star,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.2f)
                    )
                }
            }
        }
        
        Column(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(16.dp)
        ) {
            Text(
                text = item.title,
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onSurface
            )
            item.subtitle?.let {
                Text(
                    text = it,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.8f)
                )
            }
        }
        
        // Type badge
        Surface(
            modifier = Modifier
                .align(Alignment.TopStart)
                .padding(16.dp),
            shape = MaterialTheme.shapes.small,
            color = MaterialTheme.colorScheme.primary
        ) {
            Text(
                text = item.type.uppercase(),
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onPrimary,
                modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
            )
        }
    }
}

@Composable
fun MediaItemCard(
    item: MediaItemUiModel,
    onClick: () -> Unit
) {
    val isAncient = LocalIsAncientArchitect.current
    val width = 140.dp
    val height = 220.dp
    
    if (isAncient) {
        AncientArchitectCard(
            onClick = onClick,
            modifier = Modifier
                .width(width)
                .height(height)
        ) {
            MediaItemContent(item)
        }
    } else {
        Card(
            onClick = onClick,
            modifier = Modifier
                .width(width)
                .height(height)
        ) {
            MediaItemContent(item)
        }
    }
}

@Composable
private fun MediaItemContent(item: MediaItemUiModel) {
    Column(modifier = Modifier.fillMaxSize()) {
        Box(
            modifier = Modifier
                .weight(1f)
                .fillMaxWidth()
        ) {
            if (item.artworkUrl != null) {
                AsyncImage(
                    model = item.artworkUrl,
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Surface(
                    color = MaterialTheme.colorScheme.secondaryContainer,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Box(contentAlignment = Alignment.Center) {
                        Icon(
                            imageVector = when (item.type) {
                                "music" -> Icons.Default.MusicNote
                                "book" -> Icons.Default.MenuBook
                                "video" -> Icons.Default.Movie
                                else -> Icons.Default.Article
                            },
                            contentDescription = null,
                            modifier = Modifier.size(32.dp),
                            tint = MaterialTheme.colorScheme.onSecondaryContainer.copy(alpha = 0.5f)
                        )
                    }
                }
            }
            
            if (item.progress > 0) {
                LinearProgressIndicator(
                    progress = item.progress,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(4.dp)
                        .align(Alignment.BottomCenter)
                )
            }
        }
        
        Column(modifier = Modifier.padding(8.dp)) {
            Text(
                text = item.title,
                style = MaterialTheme.typography.bodyMedium,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            item.subtitle?.let {
                Text(
                    text = it,
                    style = MaterialTheme.typography.labelSmall,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun SectionHeader(
    title: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    modifier: Modifier = Modifier
) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = modifier
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            modifier = Modifier.size(20.dp),
            tint = MaterialTheme.colorScheme.primary
        )
        Spacer(modifier = Modifier.width(8.dp))
        Text(
            text = title,
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Bold
        )
    }
}

@Composable
private fun WelcomeSection(userName: String) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text(
            text = "Welcome back,",
            style = MaterialTheme.typography.headlineMedium,
            color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.7f)
        )
        Text(
            text = userName,
            style = MaterialTheme.typography.headlineLarge,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.primary
        )
    }
}
