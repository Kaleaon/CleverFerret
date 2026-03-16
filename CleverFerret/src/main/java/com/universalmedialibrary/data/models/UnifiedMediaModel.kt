package com.universalmedialibrary.data.models

import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.MediaType

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
 * Future Enhancements (tracked as TODOs):
 * 1. Tags & Collections: Add UnifiedTag and UnifiedCollection properties for organization
 * 2. Artwork Variants: Add computed properties for different artwork sizes/contexts
 * 3. External Sources: Support Plex, Jellyfin, and other media server integrations
 * 4. Grouped Media: Support for albums, series, and collections as first-class entities
 * 5. Relationships: Track related books, sequels, prequels, and recommendations
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

    // Future: Tag and Collection Support
    // When implemented, add these as properties loaded via repository:
    // val tags: List<UnifiedTag> - Query: unifiedTagDao.getTagsForItem(itemId)
    // val collections: List<UnifiedCollection> - Query: collectionDao.getCollectionsForItem(itemId)
    // val genres: List<Genre> - Query: genreDao.getGenresForItem(itemId)

    // Future: Artwork Variant Accessors
    // When implemented, provide context-specific artwork:
    // val primaryArtwork: String? - Main cover/poster (original size)
    // val thumbnailArtwork: String? - Small thumbnail for lists (256x256)
    // val backgroundArtwork: String? - Background for details screen (1920x1080)
    // val bannerArtwork: String? - Wide banner for headers (1920x600)

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
 * Extension functions for converting between entities and unified model
 */
fun MediaItem.toUnifiedMediaItem(
    commonMetadata: MetadataCommon? = null,
    bookMetadata: MetadataBook? = null,
    movieMetadata: MetadataMovie? = null,
    musicMetadata: MetadataMusicTrack? = null
): UnifiedMediaItem {
    val mediaType = try {
        MediaType.valueOf(this.mediaType)
    } catch (_: IllegalArgumentException) {
        MediaType.UNKNOWN
    }

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
