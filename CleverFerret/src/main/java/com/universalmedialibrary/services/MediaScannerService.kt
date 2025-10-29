package com.universalmedialibrary.services

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.database.Cursor
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.IBinder
import android.provider.MediaStore
import android.provider.OpenableColumns
import androidx.core.app.NotificationCompat
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.*
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.*
import java.io.File
import javax.inject.Inject

/**
 * Service for scanning and importing media files from device storage
 *
 * RECENT CHANGES FROM MAIN:
 * - Added MediaType import from com.universalmedialibrary.data.MediaType
 * - Fixed MediaItem constructor parameters (removed Date objects, use Long timestamps)
 * - Changed mediaType from enum to String (mediaType.name)
 * - Fixed MetadataMusicTrack: albumTitle -> album, duration from Int to Long
 * - Fixed MetadataMovie: removed invalid parameters, fixed runtime calculation
 * - Fixed Library constructor: removed Date objects, use System.currentTimeMillis()
 * - Fixed MetadataCommon: removed invalid parameters (description, tags, etc.)
 * - Changed DAO method names: insertMusicTrackMetadata -> insertMetadataMusicTrack
 * - These changes ensure compatibility with the Room entity definitions
 */
@AndroidEntryPoint
class MediaScannerService : Service() {

    @Inject lateinit var libraryDao: LibraryDao
    @Inject lateinit var mediaItemDao: MediaItemDao
    @Inject lateinit var metadataDao: MetadataDao

    private val serviceScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private var scanJob: Job? = null

