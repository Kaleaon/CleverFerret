package com.universalmedialibrary.data.models

import com.universalmedialibrary.data.local.entity.*

/**
 * Unified media model using sealed classes for type-safe media handling
 * 
 * This model provides a single interface for working with all media types
 * while maintaining type safety and specific metadata access.
 * 
 * Benefits:
 * - Exhaustive when statements ensure all types are handled
 * - Type-specific properties without unsafe casting
 * - Common interface for shared operations
 * - Easy to extend with new media types
 * 
 * TODO: Add support for tags and collections as properties
 * TODO: Add computed properties for artwork variants
 * TODO: Add support for external media sources (Plex, Jellyfin)
 * TODO: Add support for grouped media (albums, series)
 * TODO: Add support for media relationships (related books, sequels)
 */
sealed class UnifiedMediaItem {
    abstract val itemId: Long
    abstract val libraryId: Long
    abstract val filePath: String
    abstract val fileName: String
    abstract val fileExtension: String
    abstract val fileSize: Long
    abstract val mediaType: MediaType
    abstract val commonMetadata: MetadataCommon?
    abstract val dateAdded: Long
    abstract val lastScanned: Long
    abstract val isAvailable: Boolean
    abstract val thumbnailPath: String?
    
    // Common properties accessible across all media types
    val title: String get() = commonMetadata?.title ?: fileName
    val year: Int? get() = commonMetadata?.year
    val rating: Float? get() = commonMetadata?.rating
    val summary: String? get() = commonMetadata?.summary
    val coverImagePath: String? get() = commonMetadata?.coverImagePath ?: thumbnailPath
    val language: String? get() = commonMetadata?.language
    
    // TODO: Add these computed properties when tag/collection support is implemented
    // val tags: List<UnifiedTag> - Loaded via repository query
    // val collections: List<UnifiedCollection> - Loaded via repository query
    // val genres: List<Genre> - Loaded via repository query
    
    // TODO: Add artwork accessors for different contexts
    // val primaryArtwork: String? - Main cover/poster
    // val thumbnailArtwork: String? - Small thumbnail for lists
    // val backgroundArtwork: String? - Background for details screen
    // val bannerArtwork: String? - Wide banner for headers
    
    data class Book(
        override val itemId: Long,
        override val libraryId: Long,
        override val filePath: String,
        override val fileName: String,
        override val fileExtension: String,
        override val fileSize: Long,
        override val commonMetadata: MetadataCommon?,
        override val dateAdded: Long,
        override val lastScanned: Long,
        override val isAvailable: Boolean,
        override val thumbnailPath: String?,
        val bookMetadata: MetadataBook?
    ) : UnifiedMediaItem() {
        override val mediaType = MediaType.BOOK
        
        // Book-specific properties
        val author: String? = null // Will be populated from People relationship
        val isbn: String? get() = bookMetadata?.isbn
        val pageCount: Int? get() = bookMetadata?.pageCount
        val series: String? get() = bookMetadata?.series
        val readingProgress: Float get() = bookMetadata?.readingProgress ?: 0f
        val isRead: Boolean get() = bookMetadata?.isRead ?: false
    }
    
    data class Movie(
        override val itemId: Long,
        override val libraryId: Long,
        override val filePath: String,
        override val fileName: String,
        override val fileExtension: String,
        override val fileSize: Long,
        override val commonMetadata: MetadataCommon?,
        override val dateAdded: Long,
        override val lastScanned: Long,
        override val isAvailable: Boolean,
        override val thumbnailPath: String?,
        val movieMetadata: MetadataMovie?
    ) : UnifiedMediaItem() {
        override val mediaType = MediaType.MOVIE
        
        // Movie-specific properties
        val runtime: Int? get() = movieMetadata?.runtime
        val imdbId: String? get() = movieMetadata?.imdbId
        val certification: String? get() = movieMetadata?.certification
        val watchProgress: Float get() = movieMetadata?.watchProgress ?: 0f
        val isWatched: Boolean get() = movieMetadata?.watchedStatus == "WATCHED"
    }
    
