package com.universalmedialibrary.ui.detail

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
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
import java.text.DecimalFormat

/**
 * Detail screen showing comprehensive information about a media item
 * including metadata, progress, and actions.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaItemDetailScreen(
    itemId: Long,
    onNavigateBack: () -> Unit,
    onOpenMedia: (Long) -> Unit,
    onEditMetadata: (Long) -> Unit = {},
    viewModel: MediaItemDetailViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val scrollState = rememberScrollState()

    // Load item details
    LaunchedEffect(itemId) {
        viewModel.loadMediaItem(itemId)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(uiState.mediaItem?.fileName ?: "Media Details") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { viewModel.showAddToCollectionDialog() }) {
                        Icon(Icons.Default.PlaylistAdd, contentDescription = "Add to Collection")
                    }
                    IconButton(
                        onClick = { viewModel.fetchMetadata() },
                        enabled = !uiState.isFetchingMetadata
                    ) {
                        if (uiState.isFetchingMetadata) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Default.CloudDownload, contentDescription = "Fetch Metadata")
                        }
                    }
                    IconButton(onClick = { viewModel.toggleFavorite() }) {
                        Icon(
                            if (uiState.isFavorite) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                            contentDescription = "Favorite",
                            tint = if (uiState.isFavorite) Color.Red else LocalContentColor.current
                        )
                    }
                    IconButton(onClick = { uiState.mediaItem?.let { onEditMetadata(it.itemId) } }) {
                        Icon(Icons.Default.Edit, contentDescription = "Edit Metadata")
                    }
                }
            )
        },
        bottomBar = {
            // Action buttons
            Surface(
                modifier = Modifier.fillMaxWidth(),
                tonalElevation = 3.dp
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Button(
                        onClick = { uiState.mediaItem?.let { onOpenMedia(it.itemId) } },
                        modifier = Modifier.weight(1f),
                        enabled = uiState.mediaItem != null
                    ) {
                        Icon(
                            Icons.Default.PlayArrow,
                            contentDescription = null,
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Open")
                    }
                    
                    OutlinedButton(
                        onClick = { /* Share */ },
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(
                            Icons.Default.Share,
                            contentDescription = null,
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Share")
                    }
                }
            }
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
                    ErrorView(
                        error = uiState.error!!,
                        onRetry = { viewModel.loadMediaItem(itemId) },
                        modifier = Modifier.align(Alignment.Center)
                    )
                }
                uiState.mediaItem != null -> {
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .verticalScroll(scrollState)
                            .padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        // Metadata fetch status messages
                        uiState.metadataFetchSuccess?.let { message ->
                            SuccessMessage(message = message, onDismiss = { viewModel.clearMetadataFetchStatus() })
                        }
                        
                        uiState.metadataFetchError?.let { error ->
                            ErrorMessage(message = error, onDismiss = { viewModel.clearMetadataFetchStatus() })
                        }
                        // Cover/Thumbnail Section
                        CoverSection(
                            coverPath = uiState.metadata?.coverImagePath,
                            mediaType = uiState.mediaItem?.mediaType ?: "UNKNOWN"
                        )

                        // Title and Basic Info
                        TitleSection(
                            title = uiState.metadata?.title ?: uiState.mediaItem?.fileName ?: "Unknown",
                            subtitle = uiState.metadata?.originalTitle,
                            mediaType = uiState.mediaItem?.mediaType ?: "UNKNOWN",
                            rating = uiState.metadata?.userRating
                        )

                        // Progress Section
                        uiState.progress?.let { progress ->
                            ProgressSection(
                                progress = progress.progress,
                                lastPosition = progress.lastPosition,
                                totalDuration = progress.duration
                            )
                        }

                        // Summary/Description
                        uiState.metadata?.summary?.let { summary ->
                            SummarySection(summary = summary)
                        }

                        // File Information
                        FileInfoSection(
                            filePath = uiState.mediaItem?.filePath ?: "",
                            fileSize = uiState.mediaItem?.fileSize ?: 0L,
                            fileExtension = uiState.mediaItem?.fileExtension ?: "",
                            dateAdded = uiState.mediaItem?.dateAdded ?: 0L
                        )

                        // Additional Metadata
                        AdditionalMetadataSection(
                            year = uiState.metadata?.year,
                            language = uiState.metadata?.language,
                            country = uiState.metadata?.country
                        )
                    }
                }
            }
        }
    }

    // Add to Collection Dialog
    if (uiState.showAddToCollectionDialog) {
        AddToCollectionDialog(
            collections = uiState.availableCollections,
            onDismiss = { viewModel.hideAddToCollectionDialog() },
            onAddToCollection = { collectionId ->
                viewModel.addToCollection(collectionId)
            }
        )
    }
}

