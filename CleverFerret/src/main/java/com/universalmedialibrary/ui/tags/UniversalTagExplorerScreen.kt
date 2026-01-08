package com.universalmedialibrary.ui.tags

import android.graphics.Color.parseColor
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.Apps
import androidx.compose.material.icons.filled.AutoStories
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Clear
import androidx.compose.material.icons.filled.ClearAll
import androidx.compose.material.icons.filled.Description
import androidx.compose.material.icons.filled.Headphones
import androidx.compose.material.icons.filled.Mic
import androidx.compose.material.icons.filled.Movie
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Tv
import androidx.compose.material3.AssistChip
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExtendedFloatingActionButton
import androidx.compose.material3.FilterChip
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.material3.surfaceColorAtElevation
import kotlinx.coroutines.launch
import com.universalmedialibrary.data.local.entity.TagType

@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
fun UniversalTagExplorerScreen(
    navController: NavController,
    viewModel: UniversalTagExplorerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val searchText by viewModel.searchText.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }
    val coroutineScope = rememberCoroutineScope()

    var showSortMenu by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text(
                            text = "Tag Explorer",
                            style = MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.SemiBold
                        )
                        Text(
                            text = "${uiState.totalCount} tags ${uiState.selectedMediaType?.let { "• ${mediaTypeLabel(it)}" } ?: ""}".trim(),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    if (uiState.selectedCount > 0) {
                        IconButton(onClick = { viewModel.clearSelection() }) {
                            Icon(Icons.Filled.ClearAll, contentDescription = "Clear selection")
                        }
                    }
                    IconButton(onClick = { showSortMenu = true }) {
                        Icon(Icons.AutoMirrored.Filled.Sort, contentDescription = "Sort tags")
                    }
                    DropdownMenu(
                        expanded = showSortMenu,
                        onDismissRequest = { showSortMenu = false }
                    ) {
                        TagSortOrder.values().forEach { order ->
                            DropdownMenuItem(
                                text = { Text(order.displayName()) },
                                onClick = {
                                    viewModel.setSortOrder(order)
                                    showSortMenu = false
                                }
                            )
                        }
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surfaceColorAtElevation(3.dp)
                )
            )
        },
        floatingActionButton = {
            if (uiState.selectedCount > 0) {
                ExtendedFloatingActionButton(
                    onClick = {
                        val route = viewModel.buildSearchRouteForSelection()
                        navController.navigate(route)
                    },
                    text = { Text("Search (${uiState.selectedCount})") },
                    icon = { Icon(Icons.Filled.Search, contentDescription = "Search") }
                )
            }
        },
        snackbarHost = { SnackbarHost(hostState = snackbarHostState) }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            OutlinedTextField(
                value = searchText,
                onValueChange = viewModel::updateSearchQuery,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 12.dp),
                singleLine = true,
                leadingIcon = { Icon(Icons.Filled.Search, contentDescription = "Search") },
                trailingIcon = {
                    if (searchText.isNotEmpty()) {
                        IconButton(onClick = { viewModel.updateSearchQuery("") }) {
                            Icon(Icons.Filled.Clear, contentDescription = "Clear search")
                        }
                    }
                },
                placeholder = { Text("Search tags...") },
                colors = TextFieldDefaults.colors(
                    focusedIndicatorColor = Color.Transparent,
                    unfocusedIndicatorColor = Color.Transparent,
                    focusedContainerColor = MaterialTheme.colorScheme.surface,
                    unfocusedContainerColor = MaterialTheme.colorScheme.surface
                )
            )

            MediaTypeSelector(
                filters = viewModel.mediaTypeFilters,
                selectedKey = uiState.selectedMediaType,
                onFilterSelected = viewModel::selectMediaType
            )

            val selectedTags = remember(uiState.tags) {
                uiState.tags.filter { it.isSelected }
            }

            if (selectedTags.isNotEmpty()) {
                FlowRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp)
                ) {
                    selectedTags.forEach { tag ->
                        AssistChip(
                            onClick = {
                                coroutineScope.launch {
                                    snackbarHostState.showSnackbar("Removed ${tag.name}")
                                }
                                viewModel.toggleTagSelection(tag.tagId)
                            },
                            leadingIcon = {
                                Icon(
                                    Icons.Filled.CheckCircle,
                                    contentDescription = "Media image",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                            },
                            label = { Text(tag.name) }
                        )
                    }
                }
            }

            if (uiState.tags.isEmpty()) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(24.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "No tags match your filters yet.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(horizontal = 16.dp, vertical = 12.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    items(uiState.tags, key = { it.tagId }) { tag ->
                        TagExplorerListRow(
                            item = tag,
                            isFilteredView = uiState.selectedMediaType != null,
                            onToggle = { viewModel.toggleTagSelection(tag.tagId) },
                            onSearch = {
                                val route = viewModel.buildSearchRouteForTag(tag.tagId)
                                navController.navigate(route)
                            }
                        )
                    }
                    item {
                        Spacer(modifier = Modifier.height(80.dp))
                    }
                }
            }
        }
    }
}

