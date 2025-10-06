package com.universalmedialibrary.services.webfiction

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query
import java.net.URL
import javax.inject.Inject
import javax.inject.Singleton

// WebFictionStory, WebFictionChapter models are defined in WebFictionModels.kt

// WebFictionSite enum - site definitions
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
    GENERIC("Generic Web Fiction", "")
}

// API interfaces for sites that have them
interface RoyalRoadApi {
    @GET("fiction/{fictionId}")
    suspend fun getFiction(@Path("fictionId") fictionId: String): RoyalRoadFiction

    @GET("fiction/{fictionId}/chapters")
    suspend fun getChapters(@Path("fictionId") fictionId: String): List<RoyalRoadChapter>
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

@Singleton
class WebFictionService @Inject constructor() {

    private val royalRoadApi: RoyalRoadApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://www.royalroad.com/api/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(RoyalRoadApi::class.java)
    }

    /**
     * Extract story information from a URL
     */
    suspend fun extractStoryFromUrl(url: String): WebFictionStory? {
        return withContext(Dispatchers.IO) {
            try {
                val site = detectSite(url)
                when (site) {
                    WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> extractFromAO3(url)
                    WebFictionSiteType.FANFICTION_NET -> extractFromFFN(url)
                    WebFictionSiteType.ROYAL_ROAD -> extractFromRoyalRoad(url)
                    WebFictionSiteType.WEBNOVEL -> extractFromWebnovel(url)
                    WebFictionSiteType.WATTPAD -> extractFromWattpad(url)
                    WebFictionSiteType.SCRIBBLE_HUB -> extractFromScribbleHub(url)
                    WebFictionSiteType.FIMFICTION -> extractFromFimFiction(url)
                    else -> extractGeneric(url)
                }
            } catch (e: Exception) {
                null
            }
        }
    }

