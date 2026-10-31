package com.universalmedialibrary.services.exoplayer

import android.content.Context
import androidx.annotation.OptIn
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DefaultDataSource
import androidx.media3.datasource.DefaultHttpDataSource
import androidx.media3.datasource.cache.CacheDataSource
import androidx.media3.datasource.cache.LeastRecentlyUsedCacheEvictor
import androidx.media3.datasource.cache.SimpleCache
import com.universalmedialibrary.services.cache.MediaCacheManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.runBlocking
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized ExoPlayer MediaSource Cache Factory.
 *
 * Provides a Media3 [CacheDataSource.Factory] backed by a singleton [SimpleCache]
 * situated in [MediaCacheManager]'s dedicated media directory.
 * Configures [DefaultHttpDataSource.Factory] with authentication headers for remote streams
 * (Plex, Jellyfin, Emby) and enforces the 500 MB cache limit.
 */
@Singleton
@OptIn(UnstableApi::class)
class ExoPlayerCacheFactory @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaCacheManager: MediaCacheManager
) {
    private var simpleCache: SimpleCache? = null

    /**
     * Obtains or initializes the singleton [SimpleCache] instance.
     */
    @Synchronized
    fun getSimpleCache(): SimpleCache {
        return simpleCache ?: run {
            val mediaDir = try {
                runBlocking { mediaCacheManager.getMediaCacheDirectory() }
            } catch (e: Throwable) {
                File(context.cacheDir, "media").apply { if (!exists()) mkdirs() }
            }
            if (!mediaDir.exists()) {
                mediaDir.mkdirs()
            }
            val evictor = LeastRecentlyUsedCacheEvictor(MediaCacheManager.MIN_SAFETY_STORAGE_BYTES)
            val cache = SimpleCache(mediaDir, evictor)
            simpleCache = cache
            cache
        }
    }

    /**
     * Creates a new [CacheDataSource.Factory] configured with upstream [DefaultHttpDataSource.Factory]
     * using the provided HTTP request headers (e.g. server authentication tokens).
     */
    fun createCacheDataSourceFactory(
        headers: Map<String, String> = emptyMap()
    ): DataSource.Factory {
        val httpDataSourceFactory = DefaultHttpDataSource.Factory()
            .setAllowCrossProtocolRedirects(true)
            .setDefaultRequestProperties(headers)

        val upstreamFactory = DefaultDataSource.Factory(context, httpDataSourceFactory)

        val cache = getSimpleCache()
        return CacheDataSource.Factory()
            .setCache(cache)
            .setUpstreamDataSourceFactory(upstreamFactory)
            .setFlags(CacheDataSource.FLAG_IGNORE_CACHE_ON_ERROR)
    }

    /**
     * Release cache resources if active.
     */
    @Synchronized
    fun release() {
        simpleCache?.release()
        simpleCache = null
    }
}