@Composable
private fun CoverSection(
    coverPath: String?,
    mediaType: String
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(300.dp),
        shape = RoundedCornerShape(16.dp)
    ) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            if (coverPath != null) {
                AsyncImage(
                    model = coverPath,
                    contentDescription = "Cover",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            } else {
                // Placeholder with gradient based on media type
                val colors = when (mediaType) {
                    "BOOK" -> listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))
                    "MUSIC" -> listOf(Color(0xFF4A148C), Color(0xFF9C27B0))
                    "MOVIE" -> listOf(Color(0xFF0D47A1), Color(0xFF2196F3))
                    else -> listOf(Color(0xFF37474F), Color(0xFF78909C))
                }
                
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(Brush.linearGradient(colors)),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = when (mediaType) {
                            "BOOK" -> Icons.Default.Book
                            "MUSIC" -> Icons.Default.MusicNote
                            "MOVIE" -> Icons.Default.Movie
                            else -> Icons.Default.InsertDriveFile
                        },
                        contentDescription = null,
                        modifier = Modifier.size(80.dp),
                        tint = Color.White.copy(alpha = 0.7f)
                    )
                }
            }
        }
    }
}

@Composable
private fun TitleSection(
    title: String,
    subtitle: String?,
    mediaType: String,
    rating: Float?
) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = title,
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold
        )
        
        if (subtitle != null) {
            Text(
                text = subtitle,
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        
        Row(
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Chip(text = mediaType.lowercase().replaceFirstChar { it.uppercase() })
            
            rating?.let {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(4.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.Star,
                        contentDescription = null,
                        tint = Color(0xFFFFD700),
                        modifier = Modifier.size(16.dp)
                    )
                    Text(
                        text = String.format("%.1f", it),
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
        }
    }
}

@Composable
private fun ProgressSection(
    progress: Float,
    lastPosition: Long,
    totalDuration: Long?
) {
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
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Progress",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = "${(progress * 100).toInt()}%",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.primary
                )
            }
            
            LinearProgressIndicator(
                progress = progress,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(8.dp)
                    .clip(RoundedCornerShape(4.dp))
            )
            
            totalDuration?.let { duration ->
                Text(
                    text = "${formatTime(lastPosition)} / ${formatTime(duration)}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        }
    }
}

@Composable
private fun SummarySection(summary: String) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = "Summary",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            Text(
                text = summary,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun FileInfoSection(
    filePath: String,
    fileSize: Long,
    fileExtension: String,
    dateAdded: Long
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = "File Information",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            
            InfoRow(label = "Format", value = fileExtension.uppercase())
            InfoRow(label = "Size", value = formatFileSize(fileSize))
            InfoRow(label = "Location", value = filePath.substringBeforeLast('/'))
            InfoRow(label = "Added", value = formatDate(dateAdded))
        }
    }
}

@Composable
private fun AdditionalMetadataSection(
    year: Int?,
    language: String?,
    country: String?
) {
    if (year != null || language != null || country != null) {
        Card(modifier = Modifier.fillMaxWidth()) {
            Column(
                modifier = Modifier.padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = "Additional Information",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                
                year?.let { InfoRow(label = "Year", value = it.toString()) }
                language?.let { InfoRow(label = "Language", value = it) }
                country?.let { InfoRow(label = "Country", value = it) }
            }
        }
    }
}

@Composable
private fun InfoRow(label: String, value: String) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
            modifier = Modifier.weight(1f, fill = false)
        )
    }
}

@Composable
private fun Chip(text: String) {
    Surface(
        shape = RoundedCornerShape(8.dp),
        color = MaterialTheme.colorScheme.secondaryContainer
    ) {
        Text(
            text = text,
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
            style = MaterialTheme.typography.labelMedium,
            color = MaterialTheme.colorScheme.onSecondaryContainer
        )
    }
}

