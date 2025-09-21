package com.universalmedialibrary.ui.screens

import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.model.MediaItem
import com.universalmedialibrary.services.media.UniversalMediaPlayerService
import com.universalmedialibrary.services.reader.UniversalReaderService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject

/**
 * Media Launcher Screen
 * 
 * Central hub for launching all media types with their appropriate players/readers:
 * - E-books (EPUB, PDF, TXT) → Universal Reader
 * - Videos (MP4, MKV, AVI, etc.) → Enhanced Video Player
 * - Audio (MP3, FLAC, WAV, etc.) → Audio Player
 * - Comics (CBZ, CBR) → Comic Reader
 * - Documents (PDF, DOC, TXT) → Document Reader
 * 
 * Features:
 * - Automatic format detection
 * - Multiple player/reader options
 * - Recent media tracking
 * - Favorites management
 * - Continue reading/watching functionality
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaLauncherScreen(
    mediaItems: List<MediaItem>,
    onNavigateToReader: (MediaItem) -> Unit,
    onNavigateToVideoPlayer: (MediaItem) -> Unit,
    onNavigateToAudioPlayer: (MediaItem) -> Unit,
    onNavigateToComicReader: (MediaItem) -> Unit,
    viewModel: MediaLauncherViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val uiState by viewModel.uiState.collectAsState()
    
    LaunchedEffect(mediaItems) {
        viewModel.loadMediaItems(mediaItems)
    }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Header
        Text(
            text = "Universal Media Library",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold,
            modifier = Modifier.padding(bottom = 24.dp)
        )
        
        // Quick Stats
        MediaStatsRow(
            totalItems = mediaItems.size,
            recentItems = uiState.recentItems.size,
            favoriteItems = uiState.favoriteItems.size,
            modifier = Modifier.padding(bottom = 24.dp)
        )
        
        // Media Categories
        LazyColumn(
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Recent Items
            if (uiState.recentItems.isNotEmpty()) {
                item {
                    MediaCategorySection(
                        title = "Continue Reading/Watching",
                        icon = Icons.Default.History,
                        items = uiState.recentItems,
                        onItemClick = { item ->
                            launchMediaItem(
                                context = context,
                                item = item,
                                onNavigateToReader = onNavigateToReader,
                                onNavigateToVideoPlayer = onNavigateToVideoPlayer,
                                onNavigateToAudioPlayer = onNavigateToAudioPlayer,
                                onNavigateToComicReader = onNavigateToComicReader
                            )
                        }
                    )
                }
            }
            
            // Favorites
            if (uiState.favoriteItems.isNotEmpty()) {
                item {
                    MediaCategorySection(
                        title = "Favorites",
                        icon = Icons.Default.Favorite,
                        items = uiState.favoriteItems,
                        onItemClick = { item ->
                            launchMediaItem(
                                context = context,
                                item = item,
                                onNavigateToReader = onNavigateToReader,
                                onNavigateToVideoPlayer = onNavigateToVideoPlayer,
                                onNavigateToAudioPlayer = onNavigateToAudioPlayer,
                                onNavigateToComicReader = onNavigateToComicReader
                            )
                        }
                    )
                }
            }
            
            // Books & E-books
            val books = mediaItems.filter { 
                it.mediaType in listOf(MediaType.BOOK, MediaType.AUDIOBOOK) 
            }
            if (books.isNotEmpty()) {
                item {
                    MediaCategorySection(
                        title = "Books & E-books",
                        icon = Icons.Default.MenuBook,
                        items = books,
                        onItemClick = onNavigateToReader
                    )
                }
            }
            
            // Videos
            val videos = mediaItems.filter { 
                it.mediaType in listOf(MediaType.MOVIE, MediaType.TV_SHOW) 
            }
            if (videos.isNotEmpty()) {
                item {
                    MediaCategorySection(
                        title = "Videos & Movies",
                        icon = Icons.Default.VideoLibrary,
                        items = videos,
                        onItemClick = onNavigateToVideoPlayer
                    )
                }
            }
            
            // Audio
            val audio = mediaItems.filter { 
                it.mediaType in listOf(MediaType.MUSIC, MediaType.PODCAST) 
            }
            if (audio.isNotEmpty()) {
                item {
                    MediaCategorySection(
                        title = "Music & Audio",
                        icon = Icons.Default.LibraryMusic,
                        items = audio,
                        onItemClick = onNavigateToAudioPlayer
                    )
                }
            }
            
            // Comics
            val comics = mediaItems.filter { it.mediaType == MediaType.COMIC }
            if (comics.isNotEmpty()) {
                item {
                    MediaCategorySection(
                        title = "Comics & Manga",
                        icon = Icons.Default.CollectionsBookmark,
                        items = comics,
                        onItemClick = onNavigateToComicReader
                    )
                }
            }
            
            // Documents
            val documents = mediaItems.filter { 
                it.mediaType in listOf(MediaType.DOCUMENT, MediaType.ACADEMIC_PAPER, MediaType.MAGAZINE) 
            }
            if (documents.isNotEmpty()) {
                item {
                    MediaCategorySection(
                        title = "Documents & Papers",
                        icon = Icons.Default.Description,
                        items = documents,
                        onItemClick = onNavigateToReader
                    )
                }
            }
            
            // All Media (fallback)
            if (mediaItems.isNotEmpty() && books.isEmpty() && videos.isEmpty() && audio.isEmpty() && comics.isEmpty() && documents.isEmpty()) {
                item {
                    MediaCategorySection(
                        title = "All Media",
                        icon = Icons.Default.LibraryBooks,
                        items = mediaItems,
                        onItemClick = { item ->
                            launchMediaItem(
                                context = context,
                                item = item,
                                onNavigateToReader = onNavigateToReader,
                                onNavigateToVideoPlayer = onNavigateToVideoPlayer,
                                onNavigateToAudioPlayer = onNavigateToAudioPlayer,
                                onNavigateToComicReader = onNavigateToComicReader
                            )
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun MediaStatsRow(
    totalItems: Int,
    recentItems: Int,
    favoriteItems: Int,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly
    ) {
        StatCard(
            title = "Total",
            value = totalItems.toString(),
            icon = Icons.Default.LibraryBooks
        )
        StatCard(
            title = "Recent",
            value = recentItems.toString(),
            icon = Icons.Default.History
        )
        StatCard(
            title = "Favorites",
            value = favoriteItems.toString(),
            icon = Icons.Default.Favorite
        )
    }
}

@Composable
private fun StatCard(
    title: String,
    value: String,
    icon: ImageVector,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(24.dp)
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = value,
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = title,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun MediaCategorySection(
    title: String,
    icon: ImageVector,
    items: List<MediaItem>,
    onItemClick: (MediaItem) -> Unit,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.padding(bottom = 12.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(20.dp)
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = title,
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Medium
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = "(${items.size})",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        
        items.take(5).forEach { item -> // Show first 5 items
            MediaItemCard(
                item = item,
                onClick = { onItemClick(item) },
                modifier = Modifier.padding(bottom = 8.dp)
            )
        }
        
        if (items.size > 5) {
            TextButton(
                onClick = { /* TODO: Show all items */ },
                modifier = Modifier.align(Alignment.CenterHorizontally)
            ) {
                Text("Show all ${items.size} items")
            }
        }
    }
}

