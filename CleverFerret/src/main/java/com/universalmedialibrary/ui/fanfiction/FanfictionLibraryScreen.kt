package com.universalmedialibrary.ui.fanfiction

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.ui.icons.PhosphorIcons

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FanfictionLibraryScreen(
    viewModel: FanfictionViewModel = hiltViewModel(),
    onNavigateToDownload: () -> Unit,
    onStoryClick: (FanfictionStoryEntity) -> Unit,
    onNavigateBack: () -> Unit
) {
    val stories by viewModel.allStories.collectAsState()
    val selectedFilter by viewModel.selectedFilter.collectAsState()
    val updateStatus by viewModel.updateStatus.collectAsState()
    
    var showFilterMenu by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }
    
    val filteredStories = remember(stories, selectedFilter, searchQuery) {
        stories.filter { story ->
            val matchesSearch = searchQuery.isBlank() ||
                story.title.contains(searchQuery, ignoreCase = true) ||
                story.author.contains(searchQuery, ignoreCase = true) ||
                story.summary.contains(searchQuery, ignoreCase = true)
            
            val matchesFilter = when (selectedFilter) {
                FilterType.ALL -> true
                FilterType.IN_PROGRESS -> story.status == "IN_PROGRESS"
                FilterType.COMPLETE -> story.status == "COMPLETE"
                FilterType.AO3 -> story.sourceSite == "Archive of Our Own"
                FilterType.FFN -> story.sourceSite == "FanFiction.Net"
                FilterType.ROYAL_ROAD -> story.sourceSite == "Royal Road"
            }
            
            matchesSearch && matchesFilter
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Column {
                        Text("Fanfiction")
                        if (selectedFilter != FilterType.ALL) {
                            Text(
                                selectedFilter.name.replace("_", " "),
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(PhosphorIcons.ArrowLeft, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.checkForUpdates() }) {
                        Icon(Icons.Default.Refresh, "Check Updates")
                    }
                    
                    IconButton(onClick = { showFilterMenu = true }) {
                        Icon(Icons.Default.FilterList, "Filter")
                    }
                    
                    DropdownMenu(
                        expanded = showFilterMenu,
                        onDismissRequest = { showFilterMenu = false }
                    ) {
                        FilterType.values().forEach { filter ->
                            DropdownMenuItem(
                                text = { Text(filter.name.replace("_", " ")) },
                                onClick = {
                                    viewModel.setFilter(filter)
                                    showFilterMenu = false
                                },
                                leadingIcon = {
                                    if (filter == selectedFilter) {
                                        Icon(Icons.Default.Check, null)
                                    }
                                }
                            )
                        }
                    }
                    
                    IconButton(onClick = onNavigateToDownload) {
                        Icon(PhosphorIcons.Plus, "Download")
                    }
                }
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = onNavigateToDownload,
                icon = { Icon(PhosphorIcons.Download, "Download") },
                text = { Text("Download") }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Update status banner
            updateStatus?.let { status ->
                Surface(
                    color = MaterialTheme.colorScheme.primaryContainer,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            status,
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer,
                            modifier = Modifier.weight(1f)
                        )
                        IconButton(onClick = { viewModel.clearUpdateStatus() }) {
                            Icon(Icons.Default.Close, "Dismiss")
                        }
                    }
                }
            }
            
            // Search bar
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { searchQuery = it },
                placeholder = { Text("Search stories...") },
                leadingIcon = { Icon(Icons.Default.Search, "Search") },
                trailingIcon = {
                    if (searchQuery.isNotEmpty()) {
                        IconButton(onClick = { searchQuery = "" }) {
                            Icon(Icons.Default.Clear, "Clear")
                        }
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                singleLine = true
            )
            
            // Stories list
            if (filteredStories.isEmpty()) {
                EmptyState(
                    hasStories = stories.isNotEmpty(),
                    onDownloadClick = onNavigateToDownload
                )
            } else {
                LazyColumn(
                    contentPadding = PaddingValues(horizontal = 16.dp, vertical = 8.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(
                        items = filteredStories,
                        key = { it.id }
                    ) { story ->
                        StoryCard(
                            story = story,
                            onClick = { onStoryClick(story) },
                            onUpdateClick = { viewModel.updateStory(story.id) },
                            onDeleteClick = { viewModel.deleteStory(story) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun EmptyState(
    hasStories: Boolean,
    onDownloadClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            PhosphorIcons.Book,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(Modifier.height(16.dp))
        
        Text(
            if (hasStories) "No stories match your filter" else "No stories yet",
            style = MaterialTheme.typography.titleLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(Modifier.height(8.dp))
        
        Text(
            if (hasStories) 
                "Try changing your filter or search" 
            else 
                "Download your first fanfiction story",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        if (!hasStories) {
            Spacer(Modifier.height(24.dp))
            
            Button(onClick = onDownloadClick) {
                Icon(PhosphorIcons.Download, "Download")
                Spacer(Modifier.width(8.dp))
                Text("Download Story")
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun StoryCard(
    story: FanfictionStoryEntity,
    onClick: () -> Unit,
    onUpdateClick: () -> Unit,
    onDeleteClick: () -> Unit
) {
    var showMenu by remember { mutableStateOf(false) }
    
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            // Title and menu
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    story.title,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.weight(1f)
                )
                
                Box {
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, "Menu")
                    }
                    
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        if (story.status == "IN_PROGRESS") {
                            DropdownMenuItem(
                                text = { Text("Check for Updates") },
                                onClick = {
                                    onUpdateClick()
                                    showMenu = false
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.Refresh, null)
                                }
                            )
                        }
                        DropdownMenuItem(
                            text = { Text("Delete") },
                            onClick = {
                                onDeleteClick()
                                showMenu = false
                            },
                            leadingIcon = {
                                Icon(Icons.Default.Delete, null)
                            }
                        )
                    }
                }
            }
            
            // Author
            Text(
                "by ${story.author}",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(Modifier.height(8.dp))
            
            // Summary
            Text(
                story.summary,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(Modifier.height(12.dp))
            
            // Metadata chips
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                // Status chip
                AssistChip(
                    onClick = {},
                    label = { 
                        Text(
                            story.status.replace("_", " "),
                            style = MaterialTheme.typography.labelSmall
                        )
                    },
                    colors = AssistChipDefaults.assistChipColors(
                        containerColor = if (story.status == "COMPLETE")
                            MaterialTheme.colorScheme.tertiaryContainer
                        else
                            MaterialTheme.colorScheme.secondaryContainer
                    )
                )
                
                // Site chip
                AssistChip(
                    onClick = {},
                    label = { 
                        Text(
                            story.sourceSite,
                            style = MaterialTheme.typography.labelSmall
                        )
                    }
                )
            }
            
            Spacer(Modifier.height(8.dp))
            
            // Stats
            Row(
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    "${story.chapterCount} chapters",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    "${story.wordCount} words",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                if (story.rating != null) {
                    Text(
                        story.rating!!,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}