    companion object {
        const val ACTION_SCAN_ALL = "com.universalmedialibrary.ACTION_SCAN_ALL"
        const val ACTION_SCAN_LIBRARY = "com.universalmedialibrary.ACTION_SCAN_LIBRARY"
        const val EXTRA_LIBRARY_ID = "library_id"
        const val EXTRA_SCAN_PATH = "scan_path"

        private const val CHANNEL_ID = "media_scanner_channel"
        private const val NOTIFICATION_ID = 2

        // Supported file extensions
        val BOOK_EXTENSIONS = setOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx")
        val AUDIO_EXTENSIONS = setOf("mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav", "wma")
        val VIDEO_EXTENSIONS = setOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "mpg", "mpeg")
        val IMAGE_EXTENSIONS = setOf("jpg", "jpeg", "png", "gif", "bmp", "webp", "svg", "tiff")
        val COMIC_EXTENSIONS = setOf("cbz", "cbr", "cb7", "cbt")
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_SCAN_ALL -> {
                startForeground(NOTIFICATION_ID, createNotification("Scanning all media..."))
                scanAllMedia()
            }
            ACTION_SCAN_LIBRARY -> {
                val libraryId = intent.getLongExtra(EXTRA_LIBRARY_ID, -1)
                val scanPath = intent.getStringExtra(EXTRA_SCAN_PATH)
                if (libraryId != -1L) {
                    startForeground(NOTIFICATION_ID, createNotification("Scanning library..."))
                    scanLibrary(libraryId, scanPath)
                }
            }
        }
        return START_NOT_STICKY
    }

    private fun scanAllMedia() {
        scanJob?.cancel()
        scanJob = serviceScope.launch {
            try {
                updateNotification("Scanning device for media files...")

                // Scan using MediaStore for each media type
                scanBooksWithMediaStore()
                scanAudioWithMediaStore()
                scanVideoWithMediaStore()
                scanImagesWithMediaStore()

                // Also scan standard directories
                scanStandardDirectories()

                updateNotification("Media scan complete!")
                delay(2000)
                stopSelf()
            } catch (e: Exception) {
                e.printStackTrace()
                updateNotification("Scan failed: ${e.message}")
                delay(2000)
                stopSelf()
            }
        }
    }

    private suspend fun scanBooksWithMediaStore() {
        withContext(Dispatchers.IO) {
            // For books, we need to scan Documents directory
            val documentsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS)
            val downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)

            scanDirectoryForBooks(documentsDir)
            scanDirectoryForBooks(downloadsDir)

            // Also scan using MediaStore for PDFs
            val projection = arrayOf(
                MediaStore.Files.FileColumns._ID,
                MediaStore.Files.FileColumns.DISPLAY_NAME,
                MediaStore.Files.FileColumns.DATA,
                MediaStore.Files.FileColumns.SIZE,
                MediaStore.Files.FileColumns.DATE_MODIFIED
            )

            val selection = buildString {
                append("(")
                BOOK_EXTENSIONS.forEachIndexed { index, ext ->
                    if (index > 0) append(" OR ")
                    append("${MediaStore.Files.FileColumns.DATA} LIKE '%.$ext'")
                }
                append(")")
            }

            val cursor = contentResolver.query(
                MediaStore.Files.getContentUri("external"),
                projection,
                selection,
                null,
                "${MediaStore.Files.FileColumns.DATE_MODIFIED} DESC"
            )

            cursor?.use {
                while (it.moveToNext()) {
                    val path = it.getString(it.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DATA))
                    val name = it.getString(it.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DISPLAY_NAME))
                    val size = it.getLong(it.getColumnIndexOrThrow(MediaStore.Files.FileColumns.SIZE))

                    processMediaFile(File(path), "BOOK")
                }
            }
        }
    }

    private suspend fun scanDirectoryForBooks(directory: File?) {
        directory?.listFiles()?.forEach { file ->
            when {
                file.isDirectory && !file.name.startsWith(".") -> {
                    scanDirectoryForBooks(file)
                }
                file.isFile -> {
                    val extension = file.extension.lowercase()
                    if (extension in BOOK_EXTENSIONS || extension in COMIC_EXTENSIONS) {
                        processMediaFile(file, if (extension in COMIC_EXTENSIONS) "COMIC" else "BOOK")
                    }
                }
            }
        }
    }

    private suspend fun scanAudioWithMediaStore() {
        withContext(Dispatchers.IO) {
            val projection = arrayOf(
                MediaStore.Audio.Media._ID,
                MediaStore.Audio.Media.DISPLAY_NAME,
                MediaStore.Audio.Media.DATA,
                MediaStore.Audio.Media.SIZE,
                MediaStore.Audio.Media.DATE_MODIFIED,
                MediaStore.Audio.Media.TITLE,
                MediaStore.Audio.Media.ARTIST,
                MediaStore.Audio.Media.ALBUM,
                MediaStore.Audio.Media.DURATION
            )

            val cursor = contentResolver.query(
                MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                projection,
                null,
                null,
                "${MediaStore.Audio.Media.DATE_MODIFIED} DESC"
            )

            cursor?.use {
                while (it.moveToNext()) {
                    val path = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA))
                    val title = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE))
                    val artist = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST))
                    val album = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM))
                    val duration = it.getLong(it.getColumnIndexOrThrow(MediaStore.Audio.Media.DURATION))

                    val file = File(path)
                    if (file.exists()) {
                        val mediaItem = processMediaFile(file, "MUSIC")

                        // Add music-specific metadata
                        mediaItem?.let { item ->
                            val metadata = MetadataMusicTrack(
                                itemId = item.itemId,
                                artist = artist,
                                album = album,
                                trackNumber = 0,

                                duration = duration,
                                bitrate = null,
                                sampleRate = null

                            )
                            metadataDao.insertMetadataMusicTrack(metadata)
                        }
                    }
                }
            }
        }
    }

    private suspend fun scanVideoWithMediaStore() {
        withContext(Dispatchers.IO) {
            val projection = arrayOf(
                MediaStore.Video.Media._ID,
                MediaStore.Video.Media.DISPLAY_NAME,
                MediaStore.Video.Media.DATA,
                MediaStore.Video.Media.SIZE,
                MediaStore.Video.Media.DATE_MODIFIED,
                MediaStore.Video.Media.DURATION,
                MediaStore.Video.Media.WIDTH,
                MediaStore.Video.Media.HEIGHT
            )

            val cursor = contentResolver.query(
                MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
                projection,
                null,
                null,
                "${MediaStore.Video.Media.DATE_MODIFIED} DESC"
            )

            cursor?.use {
                while (it.moveToNext()) {
                    val path = it.getString(it.getColumnIndexOrThrow(MediaStore.Video.Media.DATA))
                    val duration = it.getLong(it.getColumnIndexOrThrow(MediaStore.Video.Media.DURATION))
                    val width = it.getInt(it.getColumnIndexOrThrow(MediaStore.Video.Media.WIDTH))
                    val height = it.getInt(it.getColumnIndexOrThrow(MediaStore.Video.Media.HEIGHT))

                    val file = File(path)
                    if (file.exists()) {
                        val mediaItem = processMediaFile(file, "MOVIE")

                        // Add video-specific metadata
                        mediaItem?.let { item ->
                            val metadata = MetadataMovie(
                                itemId = item.itemId,

                                runtime = (duration / 1000 / 60).toInt(), // Convert to minutes
                                imdbId = null,
                                tmdbId = null,
                                resolution = "${width}x${height}",
                                videoCodec = null,
                                audioCodec = null

                            )
                            metadataDao.insertMetadataMovie(metadata)
                        }
                    }
                }
            }
        }
    }

    private suspend fun scanImagesWithMediaStore() {
        withContext(Dispatchers.IO) {
            val projection = arrayOf(
                MediaStore.Images.Media._ID,
                MediaStore.Images.Media.DISPLAY_NAME,
                MediaStore.Images.Media.DATA,
                MediaStore.Images.Media.SIZE,
                MediaStore.Images.Media.DATE_MODIFIED,
                MediaStore.Images.Media.WIDTH,
                MediaStore.Images.Media.HEIGHT
            )

            val cursor = contentResolver.query(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                projection,
                null,
                null,
                "${MediaStore.Images.Media.DATE_MODIFIED} DESC"
            )

            cursor?.use {
                var count = 0
                while (it.moveToNext() && count < 1000) { // Limit to 1000 images
                    val path = it.getString(it.getColumnIndexOrThrow(MediaStore.Images.Media.DATA))
                    val file = File(path)
                    if (file.exists() && file.length() > 100000) { // Only process images > 100KB
                        processMediaFile(file, "DOCUMENT")
                        count++
                    }
                }
            }
        }
    }

    private suspend fun scanStandardDirectories() {
        // Scan common directories for media files
        val directories = mutableListOf(
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PODCASTS),
            File(Environment.getExternalStorageDirectory(), "Books"),
            File(Environment.getExternalStorageDirectory(), "Calibre"),
            File(Environment.getExternalStorageDirectory(), "Comics")
        )
        
        // Add DIRECTORY_AUDIOBOOKS only on API 29+
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            directories.add(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_AUDIOBOOKS))
        }

        directories.forEach { dir ->
            if (dir.exists() && dir.isDirectory) {
                scanDirectory(dir)
            }
        }
    }

    private suspend fun scanDirectory(directory: File) {
        directory.listFiles()?.forEach { file ->
            when {
                file.isDirectory && !file.name.startsWith(".") -> {
                    scanDirectory(file)
                }
                file.isFile -> {
                    val mediaType = determineMediaType(file)
                    if (mediaType != null) {
                        processMediaFile(file, mediaType)
                    }
                }
            }
        }
    }

    private fun determineMediaType(file: File): String? {
        val extension = file.extension.lowercase()
        return when {
            extension in BOOK_EXTENSIONS -> "BOOK"
            extension in AUDIO_EXTENSIONS -> "MUSIC"
            extension in VIDEO_EXTENSIONS -> "MOVIE"
            extension in COMIC_EXTENSIONS -> "COMIC"
            extension in IMAGE_EXTENSIONS && file.length() > 100000 -> "DOCUMENT"
            else -> null
        }
    }

    private suspend fun processMediaFile(file: File, mediaType: String): MediaItem? {
        return withContext(Dispatchers.IO) {
            try {
                // Check if file already exists in database
                val existingItem = mediaItemDao.getItemByPath(file.absolutePath)
                if (existingItem != null) {
                    return@withContext existingItem
                }

                // Get or create library for this media type
                var library = libraryDao.getLibrariesByType(mediaType).firstOrNull()
                if (library == null) {
                    library = Library(

                        name = "${mediaType.lowercase().replaceFirstChar { it.uppercase() }} Library",
                        type = mediaType,

                        path = file.parent ?: "",
                        dateModified = System.currentTimeMillis()
                    )
                    val libraryId = libraryDao.insertLibrary(library)
                    library = library.copy(libraryId = libraryId)
                }

                // Create media item
                val mediaItem = MediaItem(
                    libraryId = library.libraryId,
                    filePath = file.absolutePath,
                    fileName = file.name,
                    fileExtension = file.extension.lowercase(),
                    fileSize = file.length(),
                    fileHash = null,
                    dateAdded = System.currentTimeMillis(),
                    lastScanned = System.currentTimeMillis(),
                    lastModified = file.lastModified(),
                    mediaType = mediaType,
                    mimeType = null,
                    isAvailable = true,
                    hasMetadata = false,
                    hasThumbnail = false,
                    thumbnailPath = null
                )

                val itemId = mediaItemDao.insertMediaItem(mediaItem)
                val newItem = mediaItem.copy(itemId = itemId)

                // Create basic metadata
                val metadata = MetadataCommon(
                    itemId = itemId,
                    title = file.nameWithoutExtension,
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
                    metadataSource = null,
                    externalId = null
                )
                metadataDao.insertMetadataCommon(metadata)

                updateNotification("Found: ${file.name}")
                newItem
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    private fun scanLibrary(libraryId: Long, scanPath: String?) {
        scanJob?.cancel()
        scanJob = serviceScope.launch {
            try {
                val library = libraryDao.getLibraryById(libraryId)
                if (library != null) {
                    val path = scanPath ?: library.path
                    val directory = File(path)
                    if (directory.exists() && directory.isDirectory) {
                        updateNotification("Scanning ${library.name}...")
                        scanDirectory(directory)
                        updateNotification("Library scan complete!")
                    }
                }
                delay(2000)
                stopSelf()
            } catch (e: Exception) {
                e.printStackTrace()
                updateNotification("Scan failed: ${e.message}")
                delay(2000)
                stopSelf()
            }
        }
    }

    private fun createNotificationChannel() {
        val channel = NotificationChannel(
            CHANNEL_ID,
            "Media Scanner",
            NotificationManager.IMPORTANCE_LOW
        ).apply {
            description = "Media scanning progress"
        }
        val notificationManager = getSystemService(NotificationManager::class.java)
        notificationManager.createNotificationChannel(channel)
    }

    private fun createNotification(contentText: String) = NotificationCompat.Builder(this, CHANNEL_ID)
        .setContentTitle("Media Scanner")
        .setContentText(contentText)
        .setSmallIcon(android.R.drawable.stat_sys_download)
        .setOngoing(true)
        .build()

    private fun updateNotification(text: String) {
        val notification = createNotification(text)
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(NOTIFICATION_ID, notification)
    }

    override fun onDestroy() {
        super.onDestroy()
        scanJob?.cancel()
        serviceScope.cancel()
    }
}
