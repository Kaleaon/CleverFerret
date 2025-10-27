package com.universalmedialibrary.services.metadata

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.services.integration.FanartTvService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for enhancing artwork using Fanart.tv and other sources
 * 
 * This service coordinates fetching high-quality fanart from Fanart.tv
 * and updating the metadata in the database.
 */
@Singleton
class ArtworkEnhancementService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val fanartTvService: FanartTvService,
    private val metadataDao: MetadataDao
) {
    companion object {
        private const val TAG = "ArtworkEnhancement"
    }

    /**
     * Enhance movie artwork using Fanart.tv
     * @param itemId The media item ID
     * @param tmdbId The Movie Database ID
     * @param downloadAndCache Whether to download and cache the images locally
     * @return true if artwork was enhanced, false otherwise
     */
    suspend fun enhanceMovieArtwork(
        itemId: Long,
        tmdbId: String,
        downloadAndCache: Boolean = true
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                if (!fanartTvService.isEnabled()) {
                    Log.d(TAG, "Fanart.tv is not enabled, skipping artwork enhancement")
                    return@withContext false
                }

                val fanart = fanartTvService.fetchMovieFanart(tmdbId)
                if (fanart == null) {
                    Log.d(TAG, "No fanart found for movie TMDb ID $tmdbId")
                    return@withContext false
                }

                val (posterUrl, backdropUrl) = fanart
                
                // Get existing metadata
                val existingMetadata = metadataDao.getMetadataCommonByItemId(itemId)
                if (existingMetadata == null) {
                    Log.w(TAG, "No metadata found for item ID $itemId")
                    return@withContext false
                }

                // Download and cache images if requested
                var finalPosterPath = posterUrl
                var finalBackdropPath = backdropUrl

                if (downloadAndCache) {
                    if (posterUrl != null) {
                        val cachedPoster = fanartTvService.downloadAndCacheImage(
                            posterUrl,
                            "movie_${tmdbId}_poster.jpg"
                        )
                        if (cachedPoster != null) {
                            finalPosterPath = cachedPoster
                        }
                    }

                    if (backdropUrl != null) {
                        val cachedBackdrop = fanartTvService.downloadAndCacheImage(
                            backdropUrl,
                            "movie_${tmdbId}_backdrop.jpg"
                        )
                        if (cachedBackdrop != null) {
                            finalBackdropPath = cachedBackdrop
                        }
                    }
                }

                // Update metadata with new artwork
                val updatedMetadata = existingMetadata.copy(
                    coverImagePath = finalPosterPath ?: existingMetadata.coverImagePath,
                    backdropImagePath = finalBackdropPath ?: existingMetadata.backdropImagePath,
                    metadataSource = "fanart.tv",
                    lastUpdated = System.currentTimeMillis()
                )

                metadataDao.updateMetadata(updatedMetadata)
                Log.d(TAG, "Enhanced movie artwork for item $itemId with Fanart.tv")
                true
            } catch (e: Exception) {
                Log.e(TAG, "Error enhancing movie artwork for item $itemId", e)
                false
            }
        }
    }

    /**
     * Enhance TV show artwork using Fanart.tv
     * @param itemId The media item ID
     * @param tvdbId The TVDB ID
     * @param downloadAndCache Whether to download and cache the images locally
     * @return true if artwork was enhanced, false otherwise
     */
    suspend fun enhanceTvArtwork(
        itemId: Long,
        tvdbId: String,
        downloadAndCache: Boolean = true
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                if (!fanartTvService.isEnabled()) {
                    Log.d(TAG, "Fanart.tv is not enabled, skipping artwork enhancement")
                    return@withContext false
                }

                val fanart = fanartTvService.fetchTvFanart(tvdbId)
                if (fanart == null) {
                    Log.d(TAG, "No fanart found for TV show TVDB ID $tvdbId")
                    return@withContext false
                }

                val (posterUrl, backdropUrl) = fanart
                
                // Get existing metadata
                val existingMetadata = metadataDao.getMetadataCommonByItemId(itemId)
                if (existingMetadata == null) {
                    Log.w(TAG, "No metadata found for item ID $itemId")
                    return@withContext false
                }

                // Download and cache images if requested
                var finalPosterPath = posterUrl
                var finalBackdropPath = backdropUrl

                if (downloadAndCache) {
                    if (posterUrl != null) {
                        val cachedPoster = fanartTvService.downloadAndCacheImage(
                            posterUrl,
                            "tv_${tvdbId}_poster.jpg"
                        )
                        if (cachedPoster != null) {
                            finalPosterPath = cachedPoster
                        }
                    }

                    if (backdropUrl != null) {
                        val cachedBackdrop = fanartTvService.downloadAndCacheImage(
                            backdropUrl,
                            "tv_${tvdbId}_backdrop.jpg"
                        )
                        if (cachedBackdrop != null) {
                            finalBackdropPath = cachedBackdrop
                        }
                    }
                }

                // Update metadata with new artwork
                val updatedMetadata = existingMetadata.copy(
                    coverImagePath = finalPosterPath ?: existingMetadata.coverImagePath,
                    backdropImagePath = finalBackdropPath ?: existingMetadata.backdropImagePath,
                    metadataSource = "fanart.tv",
                    lastUpdated = System.currentTimeMillis()
                )

                metadataDao.updateMetadata(updatedMetadata)
                Log.d(TAG, "Enhanced TV show artwork for item $itemId with Fanart.tv")
                true
            } catch (e: Exception) {
                Log.e(TAG, "Error enhancing TV show artwork for item $itemId", e)
                false
            }
        }
    }

    /**
     * Enhance artist artwork using Fanart.tv
     * @param itemId The media item ID
     * @param musicBrainzId The MusicBrainz artist ID
     * @param downloadAndCache Whether to download and cache the images locally
     * @return true if artwork was enhanced, false otherwise
     */
    suspend fun enhanceArtistArtwork(
        itemId: Long,
        musicBrainzId: String,
        downloadAndCache: Boolean = true
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                if (!fanartTvService.isEnabled()) {
                    Log.d(TAG, "Fanart.tv is not enabled, skipping artwork enhancement")
                    return@withContext false
                }

                val fanart = fanartTvService.fetchArtistFanart(musicBrainzId)
                if (fanart == null) {
                    Log.d(TAG, "No fanart found for artist MBID $musicBrainzId")
                    return@withContext false
                }

                val (thumbUrl, backgroundUrl) = fanart
                
                // Get existing metadata
                val existingMetadata = metadataDao.getMetadataCommonByItemId(itemId)
                if (existingMetadata == null) {
                    Log.w(TAG, "No metadata found for item ID $itemId")
                    return@withContext false
                }

                // Download and cache images if requested
                var finalThumbPath = thumbUrl
                var finalBackgroundPath = backgroundUrl

                if (downloadAndCache) {
                    if (thumbUrl != null) {
                        val cachedThumb = fanartTvService.downloadAndCacheImage(
                            thumbUrl,
                            "artist_${musicBrainzId}_thumb.jpg"
                        )
                        if (cachedThumb != null) {
                            finalThumbPath = cachedThumb
                        }
                    }

                    if (backgroundUrl != null) {
                        val cachedBackground = fanartTvService.downloadAndCacheImage(
                            backgroundUrl,
                            "artist_${musicBrainzId}_background.jpg"
                        )
                        if (cachedBackground != null) {
                            finalBackgroundPath = cachedBackground
                        }
                    }
                }

                // Update metadata with new artwork
                val updatedMetadata = existingMetadata.copy(
                    coverImagePath = finalThumbPath ?: existingMetadata.coverImagePath,
                    backdropImagePath = finalBackgroundPath ?: existingMetadata.backdropImagePath,
                    metadataSource = "fanart.tv",
                    lastUpdated = System.currentTimeMillis()
                )

                metadataDao.updateMetadata(updatedMetadata)
                Log.d(TAG, "Enhanced artist artwork for item $itemId with Fanart.tv")
                true
            } catch (e: Exception) {
                Log.e(TAG, "Error enhancing artist artwork for item $itemId", e)
                false
            }
        }
    }

    /**
     * Enhance album artwork using Fanart.tv
     * @param itemId The media item ID
     * @param albumMbid The MusicBrainz release-group ID
     * @param downloadAndCache Whether to download and cache the images locally
     * @return true if artwork was enhanced, false otherwise
     */
    suspend fun enhanceAlbumArtwork(
        itemId: Long,
        albumMbid: String,
        downloadAndCache: Boolean = true
    ): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                if (!fanartTvService.isEnabled()) {
                    Log.d(TAG, "Fanart.tv is not enabled, skipping artwork enhancement")
                    return@withContext false
                }

                val coverUrl = fanartTvService.fetchAlbumFanart(albumMbid)
                if (coverUrl == null) {
                    Log.d(TAG, "No fanart found for album MBID $albumMbid")
                    return@withContext false
                }

                // Get existing metadata
                val existingMetadata = metadataDao.getMetadataCommonByItemId(itemId)
                if (existingMetadata == null) {
                    Log.w(TAG, "No metadata found for item ID $itemId")
                    return@withContext false
                }

                // Download and cache image if requested
                var finalCoverPath = coverUrl

                if (downloadAndCache) {
                    val cachedCover = fanartTvService.downloadAndCacheImage(
                        coverUrl,
                        "album_${albumMbid}_cover.jpg"
                    )
                    if (cachedCover != null) {
                        finalCoverPath = cachedCover
                    }
                }

                // Update metadata with new artwork
                val updatedMetadata = existingMetadata.copy(
                    coverImagePath = finalCoverPath,
                    metadataSource = "fanart.tv",
                    lastUpdated = System.currentTimeMillis()
                )

                metadataDao.updateMetadata(updatedMetadata)
                Log.d(TAG, "Enhanced album artwork for item $itemId with Fanart.tv")
                true
            } catch (e: Exception) {
                Log.e(TAG, "Error enhancing album artwork for item $itemId", e)
                false
            }
        }
    }

    /**
     * Batch enhance artwork for multiple items
     * @param items List of (itemId, externalId, type) tuples
     * @return Number of items successfully enhanced
     */
    suspend fun batchEnhanceArtwork(
        items: List<Triple<Long, String, ArtworkType>>
    ): Int {
        return withContext(Dispatchers.IO) {
            var successCount = 0
            items.forEachIndexed { index, (itemId, externalId, type) ->
                // Add throttling to respect Fanart.tv's 2 requests/second limit
                if (index > 0) {
                    kotlinx.coroutines.delay(600) // 600ms delay = ~1.67 req/sec (safe margin)
                }
                
                val success = when (type) {
                    ArtworkType.MOVIE -> enhanceMovieArtwork(itemId, externalId)
                    ArtworkType.TV_SHOW -> enhanceTvArtwork(itemId, externalId)
                    ArtworkType.ARTIST -> enhanceArtistArtwork(itemId, externalId)
                    ArtworkType.ALBUM -> enhanceAlbumArtwork(itemId, externalId)
                }
                if (success) successCount++
            }
            Log.d(TAG, "Batch enhanced $successCount of ${items.size} items")
            successCount
        }
    }
}

/**
 * Types of artwork that can be enhanced
 */
enum class ArtworkType {
    MOVIE,
    TV_SHOW,
    ARTIST,
    ALBUM
}
