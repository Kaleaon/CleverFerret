package com.universalmedialibrary.ui.audiobook

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
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.entity.AudiobookEntity
import com.universalmedialibrary.ui.icons.PhosphorIcons
import kotlin.time.Duration.Companion.seconds

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AudiobookLibraryScreen(
    viewModel: AudiobookViewModel = hiltViewModel(),
    onAudiobookClick: (AudiobookEntity) -> Unit,
    onImportClick: () -> Unit,
    onNavigateBack: () -> Unit
) {
    val audiobooks by viewModel.allAudiobooks.collectAsState()
    val inProgress by viewModel.inProgress.collectAsState()
    val finished by viewModel.finished.collectAsState()
    val selectedFilter by viewModel.selectedFilter.collectAsState()
    
    var showFilterMenu by remember { mutableStateOf(false) }
    
    val displayedAudiobooks = remember(audiobooks, inProgress, finished, selectedFilter) {
        when (selectedFilter) {
            AudiobookFilter.ALL -> audiobooks
            AudiobookFilter.IN_PROGRESS -> inProgress
            AudiobookFilter.FINISHED -> finished
            else -> audiobooks
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Column {
                        Text("Audiobooks")
                        if (selectedFilter != AudiobookFilter.ALL) {
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
                    IconButton(onClick = { showFilterMenu = true }) {
                        Icon(PhosphorIcons.Funnel, "Filter")
                    }
                    
                    DropdownMenu(
                        expanded = showFilterMenu,
                        onDismissRequest = { showFilterMenu = false }
                    ) {
                        AudiobookFilter.values().forEach { filter ->
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
                    
                    IconButton(onClick = onImportClick) {
                        Icon(PhosphorIcons.Plus, "Import")
                    }
                }
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = onImportClick,
                icon = { Icon(PhosphorIcons.FilePlus, "Import") },
                text = { Text("Import") }
            )
        }
    ) { padding ->
        if (displayedAudiobooks.isEmpty()) {
            EmptyState(
                hasAudiobooks = audiobooks.isNotEmpty(),
                onImportClick = onImportClick
            )
        } else {
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                items(
                    items = displayedAudiobooks,
                    key = { it.id }
                ) { audiobook ->
                    AudiobookCard(
                        audiobook = audiobook,
                        onClick = { onAudiobookClick(audiobook) },
                        onDelete = { viewModel.deleteAudiobook(audiobook.id) }
                    )
                }
            }
        }
    }
}

@Composable
private fun EmptyState(
    hasAudiobooks: Boolean,
    onImportClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            PhosphorIcons.Headphones,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(Modifier.height(16.dp))
        
        Text(
            if (hasAudiobooks) "No audiobooks match your filter" else "No audiobooks yet",
            style = MaterialTheme.typography.titleLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(Modifier.height(8.dp))
        
        Text(
            if (hasAudiobooks) 
                "Try changing your filter" 
            else 
                "Import your first audiobook",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        if (!hasAudiobooks) {
            Spacer(Modifier.height(24.dp))
            
            Button(onClick = onImportClick) {
                Icon(PhosphorIcons.FilePlus, "Import")
                Spacer(Modifier.width(8.dp))
                Text("Import Audiobook")
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AudiobookCard(
    audiobook: AudiobookEntity,
    onClick: () -> Unit,
    onDelete: () -> Unit
) {
    var showMenu by remember { mutableStateOf(false) }
    
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Cover art
            Card(
                modifier = Modifier.size(80.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                if (audiobook.coverPath != null) {
                    AsyncImage(
                        model = audiobook.coverPath,
                        contentDescription = "Cover",
                        modifier = Modifier.fillMaxSize()
                    )
                } else {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            PhosphorIcons.Headphones,
                            contentDescription = null,
                            modifier = Modifier.size(40.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
            
            // Metadata
            Column(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxHeight(),
                verticalArrangement = Arrangement.SpaceBetween
            ) {
                Column {
                    Text(
                        audiobook.title,
                        style = MaterialTheme.typography.titleMedium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    if (audiobook.author != null) {
                        Text(
                            "by ${audiobook.author}",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    
                    if (audiobook.narrator != null) {
                        Text(
                            "Narrated by: ${audiobook.narrator}",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }
                
                Spacer(Modifier.height(8.dp))
                
                // Duration and progress
                Column {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            PhosphorIcons.Clock,
                            contentDescription = null,
                            modifier = Modifier.size(16.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Text(
                            formatDuration(audiobook.duration),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        
                        if (audiobook.chapterCount > 0) {
                            Icon(
                                PhosphorIcons.ListBullets,
                                contentDescription = null,
                                modifier = Modifier.size(16.dp),
                                tint = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Text(
                                "${audiobook.chapterCount} chapters",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                    
                    // Progress bar
                    if (audiobook.lastPlayedPosition > 0 && !audiobook.isFinished) {
                        Spacer(Modifier.height(4.dp))
                        
                        LinearProgressIndicator(
                            progress = audiobook.lastPlayedPosition.toFloat() / audiobook.duration,
                            modifier = Modifier.fillMaxWidth()
                        )
                    }
                }
            }
            
            // Menu
            Box {
                IconButton(onClick = { showMenu = true }) {
                    Icon(Icons.Default.MoreVert, "Menu")
                }
                
                DropdownMenu(
                    expanded = showMenu,
                    onDismissRequest = { showMenu = false }
                ) {
                    DropdownMenuItem(
                        text = { Text("Delete") },
                        onClick = {
                            onDelete()
                            showMenu = false
                        },
                        leadingIcon = {
                            Icon(Icons.Default.Delete, null)
                        }
                    )
                }
            }
        }
    }
}

private fun formatDuration(seconds: Long): String {
    val duration = seconds.seconds
    val hours = duration.inWholeHours
    val minutes = (duration.inWholeMinutes % 60)
    
    return when {
        hours > 0 -> "${hours}h ${minutes}m"
        minutes > 0 -> "${minutes}m"
        else -> "${duration.inWholeSeconds}s"
    }
}
