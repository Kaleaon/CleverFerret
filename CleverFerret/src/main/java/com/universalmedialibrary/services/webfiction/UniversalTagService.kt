package com.universalmedialibrary.services.webfiction

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal tag service for all fanfiction sites
 * Provides tag browsing and discovery across multiple platforms
 */
@Singleton
class UniversalTagService @Inject constructor(
    private val metabodsTagService: MetabodsTagService,
    private val webFictionService: WebFictionService
) {

    companion object {
        private const val USER_AGENT = "Mozilla/5.0 (compatible; CleverFerret/1.0)"
        private const val REQUEST_TIMEOUT = 30000
    }

    /**
     * Fetch tags for a specific site
     */
    suspend fun fetchTagsForSite(siteType: WebFictionSiteType): Result<List<WebFictionTag>> {
        return when (siteType) {
            WebFictionSiteType.METABODS -> metabodsTagService.fetchAllTags()
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> fetchAO3Tags()
            WebFictionSiteType.FANFICTION_NET -> fetchFFNTags()
            WebFictionSiteType.WATTPAD -> fetchWattpadTags()
            WebFictionSiteType.ROYAL_ROAD -> fetchRoyalRoadTags()
            WebFictionSiteType.SCRIBBLE_HUB -> fetchScribbleHubTags()
            WebFictionSiteType.LITEROTICA -> fetchLiteroticaTags()
            WebFictionSiteType.QUESTIONABLE_QUESTING -> fetchQQTags()
            else -> Result.success(emptyList())
        }
    }

    /**
     * Browse stories by tags on any supported site
     */
    suspend fun browseByTags(
        siteType: WebFictionSiteType,
        criteria: StorySearchCriteria
    ): Result<StorySearchResult> {
        return when (siteType) {
            WebFictionSiteType.METABODS -> metabodsTagService.browseByTags(criteria)
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> browseAO3ByTags(criteria)
            WebFictionSiteType.FANFICTION_NET -> browseFFNByTags(criteria)
            WebFictionSiteType.WATTPAD -> browseWattpadByTags(criteria)
            WebFictionSiteType.ROYAL_ROAD -> browseRoyalRoadByTags(criteria)
            WebFictionSiteType.SCRIBBLE_HUB -> browseScribbleHubByTags(criteria)
            else -> Result.failure(Exception("Tag browsing not yet implemented for ${siteType.displayName}"))
        }
    }

    // ===========================================================================================
    // ARCHIVE OF OUR OWN (AO3)
    // ===========================================================================================

    private suspend fun fetchAO3Tags(): Result<List<WebFictionTag>> {
        return withContext(Dispatchers.IO) {
            try {
                val tags = mutableListOf<WebFictionTag>()
                
                // AO3 has well-organized tag system
                val commonTags = listOf(
                    // Fandoms (popular)
                    WebFictionTag("mcu", "mcu", "Marvel Cinematic Universe", TagCategory.GENERAL, 0),
                    WebFictionTag("hp", "hp", "Harry Potter", TagCategory.GENERAL, 0),
                    WebFictionTag("sw", "sw", "Star Wars", TagCategory.GENERAL, 0),
                    WebFictionTag("supernatural", "supernatural", "Supernatural", TagCategory.GENERAL, 0),
                    
                    // Relationships
                    WebFictionTag("gen", "gen", "Gen (No Pairing)", TagCategory.THEME, 0),
                    WebFictionTag("m-m", "m-m", "M/M", TagCategory.THEME, 0),
                    WebFictionTag("f-f", "f-f", "F/F", TagCategory.THEME, 0),
                    WebFictionTag("m-f", "m-f", "M/F", TagCategory.THEME, 0),
                    
                    // Ratings
                    WebFictionTag("general", "general", "General Audiences", TagCategory.RATING, 0),
                    WebFictionTag("teen", "teen", "Teen And Up", TagCategory.RATING, 0),
                    WebFictionTag("mature", "mature", "Mature", TagCategory.RATING, 0),
                    WebFictionTag("explicit", "explicit", "Explicit", TagCategory.RATING, 0),
                    
                    // Warnings
                    WebFictionTag("no-warnings", "no-warnings", "No Archive Warnings", TagCategory.GENERAL, 0),
                    WebFictionTag("violence", "violence", "Graphic Violence", TagCategory.THEME, 0),
                    
                    // Popular tags
                    WebFictionTag("fluff", "fluff", "Fluff", TagCategory.THEME, 0),
                    WebFictionTag("angst", "angst", "Angst", TagCategory.THEME, 0),
                    WebFictionTag("hurt-comfort", "hurt-comfort", "Hurt/Comfort", TagCategory.THEME, 0),
                    WebFictionTag("slow-burn", "slow-burn", "Slow Burn", TagCategory.THEME, 0),
                    WebFictionTag("enemies-to-lovers", "enemies-to-lovers", "Enemies to Lovers", TagCategory.THEME, 0),
                    WebFictionTag("friends-to-lovers", "friends-to-lovers", "Friends to Lovers", TagCategory.THEME, 0)
                )
                
                tags.addAll(commonTags)
                Result.success(tags)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    private suspend fun browseAO3ByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                val url = buildAO3SearchUrl(criteria)
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = parseAO3SearchResults(doc)
                
                Result.success(
                    StorySearchResult(
                        stories = stories,
                        totalCount = stories.size,
                        hasMore = stories.size >= criteria.limit,
                        nextOffset = if (stories.size >= criteria.limit) criteria.offset + criteria.limit else null
                    )
                )
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    private fun buildAO3SearchUrl(criteria: StorySearchCriteria): String {
        val url = StringBuilder("https://archiveofourown.org/works/search?")
        
        // Tags
        if (criteria.tags.isNotEmpty()) {
            val tagQuery = criteria.tags.joinToString("+")
            url.append("work_search[query]=$tagQuery&")
        }
        
        // Word count
        criteria.minWordCount?.let { url.append("work_search[word_count_from]=$it&") }
        criteria.maxWordCount?.let { url.append("work_search[word_count_to]=$it&") }
        
        // Sort
        url.append("work_search[sort_column]=${criteria.sortBy.name.lowercase()}&")
        url.append("work_search[sort_direction]=${if (criteria.sortOrder == SortOrder.DESCENDING) "desc" else "asc"}&")
        
        // Pagination
        val page = (criteria.offset / criteria.limit) + 1
        url.append("page=$page")
        
        return url.toString()
    }

    private suspend fun parseAO3SearchResults(doc: org.jsoup.nodes.Document): List<WebFictionStory> {
        val stories = mutableListOf<WebFictionStory>()
        
        doc.select("li.work").forEach { work ->
            try {
                val titleLink = work.select("h4.heading a").first()
                val title = titleLink?.text() ?: return@forEach
                val url = "https://archiveofourown.org${titleLink.attr("href")}"
                val storyId = url.substringAfter("/works/").substringBefore("/")
                
                val author = work.select("a[rel=author]").text()
                val summary = work.select("blockquote.summary").text()
                val tags = work.select("li.freeforms a.tag").map { it.text() }
                val rating = work.select("span.rating").text()
                val warnings = work.select("span.warnings").text()
                
                val stats = work.select("dl.stats dd").text()
                val wordCount = Regex("Words:\\s*([0-9,]+)").find(stats)?.groupValues?.get(1)?.replace(",", "")?.toLongOrNull()
                val chapters = Regex("(\\d+)/(\\d+|\\?)").find(stats)?.groupValues?.get(1)?.toIntOrNull()
                
                stories.add(
                    WebFictionStory(
                        id = storyId,
                        url = url,
                        title = title,
                        author = author,
                        description = summary,
                        status = StoryStatus.UNKNOWN,
                        genre = null,
                        fandom = null,
                        language = "English",
                        wordCount = wordCount,
                        chapterCount = chapters,
                        lastUpdated = null,
                        rating = rating,
                        warnings = if (warnings.isNotEmpty()) listOf(warnings) else emptyList(),
                        tags = tags,
                        site = "Archive of Our Own"
                    )
                )
            } catch (e: Exception) {
                // Skip invalid entries
            }
        }
        
        return stories
    }

    // ===========================================================================================
    // FANFICTION.NET
    // ===========================================================================================

    private suspend fun fetchFFNTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                // Genres
                WebFictionTag("adventure", "adventure", "Adventure", TagCategory.GENRE, 0),
                WebFictionTag("romance", "romance", "Romance", TagCategory.GENRE, 0),
                WebFictionTag("humor", "humor", "Humor", TagCategory.GENRE, 0),
                WebFictionTag("drama", "drama", "Drama", TagCategory.GENRE, 0),
                WebFictionTag("angst", "angst", "Angst", TagCategory.GENRE, 0),
                WebFictionTag("horror", "horror", "Horror", TagCategory.GENRE, 0),
                WebFictionTag("mystery", "mystery", "Mystery", TagCategory.GENRE, 0),
                WebFictionTag("sci-fi", "sci-fi", "Sci-Fi", TagCategory.GENRE, 0),
                WebFictionTag("fantasy", "fantasy", "Fantasy", TagCategory.GENRE, 0),
                
                // Ratings
                WebFictionTag("k", "k", "K (General)", TagCategory.RATING, 0),
                WebFictionTag("k+", "k+", "K+ (Some content)", TagCategory.RATING, 0),
                WebFictionTag("t", "t", "T (Teen)", TagCategory.RATING, 0),
                WebFictionTag("m", "m", "M (Mature)", TagCategory.RATING, 0),
                
                // Status
                WebFictionTag("complete", "complete", "Complete", TagCategory.STATUS, 0),
                WebFictionTag("in-progress", "in-progress", "In Progress", TagCategory.STATUS, 0)
            )
        )
    }

    private suspend fun browseFFNByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        // FFN doesn't have great tag browsing API, would need web scraping
        return Result.failure(Exception("FFN tag browsing requires specific category selection"))
    }

    // ===========================================================================================
    // ROYAL ROAD
    // ===========================================================================================

    private suspend fun fetchRoyalRoadTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                // Genres
                WebFictionTag("litrpg", "litrpg", "LitRPG", TagCategory.GENRE, 0),
                WebFictionTag("progression-fantasy", "progression-fantasy", "Progression Fantasy", TagCategory.GENRE, 0),
                WebFictionTag("isekai", "isekai", "Isekai", TagCategory.GENRE, 0),
                WebFictionTag("dungeon-core", "dungeon-core", "Dungeon Core", TagCategory.GENRE, 0),
                WebFictionTag("cultivation", "cultivation", "Cultivation", TagCategory.GENRE, 0),
                WebFictionTag("cyberpunk", "cyberpunk", "Cyberpunk", TagCategory.GENRE, 0),
                WebFictionTag("post-apocalyptic", "post-apocalyptic", "Post-Apocalyptic", TagCategory.GENRE, 0),
                
                // Themes
                WebFictionTag("op-mc", "op-mc", "OP MC", TagCategory.THEME, 0),
                WebFictionTag("weak-to-strong", "weak-to-strong", "Weak to Strong", TagCategory.THEME, 0),
                WebFictionTag("magic", "magic", "Magic", TagCategory.THEME, 0),
                WebFictionTag("martial-arts", "martial-arts", "Martial Arts", TagCategory.THEME, 0),
                WebFictionTag("kingdom-building", "kingdom-building", "Kingdom Building", TagCategory.THEME, 0)
            )
        )
    }

    private suspend fun browseRoyalRoadByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                val url = "https://www.royalroad.com/fictions/search?tagsAdd=${criteria.tags.joinToString(",")}"
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = parseRoyalRoadSearchResults(doc)
                
                Result.success(
                    StorySearchResult(
                        stories = stories,
                        totalCount = stories.size,
                        hasMore = false,
                        nextOffset = null
                    )
                )
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    private fun parseRoyalRoadSearchResults(doc: org.jsoup.nodes.Document): List<WebFictionStory> {
        val stories = mutableListOf<WebFictionStory>()
        
        doc.select("div.fiction-list-item").forEach { item ->
            try {
                val titleLink = item.select("h2.fiction-title a").first() ?: return@forEach
                val title = titleLink.text()
                val url = "https://www.royalroad.com${titleLink.attr("href")}"
                val storyId = url.substringAfter("/fiction/").substringBefore("/")
                
                val author = item.select("span.author").text()
                val description = item.select("div.description").text()
                val tags = item.select("span.tag").map { it.text() }
                val stats = item.select("div.stats span").text()
                
                stories.add(
                    WebFictionStory(
                        id = storyId,
                        url = url,
                        title = title,
                        author = author,
                        description = description,
                        status = StoryStatus.UNKNOWN,
                        genre = tags.firstOrNull(),
                        fandom = "Original",
                        language = "English",
                        wordCount = null,
                        chapterCount = null,
                        lastUpdated = null,
                        rating = null,
                        tags = tags,
                        site = "Royal Road"
                    )
                )
            } catch (e: Exception) {
                // Skip invalid entries
            }
        }
        
        return stories
    }

    // ===========================================================================================
    // OTHER SITES (Wattpad, ScribbleHub, etc.)
    // ===========================================================================================

    private suspend fun fetchWattpadTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("romance", "romance", "Romance", TagCategory.GENRE, 0),
                WebFictionTag("fantasy", "fantasy", "Fantasy", TagCategory.GENRE, 0),
                WebFictionTag("fanfiction", "fanfiction", "Fanfiction", TagCategory.GENRE, 0),
                WebFictionTag("teen-fiction", "teen-fiction", "Teen Fiction", TagCategory.GENRE, 0),
                WebFictionTag("mystery", "mystery", "Mystery", TagCategory.GENRE, 0)
            )
        )
    }

    private suspend fun browseWattpadByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return Result.failure(Exception("Wattpad tag browsing requires authentication"))
    }

    private suspend fun fetchScribbleHubTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("action", "action", "Action", TagCategory.GENRE, 0),
                WebFictionTag("adventure", "adventure", "Adventure", TagCategory.GENRE, 0),
                WebFictionTag("comedy", "comedy", "Comedy", TagCategory.GENRE, 0),
                WebFictionTag("isekai", "isekai", "Isekai", TagCategory.GENRE, 0),
                WebFictionTag("litrpg", "litrpg", "LitRPG", TagCategory.GENRE, 0)
            )
        )
    }

    private suspend fun fetchLiteroticaTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("erotic", "erotic", "Erotic", TagCategory.RATING, 0),
                WebFictionTag("bdsm", "bdsm", "BDSM", TagCategory.THEME, 0),
                WebFictionTag("romance", "romance", "Romance", TagCategory.THEME, 0),
                WebFictionTag("group", "group", "Group", TagCategory.THEME, 0)
            )
        )
    }

    private suspend fun fetchQQTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("nsfw", "nsfw", "NSFW", TagCategory.RATING, 0),
                WebFictionTag("quest", "quest", "Quest", TagCategory.GENRE, 0),
                WebFictionTag("original", "original", "Original", TagCategory.GENRE, 0)
            )
        )
    }

    /**
     * Browse ScribbleHub stories by tags
     */
    private suspend fun browseScribbleHubByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        // TODO: Implement ScribbleHub tag browsing
        return Result.failure(Exception("ScribbleHub tag browsing not yet implemented"))
    }

    /**
     * Get site capabilities
     */
    fun getSiteCapabilities(siteType: WebFictionSiteType): SiteCapabilities {
        return when (siteType) {
            WebFictionSiteType.METABODS -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = true,
                supportedRatings = listOf("Mature", "Explicit")
            )
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = true,
                supportedRatings = listOf("General", "Teen", "Mature", "Explicit")
            )
            WebFictionSiteType.ROYAL_ROAD -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = false,
                supportedRatings = listOf("General", "Teen", "Mature")
            )
            else -> SiteCapabilities(
                hasTagBrowsing = false,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = emptyList()
            )
        }
    }
}

/**
 * Site capabilities for tag browsing
 */
data class SiteCapabilities(
    val hasTagBrowsing: Boolean,
    val hasAdvancedSearch: Boolean,
    val hasDownloadButton: Boolean,
    val supportedRatings: List<String>
)
