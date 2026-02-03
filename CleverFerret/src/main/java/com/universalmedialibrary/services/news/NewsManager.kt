package com.universalmedialibrary.services.news

import android.content.Context
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.contentcreation.SimpleEpubCreator
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserFactory
import java.io.File
import java.net.URL
import java.text.SimpleDateFormat
import java.time.Instant
import java.time.ZoneOffset
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manages the downloading and generation of news ebooks from recipes.
 */
@Singleton
class NewsManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaRepository: MediaRepository,
    private val libraryRepository: LibraryRepository
) {

    private val epubCreator = SimpleEpubCreator()

    /**
     * Execute a news recipe and generate an EPUB.
     */
    suspend fun downloadRecipe(recipe: NewsRecipe): Result<File> = withContext(Dispatchers.IO) {
        try {
            val articles = mutableListOf<NewsArticle>()

            // 1. Fetch all feeds
            for (feed in recipe.feeds) {
                val feedArticles = fetchFeed(feed, recipe)
                articles.addAll(feedArticles)
            }

            if (articles.isEmpty()) {
                return@withContext Result.failure(Exception("No articles found for ${recipe.title}"))
            }

            // 2. Download content for each article
            val processedChapters = articles.mapNotNull { article ->
                downloadArticleContent(article, recipe)?.let { content ->
                    SimpleEpubCreator.Chapter(
                        title = article.title,
                        content = content,
                        id = "article_${article.url.hashCode()}"
                    )
                }
            }

            if (processedChapters.isEmpty()) {
                return@withContext Result.failure(Exception("Failed to download any article content"))
            }

            // 3. Generate EPUB
            val outputDir = File(context.getExternalFilesDir(null), "news")
            if (!outputDir.exists()) outputDir.mkdirs()

            val dateStr = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(Date())
            val fileName = "${recipe.title.replace(" ", "_")}_$dateStr.epub"
            val outputFile = File(outputDir, fileName)

            val metadata = SimpleEpubCreator.EpubMetadata(
                title = "${recipe.title} - $dateStr",
                author = "CleverFerret News",
                description = recipe.description,
                publisher = recipe.title,
                date = dateStr
            )

            epubCreator.createEpub(outputFile, metadata, processedChapters)

            // 4. Add to Library
            addToLibrary(outputFile, recipe, metadata)

            Result.success(outputFile)

        } catch (e: Exception) {
            e.printStackTrace()
            Result.failure(e)
        }
    }

    private suspend fun fetchFeed(feed: NewsFeed, recipe: NewsRecipe): List<NewsArticle> {
        return try {
            val url = URL(feed.url)
            val factory = XmlPullParserFactory.newInstance()
            val xpp = factory.newPullParser()
            
            url.openStream().use { inputStream ->
                xpp.setInput(inputStream, "UTF-8")
                
                val articles = mutableListOf<NewsArticle>()
                var eventType = xpp.eventType
                var currentTag = ""
                
                var title = ""
                var link = ""
                var desc = ""
                var pubDate = ""
                var insideItem = false
                
                while (eventType != XmlPullParser.END_DOCUMENT) {
                    if (eventType == XmlPullParser.START_TAG) {
                        currentTag = xpp.name.lowercase()
                        if (currentTag == "item" || currentTag == "entry") {
                            insideItem = true
                            title = ""
                            link = ""
                            desc = ""
                            pubDate = ""
                        }
                    } else if (eventType == XmlPullParser.TEXT) {
                        if (insideItem) {
                            when (currentTag) {
                                "title" -> title = xpp.text
                                "link" -> link = xpp.text // Atom uses href attribute, RSS uses text
                                "description", "summary", "content" -> desc = xpp.text
                                "pubdate", "published", "dc:date" -> pubDate = xpp.text
                            }
                        }
                    } else if (eventType == XmlPullParser.END_TAG) {
                        if (xpp.name.lowercase() == "item" || xpp.name.lowercase() == "entry") {
                            insideItem = false
                            if (title.isNotBlank() && link.isNotBlank()) {
                                if (isWithinAge(pubDate, recipe.oldestArticleDays)) {
                                    articles.add(NewsArticle(title, link, desc, pubDate, feed.title))
                                }
                            }
                        }
                    }
                    eventType = xpp.next()
                }
                
                // Limit articles
                if (recipe.maxArticlesPerFeed > 0) {
                    articles.take(recipe.maxArticlesPerFeed)
                } else {
                    articles
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
            emptyList()
        }
    }

    private fun isWithinAge(pubDate: String, maxAgeDays: Int): Boolean {
        if (maxAgeDays <= 0) return true
        if (pubDate.isBlank()) return true

        val publishedAt = parseDate(pubDate) ?: return true
        val cutoff = Instant.now().minusSeconds(maxAgeDays.toLong() * 24 * 60 * 60)
        return publishedAt.isAfter(cutoff)
    }

    private fun parseDate(raw: String): Instant? {
        val cleaned = raw.trim()
        val rfc1123 = runCatching { DateTimeFormatter.RFC_1123_DATE_TIME.parse(cleaned, Instant::from) }
            .getOrNull()
        if (rfc1123 != null) return rfc1123

        val isoFormats = listOf(
            DateTimeFormatter.ISO_OFFSET_DATE_TIME,
            DateTimeFormatter.ISO_INSTANT,
            DateTimeFormatter.ISO_ZONED_DATE_TIME,
            DateTimeFormatter.ISO_LOCAL_DATE_TIME
        )
        isoFormats.forEach { formatter ->
            try {
                return formatter.parse(cleaned, Instant::from)
            } catch (_: DateTimeParseException) {
                // continue
            }
        }

        val legacyFormats = listOf(
            "EEE, dd MMM yyyy HH:mm:ss Z",
            "EEE, dd MMM yyyy HH:mm Z",
            "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
            "yyyy-MM-dd'T'HH:mm:ss'Z'",
            "yyyy-MM-dd"
        )
        legacyFormats.forEach { pattern ->
            runCatching {
                val formatter = SimpleDateFormat(pattern, Locale.US).apply {
                    timeZone = TimeZone.getTimeZone("UTC")
                }
                return formatter.parse(cleaned)?.toInstant()
            }
        }

        return null
    }

    private fun downloadArticleContent(article: NewsArticle, recipe: NewsRecipe): String? {
        try {
            val doc = Jsoup.connect(article.url)
                .userAgent(recipe.userAgent)
                .timeout(10000)
                .get()

            // Cleanup
            if (recipe.removeTags.isNotEmpty()) {
                for (selector in recipe.removeTags) {
                    doc.select(selector).remove()
                }
            }

            // Extract content
            var contentElement: org.jsoup.nodes.Element? = null
            
            if (recipe.keepOnlyTags.isNotEmpty()) {
                for (selector in recipe.keepOnlyTags) {
                    contentElement = doc.selectFirst(selector)
                    if (contentElement != null) break
                }
            }

            // Auto-detection (Readability heuristic) if no explicit tags or explicit failed
            if (contentElement == null && recipe.autoCleanup) {
                contentElement = doc.select("article").first()
                    ?: doc.select(".post-content").first()
                    ?: doc.select(".entry-content").first()
                    ?: doc.select(".article-body").first()
                    ?: doc.select("main").first()
                    ?: doc.body() // Fallback
            }

            if (contentElement == null) return null

            // Basic formatting
            return buildString {
                append("<h2>${article.title}</h2>")
                append("<p><em>${article.date} - ${article.feedName}</em></p>")
                append("<hr/>")
                append(contentElement.html())
                append("<hr/>")
                append("<p><a href='${article.url}'>Original Article</a></p>")
            }

        } catch (e: Exception) {
            e.printStackTrace()
            return null
        }
    }

    private suspend fun addToLibrary(file: File, recipe: NewsRecipe, metadata: SimpleEpubCreator.EpubMetadata) {
        // Find or create "News" library
        val library = libraryRepository.getLibrariesByType("BOOK").first().find { it.name == "News" } ?: run {
            val libId = libraryRepository.createLibrary(
                com.universalmedialibrary.data.local.entity.Library(
                    name = "News",
                    path = file.parent ?: "",
                    type = "BOOK",
                    dateModified = System.currentTimeMillis()
                )
            )
            libraryRepository.getLibraryById(libId)!!
        }

        // Create MediaItem
        val mediaItem = MediaItem(
            libraryId = library.libraryId,
            filePath = file.absolutePath,
            fileName = file.name,
            fileExtension = "epub",
            fileSize = file.length(),
            mediaType = "BOOK",
            mimeType = "application/epub+zip",
            dateAdded = System.currentTimeMillis(),
            lastModified = System.currentTimeMillis(),
            lastScanned = System.currentTimeMillis(),
            isAvailable = true,
            hasMetadata = true,
            hasThumbnail = false
        )
        
        val itemId = mediaRepository.createMediaItem(mediaItem)

        // Add Metadata
        val meta = MetadataCommon(
            itemId = itemId,
            title = metadata.title,
            summary = metadata.description,
            lastUpdated = System.currentTimeMillis()
        )
        mediaRepository.saveCommonMetadata(meta)
    }

    private data class NewsArticle(
        val title: String,
        val url: String,
        val description: String,
        val date: String,
        val feedName: String
    )
}
