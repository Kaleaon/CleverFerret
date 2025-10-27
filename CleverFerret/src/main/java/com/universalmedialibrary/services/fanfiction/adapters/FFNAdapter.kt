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
 * Adapter for FanFiction.Net (fanfiction.net)
 * 
 * FFN requires more complex handling:
 * - Multi-page stories (need to iterate chapters)
 * - Rate limiting
 * - Less structured metadata
 */
@Singleton
class FFNAdapter @Inject constructor(
    private val httpClient: OkHttpClient
) : FanfictionSiteAdapter {
    
    override val siteName = "FanFiction.Net"
    override val baseUrl = "https://www.fanfiction.net"
    
    private val urlPattern = Regex("https?://(?:www\\.)?fanfiction\\.net/s/(\\d+)")
    
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
                    ?: return@withContext Result.failure(IllegalArgumentException("Invalid FFN URL"))
                
                val doc = fetchDocument("$baseUrl/s/$storyId/1/")
                
                val title = doc.select("#profile_top b.xcontrast_txt").first()?.text() ?: ""
                val author = doc.select("#profile_top a.xcontrast_txt").first()?.text() ?: ""
                val authorUrl = doc.select("#profile_top a.xcontrast_txt").first()
                    ?.attr("abs:href")
                
                // FFN stores metadata in a complex string
                val metadataText = doc.select("#profile_top div.xcontrast_txt").text()
                
                val metadata = StoryMetadata(
                    title = title,
                    author = author,
                    authorUrl = authorUrl,
                    summary = doc.select("#profile_top div").first()?.text() ?: "",
                    rating = extractRating(metadataText),
                    warnings = emptyList(), // FFN doesn't have explicit warnings
                    fandoms = listOf(extractFandom(doc)),
                    characters = extractCharacters(metadataText),
                    relationships = extractPairings(metadataText),
                    tags = extractGenres(metadataText),
                    language = extractLanguage(metadataText),
                    status = extractStatus(metadataText),
                    wordCount = extractWordCount(metadataText),
                    chapterCount = extractChapterCount(metadataText),
                    publishDate = extractPublishDate(metadataText),
                    updateDate = extractUpdateDate(metadataText),
                    coverUrl = null,
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
                    ?: return@withContext Result.failure(IllegalArgumentException("Invalid FFN URL"))
                
                // First, get metadata to know chapter count
                val firstDoc = fetchDocument("$baseUrl/s/$storyId/1/")
                val metadataText = firstDoc.select("#profile_top div.xcontrast_txt").text()
                val totalChapters = extractChapterCount(metadataText)
                
                val chapters = mutableListOf<Chapter>()
                
                for (chapterNum in 1..totalChapters) {
                    progressCallback(chapterNum, totalChapters, "Downloading chapter $chapterNum...")
                    
                    val chapterDoc = if (chapterNum == 1) {
                        firstDoc
                    } else {
                        // Rate limiting - be nice to FFN servers
                        delay(1000)
                        fetchDocument("$baseUrl/s/$storyId/$chapterNum/")
                    }
                    
                    val chapterTitle = chapterDoc.select("#chap_select option[selected]")
                        .text()
                        .removePrefix("$chapterNum. ")
                    
                    val content = chapterDoc.select("#storytext").html()
                    
                    chapters.add(
                        Chapter(
                            number = chapterNum,
                            title = chapterTitle.ifBlank { "Chapter $chapterNum" },
                            content = content,
                            authorNote = null,
                            wordCount = countWords(chapterDoc.select("#storytext").text())
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
                val doc = fetchDocument("$baseUrl/s/$storyId/1/")
                val metadataText = doc.select("#profile_top div.xcontrast_txt").text()
                val currentChapters = extractChapterCount(metadataText)
                val updateDate = extractUpdateDate(metadataText)
                
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
        
        return httpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw Exception("HTTP error: ${response.code}")
            }
            Jsoup.parse(response.body?.string() ?: "")
        }
    }
    
    private fun extractFandom(doc: Document): String {
        return doc.select("#pre_story_links a").lastOrNull()?.text() ?: ""
    }
    
    private fun extractRating(metadata: String): String {
        val ratingMatch = Regex("Rated:\\s*(\\w+)").find(metadata)
        return ratingMatch?.groupValues?.get(1) ?: "Not Rated"
    }
    
    private fun extractCharacters(metadata: String): List<String> {
        // Characters are usually listed before " - " separator
        val parts = metadata.split(" - ")
        if (parts.size < 3) return emptyList()
        
        return parts[2].split(",").map { it.trim() }.filter { it.isNotBlank() }
    }
    
    private fun extractPairings(metadata: String): List<String> {
        // Pairings are shown with [brackets]
        val pairingMatches = Regex("\\[([^\\]]+)\\]").findAll(metadata)
        return pairingMatches.map { it.groupValues[1] }.toList()
    }
    
    private fun extractGenres(metadata: String): List<String> {
        val genreMatch = Regex("-(\\w+(?:/\\w+)?)-").find(metadata)
        return genreMatch?.groupValues?.get(1)?.split("/") ?: emptyList()
    }
    
    private fun extractLanguage(metadata: String): String {
        return "English" // FFN is primarily English, would need more complex parsing
    }
    
    private fun extractStatus(metadata: String): CompletionStatus {
        return if (metadata.contains("Complete", ignoreCase = true)) {
            CompletionStatus.COMPLETE
        } else {
            CompletionStatus.IN_PROGRESS
        }
    }
    
    private fun extractWordCount(metadata: String): Int {
        val wordMatch = Regex("Words:\\s*([\\d,]+)").find(metadata)
        return wordMatch?.groupValues?.get(1)?.replace(",", "")?.toIntOrNull() ?: 0
    }
    
    private fun extractChapterCount(metadata: String): Int {
        val chapterMatch = Regex("Chapters:\\s*(\\d+)").find(metadata)
        return chapterMatch?.groupValues?.get(1)?.toIntOrNull() ?: 1
    }
    
    private fun extractPublishDate(metadata: String): LocalDate? {
        val dateMatch = Regex("Published:\\s*([^-]+)").find(metadata)
        return dateMatch?.groupValues?.get(1)?.trim()?.let { parseFFNDate(it) }
    }
    
    private fun extractUpdateDate(metadata: String): LocalDate? {
        val dateMatch = Regex("Updated:\\s*([^-]+)").find(metadata)
        return dateMatch?.groupValues?.get(1)?.trim()?.let { parseFFNDate(it) }
    }
    
    private fun parseFFNDate(dateStr: String): LocalDate? {
        // FFN uses format like "Jan 15, 2023" or "1/15/2023"
        return try {
            // This is simplified - would need more robust date parsing
            null
        } catch (e: Exception) {
            null
        }
    }
    
    private fun countWords(text: String): Int {
        return text.split(Regex("\\s+")).count { it.isNotBlank() }
    }
}