@Composable
private fun MediaItemCard(
    item: MediaItem,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth(),
        onClick = onClick,
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = getMediaTypeIcon(item.mediaType),
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(40.dp)
            )
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = item.fileName,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = item.mediaType.name,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    text = formatFileSize(item.fileSize),
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            IconButton(onClick = { /* TODO: More options */ }) {
                Icon(
                    imageVector = Icons.Default.MoreVert,
                    contentDescription = "More options"
                )
            }
        }
    }
}

private fun getMediaTypeIcon(mediaType: MediaType): ImageVector {
    return when (mediaType) {
        MediaType.BOOK, MediaType.AUDIOBOOK -> Icons.Default.MenuBook
        MediaType.MOVIE, MediaType.TV_SHOW -> Icons.Default.Movie
        MediaType.MUSIC -> Icons.Default.MusicNote
        MediaType.PODCAST -> Icons.Default.Podcast
        MediaType.COMIC -> Icons.Default.CollectionsBookmark
        MediaType.MAGAZINE -> Icons.Default.Article
        MediaType.DOCUMENT -> Icons.Default.Description
        MediaType.ACADEMIC_PAPER -> Icons.Default.School
        MediaType.WEB_FICTION -> Icons.Default.Language
        MediaType.UNKNOWN -> Icons.Default.InsertDriveFile
    }
}

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

