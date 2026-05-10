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
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
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
import androidx.compose.ui.platform.LocalContext
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.data.local.entity.UnifiedTag
import java.text.DecimalFormat
import kotlin.math.log10
import kotlin.math.pow

/**
 * Detail screen showing comprehensive information about a media item
 * including metadata, progress, and actions.
 */
@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
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
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
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
                    IconButton(
                        onClick = { viewModel.regenerateThumbnail() },
                        enabled = uiState.thumbnailTask?.status != BackgroundTaskStatus.RUNNING
                    ) {
                        if (uiState.thumbnailTask?.status == BackgroundTaskStatus.RUNNING) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Default.Refresh, contentDescription = "Regenerate Thumbnail")
                        }
                    }
                    IconButton(
                        onClick = { viewModel.suggestTags() },
                        enabled = !uiState.isSuggestingTags
                    ) {
                        if (uiState.isSuggestingTags) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Default.AutoAwesome, contentDescription = "AI Tag Suggestion")
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
                            contentDescription = "Media image",
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
                            contentDescription = "Media image",
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

                        uiState.metadataRefreshTask?.let { task ->
                            BackgroundTaskCard(
                                task = task,
                                onDismiss = { viewModel.clearBackgroundTask(BackgroundTaskType.METADATA) }
                            )
                        }

                        uiState.thumbnailTask?.let { task ->
                            BackgroundTaskCard(
                                task = task,
                                onDismiss = { viewModel.clearBackgroundTask(BackgroundTaskType.THUMBNAIL) }
                            )
                        }

                        // Tag suggestion error
                        uiState.tagSuggestionError?.let { error ->
                            ErrorMessage(message = error, onDismiss = { viewModel.dismissTagSuggestions() })
                        }

                        // Cover/Thumbnail Section
                        CoverSection(
                            coverPath = uiState.metadata?.coverImagePath,
                            mediaType = uiState.mediaItem?.mediaType ?: "UNKNOWN",
                            cacheVersion = uiState.imageCacheVersion
                        )

                        // Title and Basic Info
                        TitleSection(
                            title = uiState.metadata?.title ?: uiState.mediaItem?.fileName ?: "Unknown",
                            subtitle = uiState.metadata?.originalTitle,
                            mediaType = uiState.mediaItem?.mediaType ?: "UNKNOWN",
                            rating = uiState.metadata?.userRating
                        )

                        // Tags Section
                        TagsSection(tags = uiState.tags)

                        // Progress Section
                        uiState.progress?.let { progress ->
                            ProgressSection(
                                progress = progress.percentage,
                                lastPosition = progress.currentPosition,
                                totalDuration = null // Duration not stored in ReadingProgress
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

    // Tag Suggestion Dialog
    if (uiState.suggestedTags.isNotEmpty()) {
        TagSuggestionDialog(
            suggestedTags = uiState.suggestedTags,
            onDismiss = { viewModel.dismissTagSuggestions() },
            onSave = { selectedTags -> viewModel.saveSuggestedTags(selectedTags) }
        )
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun TagsSection(tags: List<UnifiedTag>) {
    if (tags.isNotEmpty()) {
        Card(modifier = Modifier.fillMaxWidth()) {
            Column(
                modifier = Modifier.padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = "Tags",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                FlowRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    tags.forEach { tag ->
                        Chip(text = tag.name)
                    }
                }
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
            contentDescription = "Media image",
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
    val digitGroups = (log10(bytes.toDouble()) / log10(1024.0)).toInt().coerceIn(0, units.lastIndex)
    return DecimalFormat("#,##0.#").format(bytes / 1024.0.pow(digitGroups.toDouble())) + " " + units[digitGroups]
}

private fun formatTime(milliseconds: Long): String {
    val seconds = milliseconds / 1000
    val minutes = seconds / 60
    val hours = minutes / 60
    
    return when {
        hours > 0 -> String.format(java.util.Locale.US, "%d:%02d:%02d", hours, minutes % 60, seconds % 60)
        else -> String.format(java.util.Locale.US, "%d:%02d", minutes, seconds % 60)
    }
}

private fun formatDate(timestamp: Long): String {
    val sdf = java.text.SimpleDateFormat("MMM dd, yyyy", java.util.Locale.getDefault())
    return sdf.format(java.util.Date(timestamp))
}



