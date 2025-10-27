package com.universalmedialibrary.services.fanfiction.adapters

import com.universalmedialibrary.services.fanfiction.FanfictionSiteAdapter
import com.universalmedialibrary.services.fanfiction.models.Chapter
import com.universalmedialibrary.services.fanfiction.models.CompletionStatus
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import com.universalmedialibrary.services.fanfiction.models.UpdateInfo
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Adapter for Archive of Our Own (archiveofourown.org)
 * 
 * AO3 is the easiest site to scrape because:
 * - Clean HTML structure
 * - "View entire work" option
 * - Rich, well-structured metadata
 * - No rate limiting (with reasonable use)
 */
@Singleton
class AO3Adapter @Inject constructor(
    private val httpClient: OkHttpClient
) : FanfictionSiteAdapter {
    
    override val siteName = "Archive of Our Own"
    override val baseUrl = "https://archiveofourown.org"
    
    private val urlPattern = Regex("https?://(?:www\\.)?archiveofourown\\.org/works/(\\d+)")
    
    override fun canHandle(url: String): Boolean {
        return urlPattern.matches(url)
    }
    
    override fun extractStoryId(url: String): String? {
        return urlPattern.find(url)?.groupValues?.get(1)
    }
    
    override suspend fun extractMetadata(url: String): Result<StoryMetadata> {
        return withContext(Dispatchers.IO) {
            try {
                val workId = extractStoryId(url) 
                    ?: return@withContext Result.failure(IllegalArgumentException("Invalid AO3 URL"))
                
                // Use view_full_work to get all chapters in one page
                val doc = fetchDocument("$baseUrl/works/$workId?view_full_work=true")
                
                val metadata = StoryMetadata(
                    title = doc.select("h2.title").text().trim(),
                    author = doc.select("h3.byline a[rel=author]").text().trim(),
                    authorUrl = doc.select("h3.byline a[rel=author]").attr("abs:href"),
                    summary = doc.select("div.summary div.userstuff").html(),
                    rating = doc.select("dd.rating a.tag").text(),
                    warnings = doc.select("dd.warning a.tag").map { it.text() },
                    fandoms = doc.select("dd.fandom a.tag").map { it.text() },
                    characters = doc.select("dd.character a.tag").map { it.text() },
                    relationships = doc.select("dd.relationship a.tag").map { it.text() },
                    tags = doc.select("dd.freeform a.tag").map { it.text() },
                    language = doc.select("dd.language").text(),
                    status = extractStatus(doc),
                    wordCount = extractWordCount(doc),
                    chapterCount = extractChapterCount(doc),
                    publishDate = extractDate(doc.select("dd.published").text()),
                    updateDate = extractDate(doc.select("dd.status").text()),
                    coverUrl = null, // AO3 doesn't have built-in covers
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
                val workId = extractStoryId(url)
                    ?: return@withContext Result.failure(IllegalArgumentException("Invalid AO3 URL"))
                
                progressCallback(0, 0, "Fetching story...")
                
                val doc = fetchDocument("$baseUrl/works/$workId?view_full_work=true")
                val chapters = mutableListOf<Chapter>()
                val chapterElements = doc.select("div#chapters div.chapter")
                
                val totalChapters = chapterElements.size
                
                chapterElements.forEachIndexed { index, element ->
                    progressCallback(index + 1, totalChapters, "Processing chapter ${index + 1}...")
                    
                    val chapterTitle = element.select("h3.title").text().trim()
                        .removePrefix("${index + 1}.").trim()
                    
                    val content = element.select("div.userstuff").html()
                    val authorNote = element.select("div.notes").html()
                        .takeIf { it.isNotBlank() }
                    
                    chapters.add(
                        Chapter(
                            number = index + 1,
                            title = chapterTitle.ifBlank { "Chapter ${index + 1}" },
                            content = content,
                            authorNote = authorNote,
                            wordCount = countWords(element.select("div.userstuff").text())
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
                val doc = fetchDocument("$baseUrl/works/$storyId")
                val currentChapters = extractChapterCount(doc)
                val updateDate = extractDate(doc.select("dd.status").text())
                
                val updateInfo = UpdateInfo(
                    hasUpdates = currentChapters > lastChapter,
                    newChapters = (currentChapters - lastChapter).coerceAtLeast(0),
                    currentChapterCount = currentChapters,
                    lastUpdateDate = updateDate
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
        
        val response = httpClient.newCall(request).execute()
        
        if (!response.isSuccessful) {
            throw Exception("HTTP error: ${response.code}")
        }
        
        return Jsoup.parse(response.body?.string() ?: "")
    }
    
    private fun extractStatus(doc: Document): CompletionStatus {
        val statusText = doc.select("dt.status").text().lowercase()
        return when {
            statusText.contains("complete") -> CompletionStatus.COMPLETE
            statusText.contains("hiatus") -> CompletionStatus.HIATUS
            statusText.contains("abandoned") -> CompletionStatus.ABANDONED
            else -> CompletionStatus.IN_PROGRESS
        }
    }
    
    private fun extractWordCount(doc: Document): Int {
        val text = doc.select("dd.words").text().replace(",", "")
        return text.toIntOrNull() ?: 0
    }
    
    private fun extractChapterCount(doc: Document): Int {
        val chaptersText = doc.select("dd.chapters").text() // e.g., "10/15" or "15/15"
        return chaptersText.split("/").firstOrNull()?.toIntOrNull() ?: 1
    }
    
    private fun extractDate(dateStr: String): LocalDate? {
        if (dateStr.isBlank()) return null
        return try {
            LocalDate.parse(dateStr, DateTimeFormatter.ISO_LOCAL_DATE)
        } catch (e: Exception) {
            null
        }
    }
    
    private fun countWords(text: String): Int {
        return text.split(Regex("\\s+")).count { it.isNotBlank() }
    }
}
