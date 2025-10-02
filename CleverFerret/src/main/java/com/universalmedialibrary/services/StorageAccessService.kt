package com.universalmedialibrary.services

import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.DocumentsContract
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for handling Storage Access Framework (SAF) operations
 * This replaces raw filesystem access for Android 11+ compatibility
 */
@Singleton
class StorageAccessService @Inject constructor(
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
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
            val uris = prefs.getStringSet("uris", mutableSetOf()) ?: mutableSetOf()
            uris.add(uri.toString())
            prefs.edit().putStringSet("uris", uris).apply()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    /**
     * Get all persisted URI permissions
     */
    fun getPersistedUris(context: Context): List<Uri> {
        val prefs = context.getSharedPreferences(PREF_PERSISTED_URIS, Context.MODE_PRIVATE)
        val uriStrings = prefs.getStringSet("uris", emptySet()) ?: emptySet()
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
                val destParent = targets[type] ?: return@forEach
                val result = moveDocumentFile(context, child, destParent)
                if (result) {
                    moved++
                    progressCallback("Moved: $name → ${destParent.name}")
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
        moved
    }

    private fun getOrCreateChildDir(context: Context, parent: DocumentFile, name: String): DocumentFile {
        parent.listFiles().firstOrNull { it.isDirectory && it.name == name }?.let { return it }
        return parent.createDirectory(name) ?: parent
    }

    private fun moveDocumentFile(context: Context, src: DocumentFile, dstDir: DocumentFile): Boolean {
        return try {
            // Try DocumentsContract move if possible
            val srcDoc = src.uri
            val dstParent = dstDir.uri
            try {
                val moved = android.provider.DocumentsContract.moveDocument(context.contentResolver, srcDoc, src.parentFile?.uri, dstParent)
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
            false
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
            e.printStackTrace()
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
            e.printStackTrace()
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
            e.printStackTrace()
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
            val uris = prefs.getStringSet("uris", mutableSetOf()) ?: mutableSetOf()
            uris.remove(uri.toString())
            prefs.edit().putStringSet("uris", uris).apply()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
