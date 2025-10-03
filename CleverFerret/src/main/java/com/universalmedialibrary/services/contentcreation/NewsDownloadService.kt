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
     * Comprehensive news sources organized by country (based on Calibre's built-in recipes)
     */
    enum class NewsSource(
        val displayName: String,
        val rssUrl: String,
        val description: String,
        val country: String
    ) {
        // === UNITED STATES ===
        NPR_NEWS("NPR News", "https://feeds.npr.org/1001/rss.xml", "National Public Radio - Top Stories", "United States"),
        CNN("CNN", "http://rss.cnn.com/rss/cnn_topstories.rss", "Cable News Network", "United States"),
        NEW_YORK_TIMES("New York Times", "https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml", "All the News That's Fit to Print", "United States"),
        WASHINGTON_POST("Washington Post", "http://feeds.washingtonpost.com/rss/world", "Democracy Dies in Darkness", "United States"),
        USA_TODAY("USA Today", "http://rssfeeds.usatoday.com/usatoday-NewsTopStories", "Nation's Newspaper", "United States"),
        THE_ATLANTIC("The Atlantic", "https://www.theatlantic.com/feed/all/", "News and Analysis", "United States"),
        TIME_MAGAZINE("Time Magazine", "http://feeds.feedburner.com/time/topstories", "News and Current Affairs", "United States"),
        NEWSWEEK("Newsweek", "https://www.newsweek.com/rss", "News Weekly", "United States"),

        // Tech - US
        ARS_TECHNICA("Ars Technica", "http://feeds.arstechnica.com/arstechnica/index", "Technology News and Analysis", "United States"),
        THE_VERGE("The Verge", "https://www.theverge.com/rss/index.xml", "Technology, Science, Art, and Culture", "United States"),
        WIRED("Wired", "https://www.wired.com/feed/rss", "Technology and Innovation", "United States"),
        TECHCRUNCH("TechCrunch", "http://feeds.feedburner.com/TechCrunch/", "Startup and Tech News", "United States"),
        ENGADGET("Engadget", "https://www.engadget.com/rss.xml", "Consumer Electronics", "United States"),
        HACKER_NEWS("Hacker News", "https://hnrss.org/frontpage", "Tech Community News", "United States"),

        // Business - US
        WALL_STREET_JOURNAL("Wall Street Journal", "https://feeds.a.dj.com/rss/RSSWorldNews.xml", "Business and Financial News", "United States"),
        BLOOMBERG("Bloomberg", "https://feeds.bloomberg.com/markets/news.rss", "Business and Markets", "United States"),
        FORBES("Forbes", "https://www.forbes.com/real-time/feed2/", "Business and Finance", "United States"),

        // Science - US
        SCIENTIFIC_AMERICAN("Scientific American", "http://rss.sciam.com/ScientificAmerican-Global", "Science News and Articles", "United States"),
        POPULAR_SCIENCE("Popular Science", "https://www.popsci.com/feed/", "Science and Technology", "United States"),

        // === UNITED KINGDOM ===
        BBC_NEWS("BBC News", "http://feeds.bbci.co.uk/news/rss.xml", "British Broadcasting Corporation", "United Kingdom"),
        BBC_WORLD("BBC World", "http://feeds.bbci.co.uk/news/world/rss.xml", "BBC World News", "United Kingdom"),
        BBC_TECHNOLOGY("BBC Technology", "http://feeds.bbci.co.uk/news/technology/rss.xml", "BBC Tech News", "United Kingdom"),
        THE_GUARDIAN("The Guardian", "https://www.theguardian.com/world/rss", "Independent Liberal News", "United Kingdom"),
        THE_TELEGRAPH("The Telegraph", "https://www.telegraph.co.uk/rss.xml", "British Daily News", "United Kingdom"),
        THE_INDEPENDENT("The Independent", "http://www.independent.co.uk/rss", "British Online News", "United Kingdom"),
        DAILY_MAIL("Daily Mail", "https://www.dailymail.co.uk/articles.rss", "UK Tabloid News", "United Kingdom"),
        FINANCIAL_TIMES("Financial Times", "https://www.ft.com/?format=rss", "Global Business News", "United Kingdom"),
        ECONOMIST("The Economist", "https://www.economist.com/latest/rss.xml", "International Affairs and Business", "United Kingdom"),
        THE_REGISTER("The Register", "https://www.theregister.com/headlines.atom", "Tech News and Analysis", "United Kingdom"),

        // === GERMANY ===
        DER_SPIEGEL("Der Spiegel", "https://www.spiegel.de/schlagzeilen/index.rss", "German News Magazine", "Germany"),
        DEUTSCHE_WELLE("Deutsche Welle", "https://rss.dw.com/rdf/rss-en-all", "German International Broadcasting", "Germany"),
        FRANKFURTER_ALLGEMEINE("Frankfurter Allgemeine", "https://www.faz.net/rss/aktuell/", "German Newspaper", "Germany"),

        // === FRANCE ===
        LE_MONDE("Le Monde", "https://www.lemonde.fr/rss/une.xml", "French Daily Newspaper", "France"),
        FRANCE24("France 24", "https://www.france24.com/en/rss", "French International News", "France"),
        LIBERATION("Liberation", "https://www.liberation.fr/arc/outboundfeeds/rss-all/", "French Daily News", "France"),

        // === CANADA ===
        CBC_NEWS("CBC News", "https://www.cbc.ca/cmlink/rss-topstories", "Canadian Broadcasting Corporation", "Canada"),
        GLOBE_AND_MAIL("Globe and Mail", "https://www.theglobeandmail.com/arc/outboundfeeds/rss/category/canada/", "Canadian National Newspaper", "Canada"),

        // === AUSTRALIA ===
        ABC_NEWS_AU("ABC News Australia", "https://www.abc.net.au/news/feed/51120/rss.xml", "Australian Broadcasting Corporation", "Australia"),
        SYDNEY_MORNING_HERALD("Sydney Morning Herald", "https://www.smh.com.au/rss/feed.xml", "Australian Newspaper", "Australia"),

        // === MIDDLE EAST ===
        AL_JAZEERA("Al Jazeera", "https://www.aljazeera.com/xml/rss/all.xml", "Middle Eastern International News", "Qatar"),
        HAARETZ("Haaretz", "https://www.haaretz.com/cmlink/1.628017", "Israeli News", "Israel"),

        // === ASIA ===
        JAPAN_TIMES("Japan Times", "https://www.japantimes.co.jp/feed/", "Japanese English News", "Japan"),
        SOUTH_CHINA_MORNING_POST("South China Morning Post", "https://www.scmp.com/rss/91/feed", "Hong Kong News", "Hong Kong"),
        STRAITS_TIMES("Straits Times", "https://www.straitstimes.com/news/singapore/rss.xml", "Singapore News", "Singapore"),

        // === INDIA ===
        TIMES_OF_INDIA("Times of India", "https://timesofindia.indiatimes.com/rssfeedstopstories.cms", "Indian News", "India"),
        HINDU("The Hindu", "https://www.thehindu.com/news/national/feeder/default.rss", "Indian Newspaper", "India"),

        // === LATIN AMERICA ===
        EL_PAIS("El País", "https://feeds.elpais.com/mrss-s/pages/ep/site/elpais.com/portada", "Spanish News", "Spain"),
        FOLHA("Folha de S.Paulo", "https://feeds.folha.uol.com.br/emcimadahora/rss091.xml", "Brazilian News", "Brazil"),

        // === RUSSIA ===
        RT_NEWS("RT News", "https://www.rt.com/rss/", "Russian International News", "Russia"),

        // === INTERNATIONAL ===
        REUTERS("Reuters", "https://www.reutersagency.com/feed/?taxonomy=best-topics&post_type=best", "International News Agency", "International"),
        ASSOCIATED_PRESS("Associated Press", "https://rsshub.app/ap/topics/apf-topnews", "US News Agency", "International"),

        // === SCIENCE & NATURE ===
        NATURE("Nature", "http://feeds.nature.com/nature/rss/current", "Scientific Journal", "International"),
        NEW_SCIENTIST("New Scientist", "https://www.newscientist.com/feed/home", "Science Magazine", "International"),
        SCIENCE_DAILY("Science Daily", "https://www.sciencedaily.com/rss/all.xml", "Science News", "International"),

        // === TECHNOLOGY ===
        SLASHDOT("Slashdot", "http://rss.slashdot.org/Slashdot/slashdot", "News for Nerds", "International"),
        TECHMEME("Techmeme", "https://www.techmeme.com/feed.xml", "Tech News Aggregator", "International"),
        ZDNET("ZDNet", "https://www.zdnet.com/news/rss.xml", "Technology News", "International");

        companion object {
            fun fromDisplayName(name: String): NewsSource? {
                return values().firstOrNull { it.displayName == name }
            }

            fun getCountries(): List<String> {
                return values().map { it.country }.distinct().sorted()
            }

            fun getSourcesByCountry(country: String): List<NewsSource> {
                return values().filter { it.country == country }
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
     * Get list of available news sources grouped by country
     */
    fun getAvailableSources(): List<SourceInfo> {
        return NewsSource.values().map { source ->
            SourceInfo(
                name = source.displayName,
                description = source.description,
                country = source.country
            )
        }
    }

    /**
     * Get sources organized by country
     */
    fun getSourcesByCountry(): Map<String, List<SourceInfo>> {
        return NewsSource.values()
            .groupBy { it.country }
            .mapValues { (_, sources) ->
                sources.map { source ->
                    SourceInfo(
                        name = source.displayName,
                        description = source.description,
                        country = source.country
                    )
                }
            }
            .toSortedMap()
    }

    /**
     * Get list of all available countries
     */
    fun getAvailableCountries(): List<String> {
        return NewsSource.getCountries()
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
        val country: String
    )
}
