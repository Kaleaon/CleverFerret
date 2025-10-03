package com.universalmedialibrary.services.contentcreation

import android.content.Context
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.text.SimpleDateFormat
import java.util.*
import com.universalmedialibrary.services.webfiction.RedditFanficDownloader

/**
 * Basic Fanfiction to EPUB converter without update detection dependencies
 * Used internally by StoryUpdateManager to avoid circular dependencies
 */
class FanfictionToEpubConverterBasic(
    private val context: Context
) {

    data class ConversionResult(
        val success: Boolean,
        val filePath: String? = null,
        val title: String? = null,
        val author: String? = null,
        val chapters: Int = 0,
        val errorMessage: String? = null
    )

    private val epubCreator = SimpleEpubCreator()

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

    // New: Convert Reddit Series (e.g., Out of Cruel Space from r/HFY)
    suspend fun convertRedditSeriesToEpub(seriesQuery: String, subreddit: String = "HFY"): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val downloader = RedditFanficDownloader()
            val series = downloader.fetchSeries(seriesQuery = seriesQuery, subreddit = subreddit)
            if (series.chapters.isEmpty()) {
                return@withContext ConversionResult(success = false, errorMessage = "No chapters found")
            }

            val chapters = series.chapters.mapIndexed { index, ch ->
                SimpleEpubCreator.Chapter(
                    title = if (ch.number > 0) "Chapter ${ch.number}: ${ch.title}" else ch.title,
                    content = ch.html,
                    id = "reddit_${if (ch.number > 0) ch.number else index + 1}"
                )
            }

            val metadata = SimpleEpubCreator.EpubMetadata(
                title = series.seriesTitle,
                author = series.author ?: "Reddit /r/$subreddit",
                description = "Collected chapters for ${series.seriesTitle} from Reddit",
                publisher = "CleverFerret Fanfiction Reader"
            )

            val outputDir = File(context.getExternalFilesDir(null), "epub_exports")
            if (!outputDir.exists()) outputDir.mkdirs()
            val safe = series.seriesTitle.replace(Regex("[^a-zA-Z0-9\\s]"), "").replace(" ", "_")
            val outputFile = File(outputDir, "${safe}_${System.currentTimeMillis()}.epub")
            epubCreator.createEpub(outputFile, metadata, chapters)

            ConversionResult(
                success = true,
                filePath = outputFile.absolutePath,
                title = series.seriesTitle,
                author = series.author ?: "Reddit /r/$subreddit",
                chapters = chapters.size
            )
        } catch (e: Exception) {
            ConversionResult(success = false, errorMessage = e.message)
        }
    }

    // Copy the conversion methods from the original converter
    private suspend fun convertAO3Story(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val workId = Regex("works/(\\d+)").find(url)?.groupValues?.get(1)
                ?: return@withContext ConversionResult(false, errorMessage = "Invalid AO3 URL")
            val fullWorkUrl = "https://archiveofourown.org/works/$workId?view_entire_work=true"
            val document = Jsoup.connect(fullWorkUrl).get()
            val title = document.select("h2.title").first()?.text()?.trim() ?: "Unknown Title"
            val author = document.select("h3.byline a").first()?.text()?.trim() ?: "Unknown Author"
            val summary = document.select(".summary .userstuff").first()?.html() ?: ""
            val fandom = document.select(".fandom .tag").joinToString(", ") { it.text() }
            val chapters = mutableListOf<Chapter>()
            val chapterElements = document.select("#chapters .chapter")
            if (chapterElements.isEmpty()) {
                val content = document.select("#workskin .userstuff").first()?.html() ?: ""
                chapters.add(Chapter("Chapter 1", content, 1))
            } else {
                chapterElements.forEachIndexed { index, element ->
                    val chapterTitle = element.select(".chapter .title").first()?.text() ?: "Chapter ${index + 1}"
                    val chapterContent = element.select(".userstuff").html()
                    chapters.add(Chapter(chapterTitle, chapterContent, index + 1))
                }
            }
            val epubPath = createFanfictionEpub(title, author, chapters, summary, fandom, url)
            ConversionResult(success = true, filePath = epubPath, title = title, author = author, chapters = chapters.size)
        } catch (e: Exception) { ConversionResult(false, errorMessage = "Failed to convert AO3 story: ${e.message}") }
    }

    private suspend fun convertFFNetStory(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val storyId = Regex("s/(\\d+)").find(url)?.groupValues?.get(1)
                ?: return@withContext ConversionResult(false, errorMessage = "Invalid FF.Net URL")
            val document = Jsoup.connect(url).get()
            val title = document.select("#profile_top b").first()?.text()?.trim() ?: "Unknown Title"
            val author = document.select("#profile_top a").first()?.text()?.trim() ?: "Unknown Author"
            val summary = document.select("#profile_top div").first()?.text()?.trim() ?: ""
            val chapterSelect = document.select("#chap_select option")
            val chapters = mutableListOf<Chapter>()
            if (chapterSelect.size <= 1) {
                val content = document.select("#storytext").html()
                chapters.add(Chapter("Chapter 1", content, 1))
            } else {
                for (i in 1..chapterSelect.size) {
                    val chapterUrl = "https://www.fanfiction.net/s/$storyId/$i"
                    val chapterDoc = Jsoup.connect(chapterUrl).get()
                    val chapterContent = chapterDoc.select("#storytext").html()
                    val chapterTitle = chapterDoc.select("#chap_select option[selected]").text().takeIf { it.isNotEmpty() } ?: "Chapter $i"
                    chapters.add(Chapter(chapterTitle, chapterContent, i))
                }
            }
            val epubPath = createFanfictionEpub(title, author, chapters, summary, "FanFiction.Net", url)
            ConversionResult(success = true, filePath = epubPath, title = title, author = author, chapters = chapters.size)
        } catch (e: Exception) { ConversionResult(false, errorMessage = "Failed to convert FF.Net story: ${e.message}") }
    }

    private suspend fun convertWattpadStory(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val document = Jsoup.connect(url).get()
            val title = document.select("h1").first()?.text()?.trim() ?: "Unknown Title"
            val author = document.select(".author-info__username").first()?.text()?.trim() ?: "Unknown Author"
            val summary = document.select(".description").first()?.text()?.trim() ?: ""
            val content = document.select(".part_text").html()
            val chapters = listOf(Chapter("Chapter 1", content, 1))
            val epubPath = createFanfictionEpub(title, author, chapters, summary, "Wattpad", url)
            ConversionResult(success = true, filePath = epubPath, title = title, author = author, chapters = chapters.size)
        } catch (e: Exception) { ConversionResult(false, errorMessage = "Failed to convert Wattpad story: ${e.message}") }
    }

    private suspend fun convertGenericStory(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            val document = Jsoup.connect(url).get()
            val title = document.select("h1").first()?.text() ?: document.select("title").first()?.text() ?: "Unknown Title"
            val author = document.select(".author, .by, [rel=author]").first()?.text() ?: "Unknown Author"
            val contentSelectors = listOf(".story", ".chapter", ".content", ".post", "article", "main")
            var content = ""
            for (selector in contentSelectors) {
                val element = document.select(selector).first()
                if (element != null && element.text().length > 100) {
                    element.select("script, style, nav, header, footer").remove()
                    content = element.html()
                    break
                }
            }
            if (content.isEmpty()) { content = document.select("p").joinToString("<br><br>") { it.html() } }
            val chapters = listOf(Chapter("Chapter 1", content, 1))
            val epubPath = createFanfictionEpub(title, author, chapters, "", "Unknown Site", url)
            ConversionResult(success = true, filePath = epubPath, title = title, author = author, chapters = chapters.size)
        } catch (e: Exception) { ConversionResult(false, errorMessage = "Failed to convert story: ${e.message}") }
    }

    // Internal data classes and helper methods
    private data class Chapter(
        val title: String,
        val content: String,
        val number: Int
    )

    private fun createFanfictionEpub(
        title: String,
        author: String,
        chapters: List<Chapter>,
        summary: String,
        fandom: String,
        sourceUrl: String
    ): String {
        val outputDir = File(context.getExternalFilesDir(null), "epub_exports")
        if (!outputDir.exists()) { outputDir.mkdirs() }
        val safeFileName = title.replace(Regex("[^a-zA-Z0-9\\s]"), "").replace("\\s+".toRegex(), "_")
        val fileName = "${safeFileName}_${System.currentTimeMillis()}.epub"
        val outputFile = File(outputDir, fileName)
        val metadata = SimpleEpubCreator.EpubMetadata(
            title = title,
            author = author,
            description = if (summary.isNotEmpty()) "$fandom fanfiction: $summary" else "$fandom fanfiction converted from: $sourceUrl",
            publisher = "CleverFerret Fanfiction Reader"
        )
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
                        <p><strong>Converted:</strong> ${SimpleDateFormat("MMM dd, yyyy", Locale.US).format(Date())}</p>
                        ${if (summary.isNotEmpty()) "<div class=\"summary\"><h3>Summary:</h3><p>$summary</p></div>" else ""}
                    </div>
                """.trimIndent(),
                id = "info"
            )
            listOf(infoChapter) + epubChapters
        } else {
            val updatedChapter = epubChapters.first().copy(
                content = """
                    <div class="source-info">
                        <p><strong>Source:</strong> <a href="$sourceUrl">$sourceUrl</a></p>
                        <p><strong>Converted:</strong> ${SimpleDateFormat("MMM dd, yyyy", Locale.US).format(Date())}</p>
                        ${if (summary.isNotEmpty()) "<p><strong>Summary:</strong> $summary</p>" else ""}
                    </div>
                    ${epubChapters.first().content}
                """.trimIndent()
            )
            listOf(updatedChapter)
        }
        epubCreator.createEpub(outputFile, metadata, finalChapters)
        return outputFile.absolutePath
    }
}