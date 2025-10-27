package com.universalmedialibrary.services.integration

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.integration.api.ApiManager
import com.universalmedialibrary.services.integration.api.FanartTvApi
import com.universalmedialibrary.services.integration.api.FanartImage
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for fetching fanart from Fanart.tv
 * 
 * Provides high-quality artwork for movies, TV shows, music, and more.
 */
@Singleton
class FanartTvService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiManager: ApiManager,
    private val apiKeyRepository: APIKeyRepository
) {
    private val api: FanartTvApi by lazy { apiManager.createFanartTvApi() }
    
    // Reusable OkHttpClient for image downloads with proper timeouts
    private val downloadClient: OkHttpClient by lazy {
        OkHttpClient.Builder()
            .connectTimeout(30, TimeUnit.SECONDS)
            .readTimeout(60, TimeUnit.SECONDS)
            .build()
    }
    
    companion object {
        private const val TAG = "FanartTvService"
        private const val CACHE_DIR = "fanart_cache"
    }

    /**
     * Get the Fanart.tv API key from the repository
     */
    private suspend fun getApiKey(): String? {
        return apiKeyRepository.getAPIKeyValue("fanart_tv")
    }

    /**
     * Check if Fanart.tv API is enabled and has a valid API key
     */
    suspend fun isEnabled(): Boolean {
        val apiKey = getApiKey()
        return !apiKey.isNullOrBlank()
    }

    /**
     * Fetch movie fanart by TMDb ID
     * @param tmdbId The Movie Database ID
     * @return Pair of (posterUrl, backdropUrl) or null if not found
     */
    suspend fun fetchMovieFanart(tmdbId: String): Pair<String?, String?>? {
        return withContext(Dispatchers.IO) {
            try {
                val apiKey = getApiKey()
                if (apiKey.isNullOrBlank()) {
                    Log.w(TAG, "Fanart.tv API key not configured")
                    return@withContext null
                }

                val response = api.getMovieFanart(tmdbId, apiKey)
                
                // Get the best poster and background
                val posterUrl = getBestImage(response.moviePosters)
                val backdropUrl = getBestImage(response.movieBackgrounds)
                
                Log.d(TAG, "Fetched movie fanart for TMDb ID $tmdbId: poster=$posterUrl, backdrop=$backdropUrl")
                Pair(posterUrl, backdropUrl)
            } catch (e: Exception) {
                Log.e(TAG, "Error fetching movie fanart for TMDb ID $tmdbId", e)
                null
            }
        }
    }

    /**
     * Fetch TV show fanart by TheTVDB ID
     * @param tvdbId The TVDB ID
     * @return Pair of (posterUrl, backdropUrl) or null if not found
     */
    suspend fun fetchTvFanart(tvdbId: String): Pair<String?, String?>? {
        return withContext(Dispatchers.IO) {
            try {
                val apiKey = getApiKey()
                if (apiKey.isNullOrBlank()) {
                    Log.w(TAG, "Fanart.tv API key not configured")
                    return@withContext null
                }

                val response = api.getTvFanart(tvdbId, apiKey)
                
                // Get the best poster and background
                val posterUrl = getBestImage(response.tvPosters)
                val backdropUrl = getBestImage(response.showBackgrounds)
                
                Log.d(TAG, "Fetched TV fanart for TVDB ID $tvdbId: poster=$posterUrl, backdrop=$backdropUrl")
                Pair(posterUrl, backdropUrl)
            } catch (e: Exception) {
                Log.e(TAG, "Error fetching TV fanart for TVDB ID $tvdbId", e)
                null
            }
        }
    }

    /**
     * Fetch artist fanart by MusicBrainz ID
     * @param mbid The MusicBrainz artist ID
     * @return Pair of (thumbUrl, backgroundUrl) or null if not found
     */
    suspend fun fetchArtistFanart(mbid: String): Pair<String?, String?>? {
        return withContext(Dispatchers.IO) {
            try {
                val apiKey = getApiKey()
                if (apiKey.isNullOrBlank()) {
                    Log.w(TAG, "Fanart.tv API key not configured")
                    return@withContext null
                }

                val response = api.getArtistFanart(mbid, apiKey)
                
                // Get the best thumb and background
                val thumbUrl = getBestImage(response.artistThumbs)
                val backgroundUrl = getBestImage(response.artistBackgrounds)
                
                Log.d(TAG, "Fetched artist fanart for MBID $mbid: thumb=$thumbUrl, background=$backgroundUrl")
                Pair(thumbUrl, backgroundUrl)
            } catch (e: Exception) {
                Log.e(TAG, "Error fetching artist fanart for MBID $mbid", e)
                null
            }
        }
    }

    /**
     * Fetch album fanart by MusicBrainz release-group ID
     * @param albumMbid The MusicBrainz release-group ID
     * @return Album cover URL or null if not found
     */
    suspend fun fetchAlbumFanart(albumMbid: String): String? {
        return withContext(Dispatchers.IO) {
            try {
                val apiKey = getApiKey()
                if (apiKey.isNullOrBlank()) {
                    Log.w(TAG, "Fanart.tv API key not configured")
                    return@withContext null
                }

                val response = api.getAlbumFanart(albumMbid, apiKey)
                
                // Get the best album cover
                val coverUrl = getBestImage(response.albumCovers)
                
                Log.d(TAG, "Fetched album fanart for MBID $albumMbid: cover=$coverUrl")
                coverUrl
            } catch (e: Exception) {
                Log.e(TAG, "Error fetching album fanart for MBID $albumMbid", e)
                null
            }
        }
    }

    /**
     * Download and cache an image from a URL
     * @param imageUrl The URL of the image
     * @param filename The filename to save the image as
     * @return The local file path or null if download failed
     */
    suspend fun downloadAndCacheImage(imageUrl: String, filename: String): String? {
        return withContext(Dispatchers.IO) {
            try {
                // Enforce HTTPS for security
                if (!imageUrl.startsWith("https://", ignoreCase = true)) {
                    Log.w(TAG, "Rejecting non-HTTPS URL: $imageUrl")
                    return@withContext null
                }

                val cacheDir = File(context.cacheDir, CACHE_DIR)
                if (!cacheDir.exists()) {
                    cacheDir.mkdirs()
                }

                // Sanitize filename to prevent path traversal attacks
                val safeName = File(filename).name
                val imageFile = File(cacheDir, safeName)
                
                // Verify the canonical path stays within cache directory
                if (imageFile.canonicalFile.parentFile != cacheDir.canonicalFile) {
                    Log.e(TAG, "Invalid filename: path traversal attempt detected")
                    return@withContext null
                }
                
                // Download using reusable OkHttp client with proper timeouts
                val request = Request.Builder()
                    .url(imageUrl)
                    .build()
                
                downloadClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        Log.w(TAG, "Failed to download image: HTTP ${response.code}")
                        return@withContext null
                    }
                    
                    response.body?.byteStream()?.use { input ->
                        imageFile.outputStream().use { output ->
                            input.copyTo(output)
                        }
                    }
                }
                
                Log.d(TAG, "Downloaded and cached image: $safeName")
                imageFile.absolutePath
            } catch (e: Exception) {
                Log.e(TAG, "Error downloading image from $imageUrl", e)
                null
            }
        }
    }

    /**
     * Get the best quality image from a list of fanart images
     * Prioritizes images with the most likes and English language
     */
    private fun getBestImage(images: List<FanartImage>?): String? {
        if (images.isNullOrEmpty()) return null
        
        // Sort by likes (descending) and prefer English language
        val sorted = images.sortedWith(
            compareByDescending<FanartImage> { it.likes.toIntOrNull() ?: 0 }
                .thenByDescending { it.lang == "en" }
        )
        
        return sorted.firstOrNull()?.url
    }

    /**
     * Clear the fanart cache
     */
    suspend fun clearCache() {
        withContext(Dispatchers.IO) {
            try {
                val cacheDir = File(context.cacheDir, CACHE_DIR)
                if (cacheDir.exists()) {
                    cacheDir.deleteRecursively()
                    Log.d(TAG, "Cleared fanart cache")
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error clearing fanart cache", e)
            }
        }
    }

    /**
     * Get cache size in bytes
     */
    suspend fun getCacheSize(): Long {
        return withContext(Dispatchers.IO) {
            try {
                val cacheDir = File(context.cacheDir, CACHE_DIR)
                if (cacheDir.exists()) {
                    cacheDir.walkTopDown().filter { it.isFile }.map { it.length() }.sum()
                } else {
                    0L
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error getting cache size", e)
                0L
            }
        }
    }
}