@Composable
private fun ErrorView(
    error: String,
    onRetry: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Icon(
            Icons.Default.Error,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.error
        )
        Text(
            text = "Error loading media item",
            style = MaterialTheme.typography.titleMedium
        )
        Text(
            text = error,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Button(onClick = onRetry) {
            Text("Retry")
        }
    }
}

private fun formatFileSize(bytes: Long): String {
    if (bytes <= 0) return "0 B"
    val units = arrayOf("B", "KB", "MB", "GB", "TB")
    val digitGroups = (Math.log10(bytes.toDouble()) / Math.log10(1024.0)).toInt()
    return DecimalFormat("#,##0.#").format(bytes / Math.pow(1024.0, digitGroups.toDouble())) + " " + units[digitGroups]
}

private fun formatTime(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val minutes = seconds / 60
    val hours = minutes / 60
    
    return when {
        hours > 0 -> String.format("%d:%02d:%02d", hours, minutes % 60, seconds % 60)
        else -> String.format("%d:%02d", minutes, seconds % 60)
    }
}

private fun formatDate(timestamp: Long): String {
    val sdf = java.text.SimpleDateFormat("MMM dd, yyyy", java.util.Locale.getDefault())
    return sdf.format(java.util.Date(timestamp))
}

@Composable
private fun SuccessMessage(message: String, onDismiss: () -> Unit) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF2E7D32)
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.weight(1f)
            ) {
                Icon(
                    Icons.Default.CheckCircle,
                    contentDescription = null,
                    tint = Color.White
                )
                Text(
                    text = message,
                    color = Color.White,
                    style = MaterialTheme.typography.bodyMedium
                )
            }
            IconButton(onClick = onDismiss) {
                Icon(
                    Icons.Default.Close,
                    contentDescription = "Dismiss",
                    tint = Color.White
                )
            }
        }
    }
}

@Composable
private fun ErrorMessage(message: String, onDismiss: () -> Unit) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.weight(1f)
            ) {
                Icon(
                    Icons.Default.Error,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onErrorContainer
                )
                Text(
                    text = message,
                    color = MaterialTheme.colorScheme.onErrorContainer,
                    style = MaterialTheme.typography.bodyMedium
                )
            }
            IconButton(onClick = onDismiss) {
                Icon(
                    Icons.Default.Close,
                    contentDescription = "Dismiss",
                    tint = MaterialTheme.colorScheme.onErrorContainer
                )
            }
        }
    }
}

@Composable
fun AddToCollectionDialog(
    collections: List<com.universalmedialibrary.data.local.entity.UnifiedCollection>,
    onDismiss: () -> Unit,
    onAddToCollection: (Long) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(Icons.Default.PlaylistAdd, contentDescription = null)
                Text("Add to Collection")
            }
        },
        text = {
            if (collections.isEmpty()) {
                Text("No collections found. Create a collection first.")
            } else {
                LazyColumn(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 400.dp)
                ) {
                    items(collections) { collection ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 4.dp)
                                .clickable {
                                    onAddToCollection(collection.collectionId)
                                    onDismiss()
                                },
                            colors = CardDefaults.cardColors(
                                containerColor = MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp),
                                horizontalArrangement = Arrangement.spacedBy(12.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    imageVector = when (collection.type) {
                                        com.universalmedialibrary.data.local.entity.CollectionType.PLAYLIST -> Icons.Default.PlaylistPlay
                                        com.universalmedialibrary.data.local.entity.CollectionType.SERIES -> Icons.Default.ViewList
                                        com.universalmedialibrary.data.local.entity.CollectionType.READING_LIST -> Icons.Default.MenuBook
                                        com.universalmedialibrary.data.local.entity.CollectionType.WATCH_LIST -> Icons.Default.Visibility
                                        com.universalmedialibrary.data.local.entity.CollectionType.USER_DEFINED -> Icons.Default.Folder
                                        com.universalmedialibrary.data.local.entity.CollectionType.SMART -> Icons.Default.AutoAwesome
                                    },
                                    contentDescription = null
                                )
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = collection.name,
                                        style = MaterialTheme.typography.titleMedium
                                    )
                                    Text(
                                        text = "${collection.type.name.replace('_', ' ').lowercase().replaceFirstChar { it.uppercase() }} • ${collection.itemCount} items",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                                Icon(Icons.Default.ChevronRight, contentDescription = null)
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
