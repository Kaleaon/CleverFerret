package com.universalmedialibrary.services.music.hivefy

import com.universalmedialibrary.data.music.hivefy.SaavnAlbum
import com.universalmedialibrary.data.music.hivefy.SaavnDiscoveryPayload
import com.universalmedialibrary.data.music.hivefy.SaavnLanguage
import com.universalmedialibrary.data.music.hivefy.SaavnPlaylist
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.async
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import kotlinx.coroutines.withContext
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Bridges Hivefy's Saavn discovery features into the CleverFerret domain layer.
 */
@Singleton
class HivefyMusicRepository @Inject constructor(
    private val saavnApiService: SaavnApiService,
    private val htmlFetcher: SaavnHtmlFetcher,
    private val cacheStore: HivefyCacheStore,
    private val json: Json,
    private val ioDispatcher: CoroutineDispatcher,
    private val mediaSyncManager: HivefyMediaSyncManager
) {

    suspend fun loadDiscovery(
        language: SaavnLanguage,
        forceRefresh: Boolean = false
    ): SaavnDiscoveryPayload = withContext(ioDispatcher) {
        val cacheKey = "hivefy_discovery_${language.slug}"
        if (!forceRefresh) {
            val cached = cacheStore.read(cacheKey)
            if (cached != null && isFresh(cached.timestamp)) {
                runCatching { json.decodeFromString<SaavnDiscoveryPayload>(cached.payload) }
                    .getOrNull()
                    ?.let { return@withContext it }
            }
        }

        val playlistLinks = htmlFetcher.fetchFeaturedPlaylistLinks(language, FEATURED_LIMIT)
        val albumLinks = htmlFetcher.fetchNewAlbumLinks(language, FEATURED_LIMIT)

        if (playlistLinks.isEmpty() && albumLinks.isEmpty()) {
            throw IllegalStateException("Failed to fetch Hivefy discovery links for ${language.slug}")
        }

        val playlists = fetchEntities(playlistLinks) { link ->
            saavnApiService.fetchPlaylistByLink(link, SONG_LIMIT_PER_ENTITY)
        }
        val albums = fetchEntities(albumLinks) { link ->
            saavnApiService.fetchAlbumByLink(link, SONG_LIMIT_PER_ENTITY)
        }

        if (playlists.isEmpty() && albums.isEmpty()) {
            throw IllegalStateException("Hivefy discovery returned empty payload for ${language.slug}")
        }

        val payload = SaavnDiscoveryPayload(
            language = language,
            playlists = playlists,
            albums = albums,
            fetchedAtEpochMillis = System.currentTimeMillis()
        )

        cacheStore.write(cacheKey, json.encodeToString(payload))
        runCatching { mediaSyncManager.syncDiscovery(payload) }
        payload
    }

    suspend fun fetchPlaylist(link: String): SaavnPlaylist? =
        saavnApiService.fetchPlaylistByLink(link, SONG_LIMIT_PER_ENTITY)

    suspend fun fetchAlbum(link: String): SaavnAlbum? =
        saavnApiService.fetchAlbumByLink(link, SONG_LIMIT_PER_ENTITY)

    private fun isFresh(timestamp: Long): Boolean {
        if (timestamp <= 0) return false
        return System.currentTimeMillis() - timestamp < CACHE_MAX_AGE_MS
    }

    private suspend fun <T> fetchEntities(
        links: List<String>,
        block: suspend (String) -> T?
    ): List<T> = coroutineScope {
        val semaphore = Semaphore(MAX_CONCURRENT_REQUESTS)
        links.map { link ->
            async(ioDispatcher) {
                semaphore.withPermit { block(link) }
            }
        }.mapNotNull { it.await() }
    }

    private companion object {
        private val CACHE_MAX_AGE_MS = TimeUnit.HOURS.toMillis(24)
        private const val FEATURED_LIMIT = 8
        private const val SONG_LIMIT_PER_ENTITY = 25
        private const val MAX_CONCURRENT_REQUESTS = 3
    }
}
