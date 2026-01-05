package com.universalmedialibrary.services.gallery

import kotlinx.serialization.Serializable

/**
 * Gallery Feature Models
 * 
 * Plex-inspired photo/video gallery with advanced tagging, sorting, and smart collections.
 * Provides a rich in-app gallery experience similar to Google Photos and Plex.
 */

// ==================== CORE MEDIA TYPES ====================

/**
 * Type of gallery media
 */
@Serializable
enum class GalleryMediaType {
    IMAGE,
    VIDEO,
    GIF,
    RAW,      // RAW photo formats (DNG, CR2, NEF, etc.)
    HEIC,     // High Efficiency Image Format
    ALL       // Used for filtering
}

/**
 * Represents a single image or video from the device gallery
 */
@Serializable
data class GalleryItem(
    val id: Long,
    val name: String,
    val uri: String,
    val contentUri: String,
    val filePath: String,
    
    // Media properties
    val mediaType: GalleryMediaType,
    val mimeType: String,
    val size: Long,
    val width: Int = 0,
    val height: Int = 0,
    
    // Timestamps
    val dateTaken: Long,
    val dateAdded: Long,
    val dateModified: Long,
    
    // Location (if available)
    val latitude: Double? = null,
    val longitude: Double? = null,
    val locationName: String? = null,
    
    // Video specific
    val duration: Long? = null,  // Duration in milliseconds
    
    // Album/Folder info
    val bucketId: String,
    val bucketName: String,
    val relativePath: String,
    
    // User metadata
    val isFavorite: Boolean = false,
    val isHidden: Boolean = false,
    val userRating: Int = 0,  // 0-5 stars
    val tagIds: Set<Long> = emptySet(),
    
    // AI-generated metadata (Plex-like features)
    val faces: List<FaceDetection> = emptyList(),
    val aiTags: List<String> = emptyList(),  // Auto-detected: "beach", "sunset", "people", etc.
    val dominantColors: List<String> = emptyList(),
    val sceneType: String? = null,  // "landscape", "portrait", "macro", etc.
    
    // EXIF metadata
    val exifData: ExifData? = null
) {
    val aspectRatio: Float
        get() = if (height > 0) width.toFloat() / height else 1f
    
    val isPortrait: Boolean
        get() = height > width
    
    val isLandscape: Boolean
        get() = width > height
    
    val isVideo: Boolean
        get() = mediaType == GalleryMediaType.VIDEO
    
    val formattedDuration: String?
        get() = duration?.let { ms ->
            val seconds = (ms / 1000) % 60
            val minutes = (ms / (1000 * 60)) % 60
            val hours = ms / (1000 * 60 * 60)
            if (hours > 0) {
                String.format("%d:%02d:%02d", hours, minutes, seconds)
            } else {
                String.format("%d:%02d", minutes, seconds)
            }
        }
    
    val formattedSize: String
        get() = when {
            size >= 1_000_000_000 -> String.format("%.2f GB", size / 1_000_000_000.0)
            size >= 1_000_000 -> String.format("%.2f MB", size / 1_000_000.0)
            size >= 1_000 -> String.format("%.2f KB", size / 1_000.0)
            else -> "$size B"
        }
}

/**
 * EXIF metadata extracted from images
 */
@Serializable
data class ExifData(
    val make: String? = null,           // Camera manufacturer
    val model: String? = null,          // Camera model
    val aperture: String? = null,       // f/2.8
    val shutterSpeed: String? = null,   // 1/125s
    val iso: Int? = null,               // ISO 100
    val focalLength: String? = null,    // 50mm
    val flash: Boolean? = null,
    val whiteBalance: String? = null,
    val exposureMode: String? = null,
    val orientation: Int = 0            // Rotation in degrees
)

/**
 * Face detection result for a gallery item
 */
@Serializable
data class FaceDetection(
    val faceId: String,
    val personId: Long? = null,       // If identified
    val personName: String? = null,   // Named face
    val confidence: Float,
    val boundingBox: FaceBoundingBox
)

/**
 * Bounding box for face detection
 */
@Serializable
data class FaceBoundingBox(
    val left: Float,
    val top: Float,
    val right: Float,
    val bottom: Float
)

