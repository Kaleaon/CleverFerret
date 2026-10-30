package com.universalmedialibrary.services

import android.net.Uri
import android.provider.MediaStore
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMovie
import com.universalmedialibrary.utils.ErrorLogger
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.withContext

internal suspend fun MediaScannerService.scanBooksWithMediaStore() {
    withContext(Dispatchers.IO) {
        val projection = arrayOf(
            MediaStore.Files.FileColumns._ID,
            MediaStore.Files.FileColumns.DISPLAY_NAME,
            MediaStore.Files.FileColumns.SIZE,
            MediaStore.Files.FileColumns.DATE_MODIFIED,
            MediaStore.Files.FileColumns.MIME_TYPE
        )

        val selection = buildString {
            append("(")
            MediaScannerService.BOOK_EXTENSIONS.forEachIndexed { index, ext ->
                if (index > 0) append(" OR ")
                append("${MediaStore.Files.FileColumns.DISPLAY_NAME} LIKE '%.${ext}'")
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
                val name = it.getString(it.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DISPLAY_NAME))
                val size = it.getLong(it.getColumnIndexOrThrow(MediaStore.Files.FileColumns.SIZE))
                val id = it.getLong(it.getColumnIndexOrThrow(MediaStore.Files.FileColumns._ID))
                val mimeType = it.getString(it.getColumnIndexOrThrow(MediaStore.Files.FileColumns.MIME_TYPE))
                val itemUri = Uri.withAppendedPath(MediaStore.Files.getContentUri("external"), id.toString())
                val mediaType = if (name.substringAfterLast('.', "").lowercase() in MediaScannerService.COMIC_EXTENSIONS) "COMIC" else "BOOK"
                processMediaStoreItem(itemUri, name, size, mediaType, mimeType)
            }
        }
    }
}

internal suspend fun MediaScannerService.scanAudioWithMediaStore() {
    withContext(Dispatchers.IO) {
        val projection = arrayOf(
            MediaStore.Audio.Media._ID,
            MediaStore.Audio.Media.DISPLAY_NAME,
            MediaStore.Audio.Media.SIZE,
            MediaStore.Audio.Media.DATE_MODIFIED,
            MediaStore.Audio.Media.MIME_TYPE,
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
                val id = it.getLong(it.getColumnIndexOrThrow(MediaStore.Audio.Media._ID))
                val name = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.DISPLAY_NAME))
                val size = it.getLong(it.getColumnIndexOrThrow(MediaStore.Audio.Media.SIZE))
                val duration = it.getLong(it.getColumnIndexOrThrow(MediaStore.Audio.Media.DURATION))
                val mimeType = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.MIME_TYPE))
                val itemUri = Uri.withAppendedPath(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, id.toString())

                if (size < 256 * 1024L || duration < 30_000L) {
                    continue
                }
                processMediaStoreItem(itemUri, name, size, "MUSIC", mimeType)
            }
        }
    }
}

