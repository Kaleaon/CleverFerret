package com.universalmedialibrary.services.contentcreation

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import java.io.File
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for converting fanfiction stories to EPUB format
 * 
 * Supports popular fanfiction sites:
 * - Archive of Our Own (AO3)
 * - FanFiction.Net
 * - Wattpad
 * - Other sites with detectable patterns
 */
@Singleton
class FanfictionToEpubConverter @Inject constructor(
    @ApplicationContext private val context: Context
) {

    /**
     * Result of fanfiction to EPUB conversion
     */
    data class ConversionResult(
        val success: Boolean,
        val filePath: String? = null,
        val title: String? = null,
        val author: String? = null,
        val chapters: Int = 0,
        val errorMessage: String? = null
    )

    /**
     * Chapter information for multi-chapter stories
     */
    data class Chapter(
        val title: String,
        val content: String,
        val number: Int
    )

    private val epubCreator = SimpleEpubCreator()

    /**
     * Convert a fanfiction URL to EPUB format
     */
    suspend fun convertFanfictionToEpub(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            when {
                url.contains("archiveofourown.org") -> convertAO3Story(url)
                url.contains("fanfiction.net") -> convertFFNetStory(url)
                url.contains("wattpad.com") -> convertWattpadStory(url)
                else -> convertGenericStory(url)
            }
        } catch (e: Exception) {
            ConversionResult(
                success = false,
                errorMessage = "Failed to convert fanfiction: ${e.message}"
            )
        }
    }
    
    /**
     * Convert Archive of Our Own story
     */
    private suspend fun convertAO3Story(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            // Get the work ID from URL
            val workId = Regex("works/(\\d+)").find(url)?.groupValues?.get(1)
                ?: return@withContext ConversionResult(false, errorMessage = "Invalid AO3 URL")
            
            // Use the entire work download URL
            val fullWorkUrl = "https://archiveofourown.org/works/$workId?view_entire_work=true"
            val document = Jsoup.connect(fullWorkUrl).get()
            
            val title = document.select("h2.title").first()?.text()?.trim() ?: "Unknown Title"
            val author = document.select("h3.byline a").first()?.text()?.trim() ?: "Unknown Author"
            val summary = document.select(".summary .userstuff").first()?.html() ?: ""
            val fandom = document.select(".fandom .tag").joinToString(", ") { it.text() }
            
            // Extract all chapters
            val chapters = mutableListOf<Chapter>()
            val chapterElements = document.select("#chapters .chapter")
            
            if (chapterElements.isEmpty()) {
                // Single chapter story
                val content = document.select("#workskin .userstuff").first()?.html() ?: ""
                chapters.add(Chapter("Chapter 1", content, 1))
            } else {
                // Multi-chapter story
                chapterElements.forEachIndexed { index, element ->
                    val chapterTitle = element.select(".chapter .title").first()?.text() ?: "Chapter ${index + 1}"
                    val chapterContent = element.select(".userstuff").html()
                    chapters.add(Chapter(chapterTitle, chapterContent, index + 1))
                }
            }
            
            val epubPath = createFanfictionEpub(title, author, chapters, summary, fandom, url)
            
            ConversionResult(
                success = true,
                filePath = epubPath,
                title = title,
                author = author,
                chapters = chapters.size
            )
            
        } catch (e: Exception) {
            ConversionResult(false, errorMessage = "Failed to convert AO3 story: ${e.message}")
        }
    }
    
    /**
     * Convert FanFiction.Net story
     */
    private suspend fun convertFFNetStory(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val storyId = Regex("s/(\\d+)").find(url)?.groupValues?.get(1)
                ?: return@withContext ConversionResult(false, errorMessage = "Invalid FF.Net URL")
            
            val document = Jsoup.connect(url).get()
            val title = document.select("#profile_top b").first()?.text()?.trim() ?: "Unknown Title"
            val author = document.select("#profile_top a").first()?.text()?.trim() ?: "Unknown Author"
            val summary = document.select("#profile_top div").first()?.text()?.trim() ?: ""
            
            // Check if multi-chapter
            val chapterSelect = document.select("#chap_select option")
            val chapters = mutableListOf<Chapter>()
            
            if (chapterSelect.size <= 1) {
                // Single chapter
                val content = document.select("#storytext").html()
                chapters.add(Chapter("Chapter 1", content, 1))
            } else {
                // Multi-chapter - need to fetch each chapter
                for (i in 1..chapterSelect.size) {
                    val chapterUrl = "https://www.fanfiction.net/s/$storyId/$i"
                    val chapterDoc = Jsoup.connect(chapterUrl).get()
                    val chapterContent = chapterDoc.select("#storytext").html()
                    val chapterTitle = chapterDoc.select("#chap_select option[selected]").text().takeIf { it.isNotEmpty() } ?: "Chapter $i"
                    chapters.add(Chapter(chapterTitle, chapterContent, i))
                }
            }
            
            val epubPath = createFanfictionEpub(title, author, chapters, summary, "FanFiction.Net", url)
            
            ConversionResult(
                success = true,
                filePath = epubPath,
                title = title,
                author = author,
                chapters = chapters.size
            )
            
        } catch (e: Exception) {
            ConversionResult(false, errorMessage = "Failed to convert FF.Net story: ${e.message}")
        }
    }
    
    /**
     * Convert Wattpad story
     */
    private suspend fun convertWattpadStory(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val document = Jsoup.connect(url).get()
            val title = document.select("h1").first()?.text()?.trim() ?: "Unknown Title"
            val author = document.select(".author-info__username").first()?.text()?.trim() ?: "Unknown Author"
            val summary = document.select(".description").first()?.text()?.trim() ?: ""
            
            // For Wattpad, we'll get the current chapter only (full story conversion would require authentication)
            val content = document.select(".part_text").html()
            val chapters = listOf(Chapter("Chapter 1", content, 1))
            
            val epubPath = createFanfictionEpub(title, author, chapters, summary, "Wattpad", url)
            
            ConversionResult(
                success = true,
                filePath = epubPath,
                title = title,
                author = author,
                chapters = chapters.size
            )
            
        } catch (e: Exception) {
            ConversionResult(false, errorMessage = "Failed to convert Wattpad story: ${e.message}")
        }
    }
    
    /**
     * Generic fanfiction converter for unknown sites
     */
    private suspend fun convertGenericStory(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val document = Jsoup.connect(url).get()
            val title = extractGenericTitle(document)
            val author = extractGenericAuthor(document)
            val content = extractGenericContent(document)
            
            val chapters = listOf(Chapter("Chapter 1", content, 1))
            val epubPath = createFanfictionEpub(title, author, chapters, "", "Unknown Site", url)
            
            ConversionResult(
                success = true,
                filePath = epubPath,
                title = title,
                author = author,
                chapters = chapters.size
            )
            
        } catch (e: Exception) {
            ConversionResult(false, errorMessage = "Failed to convert story: ${e.message}")
        }
    }
    
    private fun extractGenericTitle(document: Document): String {
        return document.select("h1").first()?.text()
            ?: document.select("title").first()?.text()
            ?: "Unknown Title"
    }
    
    private fun extractGenericAuthor(document: Document): String {
        return document.select(".author, .by, [rel=author]").first()?.text()
            ?: "Unknown Author"
    }
    
    private fun extractGenericContent(document: Document): String {
        val contentSelectors = listOf(
            ".story", ".chapter", ".content", ".post", "article", "main"
        )
        
        for (selector in contentSelectors) {
            val element = document.select(selector).first()
            if (element != null && element.text().length > 100) {
                element.select("script, style, nav, header, footer").remove()
                return element.html()
            }
        }
        
        return document.select("p").joinToString("<br><br>") { it.html() }
    }
    
    /**
     * Create EPUB file from fanfiction data
     */
    private fun createFanfictionEpub(
        title: String,
        author: String,
        chapters: List<Chapter>,
        summary: String,
        fandom: String,
        sourceUrl: String
    ): String {
        // Create output file
        val outputDir = File(context.getExternalFilesDir(null), "epub_exports")
        if (!outputDir.exists()) {
            outputDir.mkdirs()
        }
        
        val safeFileName = title.replace(Regex("[^a-zA-Z0-9\\s]"), "").replace("\\s+".toRegex(), "_")
        val fileName = "${safeFileName}_${System.currentTimeMillis()}.epub"
        val outputFile = File(outputDir, fileName)
        
        // Create metadata
        val metadata = SimpleEpubCreator.EpubMetadata(
            title = title,
            author = author,
            description = if (summary.isNotEmpty()) "$fandom fanfiction: $summary" else "$fandom fanfiction converted from: $sourceUrl",
            publisher = "CleverFerret Fanfiction Reader"
        )
        
        // Convert to SimpleEpubCreator chapters
        val epubChapters = chapters.map { chapter ->
            val chapterContent = """
                <div class="chapter-content">
                    ${chapter.content}
                </div>
            """.trimIndent()
            
            SimpleEpubCreator.Chapter(
                title = chapter.title,
                content = chapterContent,
                id = "chapter_${chapter.number}"
            )
        }
        
        // Add source information as first chapter if multiple chapters
        val finalChapters = if (chapters.size > 1) {
            val infoChapter = SimpleEpubCreator.Chapter(
                title = "Story Information",
                content = """
                    <div class="source-info">
                        <h2>$title</h2>
                        <p><strong>Author:</strong> $author</p>
                        <p><strong>Fandom:</strong> $fandom</p>
                        <p><strong>Chapters:</strong> ${chapters.size}</p>
                        <p><strong>Source:</strong> <a href="$sourceUrl">$sourceUrl</a></p>
                        <p><strong>Converted:</strong> ${java.text.SimpleDateFormat("MMM dd, yyyy", Locale.US).format(Date())}</p>
                        ${if (summary.isNotEmpty()) "<div class=\"summary\"><h3>Summary:</h3><p>$summary</p></div>" else ""}
                    </div>
                """.trimIndent(),
                id = "info"
            )
            listOf(infoChapter) + epubChapters
        } else {
            // For single chapter, add source info to the chapter
            val updatedChapter = epubChapters.first().copy(
                content = """
                    <div class="source-info">
                        <p><strong>Source:</strong> <a href="$sourceUrl">$sourceUrl</a></p>
                        <p><strong>Converted:</strong> ${java.text.SimpleDateFormat("MMM dd, yyyy", Locale.US).format(Date())}</p>
                        ${if (summary.isNotEmpty()) "<p><strong>Summary:</strong> $summary</p>" else ""}
                    </div>
                    ${epubChapters.first().content}
                """.trimIndent()
            )
            listOf(updatedChapter)
        }
        
        // Generate EPUB
        epubCreator.createEpub(outputFile, metadata, finalChapters)
        
        return outputFile.absolutePath
    }
}