    data class MusicTrack(
        override val itemId: Long,
        override val libraryId: Long,
        override val filePath: String,
        override val fileName: String,
        override val fileExtension: String,
        override val fileSize: Long,
        override val commonMetadata: MetadataCommon?,
        override val dateAdded: Long,
        override val lastScanned: Long,
        override val isAvailable: Boolean,
        override val thumbnailPath: String?,
        val musicMetadata: MetadataMusicTrack?
    ) : UnifiedMediaItem() {
        override val mediaType = MediaType.MUSIC_TRACK
        
        // Music-specific properties
        val artist: String? get() = musicMetadata?.artist
        val album: String? get() = musicMetadata?.album
        val duration: Long? get() = musicMetadata?.duration
        val trackNumber: Int? get() = musicMetadata?.trackNumber
        val playCount: Int get() = musicMetadata?.playCount ?: 0
        val isFavorite: Boolean get() = musicMetadata?.isFavorite ?: false
    }
    
    data class TvShow(
        override val itemId: Long,
        override val libraryId: Long,
        override val filePath: String,
        override val fileName: String,
        override val fileExtension: String,
        override val fileSize: Long,
        override val commonMetadata: MetadataCommon?,
        override val dateAdded: Long,
        override val lastScanned: Long,
        override val isAvailable: Boolean,
        override val thumbnailPath: String?
    ) : UnifiedMediaItem() {
        override val mediaType = MediaType.TV_SHOW
        
        // TV Show specific properties would be added when MetadataTvShow entity is created
    }
    
    data class Audiobook(
        override val itemId: Long,
        override val libraryId: Long,
        override val filePath: String,
        override val fileName: String,
        override val fileExtension: String,
        override val fileSize: Long,
        override val commonMetadata: MetadataCommon?,
        override val dateAdded: Long,
        override val lastScanned: Long,
        override val isAvailable: Boolean,
        override val thumbnailPath: String?
    ) : UnifiedMediaItem() {
        override val mediaType = MediaType.AUDIOBOOK
        
        // Audiobook specific properties would be added when MetadataAudiobook entity is created
    }
    
    data class Podcast(
        override val itemId: Long,
        override val libraryId: Long,
        override val filePath: String,
        override val fileName: String,
        override val fileExtension: String,
        override val fileSize: Long,
        override val commonMetadata: MetadataCommon?,
        override val dateAdded: Long,
        override val lastScanned: Long,
        override val isAvailable: Boolean,
        override val thumbnailPath: String?
    ) : UnifiedMediaItem() {
        override val mediaType = MediaType.PODCAST
        
        // Podcast specific properties would be added when MetadataPodcast entity is created
    }
    
    data class Generic(
        override val itemId: Long,
        override val libraryId: Long,
        override val filePath: String,
        override val fileName: String,
        override val fileExtension: String,
        override val fileSize: Long,
        override val commonMetadata: MetadataCommon?,
        override val dateAdded: Long,
        override val lastScanned: Long,
        override val isAvailable: Boolean,
        override val thumbnailPath: String?,
        override val mediaType: MediaType
    ) : UnifiedMediaItem()
}

/**
 * Enum for all supported media types
 */
