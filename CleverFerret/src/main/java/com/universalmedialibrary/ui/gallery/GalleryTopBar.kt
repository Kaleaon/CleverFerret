package com.universalmedialibrary.ui.gallery

import android.Manifest
import android.os.Build
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.IntentSenderRequest
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.*
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.services.gallery.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun GalleryTopBar(
    state: GalleryUiState,
    onNavigateBack: () -> Unit,
    onSearch: (String) -> Unit,
    onSortOrderSelected: (GallerySortOrder) -> Unit,
    onViewModeSelected: (GalleryViewMode) -> Unit,
    onSelectAll: () -> Unit,
    onClearSelection: () -> Unit
) {
    var showSortMenu by remember { mutableStateOf(false) }
    var showViewMenu by remember { mutableStateOf(false) }
    var isSearching by remember { mutableStateOf(false) }
    
    TopAppBar(
        title = {
            if (isSearching) {
                OutlinedTextField(
                    value = state.searchQuery,
                    onValueChange = onSearch,
                    placeholder = { Text("Search gallery...") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
            } else if (state.isSelectionMode) {
                Text("${state.selectedCount} selected")
            } else {
                Column {
                    Text(state.currentTitle)
                    if (state.isInAlbum) {
                        Text(
                            "${state.items.size} items",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
            }
        },
        navigationIcon = {
            IconButton(onClick = {
                if (isSearching) {
                    isSearching = false
                    onSearch("")
                } else {
                    onNavigateBack()
                }
            }) {
                Icon(
                    Icons.AutoMirrored.Filled.ArrowBack,
                    contentDescription = "Back"
                )
            }
        },
        actions = {
            if (state.isSelectionMode) {
                IconButton(onClick = onSelectAll) {
                    Icon(Icons.Default.SelectAll, "Select all")
                }
                IconButton(onClick = onClearSelection) {
                    Icon(Icons.Default.Close, "Clear selection")
                }
            } else {
                IconButton(onClick = { isSearching = !isSearching }) {
                    Icon(Icons.Default.Search, "Search")
                }
                
                IconButton(onClick = { showSortMenu = true }) {
                    Icon(Icons.AutoMirrored.Filled.Sort, "Sort")
                }
                
                DropdownMenu(
                    expanded = showSortMenu,
                    onDismissRequest = { showSortMenu = false }
                ) {
                    GallerySortOrder.entries.forEach { order ->
                        DropdownMenuItem(
                            text = { Text(order.toDisplayName()) },
                            onClick = {
                                onSortOrderSelected(order)
                                showSortMenu = false
                            },
                            leadingIcon = if (state.sortOrder == order) {
                                { Icon(Icons.Default.Check, null) }
                            } else null
                        )
                    }
                }
                
                IconButton(onClick = { showViewMenu = true }) {
                    Icon(Icons.Default.GridView, "View mode")
                }
                
                DropdownMenu(
                    expanded = showViewMenu,
                    onDismissRequest = { showViewMenu = false }
                ) {
                    listOf(
                        GalleryViewMode.GRID_SMALL to "Small Grid",
                        GalleryViewMode.GRID_MEDIUM to "Medium Grid",
                        GalleryViewMode.GRID_LARGE to "Large Grid",
                        GalleryViewMode.LIST to "List"
                    ).forEach { (mode, name) ->
                        DropdownMenuItem(
                            text = { Text(name) },
                            onClick = {
                                onViewModeSelected(mode)
                                showViewMenu = false
                            },
                            leadingIcon = if (state.viewMode == mode) {
                                { Icon(Icons.Default.Check, null) }
                            } else null
                        )
                    }
                }
            }
        }
    )
}
