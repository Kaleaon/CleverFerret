package com.universalmedialibrary.services.contentcreation

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * News download service inspired by Calibre's news recipe system
 * Fetches articles from RSS feeds and converts to EPUB
 */
@Singleton
class NewsDownloadService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val httpClient: OkHttpClient
) {
    private val epubCreator = SimpleEpubCreator()
    
    private val _downloadProgress = MutableStateFlow<DownloadState>(DownloadState.Idle)
    val downloadProgress: StateFlow<DownloadState> = _downloadProgress.asStateFlow()

    sealed class DownloadState {
        object Idle : DownloadState()
        data class Downloading(val source: String, val progress: Float) : DownloadState()
        data class Success(val filePath: String, val articleCount: Int) : DownloadState()
        data class Error(val message: String) : DownloadState()
    }

    /**
     * Popular news sources (based on Calibre's built-in recipes)
     */
    enum class NewsSource(
        val displayName: String,
        val rssUrl: String,
        val description: String
    ) {
        // General News
        BBC_NEWS(
            "BBC News",
            "http://feeds.bbci.co.uk/news/rss.xml",
            "British Broadcasting Corporation - Top Stories"
        ),
        REUTERS(
            "Reuters",
            "https://www.reutersagency.com/feed/?taxonomy=best-topics&post_type=best",
            "Reuters Top News"
        ),
        NPR_NEWS(
            "NPR News",
            "https://feeds.npr.org/1001/rss.xml",
            "National Public Radio - Top Stories"
        ),
        
        // Tech News
        ARS_TECHNICA(
            "Ars Technica",
            "http://feeds.arstechnica.com/arstechnica/index",
            "Technology News and Analysis"
        ),
        THE_VERGE(
            "The Verge",
            "https://www.theverge.com/rss/index.xml",
            "Technology, Science, Art, and Culture"
        ),
        WIRED(
            "Wired",
            "https://www.wired.com/feed/rss",
            "Technology and Innovation News"
        ),
        HACKER_NEWS(
            "Hacker News",
            "https://hnrss.org/frontpage",
            "Hacker News Front Page"
        ),
        
        // Science
        SCIENTIFIC_AMERICAN(
            "Scientific American",
            "http://rss.sciam.com/ScientificAmerican-Global",
            "Science News and Articles"
        ),
        
        // Business
        ECONOMIST(
            "The Economist",
            "https://www.economist.com/latest/rss.xml",
            "Business and Finance News"
        );

        companion object {
            fun fromDisplayName(name: String): NewsSource? {
                return values().firstOrNull { it.displayName == name }
            }
        }
    }

    /**
     * Download news articles from a source and create EPUB
     */
    suspend fun downloadNews(
        source: NewsSource,
        maxArticles: Int = 25
    ): Result<DownloadResult> = withContext(Dispatchers.IO) {
        try {
            _downloadProgress.value = DownloadState.Downloading(source.displayName, 0.1f)

            // Fetch RSS feed
            val articles = fetchRssFeed(source.rssUrl, maxArticles)
            
            if (articles.isEmpty()) {
                val error = "No articles found in feed"
                _downloadProgress.value = DownloadState.Error(error)
                return@withContext Result.failure(Exception(error))
            }

            _downloadProgress.value = DownloadState.Downloading(source.displayName, 0.5f)

            // Convert to chapters
            val chapters = articles.mapIndexed { index, article ->
                SimpleEpubCreator.Chapter(
                    title = article.title,
                    content = """
                        <h2>${article.title}</h2>
                        <p><em>Published: ${article.pubDate}</em></p>
                        <p><em>Source: <a href="${article.link}">${source.displayName}</a></em></p>
                        <hr/>
                        ${article.content}
                    """.trimIndent(),
                    id = "article_$index"
                )
            }

            // Create EPUB
            val outputDir = File(context.filesDir, "news")
            outputDir.mkdirs()
            
            val timestamp = System.currentTimeMillis()
            val fileName = "${source.displayName.replace(" ", "_")}_$timestamp.epub"
            val outputFile = File(outputDir, fileName)

            val metadata = SimpleEpubCreator.EpubMetadata(
                title = "${source.displayName} - ${java.text.SimpleDateFormat("MMM dd, yyyy", java.util.Locale.US).format(java.util.Date())}",
                author = source.displayName,
                description = source.description,
                publisher = "CleverFerret News"
            )

            epubCreator.createEpub(outputFile, metadata, chapters)

            _downloadProgress.value = DownloadState.Success(
                outputFile.absolutePath,
                articles.size
            )

            Result.success(DownloadResult(
                filePath = outputFile.absolutePath,
                source = source.displayName,
                articleCount = articles.size
            ))

        } catch (e: Exception) {
            Log.e("NewsDownload", "Failed to download news", e)
            val error = "Download failed: ${e.message}"
            _downloadProgress.value = DownloadState.Error(error)
            Result.failure(e)
        }
    }

    /**
     * Fetch and parse RSS feed
     */
    private suspend fun fetchRssFeed(rssUrl: String, maxArticles: Int): List<Article> {
        return withContext(Dispatchers.IO) {
            try {
                val request = Request.Builder().url(rssUrl).build()
                val response = httpClient.newCall(request).execute()
                
                if (!response.isSuccessful) {
                    return@withContext emptyList()
                }

                val xml = response.body?.string() ?: return@withContext emptyList()
                val doc = Jsoup.parse(xml, "", org.jsoup.parser.Parser.xmlParser())

                doc.select("item").take(maxArticles).mapNotNull { item ->
                    try {
                        Article(
                            title = item.select("title").text(),
                            link = item.select("link").text(),
                            content = item.select("description").html()
                                .ifEmpty { item.select("content\\:encoded").html() },
                            pubDate = item.select("pubDate").text()
                        )
                    } catch (e: Exception) {
                        Log.w("NewsDownload", "Failed to parse article", e)
                        null
                    }
                }
            } catch (e: Exception) {
                Log.e("NewsDownload", "Failed to fetch RSS feed", e)
                emptyList()
            }
        }
    }

    /**
     * Get list of available news sources
     */
    fun getAvailableSources(): List<SourceInfo> {
        return NewsSource.values().map { source ->
            SourceInfo(
                name = source.displayName,
                description = source.description,
                category = when (source) {
                    NewsSource.BBC_NEWS, NewsSource.REUTERS, NewsSource.NPR_NEWS -> "General News"
                    NewsSource.ARS_TECHNICA, NewsSource.THE_VERGE, NewsSource.WIRED, NewsSource.HACKER_NEWS -> "Technology"
                    NewsSource.SCIENTIFIC_AMERICAN -> "Science"
                    NewsSource.ECONOMIST -> "Business"
                }
            )
        }
    }

    fun resetState() {
        _downloadProgress.value = DownloadState.Idle
    }

    data class Article(
        val title: String,
        val link: String,
        val content: String,
        val pubDate: String
    )

    data class DownloadResult(
        val filePath: String,
        val source: String,
        val articleCount: Int
    )

    data class SourceInfo(
        val name: String,
        val description: String,
        val category: String
    )
}
