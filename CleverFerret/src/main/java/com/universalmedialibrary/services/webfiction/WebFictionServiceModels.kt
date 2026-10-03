package com.universalmedialibrary.services.webfiction

import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentPinRequiredException
import com.universalmedialibrary.services.DownloadBlockedException
import com.universalmedialibrary.services.ingestion.IngestionPipeline
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.HttpStatusException
import org.jsoup.Jsoup
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query
import java.net.SocketTimeoutException
import java.net.URI
import java.net.URL
import javax.inject.Inject
import javax.inject.Singleton

enum class WebFictionSiteType(
    val displayName: String,
    val baseUrl: String
) {
    ARCHIVE_OF_OUR_OWN("Archive of Our Own", "https://archiveofourown.org"),
    FANFICTION_NET("FanFiction.Net", "https://www.fanfiction.net"),
    ROYAL_ROAD("Royal Road", "https://www.royalroad.com"),
    WEBNOVEL("WebNovel", "https://www.webnovel.com"),
    WATTPAD("Wattpad", "https://www.wattpad.com"),
    SCRIBBLE_HUB("Scribble Hub", "https://www.scribblehub.com"),
    SPACEBATTLES("SpaceBattles", "https://forums.spacebattles.com"),
    SUFFICIENT_VELOCITY("Sufficient Velocity", "https://forums.sufficientvelocity.com"),
    QUESTIONABLE_QUESTING("Questionable Questing", "https://forum.questionablequesting.com"),
    FIMFICTION("Fimfiction", "https://www.fimfiction.net"),
    LITEROTICA("Literotica", "https://www.literotica.com"),
    METABODS("Metabods", "https://www.metabods.com"),
    NIFTY("Nifty Archive", "https://www.nifty.org"),
    ADULT_FANFICTION("Adult-FanFiction", "https://www.adult-fanfiction.org"),
    BDSM_LIBRARY("BDSM Library", "https://www.bdsmlibrary.com"),
    MCSTORIES("MCStories", "https://mcstories.com"),
    GENERIC("Generic Web Fiction", "")
}
data class RoyalRoadFiction(
    val id: String,
    val title: String,
    val author: RoyalRoadAuthor,
    val description: String,
    val cover: String?,
    val tags: List<String>,
    val status: String,
    val chapters: Int,
    val pages: Int,
    val followers: Int,
    val favorites: Int,
    val rating: Float
)
data class RoyalRoadAuthor(
    val name: String,
    val id: String
)
data class RoyalRoadChapter(
    val id: String,
    val title: String,
    val url: String,
    val order: Int,
    val content: String? = null
)
