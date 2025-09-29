package com.universalmedialibrary.services

import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.DocumentsContract
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.Library
import com.universalmedialibrary.data.local.model.MediaItem
import com.universalmedialibrary.data.local.model.MediaType
import com.universalmedialibrary.data.local.model.MetadataCommon
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.Date
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
            addFlags(Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION)
        }
    }
    
    /**
     * Persist URI permission for future access
     */
    fun persistUriPermission(context: Context, uri: Uri) {
        try {
            val takeFlags = Intent.FLAG_GRANT_READ_URI_PERMISSION
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
            
            // Create or get library
            val library = getOrCreateLibrary(documentFile.name ?: libraryName ?: "Media Library", treeUri.toString())
            
            // Recursively scan directory
            itemsFound = scanDocumentFile(context, documentFile, library, progressCallback)
            
        } catch (e: Exception) {
            e.printStackTrace()
        }
        
        itemsFound
    }
    
    private suspend fun scanDocumentFile(
        context: Context,
        documentFile: DocumentFile,
        library: Library,
        progressCallback: (String) -> Unit
    ): Int {
        var itemsFound = 0
        
        if (documentFile.isDirectory) {
            documentFile.listFiles().forEach { child ->
                itemsFound += scanDocumentFile(context, child, library, progressCallback)
            }
        } else if (documentFile.isFile) {
            val mediaType = determineMediaType(documentFile.name ?: "")
            if (mediaType != null) {
                processMediaFile(context, documentFile, library, mediaType, progressCallback)
                itemsFound++
            }
        }
        
        return itemsFound
    }
    
    private suspend fun processMediaFile(
        context: Context,
        documentFile: DocumentFile,
        library: Library,
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
            
            // Create media item
            val mediaItem = MediaItem(
                libraryId = library.libraryId,
                fileName = name,
                filePath = uri.toString(),
                fileSize = documentFile.length(),
                mediaType = mediaType,
                dateAdded = Date(),
                lastModified = Date(documentFile.lastModified()),
                lastAccessed = null,
                playCount = 0,
                isLocal = true
            )
            
            val itemId = mediaItemDao.insertMediaItem(mediaItem)
            
            // Create basic metadata
            val metadata = MetadataCommon(
                itemId = itemId,
                title = name.substringBeforeLast('.'),
                description = null,
                tags = null,
                userRating = null,
                coverImagePath = null,
                isFavorite = false,
                isDownloaded = true
            )
            metadataDao.insertCommonMetadata(metadata)
            
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
    
    private suspend fun getOrCreateLibrary(name: String, path: String): Library {
        var library = libraryDao.getLibrariesByType(name).firstOrNull()
        if (library == null) {
            library = Library(
                name = name,
                type = "SAF",
                path = path,
                dateCreated = Date(),
                dateModified = Date()
            )
            val id = libraryDao.insertLibrary(library)
            library = library.copy(libraryId = id)
        }
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