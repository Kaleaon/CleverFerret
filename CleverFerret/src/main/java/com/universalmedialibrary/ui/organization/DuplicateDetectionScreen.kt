package com.universalmedialibrary.ui.organization

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
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.duplicates.DuplicateGroup
import com.universalmedialibrary.ui.icons.PhosphorIcons

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DuplicateDetectionScreen(
    viewModel: OrganizationViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit
) {
    val duplicateGroups by viewModel.duplicateGroups.collectAsState()
    val isScanning by viewModel.isScanning.collectAsState()
    val threshold by viewModel.duplicateThreshold.collectAsState()
    
    var showThresholdDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Column {
                        Text("Duplicate Detection")
                        if (duplicateGroups.isNotEmpty()) {
                            Text(
                                "${duplicateGroups.size} duplicate groups found",
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
                    IconButton(onClick = { showThresholdDialog = true }) {
                        Icon(Icons.Default.Settings, "Adjust Threshold")
                    }
                }
            )
        }
    ) { padding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            when {
                isScanning -> {
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(32.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center
                    ) {
                        CircularProgressIndicator()
                        Spacer(Modifier.height(16.dp))
                        Text("Scanning for duplicates...")
                    }
                }
                
                duplicateGroups.isEmpty() -> {
                    EmptyState(
                        onScanClick = { viewModel.scanForDuplicates() }
                    )
                }
                else -> {
                    DuplicateList(
                        duplicateGroups = duplicateGroups,
                        onDeleteBook = { viewModel.deleteMediaItem(it) },
                        onKeepBook = { bookId, groupIndex -> 
                            viewModel.keepOneDeleteOthers(bookId, groupIndex)
                        }
                    )
                }
            }
        }
    }
    
    if (showThresholdDialog) {
        ThresholdDialog(
            currentThreshold = threshold,
            onDismiss = { showThresholdDialog = false },
            onConfirm = { newThreshold ->
                viewModel.setThreshold(newThreshold)
                viewModel.scanForDuplicates()
                showThresholdDialog = false
            }
        )
    }
}

@Composable
private fun EmptyState(
    onScanClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Default.ContentCopy,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(Modifier.height(16.dp))
        
        Text(
            "No scan performed yet",
            style = MaterialTheme.typography.titleLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(Modifier.height(8.dp))
        
        Text(
            "Scan your library to find duplicate books",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(Modifier.height(24.dp))
        
        Button(onClick = onScanClick) {
            Icon(PhosphorIcons.MagnifyingGlass, "Scan")
            Spacer(Modifier.width(8.dp))
            Text("Scan for Duplicates")
        }
    }
}

@Composable
private fun DuplicateList(
    duplicateGroups: List<DuplicateGroup>,
    onDeleteBook: (String) -> Unit,
    onKeepBook: (String, Int) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        items(
            items = duplicateGroups.withIndex().toList(),
            key = { it.index }
        ) { (index, group) ->
            DuplicateGroupCard(
                group = group,
                groupIndex = index,
                onDeleteBook = onDeleteBook,
                onKeepBook = { bookId -> onKeepBook(bookId, index) }
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun DuplicateGroupCard(
    group: DuplicateGroup,
    groupIndex: Int,
    onDeleteBook: (String) -> Unit,
    onKeepBook: (String) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        "Duplicate Group ${groupIndex + 1}",
                        style = MaterialTheme.typography.titleMedium
                    )
                    Text(
                        "${group.items.size} copies • ${formatFileSize(group.wastedSpace)} wasted",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                IconButton(onClick = { expanded = !expanded }) {
                    Icon(
                        if (expanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                        if (expanded) "Collapse" else "Expand"
                    )
                }
            }
            
            if (expanded) {
                Spacer(Modifier.height(16.dp))
                
                group.items.forEachIndexed { index, item ->
                    DuplicateBookItem(
                        item = item,
                        similarity = 1.0f, // Simplified - no similarity score in new model
                        reasons = listOf("Same file hash"), // Simplified
                        onDelete = { onDeleteBook(item.itemId.toString()) },
                        onKeep = { onKeepBook(item.itemId.toString()) }
                    )
                    
                    if (index != group.items.lastIndex) {
                        Spacer(Modifier.height(12.dp))
                        HorizontalDivider()
                        Spacer(Modifier.height(12.dp))
                    }
                }
            }
        }
    }
}

@Composable
private fun DuplicateBookItem(
    item: MediaItem,
    similarity: Float,
    reasons: List<String>,
    onDelete: () -> Unit,
    onKeep: () -> Unit
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        // Cover
        Card(
            modifier = Modifier.size(60.dp),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surfaceVariant
            )
        ) {
            if (item.thumbnailPath != null) {
                AsyncImage(
                    
                    model = item.thumbnailPath,
                    contentDescription = "Cover",
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        Icons.Default.Book,
                        contentDescription = null,
                        modifier = Modifier.size(30.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                item.title,
                style = MaterialTheme.typography.bodyMedium,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )
            
            if (item.author != null) {
                Text(
                    item.author!!,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Text(
                reasons.joinToString(" • "),
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.primary
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                modifier = Modifier.padding(top = 8.dp)
            ) {
                OutlinedButton(
                    onClick = onKeep,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Check, null, Modifier.size(18.dp))
                    Spacer(Modifier.width(4.dp))
                    Text("Keep Only This")
                }
                
                OutlinedButton(
                    onClick = onDelete,
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.outlinedButtonColors(
                        contentColor = MaterialTheme.colorScheme.error
                    )
                ) {
                    Icon(Icons.Default.Delete, null, Modifier.size(18.dp))
                    Spacer(Modifier.width(4.dp))
                    Text("Delete")
                }
            }
        }
    }
}

@Composable
private fun ThresholdDialog(
    currentThreshold: Float,
    onDismiss: () -> Unit,
    onConfirm: (Float) -> Unit
) {
    var threshold by remember { mutableStateOf(currentThreshold) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Similarity Threshold") },
        text = {
            Column {
                Text(
                    "Adjust how similar books must be to be considered duplicates",
                    style = MaterialTheme.typography.bodyMedium
                )
                
                Spacer(Modifier.height(16.dp))
                
                Text(
                    "${(threshold * 100).toInt()}% similar",
                    style = MaterialTheme.typography.labelLarge
                )
                
                Slider(
                    value = threshold,
                    onValueChange = { threshold = it },
                    valueRange = 0.5f..1.0f,
                    steps = 9
                )
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text("More results", style = MaterialTheme.typography.labelSmall)
                    Text("More accurate", style = MaterialTheme.typography.labelSmall)
                }
            }
        },
        confirmButton = {
            TextButton(onClick = { onConfirm(threshold) }) {
                Text("Apply")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

/**
 * Format file size in bytes to human-readable format
 */
private fun formatFileSize(bytes: Long): String {
    if (bytes < 1024) return "$bytes B"
    val kb = bytes / 1024.0
    if (kb < 1024) return String.format(java.util.Locale.US, "%.1f KB", kb)
    val mb = kb / 1024.0
    if (mb < 1024) return String.format(java.util.Locale.US, "%.1f MB", mb)
    val gb = mb / 1024.0
    return String.format(java.util.Locale.US, "%.1f GB", gb)
}