private fun launchMediaItem(
    context: Context,
    item: MediaItem,
    onNavigateToReader: (MediaItem) -> Unit,
    onNavigateToVideoPlayer: (MediaItem) -> Unit,
    onNavigateToAudioPlayer: (MediaItem) -> Unit,
    onNavigateToComicReader: (MediaItem) -> Unit
) {
    when (item.mediaType) {
        MediaType.BOOK, MediaType.AUDIOBOOK, MediaType.DOCUMENT, 
        MediaType.ACADEMIC_PAPER, MediaType.MAGAZINE, MediaType.WEB_FICTION -> {
            onNavigateToReader(item)
        }
        
        MediaType.MOVIE, MediaType.TV_SHOW -> {
            onNavigateToVideoPlayer(item)
        }
        
        MediaType.MUSIC, MediaType.PODCAST -> {
            onNavigateToAudioPlayer(item)
        }
        
        MediaType.COMIC -> {
            onNavigateToComicReader(item)
        }
        
        MediaType.UNKNOWN -> {
            // Try to determine by file extension
            val extension = item.fileName.substringAfterLast('.', "").lowercase()
            when {
                extension in listOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm") -> {
                    onNavigateToVideoPlayer(item)
                }
                extension in listOf("mp3", "flac", "wav", "ogg", "m4a", "aac") -> {
                    onNavigateToAudioPlayer(item)
                }
                extension in listOf("epub", "pdf", "txt", "html", "doc", "docx") -> {
                    onNavigateToReader(item)
                }
                extension in listOf("cbz", "cbr", "cb7") -> {
                    onNavigateToComicReader(item)
                }
                else -> {
                    // Fallback to system intent
                    try {
                        val intent = Intent(Intent.ACTION_VIEW).apply {
                            setDataAndType(Uri.parse(item.filePath), "*/*")
                            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        }
                        context.startActivity(intent)
                    } catch (e: Exception) {
                        // Handle error - maybe show a toast
                    }
                }
            }
        }
    }
}

@HiltViewModel
class MediaLauncherViewModel @Inject constructor(
    private val mediaPlayerService: UniversalMediaPlayerService,
    private val readerService: UniversalReaderService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(MediaLauncherUIState())
    val uiState: StateFlow<MediaLauncherUIState> = _uiState.asStateFlow()
    
    fun loadMediaItems(items: List<MediaItem>) {
        // Filter and categorize items
        val recentItems = items.filter { 
            it.lastAccessed != null && it.playCount > 0 
        }.sortedByDescending { it.lastAccessed }
        
        val favoriteItems = items.filter { 
            // In a real implementation, you'd have a favorites flag in the database
            it.playCount > 5 // Mock favorite logic
        }
        
        _uiState.value = _uiState.value.copy(
            recentItems = recentItems.take(10),
            favoriteItems = favoriteItems.take(10)
        )
    }
}

data class MediaLauncherUIState(
    val recentItems: List<MediaItem> = emptyList(),
    val favoriteItems: List<MediaItem> = emptyList(),
    val isLoading: Boolean = false,
    val error: String? = null
)