// ==================== ALBUMS ====================

/**
 * Represents a folder/album of media items
 */
@Serializable
data class GalleryAlbum(
    val id: String,                     // Bucket ID
    val name: String,                   // Folder name
    val path: String,                   // Full path
    val coverUri: String?,              // First item's URI
    val itemCount: Int,
    val imageCount: Int = 0,
    val videoCount: Int = 0,
    val totalSize: Long = 0,
    val latestTimestamp: Long = 0,
    val oldestTimestamp: Long = 0,
    
    // User customization
    val customCoverUri: String? = null,
    val isHidden: Boolean = false,
    val isPinned: Boolean = false,
    val sortOrder: Int = 0
) {
    val effectiveCoverUri: String?
        get() = customCoverUri ?: coverUri
    
    val formattedTotalSize: String
        get() = when {
            totalSize >= 1_000_000_000 -> String.format("%.2f GB", totalSize / 1_000_000_000.0)
            totalSize >= 1_000_000 -> String.format("%.2f MB", totalSize / 1_000_000.0)
            totalSize >= 1_000 -> String.format("%.2f KB", totalSize / 1_000.0)
            else -> "$totalSize B"
        }
}

// ==================== SMART COLLECTIONS (PLEX-LIKE) ====================

/**
 * Smart collection types for automatic grouping
 */
@Serializable
enum class SmartGalleryCollectionType {
    // Time-based
    TODAY,
    YESTERDAY,
    THIS_WEEK,
    THIS_MONTH,
    THIS_YEAR,
    ON_THIS_DAY,        // Memories from same day in previous years
    
    // Content-based (AI)
    PEOPLE,             // Photos with faces
    SELFIES,
    SCREENSHOTS,
    DOCUMENTS,
    RECEIPTS,
    
    // Scene/Subject
    LANDSCAPES,
    PORTRAITS,
    ANIMALS,
    FOOD,
    TRAVEL,
    
    // Media type
    VIDEOS,
    LIVE_PHOTOS,
    SLOW_MOTION,
    TIME_LAPSE,
    PANORAMAS,
    RAW_PHOTOS,
    
    // User activity
    FAVORITES,
    RECENTLY_ADDED,
    RECENTLY_EDITED,
    RECENTLY_SHARED,
    
    // Location
    PLACES,             // Grouped by location
    
    // Custom
    CUSTOM_FILTER
}

/**
 * Smart gallery collection with automatic filtering
 */
@Serializable
data class SmartGalleryCollection(
    val id: Long = 0,
    val type: SmartGalleryCollectionType,
    val name: String,
    val description: String? = null,
    val iconName: String? = null,
    val coverUri: String? = null,
    val itemCount: Int = 0,
    val isEnabled: Boolean = true,
    val displayOrder: Int = 0,
    
    // For custom filters
    val filterRules: GalleryFilterRules? = null,
    
    // Cache
    val lastRefreshed: Long = 0
)

// ==================== FILTERING & SORTING ====================

/**
 * Sort options for gallery items
 */
@Serializable
enum class GallerySortOrder {
    DATE_TAKEN_DESC,
    DATE_TAKEN_ASC,
    DATE_ADDED_DESC,
    DATE_ADDED_ASC,
    DATE_MODIFIED_DESC,
    DATE_MODIFIED_ASC,
    NAME_ASC,
    NAME_DESC,
    SIZE_DESC,
    SIZE_ASC,
    DURATION_DESC,      // For videos
    DURATION_ASC,
    RATING_DESC,
    RATING_ASC,
    RANDOM
}

/**
 * View modes for gallery display
 */
@Serializable
enum class GalleryViewMode {
    GRID_SMALL,         // 4 columns
    GRID_MEDIUM,        // 3 columns
    GRID_LARGE,         // 2 columns
    LIST,               // Detailed list view
    TIMELINE,           // Grouped by date
    MAP                 // Map view with location pins
}

/**
 * Filter rules for smart collections and search
 */
