package com.universalmedialibrary.services

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.database.Cursor
import android.graphics.Bitmap
import android.graphics.Bitmap.CompressFormat
import android.graphics.BitmapFactory
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.IBinder
import android.provider.MediaStore
import android.provider.OpenableColumns
import androidx.core.app.NotificationCompat
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.LibraryScanSettingsDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.services.audio.WaveformGenerator
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.*
import java.io.File
import java.io.FileOutputStream
import java.security.MessageDigest
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt
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
    @Inject lateinit var libraryScanSettingsDao: LibraryScanSettingsDao
    @Inject lateinit var mediaItemDao: MediaItemDao
    @Inject lateinit var metadataDao: MetadataDao
    @Inject lateinit var waveformGenerator: WaveformGenerator

    private val serviceScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private val scanSettingsCache = mutableMapOf<Long, ResolvedScanSettings>()
    private var scanJob: Job? = null

    companion object {
        const val ACTION_SCAN_ALL = "com.universalmedialibrary.ACTION_SCAN_ALL"
        const val ACTION_SCAN_LIBRARY = "com.universalmedialibrary.ACTION_SCAN_LIBRARY"
        const val EXTRA_LIBRARY_ID = "library_id"
        const val EXTRA_SCAN_PATH = "scan_path"

        private const val CHANNEL_ID = "media_scanner_channel"
        private const val NOTIFICATION_ID = 2
        private const val MIN_AUDIO_DURATION_MS = 30_000L
        private const val MIN_AUDIO_FILE_SIZE_BYTES = 256 * 1024L

        // Supported file extensions
        val BOOK_EXTENSIONS = setOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt", "rtf", "doc", "docx")
        val AUDIO_EXTENSIONS = setOf("mp3", "m4a", "m4b", "aac", "ogg", "opus", "flac", "wav", "wma")
        val VIDEO_EXTENSIONS = setOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm", "m4v", "mpg", "mpeg")
        val IMAGE_EXTENSIONS = setOf("jpg", "jpeg", "png", "gif", "bmp", "webp", "svg", "tiff")
        val COMIC_EXTENSIONS = setOf("cbz", "cbr", "cb7", "cbt")
    }

    private data class ResolvedScanSettings(
        val config: LibraryScanSettings,
        val includeMatchers: List<String>,
        val excludeMatchers: List<String>
    )

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
                ErrorLogger.logMediaScanError("Media scan failed", e)
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
                    val duration = it.getLong(it.getColumnIndexOrThrow(MediaStore.Audio.Media.DURATION))

                    val file = File(path)
                    if (file.exists()) {
                        if (file.length() < MIN_AUDIO_FILE_SIZE_BYTES || duration < MIN_AUDIO_DURATION_MS) {
                            continue
                        }
                        processMediaFile(file, "MUSIC")
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

    private suspend fun scanDirectory(
        directory: File,
        resolvedSettings: ResolvedScanSettings? = null,
        forcedLibrary: Library? = null
    ) {
        directory.listFiles()?.forEach { file ->
            when {
                file.isDirectory && !file.name.startsWith(".") -> {
                    if (resolvedSettings != null && resolvedSettings.shouldSkipDirectory(file)) {
                        return@forEach
                    }
                    scanDirectory(file, resolvedSettings, forcedLibrary)
                }
                file.isFile -> {
                    val mediaType = determineMediaType(file)
                    if (mediaType != null) {
                        if (resolvedSettings != null && !resolvedSettings.allowsFile(file)) {
                            return@forEach
                        }
                        val minAudioDuration = resolvedSettings?.config?.minAudioDurationMs ?: MIN_AUDIO_DURATION_MS
                        val minFileSizeBytes = resolvedSettings?.config?.minFileSizeBytes ?: MIN_AUDIO_FILE_SIZE_BYTES
                        if (mediaType == "MUSIC" && shouldSkipAudioFile(file, minAudioDuration, minFileSizeBytes)) {
                            return@forEach
                        }
                        processMediaFile(file, mediaType, forcedLibrary, resolvedSettings)
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

    private suspend fun processMediaFile(
        file: File,
        mediaType: String,
        forcedLibrary: Library? = null,
        resolvedSettings: ResolvedScanSettings? = null
    ): MediaItem? {
        return withContext(Dispatchers.IO) {
            try {
                // Check if file already exists in database
                val existingItem = mediaItemDao.getItemByPath(file.absolutePath)
                if (existingItem != null) {
                    if (mediaType == "MUSIC" && (existingItem.thumbnailPath.isNullOrEmpty())) {
                        val coverPath = extractAndStoreAlbumArt(file)
                        if (coverPath != null) {
                            val updatedItem = existingItem.copy(
                                hasThumbnail = true,
                                thumbnailPath = coverPath
                            )
                            mediaItemDao.updateMediaItem(updatedItem)
                            val existingMetadata = metadataDao.getMetadataCommonByItemId(existingItem.itemId)
                            if (existingMetadata != null && existingMetadata.coverImagePath.isNullOrEmpty()) {
                                metadataDao.insertMetadataCommon(existingMetadata.copy(coverImagePath = coverPath))
                            }
                            return@withContext updatedItem
                        }
                    }
                    return@withContext existingItem
                }

                // Get or create library for this media type
                var library = forcedLibrary ?: libraryDao.getLibrariesByType(mediaType).firstOrNull()
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

                val effectiveSettings = resolvedSettings ?: getCachedScanSettings(library)
                if (mediaType == "MUSIC") {
                    val minDuration = effectiveSettings.config.minAudioDurationMs
                    val minSize = effectiveSettings.config.minFileSizeBytes
                    if (shouldSkipAudioFile(file, minDuration, minSize)) {
                        return@withContext null
                    }
                }

                val preventDuplicates = effectiveSettings.config.preventDuplicates
                val strategy = effectiveSettings.config.deduplicationStrategy.uppercase()
                var fileHash: String? = null
                if (preventDuplicates) {
                    when (strategy) {
                        "FILENAME_SIZE" -> {
                            val duplicate = mediaItemDao.findDuplicateByNameAndSize(
                                library.libraryId,
                                file.name,
                                file.length()
                            )
                            if (duplicate != null) {
                                return@withContext null
                            }
                        }
                        "HASH" -> {
                            fileHash = computeFileHash(file)
                            if (!fileHash.isNullOrEmpty()) {
                                val duplicate = mediaItemDao.findDuplicateByHash(
                                    library.libraryId,
                                    fileHash!!
                                )
                                if (duplicate != null) {
                                    return@withContext null
                                }
                            }
                        }
                    }
                }

                val musicInfo = if (mediaType == "MUSIC") extractMusicTrackInfo(file) else null
                val coverPath = if (mediaType == "MUSIC") extractAndStoreAlbumArt(file) else null

                // Create media item
                val mediaItem = MediaItem(
                    libraryId = library.libraryId,
                    filePath = file.absolutePath,
                    fileName = file.name,
                    fileExtension = file.extension.lowercase(),
                    fileSize = file.length(),
                    fileHash = fileHash,
                    dateAdded = System.currentTimeMillis(),
                    lastScanned = System.currentTimeMillis(),
                    lastModified = file.lastModified(),
                    mediaType = mediaType,
                    mimeType = null,
                    isAvailable = true,
                    hasMetadata = false,
                    hasThumbnail = coverPath != null,
                    thumbnailPath = coverPath
                )

                val itemId = mediaItemDao.insertMediaItem(mediaItem)
                val newItem = mediaItem.copy(itemId = itemId)

                // Create basic metadata
                  val resolvedTitle = musicInfo?.title?.takeIf { it.isNotBlank() } ?: file.nameWithoutExtension
                  val metadata = MetadataCommon(
                      itemId = itemId,
                      title = resolvedTitle,
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
                    coverImagePath = coverPath,
                    backdropImagePath = null,
                    language = null,
                    country = null,
                    lastUpdated = System.currentTimeMillis(),
                    metadataSource = null,
                    externalId = null
                )
                  metadataDao.insertMetadataCommon(metadata)
                  if (musicInfo != null) {
                      persistMusicTrackMetadata(newItem, musicInfo)
                  }

                updateNotification("Found: ${file.name}")
                newItem
            } catch (e: Exception) {
                ErrorLogger.logMediaScanError("Error processing media file", e)
                null
            }
        }
    }

    private fun shouldSkipAudioFile(
        file: File,
        minDurationMs: Long = MIN_AUDIO_DURATION_MS,
        minSizeBytes: Long = MIN_AUDIO_FILE_SIZE_BYTES
    ): Boolean {
        if (minSizeBytes > 0 && file.length() < minSizeBytes) return true
        if (minDurationMs <= 0) return false
        val durationMs = extractAudioDuration(file) ?: return false
        return durationMs < minDurationMs
    }

    private fun extractAudioDuration(file: File): Long? {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(file.absolutePath)
            retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
        } catch (_: Exception) {
            null
        } finally {
            try {
                retriever.release()
            } catch (_: Exception) { }
        }
    }

    private suspend fun persistMusicTrackMetadata(
        mediaItem: MediaItem,
        info: MusicTrackInfo
    ) {
        val waveform = runCatching {
            waveformGenerator.generate(File(mediaItem.filePath), info.durationMs)
        }.getOrNull()

        val metadata = MetadataMusicTrack(
            itemId = mediaItem.itemId,
            album = info.album,
            albumArtist = info.albumArtist,
            artist = info.artist,
            composer = info.composer,
            trackNumber = info.trackNumber,
            totalTracks = info.totalTracks,
            discNumber = info.discNumber,
            totalDiscs = info.totalDiscs,
            duration = info.durationMs,
            bitrate = info.bitrate,
            sampleRate = info.sampleRate,
            channels = info.channels,
            waveformData = waveform?.samples,
            waveformSampleCount = waveform?.sampleCount ?: 0,
            waveformFrameDurationMs = waveform?.frameDurationMs ?: 20,
            waveformOffsetMs = 0,
            waveformGeneratedAt = waveform?.generatedAt,
            waveformVersion = waveform?.version ?: 1
        )

        metadataDao.insertMetadataMusicTrack(metadata)
    }

    private fun extractMusicTrackInfo(file: File): MusicTrackInfo {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(file.absolutePath)
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
            val albumArtist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
            val composer = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_COMPOSER)
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull()
            val sampleRate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_SAMPLERATE)?.toIntOrNull()
            val trackPair = parseNumberPair(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER))
            val discPair = parseNumberPair(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER))
            val totalTracks = trackPair.second
                ?: retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_NUM_TRACKS)?.toIntOrNull()

            MusicTrackInfo(
                title = title ?: file.nameWithoutExtension,
                artist = artist,
                album = album,
                albumArtist = albumArtist,
                composer = composer,
                trackNumber = trackPair.first,
                totalTracks = totalTracks,
                discNumber = discPair.first,
                totalDiscs = discPair.second,
                durationMs = duration,
                bitrate = bitrate,
                sampleRate = sampleRate,
                channels = null
            )
        } catch (_: Exception) {
            MusicTrackInfo(title = file.nameWithoutExtension)
        } finally {
            try {
                retriever.release()
            } catch (_: Exception) { }
        }
    }

    private fun parseNumberPair(raw: String?): Pair<Int?, Int?> {
        if (raw.isNullOrBlank()) return null to null
        val parts = raw.split("/")
        val first = parts.getOrNull(0)?.toIntOrNull()
        val second = parts.getOrNull(1)?.toIntOrNull()
        return first to second
    }

    private data class MusicTrackInfo(
        val title: String? = null,
        val artist: String? = null,
        val album: String? = null,
        val albumArtist: String? = null,
        val composer: String? = null,
        val trackNumber: Int? = null,
        val totalTracks: Int? = null,
        val discNumber: Int? = null,
        val totalDiscs: Int? = null,
        val durationMs: Long? = null,
        val bitrate: Int? = null,
        val sampleRate: Int? = null,
        val channels: Int? = null
    )

    private fun extractAndStoreAlbumArt(file: File): String? {
        val key = "${file.absolutePath}_${file.lastModified()}"
        val coverDir = File(filesDir, "album_art").apply { if (!exists()) mkdirs() }
        val coverFile = File(coverDir, "${hashString(key)}.jpg")
        if (coverFile.exists()) {
            return coverFile.absolutePath
        }
        val bytes = extractEmbeddedAlbumArtBytes(file.absolutePath) ?: return null
        val bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.size) ?: return null
        val normalized = scaleBitmap(bitmap, 1024)
        return try {
            FileOutputStream(coverFile).use { out ->
                normalized.compress(CompressFormat.JPEG, 90, out)
            }
            coverFile.absolutePath
        } catch (_: Exception) {
            null
        } finally {
            if (!normalized.isRecycled) {
                normalized.recycle()
            }
            if (normalized !== bitmap && !bitmap.isRecycled) {
                bitmap.recycle()
            }
        }
    }

    private fun extractEmbeddedAlbumArtBytes(filePath: String): ByteArray? {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(filePath)
            retriever.embeddedPicture
        } catch (_: Exception) {
            null
        } finally {
            try {
                retriever.release()
            } catch (_: Exception) { }
        }
    }

    private fun scaleBitmap(bitmap: Bitmap, maxDimension: Int): Bitmap {
        val largestSide = max(bitmap.width, bitmap.height)
        if (largestSide <= maxDimension) return bitmap
        val scale = maxDimension.toFloat() / largestSide.toFloat()
        val width = (bitmap.width * scale).roundToInt().coerceAtLeast(1)
        val height = (bitmap.height * scale).roundToInt().coerceAtLeast(1)
        return Bitmap.createScaledBitmap(bitmap, width, height, true)
    }

    private fun hashString(input: String): String {
        val digest = MessageDigest.getInstance("SHA-1")
        val bytes = digest.digest(input.toByteArray())
        return bytes.joinToString("") { "%02x".format(it) }
    }

    private fun computeFileHash(file: File): String? {
        return try {
            val digest = MessageDigest.getInstance("SHA-1")
            file.inputStream().use { stream ->
                val buffer = ByteArray(DEFAULT_BUFFER_SIZE)
                var bytesRead = stream.read(buffer)
                while (bytesRead > 0) {
                    digest.update(buffer, 0, bytesRead)
                    bytesRead = stream.read(buffer)
                }
            }
            digest.digest().joinToString("") { "%02x".format(it) }
        } catch (_: Exception) {
            null
        }
    }

    private suspend fun getCachedScanSettings(library: Library): ResolvedScanSettings {
        synchronized(scanSettingsCache) {
            scanSettingsCache[library.libraryId]?.let { return it }
        }
        val resolved = resolveScanSettings(library)
        synchronized(scanSettingsCache) {
            scanSettingsCache[library.libraryId] = resolved
        }
        return resolved
    }

    private suspend fun resolveScanSettings(library: Library): ResolvedScanSettings {
        val settings = libraryScanSettingsDao.getSettings(library.libraryId)
            ?: LibraryScanSettings.defaults(library.libraryId, library.path).also {
                libraryScanSettingsDao.upsert(it)
            }
        return settings.toResolved()
    }

    private fun LibraryScanSettings.toResolved(): ResolvedScanSettings {
        val includes = includePaths.mapNotNull { it.normalizeMatcher() }.distinct()
        val excludes = excludePaths.mapNotNull { it.normalizeMatcher() }.distinct()
        return ResolvedScanSettings(this, includes, excludes)
    }

    private fun ResolvedScanSettings.shouldSkipDirectory(directory: File): Boolean {
        val normalized = directory.normalizedPath()
        return excludeMatchers.any { normalized.startsWith(it) }
    }

    private fun ResolvedScanSettings.allowsFile(file: File): Boolean {
        val normalizedPath = file.normalizedPath()
        val includeOk = if (includeMatchers.isEmpty()) {
            true
        } else if (config.includeSubdirectories) {
            includeMatchers.any { normalizedPath.startsWith(it) }
        } else {
            val parent = file.parent?.normalizeMatcher() ?: ""
            includeMatchers.any { parent == it || normalizedPath == it }
        }
        if (!includeOk) return false
        if (excludeMatchers.any { normalizedPath.startsWith(it) }) return false
        if (config.minFileSizeBytes > 0 && file.length() < config.minFileSizeBytes) return false
        return true
    }

    private fun String.normalizeMatcher(): String? {
        if (isBlank()) return null
        return try {
            val raw = if (startsWith("content://")) {
                trim()
            } else {
                File(this).canonicalPath
            }
            raw.replace("\\", "/").trim().lowercase()
        } catch (_: Exception) {
            trim().replace("\\", "/").lowercase()
        }
    }

    private fun File.normalizedPath(): String =
        absolutePath.normalizeMatcher() ?: absolutePath.lowercase()

    private fun scanLibrary(libraryId: Long, scanPath: String?) {
        scanJob?.cancel()
        scanJob = serviceScope.launch {
            try {
                val library = libraryDao.getLibraryById(libraryId)
                if (library != null) {
                    val path = scanPath ?: library.path
                    val directory = File(path)
                    if (directory.exists() && directory.isDirectory) {
                        val resolvedSettings = getCachedScanSettings(library)
                        updateNotification("Scanning ${library.name}...")
                        scanDirectory(directory, resolvedSettings, library)
                        updateNotification("Library scan complete!")
                    }
                }
                delay(2000)
                stopSelf()
            } catch (e: Exception) {
                ErrorLogger.logMediaScanError("Library scan failed", e)
                updateNotification("Scan failed: ${e.message}")
                delay(2000)
                stopSelf()
            }
        }
    }

    private fun createNotificationChannel() {
        // minSdk is 26 (Android 8.0+), so notification channels are always available
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
