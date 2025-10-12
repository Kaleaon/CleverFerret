package com.universalmedialibrary.ui.collections

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.entity.CollectionType
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.UnifiedCollection
import kotlin.math.log10
import kotlin.math.pow

/**
 * Collection detail screen showing items in a collection
 */
@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun CollectionDetailScreen(
    collectionId: Long,
    onNavigateBack: () -> Unit,
    onOpenItem: (Long) -> Unit,
    viewModel: CollectionDetailViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    LaunchedEffect(collectionId) {
        viewModel.loadCollection(collectionId)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(uiState.collection?.name ?: "Collection") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.toggleEditMode() }) {
                        Icon(
                            if (uiState.isEditMode) Icons.Default.Done else Icons.Default.Edit,
                            contentDescription = if (uiState.isEditMode) "Done" else "Edit"
                        )
                    }
                    var showMenu by remember { mutableStateOf(false) }
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, contentDescription = "More")
                    }
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        DropdownMenuItem(
                            text = { Text("Delete Collection") },
                            onClick = {
                                showMenu = false
                                viewModel.deleteCollection()
                                onNavigateBack()
                            },
                            leadingIcon = {
                                Icon(Icons.Default.Delete, contentDescription = null)
                            }
                        )
                    }
                }
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { viewModel.showAddItemsDialog() },
                icon = { Icon(Icons.Default.Add, contentDescription = null) },
                text = { Text("Add Items") }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            when {
                uiState.isLoading -> {
                    CircularProgressIndicator(
                        modifier = Modifier.align(Alignment.Center)
                    )
                }
                uiState.error != null -> {
                    Column(
                        modifier = Modifier
                            .align(Alignment.Center)
                            .padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Icon(
                            Icons.Default.Error,
                            contentDescription = null,
                            modifier = Modifier.size(64.dp),
                            tint = MaterialTheme.colorScheme.error
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = uiState.error!!,
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                }
                uiState.items.isEmpty() -> {
                    Column(
                        modifier = Modifier
                            .align(Alignment.Center)
                            .padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Icon(
                            Icons.Default.LibraryAdd,
                            contentDescription = null,
                            modifier = Modifier.size(64.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = "No items in this collection",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "Tap the + button to add items",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                else -> {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        contentPadding = PaddingValues(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        // Collection info header
                        item {
                            CollectionHeader(
                                collection = uiState.collection,
                                itemCount = uiState.items.size
                            )
                        }

                        // Collection items
                        items(
                            items = uiState.items,
                            key = { it.itemId }
                        ) { item ->
                            CollectionItemCard(
                                item = item,
                                isEditMode = uiState.isEditMode,
                                onClick = { onOpenItem(item.itemId) },
                                onRemove = { viewModel.removeItem(item.itemId) },
                                modifier = Modifier
                            )
                        }
                    }
                }
            }
        }
    }

    // Add items dialog
    if (uiState.showAddItemsDialog) {
        AddItemsToCollectionDialog(
            collectionId = collectionId,
            onDismiss = { viewModel.hideAddItemsDialog() },
            onItemsAdded = { items ->
                viewModel.addItems(items)
                viewModel.hideAddItemsDialog()
            }
        )
    }
}

@Composable
private fun CollectionHeader(
    collection: UnifiedCollection?,
    itemCount: Int
) {
    collection?.let {
        Card(
            modifier = Modifier.fillMaxWidth(),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.primaryContainer
            )
        ) {
            Column(
                modifier = Modifier.padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = when (it.type) {
                            CollectionType.PLAYLIST -> Icons.Default.PlaylistPlay
                            CollectionType.SERIES -> Icons.Default.ViewList
                            CollectionType.READING_LIST -> Icons.Default.MenuBook
                            CollectionType.WATCH_LIST -> Icons.Default.Visibility
                            CollectionType.USER_DEFINED -> Icons.Default.Folder
                            CollectionType.SMART -> Icons.Default.AutoAwesome
                        },
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Text(
                        text = it.type.name.replace('_', ' ').lowercase()
                            .replaceFirstChar { char -> char.uppercase() },
                        style = MaterialTheme.typography.labelLarge,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }

                if (it.description != null) {
                    Text(
                        text = it.description,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }

                Text(
                    text = "$itemCount items",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        }
    }
}

@Composable
private fun CollectionItemCard(
    item: MediaItem,
    isEditMode: Boolean,
    onClick: () -> Unit,
    onRemove: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable(enabled = !isEditMode, onClick = onClick)
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Thumbnail placeholder or image
            Box(
                modifier = Modifier
                    .size(60.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .background(
                        Brush.linearGradient(
                            colors = when (item.mediaType.uppercase()) {
                                "BOOK" -> listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))
                                "MUSIC" -> listOf(Color(0xFF4A148C), Color(0xFF9C27B0))
                                "MOVIE" -> listOf(Color(0xFF0D47A1), Color(0xFF2196F3))
                                else -> listOf(Color(0xFF37474F), Color(0xFF78909C))
                            }
                        )
                    ),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = when (item.mediaType.uppercase()) {
                        "BOOK" -> Icons.Default.Book
                        "MUSIC" -> Icons.Default.MusicNote
                        "MOVIE" -> Icons.Default.Movie
                        else -> Icons.Default.InsertDriveFile
                    },
                    contentDescription = null,
                    tint = Color.White.copy(alpha = 0.7f),
                    modifier = Modifier.size(32.dp)
                )
            }

            // Item info
            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = item.fileName.substringBeforeLast('.'),
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                ) 
                
                Text(
                    text = "${item.mediaType} • ${formatFileSize(item.fileSize)}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            // Remove button in edit mode
            if (isEditMode) {
                IconButton(onClick = onRemove) {
                    Icon(
                        Icons.Default.RemoveCircle,
                        contentDescription = "Remove",
                        tint = MaterialTheme.colorScheme.error
                    )
                }
            } else {
                Icon(
                    Icons.Default.ChevronRight,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun AddItemsToCollectionDialog(
    collectionId: Long,
    onDismiss: () -> Unit,
    onItemsAdded: (List<Long>) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Items to Collection") },
        text = {
            Text("Feature coming soon: Browse and select items to add")
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("OK")
            }
        }
    )
}

private fun formatFileSize(bytes: Long): String {
    if (bytes <= 0) return "0 B"
    val units = arrayOf("B", "KB", "MB", "GB", "TB")
    val digitGroups = (log10(bytes.toDouble()) / log10(1024.0)).toInt()
    return String.format(
        java.util.Locale.US,
        "%.1f %s",
        bytes / 1024.0.pow(digitGroups.toDouble()),
        units[digitGroups]
    )
}
