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
import com.universalmedialibrary.utils.FileNameSanitizer
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.xmlpull.v1.XmlPullParser
import java.io.ByteArrayOutputStream
import java.util.zip.ZipInputStream
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.utils.ErrorLogger

/**
 * Service for handling Storage Access Framework (SAF) operations
 * This replaces raw filesystem access for Android 11+ compatibility
 */
@Singleton
class StorageAccessService @Inject constructor(
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val fileNameSanitizer: FileNameSanitizer
) {

    companion object {
        const val REQUEST_CODE_OPEN_DIRECTORY = 1001
        const val PREF_PERSISTED_URIS = "persisted_uris"

        // Supported file extensions
        val BOOK_EXTENSIONS = setOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx")
        val AUDIO_EXTENSIONS = setOf("mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav", "wma")
        val VIDEO_EXTENSIONS = setOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "mpg", "mpeg")
        val COMIC_EXTENSIONS = setOf("cbz", "cbr", "cb7", "cbt")
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
            buildPlanRecursively(context, inputRoot, rawItems, progressCallback)

            // Post-pass: detect "singletons" for comics series to avoid accidental collection grouping.
            val comicSeriesCounts = rawItems
                .filter { it.mediaType == "COMIC" }
                .mapNotNull { it.series?.takeIf { s -> s.isNotBlank() } }
                .groupingBy { it }
                .eachCount()

            val adjusted = rawItems.map { item ->
                if (item.mediaType == "COMIC" && !item.series.isNullOrBlank()) {
                    val count = comicSeriesCounts[item.series] ?: 0
                    if (count <= 1) {
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
        var summary = ImportSortSummary()
        try {
            val outputRoot = DocumentFile.fromTreeUri(context, Uri.parse(plan.outputTreeUri))
                ?: return@withContext summary.copy(errors = summary.errors + 1)

            for ((index, item) in plan.items.withIndex()) {
                progressCallback("Importing (${index + 1}/${plan.items.size}): ${item.sourceDisplayName}")
                val srcDoc = DocumentFile.fromSingleUri(context, Uri.parse(item.sourceUri))
                if (srcDoc == null || !srcDoc.isFile) {
                    summary = summary.copy(errors = summary.errors + 1)
                    continue
                }

                val destDir = getOrCreateNestedDirs(context, outputRoot, item.destSegments)
                val copied = copyDocumentFile(context, srcDoc, destDir, item.outputFileName)
                if (copied == null || !copied.isFile) {
                    summary = summary.copy(errors = summary.errors + 1)
                    continue
                }

                if (options.moveFiles) {
                    runCatching { srcDoc.delete() }
                }

                summary = summary.copy(imported = summary.imported + 1)

                // Insert into DB (avoid duplicates by destination URI)
                val destUriStr = copied.uri.toString()
                val existing = mediaItemDao.getItemByPath(destUriStr)
                if (existing != null) {
                    summary = summary.copy(skipped = summary.skipped + 1)
                    continue
                }

                val library = getOrCreateLibraryForType(
                    rootName = outputRoot.name ?: "Output",
                    rootPath = plan.outputTreeUri,
                    type = item.mediaType
                )

                val mediaItem = MediaItem(
                    libraryId = library.libraryId,
                    filePath = destUriStr,
                    fileName = copied.name ?: item.outputFileName,
                    fileExtension = (copied.name ?: item.outputFileName).substringAfterLast('.', "").lowercase(),
                    fileSize = copied.length(),
                    fileHash = null,
                    dateAdded = System.currentTimeMillis(),
                    lastScanned = System.currentTimeMillis(),
                    lastModified = copied.lastModified(),
                    mediaType = item.mediaType,
                    mimeType = copied.type,
                    isAvailable = true,
                    hasMetadata = true,
                    hasThumbnail = false,
                    thumbnailPath = null
                )
                val itemId = mediaItemDao.insertMediaItem(mediaItem)

                val common = MetadataCommon(
                    itemId = itemId,
                    title = item.title,
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
                    metadataSource = item.metadataSource,
                    externalId = null
                )
                metadataDao.insertCommonMetadata(common)

                if (!item.authorOrArtist.isNullOrBlank() && item.mediaType in setOf("BOOK", "COMIC")) {
                    val person = People(personId = 0, name = item.authorOrArtist, sortName = item.authorOrArtist)
                    val personId = metadataDao.findPersonByName(item.authorOrArtist) ?: metadataDao.insertPerson(person)
                    metadataDao.insertItemPersonRole(ItemPersonRole(itemId = itemId, personId = personId, role = "AUTHOR"))
                }

                if (item.mediaType == "BOOK") {
                    val ext = item.outputFileName.substringAfterLast('.', "").uppercase()
                    val seriesId = if (!item.series.isNullOrBlank()) {
                        metadataDao.findSeriesByName(item.series)
                            ?: metadataDao.insertSeries(Series(seriesId = 0, name = item.series, mediaType = "BOOK"))
                    } else null
                    metadataDao.insertMetadataBook(
                        MetadataBook(
                            itemId = itemId,
                            series = seriesId?.toString(),
                            format = ext
                        )
                    )
                }

                if (item.mediaType == "MUSIC") {
                    metadataDao.insertMetadataMusicTrack(
                        MetadataMusicTrack(
                            itemId = itemId,
                            album = item.album,
                            artist = item.authorOrArtist,
                            trackNumber = item.trackNumber,
                            duration = item.durationMs
                        )
                    )
                }
            }

            if (options.moveFiles && options.removeEmptyFolders) {
                val inputRoot = DocumentFile.fromTreeUri(context, Uri.parse(plan.inputTreeUri))
                if (inputRoot != null) {
                    progressCallback("Removing empty folders…")
                    val deleted = deleteEmptyDirectories(inputRoot, isRoot = true, progressCallback = progressCallback)
                    summary = summary.copy(deletedFolders = summary.deletedFolders + deleted)
                }
            }
            summary
        } catch (e: Exception) {
            ErrorLogger.logError("StorageAccessService", "Error executing import plan", e)
            summary.copy(errors = summary.errors + 1)
        }
    }

    private fun getOrCreateChildDir(context: Context, parent: DocumentFile, name: String): DocumentFile {
        parent.listFiles().firstOrNull { it.isDirectory && it.name == name }?.let { return it }
        return parent.createDirectory(name) ?: parent
    }

    private fun getOrCreateNestedDirs(context: Context, root: DocumentFile, pathSegments: List<String>): DocumentFile {
        var current = root
        for (segment in pathSegments) {
            val cleaned = fileNameSanitizer.sanitizePath(segment).ifBlank { "Unknown" }
            current = getOrCreateChildDir(context, current, cleaned)
        }
        return current
    }

    private fun moveDocumentFile(context: Context, src: DocumentFile, dstDir: DocumentFile): Boolean {
        return try {
            // Try DocumentsContract move if possible
            val srcDoc = src.uri
            val dstParent = dstDir.uri
            try {
                val parentUri: Uri? = src.parentFile?.uri
                val moved = if (parentUri != null) {
                    DocumentsContract.moveDocument(context.contentResolver, srcDoc, parentUri, dstParent)
                } else {
                    null
                }
                moved != null
            } catch (_: Throwable) {
                // Fallback to copy + delete
                val mime = src.type ?: "application/octet-stream"
                val base = src.name ?: "file"
                val target = createUniqueFile(dstDir, mime, base)
                val copied = copyStream(context, src.uri, target.uri)
                if (copied) src.delete() else false
            }
        } catch (e: Exception) {
            ErrorLogger.logWarning("StorageAccessService", "Error moving document file", e)
            false
        }
    }

    private fun copyDocumentFile(context: Context, src: DocumentFile, dstDir: DocumentFile, desiredName: String): DocumentFile? {
        return try {
            val mime = src.type ?: "application/octet-stream"
            val target = createUniqueFile(dstDir, mime, desiredName)
            val copied = copyStream(context, src.uri, target.uri)
            if (copied) target else null
        } catch (e: Exception) {
            ErrorLogger.logWarning("StorageAccessService", "Error copying document file", e)
            null
        }
    }

    private fun createUniqueFile(dstDir: DocumentFile, mime: String, baseName: String): DocumentFile {
        var name = baseName
        var idx = 1
        while (dstDir.findFile(name) != null) {
            val ext = name.substringAfterLast('.', "")
            val stem = if (ext.isNotEmpty()) name.removeSuffix(".$ext") else name
            name = if (ext.isNotEmpty()) "$stem ($idx).$ext" else "$stem ($idx)"
            idx++
        }
        return dstDir.createFile(mime, name) ?: dstDir
    }

    private fun copyStream(context: Context, src: Uri, dst: Uri): Boolean {
        return try {
            context.contentResolver.openInputStream(src).use { input ->
                context.contentResolver.openOutputStream(dst, "w").use { output ->
                    if (input == null || output == null) return false
                    val buf = ByteArray(8192)
                    var n: Int
                    while (true) {
                        n = input.read(buf)
                        if (n <= 0) break
                        output.write(buf, 0, n)
                    }
                    output.flush()
                }
            }
            true
        } catch (e: Exception) { false }
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

    private suspend fun getOrCreateLibraryForType(rootName: String, rootPath: String, type: String): Library {
        // Try to find a library with this type under the same root path
        val existing = libraryDao.getLibrariesByType(type).firstOrNull { it.path == rootPath }
        if (existing != null) return existing

        val name = "$rootName - ${'$'}{type.lowercase().replaceFirstChar { it.uppercase() }}"
        var library = Library(
            name = name,
            type = type,
            path = rootPath,
            dateModified = System.currentTimeMillis()
        )
        val id = libraryDao.insertLibrary(library)
        library = library.copy(libraryId = id)
        return library
    }

    private fun determineMediaType(fileName: String): MediaType? {
        val extension = fileName.substringAfterLast('.', "").lowercase()
        return when {
            extension in BOOK_EXTENSIONS -> MediaType.BOOK
            extension in AUDIO_EXTENSIONS -> MediaType.MUSIC
            extension in VIDEO_EXTENSIONS -> MediaType.MOVIE
            extension in COMIC_EXTENSIONS -> MediaType.COMIC
            else -> null
        }
    }

    private fun determineMediaTypeName(fileName: String): String {
        val ext = fileName.substringAfterLast('.', "").lowercase()
        return when {
            ext in BOOK_EXTENSIONS -> "BOOK"
            ext in AUDIO_EXTENSIONS -> "MUSIC"
            ext in VIDEO_EXTENSIONS -> "MOVIE"
            ext in COMIC_EXTENSIONS -> "COMIC"
            ext.isNotBlank() -> "DOCUMENT"
            else -> "OTHER"
        }
    }

    private data class DerivedMetadata(
        val title: String,
        val authorOrArtist: String? = null,
        val album: String? = null,
        val series: String? = null,
        val trackNumber: Int? = null,
        val durationMs: Long? = null
    )

    private fun deriveMetadataFromName(fileName: String): DerivedMetadata {
        val base = fileName.substringBeforeLast('.').trim()
        val normalized = base
            .replace("—", "-")
            .replace("–", "-")
            .replace("_", " ")
            .replace(Regex("\\s+"), " ")
            .trim()
        val cleaned = normalized
            .replace(Regex("\\s*\\[[^\\]]*]\\s*"), " ")
            .replace(Regex("\\s*\\([^)]*\\)\\s*"), " ")
            .replace(Regex("\\s+"), " ")
            .trim()

        // "Title by Author"
        Regex("^(.*)\\s+by\\s+(.+)$", RegexOption.IGNORE_CASE).find(cleaned)?.let { m ->
            val title = m.groupValues.getOrNull(1)?.trim().orEmpty()
            val author = m.groupValues.getOrNull(2)?.trim().orEmpty()
            if (title.isNotBlank() && author.isNotBlank()) {
                return DerivedMetadata(title = title, authorOrArtist = author)
            }
        }

        // Split on common separators
        val parts = cleaned.split(" - ").map { it.trim() }.filter { it.isNotBlank() }
        if (parts.size < 2) return DerivedMetadata(title = cleaned.ifBlank { base })

        val left = parts.first()
        val right = parts.drop(1).joinToString(" - ")

        val leftAuthorScore = scoreAsAuthor(left)
        val rightAuthorScore = scoreAsAuthor(right)
        val leftTitleScore = scoreAsTitle(left)
        val rightTitleScore = scoreAsTitle(right)

        val authorIsLeft = when {
            leftAuthorScore != rightAuthorScore -> leftAuthorScore > rightAuthorScore
            leftTitleScore != rightTitleScore -> leftTitleScore < rightTitleScore
            else -> true // default: "Author - Title"
        }

        return if (authorIsLeft) {
            DerivedMetadata(title = right, authorOrArtist = left)
        } else {
            DerivedMetadata(title = left, authorOrArtist = right)
        }
    }

    private fun scoreAsAuthor(value: String): Int {
        var score = 0
        val v = value.trim()
        if (v.contains(",")) score += 2 // "Last, First"
        if (v.startsWith("by ", ignoreCase = true)) score += 2
        val words = v.split(" ").filter { it.isNotBlank() }
        if (words.size in 2..4 && words.all { it.firstOrNull()?.isUpperCase() == true }) score += 1
        if (v.any { it.isDigit() }) score -= 1
        if (Regex("\\b(vol|volume|book|chapter|part)\\b", RegexOption.IGNORE_CASE).containsMatchIn(v)) score -= 1
        return score
    }

    private fun scoreAsTitle(value: String): Int {
        var score = 0
        val v = value.trim()
        val words = v.split(" ").filter { it.isNotBlank() }
        if (words.size >= 5) score += 1
        if (v.contains(":")) score += 1
        if (v.any { it.isDigit() }) score += 1
        if (Regex("\\b(vol|volume|book|chapter|part)\\b", RegexOption.IGNORE_CASE).containsMatchIn(v)) score += 1
        return score
    }

    private fun deriveMetadataForAudio(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(context, uri)
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
                ?.takeIf { it.isNotBlank() }
                ?: fallbackName.substringBeforeLast('.')
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
                ?.takeIf { it.isNotBlank() }
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
                ?.takeIf { it.isNotBlank() }
            val track = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)
                ?.split("/", "-", "\\")?.firstOrNull()?.trim()?.toIntOrNull()
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            DerivedMetadata(title = title, authorOrArtist = artist, album = album, trackNumber = track, durationMs = duration)
        } catch (_: Exception) {
            deriveMetadataFromName(fallbackName)
        } finally {
            runCatching { retriever.release() }
        }
    }

    private fun deriveMetadataForBook(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
        val lower = fallbackName.lowercase()
        return when {
            lower.endsWith(".epub") -> deriveMetadataForEpub(context, uri, fallbackName)
            lower.endsWith(".pdf") -> deriveMetadataForPdf(context, uri, fallbackName)
            else -> deriveMetadataFromName(fallbackName)
        }
    }

    private fun deriveMetadataForEpub(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
        // Parse META-INF/container.xml -> OPF -> dc:title + dc:creator + calibre series
        return try {
            val entries = mutableMapOf<String, ByteArray>()
            context.contentResolver.openInputStream(uri).use { input ->
                if (input == null) return@use
                ZipInputStream(input).use { zis ->
                    while (true) {
                        val entry = zis.nextEntry ?: break
                        if (entry.isDirectory) continue
                        val name = entry.name
                        if (name.equals("META-INF/container.xml", ignoreCase = true) ||
                            name.endsWith(".opf", ignoreCase = true)
                        ) {
                            val baos = ByteArrayOutputStream()
                            val buf = ByteArray(8192)
                            var n: Int
                            while (zis.read(buf).also { n = it } > 0) {
                                baos.write(buf, 0, n)
                            }
                            entries[name] = baos.toByteArray()
                        }
                    }
                }
            }

            val containerBytes = entries.entries.firstOrNull { it.key.equals("META-INF/container.xml", ignoreCase = true) }?.value
            val opfPath = containerBytes?.let { parseEpubOpfPath(it) }

            val opfBytes = when {
                opfPath != null -> entries[opfPath]
                else -> entries.entries.firstOrNull { it.key.endsWith(".opf", ignoreCase = true) }?.value
            }

            if (opfBytes != null) {
                val parsed = parseOpfMetadata(opfBytes)
                val title = parsed.title?.takeIf { it.isNotBlank() } ?: fallbackName.substringBeforeLast('.')
                val author = parsed.creator?.takeIf { it.isNotBlank() }
                val series = parsed.series?.takeIf { it.isNotBlank() }

                // If OPF is missing/odd, fall back to filename heuristics.
                val fallback = deriveMetadataFromName(fallbackName)
                return DerivedMetadata(
                    title = title.ifBlank { fallback.title },
                    authorOrArtist = author ?: fallback.authorOrArtist,
                    series = series ?: fallback.series
                )
            }

            deriveMetadataFromName(fallbackName)
        } catch (_: Exception) {
            deriveMetadataFromName(fallbackName)
        }
    }

    private data class OpfParsed(
        val title: String? = null,
        val creator: String? = null,
        val series: String? = null
    )

    private fun parseEpubOpfPath(containerXml: ByteArray): String? {
        return try {
            val parser = Xml.newPullParser()
            parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, false)
            parser.setInput(containerXml.inputStream(), null)
            var event = parser.eventType
            while (event != XmlPullParser.END_DOCUMENT) {
                if (event == XmlPullParser.START_TAG && parser.name.equals("rootfile", ignoreCase = true)) {
                    val fullPath = parser.getAttributeValue(null, "full-path")
                    if (!fullPath.isNullOrBlank()) return fullPath
                }
                event = parser.next()
            }
            null
        } catch (_: Exception) {
            null
        }
    }

    private fun parseOpfMetadata(opfXml: ByteArray): OpfParsed {
        var title: String? = null
        var creator: String? = null
        var series: String? = null
        return try {
            val parser = Xml.newPullParser()
            parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, false)
            parser.setInput(opfXml.inputStream(), null)
            var event = parser.eventType
            var currentTag: String? = null
            while (event != XmlPullParser.END_DOCUMENT) {
                when (event) {
                    XmlPullParser.START_TAG -> {
                        currentTag = parser.name
                        // calibre series is often stored as <meta name="calibre:series" content="X"/>
                        if (parser.name.equals("meta", ignoreCase = true)) {
                            val nameAttr = parser.getAttributeValue(null, "name")
                            if (nameAttr.equals("calibre:series", ignoreCase = true)) {
                                series = parser.getAttributeValue(null, "content")
                            }
                        }
                    }
                    XmlPullParser.TEXT -> {
                        val text = parser.text?.trim().orEmpty()
                        if (text.isNotBlank() && currentTag != null) {
                            val tag = currentTag!!.lowercase()
                            if (title.isNullOrBlank() && tag.endsWith("title")) title = text
                            if (creator.isNullOrBlank() && (tag.endsWith("creator") || tag.endsWith("author"))) creator = text
                        }
                    }
                    XmlPullParser.END_TAG -> currentTag = null
                }
                event = parser.next()
            }
            OpfParsed(title = title, creator = creator, series = series)
        } catch (_: Exception) {
            OpfParsed()
        }
    }

    private fun deriveMetadataForPdf(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
        // Best-effort: PDFs often store /Title(...) and /Author(...) in the info dictionary.
        // This is not guaranteed (may be compressed/encoded), but it's a useful heuristic.
        return try {
            val maxBytes = 512 * 1024 // 512KB
            val buf = ByteArray(8192)
            val baos = ByteArrayOutputStream()
            context.contentResolver.openInputStream(uri).use { input ->
                if (input == null) return@use
                var remaining = maxBytes
                while (remaining > 0) {
                    val toRead = minOf(buf.size, remaining)
                    val n = input.read(buf, 0, toRead)
                    if (n <= 0) break
                    baos.write(buf, 0, n)
                    remaining -= n
                }
            }
            val text = baos.toByteArray().toString(Charsets.ISO_8859_1)
            val title = extractPdfInfoField(text, "Title")
            val author = extractPdfInfoField(text, "Author")
            val fallback = deriveMetadataFromName(fallbackName)
            DerivedMetadata(
                title = title?.ifBlank { null } ?: fallback.title,
                authorOrArtist = author?.ifBlank { null } ?: fallback.authorOrArtist
            )
        } catch (_: Exception) {
            deriveMetadataFromName(fallbackName)
        }
    }

    private fun extractPdfInfoField(pdfText: String, key: String): String? {
        // Matches: /Title (value) or /Title(value)
        val regex = Regex("/$key\\s*\\(([^)]*)\\)")
        val raw = regex.find(pdfText)?.groupValues?.getOrNull(1) ?: return null
        return raw
            .replace("\\\\", "\\")
            .replace("\\(", "(")
            .replace("\\)", ")")
            .trim()
            .takeIf { it.isNotBlank() }
    }

    private fun deriveMetadataForCbz(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
        // Only CBZ reliably supports ZipInputStream here; other comic formats fall back to filename.
        return try {
            context.contentResolver.openInputStream(uri).use { input ->
                if (input == null) return@use null
                ZipInputStream(input).use { zis ->
                    var entry = zis.nextEntry
                    while (entry != null) {
                        if (!entry.isDirectory && entry.name.endsWith("ComicInfo.xml", ignoreCase = true)) {
                            val info = ComicInfoParser.parse(zis)
                            val title = info.title?.takeIf { it.isNotBlank() } ?: fallbackName.substringBeforeLast('.')
                            return DerivedMetadata(
                                title = title,
                                authorOrArtist = info.writer,
                                series = info.series,
                            )
                        }
                        entry = zis.nextEntry
                    }
                    null
                }
            } ?: deriveMetadataFromName(fallbackName)
        } catch (_: Exception) {
            deriveMetadataFromName(fallbackName)
        }
    }

    private fun deleteEmptyDirectories(
        dir: DocumentFile,
        isRoot: Boolean,
        progressCallback: (String) -> Unit
    ): Int {
        if (!dir.isDirectory) return 0
        var deleted = 0
        dir.listFiles().forEach { child ->
            if (child.isDirectory) {
                deleted += deleteEmptyDirectories(child, isRoot = false, progressCallback = progressCallback)
            }
        }
        val nowEmpty = dir.listFiles().isEmpty()
        if (nowEmpty && !isRoot) {
            val name = dir.name ?: "folder"
            if (dir.delete()) {
                deleted += 1
                progressCallback("Removed empty folder: $name")
            }
        }
        return deleted
    }

    private suspend fun importRecursively(
        context: Context,
        input: DocumentFile,
        outputRoot: DocumentFile,
        outputRootPath: String,
        options: ImportSortOptions,
        progressCallback: (String) -> Unit,
        summary: ImportSortSummary
    ): ImportSortSummary {
        if (!input.isDirectory) return summary
        var currentSummary = summary

        input.listFiles().forEach { child ->
            if (child.isDirectory) {
                currentSummary = importRecursively(
                    context = context,
                    input = child,
                    outputRoot = outputRoot,
                    outputRootPath = outputRootPath,
                    options = options,
                    progressCallback = progressCallback,
                    summary = currentSummary
                )
                return@forEach
            }

            val srcName = child.name ?: return@forEach
            if (!child.isFile) return@forEach

            val mediaType = determineMediaTypeName(srcName)
            val derived = when (mediaType) {
                "MUSIC" -> deriveMetadataForAudio(context, child.uri, srcName)
                "BOOK" -> deriveMetadataForBook(context, child.uri, srcName)
                "COMIC" -> if (srcName.lowercase().endsWith(".cbz")) deriveMetadataForCbz(context, child.uri, srcName) else deriveMetadataFromName(srcName)
                else -> deriveMetadataFromName(srcName)
            }

            val safeTitle = fileNameSanitizer.sanitizeFileNamePermissive(derived.title).ifBlank { "Unknown" }
            val safeAuthor = derived.authorOrArtist?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
            val safeAlbum = derived.album?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
            val safeSeries = derived.series?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }

            val ext = srcName.substringAfterLast('.', "").lowercase()

            val (folderSegments, outputFileName) = when (mediaType) {
                "BOOK" -> {
                    val segments = buildList {
                        add("Books")
                        add(safeAuthor ?: "Unknown Author")
                        safeSeries?.let { add(it) }
                    }
                    val name = "${safeTitle}.${ext.ifBlank { "bin" }}"
                    segments to name
                }
                "MUSIC" -> {
                    val segments = listOf("Music", safeAuthor ?: "Unknown Artist", safeAlbum ?: "Unknown Album")
                    val prefix = derived.trackNumber?.let { tn -> tn.coerceAtLeast(0).toString().padStart(2, '0') + " - " } ?: ""
                    val name = "${prefix}${safeTitle}.${ext.ifBlank { "bin" }}"
                    segments to name
                }
                "MOVIE" -> listOf("Movies", safeTitle) to srcName
                "COMIC" -> listOf("Comics", safeSeries ?: "Unknown Series") to srcName
                "DOCUMENT" -> listOf("Documents", ext.ifBlank { "unknown" }.uppercase()) to srcName
                else -> listOf("Other") to srcName
            }

            val destDir = getOrCreateNestedDirs(context, outputRoot, folderSegments)
            progressCallback("Importing: $srcName")

            val copied = copyDocumentFile(context, child, destDir, outputFileName)
            if (copied == null) {
                currentSummary = currentSummary.copy(errors = currentSummary.errors + 1)
                return@forEach
            }

            if (options.moveFiles) {
                runCatching { child.delete() }
            }

            // Insert into DB (avoid duplicates by URI)
            if (!copied.isFile) {
                currentSummary = currentSummary.copy(errors = currentSummary.errors + 1)
                return@forEach
            }
            val destUriStr = copied.uri.toString()
            val existing = mediaItemDao.getItemByPath(destUriStr)
            if (existing == null) {
                val library = getOrCreateLibraryForType(
                    rootName = outputRoot.name ?: "Output",
                    rootPath = outputRootPath,
                    type = mediaType
                )

                val mediaItem = MediaItem(
                    libraryId = library.libraryId,
                    filePath = destUriStr,
                    fileName = copied.name ?: outputFileName,
                    fileExtension = (copied.name ?: outputFileName).substringAfterLast('.', "").lowercase(),
                    fileSize = copied.length(),
                    fileHash = null,
                    dateAdded = System.currentTimeMillis(),
                    lastScanned = System.currentTimeMillis(),
                    lastModified = copied.lastModified(),
                    mediaType = mediaType,
                    mimeType = copied.type,
                    isAvailable = true,
                    hasMetadata = true,
                    hasThumbnail = false,
                    thumbnailPath = null
                )
                val itemId = mediaItemDao.insertMediaItem(mediaItem)

                val common = MetadataCommon(
                    itemId = itemId,
                    title = derived.title,
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
                    metadataSource = "IMPORT_SORTER",
                    externalId = null
                )
                metadataDao.insertCommonMetadata(common)

                if (!derived.authorOrArtist.isNullOrBlank() && mediaType == "BOOK") {
                    val person = People(personId = 0, name = derived.authorOrArtist, sortName = derived.authorOrArtist)
                    val personId = metadataDao.findPersonByName(derived.authorOrArtist) ?: metadataDao.insertPerson(person)
                    metadataDao.insertItemPersonRole(ItemPersonRole(itemId = itemId, personId = personId, role = "AUTHOR"))
                }

                if (!derived.series.isNullOrBlank() && mediaType == "BOOK") {
                    val seriesId = metadataDao.findSeriesByName(derived.series)
                        ?: metadataDao.insertSeries(Series(seriesId = 0, name = derived.series, mediaType = "BOOK"))
                    // Schema stores seriesId in metadata_book.series (string column in model).
                    metadataDao.insertMetadataBook(
                        MetadataBook(
                            itemId = itemId,
                            series = seriesId.toString(),
                            format = ext.uppercase()
                        )
                    )
                } else if (mediaType == "BOOK") {
                    metadataDao.insertMetadataBook(
                        MetadataBook(
                            itemId = itemId,
                            format = ext.uppercase()
                        )
                    )
                }

                if (mediaType == "MUSIC") {
                    metadataDao.insertMetadataMusicTrack(
                        MetadataMusicTrack(
                            itemId = itemId,
                            album = derived.album,
                            artist = derived.authorOrArtist,
                            trackNumber = derived.trackNumber,
                            duration = derived.durationMs
                        )
                    )
                }
                if (mediaType == "COMIC" && !derived.authorOrArtist.isNullOrBlank()) {
                    val person = People(personId = 0, name = derived.authorOrArtist, sortName = derived.authorOrArtist)
                    val personId = metadataDao.findPersonByName(derived.authorOrArtist) ?: metadataDao.insertPerson(person)
                    metadataDao.insertItemPersonRole(ItemPersonRole(itemId = itemId, personId = personId, role = "AUTHOR"))
                }
            } else {
                currentSummary = currentSummary.copy(skipped = currentSummary.skipped + 1)
                // We already copied the file to output; count it as processed even if DB insert was skipped.
            }

            currentSummary = currentSummary.copy(imported = currentSummary.imported + 1)
        }

        return currentSummary
    }

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

    private fun buildPlanRecursively(
        context: Context,
        input: DocumentFile,
        out: MutableList<ImportPlanItem>,
        progressCallback: (String) -> Unit
    ) {
        if (!input.isDirectory) return
        input.listFiles().forEach { child ->
            if (child.isDirectory) {
                buildPlanRecursively(context, child, out, progressCallback)
                return@forEach
            }
            if (!child.isFile) return@forEach
            val srcName = child.name ?: return@forEach
            val mediaType = determineMediaTypeName(srcName)

            val (derived, metadataSource, confidenceBase) = when (mediaType) {
                "MUSIC" -> Triple(deriveMetadataForAudio(context, child.uri, srcName), "AUDIO_TAGS", 0.9f)
                "BOOK" -> {
                    val byExt = if (srcName.lowercase().endsWith(".epub")) "EPUB_OPF" else if (srcName.lowercase().endsWith(".pdf")) "PDF_INFO" else "FILENAME"
                    val d = deriveMetadataForBook(context, child.uri, srcName)
                    val conf = when (byExt) {
                        "EPUB_OPF" -> if (d.authorOrArtist != null || d.title.isNotBlank()) 0.85f else 0.55f
                        "PDF_INFO" -> if (d.authorOrArtist != null) 0.75f else 0.55f
                        else -> 0.55f
                    }
                    Triple(d, byExt, conf)
                }
                "COMIC" -> {
                    val cbz = srcName.lowercase().endsWith(".cbz")
                    val d = if (cbz) deriveMetadataForCbz(context, child.uri, srcName) else deriveMetadataFromName(srcName)
                    Triple(d, if (cbz) "COMICINFO" else "FILENAME", if (cbz) 0.8f else 0.55f)
                }
                else -> Triple(deriveMetadataFromName(srcName), "FILENAME", 0.55f)
            }

            val reasons = mutableListOf<String>()
            var confidence = confidenceBase

            if (derived.title.replace(" ", "").length >= 18 && !derived.title.contains(" ")) {
                reasons += "Title has no spaces (may need manual spacing)"
                confidence = minOf(confidence, 0.5f)
            }
            if ((mediaType == "BOOK" || mediaType == "COMIC") && derived.authorOrArtist.isNullOrBlank()) {
                reasons += "Missing author/creator"
                confidence = minOf(confidence, 0.55f)
            }
            if (metadataSource == "FILENAME") {
                reasons += "Derived from filename"
                confidence = minOf(confidence, 0.55f)
            }

            val ext = srcName.substringAfterLast('.', "").lowercase()
            val safeTitle = fileNameSanitizer.sanitizeFileNamePermissive(derived.title).ifBlank { "Unknown" }
            val safeAuthor = derived.authorOrArtist?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
            val safeAlbum = derived.album?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
            val safeSeries = derived.series?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }

            val (destSegments, outputFileName) = when (mediaType) {
                "BOOK" -> {
                    val segments = buildList {
                        add("Books")
                        add(safeAuthor ?: "Unknown Author")
                        safeSeries?.let { add(it) }
                    }
                    val name = "${safeTitle}.${ext.ifBlank { "bin" }}"
                    segments to name
                }
                "MUSIC" -> {
                    val segments = listOf("Music", safeAuthor ?: "Unknown Artist", safeAlbum ?: "Unknown Album")
                    val prefix = derived.trackNumber?.let { tn -> tn.coerceAtLeast(0).toString().padStart(2, '0') + " - " } ?: ""
                    val name = "${prefix}${safeTitle}.${ext.ifBlank { "bin" }}"
                    segments to name
                }
                "MOVIE" -> listOf("Movies", safeTitle) to srcName
                "COMIC" -> listOf("Comics", safeSeries ?: "Unknown Series") to srcName
                "DOCUMENT" -> listOf("Documents", ext.ifBlank { "unknown" }.uppercase()) to srcName
                else -> listOf("Other") to srcName
            }

            out += ImportPlanItem(
                sourceUri = child.uri.toString(),
                sourceDisplayName = srcName,
                mediaType = mediaType,
                title = derived.title,
                authorOrArtist = derived.authorOrArtist,
                album = derived.album,
                series = derived.series,
                trackNumber = derived.trackNumber,
                durationMs = derived.durationMs,
                metadataSource = metadataSource,
                confidence = confidence,
                reasons = reasons,
                destSegments = destSegments,
                outputFileName = outputFileName
            )
        }
    }
}

data class ImportSortOptions(
    val moveFiles: Boolean = false
    ,
    val removeEmptyFolders: Boolean = true
)

data class ImportSortSummary(
    val imported: Int = 0,
    val skipped: Int = 0,
    val errors: Int = 0,
    val deletedFolders: Int = 0
)

data class ImportPlan(
    val inputTreeUri: String,
    val outputTreeUri: String,
    val items: List<ImportPlanItem>
)

data class ImportPlanItem(
    val sourceUri: String,
    val sourceDisplayName: String,
    val mediaType: String,
    val title: String,
    val authorOrArtist: String? = null,
    val album: String? = null,
    val series: String? = null,
    val trackNumber: Int? = null,
    val durationMs: Long? = null,
    val metadataSource: String? = null,
    val confidence: Float = 0.5f,
    val reasons: List<String> = emptyList(),
    val destSegments: List<String>,
    val outputFileName: String
) {
    val isQuestionable: Boolean
        get() = confidence < 0.7f || reasons.isNotEmpty()
}
