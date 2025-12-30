package com.universalmedialibrary.ui.ai

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.services.ai.*

/**
 * AI Content Cache Screen
 * 
 * Provides UI for managing AI content cache:
 * - View cached content by character
 * - Search across cached materials
 * - Download progress monitoring
 * - Cache usage statistics
 * - Cleanup and management options
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AIContentCacheScreen(
    onNavigateBack: () -> Unit,
    viewModel: AIContentCacheViewModel = hiltViewModel()
) {
    val cacheItems by viewModel.cacheItems.collectAsStateWithLifecycle()
    val cacheStats by viewModel.cacheStatistics.collectAsStateWithLifecycle()
    val downloadProgress by viewModel.downloadProgress.collectAsStateWithLifecycle()
    val isLoading by viewModel.isLoading.collectAsStateWithLifecycle()
    
    var searchQuery by remember { mutableStateOf("") }
    var selectedCharacter by remember { mutableStateLong(0L) }
    var showCleanupDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null)
                    }
                },
                title = {
                    Text("AI Content Cache")
                },
                actions = {
                    IconButton(
                        onClick = { viewModel.refreshCache() }
                    ) {
                        Icon(Icons.Filled.Refresh, contentDescription = "Refresh")
                    }
                    
                    IconButton(
                        onClick = { showCleanupDialog = true }
                    ) {
                        Icon(Icons.Filled.CleaningServices, contentDescription = "Cleanup")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Search Bar
            SearchBar(
                query = searchQuery,
                onQueryChange = { searchQuery = it },
                onSearch = { viewModel.searchCache(it) },
                onClear = { 
                    searchQuery = ""
                    viewModel.clearSearch()
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            )
            
            // Filter by Character
            CharacterFilterChip(
                selectedCharacter = selectedCharacter,
                availableCharacters = viewModel.getAvailableCharacters(),
                onCharacterSelected = { characterId ->
                    selectedCharacter = characterId
                    viewModel.filterByCharacter(characterId)
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp)
            )
            
            // Cache Statistics
            cacheStats?.let { stats ->
                CacheStatisticsCard(
                    stats = stats,
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp)
                )
            }
            
            // Download Progress
            downloadProgress?.let { progress ->
                DownloadProgressCard(
                    progress = progress,
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp)
                )
            }
            
            // Cache Items List
            if (isLoading) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(cacheItems) { item ->
                        CacheItemCard(
                            item = item,
                            onOpen = { viewModel.openCacheItem(item) },
                            onDelete = { viewModel.deleteCacheItem(item) },
                            onShare = { viewModel.shareCacheItem(item) }
                        )
                    }
                }
            }
        }
    }
    
    // Cleanup Dialog
    if (showCleanupDialog) {
        CacheCleanupDialog(
            onDismiss = { showCleanupDialog = false },
            onCleanup = { options ->
                viewModel.performCleanup(options)
                showCleanupDialog = false
            }
        )
    }
}

@Composable
private fun SearchBar(
    query: String,
    onQueryChange: (String) -> Unit,
    onSearch: (String) -> Unit,
    onClear: () -> Unit,
    modifier: Modifier = Modifier
) {
    OutlinedTextField(
        value = query,
        onValueChange = onQueryChange,
        modifier = modifier,
        placeholder = {
            Text("Search cached content...")
        },
        leadingIcon = {
            Icon(Icons.Filled.Search, contentDescription = "Search")
        },
        trailingIcon = {
            if (query.isNotEmpty()) {
                IconButton(onClick = onClear) {
                    Icon(Icons.Filled.Clear, contentDescription = "Clear")
                }
            }
        },
        singleLine = true
    )
}

@Composable
private fun CharacterFilterChip(
    selectedCharacter: Long,
    availableCharacters: List<CharacterInfo>,
    onCharacterSelected: (Long) -> Unit,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        // All Characters
        FilterChip(
            selected = selectedCharacter == 0L,
            onClick = { onCharacterSelected(0L) },
            label = { Text("All Characters") }
        )
        
        availableCharacters.forEach { character ->
            FilterChip(
                selected = selectedCharacter == character.id,
                onClick = { onCharacterSelected(character.id) },
                label = { Text(character.name) }
            )
        }
    }
}

@Composable
private fun CacheStatisticsCard(
    stats: CacheStatistics,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Cache Statistics",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column {
                    Text(
                        text = "Total Items",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "${stats.totalItems}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                Column(
                    horizontalAlignment = Alignment.End
                ) {
                    Text(
                        text = "Total Size",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = formatFileSize(stats.totalSize),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Column {
                    Text(
                        text = "Used Space",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = formatFileSize(stats.usedSpace),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                Column(
                    horizontalAlignment = Alignment.End
                ) {
                    Text(
                        text = "Available",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = formatFileSize(stats.availableSpace),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun DownloadProgressCard(
    progress: DownloadProgress,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = progress.message,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.weight(1f)
                )
                
                when (progress.status) {
                    DownloadStatus.DOWNLOADING -> {
                        CircularProgressIndicator(
                            modifier = Modifier.size(24.dp),
                            strokeWidth = 2.dp
                        )
                    }
                    DownloadStatus.COMPLETED -> {
                        Icon(
                            Icons.Filled.CheckCircle,
                            contentDescription = "Completed",
                            tint = Color(0xFF4CAF50),
                            modifier = Modifier.size(24.dp)
                        )
                    }
                    DownloadStatus.FAILED -> {
                        Icon(
                            Icons.Filled.Error,
                            contentDescription = "Failed",
                            tint = Color.Red,
                            modifier = Modifier.size(24.dp)
                        )
                    }
                    else -> {
                        CircularProgressIndicator(
                            modifier = Modifier.size(24.dp),
                            strokeWidth = 2.dp
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            LinearProgressIndicator(
                progress = progress.progress,
                modifier = Modifier.fillMaxWidth()
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = "${formatFileSize(progress.downloadedBytes)} / ${formatFileSize(progress.totalBytes)}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun CacheItemCard(
    item: CacheItem,
    onOpen: () -> Unit,
    onDelete: () -> Unit,
    onShare: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { onOpen() },
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = item.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    Spacer(modifier = Modifier.height(4.dp))
                    
                    Text(
                        text = item.url,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    Spacer(modifier = Modifier.height(4.dp))
                    
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        // Content Type Chip
                        Surface(
                            modifier = Modifier
                                .clip(RoundedCornerShape(4.dp)),
                            color = MaterialTheme.colorScheme.surfaceVariant
                        ) {
                            Text(
                                text = item.contentType.name,
                                style = MaterialTheme.typography.bodySmall,
                                modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp)
                            )
                        }
                        
                        // Size
                        Text(
                            text = formatFileSize(item.fileSize),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        
                        // Download Date
                        Text(
                            text = formatTimestamp(item.downloadedAt),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                
                // Action Buttons
                Row {
                    IconButton(
                        onClick = onShare,
                        modifier = Modifier.size(32.dp)
                    ) {
                        Icon(
                            Icons.Filled.Share,
                            contentDescription = "Share",
                            modifier = Modifier.size(18.dp)
                        )
                    }
                    
                    IconButton(
                        onClick = onDelete,
                        modifier = Modifier.size(32.dp)
                    ) {
                        Icon(
                            Icons.Filled.Delete,
                            contentDescription = "Delete",
                            modifier = Modifier.size(18.dp)
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun CacheCleanupDialog(
    onDismiss: () -> Unit,
    onCleanup: (CleanupOptions) -> Unit
) {
    var clearExpired by remember { mutableStateOf(true) }
    var clearOld by remember { mutableStateOf(false) }
    var clearAll by remember { mutableStateOf(false) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Cache Cleanup")
        },
        text = {
            Column {
                Text(
                    text = "Select cleanup options:",
                    style = MaterialTheme.typography.bodyMedium
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Checkbox(
                        checked = clearExpired,
                        onCheckedChange = { clearExpired = it }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Clear expired items (30+ days)")
                }
                
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Checkbox(
                        checked = clearOld,
                        onCheckedChange = { clearOld = it }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Clear old items (7+ days)")
                }
                
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Checkbox(
                        checked = clearAll,
                        onCheckedChange = { 
                            clearAll = it
                            if (it) {
                                clearExpired = false
                                clearOld = false
                            }
                        }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Clear all cache")
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    val options = CleanupOptions(
                        clearExpired = clearExpired && !clearAll,
                        clearOld = clearOld && !clearAll,
                        clearAll = clearAll
                    )
                    onCleanup(options)
                }
            ) {
                Text("Cleanup")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

// Helper functions and data classes
private fun formatFileSize(bytes: Long): String {
    val kb = bytes / 1024.0
    val mb = kb / 1024.0
    val gb = mb / 1024.0
    
    return when {
        gb >= 1 -> "%.1f GB".format(gb)
        mb >= 1 -> "%.1f MB".format(mb)
        kb >= 1 -> "%.1f KB".format(kb)
        else -> "$bytes B"
    }
}

private fun formatTimestamp(timestamp: Long): String {
    val date = java.util.Date(timestamp)
    val format = java.text.SimpleDateFormat("MMM dd", java.util.Locale.getDefault())
    return format.format(date)
}

data class CharacterInfo(
    val id: Long,
    val name: String
)

data class CleanupOptions(
    val clearExpired: Boolean = false,
    val clearOld: Boolean = false,
    val clearAll: Boolean = false
)