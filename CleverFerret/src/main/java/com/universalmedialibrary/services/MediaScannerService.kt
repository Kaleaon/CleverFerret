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
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.*
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.*
import java.io.File
import javax.inject.Inject

/**
 * A foreground service that scans the device for media files in the background.
 * It can perform a full device scan or scan a specific library path.
 * The service uses MediaStore for efficient discovery and also scans standard directories.
 *
 * @property libraryDao DAO for library data.
 * @property mediaItemDao DAO for media item data.
 * @property metadataDao DAO for metadata.
 */
@AndroidEntryPoint
class MediaScannerService : Service() {

    @Inject lateinit var libraryDao: LibraryDao
    @Inject lateinit var mediaItemDao: MediaItemDao
    @Inject lateinit var metadataDao: MetadataDao

    private val serviceScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private var scanJob: Job? = null

    companion object {
        /** Starts a scan of all known media locations on the device. */
        const val ACTION_SCAN_ALL = "com.universalmedialibrary.ACTION_SCAN_ALL"
        /** Starts a scan of a specific library. Requires [EXTRA_LIBRARY_ID]. */
        const val ACTION_SCAN_LIBRARY = "com.universalmedialibrary.ACTION_SCAN_LIBRARY"
        /** The ID of the library to scan. Used with [ACTION_SCAN_LIBRARY]. */
        const val EXTRA_LIBRARY_ID = "library_id"
        /** An optional path to override the library's default scan path. */
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

    /**
     * Initiates a full media scan of the device, including MediaStore and standard directories.
     */
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

    /**
     * Scans for book files using both direct directory scanning and the MediaStore.
     */
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
                    processMediaFile(File(path), MediaType.BOOK)
                }
            }
        }
    }

    /**
     * Recursively scans a directory for book and comic files.
     * @param directory The directory to scan.
     */
    private suspend fun scanDirectoryForBooks(directory: File?) {
        directory?.listFiles()?.forEach { file ->
            when {
                file.isDirectory && !file.name.startsWith(".") -> {
                    scanDirectoryForBooks(file)
                }
                file.isFile -> {
                    val extension = file.extension.lowercase()
                    if (extension in BOOK_EXTENSIONS || extension in COMIC_EXTENSIONS) {
                        processMediaFile(file, if (extension in COMIC_EXTENSIONS) MediaType.COMIC else MediaType.BOOK)
                    }
                }
            }
        }
    }

    /**
     * Scans for audio files using the MediaStore and extracts basic metadata.
     */
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
                        val mediaItem = processMediaFile(file, MediaType.MUSIC)

                        // Add music-specific metadata
                        mediaItem?.let { item ->
                            val metadata = MetadataMusicTrack(
                                itemId = item.itemId,
                                artist = artist,
                                albumTitle = album,
                                trackNumber = 0,
                                duration = duration.toInt(),
                                genre = null,
                                releaseYear = null,
                                bitrate = null,
                                sampleRate = null
                            )
                            metadataDao.insertMusicTrackMetadata(metadata)
                        }
                    }
                }
            }
        }
    }

    /**
     * Scans for video files using the MediaStore and extracts basic metadata.
     */
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
                        val mediaItem = processMediaFile(file, MediaType.MOVIE)

                        // Add video-specific metadata
                        mediaItem?.let { item ->
                            val metadata = MetadataMovie(
                                itemId = item.itemId,
                                director = null,
                                cast = null,
                                runtime = (duration / 1000).toInt(), // Convert to seconds
                                imdbId = null,
                                tmdbId = null,
                                rating = null,
                                resolution = "${width}x${height}",
                                videoCodec = null,
                                audioCodec = null,
                                subtitles = null
                            )
                            metadataDao.insertMovieMetadata(metadata)
                        }
                    }
                }
            }
        }
    }

    /**
     * Scans for image files using the MediaStore. Treats large images as documents.
     */
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
                        processMediaFile(file, MediaType.DOCUMENT)
                        count++
                    }
                }
            }
        }
    }

    /**
     * Scans a predefined list of standard media directories on the device.
     */
    private suspend fun scanStandardDirectories() {
        // Scan common directories for media files
        val directories = listOf(
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PODCASTS),
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_AUDIOBOOKS),
            File(Environment.getExternalStorageDirectory(), "Books"),
            File(Environment.getExternalStorageDirectory(), "Calibre"),
            File(Environment.getExternalStorageDirectory(), "Comics")
        )

        directories.forEach { dir ->
            if (dir.exists() && dir.isDirectory) {
                scanDirectory(dir)
            }
        }
    }

    /**
     * Recursively scans a directory for media files.
     * @param directory The directory to scan.
     */
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

    /**
     * Determines the [MediaType] of a file based on its extension.
     * @param file The file to analyze.
     * @return The determined [MediaType], or null if the extension is not supported.
     */
    private fun determineMediaType(file: File): MediaType? {
        val extension = file.extension.lowercase()
        return when {
            extension in BOOK_EXTENSIONS -> MediaType.BOOK
            extension in AUDIO_EXTENSIONS -> MediaType.MUSIC
            extension in VIDEO_EXTENSIONS -> MediaType.MOVIE
            extension in COMIC_EXTENSIONS -> MediaType.COMIC
            extension in IMAGE_EXTENSIONS && file.length() > 100000 -> MediaType.DOCUMENT
            else -> null
        }
    }

    /**
     * Processes a discovered media file: adds it to the database if it doesn't already exist,
     * assigns it to a library, and creates basic metadata.
     *
     * @param file The media file to process.
     * @param mediaType The type of the media file.
     * @return The newly created or existing [MediaItem], or null on failure.
     */
    private suspend fun processMediaFile(file: File, mediaType: MediaType): MediaItem? {
        return withContext(Dispatchers.IO) {
            try {
                // Check if file already exists in database
                val existingItem = mediaItemDao.getItemByPath(file.absolutePath)
                if (existingItem != null) {
                    return@withContext existingItem
                }

                // Get or create library for this media type
                var library = libraryDao.getLibrariesByType(mediaType.name).firstOrNull()
                if (library == null) {
                    library = Library(
                        name = "${mediaType.name.lowercase().replaceFirstChar { it.uppercase() }} Library",
                        type = mediaType.name,
                        path = file.parent ?: "",
                        dateCreated = java.util.Date(),
                        dateModified = java.util.Date()
                    )
                    val libraryId = libraryDao.insertLibrary(library)
                    library = library.copy(libraryId = libraryId)
                }

                // Create media item
                val mediaItem = MediaItem(
                    libraryId = library.libraryId,
                    fileName = file.name,
                    filePath = file.absolutePath,
                    fileSize = file.length(),
                    mediaType = mediaType,
                    dateAdded = java.util.Date(),
                    lastModified = java.util.Date(file.lastModified()),
                    lastAccessed = null,
                    playCount = 0,
                    isLocal = true
                )

                val itemId = mediaItemDao.insertMediaItem(mediaItem)
                val newItem = mediaItem.copy(itemId = itemId)

                // Create basic metadata
                val metadata = MetadataCommon(
                    itemId = itemId,
                    title = file.nameWithoutExtension,
                    description = null,
                    tags = null,
                    userRating = null,
                    coverImagePath = null,
                    isFavorite = false,
                    isDownloaded = true
                )
                metadataDao.insertCommonMetadata(metadata)

                updateNotification("Found: ${file.name}")
                newItem
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    /**
     * Initiates a scan for a specific library.
     * @param libraryId The ID of the library to scan.
     * @param scanPath An optional path to override the library's default scan path.
     */
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

    /**
     * Creates the notification channel required for the foreground service on Android Oreo and higher.
     */
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
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
    }

    /**
     * Creates a notification for the foreground service.
     * @param contentText The text to display in the notification.
     * @return A [NotificationCompat.Builder] object for the notification.
     */
    private fun createNotification(contentText: String) = NotificationCompat.Builder(this, CHANNEL_ID)
        .setContentTitle("Media Scanner")
        .setContentText(contentText)
        .setSmallIcon(android.R.drawable.stat_sys_download)
        .setOngoing(true)
        .build()

    /**
     * Updates the persistent notification with new text.
     * @param text The new text to display.
     */
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