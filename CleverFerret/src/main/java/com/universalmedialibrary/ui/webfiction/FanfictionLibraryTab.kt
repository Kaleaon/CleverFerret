package com.universalmedialibrary.ui.webfiction

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.automirrored.filled.LibraryBooks
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.webfiction.*
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import java.util.Locale
import com.universalmedialibrary.ui.fanfiction.FanfictionViewModel
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.ui.fanfiction.FilterType
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Unified Fanfiction Hub - All-in-one interface for fanfiction discovery, download, and management.
 * 
 * Streamlined experience combining:
 * - Site selection & Tag-based browsing
 * - Direct story download
 * - Library management (My Library)
 * - Update checker
 * 
 * No more jumping between screens! Reading is handled by the separate eReader.
 */

// Tab indices for the unified fanfiction hub
@Composable
fun FanfictionLibraryTab(
    viewModel: FanfictionViewModel,
    onStoryClick: (FanfictionStoryEntity) -> Unit
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

    Column(modifier = Modifier.fillMaxSize()) {
        // Filter and Search Row
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { searchQuery = it },
                placeholder = { Text("Search library...") },
                leadingIcon = { Icon(Icons.Default.Search, "Search") },
                modifier = Modifier
                    .weight(1f)
                    .padding(end = 8.dp),
                singleLine = true
            )
            
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
        }
        
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

        if (filteredStories.isEmpty()) {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    if (stories.isNotEmpty()) "No stories match your filter" else "Your library is empty. Go to 'Discover' to find stories!",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center,
                    modifier = Modifier.padding(32.dp)
                )
            }
        } else {
            LazyColumn(
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(
                    items = filteredStories,
                    key = { it.id }
                ) { story ->
                    LibraryStoryCard(
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
