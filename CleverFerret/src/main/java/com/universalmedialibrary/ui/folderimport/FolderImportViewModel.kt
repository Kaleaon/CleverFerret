package com.universalmedialibrary.ui.folderimport

import android.content.Context
import android.net.Uri
import android.util.Log
import androidx.documentfile.provider.DocumentFile
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
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
import java.net.URI
import javax.inject.Inject

@HiltViewModel
class FolderImportViewModel @Inject constructor(
    private val bookMetadataService: BookMetadataService,
    private val audioMetadataService: AudioMetadataService,
    private val comicMetadataService: ComicMetadataService,
    private val fanfictionMetadataService: FanfictionMetadataService,
    private val mediaRepository: MediaRepository,
    private val libraryRepository: LibraryRepository
) : ViewModel() {
    enum class FileAccessState {
        IDLE,
        PERMISSION_GRANTED,
        PERMISSION_DENIED,
        ACCESS_ERROR
    }
    
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

    private val importLibraryCache = mutableMapOf<ScannedFileType, Library>()

    private data class OpenEntryCandidate(
        val uriString: String,
        val name: String,
        val size: Long,
        val path: String = ""
    )
    
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
                fetchMetadataForFiles(
                    setOf(
                        ScannedFileType.BOOK,
                        ScannedFileType.COMIC,
                        ScannedFileType.FANFICTION
                    )
                )
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
            val files = ingestEntries(
                localCandidates = uris.mapNotNull { uri ->
                    runCatching {
                        val documentFile = DocumentFile.fromSingleUri(context, uri) ?: return@mapNotNull null
                        val name = documentFile.name ?: return@mapNotNull null
                        OpenEntryCandidate(
                            uriString = uri.toString(),
                            name = name,
                            size = documentFile.length()
                        )
                    }.onFailure {
                        Log.e(TAG, "Error creating local entry candidate for $uri", it)
                    }.getOrNull()
                }
            )
            mergeScannedFiles(files)
        }
    }

    fun addUrl(url: String) {
        viewModelScope.launch {
            val trimmed = url.trim()
            if (trimmed.isEmpty()) {
                _uiState.update {
                    it.copy(lastImportError = "Enter a URL to import.")
                }
                return@launch
            }

            val files = ingestEntries(remoteUrls = listOf(trimmed))
            if (files.isEmpty()) {
                _uiState.update {
                    it.copy(lastImportError = "URL is unsupported. Use direct links ending in a supported file extension.")
                }
                return@launch
            }
            mergeScannedFiles(files)
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
        fetchMetadataForFiles(
            setOf(
                ScannedFileType.BOOK,
                ScannedFileType.COMIC,
                ScannedFileType.MUSIC,
                ScannedFileType.AUDIOBOOK,
                ScannedFileType.FANFICTION
            )
        )
    }

    private fun fetchMetadataForFiles(types: Set<ScannedFileType>) {
        viewModelScope.launch {
            val filesToProcess = _uiState.value.scannedFiles.filter {
                it.metadata == null && it.type in types
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

    fun clearImportError() {
        _uiState.update { it.copy(lastImportError = null) }
    }
    
    suspend fun importFiles(context: Context) {
        val selectedFiles = _uiState.value.scannedFiles.filter { it.uri in _uiState.value.selectedFiles }
        val totalFiles = selectedFiles.size
        
        if (totalFiles == 0) return
        
        _uiState.update { it.copy(isImporting = true, importProgress = 0f) }
        
        val failures = mutableListOf<String>()
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
                    
                    importFileToLibrary(context, file)
                    Log.d(TAG, "Imported: ${file.name} (${file.type})")
                } catch (e: Exception) {
                    Log.e(TAG, "Error importing ${file.name}", e)
                    failures.add(file.name)
                }
            }
        }
        
        _uiState.update { it.copy(
            isImporting = false,
            importProgress = 1f,
            currentImportFile = null,
            lastImportError = if (failures.isNotEmpty()) {
                "Failed to import ${failures.size} file(s): ${failures.take(3).joinToString()}${if (failures.size > 3) "…" else ""}"
            } else {
                null
            }
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

    private suspend fun importFileToLibrary(context: Context, file: ScannedFile) {
        val uri = Uri.parse(file.uri)
        val document = DocumentFile.fromSingleUri(context, uri)
        val fileName = document?.name ?: file.name
        val fileExtension = fileName.substringAfterLast('.', "").lowercase()
        val fileSize = document?.length() ?: 0L
        val lastModified = document?.lastModified() ?: 0L

        val library = getOrCreateImportLibrary(file.type)
        val existing = mediaRepository.getMediaItemByPath(file.uri)
        if (existing != null) return

        val mediaItem = MediaItem(
            libraryId = library.libraryId,
            filePath = file.uri,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            lastModified = lastModified,
            mediaType = mapMediaType(file.type),
            hasMetadata = file.metadata != null
        )

        val itemId = mediaRepository.createMediaItem(mediaItem)
        val metadata = file.metadata
        if (metadata != null) {
            val common = MetadataCommon(
                itemId = itemId,
                title = metadata.title ?: fileName.substringBeforeLast('.'),
                summary = metadata.description,
                metadataSource = "Folder Import"
            )
            mediaRepository.saveCommonMetadata(common)
        }
    }

    private suspend fun getOrCreateImportLibrary(type: ScannedFileType): Library {
        return importLibraryCache[type] ?: run {
            val typeLabel = when (type) {
                ScannedFileType.BOOK -> "Books"
                ScannedFileType.COMIC -> "Comics"
                ScannedFileType.AUDIOBOOK -> "Audiobooks"
                ScannedFileType.MUSIC -> "Music"
                ScannedFileType.PODCAST -> "Podcasts"
                ScannedFileType.VIDEO -> "Videos"
                ScannedFileType.DOCUMENT -> "Documents"
                ScannedFileType.FANFICTION -> "Fanfiction"
                else -> "Misc"
            }
            val path = "import://${type.name.lowercase()}"
            val existing = libraryRepository.getLibraryByPath(path)
            val library = existing ?: run {
                val createdId = libraryRepository.createLibrary(
                    Library(
                        name = "Imported $typeLabel",
                        type = mapLibraryType(type),
                        path = path
                    )
                )
                libraryRepository.getLibraryById(createdId)!!
            }
            importLibraryCache[type] = library
            library
        }
    }

    private fun mapLibraryType(type: ScannedFileType): String {
        return when (type) {
            ScannedFileType.BOOK, ScannedFileType.FANFICTION -> "BOOK"
            ScannedFileType.COMIC -> "COMIC"
            ScannedFileType.AUDIOBOOK -> "AUDIOBOOK"
            ScannedFileType.MUSIC -> "MUSIC"
            ScannedFileType.PODCAST -> "PODCAST"
            ScannedFileType.VIDEO -> "MOVIE"
            ScannedFileType.DOCUMENT -> "DOCUMENT"
            else -> "UNKNOWN"
        }
    }

    private fun mapMediaType(type: ScannedFileType): String {
        return when (type) {
            ScannedFileType.BOOK, ScannedFileType.FANFICTION -> "BOOK"
            ScannedFileType.COMIC -> "COMIC"
            ScannedFileType.AUDIOBOOK -> "AUDIOBOOK"
            ScannedFileType.MUSIC -> "MUSIC_TRACK"
            ScannedFileType.PODCAST -> "PODCAST_EPISODE"
            ScannedFileType.VIDEO -> "MOVIE"
            ScannedFileType.DOCUMENT -> "DOCUMENT"
            else -> "UNKNOWN"
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

    private suspend fun ingestEntries(
        localCandidates: List<OpenEntryCandidate> = emptyList(),
        remoteUrls: List<String> = emptyList()
    ): List<ScannedFile> = withContext(Dispatchers.Default) {
        val localFiles = localCandidates.mapNotNull { candidate ->
            toScannedFile(candidate)
        }
        val remoteFiles = remoteUrls.mapNotNull { url ->
            val candidate = toRemoteCandidate(url) ?: return@mapNotNull null
            toScannedFile(candidate)
        }
        (localFiles + remoteFiles).distinctBy { it.uri }
    }

    private fun toRemoteCandidate(url: String): OpenEntryCandidate? {
        return runCatching {
            val uri = URI(url)
            val scheme = uri.scheme?.lowercase()
            if (scheme != "http" && scheme != "https") return null
            val path = uri.path ?: return null
            val name = path.substringAfterLast('/').substringBefore('?').ifBlank { return null }
            OpenEntryCandidate(
                uriString = url,
                name = name,
                size = 0L,
                path = uri.host ?: ""
            )
        }.getOrNull()
    }

    private fun toScannedFile(candidate: OpenEntryCandidate): ScannedFile? {
        val extension = candidate.name.substringAfterLast(".", "").lowercase()
        if (extension.isBlank()) return null
        val type = detectFileType(extension)
        if (type == ScannedFileType.OTHER && extension !in DOCUMENT_EXTENSIONS) return null
        return ScannedFile(
            uri = candidate.uriString,
            name = candidate.name,
            extension = extension,
            size = candidate.size,
            sizeFormatted = if (candidate.size > 0L) formatFileSize(candidate.size) else "Remote",
            type = type,
            path = candidate.path
        )
    }

    private fun mergeScannedFiles(files: List<ScannedFile>) {
        if (files.isEmpty()) return
        val existingFiles = _uiState.value.scannedFiles
        val allFiles = (existingFiles + files).distinctBy { it.uri }

        val bookCount = allFiles.count { it.type == ScannedFileType.BOOK }
        val audioCount = allFiles.count { it.type in listOf(ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK, ScannedFileType.PODCAST) }
        val videoCount = allFiles.count { it.type == ScannedFileType.VIDEO }

        _uiState.update {
            it.copy(
                scannedFiles = allFiles,
                filteredFiles = applyFilter(allFiles, it.filterType),
                selectedFiles = it.selectedFiles + files.map { f -> f.uri },
                bookCount = bookCount,
                audioCount = audioCount,
                videoCount = videoCount,
                fileAccessState = FileAccessState.PERMISSION_GRANTED,
                lastImportError = null
            )
        }
    }

    fun onFilePermissionResult(granted: Boolean, errorMessage: String? = null) {
        _uiState.update {
            when {
                granted -> it.copy(fileAccessState = FileAccessState.PERMISSION_GRANTED, lastImportError = null)
                errorMessage != null -> it.copy(fileAccessState = FileAccessState.ACCESS_ERROR, lastImportError = errorMessage)
                else -> it.copy(fileAccessState = FileAccessState.PERMISSION_DENIED, lastImportError = "Storage permission is required to import local files.")
            }
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
    val videoCount: Int = 0,
    val fileAccessState: FolderImportViewModel.FileAccessState = FolderImportViewModel.FileAccessState.IDLE,
    val lastImportError: String? = null
)
