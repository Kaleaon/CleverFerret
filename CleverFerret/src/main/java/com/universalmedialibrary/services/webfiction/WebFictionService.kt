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

// WebFictionStory, WebFictionChapter models are defined in WebFictionModels.kt

// WebFictionSite enum - site definitions

// API interfaces for sites that have them
interface RoyalRoadApi {
    @GET("fiction/{fictionId}")
    suspend fun getFiction(@Path("fictionId") fictionId: String): RoyalRoadFiction

    @GET("fiction/{fictionId}/chapters")
    suspend fun getChapters(@Path("fictionId") fictionId: String): List<RoyalRoadChapter>
}




@Singleton
class WebFictionService @Inject constructor(
    private val parentalControlsSettings: ParentalControlsSettings,
    private val ingestionPipeline: IngestionPipeline
) {

    data class ValidatedWebFictionUrl(
        val normalizedUrl: String,
        val siteType: WebFictionSiteType
    )

    class UnsupportedWebFictionUrlException(message: String) : IllegalArgumentException(message)
    class WebFictionRateLimitException(message: String) : IllegalStateException(message)
    class WebFictionSiteChangedException(message: String) : IllegalStateException(message)

    private val royalRoadApi: RoyalRoadApi by lazy {
        Retrofit.Builder()
            .baseUrl("https://www.royalroad.com/api/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(RoyalRoadApi::class.java)
    }

    private suspend fun ensureAdultAccess(siteType: WebFictionSiteType) {
        if (!siteType.isAdultSite()) return
        if (!parentalControlsSettings.isAdultSourcesAllowed()) {
            throw AdultSitesDisabledException()
        }
    }

    private suspend fun enforceStoryAccess(
        story: WebFictionStory,
        bypassPin: Boolean = false
    ) {
        val state = parentalControlsSettings.currentState()
        if (!state.enabled) return

        if (parentalControlsSettings.shouldHideContent(
                state = state,
                rating = story.rating,
                mediaType = "STORY",
                tags = story.tags
            )
        ) {
            throw DownloadBlockedException(
                message = "Parental controls hide this story. Adjust your parental control settings to view or download it.",
                contentRating = story.rating
            )
        }

        if (!parentalControlsSettings.isContentAllowed(
                state = state,
                rating = story.rating,
                mediaType = "STORY",
                tags = story.tags
            )
        ) {
            throw DownloadBlockedException(
                message = "Parental controls currently block downloading this story. Update your parental control settings to continue.",
                contentRating = story.rating
            )
        }

        if (!bypassPin && parentalControlsSettings.requiresPinForAccess(
                state = state,
                rating = story.rating,
                mediaType = "STORY",
                tags = story.tags
            )
        ) {
            throw ContentPinRequiredException(
                contentTitle = story.title,
                contentRating = story.rating
            )
        }
    }

    /**
     * Extract story information from a URL
     */
    suspend fun extractStoryFromUrl(
        url: String,
        bypassPin: Boolean = false
    ): WebFictionStory? {
        return withContext(Dispatchers.IO) {
            try {
                val validatedUrl = parseAndValidateSourceUrl(url)
                val site = validatedUrl.siteType
                val normalizedUrl = validatedUrl.normalizedUrl
                ingestionPipeline.execute(
                    sourceId = "webfiction:${site.name.lowercase()}",
                    authenticate = {
                        ensureAdultAccess(site)
                        site
                    },
                    fetchPage = { authedSite, _ ->
                        when (authedSite) {
                            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> extractFromAO3(normalizedUrl)
                            WebFictionSiteType.FANFICTION_NET -> extractFromFFN(normalizedUrl)
                            WebFictionSiteType.ROYAL_ROAD -> extractFromRoyalRoad(normalizedUrl)
                            WebFictionSiteType.WEBNOVEL -> extractFromWebnovel(normalizedUrl)
                            WebFictionSiteType.WATTPAD -> extractFromWattpad(normalizedUrl)
                            WebFictionSiteType.SCRIBBLE_HUB -> extractFromScribbleHub(normalizedUrl)
                            WebFictionSiteType.FIMFICTION -> extractFromFimFiction(normalizedUrl)
                            WebFictionSiteType.METABODS -> extractFromMetabods(normalizedUrl)
                            WebFictionSiteType.LITEROTICA -> extractFromLiterotica(normalizedUrl)
                            WebFictionSiteType.NIFTY -> extractFromNifty(normalizedUrl)
                            WebFictionSiteType.ADULT_FANFICTION -> extractFromAdultFanFiction(normalizedUrl)
                            WebFictionSiteType.BDSM_LIBRARY -> extractFromBdsmlibrary(normalizedUrl)
                            WebFictionSiteType.MCSTORIES -> extractFromMcstories(normalizedUrl)
                            else -> extractGeneric(normalizedUrl)
                        }
                    },
                    parse = { it },
                    deduplicate = { it },
                    enrichMetadata = { story ->
                        story?.let { enforceStoryAccess(it, bypassPin) }
                        story
                    },
                    persist = { it },
                    nextIncrementalToken = { System.currentTimeMillis().toString() }
                ).result
            } catch (e: AdultSitesDisabledException) {
                throw e
            } catch (e: ContentPinRequiredException) {
                throw e
            } catch (e: DownloadBlockedException) {
                throw e
            } catch (e: UnsupportedWebFictionUrlException) {
                throw e
            } catch (e: WebFictionRateLimitException) {
                throw e
            } catch (e: WebFictionSiteChangedException) {
                throw e
            } catch (e: Exception) {
                throw mapSiteFailure(url, e)
            }
        }
    }

    /**
     * Check for new chapters in an existing story
     */
    suspend fun checkForUpdates(
        story: WebFictionStory,
        bypassPin: Boolean = false
    ): List<WebFictionChapter> {
        enforceStoryAccess(story, bypassPin)
        return withContext(Dispatchers.IO) {
            try {
                val currentStory = extractStoryFromUrl(story.url, bypassPin) ?: return@withContext emptyList()

                // Find chapters that weren't in the original story
                val existingChapterIds = story.chapters.map { it.id }.toSet()
                currentStory.chapters.filter { it.id !in existingChapterIds }
            } catch (e: ContentPinRequiredException) {
                throw e
            } catch (e: DownloadBlockedException) {
                throw e
            } catch (e: Exception) {
                throw mapSiteFailure(story.url, e)
            }
        }
    }

    /**
     * Download all chapters of a story
     */
    suspend fun downloadAllChapters(
        story: WebFictionStory,
        bypassPin: Boolean = false
    ): List<WebFictionChapter> {
        return withContext(Dispatchers.IO) {
            try {
                // Parse site from URL if site string is not available
                val siteType = detectSite(story.url)
                ensureAdultAccess(siteType)
                enforceStoryAccess(story, bypassPin)
                when (siteType) {
                    WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> downloadAO3Chapters(story)
                    WebFictionSiteType.FANFICTION_NET -> downloadFFNChapters(story)
                    WebFictionSiteType.ROYAL_ROAD -> downloadRoyalRoadChapters(story)
                    WebFictionSiteType.WEBNOVEL -> downloadWebnovelChapters(story)
                    WebFictionSiteType.WATTPAD -> downloadWattpadChapters(story)
                    WebFictionSiteType.METABODS -> downloadMetabodsChapters(story)
                    WebFictionSiteType.LITEROTICA -> downloadLiteroticaChapters(story)
                    WebFictionSiteType.NIFTY -> downloadNiftyChapters(story)
                    WebFictionSiteType.ADULT_FANFICTION -> downloadAdultFanFictionChapters(story)
                    WebFictionSiteType.BDSM_LIBRARY -> downloadBdsmlibraryChapters(story)
                    WebFictionSiteType.MCSTORIES -> downloadMcstoriesChapters(story)
                    else -> emptyList()
                }
            } catch (e: ContentPinRequiredException) {
                throw e
            } catch (e: DownloadBlockedException) {
                throw e
            } catch (e: Exception) {
                throw mapSiteFailure(story.url, e)
            }
        }
    }






    // Archive of Our Own scraper

    // FanFiction.Net scraper

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

    // Wattpad scraper

    // ScribbleHub scraper

    // FimFiction scraper

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



    // Helper methods to extract IDs from URLs







    // Metabods scraper - Adult transformation fiction site

    // Literotica scraper - Adult fiction site







    private suspend fun downloadNiftyChapters(story: WebFictionStory): List<WebFictionChapter> {
        val doc = Jsoup.connect(story.url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val content = doc.select("pre, article, div.story").first()?.html()
            ?: doc.body().html()

        return listOf(
            WebFictionChapter(
                id = "${story.id}_1",
                storyId = story.id,
                number = 1,
                title = story.title,
                content = content,
                publishDate = null,
                wordCount = null,
                notes = null
            )
        )
    }

    private suspend fun downloadAdultFanFictionChapters(story: WebFictionStory): List<WebFictionChapter> {
        val doc = Jsoup.connect(story.url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val content = doc.select(".storytext, #storytext, article").first()?.html()
            ?: doc.body().html()

        return listOf(
            WebFictionChapter(
                id = "${story.id}_1",
                storyId = story.id,
                number = 1,
                title = story.title,
                content = content,
                publishDate = null,
                wordCount = null,
                notes = null
            )
        )
    }

    private suspend fun downloadBdsmlibraryChapters(story: WebFictionStory): List<WebFictionChapter> {
        val doc = Jsoup.connect(story.url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val content = doc.select("#story, .storycontent, article").first()?.html()
            ?: doc.body().html()

        return listOf(
            WebFictionChapter(
                id = "${story.id}_1",
                storyId = story.id,
                number = 1,
                title = story.title,
                content = content,
                publishDate = null,
                wordCount = null,
                notes = null
            )
        )
    }

    private suspend fun downloadMcstoriesChapters(story: WebFictionStory): List<WebFictionChapter> {
        val doc = Jsoup.connect(story.url)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val chapterLinks = doc.select("a[href*=\\.html]").filter {
            val href = it.attr("href")
            href.endsWith(".html", ignoreCase = true) && !href.contains("index", ignoreCase = true)
        }

        if (chapterLinks.isNotEmpty()) {
            return chapterLinks.mapIndexed { index, link ->
                val chapterUrl = link.absUrl("href")
                val chapterDoc = Jsoup.connect(chapterUrl)
                    .timeout(30000)
                    .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
                    .get()
                val content = chapterDoc.select("body").html()
                WebFictionChapter(
                    id = "${story.id}_${index + 1}",
                    storyId = story.id,
                    number = index + 1,
                    title = link.text().ifEmpty { "Chapter ${index + 1}" },
                    content = content,
                    publishDate = null,
                    wordCount = null,
                    notes = null
                )
            }
        }

        val content = doc.select("body").html()
        return listOf(
            WebFictionChapter(
                id = "${story.id}_1",
                storyId = story.id,
                number = 1,
                title = story.title,
                content = content,
                publishDate = null,
                wordCount = null,
                notes = null
            )
        )
    }

    private fun extractMetabodsId(url: String): String {
        return Regex("(?:story|s)/(\\d+)").find(url)?.groupValues?.getOrNull(1)
            ?: url.substringAfterLast("/").substringBefore("?").ifEmpty { url.hashCode().toString() }
    }

    private fun extractLiteroticaId(url: String): String {
        return Regex("s/(\\w+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
    }
}

class AdultSitesDisabledException :
    IllegalStateException("Adult site access is disabled by parental control settings.")
