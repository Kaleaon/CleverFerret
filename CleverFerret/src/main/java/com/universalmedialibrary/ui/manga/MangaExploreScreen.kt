package com.universalmedialibrary.ui.manga

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
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
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import com.universalmedialibrary.services.manga.source.MangaSource
import com.universalmedialibrary.services.manga.source.OnlineManga

/**
 * Manga Explore Screen
 * 
 * Comprehensive manga discovery and browsing experience
 * Inspired by Futon/Kotatsu explore functionality
 * 
 * Features:
 * - Browse multiple manga sources
 * - Search across sources
 * - Popular/Latest manga sections
 * - Source filtering
 * - Genre/tag filtering
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MangaExploreScreen(
    onNavigateBack: () -> Unit,
    onMangaClick: (OnlineManga) -> Unit,
    onSourceSettings: () -> Unit,
    viewModel: MangaExploreViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var searchQuery by remember { mutableStateOf("") }
    var showSourceSelector by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Explore Manga") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showSourceSelector = true }) {
                        Icon(Icons.Default.FilterList, contentDescription = "Sources")
                    }
                    IconButton(onClick = onSourceSettings) {
                        Icon(Icons.Default.Settings, contentDescription = "Settings")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Search bar
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { 
                    searchQuery = it
                    if (it.length >= 3) {
                        viewModel.search(it)
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                placeholder = { Text("Search manga...") },
                leadingIcon = { Icon(Icons.Default.Search, contentDescription = null) },
                trailingIcon = {
                    if (searchQuery.isNotEmpty()) {
                        IconButton(onClick = { 
                            searchQuery = ""
                            viewModel.clearSearch()
                        }) {
                            Icon(Icons.Default.Clear, contentDescription = "Clear")
                        }
                    }
                },
                singleLine = true,
                shape = RoundedCornerShape(12.dp)
            )
            
            // Source selector chips
            LazyRow(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(uiState.sources) { source ->
                    FilterChip(
                        selected = source.id == uiState.selectedSource?.id,
                        onClick = { viewModel.selectSource(source) },
                        label = { Text(source.name) },
                        leadingIcon = if (source.isPinned) {
                            { Icon(Icons.Default.Star, contentDescription = null, modifier = Modifier.size(16.dp)) }
                        } else null
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Content
            when {
                uiState.isLoading && uiState.manga.isEmpty() -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }
                
                uiState.searchResults.isNotEmpty() -> {
                    SearchResultsGrid(
                        manga = uiState.searchResults,
                        onMangaClick = onMangaClick,
                        onLoadMore = { viewModel.loadMoreSearchResults() },
                        isLoading = uiState.isLoading
                    )
                }
                
                uiState.error != null -> {
                    ErrorState(
                        error = uiState.error!!,
                        onRetry = { viewModel.refresh() }
                    )
                }
                
                else -> {
                    ExploreContent(
                        popularManga = uiState.popularManga,
                        latestManga = uiState.latestManga,
                        onMangaClick = onMangaClick,
                        onSeeAllPopular = { viewModel.loadPopular() },
                        onSeeAllLatest = { viewModel.loadLatest() },
                        isLoading = uiState.isLoading
                    )
                }
            }
        }
        
        // Source selector bottom sheet
        if (showSourceSelector) {
            SourceSelectorSheet(
                sources = uiState.allSources,
                enabledSources = uiState.sources,
                onDismiss = { showSourceSelector = false },
                onSourceToggle = { source, enabled ->
                    viewModel.toggleSource(source.id, enabled)
                },
                onSourcePin = { source, pinned ->
                    viewModel.pinSource(source.id, pinned)
                }
            )
        }
    }
}

@Composable
private fun ExploreContent(
    popularManga: List<OnlineManga>,
    latestManga: List<OnlineManga>,
    onMangaClick: (OnlineManga) -> Unit,
    onSeeAllPopular: () -> Unit,
    onSeeAllLatest: () -> Unit,
    isLoading: Boolean
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(bottom = 16.dp)
    ) {
        // Popular section
        item {
            SectionHeader(
                title = "Popular",
                onSeeAll = onSeeAllPopular
            )
        }
        
        item {
            if (popularManga.isEmpty() && isLoading) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(200.dp),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            } else {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = 16.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    items(popularManga.take(10)) { manga ->
                        MangaCard(
                            manga = manga,
                            onClick = { onMangaClick(manga) },
                            modifier = Modifier.width(140.dp)
                        )
                    }
                }
            }
        }
        
        item { Spacer(modifier = Modifier.height(24.dp)) }
        
        // Latest updates section
        item {
            SectionHeader(
                title = "Latest Updates",
                onSeeAll = onSeeAllLatest
            )
        }
        
        item {
            if (latestManga.isEmpty() && isLoading) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(200.dp),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            } else {
                LazyRow(
                    contentPadding = PaddingValues(horizontal = 16.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    items(latestManga.take(10)) { manga ->
                        MangaCard(
                            manga = manga,
                            onClick = { onMangaClick(manga) },
                            modifier = Modifier.width(140.dp)
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun SearchResultsGrid(
    manga: List<OnlineManga>,
    onMangaClick: (OnlineManga) -> Unit,
    onLoadMore: () -> Unit,
    isLoading: Boolean
) {
    LazyVerticalGrid(
        columns = GridCells.Adaptive(minSize = 120.dp),
        contentPadding = PaddingValues(16.dp),
        horizontalArrangement = Arrangement.spacedBy(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(manga) { item ->
            MangaCard(
                manga = item,
                onClick = { onMangaClick(item) }
            )
        }
        
        // Load more indicator
        if (isLoading) {
            item {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator(modifier = Modifier.size(24.dp))
                }
            }
        }
    }
}

@Composable
private fun MangaCard(
    manga: OnlineManga,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .clip(RoundedCornerShape(8.dp))
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(0.7f)
            ) {
                AsyncImage(
                    model = manga.coverUrl,
                    contentDescription = manga.title,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
                
                // State badge
                if (manga.state != com.universalmedialibrary.services.manga.source.MangaState.UNKNOWN) {
                    Surface(
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(4.dp),
                        color = when (manga.state) {
                            com.universalmedialibrary.services.manga.source.MangaState.ONGOING -> 
                                Color(0xFF4CAF50)
                            com.universalmedialibrary.services.manga.source.MangaState.FINISHED -> 
                                Color(0xFF2196F3)
                            else -> MaterialTheme.colorScheme.surfaceVariant
                        },
                        shape = RoundedCornerShape(4.dp)
                    ) {
                        Text(
                            text = manga.state.name.take(3),
                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                            fontSize = 10.sp,
                            color = Color.White
                        )
                    }
                }
            }
            
            Text(
                text = manga.title,
                modifier = Modifier.padding(8.dp),
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                style = MaterialTheme.typography.bodySmall,
                fontWeight = FontWeight.Medium
            )
        }
    }
}

@Composable
private fun SectionHeader(
    title: String,
    onSeeAll: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = title,
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Bold
        )
        TextButton(onClick = onSeeAll) {
            Text("See All")
            Icon(
                Icons.Default.ChevronRight,
                contentDescription = null,
                modifier = Modifier.size(16.dp)
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun SourceSelectorSheet(
    sources: List<MangaSource>,
    enabledSources: List<MangaSource>,
    onDismiss: () -> Unit,
    onSourceToggle: (MangaSource, Boolean) -> Unit,
    onSourcePin: (MangaSource, Boolean) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                text = "Manga Sources",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )
            
            Text(
                text = "${enabledSources.size} of ${sources.size} enabled",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            LazyColumn(
                modifier = Modifier.weight(1f, fill = false)
            ) {
                items(sources) { source ->
                    val isEnabled = enabledSources.any { it.id == source.id }
                    
                    ListItem(
                        headlineContent = { Text(source.name) },
                        supportingContent = { Text(source.domain) },
                        leadingContent = {
                            Checkbox(
                                checked = isEnabled,
                                onCheckedChange = { onSourceToggle(source, it) }
                            )
                        },
                        trailingContent = {
                            IconButton(
                                onClick = { onSourcePin(source, !source.isPinned) }
                            ) {
                                Icon(
                                    if (source.isPinned) Icons.Default.Star else Icons.Default.StarOutline,
                                    contentDescription = if (source.isPinned) "Unpin" else "Pin",
                                    tint = if (source.isPinned) 
                                        MaterialTheme.colorScheme.primary 
                                    else 
                                        MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@Composable
private fun ErrorState(
    error: String,
    onRetry: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Default.Error,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.error
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Text(
            text = "Something went wrong",
            style = MaterialTheme.typography.titleMedium
        )
        
        Text(
            text = error,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Button(onClick = onRetry) {
            Text("Retry")
        }
    }
}
