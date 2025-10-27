package com.universalmedialibrary.services.integration

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMovie
import com.universalmedialibrary.services.metadata.ArtworkEnhancementService
import com.universalmedialibrary.services.metadata.ArtworkType
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service that integrates Fanart.tv with metadata fetching
 * 
 * This service demonstrates how to automatically fetch and enhance
 * artwork when adding new movies, TV shows, or music to the library.
 */
@Singleton
class MetadataWithFanartService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val metadataDao: MetadataDao,
    private val artworkEnhancementService: ArtworkEnhancementService,
    private val fanartTvService: FanartTvService
) {
    companion object {
        private const val TAG = "MetadataWithFanart"
    }

    /**
     * Save movie metadata and enhance with Fanart.tv artwork
     * 
     * Example usage:
     * ```
     * val movieMetadata = MetadataCommon(
     *     itemId = 123,
     *     title = "The Matrix",
     *     year = 1999,
     *     summary = "A computer hacker learns...",
     *     externalId = "603" // TMDb ID
     * )
     * 
     * val movieSpecific = MetadataMovie(
     *     itemId = 123,
     *     tmdbId = "603",
     *     imdbId = "tt0133093"
     * )
     * 
     * val success = metadataWithFanartService.saveMovieWithFanart(
     *     movieMetadata,
     *     movieSpecific
     * )
     * ```
     */
    suspend fun saveMovieWithFanart(
        metadata: MetadataCommon,
        movieMetadata: MetadataMovie
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                // Save basic metadata
                metadataDao.insertMetadataCommon(metadata)
                metadataDao.insertMetadataMovie(movieMetadata)
                
                Log.d(TAG, "Saved movie metadata for item ${metadata.itemId}")
                
                // Enhance with Fanart.tv if enabled and TMDb ID is available
                if (movieMetadata.tmdbId != null && fanartTvService.isEnabled()) {
                    Log.d(TAG, "Enhancing artwork with Fanart.tv for TMDb ID ${movieMetadata.tmdbId}")
                    artworkEnhancementService.enhanceMovieArtwork(
                        itemId = metadata.itemId,
                        tmdbId = movieMetadata.tmdbId,
                        downloadAndCache = true
                    )
                } else {
                    Log.d(TAG, "Skipping Fanart.tv enhancement: enabled=${fanartTvService.isEnabled()}, tmdbId=${movieMetadata.tmdbId}")
                }
                
                true
            } catch (e: Exception) {
                Log.e(TAG, "Error saving movie with fanart", e)
                false
            }
        }
    }

    /**
     * Batch enhance artwork for existing library items
     * 
     * This can be called to enhance artwork for movies/shows that were
     * added before Fanart.tv was configured.
     * 
     * Example usage:
     * ```
     * val count = metadataWithFanartService.enhanceExistingLibrary()
     * Log.d(TAG, "Enhanced $count items with Fanart.tv")
     * ```
     */
    suspend fun enhanceExistingLibrary(): Int {
        return withContext(Dispatchers.IO) {
            try {
                if (!fanartTvService.isEnabled()) {
                    Log.w(TAG, "Fanart.tv is not enabled")
                    return@withContext 0
                }

                // Get all movies with TMDb IDs
                val movies = getAllMoviesWithTmdbIds()
                Log.d(TAG, "Found ${movies.size} movies to enhance")
                
                // Enhance in batches
                val items = movies.map { (itemId, tmdbId) ->
                    Triple(itemId, tmdbId, ArtworkType.MOVIE)
                }
                
                val count = artworkEnhancementService.batchEnhanceArtwork(items)
                Log.d(TAG, "Enhanced $count of ${items.size} items")
                count
            } catch (e: Exception) {
                Log.e(TAG, "Error enhancing existing library", e)
                0
            }
        }
    }

    /**
     * Get all movies with TMDb IDs
     * This is a helper method - in production, you'd query the database properly
     */
    private suspend fun getAllMoviesWithTmdbIds(): List<Pair<Long, String>> {
        // This is a placeholder - implement actual database query
        // Example query would be:
        // SELECT mm.itemId, mm.tmdbId FROM metadata_movie mm WHERE mm.tmdbId IS NOT NULL
        return emptyList()
    }

    /**
     * Check if Fanart.tv is available and configured
     */
    suspend fun isFanartTvAvailable(): Boolean {
        return fanartTvService.isEnabled()
    }

    /**
     * Get Fanart.tv cache statistics
     */
    suspend fun getFanartCacheStats(): FanartCacheStats {
        val size = fanartTvService.getCacheSize()
        return FanartCacheStats(
            cacheSize = size,
            cacheSizeMB = size / (1024.0 * 1024.0)
        )
    }

    /**
     * Clear Fanart.tv cache
     */
    suspend fun clearFanartCache() {
        fanartTvService.clearCache()
    }
}

/**
 * Fanart.tv cache statistics
 */
data class FanartCacheStats(
    val cacheSize: Long,
    val cacheSizeMB: Double
)
