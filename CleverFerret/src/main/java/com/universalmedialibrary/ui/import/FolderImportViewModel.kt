package com.universalmedialibrary.ui.import

import android.content.Context
import android.net.Uri
import android.util.Log
import androidx.documentfile.provider.DocumentFile
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.metadata.AudioMetadataService
import com.universalmedialibrary.services.metadata.BookMetadataService
import com.universalmedialibrary.services.metadata.ComicMetadataService
import com.universalmedialibrary.services.metadata.FanfictionMetadataService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject

@HiltViewModel
class FolderImportViewModel @Inject constructor(
    private val bookMetadataService: BookMetadataService,
    private val audioMetadataService: AudioMetadataService,
    private val comicMetadataService: ComicMetadataService,
    private val fanfictionMetadataService: FanfictionMetadataService
) : ViewModel() {
    
    companion object {
        private const val TAG = "FolderImportViewModel"
        
        // File extensions by type
        val BOOK_EXTENSIONS = setOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx", "djvu", "chm")
        val COMIC_EXTENSIONS = setOf("cbz", "cbr", "cb7", "cbt")
        val AUDIOBOOK_EXTENSIONS = setOf("m4b")
        val MUSIC_EXTENSIONS = setOf("mp3", "m4a", "aac", "ogg", "opus", "flac", "wav", "wma", "alac")
        val PODCAST_EXTENSIONS = setOf("podcast") // Special marker
        val VIDEO_EXTENSIONS = setOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "mpg", "mpeg")
        val DOCUMENT_EXTENSIONS = setOf("pdf", "doc", "docx", "xls", "xlsx", "ppt", "pptx", "odt", "ods", "odp")
        val FANFICTION_EXTENSIONS = setOf("epub") // Fanfiction typically in EPUB format
        
        // Fanfiction detection patterns in filename
        val FANFICTION_PATTERNS = listOf(
            Regex("""(?i)\bao3\b"""),
            Regex("""(?i)\barchiveofourown\b"""),
            Regex("""(?i)\bfanfiction\.net\b"""),
            Regex("""(?i)\bffn\b"""),
            Regex("""(?i)\bfanfic\b"""),
            Regex("""(?i)\bfandom\b""")
        )
    }
    
    private val _uiState = MutableStateFlow(FolderImportUiState())
    val uiState: StateFlow<FolderImportUiState> = _uiState.asStateFlow()
    
    fun scanFolder(context: Context, folderUri: Uri) {
        viewModelScope.launch {
            _uiState.update { it.copy(
                isScanning = true,
                scanProgress = 0,
                selectedFolder = getFolderName(context, folderUri)
            )}
            
            val files = mutableListOf<ScannedFile>()
            
            withContext(Dispatchers.IO) {
                try {
                    val documentFile = DocumentFile.fromTreeUri(context, folderUri)
                    if (documentFile != null) {
                        scanDocumentTree(context, documentFile, files)
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Error scanning folder", e)
                }
            }
            
            // Sort files by type
            val sortedFiles = files.sortedWith(
                compareBy({ it.type.ordinal }, { it.name.lowercase() })
            )
            
            // Calculate counts
            val bookCount = sortedFiles.count { it.type == ScannedFileType.BOOK }
            val audioCount = sortedFiles.count { it.type in listOf(ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK, ScannedFileType.PODCAST) }
            val videoCount = sortedFiles.count { it.type == ScannedFileType.VIDEO }
            
            _uiState.update { it.copy(
                isScanning = false,
                scannedFiles = sortedFiles,
                filteredFiles = sortedFiles,
                selectedFiles = sortedFiles.map { f -> f.uri }.toSet(),
                bookCount = bookCount,
                audioCount = audioCount,
                videoCount = videoCount
            )}
            
            // Auto-fetch metadata for books if enabled
            if (_uiState.value.autoSortEnabled) {
                fetchMetadataForBooks()
            }
        }
    }
    
    private suspend fun scanDocumentTree(
        context: Context,
        documentFile: DocumentFile,
        files: MutableList<ScannedFile>,
        path: String = ""
    ) {
        documentFile.listFiles().forEach { file ->
            if (file.isDirectory) {
                // Recursively scan subdirectories
                scanDocumentTree(context, file, files, "$path/${file.name}")
            } else {
                val name = file.name ?: return@forEach
                val extension = name.substringAfterLast(".", "").lowercase()
                val type = detectFileType(extension)
                
                // Skip unsupported files
                if (type == ScannedFileType.OTHER && extension !in DOCUMENT_EXTENSIONS) {
                    return@forEach
                }
                
                val size = file.length()
                
                files.add(ScannedFile(
                    uri = file.uri.toString(),
                    name = name,
                    extension = extension,
                    size = size,
                    sizeFormatted = formatFileSize(size),
                    type = type,
                    path = path
                ))
                
                _uiState.update { it.copy(scanProgress = files.size) }
            }
        }
    }
    
    fun addFiles(context: Context, uris: List<Uri>) {
        viewModelScope.launch {
            val files = mutableListOf<ScannedFile>()
            
            withContext(Dispatchers.IO) {
                uris.forEach { uri ->
                    try {
                        val documentFile = DocumentFile.fromSingleUri(context, uri) ?: return@forEach
                        val name = documentFile.name ?: return@forEach
                        val extension = name.substringAfterLast(".", "").lowercase()
                        val type = detectFileType(extension)
                        val size = documentFile.length()
                        
                        files.add(ScannedFile(
                            uri = uri.toString(),
                            name = name,
                            extension = extension,
                            size = size,
                            sizeFormatted = formatFileSize(size),
                            type = type,
                            path = ""
                        ))
                    } catch (e: Exception) {
                        Log.e(TAG, "Error adding file: $uri", e)
                    }
                }
            }
            
            val existingFiles = _uiState.value.scannedFiles
            val allFiles = (existingFiles + files).distinctBy { it.uri }
            
            val bookCount = allFiles.count { it.type == ScannedFileType.BOOK }
            val audioCount = allFiles.count { it.type in listOf(ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK, ScannedFileType.PODCAST) }
            val videoCount = allFiles.count { it.type == ScannedFileType.VIDEO }
            
            _uiState.update { it.copy(
                scannedFiles = allFiles,
                filteredFiles = applyFilter(allFiles, it.filterType),
                selectedFiles = it.selectedFiles + files.map { f -> f.uri },
                bookCount = bookCount,
                audioCount = audioCount,
                videoCount = videoCount
            )}
        }
    }
    
    fun toggleFileSelection(uri: String) {
        _uiState.update { state ->
            val newSelection = if (uri in state.selectedFiles) {
                state.selectedFiles - uri
            } else {
                state.selectedFiles + uri
            }
            state.copy(selectedFiles = newSelection)
        }
    }
    
    fun toggleSelectAll() {
        _uiState.update { state ->
            val filteredUris = state.filteredFiles.map { it.uri }.toSet()
            val newSelection = if (state.selectedFiles.containsAll(filteredUris)) {
                state.selectedFiles - filteredUris
            } else {
                state.selectedFiles + filteredUris
            }
            state.copy(selectedFiles = newSelection)
        }
    }
    
    fun setFilter(filter: MediaFilterType) {
        _uiState.update { state ->
            val newFilter = if (state.filterType == filter) MediaFilterType.ALL else filter
            state.copy(
                filterType = newFilter,
                filteredFiles = applyFilter(state.scannedFiles, newFilter)
            )
        }
    }
    
    private fun applyFilter(files: List<ScannedFile>, filter: MediaFilterType): List<ScannedFile> {
        return when (filter) {
            MediaFilterType.ALL -> files
            MediaFilterType.BOOKS -> files.filter { it.type == ScannedFileType.BOOK || it.type == ScannedFileType.COMIC }
            MediaFilterType.AUDIO -> files.filter { it.type in listOf(ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK, ScannedFileType.PODCAST) }
            MediaFilterType.VIDEO -> files.filter { it.type == ScannedFileType.VIDEO }
        }
    }
    
    fun toggleAutoSort() {
        _uiState.update { it.copy(autoSortEnabled = !it.autoSortEnabled) }
        
        if (_uiState.value.autoSortEnabled) {
            fetchMetadataForAllFiles()
        }
    }
    
    private fun fetchMetadataForAllFiles() {
        viewModelScope.launch {
            // Fetch metadata for all supported file types
            val filesToProcess = _uiState.value.scannedFiles.filter { 
                it.metadata == null && it.type in listOf(
                    ScannedFileType.BOOK, 
                    ScannedFileType.COMIC,
                    ScannedFileType.MUSIC, 
                    ScannedFileType.AUDIOBOOK,
                    ScannedFileType.FANFICTION
                )
            }
            filesToProcess.forEach { file ->
                fetchMetadataForFile(file)
            }
        }
    }
    
    /**
     * Detect if a file is likely fanfiction based on filename patterns
     */
    private fun isFanfiction(filename: String): Boolean {
        return FANFICTION_PATTERNS.any { it.containsMatchIn(filename) }
    }
    
    fun fetchMetadataForFile(file: ScannedFile) {
        viewModelScope.launch {
            _uiState.update { it.copy(isFetchingMetadata = true) }
            
            try {
                when (file.type) {
                    ScannedFileType.BOOK -> {
                        // Check if it might be fanfiction
                        if (isFanfiction(file.name)) {
                            fetchFanfictionMetadata(file)
                        } else {
                            fetchBookMetadata(file)
                        }
                    }
                    
                    ScannedFileType.COMIC -> {
                        fetchComicMetadata(file)
                    }
                    
                    ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK -> {
                        fetchAudioMetadata(file)
                    }
                    
                    ScannedFileType.FANFICTION -> {
                        fetchFanfictionMetadata(file)
                    }
                    
                    else -> {
                        // No metadata fetching for other types
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error fetching metadata for ${file.name}", e)
            } finally {
                _uiState.update { it.copy(isFetchingMetadata = false) }
            }
        }
    }
    
    private suspend fun fetchBookMetadata(file: ScannedFile) {
        val metadata = bookMetadataService.fetchMetadata(filename = file.name)
        
        if (metadata != null) {
            val fileMetadata = FileMetadata(
                title = metadata.title,
                authors = metadata.authors,
                isbn = metadata.isbn,
                publisher = metadata.publisher,
                coverUrl = metadata.coverUrl,
                description = metadata.description,
                subjects = metadata.subjects
            )
            updateFileMetadata(file.uri, fileMetadata)
        }
    }
    
    private suspend fun fetchAudioMetadata(file: ScannedFile) {
        val uri = Uri.parse(file.uri)
        val metadata = audioMetadataService.autoTag(uri)
        
        if (metadata != null) {
            val fileMetadata = FileMetadata(
                title = metadata.title,
                authors = listOfNotNull(metadata.artist),
                coverUrl = null,
                description = null,
                subjects = metadata.genres,
                album = metadata.album,
                albumArtist = metadata.albumArtist,
                trackNumber = metadata.trackNumber,
                year = metadata.year,
                genre = metadata.genre,
                duration = metadata.duration,
                musicBrainzId = metadata.musicBrainzRecordingId
            )
            updateFileMetadata(file.uri, fileMetadata)
        }
    }
    
    private suspend fun fetchComicMetadata(file: ScannedFile) {
        // Get actual file path from URI for CBZ parsing
        val filePath = getFilePathFromUri(file.uri)
        
        val metadata = if (filePath != null) {
            comicMetadataService.autoTag(filePath, file.name)
        } else {
            // Fallback to just searching by filename
            val (series, issue) = comicMetadataService.parseFilename(file.name)
            comicMetadataService.searchComicVine(series, issue)
        }
        
        if (metadata != null) {
            // Extract primary writer from credits
            val writers = metadata.credits.filter { it.role.equals("Writer", ignoreCase = true) }
            val artists = metadata.credits.filter { it.role.equals("Penciller", ignoreCase = true) || it.role.equals("Artist", ignoreCase = true) }
            
            val fileMetadata = FileMetadata(
                title = metadata.title ?: "${metadata.series} #${metadata.number}",
                authors = writers.map { it.person }.ifEmpty { artists.map { it.person } },
                coverUrl = metadata.coverUrl,
                description = metadata.summary,
                subjects = metadata.tags + metadata.genre,
                // Comic-specific fields
                series = metadata.series,
                issueNumber = metadata.number,
                volume = metadata.volume,
                storyArc = metadata.storyArc,
                characters = metadata.characters,
                teams = metadata.teams,
                locations = metadata.locations,
                publisher = metadata.publisher,
                year = metadata.year,
                comicVineId = metadata.comicVineIssueId
            )
            updateFileMetadata(file.uri, fileMetadata)
        }
    }
    
    private suspend fun fetchFanfictionMetadata(file: ScannedFile) {
        val filePath = getFilePathFromUri(file.uri)
        
        val metadata = if (filePath != null && file.extension.equals("epub", ignoreCase = true)) {
            fanfictionMetadataService.autoTag(filePath, file.name)
        } else {
            fanfictionMetadataService.parseFilename(file.name)
        }
        
        if (metadata != null && metadata.title != null) {
            val fileMetadata = FileMetadata(
                title = metadata.title,
                authors = listOfNotNull(metadata.author),
                coverUrl = null,
                description = metadata.summary,
                subjects = metadata.additionalTags,
                // Fanfiction-specific fields
                fandoms = metadata.fandoms,
                relationships = metadata.relationships,
                characters = metadata.characters,
                rating = metadata.rating,
                warnings = metadata.warnings,
                categories = metadata.categories,
                wordCount = metadata.wordCount,
                chapterInfo = metadata.chapterInfo,
                ao3WorkId = metadata.ao3WorkId,
                ffnStoryId = metadata.ffnStoryId,
                seriesName = metadata.seriesName,
                seriesPart = metadata.seriesPart
            )
            updateFileMetadata(file.uri, fileMetadata)
        }
    }
    
    private fun getFilePathFromUri(uriString: String): String? {
        return try {
            val uri = Uri.parse(uriString)
            // For content URIs, we'd need to copy to cache or use ContentResolver
            // For file URIs, we can use the path directly
            if (uri.scheme == "file") {
                uri.path
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private fun updateFileMetadata(uri: String, metadata: FileMetadata) {
        _uiState.update { state ->
            val updatedFiles = state.scannedFiles.map { file ->
                if (file.uri == uri) file.copy(metadata = metadata) else file
            }
            val updatedFiltered = state.filteredFiles.map { file ->
                if (file.uri == uri) file.copy(metadata = metadata) else file
            }
            state.copy(
                scannedFiles = updatedFiles,
                filteredFiles = updatedFiltered
            )
        }
    }
    
    fun clearFiles() {
        _uiState.update { FolderImportUiState() }
    }
    
    suspend fun importFiles(context: Context) {
        val selectedFiles = _uiState.value.scannedFiles.filter { it.uri in _uiState.value.selectedFiles }
        val totalFiles = selectedFiles.size
        
        if (totalFiles == 0) return
        
        _uiState.update { it.copy(isImporting = true, importProgress = 0f) }
        
        withContext(Dispatchers.IO) {
            selectedFiles.forEachIndexed { index, file ->
                _uiState.update { it.copy(
                    currentImportFile = file.name,
                    importProgress = (index + 1).toFloat() / totalFiles
                )}
                
                try {
                    // Fetch metadata if not already fetched
                    if (file.metadata == null) {
                        _uiState.update { it.copy(isFetchingMetadata = true) }
                        
                        when (file.type) {
                            ScannedFileType.BOOK, ScannedFileType.COMIC -> {
                                val metadata = bookMetadataService.fetchMetadata(filename = file.name)
                                if (metadata != null) {
                                    val fileMetadata = FileMetadata(
                                        title = metadata.title,
                                        authors = metadata.authors,
                                        isbn = metadata.isbn,
                                        publisher = metadata.publisher,
                                        coverUrl = metadata.coverUrl,
                                        description = metadata.description,
                                        subjects = metadata.subjects
                                    )
                                    updateFileMetadata(file.uri, fileMetadata)
                                }
                            }
                            
                            ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK -> {
                                val uri = Uri.parse(file.uri)
                                val metadata = audioMetadataService.autoTag(uri)
                                if (metadata != null) {
                                    val fileMetadata = FileMetadata(
                                        title = metadata.title,
                                        authors = listOfNotNull(metadata.artist),
                                        coverUrl = null,
                                        description = null,
                                        subjects = metadata.genres,
                                        album = metadata.album,
                                        albumArtist = metadata.albumArtist,
                                        trackNumber = metadata.trackNumber,
                                        year = metadata.year,
                                        genre = metadata.genre,
                                        duration = metadata.duration,
                                        musicBrainzId = metadata.musicBrainzRecordingId
                                    )
                                    updateFileMetadata(file.uri, fileMetadata)
                                }
                            }
                            
                            else -> { /* No metadata fetching for other types */ }
                        }
                        
                        _uiState.update { it.copy(isFetchingMetadata = false) }
                    }
                    
                    // TODO: Actually import file to library database
                    // This would involve:
                    // 1. Copying file to app's media directory (if needed)
                    // 2. Creating database entry with metadata
                    // 3. Downloading cover image if available
                    // 4. Auto-sorting into appropriate category
                    
                    // Simulate import delay for now
                    kotlinx.coroutines.delay(100)
                    
                    Log.d(TAG, "Imported: ${file.name} (${file.type})")
                } catch (e: Exception) {
                    Log.e(TAG, "Error importing ${file.name}", e)
                }
            }
        }
        
        _uiState.update { it.copy(
            isImporting = false,
            importProgress = 1f,
            currentImportFile = null
        )}
    }
    
    private fun detectFileType(extension: String): ScannedFileType {
        return when {
            extension in BOOK_EXTENSIONS -> ScannedFileType.BOOK
            extension in COMIC_EXTENSIONS -> ScannedFileType.COMIC
            extension in AUDIOBOOK_EXTENSIONS -> ScannedFileType.AUDIOBOOK
            extension in MUSIC_EXTENSIONS -> ScannedFileType.MUSIC
            extension in VIDEO_EXTENSIONS -> ScannedFileType.VIDEO
            extension in DOCUMENT_EXTENSIONS -> ScannedFileType.DOCUMENT
            else -> ScannedFileType.OTHER
        }
    }
    
    private fun getFolderName(context: Context, uri: Uri): String {
        return try {
            DocumentFile.fromTreeUri(context, uri)?.name ?: "Selected Folder"
        } catch (e: Exception) {
            "Selected Folder"
        }
    }
    
    private fun formatFileSize(bytes: Long): String {
        return when {
            bytes < 1024 -> "$bytes B"
            bytes < 1024 * 1024 -> "${bytes / 1024} KB"
            bytes < 1024 * 1024 * 1024 -> "${bytes / (1024 * 1024)} MB"
            else -> String.format("%.1f GB", bytes / (1024.0 * 1024.0 * 1024.0))
        }
    }
}

data class FolderImportUiState(
    val isScanning: Boolean = false,
    val isImporting: Boolean = false,
    val isFetchingMetadata: Boolean = false,
    val scanProgress: Int = 0,
    val importProgress: Float = 0f,
    val currentImportFile: String? = null,
    val selectedFolder: String? = null,
    val scannedFiles: List<ScannedFile> = emptyList(),
    val filteredFiles: List<ScannedFile> = emptyList(),
    val selectedFiles: Set<String> = emptySet(),
    val filterType: MediaFilterType = MediaFilterType.ALL,
    val autoSortEnabled: Boolean = true,
    val bookCount: Int = 0,
    val audioCount: Int = 0,
    val videoCount: Int = 0
)
