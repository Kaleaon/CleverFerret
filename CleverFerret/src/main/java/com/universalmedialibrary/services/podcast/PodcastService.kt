package com.universalmedialibrary.services.podcast

import android.content.Context
import android.content.SharedPreferences
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import com.google.gson.annotations.SerializedName
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.services.integration.api.ApplePodcastsApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import org.jsoup.parser.Parser
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Path
import retrofit2.http.Query
import kotlin.text.Charsets
import java.io.File
import java.io.FileOutputStream
import java.net.URL
import java.security.MessageDigest
import java.text.SimpleDateFormat
import java.util.*
import com.universalmedialibrary.utils.FileNameSanitizer
import javax.inject.Inject
import javax.inject.Singleton

// Podcast, PodcastEpisode, PodcastSearchResult models are defined in PodcastModels.kt

data class ChapterMark(
    val title: String,
    val startTime: Long, // in seconds
    val url: String? = null
)

// RSS/XML parsing models
data class RSSFeed(
    val title: String,
    val description: String,
    val link: String,
    val imageUrl: String?,
    val language: String?,
    val author: String?,
    val category: String?,
    val explicit: Boolean,
    val items: List<RSSItem>
)

data class RSSItem(
    val title: String,
    val description: String,
    val link: String?,
    val audioUrl: String?,
    val duration: String?,
    val fileSize: Long?,
    val pubDate: String?,
    val guid: String?,
    val episodeNumber: Int?,
    val seasonNumber: Int?,
    val imageUrl: String?
)

// Comprehensive Podcast APIs - covering all major services
interface PodcastIndexApi {
    @GET("search/byterm")
    suspend fun searchPodcasts(
        @Query("q") query: String,
        @Query("max") maxResults: Int = 20
    ): PodcastSearchResponse

    @GET("episodes/byfeedurl")
    suspend fun getEpisodesByFeedUrl(
        @Query("url") feedUrl: String,
        @Query("max") maxResults: Int = 100
    ): EpisodeSearchResponse
}

interface ListenNotesApi {
    @GET("search")
    suspend fun searchPodcasts(
        @Query("q") query: String,
        @Query("type") type: String = "podcast",
        @Query("page_size") pageSize: Int = 20
    ): ListenNotesResponse

    @GET("podcasts/{id}")
    suspend fun getPodcastById(@Path("id") id: String): ListenNotesPodcast
}

interface SpotifyPodcastApi {
    @GET("search")
    suspend fun searchPodcasts(
        @Query("q") query: String,
        @Query("type") type: String = "show",
        @Query("limit") limit: Int = 20,
        @Header("Authorization") authorization: String
    ): SpotifySearchResponse

    @GET("shows/{id}")
    suspend fun getPodcastById(
        @Path("id") id: String,
        @Header("Authorization") authorization: String
    ): SpotifyPodcast
}

interface TaddyPodcastApi {
    @GET("search")
    suspend fun searchPodcasts(
        @Query("query") query: String,
        @Query("limit") limit: Int = 20,
        @Header("X-API-KEY") apiKey: String
    ): TaddySearchResponse
}

interface GPodderApi {
    @GET("search.json")
    suspend fun searchPodcasts(
        @Query("q") query: String,
        @Query("max") max: Int = 20
    ): List<GPodderSearchResult>
}

