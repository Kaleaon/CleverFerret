package com.universalmedialibrary.services.contentcreation

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.net.URLEncoder
import java.util.concurrent.TimeUnit
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.utils.ErrorLogger

/**
 * Service for converting fanfiction stories to EPUB format
 * Supports multiple fanfiction platforms
 */
@Singleton
class FanfictionEpubConversionService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(20, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .build()

    private val ficHubApiUrl = "https://fichub.net/api/v0/epub"

    data class Story(
        val title: String,
        val author: String,
        val summary: String,
        val chapters: List<Chapter>,
        val metadata: StoryMetadata
    )

    data class Chapter(
        val number: Int,
        val title: String,
        val content: String
    )

    data class StoryMetadata(
        val fandom: String? = null,
        val characters: List<String> = emptyList(),
        val rating: String? = null,
        val genre: String? = null,
        val wordCount: Int = 0,
        val publishDate: String? = null,
        val updateDate: String? = null,
        val language: String = "en",
        val status: String? = null
    )

    enum class FanfictionSite(val domain: String) {
        FANFICTION_NET("fanfiction.net"),
        ARCHIVE_OF_OUR_OWN("archiveofourown.org"),
        WATTPAD("wattpad.com"),
        ROYAL_ROAD("royalroad.com");

        companion object {
            fun fromUrl(url: String): FanfictionSite? {
                return values().find { url.contains(it.domain) }
            }
        }
    }

    /**
     * Result of story conversion
     */
    data class ConversionResult(
        val file: File,
        val story: Story
    )

    /**
     * Convert a fanfiction story URL to EPUB
     */
    suspend fun convertStoryToEpub(
        storyUrl: String,
        outputFileName: String? = null
    ): File? = withContext(Dispatchers.IO) {
        try {
            val ficHubResult = fetchFromFicHub(storyUrl)
            if (ficHubResult != null) {
                val fileName = outputFileName ?: "${sanitizeFileName(ficHubResult.story.title)}.epub"
                val outputFile = File(context.filesDir, fileName)
                if (downloadEpub(ficHubResult.epubUrl, outputFile)) {
                    return@withContext outputFile
                }
            }

            val site = FanfictionSite.fromUrl(storyUrl)
            if (site == null) {
                return@withContext null
            }

            val story = when (site) {
                FanfictionSite.FANFICTION_NET -> fetchFFNetStory(storyUrl)
                FanfictionSite.ARCHIVE_OF_OUR_OWN -> fetchAO3Story(storyUrl)
                FanfictionSite.WATTPAD -> fetchWattpadStory(storyUrl)
                FanfictionSite.ROYAL_ROAD -> fetchRoyalRoadStory(storyUrl)
            }

            if (story == null) {
                return@withContext null
            }

            val fileName = outputFileName ?: "${sanitizeFileName(story.title)}.epub"
            val outputFile = File(context.filesDir, fileName)

            createEPUB(story, outputFile)

            outputFile
        } catch (e: Exception) {
            ErrorLogger.logError("FanfictionEpubConversionService", "Error converting story to EPUB", e)
            null
        }
    }

    /**
     * Convert a fanfiction story URL to EPUB with detailed result
     */
    suspend fun convertStoryToEpubWithDetails(
        storyUrl: String,
        outputFileName: String? = null
    ): ConversionResult? = withContext(Dispatchers.IO) {
        try {
            val ficHubResult = fetchFromFicHub(storyUrl)
            if (ficHubResult != null) {
                val fileName = outputFileName ?: "${sanitizeFileName(ficHubResult.story.title)}.epub"
                val outputFile = File(context.filesDir, fileName)
                if (downloadEpub(ficHubResult.epubUrl, outputFile)) {
                    return@withContext ConversionResult(outputFile, ficHubResult.story)
                }
            }

            val site = FanfictionSite.fromUrl(storyUrl)
            if (site == null) {
                return@withContext null
            }

            val story = when (site) {
                FanfictionSite.FANFICTION_NET -> fetchFFNetStory(storyUrl)
                FanfictionSite.ARCHIVE_OF_OUR_OWN -> fetchAO3Story(storyUrl)
                FanfictionSite.WATTPAD -> fetchWattpadStory(storyUrl)
                FanfictionSite.ROYAL_ROAD -> fetchRoyalRoadStory(storyUrl)
            }

            if (story == null) {
                return@withContext null
            }

            val fileName = outputFileName ?: "${sanitizeFileName(story.title)}.epub"
            val outputFile = File(context.filesDir, fileName)

            createEPUB(story, outputFile)

            ConversionResult(outputFile, story)
        } catch (e: Exception) {
            ErrorLogger.logError("FanfictionEpubConversionService", "Error converting story to EPUB (detailed)", e)
            null
        }
    }

    private data class FicHubResult(
        val epubUrl: String,
        val story: Story
    )

    private suspend fun fetchFromFicHub(storyUrl: String): FicHubResult? = withContext(Dispatchers.IO) {
        try {
            val encoded = URLEncoder.encode(storyUrl, "UTF-8")
            val request = Request.Builder()
                .url("$ficHubApiUrl?q=$encoded")
                .header("User-Agent", "CleverFerret/1.0 (FicHub)")
                .get()
                .build()

            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) return@withContext null
                val body = response.body?.string().orEmpty()
                val json = JSONObject(body)
                if (json.optInt("err", -1) != 0) return@withContext null

                val epubUrl = json.optString("epub_url")
                    .ifBlank { json.optJSONObject("urls")?.optString("epub").orEmpty() }
                if (epubUrl.isBlank()) return@withContext null

                val meta = json.optJSONObject("meta")
                val info = json.optString("info")
                val story = parseFicHubStory(meta, info, storyUrl)
                return@withContext FicHubResult(epubUrl, story)
            }
        } catch (e: Exception) {
            ErrorLogger.logWarning("FanfictionEpubConversionService", "FicHub fallback failed", e)
            null
        }
    }



    private fun org.json.JSONArray?.toStringList(): List<String> {
        val array = this ?: return emptyList()
        return (0 until array.length())
            .mapNotNull { idx -> array.optString(idx).takeIf { it.isNotBlank() } }
    }


    /**
     * Fetch story from FanFiction.Net
     */
    private suspend fun fetchFFNetStory(url: String): Story? = withContext(Dispatchers.IO) {
        try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()

            // Extract story info
            val title = doc.select("#profile_top b.xcontrast_txt").first()?.text() ?: "Unknown Title"
            val author = doc.select("#profile_top a[href^='/u/']").first()?.text() ?: "Unknown Author"
            val summary = doc.select("#profile_top div.xcontrast_txt").first()?.text() ?: ""

            // Extract metadata
            val metadataText = doc.select("#profile_top span.xgray").text()
            val metadata = parseFFNetMetadata(metadataText)

            // Get chapter count
            val chapterSelect = doc.select("select#chap_select").first()
            val chapterCount = chapterSelect?.select("option")?.size ?: 1

            // Fetch all chapters
            val chapters = mutableListOf<Chapter>()
            val storyId = extractStoryId(url) ?: return@withContext null

            for (i in 1..chapterCount) {
                val chapterUrl = if (i == 1) {
                    url
                } else {
                    url.replace("(/s/$storyId/)(\\d+)(/|$)".toRegex(), "$1$i$3")
                }
                val chapter = fetchFFNetChapter(chapterUrl, i)
                if (chapter != null) {
                    chapters.add(chapter)
                }
            }

            Story(
                title = title,
                author = author,
                summary = summary,
                chapters = chapters,
                metadata = metadata
            )
        } catch (e: Exception) {
            ErrorLogger.logError("FanfictionEpubConversionService", "Error fetching FFNet story", e)
            null
        }
    }

    /**
     * Fetch a single chapter from FanFiction.Net
     */

    /**
     * Fetch story from Archive of Our Own
     */
    private suspend fun fetchAO3Story(url: String): Story? = withContext(Dispatchers.IO) {
        try {
            // Ensure we have the full work URL
            val fullUrl = if (url.contains("?view_full_work=true")) {
                url
            } else {
                "$url?view_full_work=true"
            }

            val doc = Jsoup.connect(fullUrl)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()

            // Extract story info
            val title = doc.select("h2.title").first()?.text() ?: "Unknown Title"
            val author = doc.select("a[rel='author']").first()?.text() ?: "Unknown Author"
            val summary = doc.select(".summary blockquote").first()?.text() ?: ""

            // Extract metadata
            val metadata = parseAO3Metadata(doc)

            // Extract chapters
            val chapters = mutableListOf<Chapter>()
            val chapterDivs = doc.select("div.chapter")

            if (chapterDivs.isEmpty()) {
                // Single chapter work
                val content = doc.select("div.userstuff").first()?.html() ?: ""
                chapters.add(Chapter(
                    number = 1,
                    title = title,
                    content = cleanHtml(content)
                ))
            } else {
                // Multi-chapter work
                chapterDivs.forEachIndexed { index, chapterDiv ->
                    val chapterTitle = chapterDiv.select("h3.title a").first()?.text()
                        ?: "Chapter ${index + 1}"
                    val content = chapterDiv.select("div.userstuff").first()?.html() ?: ""

                    chapters.add(Chapter(
                        number = index + 1,
                        title = chapterTitle,
                        content = cleanHtml(content)
                    ))
                }
            }

            Story(
                title = title,
                author = author,
                summary = summary,
                chapters = chapters,
                metadata = metadata
            )
        } catch (e: Exception) {
            ErrorLogger.logError("FanfictionEpubConversionService", "Error fetching AO3 story", e)
            null
        }
    }

    /**
     * Fetch story from Wattpad
     */
    private suspend fun fetchWattpadStory(url: String): Story? = withContext(Dispatchers.IO) {
        try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()

            // Extract story info
            val title = doc.select("h1").first()?.text() ?: "Unknown Title"
            val author = doc.select("a.username").first()?.text() ?: "Unknown Author"
            val summary = doc.select(".description-text").first()?.text() ?: ""

            // Get chapter links
            val chapterLinks = doc.select("a.story-part__link")
            val chapters = mutableListOf<Chapter>()

            chapterLinks.forEachIndexed { index, link ->
                val chapterUrl = "https://www.wattpad.com" + link.attr("href")
                val chapter = fetchWattpadChapter(chapterUrl, index + 1)
                if (chapter != null) {
                    chapters.add(chapter)
                }
            }

            Story(
                title = title,
                author = author,
                summary = summary,
                chapters = chapters,
                metadata = StoryMetadata()
            )
        } catch (e: Exception) {
            ErrorLogger.logError("FanfictionEpubConversionService", "Error fetching Wattpad story", e)
            null
        }
    }

    /**
     * Fetch a single chapter from Wattpad
     */

    /**
     * Fetch story from Royal Road
     */
    private suspend fun fetchRoyalRoadStory(url: String): Story? = withContext(Dispatchers.IO) {
        try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
                .timeout(15000)
                .get()

            // Extract story info from Royal Road
            val title = doc.select("h1.font-white").first()?.text() 
                ?: doc.select(".fic-title h1").first()?.text()
                ?: "Unknown Title"
            val author = doc.select(".fic-title h4 a").first()?.text()
                ?: doc.select("h4.font-white a").first()?.text()
                ?: "Unknown Author"
            val summary = doc.select(".description .hidden-content").first()?.text()
                ?: doc.select(".fiction-info .description").first()?.text()
                ?: ""

            // Get chapter links from the table of contents
            val chapterLinks = doc.select("#chapters tbody tr td:first-child a")
            val chapters = mutableListOf<Chapter>()

            if (chapterLinks.isEmpty()) {
                // Try alternate selector for chapter list
                val altChapterLinks = doc.select(".chapter-row a[href*='/fiction/']")
                altChapterLinks.forEachIndexed { index, link ->
                    val chapterUrl = if (link.attr("href").startsWith("http")) {
                        link.attr("href")
                    } else {
                        "https://www.royalroad.com${link.attr("href")}"
                    }
                    val chapter = fetchRoyalRoadChapter(chapterUrl, index + 1)
                    if (chapter != null) {
                        chapters.add(chapter)
                    }
                }
            } else {
                chapterLinks.forEachIndexed { index, link ->
                    val chapterUrl = if (link.attr("href").startsWith("http")) {
                        link.attr("href")
                    } else {
                        "https://www.royalroad.com${link.attr("href")}"
                    }
                    val chapter = fetchRoyalRoadChapter(chapterUrl, index + 1)
                    if (chapter != null) {
                        chapters.add(chapter)
                    }
                }
            }

            // If we couldn't get chapters from ToC, try getting current chapter
            if (chapters.isEmpty()) {
                val content = doc.select(".chapter-content").first()?.html() ?: ""
                if (content.isNotEmpty()) {
                    chapters.add(Chapter(
                        number = 1,
                        title = title,
                        content = cleanHtml(content)
                    ))
                }
            }

            if (chapters.isEmpty()) {
                return@withContext null
            }

            // Extract metadata
            val tags = doc.select(".fiction-info .tags a").map { it.text() }
            val statsText = doc.select(".fiction-info .stats").text()
            val wordCount = Regex("([\\d,]+)\\s*(?:Total )?Words").find(statsText)
                ?.groupValues?.get(1)
                ?.replace(",", "")
                ?.toIntOrNull() ?: 0

            Story(
                title = title,
                author = author,
                summary = summary,
                chapters = chapters,
                metadata = StoryMetadata(
                    fandom = "Royal Road",
                    characters = tags.take(5), // Use tags as "characters" placeholder
                    wordCount = wordCount,
                    status = if (statsText.contains("COMPLETE", ignoreCase = true)) "Complete" else "Ongoing"
                )
            )
        } catch (e: Exception) {
            ErrorLogger.logError("FanfictionEpubConversionService", "Error fetching Royal Road story", e)
            null
        }
    }

    /**
     * Fetch a single chapter from Royal Road
     */

    /**
     * Parse FanFiction.Net metadata
     */

    /**
     * Parse Archive of Our Own metadata
     */

    /**
     * Create EPUB file from story content
     */









}
