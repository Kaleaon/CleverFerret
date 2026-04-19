package com.universalmedialibrary.ui.library

import android.content.Context
import android.content.Intent
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MetadataFetchRepository
import com.universalmedialibrary.data.repository.MetadataFetchResult
import com.universalmedialibrary.services.CalibreExportService
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.services.CalibreImportService
import com.universalmedialibrary.services.thumbnails.ThumbnailService
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import android.net.Uri
import java.io.File
import javax.inject.Inject

/**
 * ViewModel for library management screen
 * Handles library creation, updates, and UI state management
 */
@HiltViewModel
class LibraryManagementViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val libraryRepository: LibraryRepository,
    private val calibreExportService: CalibreExportService,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val metadataFetchRepository: MetadataFetchRepository,
    private val thumbnailService: ThumbnailService
) : ViewModel() {

    private val _uiState = MutableStateFlow<LibraryManagementUiState>(LibraryManagementUiState.Success)
    val uiState: StateFlow<LibraryManagementUiState> = _uiState.asStateFlow()
    private val _bulkMetadataTask = MutableStateFlow<LibraryBackgroundTaskState?>(null)
    val bulkMetadataTask: StateFlow<LibraryBackgroundTaskState?> = _bulkMetadataTask.asStateFlow()
    private val _bulkThumbnailTask = MutableStateFlow<LibraryBackgroundTaskState?>(null)
    val bulkThumbnailTask: StateFlow<LibraryBackgroundTaskState?> = _bulkThumbnailTask.asStateFlow()

    val libraries: StateFlow<List<Library>> = libraryRepository.getAllActiveLibraries()
        .catch { throwable ->
            _uiState.value = LibraryManagementUiState.Error(
                throwable.message ?: "Failed to load libraries"
            )
        }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
    
    /**
     * Flow that emits item counts for each library
     * Maps library ID to item count
     */
    val libraryItemCounts: StateFlow<Map<Long, Int>> = libraries
        .map { libraryList ->
            libraryList.associate { library ->
                library.libraryId to (mediaItemDao.getItemCountByLibrary(library.libraryId))
            }
        }
        .catch { throwable ->
            // On error, emit empty map
            emit(emptyMap())
        }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyMap()
        )

    /**
     * Creates a new library with the specified parameters
     */
    fun createLibrary(name: String, type: String, path: String) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading

                val library = Library(
                    name = name,
                    type = type,
                    path = path
                )

                libraryRepository.createLibrary(library)
                _uiState.value = LibraryManagementUiState.Success

            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to create library: ${e.message}"
                )
            }
        }
    }

    /**
     * Updates an existing library
     */
    fun updateLibrary(library: Library) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                libraryRepository.updateLibrary(library)
                _uiState.value = LibraryManagementUiState.Success
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to update library: ${e.message}"
                )
            }
        }
    }

    /**
     * Deletes a library
     */
    fun deleteLibrary(library: Library) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                libraryRepository.deleteLibrary(library)
                _uiState.value = LibraryManagementUiState.Success
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to delete library: ${e.message}"
                )
            }
        }
    }

    /**
     * Activates or deactivates a library
     */
    fun setLibraryActive(libraryId: Long, isActive: Boolean) {
        viewModelScope.launch {
            try {
                libraryRepository.toggleLibraryActive(libraryId, isActive)
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to update library status: ${e.message}"
                )
            }
        }
    }

    /**
     * Scans a library for media files using MediaScannerService
     */
    fun scanLibrary(libraryId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading

                // Get library details
                val library = libraryRepository.getLibraryById(libraryId)
                if (library == null) {
                    _uiState.value = LibraryManagementUiState.Error("Library not found")
                    return@launch
                }

                // Start MediaScannerService for this library
                val intent = Intent(context, MediaScannerService::class.java).apply {
                    action = MediaScannerService.ACTION_SCAN_LIBRARY
                    putExtra(MediaScannerService.EXTRA_LIBRARY_ID, libraryId)
                    putExtra(MediaScannerService.EXTRA_SCAN_PATH, library.path)
                }
                context.startService(intent)

                // Update last scanned timestamp
                libraryRepository.updateLastScanned(libraryId, System.currentTimeMillis())

                _uiState.value = LibraryManagementUiState.Success
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to scan library: ${e.message}"
                )
            }
        }
    }

    /**
     * Imports a Calibre library from the specified path using CalibreImportService
     */
    fun importCalibreLibrary(path: String, libraryName: String) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading

                val library = Library(
                    name = libraryName,
                    type = "BOOK",
                    path = path,
                    source = "CALIBRE"
                )

                val libraryId = libraryRepository.createLibrary(library)

                // Start CalibreImportService for actual import
                val intent = Intent(context, CalibreImportService::class.java).apply {
                    action = CalibreImportService.ACTION_IMPORT_CALIBRE
                    putExtra(CalibreImportService.EXTRA_LIBRARY_ID, libraryId)
                    putExtra(CalibreImportService.EXTRA_CALIBRE_PATH, path)
                }
                context.startService(intent)

                _uiState.value = LibraryManagementUiState.Success

            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to import Calibre library: ${e.message}"
                )
            }
        }
    }

    /**
     * Exports library to Calibre format
     */
    fun exportToCalibre(exportPath: String, libraryId: Long? = null) {
        viewModelScope.launch {
            try {
                _uiState.value = LibraryManagementUiState.Loading
                
                // Run export on IO dispatcher to avoid blocking main thread
                val result = withContext(Dispatchers.IO) {
                    calibreExportService.exportToCalibre(exportPath, libraryId)
                }
                
                if (result.success) {
                    _uiState.value = LibraryManagementUiState.Success
                } else {
                    _uiState.value = LibraryManagementUiState.Error(result.message)
                }
                
            } catch (e: Exception) {
                _uiState.value = LibraryManagementUiState.Error(
                    "Failed to export to Calibre: ${e.message}"
                )
            }
        }
    }

    /**
     * Clears any error state
     */
    fun clearError() {
        if (_uiState.value is LibraryManagementUiState.Error) {
            _uiState.value = LibraryManagementUiState.Success
        }
    }

    fun refreshAllMetadata() {
        viewModelScope.launch {
            val items = mediaItemDao.getAllMediaItems()
            if (items.isEmpty()) {
                _bulkMetadataTask.value = LibraryBackgroundTaskState.success(
                    label = "Bulk metadata refresh",
                    message = "No media items found"
                )
                return@launch
            }
            _bulkMetadataTask.value = LibraryBackgroundTaskState.queued("Bulk metadata refresh")
            var completed = 0
            var successCount = 0
            var errorCount = 0
            _bulkMetadataTask.value = LibraryBackgroundTaskState.running("Bulk metadata refresh", 0f, "Starting...")

            items.forEach { item ->
                when (val result = metadataFetchRepository.fetchMetadataForItem(item.itemId)) {
                    is MetadataFetchResult.Success -> successCount++
                    is MetadataFetchResult.Error -> errorCount++
                }
                completed++
                _bulkMetadataTask.value = LibraryBackgroundTaskState.running(
                    label = "Bulk metadata refresh",
                    progress = completed.toFloat() / items.size.coerceAtLeast(1),
                    message = "Processed $completed/${items.size} • Success: $successCount • Failed: $errorCount"
                )
            }

            _bulkMetadataTask.value = if (errorCount > 0) {
                LibraryBackgroundTaskState.failed(
                    label = "Bulk metadata refresh",
                    message = "Completed with $errorCount failures ($successCount succeeded)"
                )
            } else {
                LibraryBackgroundTaskState.success(
                    label = "Bulk metadata refresh",
                    message = "Updated metadata for $successCount items"
                )
            }
        }
    }

    fun regenerateAllThumbnails() {
        viewModelScope.launch {
            val items = mediaItemDao.getAllMediaItems()
            if (items.isEmpty()) {
                _bulkThumbnailTask.value = LibraryBackgroundTaskState.success(
                    label = "Bulk thumbnail regeneration",
                    message = "No media items found"
                )
                return@launch
            }
            _bulkThumbnailTask.value = LibraryBackgroundTaskState.queued("Bulk thumbnail regeneration")
            var completed = 0
            var successCount = 0
            var errorCount = 0
            _bulkThumbnailTask.value = LibraryBackgroundTaskState.running("Bulk thumbnail regeneration", 0f, "Starting...")

            items.forEach { item ->
                val result = runCatching {
                    val existingMetadata = metadataDao.getMetadataCommonByItemId(item.itemId)
                    val oldCoverPath = existingMetadata?.coverImagePath
                    val oldThumbnailPath = item.thumbnailPath
                    val sourceUri = when {
                        item.filePath.startsWith("content://") || item.filePath.startsWith("file://") -> Uri.parse(item.filePath)
                        else -> Uri.fromFile(File(item.filePath))
                    }
                    val file = when (item.fileExtension.lowercase()) {
                        "epub" -> thumbnailService.extractCoverFromEpub(sourceUri)
                        "cbz" -> thumbnailService.extractCoverFromCbz(sourceUri)
                        else -> null
                    } ?: thumbnailService.generatePlaceholder(item.fileName.substringBeforeLast('.'))

                    val now = System.currentTimeMillis()
                    val thumbnailPath = file.absolutePath

                    mediaItemDao.updateMediaItem(
                        item.copy(
                            hasThumbnail = true,
                            thumbnailPath = thumbnailPath,
                            lastScanned = now
                        )
                    )
                    val metadata = (existingMetadata ?: MetadataCommon(
                        itemId = item.itemId,
                        title = item.fileName.substringBeforeLast('.')
                    )).copy(
                        coverImagePath = thumbnailPath,
                        lastUpdated = now
                    )
                    metadataDao.insertMetadataCommon(metadata)
                    cleanupStaleCacheFile(oldCoverPath, thumbnailPath)
                    cleanupStaleCacheFile(oldThumbnailPath, thumbnailPath)
                }
                if (result.isSuccess) successCount++ else errorCount++

                completed++
                _bulkThumbnailTask.value = LibraryBackgroundTaskState.running(
                    label = "Bulk thumbnail regeneration",
                    progress = completed.toFloat() / items.size.coerceAtLeast(1),
                    message = "Processed $completed/${items.size} • Success: $successCount • Failed: $errorCount"
                )
            }

            _bulkThumbnailTask.value = if (errorCount > 0) {
                LibraryBackgroundTaskState.failed(
                    label = "Bulk thumbnail regeneration",
                    message = "Completed with $errorCount failures ($successCount succeeded)"
                )
            } else {
                LibraryBackgroundTaskState.success(
                    label = "Bulk thumbnail regeneration",
                    message = "Regenerated thumbnails for $successCount items"
                )
            }
        }
    }

    fun clearBulkTask(taskType: LibraryBackgroundTaskType) {
        when (taskType) {
            LibraryBackgroundTaskType.METADATA -> _bulkMetadataTask.value = null
            LibraryBackgroundTaskType.THUMBNAIL -> _bulkThumbnailTask.value = null
        }
    }

    private fun cleanupStaleCacheFile(oldPath: String?, newPath: String?) {
        if (oldPath.isNullOrBlank() || oldPath == newPath) return
        runCatching {
            if (!oldPath.startsWith("http://") && !oldPath.startsWith("https://")) {
                File(oldPath).takeIf { it.exists() }?.delete()
            }
        }
    }
}

/**
 * UI state for library management screen
 */
sealed class LibraryManagementUiState {
    object Success : LibraryManagementUiState()
    object Loading : LibraryManagementUiState()
    data class Error(val message: String) : LibraryManagementUiState()
}

enum class LibraryBackgroundTaskStatus {
    QUEUED,
    RUNNING,
    FAILED,
    SUCCESS
}

enum class LibraryBackgroundTaskType {
    METADATA,
    THUMBNAIL
}

data class LibraryBackgroundTaskState(
    val label: String,
    val status: LibraryBackgroundTaskStatus,
    val progress: Float,
    val message: String? = null
) {
    companion object {
        fun queued(label: String) = LibraryBackgroundTaskState(label, LibraryBackgroundTaskStatus.QUEUED, 0f)
        fun running(label: String, progress: Float, message: String? = null) = LibraryBackgroundTaskState(label, LibraryBackgroundTaskStatus.RUNNING, progress, message)
        fun failed(label: String, message: String) = LibraryBackgroundTaskState(label, LibraryBackgroundTaskStatus.FAILED, 1f, message)
        fun success(label: String, message: String) = LibraryBackgroundTaskState(label, LibraryBackgroundTaskStatus.SUCCESS, 1f, message)
    }
}