    /**
     * Check for new chapters in an existing story
     */
    suspend fun checkForUpdates(story: WebFictionStory): List<WebFictionChapter> {
        return withContext(Dispatchers.IO) {
            try {
                val currentStory = extractStoryFromUrl(story.url) ?: return@withContext emptyList()

                // Find chapters that weren't in the original story
                val existingChapterIds = story.chapters.map { it.id }.toSet()
                currentStory.chapters.filter { it.id !in existingChapterIds }
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    /**
     * Download all chapters of a story
     */
    suspend fun downloadAllChapters(story: WebFictionStory): List<WebFictionChapter> {
        return withContext(Dispatchers.IO) {
            try {
                // Parse site from URL if site string is not available
                val siteType = detectSite(story.url)
                when (siteType) {
                    WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> downloadAO3Chapters(story)
                    WebFictionSiteType.FANFICTION_NET -> downloadFFNChapters(story)
                    WebFictionSiteType.ROYAL_ROAD -> downloadRoyalRoadChapters(story)
                    WebFictionSiteType.WEBNOVEL -> downloadWebnovelChapters(story)
                    WebFictionSiteType.WATTPAD -> downloadWattpadChapters(story)
                    else -> emptyList()
                }
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    private fun detectSite(url: String): WebFictionSiteType {
        val domain = URL(url).host.lowercase()
        return when {
            "archiveofourown.org" in domain -> WebFictionSiteType.ARCHIVE_OF_OUR_OWN
            "fanfiction.net" in domain -> WebFictionSiteType.FANFICTION_NET
            "royalroad.com" in domain -> WebFictionSiteType.ROYAL_ROAD
            "webnovel.com" in domain -> WebFictionSiteType.WEBNOVEL
            "wattpad.com" in domain -> WebFictionSiteType.WATTPAD
            "scribblehub.com" in domain -> WebFictionSiteType.SCRIBBLE_HUB
            "spacebattles.com" in domain -> WebFictionSiteType.SPACEBATTLES
            "sufficientvelocity.com" in domain -> WebFictionSiteType.SUFFICIENT_VELOCITY
            "questionablequesting.com" in domain -> WebFictionSiteType.QUESTIONABLE_QUESTING
            "fimfiction.net" in domain -> WebFictionSiteType.FIMFICTION
            else -> WebFictionSiteType.GENERIC
        }
    }

    private fun parseStoryStatus(statusText: String?): StoryStatus {
        if (statusText == null) return StoryStatus.UNKNOWN
        val normalized = statusText.lowercase()
        return when {
            "complete" in normalized || "completed" in normalized -> StoryStatus.COMPLETED
            "ongoing" in normalized || "in-progress" in normalized || "in progress" in normalized -> StoryStatus.ONGOING
            "hiatus" in normalized -> StoryStatus.HIATUS
            "cancelled" in normalized || "abandoned" in normalized -> StoryStatus.CANCELLED
            else -> StoryStatus.UNKNOWN
        }
    }

    private fun siteTypeToString(siteType: WebFictionSiteType): String {
        return when (siteType) {
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> "Archive of Our Own"
            WebFictionSiteType.FANFICTION_NET -> "FanFiction.Net"
            WebFictionSiteType.ROYAL_ROAD -> "Royal Road"
            WebFictionSiteType.WEBNOVEL -> "WebNovel"
            WebFictionSiteType.WATTPAD -> "Wattpad"
            WebFictionSiteType.SCRIBBLE_HUB -> "ScribbleHub"
            WebFictionSiteType.SPACEBATTLES -> "SpaceBattles"
            WebFictionSiteType.SUFFICIENT_VELOCITY -> "Sufficient Velocity"
            WebFictionSiteType.QUESTIONABLE_QUESTING -> "Questionable Questing"
            WebFictionSiteType.FIMFICTION -> "FimFiction"
            WebFictionSiteType.LITEROTICA -> "Literotica"
            WebFictionSiteType.GENERIC -> "Generic"
        }
    }

    // Archive of Our Own scraper
    private suspend fun extractFromAO3(url: String): WebFictionStory? {
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val title = doc.select("h2.title").text()
        val author = doc.select("a[rel=author]").text()
        val description = doc.select("div.summary blockquote").text()
        val tags = doc.select("dd.freeform a.tag").map { it.text() }
        val rating = doc.select("dd.rating a.tag").text()
        val statusText = doc.select("dd.status a.tag").text()
        val chapterCount = doc.select("dd.chapters").text().split("/")[0].toIntOrNull() ?: 1
        val language = doc.select("dd.language").text()
        val wordCountText = doc.select("dd.words").text().replace(",", "")
        val wordCount = wordCountText.toLongOrNull()

        val storyId = extractAO3Id(url)

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            description = description,
            status = parseStoryStatus(statusText),
            genre = null,
            fandom = null,
            language = language.ifEmpty { null },
            wordCount = wordCount,
            chapterCount = chapterCount,
            lastUpdated = null,
            rating = rating.ifEmpty { null },
            tags = tags,
            site = siteTypeToString(WebFictionSiteType.ARCHIVE_OF_OUR_OWN),
            totalChapters = chapterCount
        )
    }

    // FanFiction.Net scraper
    private suspend fun extractFromFFN(url: String): WebFictionStory? {
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val title = doc.select("b.xcontrast_txt").text()
        val author = doc.select("a.xcontrast_txt").first()?.text() ?: "Unknown"
        val description = doc.select("div#profile_top div.xcontrast_txt").text()
        val storyInfo = doc.select("span.xgray").text()

        // Parse story info (Rating, Language, Chapters, etc.)
        val chapterCount = Regex("Chapters: (\\d+)").find(storyInfo)?.groupValues?.get(1)?.toIntOrNull() ?: 1
        val statusText = if ("Complete" in storyInfo) "Complete" else "In-Progress"
        val language = Regex("Language: ([^-]+)").find(storyInfo)?.groupValues?.get(1)?.trim()
        val wordCountText = Regex("Words: ([0-9,]+)").find(storyInfo)?.groupValues?.get(1)?.replace(",", "")
        val wordCount = wordCountText?.toLongOrNull()
        val rating = Regex("Rated: ([^-]+)").find(storyInfo)?.groupValues?.get(1)?.trim()
        val genre = Regex("Genre: ([^-]+)").find(storyInfo)?.groupValues?.get(1)?.trim()

        val storyId = extractFFNId(url)

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            description = description,
            status = parseStoryStatus(statusText),
            genre = genre,
            fandom = null,
            language = language,
            wordCount = wordCount,
            chapterCount = chapterCount,
            lastUpdated = null,
            rating = rating,
            site = siteTypeToString(WebFictionSiteType.FANFICTION_NET),
            totalChapters = chapterCount
        )
    }

    // Royal Road scraper
    private suspend fun extractFromRoyalRoad(url: String): WebFictionStory? {
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val title = doc.select("h1").text()
        val author = doc.select("h4 a[href*=/profile]").text()
        val description = doc.select("div.description").text()
        val coverUrl = doc.select("img.thumbnail").attr("src")
        val tags = doc.select("span.tags a").map { it.text() }
        val statusText = doc.select("span.label").text()
        val chapterCount = doc.select("tbody tr").size

        val storyId = extractRoyalRoadId(url)

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            description = description,
            status = parseStoryStatus(statusText),
            genre = tags.firstOrNull(),
            fandom = null,
            language = "English",
            wordCount = null,
            chapterCount = chapterCount,
            lastUpdated = null,
            rating = null,
            tags = tags,
            site = siteTypeToString(WebFictionSiteType.ROYAL_ROAD),
            totalChapters = chapterCount,
            coverUrl = coverUrl
        )
    }

    // WebNovel scraper
    private suspend fun extractFromWebnovel(url: String): WebFictionStory? {
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val title = doc.select("h1.pt4").text()
        val author = doc.select("address a").text()
        val description = doc.select("p").firstOrNull { it.text().isNotEmpty() }?.text() ?: ""
        val coverUrl = doc.select("i.g_thumb img").attr("src")
        val tags = doc.select("p.tags a").map { it.text() }

        val storyId = extractWebnovelId(url)

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            description = description,
            status = StoryStatus.UNKNOWN,
            genre = tags.firstOrNull(),
            fandom = null,
            language = null,
            wordCount = null,
            chapterCount = null,
            lastUpdated = null,
            rating = null,
            tags = tags,
            site = siteTypeToString(WebFictionSiteType.WEBNOVEL),
            coverUrl = coverUrl
        )
    }

    // Wattpad scraper
    private suspend fun extractFromWattpad(url: String): WebFictionStory? {
        // Wattpad requires more complex handling due to dynamic loading
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val title = doc.select("h1").text()
        val author = doc.select("a.username").text()
        val description = doc.select("h2.description").text()
        val coverUrl = doc.select("img.cover").attr("src")
        val tags = doc.select("div.tags a").map { it.text() }

        val storyId = extractWattpadId(url)

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            description = description,
            status = StoryStatus.UNKNOWN,
            genre = tags.firstOrNull(),
            fandom = null,
            language = null,
            wordCount = null,
            chapterCount = null,
            lastUpdated = null,
            rating = null,
            tags = tags,
            site = siteTypeToString(WebFictionSiteType.WATTPAD),
            coverUrl = coverUrl
        )
    }

    // ScribbleHub scraper
    private suspend fun extractFromScribbleHub(url: String): WebFictionStory? {
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val title = doc.select("div.fic_title").text()
        val author = doc.select("span.auth_name_fic").text()
        val description = doc.select("div.wi_fic_desc").text()
        val coverUrl = doc.select("div.fic_image img").attr("src")
        val tags = doc.select("a.fic_genre").map { it.text() }
        val statusText = doc.select("span.pub_status").text()

        val storyId = extractScribbleHubId(url)

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            description = description,
            status = parseStoryStatus(statusText),
            genre = tags.firstOrNull(),
            fandom = null,
            language = null,
            wordCount = null,
            chapterCount = null,
            lastUpdated = null,
            rating = null,
            tags = tags,
            site = siteTypeToString(WebFictionSiteType.SCRIBBLE_HUB),
            coverUrl = coverUrl
        )
    }

