package com.universalmedialibrary.services

import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.provider.DocumentsContract
import android.util.Xml
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMusicTrack
import com.universalmedialibrary.data.local.entity.People
import com.universalmedialibrary.data.local.entity.ItemPersonRole
import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.Series
import com.universalmedialibrary.utils.ComicInfoParser
import com.universalmedialibrary.utils.ComicArchiveUtils
import com.universalmedialibrary.utils.FilebotDataService
import com.universalmedialibrary.utils.FileNameSanitizer
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.xmlpull.v1.XmlPullParser
import java.io.ByteArrayOutputStream
import java.security.MessageDigest
import java.io.File
import java.text.SimpleDateFormat
import java.util.Locale
import java.util.zip.ZipInputStream
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.utils.ErrorLogger
import com.universalmedialibrary.services.importer.ImportLogInfo
import com.universalmedialibrary.services.importer.ImportOperationLog
import com.universalmedialibrary.services.importer.ImportOperationStatus
import com.universalmedialibrary.services.importer.ImportTransactionLog
import com.universalmedialibrary.services.importer.UndoSummary
import com.universalmedialibrary.services.storage.StorageImportClassifier
import kotlinx.serialization.json.Json
import kotlinx.serialization.encodeToString
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.Serializable
import kotlinx.coroutines.currentCoroutineContext
import kotlinx.coroutines.isActive
import kotlinx.coroutines.CancellationException

/**
 * Service for handling Storage Access Framework (SAF) operations
 * This replaces raw filesystem access for Android 11+ compatibility
 */
