package com.universalmedialibrary.services.contentcreation

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Modern fanfiction download service inspired by Calibre's FanFicFare
 * Supports multiple fanfiction sites with proper error handling and progress tracking
 */
@Singleton
class FanfictionDownloadService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val converter = FanfictionToEpubConverterBasic(context)
    
    private val _downloadProgress = MutableStateFlow<DownloadState>(DownloadState.Idle)
    val downloadProgress: StateFlow<DownloadState> = _downloadProgress.asStateFlow()

    /**
     * Download states for UI feedback
     */
    sealed class DownloadState {
        object Idle : DownloadState()
        data class Downloading(
            val url: String,
            val progress: Float = 0f,
            val message: String = ""
        ) : DownloadState()
        data class Success(
            val filePath: String,
            val title: String,
            val author: String,
            val chapters: Int
        ) : DownloadState()
        data class Error(val message: String) : DownloadState()
    }

    /**
     * Comprehensive list of supported fanfiction sites (based on Calibre FanFicFare)
     * Organized by country/region
     */
    enum class SupportedSite(
        val displayName: String, 
        val urlPattern: String,
        val country: String,
        val description: String
    ) {
        // === UNITED STATES - Major Sites ===
        ARCHIVE_OF_OUR_OWN("Archive of Our Own", "archiveofourown.org", "United States", "Multi-fandom archive with 10M+ works"),
        FANFICTION_NET("FanFiction.Net", "fanfiction.net", "United States", "Largest fanfiction site, 12M+ stories"),
        WATTPAD("Wattpad", "wattpad.com", "Canada/Global", "Social storytelling platform, 90M users"),
        FICTION_PRESS("FictionPress", "fictionpress.com", "United States", "Original fiction sister site to FFN"),
        
        // === WEB NOVELS - International ===
        ROYAL_ROAD("Royal Road", "royalroad.com", "International", "Web novel platform, LitRPG focus"),
        SCRIBBLEHUB("ScribbleHub", "scribblehub.com", "International", "Web novel community"),
        WEBNOVEL("Webnovel", "webnovel.com", "China/International", "Chinese web novel translations"),
        NOVEL_UPDATES("Novel Updates", "novelupdates.com", "International", "Asian web novel translations"),
        WUXIAWORLD("WuxiaWorld", "wuxiaworld.com", "International", "Chinese wuxia/xianxia novels"),
        
        // === FORUMS - United States ===
        SPACEBATTLES("SpaceBattles", "forums.spacebattles.com", "United States", "Science fiction forum"),
        SUFFICIENT_VELOCITY("Sufficient Velocity", "forums.sufficientvelocity.com", "United States", "Fiction discussion forum"),
        QUESTIONABLE_QUESTING("Questionable Questing", "forum.questionablequesting.com", "United States", "Adult fiction forum"),
        
        // === ANIME/MANGA - Japan/International ===
        FANFICTION_SEVEN("Fanfiction.Seven", "fanfiction.seven", "International", "Anime fanfiction"),
        MEDIAMINER("MediaMiner", "mediaminer.org", "United States", "Anime/manga fanfiction"),
        
        // === HARRY POTTER ===
        FANFIC_AUTHORS("FanFicAuthors.net", "fanficauthors.net", "United States", "Harry Potter focused"),
        SINK_INTO_MADNESS("Sink Into Your Eyes", "siye.co.uk", "United Kingdom", "Harry Potter romance"),
        PORTKEY("Portkey Archive", "portkey-archive.org", "International", "Harry Potter fanfiction"),
        
        // === TWILIGHT ===
        TWILIGHTED("Twilighted", "twilighted.net", "United States", "Twilight fanfiction"),
        
        // === SHERLOCK ===
        SHERLOCKIAN_LIBRARY("A Sherlockian Library", "221b.slashcity.com", "United States", "Sherlock Holmes fanfiction"),
        
        // === STAR TREK ===
        TREK_UNIVERSE("TrekUniverse", "trekuniverse.org", "United States", "Star Trek fanfiction"),
        
        // === STAR WARS ===
        STAR_WARS_FAN_FICTION("StarWars.FanFiction", "starwarsfanfiction.com", "United States", "Star Wars fanfiction"),
        
        // === SUPERNATURAL ===
        SUPERNATURALVILLE("SupernaturalVille", "supernaturalville.com", "United States", "Supernatural fanfiction"),
        
        // === BUFFY ===
        ELYSIAN_FIELDS("Elysian Fields", "elysian-fields.com", "United States", "Buffy/Spike fanfiction"),
        
        // === DOCTOR WHO ===
        TEASPOON("A Teaspoon and an Open Mind", "whofic.com", "United Kingdom", "Doctor Who fanfiction"),
        
        // === NARUTO ===
        NARUTO_FAN("NarutoFan", "narutofan.com", "United States", "Naruto fanfiction"),
        
        // === LORD OF THE RINGS ===
        LOTR_FANFICTION("LOTR Fanfiction", "lotrfanfiction.com", "United States", "Lord of the Rings"),
        STORIES_OF_ARDA("Stories of Arda", "storiesofarda.com", "United States", "Tolkien fanfiction"),
        
        // === MISC ARCHIVES ===
        ADULT_FANFICTION("AdultFanFiction.org", "adult-fanfiction.org", "United States", "Adult-rated content"),
        FANFICS_ME("Fanfics.me", "fanfics.me", "International", "Multi-fandom archive"),
        QUOTEV("Quotev", "quotev.com", "United States", "Stories, quizzes, fanfiction"),
        
        // === ORIGINAL FICTION ===
        FICTIONAUT("Fictionaut", "fictionaut.com", "United States", "Literary fiction community"),
        PROTAGONIZE("Protagonize", "protagonize.com", "Canada", "Collaborative storytelling"),
        
        // === REGIONAL - GERMANY ===
        ANIMEXX("Animexx", "animexx.de", "Germany", "German anime/manga fanfiction"),
        FANFIKTION("FanFiktion.de", "fanfiktion.de", "Germany", "German fanfiction archive"),
        
        // === REGIONAL - FRANCE ===
        FANFICTION_FR("Fanfiction-FR", "fanfiction-fr.net", "France", "French fanfiction"),
        
        // === REGIONAL - ITALY ===
        EFPFANFIC("EFP FanFic", "efpfanfic.net", "Italy", "Italian fanfiction"),
        
        // === REGIONAL - SPAIN ===
        HARRY_LATINO("HarryLatino", "harrylatino.org", "Spain/Latin America", "Spanish Harry Potter fanfiction"),
        
        // === REGIONAL - RUSSIA ===
        FICBOOK("Ficbook", "ficbook.net", "Russia", "Russian fanfiction archive"),
        DIARY("Diary.ru", "diary.ru", "Russia", "Russian blogging/fanfiction"),
        
        // === REGIONAL - CHINA ===
        JJWXC("JJWXC", "jjwxc.net", "China", "Chinese original fiction"),
        QIDIAN("Qidian", "qidian.com", "China", "Chinese web novels"),
        
        // === REGIONAL - JAPAN ===
        PIXIV("Pixiv Novels", "pixiv.net", "Japan", "Japanese illustration/novel site"),
        
        // === REGIONAL - KOREA ===
        MUNPIA("Munpia", "munpia.com", "South Korea", "Korean web novels"),
        
        // === REGIONAL - BRAZIL ===
        NYAH_FANFICTION("Nyah! Fanfiction", "fanfiction.com.br", "Brazil", "Portuguese fanfiction"),
        
        // === NICHE/SPECIALIZED ===
        LITEROTICA("Literotica", "literotica.com", "United States", "Adult erotic stories"),
        ASSTR("ASSTR", "asstr.org", "United States", "Adult story repository"),
        NIFTY("Nifty Erotic Stories", "nifty.org", "United States", "LGBT adult stories");

        fun matches(url: String): Boolean = url.contains(urlPattern, ignoreCase = true)
        
        companion object {
            fun getCountries(): List<String> {
                return values().map { it.country }.distinct().sorted()
            }
            
            fun getSitesByCountry(country: String): List<SupportedSite> {
                return values().filter { it.country == country }
            }
        }
    }

    /**
     * Check if a URL is from a supported fanfiction site
     */
    fun isSupportedSite(url: String): Boolean {
        return SupportedSite.values().any { it.matches(url) }
    }

    /**
     * Get the site for a given URL
     */
    fun getSiteForUrl(url: String): SupportedSite? {
        return SupportedSite.values().firstOrNull { it.matches(url) }
    }

    /**
     * Download fanfiction from a URL and convert to EPUB
     */
    suspend fun downloadFanfiction(url: String): Result<DownloadResult> = withContext(Dispatchers.IO) {
        try {
            // Update state: Starting
            _downloadProgress.value = DownloadState.Downloading(
                url = url,
                progress = 0.1f,
                message = "Validating URL..."
            )

            // Validate URL
            if (!isSupportedSite(url)) {
                val error = "Unsupported site. Supported: ${SupportedSite.values().joinToString { it.displayName }}"
                _downloadProgress.value = DownloadState.Error(error)
                return@withContext Result.failure(IllegalArgumentException(error))
            }

            val site = getSiteForUrl(url)
            _downloadProgress.value = DownloadState.Downloading(
                url = url,
                progress = 0.2f,
                message = "Downloading from ${site?.displayName}..."
            )

            // Download and convert
            val result = converter.convertFanfictionToEpub(url)

            if (result.success && result.filePath != null) {
                val downloadResult = DownloadResult(
                    success = true,
                    filePath = result.filePath,
                    title = result.title ?: "Unknown Title",
                    author = result.author ?: "Unknown Author",
                    chapters = result.chapters,
                    site = site?.displayName ?: "Unknown"
                )

                _downloadProgress.value = DownloadState.Success(
                    filePath = result.filePath,
                    title = downloadResult.title,
                    author = downloadResult.author,
                    chapters = result.chapters
                )

                Result.success(downloadResult)
            } else {
                val error = result.errorMessage ?: "Unknown error"
                _downloadProgress.value = DownloadState.Error(error)
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            Log.e("FanfictionDownload", "Failed to download fanfiction", e)
            val error = "Download failed: ${e.message}"
            _downloadProgress.value = DownloadState.Error(error)
            Result.failure(e)
        }
    }

    /**
     * Reset download state
     */
    fun resetState() {
        _downloadProgress.value = DownloadState.Idle
    }

    /**
     * Result of a successful download
     */
    data class DownloadResult(
        val success: Boolean,
        val filePath: String,
        val title: String,
        val author: String,
        val chapters: Int,
        val site: String
    )

    /**
     * Get list of supported sites for UI display
     */
    fun getSupportedSites(): List<SiteInfo> {
        return SupportedSite.values().map { site ->
            SiteInfo(
                name = site.displayName,
                country = site.country,
                description = site.description,
                urlExample = when (site) {
                    SupportedSite.ARCHIVE_OF_OUR_OWN -> "https://archiveofourown.org/works/123456"
                    SupportedSite.FANFICTION_NET -> "https://www.fanfiction.net/s/123456/1/"
                    SupportedSite.WATTPAD -> "https://www.wattpad.com/story/123456"
                    SupportedSite.ROYAL_ROAD -> "https://www.royalroad.com/fiction/12345/"
                    SupportedSite.FICTION_PRESS -> "https://www.fictionpress.com/s/123456/1/"
                    SupportedSite.SCRIBBLEHUB -> "https://www.scribblehub.com/series/12345/"
                    else -> "https://${site.urlPattern}/..."
                }
            )
        }
    }
    
    /**
     * Get sites organized by country
     */
    fun getSitesByCountry(): Map<String, List<SiteInfo>> {
        return SupportedSite.values()
            .groupBy { it.country }
            .mapValues { (_, sites) ->
                sites.map { site ->
                    SiteInfo(
                        name = site.displayName,
                        country = site.country,
                        description = site.description,
                        urlExample = "https://${site.urlPattern}/..."
                    )
                }
            }
            .toSortedMap()
    }
    
    /**
     * Get list of all available countries
     */
    fun getAvailableCountries(): List<String> {
        return SupportedSite.getCountries()
    }

    data class SiteInfo(
        val name: String,
        val country: String,
        val description: String,
        val urlExample: String
    )
}