    // FimFiction scraper
    private suspend fun extractFromFimFiction(url: String): WebFictionStory? {
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val title = doc.select("h1 a").text()
        val author = doc.select("div.author a").text()
        val description = doc.select("div.description").text()
        val coverUrl = doc.select("div.story_image img").attr("src")
        val tags = doc.select("a.character_tag, a.content_tag").map { it.text() }
        val statusText = doc.select("span.completion_status").text()

        val storyId = extractFimFictionId(url)

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author,
            description = description,
            status = parseStoryStatus(statusText),
            genre = null,
            fandom = "My Little Pony",
            language = "English",
            wordCount = null,
            chapterCount = null,
            lastUpdated = null,
            rating = null,
            tags = tags,
            site = siteTypeToString(WebFictionSiteType.FIMFICTION),
            coverUrl = coverUrl
        )
    }

    // Generic scraper for unsupported sites
    private suspend fun extractGeneric(url: String): WebFictionStory? {
        val doc = Jsoup.connect(url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        // Try common selectors
        val title = doc.select("h1").first()?.text() ?: doc.title()
        val description = doc.select("meta[name=description]").attr("content")

        val storyId = url.hashCode().toString()

        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = "Unknown",
            description = description,
            status = StoryStatus.UNKNOWN,
            genre = null,
            fandom = null,
            language = null,
            wordCount = null,
            chapterCount = null,
            lastUpdated = null,
            rating = null,
            site = siteTypeToString(WebFictionSiteType.GENERIC)
        )
    }

    // Chapter downloading methods
    private suspend fun downloadAO3Chapters(story: WebFictionStory): List<WebFictionChapter> {
        val chapters = mutableListOf<WebFictionChapter>()

        // AO3 allows downloading entire work at once
        val fullWorkUrl = "${story.url}?view_full_work=true"
        val doc = Jsoup.connect(fullWorkUrl)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val chapterElements = doc.select("div.chapter")
        chapterElements.forEachIndexed { index, element ->
            val chapterTitle = element.select("h3.landmark").text()
            val content = element.select("div.userstuff").html()

            chapters.add(
                WebFictionChapter(
                    id = "${story.id}_${index + 1}",
                    storyId = story.id,
                    number = index + 1,
                    title = chapterTitle.ifEmpty { "Chapter ${index + 1}" },
                    content = content,
                    publishDate = null,
                    wordCount = null,
                    notes = null
                )
            )
        }

        return chapters
    }

    private suspend fun downloadFFNChapters(story: WebFictionStory): List<WebFictionChapter> {
        val chapters = mutableListOf<WebFictionChapter>()

        val totalChapters = story.totalChapters ?: story.chapterCount ?: 1
        for (chapterNum in 1..totalChapters) {
            // Build chapter URL by replacing the last path segment
            val baseUrl = story.url.substringBeforeLast("/")
            val chapterUrl = "$baseUrl/$chapterNum"
            val doc = Jsoup.connect(chapterUrl)
                .timeout(30000)
                .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .get()

            val chapterTitle = doc.select("select option[selected]").text()
            val content = doc.select("div#storytext").html()

            chapters.add(
                WebFictionChapter(
                    id = "${story.id}_$chapterNum",
                    storyId = story.id,
                    number = chapterNum,
                    title = chapterTitle.ifEmpty { "Chapter $chapterNum" },
                    content = content,
                    publishDate = null,
                    wordCount = null,
                    notes = null
                )
            )
        }

        return chapters
    }

    private suspend fun downloadRoyalRoadChapters(story: WebFictionStory): List<WebFictionChapter> {
        val chapters = mutableListOf<WebFictionChapter>()

        // Get chapter list from table of contents
        val tocUrl = story.url
        val doc = Jsoup.connect(tocUrl)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val chapterLinks = doc.select("tbody tr td a[href*=/chapter/]")

        chapterLinks.forEachIndexed { index, link ->
            val chapterUrl = "https://www.royalroad.com${link.attr("href")}"
            val chapterTitle = link.text()

            val chapterDoc = Jsoup.connect(chapterUrl)
                .timeout(30000)
                .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .get()
            val content = chapterDoc.select("div.chapter-content").html()

            chapters.add(
                WebFictionChapter(
                    id = "${story.id}_${index + 1}",
                    storyId = story.id,
                    number = index + 1,
                    title = chapterTitle,
                    content = content,
                    publishDate = null,
                    wordCount = null,
                    notes = null
                )
            )
        }

        return chapters
    }

    private suspend fun downloadWebnovelChapters(story: WebFictionStory): List<WebFictionChapter> {
        // WebNovel often requires login and has anti-scraping measures
        // This would need more sophisticated handling
        return emptyList()
    }

    private suspend fun downloadWattpadChapters(story: WebFictionStory): List<WebFictionChapter> {
        // Wattpad requires handling dynamic content loading
        // This would need more sophisticated handling
        return emptyList()
    }

    // Helper methods to extract IDs from URLs
    private fun extractAO3Id(url: String): String {
        return Regex("works/(\\d+)").find(url)?.groupValues?.get(1) ?: url.hashCode().toString()
    }

    private fun extractFFNId(url: String): String {
        return Regex("s/(\\d+)").find(url)?.groupValues?.get(1) ?: url.hashCode().toString()
    }

    private fun extractRoyalRoadId(url: String): String {
        return Regex("fiction/(\\d+)").find(url)?.groupValues?.get(1) ?: url.hashCode().toString()
    }

    private fun extractWebnovelId(url: String): String {
        return Regex("book/(\\d+)").find(url)?.groupValues?.get(1) ?: url.hashCode().toString()
    }

    private fun extractWattpadId(url: String): String {
        return Regex("story/(\\d+)").find(url)?.groupValues?.get(1) ?: url.hashCode().toString()
    }

    private fun extractScribbleHubId(url: String): String {
        return Regex("series/(\\d+)").find(url)?.groupValues?.get(1) ?: url.hashCode().toString()
    }

    private fun extractFimFictionId(url: String): String {
        return Regex("story/(\\d+)").find(url)?.groupValues?.get(1) ?: url.hashCode().toString()
    }
}
