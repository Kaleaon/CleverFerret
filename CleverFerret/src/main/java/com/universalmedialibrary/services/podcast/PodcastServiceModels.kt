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
import java.net.URI
import java.net.URISyntaxException
import java.net.URL
import java.security.MessageDigest
import java.text.SimpleDateFormat
import java.util.*
import com.universalmedialibrary.utils.FileNameSanitizer
import com.universalmedialibrary.services.ingestion.IngestionPipeline
import javax.inject.Inject
import javax.inject.Singleton

data class ChapterMark(
    val title: String,
    val startTime: Long, // in seconds
    val url: String? = null
)
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
data class PodcastSearchResponse(
    val status: String,
    val feeds: List<PodcastSearchFeed>,
    val count: Int
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