// PodcastIndex.org API responses
data class PodcastSearchResponse(
    val status: String,
    val feeds: List<PodcastSearchFeed>,
    val count: Int
)

    data class PodcastSearchFeed(
        val id: Long,
        val title: String,
        val url: String,
        val originalUrl: String,
        val link: String,
        val description: String,
        val author: String,
        val ownerName: String,
        val image: String,
        val artwork: String,
        val episodeCount: Int,
        val categories: Map<String, String>,
        @SerializedName("podcastGuid")
        val podcastGuid: String? = null,
        val medium: String? = null,
        @SerializedName("newestItemPubdate")
        val newestItemPubdate: Long? = null,
        val funding: List<PodcastFunding>? = null,
        val value: PodcastValue? = null
    )

    data class PodcastFunding(
        val url: String?,
        val value: String?
    )

    data class PodcastValue(
        val model: String?,
        @SerializedName("destinations")
        val destinations: List<PodcastValueDestination>? = null,
        @SerializedName("destination")
        val destinationLegacy: List<PodcastValueDestination>? = null
    )

    data class PodcastValueDestination(
        val name: String?,
        val type: String?,
        val address: String?,
        val split: Int?,
        val fee: Boolean? = null
    )

data class EpisodeSearchResponse(
    val status: String,
    val items: List<PodcastSearchEpisode>,
    val count: Int
)

data class PodcastSearchEpisode(
    val id: Long,
    val title: String,
    val link: String,
    val description: String,
    val guid: String,
    val datePublished: Long,
    val enclosureUrl: String,
    val enclosureType: String,
    val enclosureLength: Long,
    val duration: Int,
    val explicit: Int,
    val episode: Int?,
    val season: Int?,
    val image: String,
    val feedImage: String
)

// Listen Notes API responses
data class ListenNotesResponse(
    val results: List<ListenNotesPodcast>,
    val count: Int,
    val total: Int,
    val next_offset: Int?
)

data class ListenNotesPodcast(
    val id: String,
    val title: String,
    val publisher: String,
    val description: String,
    val image: String,
    val website: String?,
    val rss: String,
    val total_episodes: Int,
    val explicit_content: Boolean,
    val language: String,
    val genres: List<ListenNotesGenre>
)

data class ListenNotesGenre(
    val id: Int,
    val name: String
)

// Spotify API responses
data class SpotifySearchResponse(
    val shows: SpotifyShowsPage
)

data class SpotifyShowsPage(
    val items: List<SpotifyPodcast>,
    val limit: Int,
    val offset: Int,
    val total: Int
)

data class SpotifyPodcast(
    val id: String,
    val name: String,
    val publisher: String,
    val description: String,
    val images: List<SpotifyImage>,
    val external_urls: SpotifyExternalUrls,
    val total_episodes: Int,
    val explicit: Boolean,
    val languages: List<String>
)

data class SpotifyImage(
    val url: String,
    val height: Int?,
    val width: Int?
)

data class SpotifyExternalUrls(
    val spotify: String
)

// Taddy API responses
data class TaddySearchResponse(
    val results: List<TaddyPodcast>,
    val count: Int
)

data class TaddyPodcast(
    val uuid: String,
    val name: String,
    val author: String,
    val description: String,
    val imageUrl: String,
    val feedUrl: String,
    val episodeCount: Int,
    val categories: List<String>
)

data class GPodderSearchResult(
    val title: String?,
    val url: String?,
    val description: String?,
    val website: String?,
    val subscribers: Int?,
    @SerializedName("subscribers_last_week")
    val subscribersLastWeek: Int?
)

private data class PodcastIndexCredentials(
    val apiKey: String,
    val apiSecret: String
)

/**
 * Podcast service for RSS feed operations and API searches
 * Now works with PodcastRepository for persistence
 */
