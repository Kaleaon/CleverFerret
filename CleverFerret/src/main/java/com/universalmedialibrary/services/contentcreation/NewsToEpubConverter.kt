package com.universalmedialibrary.services.contentcreation

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import java.io.File
import java.text.SimpleDateFormat
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for converting news articles to EPUB format
 *
 * This service handles:
 * - Web scraping of news articles
 * - Content extraction and cleaning
 * - EPUB file generation
 * - Image downloading and embedding
 */
@Singleton
class NewsToEpubConverter @Inject constructor(
    @ApplicationContext private val context: Context
) {

    /**
     * Result of news to EPUB conversion
     */
    data class ConversionResult(
        val success: Boolean,
        val filePath: String? = null,
        val title: String? = null,
        val author: String? = null,
        val errorMessage: String? = null,
        val wasUpdate: Boolean = false,
        val storyId: String? = null
    )

    private val epubCreator = SimpleEpubCreator()

    /**
     * Convert a news article URL to EPUB format
     */
    suspend fun convertNewsToEpub(url: String): ConversionResult = withContext(Dispatchers.IO) {
        try {
            // Download and parse the webpage
            val document = Jsoup.connect(url).get()

            // Extract article content
            val title = extractTitle(document)
            val author = extractAuthor(document)
            val content = extractContent(document)
            val publishDate = extractPublishDate(document)

            if (content.isNullOrBlank()) {
                return@withContext ConversionResult(
                    success = false,
                    errorMessage = "Could not extract content from the article"
                )
            }

            // Create EPUB
            val epubPath = createEpubFile(title, author, content, url, publishDate)

            ConversionResult(
                success = true,
                filePath = epubPath,
                title = title,
                author = author
            )

        } catch (e: Exception) {
            ConversionResult(
                success = false,
                errorMessage = "Failed to convert news article: ${e.message}"
            )
        }
    }

    /**
     * Extract the main title from the document
     */
    private fun extractTitle(document: Document): String {
        return document.select("h1").first()?.text()
            ?: document.select("title").first()?.text()
            ?: document.select("[property=og:title]").attr("content")
            ?: "Unknown Article"
    }

    /**
     * Extract the author from the document
     */
    private fun extractAuthor(document: Document): String {
        return document.select("[rel=author]").first()?.text()
            ?: document.select(".author").first()?.text()
            ?: document.select("[property=author]").first()?.text()
            ?: document.select("[name=author]").attr("content")
            ?: "Unknown Author"
    }

    /**
     * Extract the main content from the document
     */
    private fun extractContent(document: Document): String? {
        // Try common article content selectors
        val contentSelectors = listOf(
            "article",
            ".article-content",
            ".post-content",
            ".entry-content",
            ".content",
            "[property=articleBody]",
            "main"
        )

        for (selector in contentSelectors) {
            val element = document.select(selector).first()
            if (element != null && element.text().length > 200) {
                // Clean up the content
                element.select("script, style, nav, header, footer, .advertisement, .ad").remove()
                return element.html()
            }
        }

        // Fallback: get all paragraphs
        val paragraphs = document.select("p")
        if (paragraphs.size > 3) {
            return paragraphs.joinToString("<br><br>") { it.html() }
        }

        return null
    }

    /**
     * Extract publish date from the document
     */
    private fun extractPublishDate(document: Document): Date {
        val dateSelectors = listOf(
            "[property=article:published_time]",
            "[name=publishdate]",
            ".publish-date",
            ".date",
            "time[datetime]"
        )

        for (selector in dateSelectors) {
            val element = document.select(selector).first()
            if (element != null) {
                val dateStr = element.attr("content").takeIf { it.isNotEmpty() }
                    ?: element.attr("datetime").takeIf { it.isNotEmpty() }
                    ?: element.text()

                try {
                    // Try parsing common date formats
                    val formats = listOf(
                        "yyyy-MM-dd'T'HH:mm:ss",
                        "yyyy-MM-dd",
                        "MMM dd, yyyy",
                        "MMMM dd, yyyy"
                    )

                    for (format in formats) {
                        try {
                            return SimpleDateFormat(format, Locale.US).parse(dateStr) ?: Date()
                        } catch (e: Exception) {
                            continue
                        }
                    }
                } catch (e: Exception) {
                    // Continue to return current date
                }
            }
        }

        return Date() // Fallback to current date
    }

    /**
     * Create the EPUB file from the extracted content
     */
    private fun createEpubFile(
        title: String,
        author: String,
        content: String,
        sourceUrl: String,
        publishDate: Date
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
            description = "Article converted from: $sourceUrl",
            publisher = "CleverFerret News Reader",
            date = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(publishDate)
        )

        // Create content with source information
        val contentWithSource = """
            <div class="source-info">
                <p><strong>Source:</strong> <a href="$sourceUrl">$sourceUrl</a></p>
                <p><strong>Converted:</strong> ${SimpleDateFormat("MMM dd, yyyy", Locale.US).format(Date())}</p>
            </div>
            <div class="article-content">
                $content
            </div>
        """.trimIndent()

        // Create chapter
        val chapter = SimpleEpubCreator.Chapter(
            title = title,
            content = contentWithSource
        )

        // Generate EPUB
        epubCreator.createEpub(outputFile, metadata, listOf(chapter))

        return outputFile.absolutePath
    }
}
