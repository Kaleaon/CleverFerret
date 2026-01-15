package com.universalmedialibrary.ui.folderimport

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.animateContentSize
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.documentfile.provider.DocumentFile
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import kotlinx.coroutines.launch

/**
 * Enhanced folder import screen with:
 * - Folder selection via SAF
 * - File scanning with type detection
 * - Auto-sorting by media type
 * - Metadata fetching from Open Library & Google Books
 * - Progress tracking
 * - Import to library
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FolderImportScreen(
    onBack: () -> Unit,
    onImportComplete: () -> Unit,
    viewModel: FolderImportViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    val snackbarHostState = remember { SnackbarHostState() }
    
    // Folder picker launcher
    val folderPickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.OpenDocumentTree()
    ) { uri ->
        uri?.let { 
            // Take persistable permission
            context.contentResolver.takePersistableUriPermission(
                it,
                android.content.Intent.FLAG_GRANT_READ_URI_PERMISSION or
                android.content.Intent.FLAG_GRANT_WRITE_URI_PERMISSION
            )
            viewModel.scanFolder(context, it) 
        }
    }
    
    // File picker launcher for individual files
    val filePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.OpenMultipleDocuments()
    ) { uris ->
        if (uris.isNotEmpty()) {
            viewModel.addFiles(context, uris)
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Column {
                        Text("Import Media")
                        if (uiState.selectedFolder != null) {
                            Text(
                                text = uiState.selectedFolder!!,
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant,
                                maxLines = 1,
                                overflow = TextOverflow.Ellipsis
                            )
                        }
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    if (uiState.scannedFiles.isNotEmpty()) {
                        IconButton(onClick = { viewModel.toggleAutoSort() }) {
                            Icon(
                                Icons.AutoMirrored.Filled.Sort,
                                contentDescription = "Auto Sort",
                                tint = if (uiState.autoSortEnabled) MaterialTheme.colorScheme.primary
                                       else MaterialTheme.colorScheme.onSurface
                            )
                        }
                    }
                }
            )
        },
        snackbarHost = { SnackbarHost(snackbarHostState) },
        bottomBar = {
            if (uiState.scannedFiles.isNotEmpty() && !uiState.isImporting) {
                Surface(
                    tonalElevation = 3.dp
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        OutlinedButton(
                            onClick = { viewModel.clearFiles() },
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(Icons.Default.Clear, contentDescription = null)
                            Spacer(Modifier.width(8.dp))
                            Text("Clear")
                        }
                        
                        Button(
                            onClick = { 
                                scope.launch {
                                    viewModel.importFiles(context)
                                    snackbarHostState.showSnackbar("Import complete!")
                                    onImportComplete()
                                }
                            },
                            modifier = Modifier.weight(2f),
                            enabled = uiState.selectedFiles.isNotEmpty()
                        ) {
                            Icon(Icons.Default.FileDownload, contentDescription = null)
                            Spacer(Modifier.width(8.dp))
                            Text("Import ${uiState.selectedFiles.size} Files")
                        }
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
                uiState.isScanning -> {
                    // Scanning progress
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(32.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center
                    ) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(64.dp)
                        )
                        Spacer(modifier = Modifier.height(24.dp))
                        Text(
                            text = "Scanning folder...",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "${uiState.scanProgress} files found",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                
                uiState.isImporting -> {
                    // Import progress
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(32.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center
                    ) {
                        CircularProgressIndicator(
                            progress = { uiState.importProgress },
                            modifier = Modifier.size(80.dp),
                            strokeWidth = 8.dp
                        )
                        Spacer(modifier = Modifier.height(24.dp))
                        Text(
                            text = "Importing...",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = uiState.currentImportFile ?: "",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        LinearProgressIndicator(
                            progress = { uiState.importProgress },
                            modifier = Modifier.fillMaxWidth(0.8f)
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "${(uiState.importProgress * 100).toInt()}%",
                            style = MaterialTheme.typography.labelMedium
                        )
                        
                        if (uiState.isFetchingMetadata) {
                            Spacer(modifier = Modifier.height(16.dp))
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                CircularProgressIndicator(
                                    modifier = Modifier.size(16.dp),
                                    strokeWidth = 2.dp
                                )
                                Text(
                                    text = "Fetching metadata from Open Library & Google Books...",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.primary
                                )
                            }
                        }
                    }
                }
                
                uiState.scannedFiles.isEmpty() -> {
                    // Empty state - show selection options
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .verticalScroll(rememberScrollState())
                            .padding(24.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.Center
                    ) {
                        Icon(
                            Icons.Default.FolderOpen,
                            contentDescription = null,
                            modifier = Modifier.size(80.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        
                        Spacer(modifier = Modifier.height(24.dp))
                        
                        Text(
                            text = "Import Media",
                            style = MaterialTheme.typography.headlineMedium,
                            fontWeight = FontWeight.Bold
                        )
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Text(
                            text = "Select a folder or files to import into your library",
                            style = MaterialTheme.typography.bodyLarge,
                            color = MaterialTheme.colorScheme.onSurfaceVariant,
                            textAlign = TextAlign.Center
                        )
                        
                        Spacer(modifier = Modifier.height(32.dp))
                        
                        // Folder selection card
                        ImportOptionCard(
                            icon = Icons.Default.Folder,
                            title = "Select Folder",
                            description = "Import all media files from a folder and subfolders",
                            onClick = { folderPickerLauncher.launch(null) }
                        )
                        
                        Spacer(modifier = Modifier.height(16.dp))
                        
                        // File selection card
                        ImportOptionCard(
                            icon = Icons.Default.InsertDriveFile,
                            title = "Select Files",
                            description = "Pick individual files to import",
                            onClick = { 
                                filePickerLauncher.launch(arrayOf(
                                    "application/epub+zip",
                                    "application/pdf",
                                    "application/x-mobipocket-ebook",
                                    "application/x-fictionbook+xml",
                                    "text/plain",
                                    "audio/*",
                                    "video/*",
                                    "image/*",
                                    "application/zip",
                                    "application/x-cbz",
                                    "application/x-cbr"
                                ))
                            }
                        )
                        
                        Spacer(modifier = Modifier.height(32.dp))
                        
                        // Supported formats info
                        SupportedFormatsCard()
                    }
                }
                
                else -> {
                    // File list with sorting options
                    Column(modifier = Modifier.fillMaxSize()) {
                        // Stats bar
                        Surface(
                            color = MaterialTheme.colorScheme.surfaceVariant,
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(horizontal = 16.dp, vertical = 12.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                // File counts by type
                                Row(
                                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                                ) {
                                    MediaTypeChip(
                                        icon = Icons.AutoMirrored.Filled.MenuBook,
                                        count = uiState.bookCount,
                                        label = "Books",
                                        selected = uiState.filterType == MediaFilterType.BOOKS,
                                        onClick = { viewModel.setFilter(MediaFilterType.BOOKS) }
                                    )
                                    MediaTypeChip(
                                        icon = Icons.Default.MusicNote,
                                        count = uiState.audioCount,
                                        label = "Audio",
                                        selected = uiState.filterType == MediaFilterType.AUDIO,
                                        onClick = { viewModel.setFilter(MediaFilterType.AUDIO) }
                                    )
                                    MediaTypeChip(
                                        icon = Icons.Default.VideoLibrary,
                                        count = uiState.videoCount,
                                        label = "Video",
                                        selected = uiState.filterType == MediaFilterType.VIDEO,
                                        onClick = { viewModel.setFilter(MediaFilterType.VIDEO) }
                                    )
                                }
                                
                                // Select all toggle
                                Row(
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Checkbox(
                                        checked = uiState.selectedFiles.size == uiState.filteredFiles.size,
                                        onCheckedChange = { viewModel.toggleSelectAll() }
                                    )
                                    Text(
                                        text = "All",
                                        style = MaterialTheme.typography.labelMedium
                                    )
                                }
                            }
                        }
                        
                        // Auto-sort banner
                        AnimatedVisibility(
                            visible = uiState.autoSortEnabled,
                            enter = expandVertically() + fadeIn(),
                            exit = shrinkVertically() + fadeOut()
                        ) {
                            Surface(
                                color = MaterialTheme.colorScheme.primaryContainer,
                                modifier = Modifier.fillMaxWidth()
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(horizontal = 16.dp, vertical = 8.dp),
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Icon(
                                        Icons.AutoMirrored.Filled.Sort,
                                        contentDescription = null,
                                        modifier = Modifier.size(20.dp),
                                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                                    )
                                    Spacer(modifier = Modifier.width(8.dp))
                                    Text(
                                        text = "Auto-sort enabled: Files will be organized by type and metadata",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onPrimaryContainer
                                    )
                                }
                            }
                        }
                        
                        // File list
                        LazyColumn(
                            modifier = Modifier.fillMaxSize(),
                            contentPadding = PaddingValues(vertical = 8.dp)
                        ) {
                            items(
                                items = uiState.filteredFiles,
                                key = { it.uri }
                            ) { file ->
                                ScannedFileItem(
                                    file = file,
                                    isSelected = file.uri in uiState.selectedFiles,
                                    onToggleSelect = { viewModel.toggleFileSelection(file.uri) },
                                    onFetchMetadata = { viewModel.fetchMetadataForFile(file) }
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun ImportOptionCard(
    icon: ImageVector,
    title: String,
    description: String,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Surface(
                shape = CircleShape,
                color = MaterialTheme.colorScheme.primary.copy(alpha = 0.15f),
                modifier = Modifier.size(56.dp)
            ) {
                Icon(
                    icon,
                    contentDescription = null,
                    modifier = Modifier
                        .padding(14.dp)
                        .fillMaxSize(),
                    tint = MaterialTheme.colorScheme.primary
                )
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Icon(
                Icons.Default.ChevronRight,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun SupportedFormatsCard() {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Supported Formats",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.SemiBold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            FormatRow(
                icon = Icons.AutoMirrored.Filled.MenuBook,
                label = "Books",
                formats = "EPUB, PDF, MOBI, AZW, FB2, TXT, RTF, DJVU"
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            FormatRow(
                icon = Icons.Default.Image,
                label = "Comics",
                formats = "CBZ, CBR, CB7, PDF"
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            FormatRow(
                icon = Icons.Default.MusicNote,
                label = "Audio",
                formats = "MP3, M4A, M4B, AAC, OGG, FLAC, WAV"
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            FormatRow(
                icon = Icons.Default.VideoLibrary,
                label = "Video",
                formats = "MP4, MKV, AVI, MOV, WEBM"
            )
        }
    }
}

@Composable
private fun FormatRow(
    icon: ImageVector,
    label: String,
    formats: String
) {
    Row(
        verticalAlignment = Alignment.Top
    ) {
        Icon(
            icon,
            contentDescription = null,
            modifier = Modifier.size(18.dp),
            tint = MaterialTheme.colorScheme.primary
        )
        Spacer(modifier = Modifier.width(8.dp))
        Column {
            Text(
                text = label,
                style = MaterialTheme.typography.labelMedium,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = formats,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun MediaTypeChip(
    icon: ImageVector,
    count: Int,
    label: String,
    selected: Boolean,
    onClick: () -> Unit
) {
    FilterChip(
        selected = selected,
        onClick = onClick,
        label = { 
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    icon,
                    contentDescription = null,
                    modifier = Modifier.size(16.dp)
                )
                Spacer(modifier = Modifier.width(4.dp))
                Text("$count")
            }
        },
        leadingIcon = null
    )
}

@Composable
private fun ScannedFileItem(
    file: ScannedFile,
    isSelected: Boolean,
    onToggleSelect: () -> Unit,
    onFetchMetadata: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 4.dp)
            .clickable(onClick = onToggleSelect),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) 
                MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
            else 
                MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Checkbox
            Checkbox(
                checked = isSelected,
                onCheckedChange = { onToggleSelect() }
            )
            
            // Cover/icon
            Box(
                modifier = Modifier
                    .size(56.dp)
                    .clip(RoundedCornerShape(4.dp))
                    .background(MaterialTheme.colorScheme.surfaceVariant),
                contentAlignment = Alignment.Center
            ) {
                if (file.metadata?.coverUrl != null) {
                    AsyncImage(
                        model = file.metadata.coverUrl,
                        contentDescription = null,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Icon(
                        imageVector = file.type.icon,
                        contentDescription = null,
                        modifier = Modifier.size(28.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(12.dp))
            
            // File info
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = file.metadata?.title ?: file.name,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                // Show authors for books, artist for audio
                val secondaryText = when (file.type) {
                    ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK -> {
                        buildString {
                            file.metadata?.authors?.firstOrNull()?.let { append(it) }
                            file.metadata?.album?.let { 
                                if (isNotEmpty()) append(" • ")
                                append(it)
                            }
                        }.ifEmpty { null }
                    }
                    else -> {
                        file.metadata?.authors?.takeIf { it.isNotEmpty() }?.joinToString(", ")
                    }
                }
                
                if (!secondaryText.isNullOrBlank()) {
                    Text(
                        text = secondaryText,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // File type badge
                    Surface(
                        shape = RoundedCornerShape(4.dp),
                        color = file.type.color.copy(alpha = 0.2f)
                    ) {
                        Text(
                            text = file.extension.uppercase(),
                            style = MaterialTheme.typography.labelSmall,
                            color = file.type.color,
                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                        )
                    }
                    
                    // File size
                    Text(
                        text = file.sizeFormatted,
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    
                    // Metadata status
                    if (file.metadata != null) {
                        Icon(
                            Icons.Default.CheckCircle,
                            contentDescription = "Metadata loaded",
                            modifier = Modifier.size(14.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            }
            
            // Fetch metadata button - for books and audio without metadata
            if ((file.type == ScannedFileType.BOOK || file.type == ScannedFileType.MUSIC || file.type == ScannedFileType.AUDIOBOOK) && file.metadata == null) {
                IconButton(onClick = onFetchMetadata) {
                    Icon(
                        Icons.Default.Search,
                        contentDescription = "Fetch metadata",
                        tint = MaterialTheme.colorScheme.primary
                    )
                }
            }
        }
    }
}

// Data classes
enum class ScannedFileType(val icon: ImageVector, val color: Color) {
    BOOK(Icons.AutoMirrored.Filled.MenuBook, Color(0xFF4CAF50)),
    COMIC(Icons.Default.Image, Color(0xFFFF9800)),
    AUDIOBOOK(Icons.Default.Headphones, Color(0xFF9C27B0)),
    MUSIC(Icons.Default.MusicNote, Color(0xFF2196F3)),
    PODCAST(Icons.Default.Podcasts, Color(0xFFE91E63)),
    VIDEO(Icons.Default.VideoLibrary, Color(0xFFF44336)),
    DOCUMENT(Icons.Default.Description, Color(0xFF607D8B)),
    FANFICTION(Icons.Default.Create, Color(0xFF00BCD4)),
    OTHER(Icons.Default.InsertDriveFile, Color(0xFF9E9E9E))
}

enum class MediaFilterType {
    ALL, BOOKS, AUDIO, VIDEO
}

data class ScannedFile(
    val uri: String,
    val name: String,
    val extension: String,
    val size: Long,
    val sizeFormatted: String,
    val type: ScannedFileType,
    val path: String,
    val metadata: FileMetadata? = null
)

/**
 * Universal file metadata that supports all media types.
 * All tags are searchable via UniversalSearchService.
 */
