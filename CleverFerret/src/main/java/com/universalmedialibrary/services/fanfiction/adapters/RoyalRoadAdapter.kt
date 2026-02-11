package com.universalmedialibrary.services.fanfiction.adapters

import com.universalmedialibrary.services.fanfiction.FanfictionSiteAdapter
import com.universalmedialibrary.services.fanfiction.models.Chapter
import com.universalmedialibrary.services.fanfiction.models.CompletionStatus
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import com.universalmedialibrary.services.fanfiction.models.UpdateInfo
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import java.time.LocalDate
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Adapter for Royal Road (royalroad.com)
 * 
 * Royal Road is a popular web novel platform
 */
@Singleton
class RoyalRoadAdapter @Inject constructor(
    private val httpClient: OkHttpClient
) : FanfictionSiteAdapter {
    
    override val siteName = "Royal Road"
    override val baseUrl = "https://www.royalroad.com"
    
    private val urlPattern = Regex("https?://(?:www\\.)?royalroad\\.com/fiction/(\\d+)")
    
    override fun canHandle(url: String): Boolean {
        return urlPattern.matches(url)
    }
    
    override fun extractStoryId(url: String): String? {
        return urlPattern.find(url)?.groupValues?.get(1)
    }
    
    override suspend fun extractMetadata(url: String): Result<StoryMetadata> {
        return withContext(Dispatchers.IO) {
            try {
                val storyId = extractStoryId(url)
                    ?: return@withContext Result.failure(IllegalArgumentException("Invalid Royal Road URL"))
                
                val doc = fetchDocument("$baseUrl/fiction/$storyId")
                
                val metadata = StoryMetadata(
                    title = doc.select("h1.font-white").text().trim(),
                    author = doc.select("h4.font-white a").first()?.text() ?: "",
                    authorUrl = doc.select("h4.font-white a").first()?.attr("abs:href"),
                    summary = doc.select("div.description div.hidden-content").html(),
                    rating = "Not Rated",
                    warnings = doc.select("span.label-sm").map { it.text() },
                    fandoms = listOf("Original Work"),
                    characters = emptyList(),
                    relationships = emptyList(),
                    tags = doc.select("span.label").map { it.text() },
                    language = "English",
                    status = extractStatus(doc),
                    wordCount = doc.select("div.fiction-stats li").let { stats ->
                        // Royal Road shows "XXX Pages" and "XXX,XXX Words" in the stats section
                        stats.find { it.text().contains("Words", ignoreCase = true) }
                            ?.text()
                            ?.replace(Regex("[^\\d]"), "")
                            ?.toIntOrNull() ?: 0
                    },
                    chapterCount = doc.select("table#chapters tr[data-url]").size,
                    publishDate = doc.select("div.fiction-stats time").firstOrNull()?.let { timeElement ->
                        try {
                            val dateAttr = timeElement.attr("datetime") // ISO 8601 format
                            if (dateAttr.isNotBlank()) {
                                LocalDate.parse(dateAttr.substringBefore("T"))
                            } else null
                        } catch (e: Exception) { null }
                    },
                    updateDate = doc.select("div.fiction-stats time").lastOrNull()?.let { timeElement ->
                        try {
                            val dateAttr = timeElement.attr("datetime")
                            if (dateAttr.isNotBlank()) {
                                LocalDate.parse(dateAttr.substringBefore("T"))
                            } else null
                        } catch (e: Exception) { null }
                    },
                    coverUrl = doc.select("img.thumbnail").attr("abs:src"),
                    sourceUrl = url,
                    sourceSite = siteName
                )
                
                Result.success(metadata)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }
    
    override suspend fun downloadChapters(
        url: String,
        progressCallback: (Int, Int, String) -> Unit
    ): Result<List<Chapter>> {
        return withContext(Dispatchers.IO) {
            try {
                val storyId = extractStoryId(url)
                    ?: return@withContext Result.failure(IllegalArgumentException("Invalid Royal Road URL"))
                
                val doc = fetchDocument("$baseUrl/fiction/$storyId")
                val chapterLinks = doc.select("table#chapters tr[data-url] a").map { 
                    it.attr("abs:href") 
                }
                
                val chapters = mutableListOf<Chapter>()
                val totalChapters = chapterLinks.size
                
                chapterLinks.forEachIndexed { index, chapterUrl ->
                    progressCallback(index + 1, totalChapters, "Downloading chapter ${index + 1}...")
                    
                    // Rate limiting
                    if (index > 0) delay(1000)
                    
                    val chapterDoc = fetchDocument(chapterUrl)
                    val title = chapterDoc.select("h1").text().trim()
                    val content = chapterDoc.select("div.chapter-content").html()
                    
                    chapters.add(
                        Chapter(
                            number = index + 1,
                            title = title.ifBlank { "Chapter ${index + 1}" },
                            content = content,
                            authorNote = chapterDoc.select("div.author-note").html()
                                .takeIf { it.isNotBlank() },
                            wordCount = countWords(chapterDoc.select("div.chapter-content").text())
                        )
                    )
                }
                
                Result.success(chapters)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }
    
    override suspend fun checkForUpdates(
        storyId: String,
        lastChapter: Int
    ): Result<UpdateInfo> {
        return withContext(Dispatchers.IO) {
            try {
                val doc = fetchDocument("$baseUrl/fiction/$storyId")
                val currentChapters = doc.select("table#chapters tr[data-url]").size
                
                val updateInfo = UpdateInfo(
                    hasUpdates = currentChapters > lastChapter,
                    newChapters = (currentChapters - lastChapter).coerceAtLeast(0),
                    currentChapterCount = currentChapters,
                    lastUpdateDate = doc.select("div.fiction-stats time").lastOrNull()?.let { timeElement ->
                        try {
                            LocalDate.parse(timeElement.attr("datetime").substringBefore("T"))
                        } catch (e: Exception) { null }
                    }
                )
                
                Result.success(updateInfo)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }
    
    // Helper functions
    
    private suspend fun fetchDocument(url: String): Document {
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "CleverFerret/1.0 (Android)")
            .build()
        
        return httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw Exception("HTTP error: ${response.code}")
            }
            Jsoup.parse(response.body?.string() ?: "")
        }
    }
    
    private fun extractStatus(doc: Document): CompletionStatus {
        val statusText = doc.select("span.label-sm").text().lowercase()
        return when {
            statusText.contains("completed") -> CompletionStatus.COMPLETE
            statusText.contains("hiatus") -> CompletionStatus.HIATUS
            statusText.contains("dropped") -> CompletionStatus.ABANDONED
            else -> CompletionStatus.IN_PROGRESS
        }
    }
    
    private fun countWords(text: String): Int {
        return text.split(Regex("\\s+")).count { it.isNotBlank() }
    }
}