enum class MediaType(val displayName: String, val extensions: List<String>) {
    BOOK("Book", listOf("epub", "pdf", "mobi", "azw", "azw3", "fb2", "txt")),
    MOVIE("Movie", listOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm")),
    TV_SHOW("TV Show", listOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm")),
    MUSIC_TRACK("Music", listOf("mp3", "flac", "wav", "aac", "ogg", "m4a", "wma")),
    AUDIOBOOK("Audiobook", listOf("mp3", "m4a", "m4b", "aac", "flac", "ogg")),
    PODCAST("Podcast", listOf("mp3", "m4a", "aac", "ogg")),
    COMIC("Comic", listOf("cbz", "cbr", "cb7", "cbt", "pdf")),
    MAGAZINE("Magazine", listOf("pdf", "epub", "cbz", "cbr")),
    DOCUMENT("Document", listOf("pdf", "doc", "docx", "txt", "rtf", "odt")),
    IMAGE("Image", listOf("jpg", "jpeg", "png", "gif", "bmp", "tiff", "webp")),
    VIDEO("Video", listOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm")),
    AUDIO("Audio", listOf("mp3", "flac", "wav", "aac", "ogg", "m4a", "wma"));
    
    companion object {
        fun fromExtension(extension: String): MediaType {
            val ext = extension.lowercase()
            return values().find { type -> 
                type.extensions.contains(ext) 
            } ?: when {
                ext in listOf("mp4", "mkv", "avi", "mov", "wmv", "flv", "webm") -> VIDEO
                ext in listOf("mp3", "flac", "wav", "aac", "ogg", "m4a", "wma") -> AUDIO
                ext in listOf("pdf", "doc", "docx", "txt", "rtf", "odt") -> DOCUMENT
                ext in listOf("jpg", "jpeg", "png", "gif", "bmp", "tiff", "webp") -> IMAGE
                else -> DOCUMENT
            }
        }
        
        fun fromString(typeString: String): MediaType {
            return values().find { it.name.equals(typeString, ignoreCase = true) } ?: DOCUMENT
        }
    }
}

/**
 * Extension functions for converting between entities and unified model
 */
fun MediaItem.toUnifiedMediaItem(
    commonMetadata: MetadataCommon? = null,
    bookMetadata: MetadataBook? = null,
    movieMetadata: MetadataMovie? = null,
    musicMetadata: MetadataMusicTrack? = null
): UnifiedMediaItem {
    val mediaType = MediaType.fromString(this.mediaType)
    
    return when (mediaType) {
        MediaType.BOOK -> UnifiedMediaItem.Book(
            itemId = itemId,
            libraryId = libraryId,
            filePath = filePath,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            commonMetadata = commonMetadata,
            dateAdded = dateAdded,
            lastScanned = lastScanned,
            isAvailable = isAvailable,
            thumbnailPath = thumbnailPath,
            bookMetadata = bookMetadata
        )
        MediaType.MOVIE -> UnifiedMediaItem.Movie(
            itemId = itemId,
            libraryId = libraryId,
            filePath = filePath,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            commonMetadata = commonMetadata,
            dateAdded = dateAdded,
            lastScanned = lastScanned,
            isAvailable = isAvailable,
            thumbnailPath = thumbnailPath,
            movieMetadata = movieMetadata
        )
        MediaType.TV_SHOW -> UnifiedMediaItem.TvShow(
            itemId = itemId,
            libraryId = libraryId,
            filePath = filePath,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            commonMetadata = commonMetadata,
            dateAdded = dateAdded,
            lastScanned = lastScanned,
            isAvailable = isAvailable,
            thumbnailPath = thumbnailPath
        )
        MediaType.MUSIC_TRACK, MediaType.AUDIO -> UnifiedMediaItem.MusicTrack(
            itemId = itemId,
            libraryId = libraryId,
            filePath = filePath,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            commonMetadata = commonMetadata,
            dateAdded = dateAdded,
            lastScanned = lastScanned,
            isAvailable = isAvailable,
            thumbnailPath = thumbnailPath,
            musicMetadata = musicMetadata
        )
        MediaType.AUDIOBOOK -> UnifiedMediaItem.Audiobook(
            itemId = itemId,
            libraryId = libraryId,
            filePath = filePath,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            commonMetadata = commonMetadata,
            dateAdded = dateAdded,
            lastScanned = lastScanned,
            isAvailable = isAvailable,
            thumbnailPath = thumbnailPath
        )
        MediaType.PODCAST -> UnifiedMediaItem.Podcast(
            itemId = itemId,
            libraryId = libraryId,
            filePath = filePath,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            commonMetadata = commonMetadata,
            dateAdded = dateAdded,
            lastScanned = lastScanned,
            isAvailable = isAvailable,
            thumbnailPath = thumbnailPath
        )
        else -> UnifiedMediaItem.Generic(
            itemId = itemId,
            libraryId = libraryId,
            filePath = filePath,
            fileName = fileName,
            fileExtension = fileExtension,
            fileSize = fileSize,
            commonMetadata = commonMetadata,
            dateAdded = dateAdded,
            lastScanned = lastScanned,
            isAvailable = isAvailable,
            thumbnailPath = thumbnailPath,
            mediaType = mediaType
        )
    }
}