data class FileMetadata(
    // === Common fields (all media types) ===
    val title: String?,
    val authors: List<String>,
    val coverUrl: String?,
    val description: String?,
    val subjects: List<String>,  // General tags, genres, subjects
    
    // === Book-specific fields ===
    val isbn: String? = null,
    val publisher: String? = null,
    
    // === Audio-specific fields (TagLib/Metadator style) ===
    val album: String? = null,
    val albumArtist: String? = null,
    val trackNumber: Int? = null,
    val discNumber: Int? = null,
    val year: Int? = null,
    val genre: String? = null,
    val duration: Long? = null,
    val musicBrainzId: String? = null,
    
    // === Comic-specific fields (ComicTagger style) ===
    val series: String? = null,
    val issueNumber: String? = null,
    val volume: Int? = null,
    val storyArc: String? = null,
    val characters: List<String> = emptyList(),
    val teams: List<String> = emptyList(),
    val locations: List<String> = emptyList(),
    val comicVineId: Int? = null,
    
    // === Fanfiction-specific fields (AO3 style) ===
    val fandoms: List<String> = emptyList(),
    val relationships: List<String> = emptyList(),
    val rating: String? = null,  // G, T, M, E
    val warnings: List<String> = emptyList(),
    val categories: List<String> = emptyList(),  // F/F, F/M, M/M, Gen, Multi
    val wordCount: Int? = null,
    val chapterInfo: String? = null,  // "3/5" format
    val ao3WorkId: Long? = null,
    val ffnStoryId: Long? = null,
    val seriesName: String? = null,
    val seriesPart: Int? = null
) {
    /**
     * Get all searchable tags for universal search indexing.
     */
    fun getAllSearchableTags(): List<String> {
        return buildList {
            addAll(subjects)
            addAll(fandoms)
            addAll(relationships)
            addAll(characters)
            addAll(teams)
            addAll(locations)
            addAll(warnings)
            addAll(categories)
            genre?.let { add(it) }
            storyArc?.let { add(it) }
            rating?.let { add(it) }
        }.distinct()
    }
}