internal suspend fun MediaScannerService.scanVideoWithMediaStore() {
    withContext(Dispatchers.IO) {
        val projection = arrayOf(
            MediaStore.Video.Media._ID,
            MediaStore.Video.Media.DISPLAY_NAME,
            MediaStore.Video.Media.SIZE,
            MediaStore.Video.Media.DATE_MODIFIED,
            MediaStore.Video.Media.MIME_TYPE,
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
                val id = it.getLong(it.getColumnIndexOrThrow(MediaStore.Video.Media._ID))
                val name = it.getString(it.getColumnIndexOrThrow(MediaStore.Video.Media.DISPLAY_NAME))
                val size = it.getLong(it.getColumnIndexOrThrow(MediaStore.Video.Media.SIZE))
                val duration = it.getLong(it.getColumnIndexOrThrow(MediaStore.Video.Media.DURATION))
                val width = it.getInt(it.getColumnIndexOrThrow(MediaStore.Video.Media.WIDTH))
                val height = it.getInt(it.getColumnIndexOrThrow(MediaStore.Video.Media.HEIGHT))
                val mimeType = it.getString(it.getColumnIndexOrThrow(MediaStore.Video.Media.MIME_TYPE))
                val itemUri = Uri.withAppendedPath(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, id.toString())

                val mediaItem = processMediaStoreItem(itemUri, name, size, "MOVIE", mimeType)

                mediaItem?.let { item ->
                    val metadata = MetadataMovie(
                        itemId = item.itemId,
                        runtime = (duration / 1000 / 60).toInt(),
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

internal suspend fun MediaScannerService.scanImagesWithMediaStore() {
    withContext(Dispatchers.IO) {
        val projection = arrayOf(
            MediaStore.Images.Media._ID,
            MediaStore.Images.Media.DISPLAY_NAME,
            MediaStore.Images.Media.SIZE,
            MediaStore.Images.Media.DATE_MODIFIED,
            MediaStore.Images.Media.MIME_TYPE,
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
            while (it.moveToNext() && count < 1000) {
                val id = it.getLong(it.getColumnIndexOrThrow(MediaStore.Images.Media._ID))
                val name = it.getString(it.getColumnIndexOrThrow(MediaStore.Images.Media.DISPLAY_NAME))
                val size = it.getLong(it.getColumnIndexOrThrow(MediaStore.Images.Media.SIZE))
                val mimeType = it.getString(it.getColumnIndexOrThrow(MediaStore.Images.Media.MIME_TYPE))
                val itemUri = Uri.withAppendedPath(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, id.toString())
                if (size > 100000) {
                    processMediaStoreItem(itemUri, name, size, "DOCUMENT", mimeType)
                    count++
                }
            }
        }
    }
}

internal suspend fun MediaScannerService.processMediaStoreItem(
    itemUri: Uri,
    displayName: String,
    size: Long,
    mediaType: String,
    mimeType: String?
): MediaItem? = withContext(Dispatchers.IO) {
    try {
        val pathKey = itemUri.toString()
        mediaItemDao.getItemByPath(pathKey)?.let { return@withContext it }

        var library = libraryDao.getLibrariesByType(mediaType).firstOrNull()
        if (library == null) {
            library = Library(
                name = "${mediaType.lowercase().replaceFirstChar { it.uppercase() }} Library",
                type = mediaType,
                path = "mediastore://external",
                dateModified = System.currentTimeMillis()
            )
            val libraryId = libraryDao.insertLibrary(library)
            library = library.copy(libraryId = libraryId)
        }

        val extension = displayName.substringAfterLast('.', "").lowercase()
        val item = MediaItem(
            libraryId = library.libraryId,
            filePath = pathKey,
            fileName = displayName,
            fileExtension = extension,
            fileSize = size,
            fileHash = null,
            dateAdded = System.currentTimeMillis(),
            lastScanned = System.currentTimeMillis(),
            lastModified = System.currentTimeMillis(),
            mediaType = mediaType,
            mimeType = mimeType,
            isAvailable = true,
            hasMetadata = false,
            hasThumbnail = false,
            thumbnailPath = null
        )
        val newId = mediaItemDao.insertMediaItem(item)
        val inserted = item.copy(itemId = newId)

        MediaScannerService._scanProgress.update { curr ->
            val scanned = curr.scannedCount + 1
            val total = curr.totalEstimatedCount
            val percentage = if (curr.isIndeterminate || total <= 0) null else (scanned.toFloat() / total * 100f).coerceAtMost(100f)
            curr.copy(
                statusText = "Found: $displayName",
                itemsFound = curr.itemsFound + 1,
                scannedCount = scanned,
                progressPercentage = percentage,
                currentFileName = displayName,
                latestDiscoveredItem = inserted
            )
        }

        metadataStagingRepository.stageMetadataCommon(
            itemId = newId,
            metadata = MetadataCommon(
                itemId = newId,
                title = displayName.substringBeforeLast('.'),
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
                metadataSource = "MediaStore",
                externalId = null
            ),
            source = "MediaStore"
        )
        inserted
    } catch (e: Exception) {
        ErrorLogger.logMediaScanError("Error processing MediaStore URI", e)
        null
    }
}