@Composable
private fun MediaTypeSelector(
    filters: List<MediaTypeFilter>,
    selectedKey: String?,
    onFilterSelected: (String?) -> Unit
) {
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp),
        horizontalArrangement = Arrangement.spacedBy(8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        items(filters) { filter ->
            val icon = mediaTypeIcon(filter.key)
            FilterChip(
                selected = selectedKey == filter.key,
                onClick = { onFilterSelected(filter.key) },
                label = { Text(filter.label) },
                leadingIcon = icon?.let {
                    {
                        Icon(
                            imageVector = it,
                            contentDescription = "Media image",
                            modifier = Modifier.size(18.dp)
                        )
                    }
                }
            )
        }
    }
}

@Composable
private fun TagExplorerListRow(
    item: TagExplorerListItem,
    isFilteredView: Boolean,
    onToggle: () -> Unit,
    onSearch: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = if (item.isSelected) {
                MaterialTheme.colorScheme.secondaryContainer
            } else {
                MaterialTheme.colorScheme.surface
            }
        ),
        onClick = onToggle
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                SelectionIndicator(selected = item.isSelected)
                Column(modifier = Modifier.weight(1f)) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        item.color?.let { color ->
                            TagColorSwatch(color)
                            Spacer(modifier = Modifier.padding(horizontal = 6.dp))
                        }
                        Text(
                            text = item.name,
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.SemiBold,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    if (!item.description.isNullOrBlank()) {
                        Text(
                            text = item.description,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 2,
                            overflow = TextOverflow.Ellipsis,
                            modifier = Modifier.padding(top = 4.dp)
                        )
                    }
                }
                IconButton(onClick = onSearch) {
                    Icon(Icons.Filled.Search, contentDescription = "Search with tag")
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            FlowRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                AssistChip(
                    onClick = {},
                    label = { Text(item.type.displayName()) }
                )
                AssistChip(
                    onClick = {},
                    label = {
                        val usageText = if (isFilteredView && item.filteredUsage != item.totalUsage) {
                            "${item.filteredUsage} in view • ${item.totalUsage} total"
                        } else {
                            usageLabel(item.totalUsage)
                        }
                        Text(usageText)
                    }
                )
            }
        }
    }
}

@Composable
private fun SelectionIndicator(selected: Boolean) {
    Box(
        modifier = Modifier
            .size(20.dp)
            .clip(CircleShape)
            .background(
                if (selected) MaterialTheme.colorScheme.primary
                else MaterialTheme.colorScheme.surfaceVariant
            ),
        contentAlignment = Alignment.Center
    ) {
        if (selected) {
            Icon(
                Icons.Filled.CheckCircle,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.onPrimary,
                modifier = Modifier.size(18.dp)
            )
        }
    }
}

@Composable
private fun TagColorSwatch(hex: String) {
    val color = remember(hex) {
        runCatching { Color(parseColor(hex)) }.getOrNull()
    }
    if (color != null) {
        Box(
            modifier = Modifier
                .size(12.dp)
                .clip(CircleShape)
                .background(color)
        )
    }
}

private fun usageLabel(count: Int): String = when (count) {
    0 -> "No items"
    1 -> "Used by 1 item"
    else -> "Used by $count items"
}

private fun TagType.displayName(): String = when (this) {
    TagType.USER_DEFINED -> "User"
    TagType.AUTO_GENERATED -> "Auto"
    TagType.IMPORTED_PLEX -> "Plex"
    TagType.IMPORTED_CALIBRE -> "Calibre"
    TagType.IMPORTED_JELLYFIN -> "Jellyfin"
}

private fun mediaTypeIcon(key: String?): ImageVector? = when (key) {
    null -> Icons.Filled.Apps
    "BOOK" -> Icons.AutoMirrored.Filled.MenuBook
    "AUDIOBOOK" -> Icons.Filled.Headphones
    "MUSIC_TRACK" -> Icons.Filled.MusicNote
    "MOVIE" -> Icons.Filled.Movie
    "TV_SHOW" -> Icons.Filled.Tv
    "PODCAST_EPISODE" -> Icons.Filled.Mic
    "COMIC" -> Icons.Filled.AutoStories
    "DOCUMENT" -> Icons.Filled.Description
    else -> null
}

private fun mediaTypeLabel(key: String): String = when (key) {
    "BOOK" -> "Books"
    "AUDIOBOOK" -> "Audiobooks"
    "MUSIC_TRACK" -> "Music"
    "MOVIE" -> "Movies"
    "TV_SHOW" -> "TV Shows"
    "PODCAST_EPISODE" -> "Podcasts"
    "COMIC" -> "Comics"
    "DOCUMENT" -> "Documents"
    else -> key
}

private fun TagSortOrder.displayName(): String = when (this) {
    TagSortOrder.BY_USAGE -> "Most used"
    TagSortOrder.ALPHABETICAL -> "Alphabetical"
    TagSortOrder.RECENT -> "Recently used"
}
