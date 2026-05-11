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

/**
 * Gallery Screen
 * 
 * Main gallery view with albums, smart collections, and media browsing.
 * Provides a Plex-like experience with advanced organization features.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GalleryScreen(
    onNavigateBack: () -> Unit,
    viewModel: GalleryViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val context = LocalContext.current
    
    // Permission handling
    val hasPermission = rememberStoragePermissionState()
    
    // Delete confirmation launcher (Android 11+)
    val deleteLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartIntentSenderForResult()
    ) { result ->
        if (result.resultCode == android.app.Activity.RESULT_OK) {
            viewModel.onDeleteConfirmed()
        } else {
            viewModel.onDeleteCancelled()
        }
    }
    
    // Handle pending delete request
    LaunchedEffect(uiState.pendingDeleteRequest) {
        uiState.pendingDeleteRequest?.let { request ->
            deleteLauncher.launch(
                IntentSenderRequest.Builder(request.pendingIntent.intentSender).build()
            )
        }
    }
    
    // Handle share
    LaunchedEffect(uiState.pendingShareItems) {
        uiState.pendingShareItems?.let { items ->
            // Launch share intent
            viewModel.onShareHandled()
        }
    }
    
    Scaffold(
        topBar = {
            GalleryTopBar(
                state = uiState,
                onNavigateBack = {
                    if (uiState.isInAlbum) {
                        viewModel.onEvent(GalleryEvent.NavigateBack)
                    } else {
                        onNavigateBack()
                    }
                },
                onSearch = { viewModel.onEvent(GalleryEvent.Search(it)) },
                onSortOrderSelected = { viewModel.onEvent(GalleryEvent.SetSortOrder(it)) },
                onViewModeSelected = { viewModel.onEvent(GalleryEvent.SetViewMode(it)) },
                onSelectAll = { viewModel.onEvent(GalleryEvent.SelectAll) },
                onClearSelection = { viewModel.onEvent(GalleryEvent.ClearSelection) }
            )
        },
        bottomBar = {
            AnimatedVisibility(
                visible = uiState.isSelectionMode,
                enter = slideInVertically(initialOffsetY = { it }),
                exit = slideOutVertically(targetOffsetY = { it })
            ) {
                GallerySelectionBottomBar(
                    selectedCount = uiState.selectedCount,
                    onShare = { viewModel.onEvent(GalleryEvent.ShareItems(uiState.selectedItemIds)) },
                    onFavorite = { 
                        uiState.selectedItemIds.forEach { 
                            viewModel.onEvent(GalleryEvent.ToggleFavorite(it)) 
                        }
                    },
                    onHide = { viewModel.onEvent(GalleryEvent.HideItems(uiState.selectedItemIds)) },
                    onDelete = { viewModel.onEvent(GalleryEvent.DeleteItems(uiState.selectedItemIds)) }
                )
            }
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            if (!hasPermission) {
                PermissionRequestContent()
            } else {
                when {
                    uiState.isLoading -> {
                        LoadingContent()
                    }
                    uiState.currentItem != null -> {
                        GalleryDetailView(
                            item = uiState.currentItem!!,
                            onBack = { viewModel.onEvent(GalleryEvent.NavigateBack) },
                            onToggleFavorite = { viewModel.onEvent(GalleryEvent.ToggleFavorite(it)) },
                            onShare = { viewModel.onEvent(GalleryEvent.ShareItems(setOf(it))) },
                            onDelete = { viewModel.onEvent(GalleryEvent.DeleteItems(setOf(it))) }
                        )
                    }
                    uiState.isInAlbum -> {
                        GalleryMediaContent(
                            items = uiState.items,
                            selectedIds = uiState.selectedItemIds,
                            isSelectionMode = uiState.isSelectionMode,
                            gridColumns = uiState.gridColumns,
                            onItemClick = { item ->
                                if (uiState.isSelectionMode) {
                                    viewModel.onEvent(GalleryEvent.ToggleSelection(item.id))
                                } else {
                                    viewModel.onEvent(GalleryEvent.OpenItem(item.id))
                                }
                            },
                            onItemLongClick = { item ->
                                viewModel.onEvent(GalleryEvent.SetSelectionMode(true))
                                viewModel.onEvent(GalleryEvent.ToggleSelection(item.id))
                            }
                        )
                    }
                    else -> {
                        GalleryHomeContent(
                            state = uiState,
                            onAlbumClick = { viewModel.onEvent(GalleryEvent.OpenAlbum(it.id)) },
                            onSmartCollectionClick = { viewModel.onEvent(GalleryEvent.OpenSmartCollection(it.type)) },
                            onRefresh = { viewModel.onEvent(GalleryEvent.Refresh) }
                        )
                    }
                }
            }
            
            // Error snackbar
            uiState.error?.let { error ->
                Snackbar(
                    modifier = Modifier
                        .align(Alignment.BottomCenter)
                        .padding(16.dp),
                    action = {
                        TextButton(onClick = { viewModel.clearError() }) {
                            Text("Dismiss")
                        }
                    }
                ) {
                    Text(error)
                }
            }
        }
    }
}

@Composable
private fun rememberStoragePermissionState(): Boolean {
    val permission = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
        Manifest.permission.READ_MEDIA_IMAGES
    } else {
        Manifest.permission.READ_EXTERNAL_STORAGE
    }
    
    var hasPermission by remember { mutableStateOf(false) }
    
    val launcher = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted ->
        hasPermission = isGranted
    }
    
    LaunchedEffect(Unit) {
        launcher.launch(permission)
    }
    
    return hasPermission
}


@Composable
private fun GallerySelectionBottomBar(
    selectedCount: Int,
    onShare: () -> Unit,
    onFavorite: () -> Unit,
    onHide: () -> Unit,
    onDelete: () -> Unit
) {
    Surface(
        tonalElevation = 3.dp
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            IconButton(onClick = onShare) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(Icons.Default.Share, "Share")
                    Text("Share", style = MaterialTheme.typography.labelSmall)
                }
            }
            IconButton(onClick = onFavorite) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(Icons.Default.Favorite, "Favorite")
                    Text("Favorite", style = MaterialTheme.typography.labelSmall)
                }
            }
            IconButton(onClick = onHide) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(Icons.Default.VisibilityOff, "Hide")
                    Text("Hide", style = MaterialTheme.typography.labelSmall)
                }
            }
            IconButton(onClick = onDelete) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Icon(Icons.Default.Delete, "Delete", tint = MaterialTheme.colorScheme.error)
                    Text("Delete", style = MaterialTheme.typography.labelSmall, color = MaterialTheme.colorScheme.error)
                }
            }
        }
    }
}


@Composable
private fun SmartCollectionChip(
    collection: SmartGalleryCollection,
    onClick: () -> Unit
) {
    Surface(
        onClick = onClick,
        shape = RoundedCornerShape(16.dp),
        color = MaterialTheme.colorScheme.secondaryContainer,
        modifier = Modifier.width(140.dp)
    ) {
        Column(
            modifier = Modifier.padding(12.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = collection.type.toIcon(),
                contentDescription = "Media image",
                modifier = Modifier.size(24.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = collection.name,
                style = MaterialTheme.typography.labelMedium,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            Text(
                text = "${collection.itemCount}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}


@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun GalleryMediaContent(
    items: List<GalleryItem>,
    selectedIds: Set<Long>,
    isSelectionMode: Boolean,
    gridColumns: Int,
    onItemClick: (GalleryItem) -> Unit,
    onItemLongClick: (GalleryItem) -> Unit
) {
    if (items.isEmpty()) {
        EmptyStateContent(message = "No items in this album")
        return
    }
    
    LazyVerticalGrid(
        columns = GridCells.Fixed(gridColumns),
        contentPadding = PaddingValues(4.dp),
        horizontalArrangement = Arrangement.spacedBy(4.dp),
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        items(items, key = { it.id }) { item ->
            MediaItemCard(
                item = item,
                isSelected = item.id in selectedIds,
                isSelectionMode = isSelectionMode,
                onClick = { onItemClick(item) },
                onLongClick = { onItemLongClick(item) }
            )
        }
    }
}



@Composable
private fun InfoRow(label: String, value: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium
        )
    }
}

@Composable
private fun LoadingContent() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        CircularProgressIndicator()
    }
}

@Composable
private fun EmptyStateContent(message: String) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Icon(
                Icons.Default.PhotoLibrary,
                contentDescription = "Media image",
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f)
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = message,
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun PermissionRequestContent() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.Photo,
                contentDescription = "Media image",
                modifier = Modifier.size(80.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.height(24.dp))
            Text(
                text = "Storage Permission Required",
                style = MaterialTheme.typography.titleLarge,
                textAlign = TextAlign.Center
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "To view your photos and videos, please grant storage access.",
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

// Extension functions
private fun GallerySortOrder.toDisplayName(): String = when (this) {
    GallerySortOrder.DATE_TAKEN_DESC -> "Date Taken (Newest)"
    GallerySortOrder.DATE_TAKEN_ASC -> "Date Taken (Oldest)"
    GallerySortOrder.DATE_ADDED_DESC -> "Date Added (Newest)"
    GallerySortOrder.DATE_ADDED_ASC -> "Date Added (Oldest)"
    GallerySortOrder.DATE_MODIFIED_DESC -> "Date Modified (Newest)"
    GallerySortOrder.DATE_MODIFIED_ASC -> "Date Modified (Oldest)"
    GallerySortOrder.NAME_ASC -> "Name (A-Z)"
    GallerySortOrder.NAME_DESC -> "Name (Z-A)"
    GallerySortOrder.SIZE_DESC -> "Size (Largest)"
    GallerySortOrder.SIZE_ASC -> "Size (Smallest)"
    GallerySortOrder.DURATION_DESC -> "Duration (Longest)"
    GallerySortOrder.DURATION_ASC -> "Duration (Shortest)"
    GallerySortOrder.RATING_DESC -> "Rating (Highest)"
    GallerySortOrder.RATING_ASC -> "Rating (Lowest)"
    GallerySortOrder.RANDOM -> "Random"
}

private fun SmartGalleryCollectionType.toIcon(): androidx.compose.ui.graphics.vector.ImageVector = when (this) {
    SmartGalleryCollectionType.FAVORITES -> Icons.Default.Favorite
    SmartGalleryCollectionType.RECENTLY_ADDED -> Icons.Default.Schedule
    SmartGalleryCollectionType.TODAY -> Icons.Default.Today
    SmartGalleryCollectionType.YESTERDAY -> Icons.Default.DateRange
    SmartGalleryCollectionType.THIS_WEEK -> Icons.Default.CalendarMonth
    SmartGalleryCollectionType.THIS_MONTH -> Icons.Default.CalendarMonth
    SmartGalleryCollectionType.THIS_YEAR -> Icons.Default.CalendarMonth
    SmartGalleryCollectionType.ON_THIS_DAY -> Icons.Default.AutoAwesome
    SmartGalleryCollectionType.VIDEOS -> Icons.Default.Videocam
    SmartGalleryCollectionType.SCREENSHOTS -> Icons.Default.Screenshot
    SmartGalleryCollectionType.PLACES -> Icons.Default.Place
    SmartGalleryCollectionType.PEOPLE -> Icons.Default.People
    SmartGalleryCollectionType.SELFIES -> Icons.Default.Face
    SmartGalleryCollectionType.DOCUMENTS -> Icons.Default.Description
    SmartGalleryCollectionType.RECEIPTS -> Icons.Default.Receipt
    SmartGalleryCollectionType.LANDSCAPES -> Icons.Default.Landscape
    SmartGalleryCollectionType.PORTRAITS -> Icons.Default.Portrait
    SmartGalleryCollectionType.ANIMALS -> Icons.Default.Pets
    SmartGalleryCollectionType.FOOD -> Icons.Default.Restaurant
    SmartGalleryCollectionType.TRAVEL -> Icons.Default.Flight
    SmartGalleryCollectionType.LIVE_PHOTOS -> Icons.Default.Animation
    SmartGalleryCollectionType.SLOW_MOTION -> Icons.Default.SlowMotionVideo
    SmartGalleryCollectionType.TIME_LAPSE -> Icons.Default.Timelapse
    SmartGalleryCollectionType.PANORAMAS -> Icons.Default.Panorama
    SmartGalleryCollectionType.RAW_PHOTOS -> Icons.Default.RawOn
    SmartGalleryCollectionType.RECENTLY_EDITED -> Icons.Default.Edit
    SmartGalleryCollectionType.RECENTLY_SHARED -> Icons.Default.Share
    SmartGalleryCollectionType.CUSTOM_FILTER -> Icons.Default.FilterList
}
