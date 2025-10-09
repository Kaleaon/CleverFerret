package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.services.metadata.RealMetadataService
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for coordinating metadata fetching and storage
 * Bridges the gap between metadata services and local database
 */
@Singleton
class MetadataFetchRepository @Inject constructor(
    private val realMetadataService: RealMetadataService,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    /**
     * Fetch and save metadata for a book
     */
    suspend fun fetchAndSaveBookMetadata(
        itemId: Long,
        title: String? = null,
        author: String? = null,
        isbn: String? = null
    ): MetadataFetchResult = withContext(Dispatchers.IO) {
        try {
            // Get existing media item
            val mediaItem = mediaItemDao.getItemById(itemId)
                ?: return@withContext MetadataFetchResult.Error("Media item not found")

            // Fetch metadata from APIs
            val result = realMetadataService.searchBookMetadata(
                title = title ?: mediaItem.fileName.substringBeforeLast('.'),
                author = author,
                isbn = isbn
            )

            val bookMetadata = result.metadata
                ?: return@withContext MetadataFetchResult.Error("No metadata found")

            // Get existing metadata or create new
            val existingMetadata = metadataDao.getMetadataCommonByItemId(itemId)

            // Create updated metadata
            val updatedMetadata = if (existingMetadata != null) {
                existingMetadata.copy(
                    title = bookMetadata.title,
                    summary = bookMetadata.description,
                    coverImagePath = bookMetadata.coverUrl,
                    year = bookMetadata.publishedDate?.take(4)?.toIntOrNull(),
                    language = bookMetadata.language,
                    rating = bookMetadata.averageRating,
                    lastUpdated = System.currentTimeMillis(),
                    metadataSource = result.sources.joinToString(", ")
                )
            } else {
                MetadataCommon(
                    itemId = itemId,
                    title = bookMetadata.title,
                    sortTitle = null,
                    originalTitle = null,
                    year = bookMetadata.publishedDate?.take(4)?.toIntOrNull(),
                    releaseDate = bookMetadata.publishedDate,
                    rating = bookMetadata.averageRating,
                    userRating = null,
                    communityRating = null,
                    summary = bookMetadata.description,
                    plot = null,
                    tagline = null,
                    coverImagePath = bookMetadata.coverUrl,
                    backdropImagePath = null,
                    language = bookMetadata.language,
                    country = null,
                    lastUpdated = System.currentTimeMillis(),
                    metadataSource = result.sources.joinToString(", "),
                    externalId = bookMetadata.sourceId
                )
            }

            // Save to database
            metadataDao.insertMetadataCommon(updatedMetadata)

            // Update media item to mark it has metadata
            mediaItemDao.updateMediaItem(mediaItem.copy(hasMetadata = true))

            MetadataFetchResult.Success(
                sources = result.sources,
                metadata = updatedMetadata
            )
        } catch (e: Exception) {
            MetadataFetchResult.Error(e.message ?: "Failed to fetch metadata")
        }
    }

    /**
     * Fetch and save metadata for a movie/TV show
     */
    suspend fun fetchAndSaveMovieMetadata(
        itemId: Long,
        title: String? = null,
        year: Int? = null,
        imdbId: String? = null
    ): MetadataFetchResult = withContext(Dispatchers.IO) {
        try {
            val mediaItem = mediaItemDao.getItemById(itemId)
                ?: return@withContext MetadataFetchResult.Error("Media item not found")

            val result = realMetadataService.searchMovieMetadata(
                title = title ?: mediaItem.fileName.substringBeforeLast('.'),
                year = year,
                imdbId = imdbId
            )

            val movieMetadata = result.metadata
                ?: return@withContext MetadataFetchResult.Error("No metadata found")

            val existingMetadata = metadataDao.getMetadataCommonByItemId(itemId)

            val updatedMetadata = if (existingMetadata != null) {
                existingMetadata.copy(
                    title = movieMetadata.title,
                    summary = movieMetadata.overview,
                    coverImagePath = movieMetadata.posterUrl,
                    backdropImagePath = movieMetadata.backdropUrl,
                    year = movieMetadata.year,
                    rating = movieMetadata.voteAverage,
                    lastUpdated = System.currentTimeMillis(),
                    metadataSource = result.sources.joinToString(", "),
                    externalId = movieMetadata.tmdbId ?: movieMetadata.imdbId
                )
            } else {
                MetadataCommon(
                    itemId = itemId,
                    title = movieMetadata.title,
                    sortTitle = null,
                    originalTitle = null,
                    year = movieMetadata.year,
                    releaseDate = null,
                    rating = movieMetadata.voteAverage,
                    userRating = null,
                    communityRating = null,
                    summary = movieMetadata.overview,
                    plot = null,
                    tagline = null,
                    coverImagePath = movieMetadata.posterUrl,
                    backdropImagePath = movieMetadata.backdropUrl,
                    language = null,
                    country = null,
                    lastUpdated = System.currentTimeMillis(),
                    metadataSource = result.sources.joinToString(", "),
                    externalId = movieMetadata.tmdbId ?: movieMetadata.imdbId
                )
            }

            metadataDao.insertMetadataCommon(updatedMetadata)
            mediaItemDao.updateMediaItem(mediaItem.copy(hasMetadata = true))

            MetadataFetchResult.Success(
                sources = result.sources,
                metadata = updatedMetadata
            )
        } catch (e: Exception) {
            MetadataFetchResult.Error(e.message ?: "Failed to fetch metadata")
        }
    }

    /**
     * Fetch and save metadata for music
     */
    suspend fun fetchAndSaveMusicMetadata(
        itemId: Long,
        artist: String? = null,
        album: String? = null,
        track: String? = null
    ): MetadataFetchResult = withContext(Dispatchers.IO) {
        try {
            val mediaItem = mediaItemDao.getItemById(itemId)
                ?: return@withContext MetadataFetchResult.Error("Media item not found")

            val result = realMetadataService.searchMusicMetadata(
                artist = artist,
                album = album,
                track = track ?: mediaItem.fileName.substringBeforeLast('.')
            )

            val musicMetadata = result.metadata
                ?: return@withContext MetadataFetchResult.Error("No metadata found")

            val existingMetadata = metadataDao.getMetadataCommonByItemId(itemId)

            val updatedMetadata = if (existingMetadata != null) {
                existingMetadata.copy(
                    title = musicMetadata.title,
                    coverImagePath = musicMetadata.coverUrl,
                    releaseDate = musicMetadata.releaseDate,
                    lastUpdated = System.currentTimeMillis(),
                    metadataSource = result.sources.joinToString(", "),
                    externalId = musicMetadata.mbid
                )
            } else {
                MetadataCommon(
                    itemId = itemId,
                    title = musicMetadata.title,
                    sortTitle = null,
                    originalTitle = null,
                    year = musicMetadata.releaseDate?.take(4)?.toIntOrNull(),
                    releaseDate = musicMetadata.releaseDate,
                    rating = null,
                    userRating = null,
                    communityRating = null,
                    summary = null,
                    plot = null,
                    tagline = null,
                    coverImagePath = musicMetadata.coverUrl,
                    backdropImagePath = null,
                    language = null,
                    country = null,
                    lastUpdated = System.currentTimeMillis(),
                    metadataSource = result.sources.joinToString(", "),
                    externalId = musicMetadata.mbid
                )
            }

            metadataDao.insertMetadataCommon(updatedMetadata)
            mediaItemDao.updateMediaItem(mediaItem.copy(hasMetadata = true))

            MetadataFetchResult.Success(
                sources = result.sources,
                metadata = updatedMetadata
            )
        } catch (e: Exception) {
            MetadataFetchResult.Error(e.message ?: "Failed to fetch metadata")
        }
    }

    /**
     * Fetch metadata based on media type
     */
    suspend fun fetchMetadataForItem(itemId: Long): MetadataFetchResult {
        val mediaItem = mediaItemDao.getItemById(itemId)
            ?: return MetadataFetchResult.Error("Media item not found")

        return when (mediaItem.mediaType.uppercase()) {
            "BOOK" -> fetchAndSaveBookMetadata(itemId)
            "MOVIE", "VIDEO" -> fetchAndSaveMovieMetadata(itemId)
            "MUSIC", "AUDIO" -> fetchAndSaveMusicMetadata(itemId)
            else -> MetadataFetchResult.Error("Unsupported media type: ${mediaItem.mediaType}")
        }
    }

    /**
     * Batch fetch metadata for multiple items
     */
    suspend fun fetchMetadataForLibrary(libraryId: Long): BatchMetadataFetchResult = withContext(Dispatchers.IO) {
        val items = mediaItemDao.getItemsByLibrary(libraryId)
        val results = mutableListOf<MetadataFetchResult>()
        var successCount = 0
        var failureCount = 0

        items.forEach { item ->
            if (!item.hasMetadata) {
                val result = fetchMetadataForItem(item.itemId)
                results.add(result)
                when (result) {
                    is MetadataFetchResult.Success -> successCount++
                    is MetadataFetchResult.Error -> failureCount++
                }
            }
        }

        BatchMetadataFetchResult(
            totalItems = items.size,
            successCount = successCount,
            failureCount = failureCount,
            results = results
        )
    }
}

/**
 * Result of a metadata fetch operation
 */
sealed class MetadataFetchResult {
    data class Success(
        val sources: List<String>,
        val metadata: MetadataCommon
    ) : MetadataFetchResult()

    data class Error(val message: String) : MetadataFetchResult()
}

/**
 * Result of batch metadata fetching
 */
data class BatchMetadataFetchResult(
    val totalItems: Int,
    val successCount: Int,
    val failureCount: Int,
    val results: List<MetadataFetchResult>
)
