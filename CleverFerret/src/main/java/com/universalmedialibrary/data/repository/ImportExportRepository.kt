package com.universalmedialibrary.data.repository

import android.content.Context
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import java.text.SimpleDateFormat
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for import/export operations
 * Handles backup and restoration of library data
 */
@Singleton
class ImportExportRepository @Inject constructor(
    @ApplicationContext private val context: Context,
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val readingProgressDao: ReadingProgressDao,
    private val bookmarkDao: BookmarkDao,
    private val collectionDao: UnifiedCollectionDao,
    private val settingsRepository: SettingsRepository
) {

    private val json = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
    }

    /**
     * Export entire library to JSON
     */
    suspend fun exportLibrary(
        includeMetadata: Boolean = true,
        includeProgress: Boolean = true,
        includeBookmarks: Boolean = true,
        includeCollections: Boolean = true,
        libraryIds: List<Long>? = null
    ): ExportResult = withContext(Dispatchers.IO) {
        try {
            // Collect data
            val libraries = if (libraryIds != null) {
                libraryIds.mapNotNull { libraryDao.getLibraryById(it) }
            } else {
                libraryDao.getAllLibraries()
            }

            val mediaItems = libraries.flatMap { library ->
                mediaItemDao.getItemsByLibrary(library.libraryId)
            }

            val metadata = if (includeMetadata) {
                mediaItems.mapNotNull { item ->
                    metadataDao.getMetadataCommonByItemId(item.itemId)
                }
            } else emptyList()

            val progress = if (includeProgress) {
                mediaItems.mapNotNull { item ->
                    readingProgressDao.getProgressByItemId(item.itemId)
                }
            } else emptyList()

            val bookmarks = if (includeBookmarks) {
                mediaItems.flatMap { item ->
                    bookmarkDao.getBookmarksForItem(item.itemId)
                }
            } else emptyList()

            val collections = if (includeCollections) {
                collectionDao.getAllCollections()
            } else emptyList()

            // Create export data
            val exportData = LibraryExportData(
                version = 1,
                exportDate = System.currentTimeMillis(),
                appVersion = "1.0",
                libraries = libraries,
                mediaItems = mediaItems,
                metadata = metadata,
                progress = progress,
                bookmarks = bookmarks,
                collections = collections.first()
            )

            // Serialize to JSON
            val jsonString = json.encodeToString(exportData)

            // Save to file
            val fileName = "cleverferret_backup_${getTimestamp()}.json"
            val exportFile = File(context.getExternalFilesDir(null), "exports")
            exportFile.mkdirs()
            val file = File(exportFile, fileName)
            file.writeText(jsonString)

            ExportResult.Success(
                filePath = file.absolutePath,
                itemCount = mediaItems.size,
                fileSize = file.length()
            )
        } catch (e: Exception) {
            ExportResult.Error(e.message ?: "Export failed")
        }
    }

    /**
     * Import library from JSON backup
     */
    suspend fun importLibrary(
        filePath: String,
        overwriteExisting: Boolean = false
    ): ImportResult = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            if (!file.exists()) {
                return@withContext ImportResult.Error("File not found")
            }

            val jsonString = file.readText()
            val importData = json.decodeFromString<LibraryExportData>(jsonString)

            var importedItems = 0
            var skippedItems = 0
            var errors = 0

            // Import libraries
            importData.libraries.forEach { library ->
                try {
                    val existing = libraryDao.getLibraryByName(library.name)
                    if (existing == null || overwriteExisting) {
                        if (existing != null) {
                            libraryDao.updateLibrary(library.copy(libraryId = existing.libraryId))
                        } else {
                            libraryDao.insertLibrary(library)
                        }
                    }
                } catch (e: Exception) {
                    errors++
                }
            }

            // Import media items
            importData.mediaItems.forEach { item ->
                try {
                    val existing = mediaItemDao.getItemByPath(item.filePath)
                    if (existing == null || overwriteExisting) {
                        if (existing != null) {
                            mediaItemDao.updateMediaItem(item.copy(itemId = existing.itemId))
                        } else {
                            mediaItemDao.insertMediaItem(item)
                        }
                        importedItems++
                    } else {
                        skippedItems++
                    }
                } catch (e: Exception) {
                    errors++
                }
            }

            // Import metadata
            importData.metadata.forEach { metadata ->
                try {
                    metadataDao.insertMetadataCommon(metadata)
                } catch (e: Exception) {
                    // Continue on metadata errors
                }
            }

            // Import progress
            importData.progress.forEach { progress ->
                try {
                    readingProgressDao.insertProgress(progress)
                } catch (e: Exception) {
                    // Continue on progress errors
                }
            }

            // Import bookmarks
            importData.bookmarks.forEach { bookmark ->
                try {
                    bookmarkDao.insertBookmark(bookmark)
                } catch (e: Exception) {
                    // Continue on bookmark errors
                }
            }

            // Import collections
            importData.collections.forEach { collection ->
                try {
                    collectionDao.insert(collection)
                } catch (e: Exception) {
                    // Continue on collection errors
                }
            }

            ImportResult.Success(
                importedItems = importedItems,
                skippedItems = skippedItems,
                errors = errors
            )
        } catch (e: Exception) {
            ImportResult.Error(e.message ?: "Import failed")
        }
    }

    /**
     * Export library to CSV (simple format)
     */
    suspend fun exportToCSV(
        libraryIds: List<Long>? = null
    ): ExportResult = withContext(Dispatchers.IO) {
        try {
            val libraries = if (libraryIds != null) {
                libraryIds.mapNotNull { libraryDao.getLibraryById(it) }
            } else {
                libraryDao.getAllLibraries()
            }

            val mediaItems = libraries.flatMap { library ->
                mediaItemDao.getItemsByLibrary(library.libraryId)
            }

            val csvBuilder = StringBuilder()
            csvBuilder.append("Title,Type,File Path,File Size,Has Metadata,Date Added,Library\n")

            mediaItems.forEach { item ->
                val metadata = metadataDao.getMetadataCommonByItemId(item.itemId)
                val library = libraryDao.getLibraryById(item.libraryId)

                csvBuilder.append(
                    listOf(
                        escapeCSV(metadata?.title ?: item.fileName),
                        escapeCSV(item.mediaType),
                        escapeCSV(item.filePath),
                        item.fileSize.toString(),
                        item.hasMetadata.toString(),
                        SimpleDateFormat("yyyy-MM-dd", Locale.getDefault()).format(Date(item.dateAdded)),
                        escapeCSV(library?.name ?: "Unknown")
                    ).joinToString(",") + "\n"
                )
            }

            // Save to file
            val fileName = "cleverferret_export_${getTimestamp()}.csv"
            val exportFile = File(context.getExternalFilesDir(null), "exports")
            exportFile.mkdirs()
            val file = File(exportFile, fileName)
            file.writeText(csvBuilder.toString())

            ExportResult.Success(
                filePath = file.absolutePath,
                itemCount = mediaItems.size,
                fileSize = file.length()
            )
        } catch (e: Exception) {
            ExportResult.Error(e.message ?: "CSV export failed")
        }
    }

    /**
     * Get list of available backups
     */
    suspend fun getAvailableBackups(): List<BackupInfo> = withContext(Dispatchers.IO) {
        val exportDir = File(context.getExternalFilesDir(null), "exports")
        if (!exportDir.exists()) return@withContext emptyList()

        exportDir.listFiles { file ->
            file.extension == "json" && file.name.startsWith("cleverferret_backup_")
        }?.map { file ->
            BackupInfo(
                fileName = file.name,
                filePath = file.absolutePath,
                fileSize = file.length(),
                dateCreated = file.lastModified()
            )
        }?.sortedByDescending { it.dateCreated } ?: emptyList()
    }

    /**
     * Delete a backup file
     */
    suspend fun deleteBackup(filePath: String): Boolean = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            file.delete()
        } catch (e: Exception) {
            false
        }
    }

    private fun getTimestamp(): String {
        return SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault())
            .format(Date())
    }

    private fun escapeCSV(value: String): String {
        return if (value.contains(',') || value.contains('"') || value.contains('\n')) {
            "\"${value.replace("\"", "\"\"")}\""
        } else {
            value
        }
    }
}

/**
 * Export data structure
 */
@Serializable
data class LibraryExportData(
    val version: Int,
    val exportDate: Long,
    val appVersion: String,
    val libraries: List<Library>,
    val mediaItems: List<MediaItem>,
    val metadata: List<MetadataCommon>,
    val progress: List<ReadingProgress>,
    val bookmarks: List<Bookmark>,
    val collections: List<UnifiedCollection>
)

/**
 * Export result
 */
sealed class ExportResult {
    data class Success(
        val filePath: String,
        val itemCount: Int,
        val fileSize: Long
    ) : ExportResult()

    data class Error(val message: String) : ExportResult()
}

/**
 * Import result
 */
sealed class ImportResult {
    data class Success(
        val importedItems: Int,
        val skippedItems: Int,
        val errors: Int
    ) : ImportResult()

    data class Error(val message: String) : ImportResult()
}

/**
 * Backup file information
 */
data class BackupInfo(
    val fileName: String,
    val filePath: String,
    val fileSize: Long,
    val dateCreated: Long
)
