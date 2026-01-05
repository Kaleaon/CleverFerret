package com.universalmedialibrary.services.gallery

import android.content.ContentResolver
import android.content.ContentUris
import android.content.ContentValues
import android.content.Context
import android.database.Cursor
import android.media.ExifInterface
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Gallery Manager
 * 
 * Handles MediaStore queries for images and videos with caching and metadata extraction.
 * Inspired by GalleryON with Plex-like enhancements for advanced filtering and organization.
 */
@Singleton
class GalleryManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "GalleryManager"
        
        // MediaStore projections
        private val MEDIA_PROJECTION = arrayOf(
            MediaStore.Files.FileColumns._ID,
            MediaStore.Files.FileColumns.DISPLAY_NAME,
            MediaStore.Files.FileColumns.DATA,
            MediaStore.Files.FileColumns.SIZE,
            MediaStore.Files.FileColumns.MIME_TYPE,
            MediaStore.Files.FileColumns.MEDIA_TYPE,
            MediaStore.Files.FileColumns.DATE_ADDED,
            MediaStore.Files.FileColumns.DATE_MODIFIED,
            MediaStore.Files.FileColumns.WIDTH,
            MediaStore.Files.FileColumns.HEIGHT,
            MediaStore.Files.FileColumns.BUCKET_ID,
            MediaStore.Files.FileColumns.BUCKET_DISPLAY_NAME,
            MediaStore.Files.FileColumns.RELATIVE_PATH,
            MediaStore.Video.VideoColumns.DURATION,
            MediaStore.Images.ImageColumns.DATE_TAKEN
        )
        
        // Support for location (API 29+)
        private val LOCATION_PROJECTION = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            arrayOf(
                MediaStore.Images.ImageColumns.LATITUDE,
                MediaStore.Images.ImageColumns.LONGITUDE
            )
        } else {
            emptyArray()
        }
    }
    
    private val contentResolver: ContentResolver = context.contentResolver
    
    // Cached data
    private val _allItems = MutableStateFlow<List<GalleryItem>>(emptyList())
    val allItems: StateFlow<List<GalleryItem>> = _allItems.asStateFlow()
    
    private val _albums = MutableStateFlow<List<GalleryAlbum>>(emptyList())
    val albums: StateFlow<List<GalleryAlbum>> = _albums.asStateFlow()
    
    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()
    
    /**
     * Load all media items from MediaStore
     */
    suspend fun loadAllMedia(): List<GalleryItem> = withContext(Dispatchers.IO) {
        _isLoading.value = true
        
        try {
            Log.d(TAG, "Loading all media from MediaStore...")
            
            val items = mutableListOf<GalleryItem>()
            
            val projection = MEDIA_PROJECTION + LOCATION_PROJECTION
            
            val selection = "${MediaStore.Files.FileColumns.MEDIA_TYPE}=? OR ${MediaStore.Files.FileColumns.MEDIA_TYPE}=?"
            val selectionArgs = arrayOf(
                MediaStore.Files.FileColumns.MEDIA_TYPE_IMAGE.toString(),
                MediaStore.Files.FileColumns.MEDIA_TYPE_VIDEO.toString()
            )
            
            val sortOrder = "${MediaStore.Files.FileColumns.DATE_ADDED} DESC"
            
            val queryUri = MediaStore.Files.getContentUri("external")
            
            contentResolver.query(
                queryUri,
                projection,
                selection,
                selectionArgs,
                sortOrder
            )?.use { cursor ->
                val idColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns._ID)
                val nameColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DISPLAY_NAME)
                val dataColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DATA)
                val sizeColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.SIZE)
                val mimeTypeColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.MIME_TYPE)
                val mediaTypeColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.MEDIA_TYPE)
                val dateAddedColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DATE_ADDED)
                val dateModifiedColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.DATE_MODIFIED)
                val widthColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.WIDTH)
                val heightColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.HEIGHT)
                val bucketIdColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.BUCKET_ID)
                val bucketNameColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.BUCKET_DISPLAY_NAME)
                val relativePathColumn = cursor.getColumnIndexOrThrow(MediaStore.Files.FileColumns.RELATIVE_PATH)
                val durationColumn = cursor.getColumnIndexOrThrow(MediaStore.Video.VideoColumns.DURATION)
                val dateTakenColumn = cursor.getColumnIndexOrThrow(MediaStore.Images.ImageColumns.DATE_TAKEN)
                
                val latColumn = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    cursor.getColumnIndex(MediaStore.Images.ImageColumns.LATITUDE)
                } else -1
                val lonColumn = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    cursor.getColumnIndex(MediaStore.Images.ImageColumns.LONGITUDE)
                } else -1
                
                while (cursor.moveToNext()) {
                    val id = cursor.getLong(idColumn)
                    val name = cursor.getString(nameColumn) ?: "Unknown"
                    val filePath = cursor.getString(dataColumn) ?: ""
                    val size = cursor.getLongOrNull(sizeColumn) ?: 0L
                    val mimeType = cursor.getString(mimeTypeColumn) ?: ""
                    val mediaTypeValue = cursor.getInt(mediaTypeColumn)
                    val dateAdded = cursor.getLongOrNull(dateAddedColumn)?.times(1000) ?: 0L
                    val dateModified = cursor.getLongOrNull(dateModifiedColumn)?.times(1000) ?: 0L
                    val width = cursor.getIntOrNull(widthColumn) ?: 0
                    val height = cursor.getIntOrNull(heightColumn) ?: 0
                    val bucketId = cursor.getString(bucketIdColumn) ?: ""
                    val bucketName = cursor.getString(bucketNameColumn) ?: "Unknown"
                    val relativePath = cursor.getString(relativePathColumn) ?: ""
                    val duration = cursor.getLongOrNull(durationColumn)
                    val dateTaken = cursor.getLongOrNull(dateTakenColumn) ?: dateAdded
                    
                    val latitude = if (latColumn >= 0) cursor.getDoubleOrNull(latColumn) else null
                    val longitude = if (lonColumn >= 0) cursor.getDoubleOrNull(lonColumn) else null
                    
                    val mediaType = when (mediaTypeValue) {
                        MediaStore.Files.FileColumns.MEDIA_TYPE_IMAGE -> {
                            when {
                                mimeType.contains("gif") -> GalleryMediaType.GIF
                                mimeType.contains("heic") || mimeType.contains("heif") -> GalleryMediaType.HEIC
                                mimeType.contains("raw") || name.endsWith(".dng", true) || 
                                    name.endsWith(".cr2", true) || name.endsWith(".nef", true) -> GalleryMediaType.RAW
                                else -> GalleryMediaType.IMAGE
                            }
                        }
                        MediaStore.Files.FileColumns.MEDIA_TYPE_VIDEO -> GalleryMediaType.VIDEO
                        else -> continue
                    }
                    
                    val contentUri = ContentUris.withAppendedId(
                        if (mediaType == GalleryMediaType.VIDEO) {
                            MediaStore.Video.Media.EXTERNAL_CONTENT_URI
                        } else {
                            MediaStore.Images.Media.EXTERNAL_CONTENT_URI
                        },
                        id
                    )
                    
                    items.add(
                        GalleryItem(
                            id = id,
                            name = name,
                            uri = contentUri.toString(),
                            contentUri = contentUri.toString(),
                            filePath = filePath,
                            mediaType = mediaType,
                            mimeType = mimeType,
                            size = size,
                            width = width,
                            height = height,
                            dateTaken = dateTaken,
                            dateAdded = dateAdded,
                            dateModified = dateModified,
                            latitude = latitude?.takeIf { it != 0.0 },
                            longitude = longitude?.takeIf { it != 0.0 },
                            duration = duration,
                            bucketId = bucketId,
                            bucketName = bucketName,
                            relativePath = relativePath
                        )
                    )
                }
            }
            
            Log.d(TAG, "Loaded ${items.size} media items")
            _allItems.value = items
            
            // Build albums from items
            buildAlbumsFromItems(items)
            
            items
        } catch (e: Exception) {
            Log.e(TAG, "Error loading media: ${e.message}", e)
            emptyList()
        } finally {
            _isLoading.value = false
        }
    }
    
    /**
     * Build album list from loaded items
     */
    private fun buildAlbumsFromItems(items: List<GalleryItem>) {
        val albumMap = items.groupBy { it.bucketId }
        
        val albums = albumMap.map { (bucketId, albumItems) ->
            val sortedItems = albumItems.sortedByDescending { it.dateTaken }
            val imageCount = albumItems.count { it.mediaType != GalleryMediaType.VIDEO }
            val videoCount = albumItems.count { it.mediaType == GalleryMediaType.VIDEO }
            
            GalleryAlbum(
                id = bucketId,
                name = albumItems.firstOrNull()?.bucketName ?: "Unknown",
                path = albumItems.firstOrNull()?.relativePath ?: "",
                coverUri = sortedItems.firstOrNull()?.uri,
                itemCount = albumItems.size,
                imageCount = imageCount,
                videoCount = videoCount,
                totalSize = albumItems.sumOf { it.size },
                latestTimestamp = sortedItems.firstOrNull()?.dateTaken ?: 0,
                oldestTimestamp = sortedItems.lastOrNull()?.dateTaken ?: 0
            )
        }.sortedByDescending { it.latestTimestamp }
        
        _albums.value = albums
        Log.d(TAG, "Built ${albums.size} albums")
    }
    
    /**
     * Get items for a specific album
     */
    suspend fun getItemsForAlbum(
        albumId: String,
        sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC
    ): List<GalleryItem> = withContext(Dispatchers.IO) {
        val items = _allItems.value.filter { it.bucketId == albumId }
        sortItems(items, sortOrder)
    }
    
    /**
     * Get items matching filter rules
     */
    suspend fun getFilteredItems(
        filter: GalleryFilterRules,
        sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC
    ): List<GalleryItem> = withContext(Dispatchers.IO) {
        var items = _allItems.value
        
        // Apply filters
        filter.mediaTypes.takeIf { it.isNotEmpty() && !it.contains(GalleryMediaType.ALL) }?.let { types ->
            items = items.filter { it.mediaType in types }
        }
        
        filter.dateFrom?.let { from ->
            items = items.filter { it.dateTaken >= from }
        }
        
        filter.dateTo?.let { to ->
            items = items.filter { it.dateTaken <= to }
        }
        
        filter.minSize?.let { min ->
            items = items.filter { it.size >= min }
        }
        
        filter.maxSize?.let { max ->
            items = items.filter { it.size <= max }
        }
        
        filter.minDuration?.let { min ->
            items = items.filter { (it.duration ?: 0) >= min }
        }
        
        filter.maxDuration?.let { max ->
            items = items.filter { (it.duration ?: Long.MAX_VALUE) <= max }
        }
        
        filter.orientation?.let { orientation ->
            items = items.filter { item ->
                when (orientation) {
                    MediaOrientation.PORTRAIT -> item.isPortrait
                    MediaOrientation.LANDSCAPE -> item.isLandscape
                    MediaOrientation.SQUARE -> item.width == item.height
                }
            }
        }
        
        filter.hasLocation?.let { hasLoc ->
            items = items.filter { 
                (it.latitude != null && it.longitude != null) == hasLoc 
            }
        }
        
        filter.isFavorite?.let { isFav ->
            items = items.filter { it.isFavorite == isFav }
        }
        
        filter.minRating?.let { min ->
            items = items.filter { it.userRating >= min }
        }
        
        filter.albumIds.takeIf { it.isNotEmpty() }?.let { albums ->
            items = items.filter { it.bucketId in albums }
        }
        
        filter.excludeAlbumIds.takeIf { it.isNotEmpty() }?.let { exclude ->
            items = items.filter { it.bucketId !in exclude }
        }
        
        filter.isHidden?.let { hidden ->
            items = items.filter { it.isHidden == hidden }
        }
        
        filter.searchQuery?.takeIf { it.isNotBlank() }?.let { query ->
            val lowerQuery = query.lowercase()
            items = items.filter { 
                it.name.lowercase().contains(lowerQuery) ||
                it.bucketName.lowercase().contains(lowerQuery) ||
                it.aiTags.any { tag -> tag.lowercase().contains(lowerQuery) }
            }
        }
        
        // Near location filter
        filter.nearLocation?.let { locFilter ->
            items = items.filter { item ->
                item.latitude != null && item.longitude != null &&
                calculateDistance(
                    item.latitude, item.longitude,
                    locFilter.latitude, locFilter.longitude
                ) <= locFilter.radiusMeters
            }
        }
        
        sortItems(items, sortOrder)
    }
    
    /**
     * Sort items by specified order
     */
    private fun sortItems(items: List<GalleryItem>, sortOrder: GallerySortOrder): List<GalleryItem> {
        return when (sortOrder) {
            GallerySortOrder.DATE_TAKEN_DESC -> items.sortedByDescending { it.dateTaken }
            GallerySortOrder.DATE_TAKEN_ASC -> items.sortedBy { it.dateTaken }
            GallerySortOrder.DATE_ADDED_DESC -> items.sortedByDescending { it.dateAdded }
            GallerySortOrder.DATE_ADDED_ASC -> items.sortedBy { it.dateAdded }
            GallerySortOrder.DATE_MODIFIED_DESC -> items.sortedByDescending { it.dateModified }
            GallerySortOrder.DATE_MODIFIED_ASC -> items.sortedBy { it.dateModified }
            GallerySortOrder.NAME_ASC -> items.sortedBy { it.name.lowercase() }
            GallerySortOrder.NAME_DESC -> items.sortedByDescending { it.name.lowercase() }
            GallerySortOrder.SIZE_DESC -> items.sortedByDescending { it.size }
            GallerySortOrder.SIZE_ASC -> items.sortedBy { it.size }
            GallerySortOrder.DURATION_DESC -> items.sortedByDescending { it.duration ?: 0 }
            GallerySortOrder.DURATION_ASC -> items.sortedBy { it.duration ?: 0 }
            GallerySortOrder.RATING_DESC -> items.sortedByDescending { it.userRating }
            GallerySortOrder.RATING_ASC -> items.sortedBy { it.userRating }
            GallerySortOrder.RANDOM -> items.shuffled()
        }
    }
    
    /**
     * Get images only
     */
    fun getImages(): List<GalleryItem> {
        return _allItems.value.filter { 
            it.mediaType in listOf(GalleryMediaType.IMAGE, GalleryMediaType.GIF, GalleryMediaType.HEIC, GalleryMediaType.RAW)
        }
    }
    
    /**
     * Get videos only
     */
    fun getVideos(): List<GalleryItem> {
        return _allItems.value.filter { it.mediaType == GalleryMediaType.VIDEO }
    }
    
    /**
     * Get items from today
     */
    fun getTodayItems(): List<GalleryItem> {
        val todayStart = java.util.Calendar.getInstance().apply {
            set(java.util.Calendar.HOUR_OF_DAY, 0)
            set(java.util.Calendar.MINUTE, 0)
            set(java.util.Calendar.SECOND, 0)
            set(java.util.Calendar.MILLISECOND, 0)
        }.timeInMillis
        
        return _allItems.value.filter { it.dateTaken >= todayStart }
    }
    
    /**
     * Get recently added items (last 7 days)
     */
    fun getRecentlyAdded(days: Int = 7): List<GalleryItem> {
        val cutoff = System.currentTimeMillis() - (days * 24 * 60 * 60 * 1000L)
        return _allItems.value.filter { it.dateAdded >= cutoff }
            .sortedByDescending { it.dateAdded }
    }
    
    /**
     * Get favorites
     */
    fun getFavorites(): List<GalleryItem> {
        return _allItems.value.filter { it.isFavorite }
    }
    
    /**
     * Get screenshots (detected by folder name)
     */
    fun getScreenshots(): List<GalleryItem> {
        return _allItems.value.filter { 
            it.bucketName.contains("screenshot", ignoreCase = true) ||
            it.relativePath.contains("screenshot", ignoreCase = true)
        }
    }
    
    /**
     * Get items with location data
     */
    fun getItemsWithLocation(): List<GalleryItem> {
        return _allItems.value.filter { it.latitude != null && it.longitude != null }
    }
    
    /**
     * Get large files (> 10MB)
     */
    fun getLargeFiles(thresholdMb: Int = 10): List<GalleryItem> {
        val threshold = thresholdMb * 1_000_000L
        return _allItems.value.filter { it.size > threshold }
            .sortedByDescending { it.size }
    }
    
    /**
     * Get items from "On This Day" (same date in previous years)
     */
    fun getOnThisDay(): List<GalleryItem> {
        val today = java.util.Calendar.getInstance()
        val dayOfYear = today.get(java.util.Calendar.DAY_OF_YEAR)
        
        return _allItems.value.filter { item ->
            val itemDate = java.util.Calendar.getInstance().apply {
                timeInMillis = item.dateTaken
            }
            itemDate.get(java.util.Calendar.DAY_OF_YEAR) == dayOfYear &&
            itemDate.get(java.util.Calendar.YEAR) < today.get(java.util.Calendar.YEAR)
        }.sortedByDescending { it.dateTaken }
    }
    
    /**
     * Extract EXIF data for an item
     */
    suspend fun extractExifData(item: GalleryItem): ExifData? = withContext(Dispatchers.IO) {
        if (item.mediaType == GalleryMediaType.VIDEO) return@withContext null
        
        try {
            val inputStream = contentResolver.openInputStream(Uri.parse(item.uri))
            inputStream?.use { stream ->
                val exif = ExifInterface(stream)
                
                ExifData(
                    make = exif.getAttribute(ExifInterface.TAG_MAKE),
                    model = exif.getAttribute(ExifInterface.TAG_MODEL),
                    aperture = exif.getAttribute(ExifInterface.TAG_APERTURE_VALUE),
                    shutterSpeed = exif.getAttribute(ExifInterface.TAG_EXPOSURE_TIME),
                    iso = exif.getAttributeInt(ExifInterface.TAG_ISO_SPEED_RATINGS, -1).takeIf { it > 0 },
                    focalLength = exif.getAttribute(ExifInterface.TAG_FOCAL_LENGTH),
                    flash = exif.getAttributeInt(ExifInterface.TAG_FLASH, -1).let { 
                        if (it >= 0) (it and 1) == 1 else null 
                    },
                    whiteBalance = when (exif.getAttributeInt(ExifInterface.TAG_WHITE_BALANCE, -1)) {
                        0 -> "Auto"  // WHITEBALANCE_AUTO
                        1 -> "Manual"  // WHITEBALANCE_MANUAL
                        else -> null
                    },
                    orientation = when (exif.getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL)) {
                        ExifInterface.ORIENTATION_ROTATE_90 -> 90
                        ExifInterface.ORIENTATION_ROTATE_180 -> 180
                        ExifInterface.ORIENTATION_ROTATE_270 -> 270
                        else -> 0
                    }
                )
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error extracting EXIF: ${e.message}")
            null
        }
    }
    
    /**
     * Clear cache
     */
    fun clearCache() {
        _allItems.value = emptyList()
        _albums.value = emptyList()
    }
    
    /**
     * Remove items from cache (after deletion)
     */
    fun removeFromCache(itemIds: List<Long>) {
        _allItems.value = _allItems.value.filter { it.id !in itemIds }
        buildAlbumsFromItems(_allItems.value)
    }
    
    /**
     * Calculate distance between two coordinates in meters
     */
    private fun calculateDistance(
        lat1: Double, lon1: Double,
        lat2: Double, lon2: Double
    ): Double {
        val earthRadius = 6371000.0 // meters
        
        val dLat = Math.toRadians(lat2 - lat1)
        val dLon = Math.toRadians(lon2 - lon1)
        
        val a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                Math.sin(dLon / 2) * Math.sin(dLon / 2)
        
        val c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
        
        return earthRadius * c
    }
    
    // Extension functions for Cursor
    private fun Cursor.getLongOrNull(columnIndex: Int): Long? {
        return if (isNull(columnIndex)) null else getLong(columnIndex)
    }
    
    private fun Cursor.getIntOrNull(columnIndex: Int): Int? {
        return if (isNull(columnIndex)) null else getInt(columnIndex)
    }
    
    private fun Cursor.getDoubleOrNull(columnIndex: Int): Double? {
        return if (isNull(columnIndex)) null else getDouble(columnIndex)
    }
}