@Serializable
data class GalleryFilterRules(
    // Media type filters
    val mediaTypes: Set<GalleryMediaType> = emptySet(),
    
    // Date range
    val dateFrom: Long? = null,
    val dateTo: Long? = null,
    val onThisDay: Boolean = false,  // Show items from same day in past years
    
    // Size filters
    val minSize: Long? = null,
    val maxSize: Long? = null,
    
    // Duration filters (for videos)
    val minDuration: Long? = null,
    val maxDuration: Long? = null,
    
    // Dimension filters
    val minWidth: Int? = null,
    val minHeight: Int? = null,
    val orientation: MediaOrientation? = null,
    
    // Location
    val hasLocation: Boolean? = null,
    val nearLocation: LocationFilter? = null,
    
    // User data
    val isFavorite: Boolean? = null,
    val minRating: Int? = null,
    val maxRating: Int? = null,
    val tagIds: Set<Long> = emptySet(),
    val tagMatchMode: TagMatchMode = TagMatchMode.ANY,
    
    // AI/Content filters
    val hasFaces: Boolean? = null,
    val personIds: Set<Long> = emptySet(),
    val aiTags: Set<String> = emptySet(),
    val sceneTypes: Set<String> = emptySet(),
    
    // Album filters
    val albumIds: Set<String> = emptySet(),
    val excludeAlbumIds: Set<String> = emptySet(),
    
    // Misc
    val isHidden: Boolean? = false,  // Default: don't show hidden
    val isScreenshot: Boolean? = null,
    
    // Camera
    val cameraMake: String? = null,
    val cameraModel: String? = null,
    
    // Text search
    val searchQuery: String? = null
)

@Serializable
enum class MediaOrientation {
    PORTRAIT,
    LANDSCAPE,
    SQUARE
}

@Serializable
enum class TagMatchMode {
    ANY,    // Match any of the specified tags
    ALL     // Match all specified tags
}

@Serializable
data class LocationFilter(
    val latitude: Double,
    val longitude: Double,
    val radiusMeters: Double
)

// ==================== GALLERY TAGS ====================

/**
 * Gallery-specific tag (extends the unified tag system)
 */
@Serializable
data class GalleryTag(
    val id: Long = 0,
    val name: String,
    val color: String? = null,
    val iconName: String? = null,
    val itemCount: Int = 0,
    val isAuto: Boolean = false,  // AI-generated tag
    val parentId: Long? = null,   // For hierarchical tags
    val createdAt: Long = System.currentTimeMillis(),
    val lastUsed: Long = System.currentTimeMillis()
)

// ==================== PEOPLE/FACES ====================

/**
 * Person identified in gallery (for face grouping)
 */
@Serializable
data class GalleryPerson(
    val id: Long = 0,
    val name: String? = null,           // Can be unnamed
    val faceClusterId: String,          // AI face cluster ID
    val representativeFaceUri: String?, // Best face sample
    val photoCount: Int = 0,
    val isHidden: Boolean = false,
    val isFavorite: Boolean = false,
    val createdAt: Long = System.currentTimeMillis()
) {
    val displayName: String
        get() = name ?: "Unknown Person"
}

// ==================== MEMORIES/HIGHLIGHTS ====================

/**
 * Memory/Highlight collection (like Apple Photos Memories or Google Memories)
 */
@Serializable
data class GalleryMemory(
    val id: Long = 0,
    val title: String,
    val subtitle: String? = null,
    val type: MemoryType,
    val coverUri: String?,
    val itemIds: List<Long>,
    val itemCount: Int,
    val startDate: Long,
    val endDate: Long,
    val location: String? = null,
    val peopleIds: List<Long> = emptyList(),
    val isViewed: Boolean = false,
    val isSaved: Boolean = false,
    val createdAt: Long = System.currentTimeMillis()
)

@Serializable
enum class MemoryType {
    ON_THIS_DAY,        // Same day in previous years
    TRIP,               // Travel detected
    EVENT,              // Many photos in short time
    PEOPLE,             // Photos with specific people
    BEST_OF_MONTH,
    BEST_OF_YEAR,
    SEASONAL,           // Spring, Summer, etc.
    CUSTOM
}

// ==================== GALLERY STATE ====================

/**
 * Overall gallery state for UI
 */