@Singleton
class StorageAccessService @Inject constructor(
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val fileNameSanitizer: FileNameSanitizer,
    private val filebotDataService: FilebotDataService
) {
    private val importClassifier = StorageImportClassifier()

    private val importLogJson = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
    }

    init {
        filebotDataService.warmCache()
    }

    companion object {
        const val REQUEST_CODE_OPEN_DIRECTORY = 1001
        const val PREF_PERSISTED_URIS = "persisted_uris"

        // Supported file extensions
        val BOOK_EXTENSIONS = StorageImportClassifier.BOOK_EXTENSIONS
        val AUDIO_EXTENSIONS = StorageImportClassifier.AUDIO_EXTENSIONS
        val VIDEO_EXTENSIONS = StorageImportClassifier.VIDEO_EXTENSIONS
        val COMIC_EXTENSIONS = StorageImportClassifier.COMIC_EXTENSIONS
    }

    /**
     * Create intent for directory selection
     */
    fun createDirectoryPickerIntent(): Intent {
        return Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply {
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
            addFlags(Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION)
        }
    }

    /**
     * Persist URI permission for future access
     */
    fun persistUriPermission(context: Context, uri: Uri) {
        try {
            val takeFlags = Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
            context.contentResolver.takePersistableUriPermission(uri, takeFlags)

            // Save to preferences
            val prefs = context.getSharedPreferences(PREF_PERSISTED_URIS, Context.MODE_PRIVATE)
            val uris: MutableSet<String> = prefs.getStringSet("uris", mutableSetOf<String>())?.toMutableSet() ?: mutableSetOf()
            uris.add(uri.toString())
            prefs.edit().putStringSet("uris", uris).apply()
        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error persisting URI permission", e)
        }
    }

    /**
     * Get all persisted URI permissions
     */
    fun getPersistedUris(context: Context): List<Uri> {
        val prefs = context.getSharedPreferences(PREF_PERSISTED_URIS, Context.MODE_PRIVATE)
        val uriStrings: Set<String> = prefs.getStringSet("uris", emptySet<String>()) ?: emptySet()
        return uriStrings.mapNotNull { Uri.parse(it) }
    }

    /**
     * Organize a mixed root SAF folder by moving files into per-type subfolders (Books, Movies, Music, Comics, Documents).
     */
    suspend fun organizeDirectory(
        context: Context,
        treeUri: Uri,
        progressCallback: (String) -> Unit = {}
    ): Int = withContext(Dispatchers.IO) {
        var moved = 0
        try {
            val root = DocumentFile.fromTreeUri(context, treeUri) ?: return@withContext 0
            val targets = mapOf(
                "BOOK" to getOrCreateChildDir(context, root, "Books"),
                "MOVIE" to getOrCreateChildDir(context, root, "Movies"),
                "MUSIC" to getOrCreateChildDir(context, root, "Music"),
                "COMIC" to getOrCreateChildDir(context, root, "Comics"),
                "DOCUMENT" to getOrCreateChildDir(context, root, "Documents")
            )

            root.listFiles().forEach { child ->
                if (child.isDirectory) return@forEach
                val name = child.name ?: return@forEach
                val type = determineMediaType(name) ?: return@forEach
                val destParent = targets[type.name] ?: return@forEach
                val result = moveDocumentFile(context, child, destParent)
                if (result) {
                    moved++
                    progressCallback("Moved: $name → ${destParent.name}")
                }
            }
        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error organizing directory", e)
        }
        moved
    }

    /**
     * Scan an input SAF folder, classify by type, and copy/move into an output SAF folder using
     * a consistent folder/subfolder layout. Inserts basic metadata into the app database.
     *
     * Folder layout (under output root):
     * - Books/<Author>/<Series?>/<Title>.<ext>
     * - Music/<Artist>/<Album>/<TrackNo?> - <Title>.<ext>
     * - Movies/<Title>/<OriginalFileName>
     * - Comics/<Series>/<OriginalFileName>
     * - Documents/<Extension>/<OriginalFileName>
     * - Other/<OriginalFileName>
     */
    suspend fun importFromInputToOutput(
        context: Context,
        inputTreeUri: Uri,
        outputTreeUri: Uri,
        options: ImportSortOptions = ImportSortOptions(),
        progressCallback: (String) -> Unit = {}
    ): ImportSortSummary = withContext(Dispatchers.IO) {
        val summary = ImportSortSummary()
        try {
            val inputRoot = DocumentFile.fromTreeUri(context, inputTreeUri)
                ?: return@withContext summary.copy(errors = summary.errors + 1)
            val outputRoot = DocumentFile.fromTreeUri(context, outputTreeUri)
                ?: return@withContext summary.copy(errors = summary.errors + 1)

            progressCallback("Scanning input…")
            var updated = importRecursively(
                context = context,
                input = inputRoot,
                outputRoot = outputRoot,
                outputRootPath = outputTreeUri.toString(),
                options = options,
                progressCallback = progressCallback,
                summary = summary
            )

            if (options.moveFiles && options.removeEmptyFolders) {
                progressCallback("Removing empty folders…")
                val deleted = deleteEmptyDirectories(inputRoot, isRoot = true, progressCallback = progressCallback)
                updated = updated.copy(deletedFolders = updated.deletedFolders + deleted)
            }
            updated
        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error importing input → output", e)
            summary.copy(errors = summary.errors + 1)
        }
    }

    /**
     * Build an import plan that can be manually reviewed/edited before execution.
     * This does not write any files.
     */
    suspend fun buildImportPlan(
        context: Context,
        inputTreeUri: Uri,
        outputTreeUri: Uri,
        options: ImportSortOptions = ImportSortOptions(),
        progressCallback: (String) -> Unit = {}
    ): ImportPlan = withContext(Dispatchers.IO) {
        try {
            val inputRoot = DocumentFile.fromTreeUri(context, inputTreeUri)
                ?: return@withContext ImportPlan(
                    inputTreeUri = inputTreeUri.toString(),
                    outputTreeUri = outputTreeUri.toString(),
                    items = emptyList()
                )
            progressCallback("Scanning input…")
            val rawItems = mutableListOf<ImportPlanItem>()
            buildPlanRecursively(context, inputRoot, rawItems, progressCallback, options)

            // Post-pass: detect "singletons" for comics series to avoid accidental collection grouping.
            val comicSeriesCounts = rawItems
                .filter { it.mediaType == "COMIC" }
                .mapNotNull { it.series?.takeIf { s -> s.isNotBlank() } }
                .groupingBy { it }
                .eachCount()

            val adjusted = rawItems.map { item ->
                if (item.mediaType == "COMIC" && !item.series.isNullOrBlank()) {
                    val count = comicSeriesCounts[item.series] ?: 0
                    if (count <= 1 && options.profile != ImportSortProfile.COMICS_ALWAYS_SERIES_FOLDER) {
                        item.copy(
                            destSegments = listOf("Comics"),
                            reasons = (item.reasons + "Comic series appears only once (avoid accidental collection folder)"),
                            confidence = minOf(item.confidence, 0.55f)
                        )
                    } else item
                } else item
            }

            ImportPlan(
                inputTreeUri = inputTreeUri.toString(),
                outputTreeUri = outputTreeUri.toString(),
                items = adjusted
            )
        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error building import plan", e)
            ImportPlan(
                inputTreeUri = inputTreeUri.toString(),
                outputTreeUri = outputTreeUri.toString(),
                items = emptyList()
            )
        }
    }

    /**
     * Execute a previously-built (and optionally edited) import plan.
     */
    suspend fun executeImportPlan(
        context: Context,
        plan: ImportPlan,
        options: ImportSortOptions = ImportSortOptions(),
        progressCallback: (String) -> Unit = {}
    ): ImportSortSummary = withContext(Dispatchers.IO) {
        executeImportPlanAdvanced(
            context = context,
            plan = plan,
            options = options,
            startIndex = 0,
            progressCallback = progressCallback,
            checkpointCallback = null
        )
    }

    suspend fun executeImportPlanAdvanced(
        context: Context,
        plan: ImportPlan,
        options: ImportSortOptions = ImportSortOptions(),
        startIndex: Int = 0,
        progressCallback: (String) -> Unit = {},
        checkpointCallback: ((Int) -> Unit)? = null
    ): ImportSortSummary = executeImportPlanAdvancedImpl(
        context = context,
        plan = plan,
        options = options,
        startIndex = startIndex,
        progressCallback = progressCallback,
        checkpointCallback = checkpointCallback,
        mediaItemDao = mediaItemDao,
        metadataDao = metadataDao,
    )




    suspend fun undoImport(
        context: Context,
        fileName: String,
        progressCallback: (String) -> Unit = {}
    ): UndoSummary = withContext(Dispatchers.IO) {
        val log = readImportLog(context, fileName) ?: return@withContext UndoSummary(restoredFailures = 1)
        var restoredFiles = 0
        var restoredFailures = 0
        var deletedDbItems = 0
        var deletedDbFailures = 0

        // Reverse order for safer undo.
        for (op in log.operations.asReversed()) {
            val destUri = op.destinationUri ?: continue
            val destDoc = DocumentFile.fromSingleUri(context, Uri.parse(destUri)) ?: continue

            // Remove DB item
            val itemId = op.insertedItemId
            if (itemId != null) {
                val mi = mediaItemDao.getMediaItemById(itemId)
                if (mi != null) {
                    runCatching {
                        mediaItemDao.deleteMediaItem(mi)
                        deletedDbItems++
                    }.onFailure { deletedDbFailures++ }
                }
            } else {
                val byPath = mediaItemDao.getItemByPath(destUri)
                if (byPath != null) {
                    runCatching {
                        mediaItemDao.deleteMediaItem(byPath)
                        deletedDbItems++
                    }.onFailure { deletedDbFailures++ }
                }
            }

            when (op.status) {
                ImportOperationStatus.MOVED, ImportOperationStatus.QUARANTINED -> {
                    val parentUri = op.sourceParentUri
                    if (parentUri.isNullOrBlank()) {
                        // Can't restore location; do NOT delete (avoid data loss). Report failure and leave file where it is.
                        restoredFailures++
                        continue
                    }
                    // NOTE: sourceParentUri is typically a document URI for the directory, not a tree URI.
                    val parent = DocumentFile.fromSingleUri(context, Uri.parse(parentUri))
                        ?: DocumentFile.fromTreeUri(context, Uri.parse(parentUri))
                    if (parent == null || !parent.isDirectory) {
                        // Can't restore location; do NOT delete (avoid data loss). Report failure and leave file where it is.
                        restoredFailures++
                        continue
                    }
                    val name = op.sourceDisplayName.ifBlank { destDoc.name ?: "file" }
                    progressCallback("Restoring: $name")
                    val moved = runCatching { moveDocumentFile(context, destDoc, parent) }.getOrNull() == true
                    if (moved) restoredFiles++ else restoredFailures++
                }
                ImportOperationStatus.COPIED -> {
                    // Undo copy by deleting destination file.
                    runCatching { destDoc.delete() }.onSuccess { restoredFiles++ }.onFailure { restoredFailures++ }
                }
                else -> Unit
            }
        }

        UndoSummary(
            restoredFiles = restoredFiles,
            restoredFailures = restoredFailures,
            deletedDbItems = deletedDbItems,
            deletedDbFailures = deletedDbFailures
        )
    }






    private sealed class CopyResult {
        data class Copied(val file: DocumentFile) : CopyResult()
        data class Skipped(val reason: String) : CopyResult()
        data class Failed(val reason: String) : CopyResult()
    }




    /**
     * Scan a directory using SAF
     */
    suspend fun scanDirectory(
        context: Context,
        treeUri: Uri,
        libraryName: String? = null,
        progressCallback: (String) -> Unit = {}
    ): Int = withContext(Dispatchers.IO) {
        var itemsFound = 0

        try {
            val documentFile = DocumentFile.fromTreeUri(context, treeUri) ?: return@withContext 0

            // Root info used to create per-type libraries under this tree
            val rootName = documentFile.name ?: libraryName ?: "Media Library"
            val rootPath = treeUri.toString()

            // Recursively scan directory, creating per-type libraries as needed
            itemsFound = scanDocumentFile(context, documentFile, rootName, rootPath, progressCallback)

        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error scanning directory", e)
        }

        itemsFound
    }

    private suspend fun scanDocumentFile(
        context: Context,
        documentFile: DocumentFile,
        rootName: String,
        rootPath: String,
        progressCallback: (String) -> Unit
    ): Int {
        var itemsFound = 0

        if (documentFile.isDirectory) {
            documentFile.listFiles().forEach { child ->
                itemsFound += scanDocumentFile(context, child, rootName, rootPath, progressCallback)
            }
        } else if (documentFile.isFile) {
            val mediaType = determineMediaType(documentFile.name ?: "")
            if (mediaType != null) {
                processMediaFile(context, documentFile, rootName, rootPath, mediaType, progressCallback)
                itemsFound++
            }
        }

        return itemsFound
    }

    private suspend fun processMediaFile(
        context: Context,
        documentFile: DocumentFile,
        rootName: String,
        rootPath: String,
        mediaType: MediaType,
        progressCallback: (String) -> Unit
    ) {
        try {
            val uri = documentFile.uri
            val name = documentFile.name ?: "Unknown"

            progressCallback("Processing: $name")

            // Check if already exists
            val existingItem = mediaItemDao.getItemByPath(uri.toString())
            if (existingItem != null) {
                return
            }

            // Get or create a library for this media type under the same root
            val library = getOrCreateLibraryForType(rootName, rootPath, mediaType.name)

            // Create media item
            val extension = name.substringAfterLast('.', "")
            val mediaItem = MediaItem(
                libraryId = library.libraryId,
                filePath = uri.toString(),
                fileName = name,
                fileExtension = extension.lowercase(),
                fileSize = documentFile.length(),
                fileHash = null,
                dateAdded = System.currentTimeMillis(),
                lastScanned = System.currentTimeMillis(),
                lastModified = documentFile.lastModified(),
                mediaType = mediaType.name,
                mimeType = null,
                isAvailable = true,
                hasMetadata = false,
                hasThumbnail = false,
                thumbnailPath = null
            )

            val itemId = mediaItemDao.insertMediaItem(mediaItem)

            // Create basic metadata
            val metadata = MetadataCommon(
                itemId = itemId,
                title = name.substringBeforeLast('.'),
                sortTitle = null,
                originalTitle = null,
                year = null,
                releaseDate = null,
                rating = null,
                userRating = null,
                communityRating = null,
                summary = null,
                plot = null,
                tagline = null,
                coverImagePath = null,
                backdropImagePath = null,
                language = null,
                country = null,
                lastUpdated = System.currentTimeMillis(),
                metadataSource = "SAF",
                externalId = null
            )
            metadataDao.insertCommonMetadata(metadata)

        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error processing media file", e)
        }
    }

    private suspend fun getOrCreateLibraryForType(rootName: String, rootPath: String, type: String): Library =
        getOrCreateLibraryForTypeImpl(libraryDao, rootName, rootPath, type)




    private data class DerivedMetadata(
        val title: String,
        val authorOrArtist: String? = null,
        val album: String? = null,
        val series: String? = null,
        val trackNumber: Int? = null,
        val durationMs: Long? = null
    )







    private data class OpfParsed(
        val title: String? = null,
        val creator: String? = null,
        val series: String? = null
    )







    private suspend fun importRecursively(
        context: Context,
        srcDir: DocumentFile,
        outputRoot: DocumentFile,
        rootName: String,
        rootPath: String,
        progressCallback: (String) -> Unit,
        log: MutableList<String>
    ) = importRecursivelyImpl(
        context = context,
        srcDir = srcDir,
        outputRoot = outputRoot,
        rootName = rootName,
        rootPath = rootPath,
        progressCallback = progressCallback,
        log = log,
        fileNameSanitizer = fileNameSanitizer,
        mediaItemDao = mediaItemDao,
        metadataDao = metadataDao,
        libraryDao = libraryDao,
    )


    /**
     * Open a media file using SAF
     */
    fun openMediaFile(context: Context, uri: String): DocumentFile? {
        return try {
            val parsedUri = Uri.parse(uri)
            if (DocumentsContract.isDocumentUri(context, parsedUri)) {
                DocumentFile.fromSingleUri(context, parsedUri)
            } else {
                null
            }
        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error opening media file", e)
            null
        }
    }

    /**
     * Get input stream for a media file
     */
    fun getInputStream(context: Context, uri: String) =
        context.contentResolver.openInputStream(Uri.parse(uri))

    /**
     * Check if we have read permission for a URI
     */
    fun hasUriPermission(context: Context, uri: Uri): Boolean {
        return try {
            context.contentResolver.persistedUriPermissions.any {
                it.uri == uri && it.isReadPermission
            }
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Release URI permission
     */
    fun releaseUriPermission(context: Context, uri: Uri) {
        try {
            context.contentResolver.releasePersistableUriPermission(
                uri,
                Intent.FLAG_GRANT_READ_URI_PERMISSION
            )

            // Remove from preferences
            val prefs = context.getSharedPreferences(PREF_PERSISTED_URIS, Context.MODE_PRIVATE)
            val uris: MutableSet<String> = prefs.getStringSet("uris", mutableSetOf<String>())?.toMutableSet() ?: mutableSetOf()
            uris.remove(uri.toString())
            prefs.edit().putStringSet("uris", uris).apply()
        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error releasing URI permission", e)
        }
    }


}

@Serializable

@Serializable

@Serializable

@Serializable

@Serializable

@Serializable