@Singleton
class PodcastService @Inject constructor(
    @dagger.hilt.android.qualifiers.ApplicationContext private val context: Context,
    private val podcastRepository: com.universalmedialibrary.data.repository.podcast.PodcastRepository,
    private val applePodcastsApi: ApplePodcastsApi,
    private val fileNameSanitizer: FileNameSanitizer
) {

    private val httpClient = OkHttpClient.Builder().build()

    private val apiKeyPreferences: SharedPreferences by lazy {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()

        EncryptedSharedPreferences.create(
            context,
            "api_keys_encrypted",
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }

    private val userAgent: String by lazy {
        "CleverFerret/${BuildConfig.VERSION_NAME} (PodcastService)"
    }

    private val podcastIndexApi: PodcastIndexApi by lazy {
        buildPodcastIndexApi(null)
    }

    private val listenNotesApi: ListenNotesApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://listen-api.listennotes.com/api/v2/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(httpClient)
            .build()
            .create(ListenNotesApi::class.java)
    }

    private val spotifyApi: SpotifyPodcastApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://api.spotify.com/v1/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(httpClient)
            .build()
            .create(SpotifyPodcastApi::class.java)
    }

    private val taddyApi: TaddyPodcastApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://api.taddy.org/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(httpClient)
            .build()
            .create(TaddyPodcastApi::class.java)
    }

    private val gPodderApi: GPodderApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://gpodder.net/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(httpClient)
            .build()
            .create(GPodderApi::class.java)
    }

    /**
     * Comprehensive podcast search across ALL major directories
     * Matches and exceeds Calibre's podcast discovery capabilities
     */
    suspend fun searchPodcasts(
        query: String,
        apiKeys: Map<String, String> = emptyMap()
    ): List<PodcastSearchResult> {
        return withContext(Dispatchers.IO) {
            val resolvedApiKeys = if (apiKeys.isEmpty()) {
                loadStoredPodcastApiKeys()
            } else {
                apiKeys
            }
            val podcastIndexCredentials = parsePodcastIndexCredentials(resolvedApiKeys)
            val allResults = mutableListOf<PodcastSearchResult>()

            // 1. PodcastIndex.org (free, no key required)
            try {
                val podcastIndexResults = searchPodcastIndex(query, podcastIndexCredentials)
                allResults.addAll(podcastIndexResults)
            } catch (e: Exception) {
                // Continue with other sources
            }

            // 2. iTunes/Apple Podcasts (free, largest directory)
            try {
                val iTunesResults = searchiTunesPodcasts(query)
                allResults.addAll(iTunesResults)
            } catch (e: Exception) {
                // Continue with other sources
            }

            // 3. Listen Notes (requires API key, most comprehensive)
            try {
                resolvedApiKeys["listen_notes"]?.let { key ->
                    val listenNotesResults = searchListenNotes(query, key)
                    allResults.addAll(listenNotesResults)
                }
            } catch (e: Exception) {
                // Continue with other sources
            }

            // 4. Spotify (requires OAuth token)
            try {
                resolvedApiKeys["spotify_token"]?.let { token ->
                    val spotifyResults = searchSpotifyPodcasts(query, token)
                    allResults.addAll(spotifyResults)
                }
            } catch (e: Exception) {
                // Continue with other sources
            }

            // 5. Taddy (requires API key, has webhooks)
            try {
                resolvedApiKeys["taddy"]?.let { key ->
                    val taddyResults = searchTaddyPodcasts(query, key)
                    allResults.addAll(taddyResults)
                }
            } catch (e: Exception) {
                // Continue with other sources
            }

            // 6. gpodder.net (open directory with community stats)
            try {
                val gpodderResults = searchGPodderPodcasts(query)
                allResults.addAll(gpodderResults)
            } catch (e: Exception) {
                // Continue with other sources
            }

            // Remove duplicates based on feed URL and title similarity
            deduplicatePodcastResults(allResults)
        }
    }

    private fun loadStoredPodcastApiKeys(): Map<String, String> {
        val keys = mutableMapOf<String, String>()
        listOf(
            "podcast_index",
            "podcast_index_key",
            "podcast_index_secret",
            "listen_notes",
            "spotify_token",
            "taddy"
        ).forEach { key ->
            getStoredApiKey(key)?.let { keys[key] = it }
        }
        return keys
    }

    private fun getStoredApiKey(key: String): String? =
        apiKeyPreferences.getString(key, null)?.takeIf { it.isNotBlank() }

    private fun parsePodcastIndexCredentials(apiKeys: Map<String, String>): PodcastIndexCredentials? {
        val combined = parsePodcastIndexCredentialsString(apiKeys["podcast_index"])
        val key = apiKeys["podcast_index_key"] ?: combined?.apiKey
        val secret = apiKeys["podcast_index_secret"] ?: combined?.apiSecret

        return if (!key.isNullOrBlank() && !secret.isNullOrBlank()) {
            PodcastIndexCredentials(key.trim(), secret.trim())
        } else {
            null
        }
    }

    private fun parsePodcastIndexCredentialsString(raw: String?): PodcastIndexCredentials? {
        if (raw.isNullOrBlank()) return null
        val tokens = raw.split(':', '|', ';', ',', '\n', '\r', '\t', ' ')
            .map { it.trim() }
            .filter { it.isNotEmpty() }
        return if (tokens.size >= 2) {
            PodcastIndexCredentials(tokens[0], tokens[1])
        } else {
            null
        }
    }

    private fun buildPodcastIndexApi(credentials: PodcastIndexCredentials?): PodcastIndexApi {
        val client = httpClient.newBuilder()
            .addInterceptor { chain ->
                val requestBuilder = chain.request().newBuilder()
                    .addHeader("User-Agent", userAgent)
                    .addHeader("Accept", "application/json")

                credentials?.let {
                    val epochSeconds = (System.currentTimeMillis() / 1000L).toString()
                    val signature = createPodcastIndexAuthorizationSignature(it, epochSeconds)
                    requestBuilder
                        .addHeader("X-Auth-Key", it.apiKey)
                        .addHeader("X-Auth-Date", epochSeconds)
                        .addHeader("Authorization", signature)
                }

                chain.proceed(requestBuilder.build())
            }
            .build()

        return Retrofit.Builder()
            .baseUrl("https://api.podcastindex.org/api/1.0/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(client)
            .build()
            .create(PodcastIndexApi::class.java)
    }

    private fun createPodcastIndexAuthorizationSignature(
        credentials: PodcastIndexCredentials,
        epochSeconds: String
    ): String {
        return sha1(credentials.apiKey + credentials.apiSecret + epochSeconds)
    }

    private fun sha1(input: String): String {
        val digest = MessageDigest.getInstance("SHA-1")
        val hash = digest.digest(input.toByteArray(Charsets.UTF_8))
        return hash.joinToString("") { "%02x".format(it) }
    }

    private suspend fun searchPodcastIndex(
        query: String,
        credentials: PodcastIndexCredentials?
    ): List<PodcastSearchResult> {
        val api = credentials?.let { buildPodcastIndexApi(it) } ?: podcastIndexApi
        val response = api.searchPodcasts(query)
        return response.feeds.map { feed ->
            val newestEpisodeDate = feed.newestItemPubdate?.let { it * 1000 }
            val funding = feed.funding.orEmpty().mapNotNull { fundingItem ->
                val url = fundingItem.url?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
                PodcastFundingInfo(
                    url = url,
                    message = fundingItem.value
                )
            }
            val destinations = feed.value?.destinations ?: feed.value?.destinationLegacy ?: emptyList()
            val valueInfo = feed.value?.let { value ->
                if (destinations.isEmpty()) {
                    null
                } else {
                    PodcastValueInfo(
                        model = value.model,
                        destinations = destinations.map { destination ->
                            PodcastValueDestinationInfo(
                                name = destination.name,
                                type = destination.type,
                                address = destination.address,
                                split = destination.split,
                                fee = destination.fee
                            )
                        }
                    )
                }
            }
            PodcastSearchResult(
                id = "pi_${feed.id}",
                title = feed.title,
                author = feed.author.ifEmpty { feed.ownerName },
                description = feed.description,
                feedUrl = feed.url,
                imageUrl = feed.image.ifEmpty { feed.artwork },
                episodeCount = feed.episodeCount,
                category = feed.categories.values.firstOrNull(),
                lastEpisodeDate = newestEpisodeDate,
                source = "podcast_index",
                guid = feed.podcastGuid,
                funding = funding,
                value = valueInfo,
                medium = feed.medium
            )
        }
    }

    private suspend fun searchiTunesPodcasts(query: String): List<PodcastSearchResult> {
        val response = applePodcastsApi.searchPodcasts(query)
        return response.results.map { podcast ->
            PodcastSearchResult(
                id = "itunes_${podcast.trackId}",
                title = podcast.trackName,
                author = podcast.artistName,
                description = podcast.collectionName ?: "",
                feedUrl = podcast.feedUrl,
                imageUrl = podcast.artworkUrl600
                    ?: podcast.artworkUrl100
                    ?: podcast.artworkUrl60
                    ?: podcast.artworkUrl30,
                episodeCount = podcast.trackCount,
                category = podcast.primaryGenreName,
                lastEpisodeDate = null, // Not available in search results
                source = "itunes"
            )
        }
    }

    private suspend fun searchListenNotes(query: String, apiKey: String): List<PodcastSearchResult> {
        val client = httpClient.newBuilder()
            .addInterceptor { chain ->
                val request = chain.request().newBuilder()
                    .addHeader("X-ListenAPI-Key", apiKey)
                    .build()
                chain.proceed(request)
            }
            .build()

        val apiWithAuth = Retrofit.Builder()
            .baseUrl("https://listen-api.listennotes.com/api/v2/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(client)
            .build()
            .create(ListenNotesApi::class.java)

        val response = apiWithAuth.searchPodcasts(query)
        return response.results.map { podcast ->
            PodcastSearchResult(
                id = "ln_${podcast.id}",
                title = podcast.title,
                author = podcast.publisher,
                description = podcast.description,
                feedUrl = podcast.rss,
                imageUrl = podcast.image,
                episodeCount = podcast.total_episodes,
                category = podcast.genres.firstOrNull()?.name,
                lastEpisodeDate = null, // Not consistently available
                source = "listennotes"
            )
        }
    }

    private suspend fun searchSpotifyPodcasts(query: String, token: String): List<PodcastSearchResult> {
        val response = spotifyApi.searchPodcasts(query, authorization = "Bearer $token")
        return response.shows.items.map { show ->
            PodcastSearchResult(
                id = "spotify_${show.id}",
                title = show.name,
                author = show.publisher,
                description = show.description,
                feedUrl = "", // Spotify doesn't provide RSS feeds
                imageUrl = show.images.firstOrNull()?.url,
                episodeCount = show.total_episodes,
                category = null,
                lastEpisodeDate = null,
                source = "spotify"
            )
        }
    }

    private suspend fun searchTaddyPodcasts(query: String, apiKey: String): List<PodcastSearchResult> {
        val response = taddyApi.searchPodcasts(query, apiKey = apiKey)
        return response.results.map { podcast ->
            PodcastSearchResult(
                id = "taddy_${podcast.uuid}",
                title = podcast.name,
                author = podcast.author,
                description = podcast.description,
                feedUrl = podcast.feedUrl,
                imageUrl = podcast.imageUrl,
                episodeCount = podcast.episodeCount,
                category = podcast.categories.firstOrNull(),
                lastEpisodeDate = null,
                source = "taddy"
            )
        }
    }

    private suspend fun searchGPodderPodcasts(query: String): List<PodcastSearchResult> {
        val response = gPodderApi.searchPodcasts(query)
        return response.mapNotNull { podcast ->
            val feedUrl = podcast.url?.takeIf { it.isNotBlank() } ?: return@mapNotNull null
            val descriptionBuilder = StringBuilder()
            if (!podcast.description.isNullOrBlank()) {
                descriptionBuilder.append(podcast.description.trim())
            }
            if (!podcast.website.isNullOrBlank()) {
                if (descriptionBuilder.isNotEmpty()) {
                    descriptionBuilder.append("\n")
                }
                descriptionBuilder.append("Website: ").append(podcast.website)
            }

            PodcastSearchResult(
                id = "gpodder_${feedUrl.hashCode()}",
                title = podcast.title?.takeIf { it.isNotBlank() } ?: feedUrl,
                author = null,
                description = descriptionBuilder.toString().ifBlank { null },
                feedUrl = feedUrl,
                imageUrl = null,
                episodeCount = podcast.subscribers,
                category = null,
                lastEpisodeDate = null,
                source = "gpodder"
            )
        }
    }

    private fun deduplicatePodcastResults(results: List<PodcastSearchResult>): List<PodcastSearchResult> {
        // Group by feed URL first (most accurate)
        val byFeedUrl = results.groupBy { it.feedUrl.lowercase() }
        val deduplicated = mutableListOf<PodcastSearchResult>()

        byFeedUrl.forEach { (feedUrl, podcasts) ->
            if (feedUrl.isNotEmpty()) {
                // Take the result with most complete information
                val best = podcasts.maxByOrNull {
                    (if (it.description?.isNotEmpty() == true) 1 else 0) +
                    (if (it.imageUrl != null) 1 else 0) +
                    (if (it.category != null) 1 else 0) +
                    (it.episodeCount ?: 0)
                }
                best?.let { deduplicated.add(it) }
            } else {
                // For results without feed URLs (like Spotify), add all
                deduplicated.addAll(podcasts)
            }
        }

        // Additional deduplication by title similarity for remaining items
        return deduplicated.distinctBy { it.title.lowercase().trim() }
    }

    /**
     * Subscribe to a podcast by RSS feed URL
     */
    suspend fun subscribeToPodcast(feedUrl: String): Podcast? {
        return withContext(Dispatchers.IO) {
            try {
                val rssFeed = parseRSSFeed(feedUrl)
                val tempPodcastId = generatePodcastId(feedUrl)

                val podcast = Podcast(
                    id = tempPodcastId,
                    title = rssFeed.title,
                    description = rssFeed.description,
                    author = rssFeed.author ?: "Unknown",
                    feedUrl = feedUrl,
                    websiteUrl = rssFeed.link,
                    imageUrl = rssFeed.imageUrl,
                    category = rssFeed.category,
                    language = rssFeed.language ?: "en",
                    subscribed = true,
                    lastUpdated = System.currentTimeMillis(),
                    episodeCount = rssFeed.items.size,
                    explicit = rssFeed.explicit
                )

                // Store podcast in database via Repository
                val newPodcastId = podcastRepository.insertPodcast(podcast)
                val episodes = convertRSSItemsToEpisodes(rssFeed.items, newPodcastId)
                for (episode in episodes) {
                    podcastRepository.updateEpisode(episode)
                }

                podcast.copy(id = newPodcastId)
            } catch (e: Exception) {
                null
            }
        }
    }

    /**
     * Check for new episodes in subscribed podcasts
     */
    suspend fun checkForNewEpisodes(podcast: Podcast): List<PodcastEpisode> {
        return withContext(Dispatchers.IO) {
            try {
                val rssFeed = parseRSSFeed(podcast.feedUrl)
                val currentEpisodes = convertRSSItemsToEpisodes(rssFeed.items, podcast.id)

                // Find new episodes not in the existing list via Repository
                val existingEpisodes = podcastRepository.getEpisodesByPodcast(podcast.id)
                val existingGuids = existingEpisodes.firstOrNull()?.map { it.guid }?.toSet() ?: emptySet()
                currentEpisodes.filter { it.guid !in existingGuids }
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    /**
     * Download a podcast episode
     */
    suspend fun downloadEpisode(episode: PodcastEpisode, podcastTitle: String): String? {
        return withContext(Dispatchers.IO) {
            try {
                val request = Request.Builder().url(episode.audioUrl).build()
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) return@withContext null

                    // Create download directory
                    val podcastDir = File(context.getExternalFilesDir("podcasts"), sanitizeFileName(podcastTitle))
                    podcastDir.mkdirs()

                    // Generate filename
                    val fileName = "${sanitizeFileName(episode.title)}.${getFileExtension(episode.audioUrl)}"
                    val file = File(podcastDir, fileName)

                    // Download file
                    response.body?.byteStream()?.use { input ->
                        FileOutputStream(file).use { output ->
                            input.copyTo(output)
                        }
                    }

                    file.absolutePath
                }
            } catch (e: Exception) {
                null
            }
        }
    }

    /**
     * Get episode transcripts (if available)
     */
    suspend fun getEpisodeTranscript(episode: PodcastEpisode): String? {
        return withContext(Dispatchers.IO) {
            try {
                // Many podcasts include transcript URLs in their RSS feeds
                // This would need specific parsing for different podcast providers
                null
            } catch (e: Exception) {
                null
            }
        }
    }

    /**
     * Parse RSS feed from URL (public for repository access)
     */
    suspend fun parseRSSFeed(feedUrl: String): RSSFeed {
        val request = Request.Builder().url(feedUrl).build()
        val xml = httpClient.newCall(request).execute().use { response ->
            response.body?.string() ?: throw Exception("Empty RSS feed")
        }

        val doc = Jsoup.parse(xml, "", Parser.xmlParser())

        // Parse channel info
        val channel = doc.select("channel").first()
            ?: throw Exception("Invalid RSS feed - no channel found")

        val title = channel.select("title").text()
        val description = channel.select("description").text()
        val link = channel.select("link").text()
        val imageUrl = channel.select("image url").text().ifEmpty {
            channel.select("itunes|image").attr("href")
        }
        val language = channel.select("language").text()
        val author = channel.select("itunes|author").text().ifEmpty {
            channel.select("managingEditor").text()
        }
        val category = channel.select("itunes|category").attr("text")
        val explicit = channel.select("itunes|explicit").text().equals("yes", true)

        // Parse episodes
        val items = channel.select("item").map { item ->
            RSSItem(
                title = item.select("title").text(),
                description = item.select("description").text(),
                link = item.select("link").text(),
                audioUrl = item.select("enclosure").attr("url"),
                duration = item.select("itunes|duration").text(),
                fileSize = item.select("enclosure").attr("length").toLongOrNull(),
                pubDate = item.select("pubDate").text(),
                guid = item.select("guid").text().ifEmpty { item.select("link").text() },
                episodeNumber = item.select("itunes|episode").text().toIntOrNull(),
                seasonNumber = item.select("itunes|season").text().toIntOrNull(),
                imageUrl = item.select("itunes|image").attr("href")
            )
        }.filter { !it.audioUrl.isNullOrEmpty() } // Only include items with audio

        return RSSFeed(
            title = title,
            description = description,
            link = link,
            imageUrl = imageUrl,
            language = language,
            author = author,
            category = category,
            explicit = explicit,
            items = items
        )
    }

    /**
     * Convert RSS items to podcast episodes
     */
    private fun convertRSSItemsToEpisodes(items: List<RSSItem>, podcastId: Long): List<PodcastEpisode> {
        val dateFormat = SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH)

        return items.mapIndexed { index, item ->
            val publishDate = try {
                dateFormat.parse(item.pubDate ?: "")?.time
            } catch (e: Exception) {
                System.currentTimeMillis() // Fallback to current time
            } ?: System.currentTimeMillis()

            val duration = parseDuration(item.duration)

            PodcastEpisode(
                id = 0, // Auto-generated by database
                podcastId = podcastId,
                guid = item.guid ?: "${podcastId}_$index",
                title = item.title,
                description = item.description,
                audioUrl = item.audioUrl ?: "",
                duration = duration,
                fileSize = item.fileSize ?: 0,
                publishDate = publishDate,
                episodeNumber = item.episodeNumber,
                seasonNumber = item.seasonNumber,
                imageUrl = item.imageUrl
            )
        }
    }

    /**
     * Search podcasts by RSS discovery (fallback method)
     */
    private suspend fun searchPodcastsByRSSDiscovery(query: String): List<PodcastSearchResult> {
        // This would implement RSS feed discovery from popular podcast directories
        // For now, return empty list
        return emptyList()
    }

    /**
     * Parse duration string (HH:MM:SS or seconds)
     */
    private fun parseDuration(durationStr: String?): Long {
        if (durationStr.isNullOrEmpty()) return 0L

        return try {
            if (durationStr.contains(":")) {
                val parts = durationStr.split(":")
                when (parts.size) {
                    3 -> { // HH:MM:SS
                        val hours = parts[0].toLong()
                        val minutes = parts[1].toLong()
                        val seconds = parts[2].toLong()
                        hours * 3600 + minutes * 60 + seconds
                    }
                    2 -> { // MM:SS
                        val minutes = parts[0].toLong()
                        val seconds = parts[1].toLong()
                        minutes * 60 + seconds
                    }
                    else -> 0L
                }
            } else {
                // Assume it's seconds
                durationStr.toLongOrNull() ?: 0L
            }
        } catch (e: Exception) {
            0L
        }
    }

    /**
     * Generate podcast ID from feed URL
     */
    private fun generatePodcastId(feedUrl: String): Long {
        return feedUrl.hashCode().toLong().let { if (it < 0) -it else it }
    }

    /**
     * Sanitize filename for file system
     */
    private fun sanitizeFileName(name: String): String {
        return fileNameSanitizer.sanitizeFileName(name)
    }

    /**
     * Get file extension from URL
     */
    private fun getFileExtension(url: String): String {
        return try {
            val path = URL(url).path
            val lastDot = path.lastIndexOf('.')
            if (lastDot > 0 && lastDot < path.length - 1) {
                path.substring(lastDot + 1).lowercase()
            } else {
                "mp3" // Default to mp3
            }
        } catch (e: Exception) {
            "mp3"
        }
    }

    /**
     * Import OPML file (podcast subscription list)
     */
    suspend fun importOPML(opmlContent: String): List<Podcast> {
        return withContext(Dispatchers.IO) {
            try {
                val doc = Jsoup.parse(opmlContent, "", Parser.xmlParser())
                val outlines = doc.select("outline[xmlUrl]")

                outlines.mapNotNull { outline ->
                    val feedUrl = outline.attr("xmlUrl")
                    if (feedUrl.isNotEmpty()) {
                        subscribeToPodcast(feedUrl)
                    } else null
                }
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    /**
     * Export subscribed podcasts to OPML
     */
    fun exportToOPML(podcasts: List<Podcast>): String {
        val opml = StringBuilder()
        opml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
        opml.append("<opml version=\"2.0\">\n")
        opml.append("  <head>\n")
        opml.append("    <title>CleverFerret Podcast Subscriptions</title>\n")
        opml.append("    <dateCreated>${Date()}</dateCreated>\n")
        opml.append("  </head>\n")
        opml.append("  <body>\n")

        podcasts.forEach { podcast ->
            opml.append("    <outline text=\"${escapeXml(podcast.title)}\" ")
            opml.append("title=\"${escapeXml(podcast.title)}\" ")
            opml.append("type=\"rss\" ")
            opml.append("xmlUrl=\"${escapeXml(podcast.feedUrl)}\" ")
            if (podcast.websiteUrl != null) {
                opml.append("htmlUrl=\"${escapeXml(podcast.websiteUrl)}\" ")
            }
            opml.append("/>\n")
        }

        opml.append("  </body>\n")
        opml.append("</opml>")

        return opml.toString()
    }

    private fun escapeXml(text: String): String {
        return text
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&apos;")
    }
}