data class GalleryState(
    val isLoading: Boolean = false,
    val error: String? = null,
    
    // Current view
    val albums: List<GalleryAlbum> = emptyList(),
    val currentAlbum: GalleryAlbum? = null,
    val items: List<GalleryItem> = emptyList(),
    
    // Smart collections
    val smartCollections: List<SmartGalleryCollection> = emptyList(),
    
    // Selection
    val selectedItemIds: Set<Long> = emptySet(),
    val isSelectionMode: Boolean = false,
    
    // View settings
    val viewMode: GalleryViewMode = GalleryViewMode.GRID_MEDIUM,
    val sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC,
    val activeFilter: GalleryFilterRules? = null,
    
    // Search
    val searchQuery: String = "",
    val searchResults: List<GalleryItem> = emptyList(),
    
    // People
    val people: List<GalleryPerson> = emptyList(),
    
    // Memories
    val memories: List<GalleryMemory> = emptyList(),
    
    // Tags
    val tags: List<GalleryTag> = emptyList(),
    
    // Statistics
    val totalItemCount: Int = 0,
    val totalSize: Long = 0
) {
    val hasSelection: Boolean
        get() = selectedItemIds.isNotEmpty()
    
    val selectedCount: Int
        get() = selectedItemIds.size
}

// ==================== EVENTS ====================

/**
 * Gallery UI events
 */
sealed interface GalleryEvent {
    // Navigation
    data object LoadAlbums : GalleryEvent
    data class OpenAlbum(val albumId: String) : GalleryEvent
    data class OpenItem(val itemId: Long) : GalleryEvent
    data object NavigateBack : GalleryEvent
    
    // Filtering & Sorting
    data class SetSortOrder(val order: GallerySortOrder) : GalleryEvent
    data class SetViewMode(val mode: GalleryViewMode) : GalleryEvent
    data class ApplyFilter(val filter: GalleryFilterRules?) : GalleryEvent
    data class Search(val query: String) : GalleryEvent
    
    // Selection
    data class ToggleSelection(val itemId: Long) : GalleryEvent
    data object SelectAll : GalleryEvent
    data object ClearSelection : GalleryEvent
    data class SetSelectionMode(val enabled: Boolean) : GalleryEvent
    
    // Item actions
    data class ToggleFavorite(val itemId: Long) : GalleryEvent
    data class SetRating(val itemId: Long, val rating: Int) : GalleryEvent
    data class AddTags(val itemIds: Set<Long>, val tagIds: Set<Long>) : GalleryEvent
    data class RemoveTags(val itemIds: Set<Long>, val tagIds: Set<Long>) : GalleryEvent
    data class HideItems(val itemIds: Set<Long>) : GalleryEvent
    data class UnhideItems(val itemIds: Set<Long>) : GalleryEvent
    data class DeleteItems(val itemIds: Set<Long>) : GalleryEvent
    data class ShareItems(val itemIds: Set<Long>) : GalleryEvent
    
    // Album actions
    data class CreateAlbum(val name: String) : GalleryEvent
    data class RenameAlbum(val albumId: String, val newName: String) : GalleryEvent
    data class SetAlbumCover(val albumId: String, val itemId: Long) : GalleryEvent
    data class ToggleAlbumPin(val albumId: String) : GalleryEvent
    data class HideAlbum(val albumId: String) : GalleryEvent
    
    // Tag management
    data class CreateTag(val name: String, val color: String?) : GalleryEvent
    data class DeleteTag(val tagId: Long) : GalleryEvent
    data class RenameTag(val tagId: Long, val newName: String) : GalleryEvent
    
    // People
    data class NamePerson(val personId: Long, val name: String) : GalleryEvent
    data class MergePeople(val personIds: Set<Long>, val targetId: Long) : GalleryEvent
    data class HidePerson(val personId: Long) : GalleryEvent
    
    // Smart collections
    data class OpenSmartCollection(val type: SmartGalleryCollectionType) : GalleryEvent
    data object RefreshSmartCollections : GalleryEvent
    
    // Refresh
    data object Refresh : GalleryEvent
    data object ScanForNewMedia : GalleryEvent
}
