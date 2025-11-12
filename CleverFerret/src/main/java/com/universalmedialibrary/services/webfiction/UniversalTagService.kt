package com.universalmedialibrary.services.webfiction

import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentFilterHelper
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.net.URLEncoder
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal tag service for all fanfiction sites
 * Provides tag browsing and discovery across multiple platforms
 */
@Singleton
class UniversalTagService @Inject constructor(
    private val metabodsTagService: MetabodsTagService,
    private val webFictionService: WebFictionService,
    private val parentalControlsSettings: ParentalControlsSettings,
    private val contentFilterHelper: ContentFilterHelper
) {

    companion object {
        private const val USER_AGENT = "Mozilla/5.0 (compatible; CleverFerret/1.0)"
        private const val REQUEST_TIMEOUT = 30000
    }

    private val royalRoadCountRegex = Regex("\\((\\d[\\d,]*)\\)")

    private suspend fun ensureAdultAccess(siteType: WebFictionSiteType): Result<Unit> {
        if (!siteType.isAdultSite()) return Result.success(Unit)
        return if (parentalControlsSettings.isAdultSourcesAllowed()) {
            Result.success(Unit)
        } else {
            Result.failure(AdultSitesDisabledException())
        }
    }

    /**
     * Fetch tags for a specific site
     */
    suspend fun fetchTagsForSite(siteType: WebFictionSiteType): Result<List<WebFictionTag>> {
        ensureAdultAccess(siteType).onFailure { return Result.failure(it) }
        return when (siteType) {
            WebFictionSiteType.METABODS -> metabodsTagService.fetchAllTags()
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> fetchAO3Tags()
            WebFictionSiteType.FANFICTION_NET -> fetchFFNTags()
            WebFictionSiteType.WATTPAD -> fetchWattpadTags()
            WebFictionSiteType.ROYAL_ROAD -> fetchRoyalRoadTags()
            WebFictionSiteType.SCRIBBLE_HUB -> fetchScribbleHubTags()
            WebFictionSiteType.LITEROTICA -> fetchLiteroticaTags()
            WebFictionSiteType.NIFTY -> fetchNiftyTags()
            WebFictionSiteType.ADULT_FANFICTION -> fetchAdultFanFictionTags()
            WebFictionSiteType.BDSM_LIBRARY -> fetchBdsmlibraryTags()
            WebFictionSiteType.MCSTORIES -> fetchMcstoriesTags()
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
        ensureAdultAccess(siteType).onFailure { return Result.failure(it) }
        return when (siteType) {
            WebFictionSiteType.METABODS -> metabodsTagService.browseByTags(criteria)
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> browseAO3ByTags(criteria)
            WebFictionSiteType.FANFICTION_NET -> browseFFNByTags(criteria)
            WebFictionSiteType.WATTPAD -> browseWattpadByTags(criteria)
            WebFictionSiteType.ROYAL_ROAD -> browseRoyalRoadByTags(criteria)
            WebFictionSiteType.SCRIBBLE_HUB -> browseScribbleHubByTags(criteria)
            WebFictionSiteType.NIFTY -> browseNiftyByTags(criteria)
            WebFictionSiteType.ADULT_FANFICTION -> browseAdultFanFictionByTags(criteria)
            WebFictionSiteType.BDSM_LIBRARY -> browseBdsmlibraryByTags(criteria)
            WebFictionSiteType.MCSTORIES -> browseMcstoriesByTags(criteria)
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
        return withContext(Dispatchers.IO) {
            try {
                val doc = Jsoup.connect("https://www.royalroad.com/fictions/genres")
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val tagElements = doc.select(
                    "a.genre-label, a.genre-tag, div.genre-card a, a.badge, a.tag, li a[data-tag]"
                )

                val deduped = linkedMapOf<String, WebFictionTag>()
                for (element in tagElements) {
                    val rawName = element.text().trim()
                    if (rawName.isEmpty()) continue

                    val (displayName, count) = extractRoyalRoadDisplayNameAndCount(rawName)
                    val tagId = extractRoyalRoadTagId(element, displayName)
                    val category = categorizeRoyalRoadTag(displayName)

                    val cleanId = tagId.ifBlank { sanitizeTagId(displayName) }
                    if (cleanId.isBlank()) continue

                    deduped.putIfAbsent(
                        cleanId,
                        WebFictionTag(
                            id = cleanId,
                            name = cleanId,
                            displayName = displayName,
                            category = category,
                            count = count
                        )
                    )
                }

                val tags = deduped.values.toList()
                Result.success(
                    if (tags.isEmpty()) getRoyalRoadFallbackTags()
                    else tags.sortedBy { it.displayName.lowercase(Locale.US) }
                )
            } catch (e: Exception) {
                Result.success(getRoyalRoadFallbackTags())
            }
        }
    }

    private suspend fun browseRoyalRoadByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                val url = buildRoyalRoadSearchUrl(criteria)
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = parseRoyalRoadSearchResults(doc)

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

    private fun extractRoyalRoadDisplayNameAndCount(raw: String): Pair<String, Int> {
        val countMatch = royalRoadCountRegex.find(raw)
        val count = countMatch?.groupValues?.get(1)?.replace(",", "")?.toIntOrNull() ?: 0
        val displayName = raw.replace(royalRoadCountRegex, "").trim()
        return displayName to count
    }

    private fun extractRoyalRoadTagId(element: org.jsoup.nodes.Element, displayName: String): String {
        val attributeId = sequenceOf(
            element.attr("data-tag"),
            element.attr("data-value"),
            element.attr("data-slug"),
            element.attr("data-name")
        ).firstOrNull { it.isNotBlank() }?.let { sanitizeTagId(it) }

        if (!attributeId.isNullOrBlank()) return attributeId

        val href = element.attr("href")
        if (href.isNotBlank()) {
            when {
                href.contains("tagsAdd=", ignoreCase = true) ->
                    return sanitizeTagId(href.substringAfter("tagsAdd=").substringBefore("&"))
                href.contains("/tag/", ignoreCase = true) ->
                    return sanitizeTagId(href.substringAfter("/tag/").substringBefore("/"))
                href.contains("/genres/", ignoreCase = true) ->
                    return sanitizeTagId(href.substringAfterLast("/"))
            }
        }

        return sanitizeTagId(displayName)
    }

    private fun sanitizeTagId(value: String): String {
        val normalized = value.lowercase(Locale.US)
            .replace(Regex("[^a-z0-9]+"), "-")
            .trim('-')
        return normalized.ifBlank { "tag-${value.hashCode() and 0xffff}" }
    }

    private fun categorizeRoyalRoadTag(tagName: String): TagCategory {
        val normalized = tagName.lowercase(Locale.US)
        return when {
            normalized.contains("fantasy") ||
            normalized.contains("litrpg") ||
            normalized.contains("isekai") ||
            normalized.contains("dungeon") ||
            normalized.contains("cultivation") ||
            normalized.contains("cyber") ||
            normalized.contains("post-apocalyptic") ||
            normalized.contains("sci") -> TagCategory.GENRE

            normalized.contains("magic") ||
            normalized.contains("martial") ||
            normalized.contains("kingdom") ||
            normalized.contains("weak") ||
            normalized.matches(Regex("op.*")) ||
            normalized.contains("progression") -> TagCategory.THEME

            normalized.contains("complete") ||
            normalized.contains("ongoing") ||
            normalized.contains("hiatus") -> TagCategory.STATUS

            else -> TagCategory.GENERAL
        }
    }

    private fun getRoyalRoadFallbackTags(): List<WebFictionTag> = listOf(
        WebFictionTag("litrpg", "litrpg", "LitRPG", TagCategory.GENRE, 0),
        WebFictionTag("progression-fantasy", "progression-fantasy", "Progression Fantasy", TagCategory.GENRE, 0),
        WebFictionTag("isekai", "isekai", "Isekai", TagCategory.GENRE, 0),
        WebFictionTag("dungeon-core", "dungeon-core", "Dungeon Core", TagCategory.GENRE, 0),
        WebFictionTag("cultivation", "cultivation", "Cultivation", TagCategory.GENRE, 0),
        WebFictionTag("cyberpunk", "cyberpunk", "Cyberpunk", TagCategory.GENRE, 0),
        WebFictionTag("post-apocalyptic", "post-apocalyptic", "Post-Apocalyptic", TagCategory.GENRE, 0),
        WebFictionTag("op-mc", "op-mc", "OP MC", TagCategory.THEME, 0),
        WebFictionTag("weak-to-strong", "weak-to-strong", "Weak to Strong", TagCategory.THEME, 0),
        WebFictionTag("magic", "magic", "Magic", TagCategory.THEME, 0),
        WebFictionTag("martial-arts", "martial-arts", "Martial Arts", TagCategory.THEME, 0),
        WebFictionTag("kingdom-building", "kingdom-building", "Kingdom Building", TagCategory.THEME, 0)
    )

    private fun buildRoyalRoadSearchUrl(criteria: StorySearchCriteria): String {
        val builder = StringBuilder("https://www.royalroad.com/fictions/search")
        var hasQuery = false

        fun appendParam(name: String, value: String) {
            if (!hasQuery) {
                builder.append('?')
                hasQuery = true
            } else {
                builder.append('&')
            }
            builder.append(name).append('=').append(value)
        }

        if (criteria.tags.isNotEmpty()) {
            val encoded = criteria.tags.joinToString(",") { tag ->
                URLEncoder.encode(tag, "UTF-8")
            }
            appendParam("tagsAdd", encoded)
        }

        if (criteria.tagMatchMode == TagMatchMode.ALL) {
            appendParam("tagMatch", "all")
        }

        if (criteria.offset > 0) {
            val page = (criteria.offset / criteria.limit) + 1
            appendParam("page", page.toString())
        }

        return builder.toString()
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

    private suspend fun fetchNiftyTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("gay-male", "gay-male", "Gay Male", TagCategory.GENRE, 0),
                WebFictionTag("lesbian", "lesbian", "Lesbian", TagCategory.GENRE, 0),
                WebFictionTag("bisexual", "bisexual", "Bisexual", TagCategory.GENRE, 0),
                WebFictionTag("transgender", "transgender", "Transgender", TagCategory.GENRE, 0),
                WebFictionTag("encounters", "encounters", "Encounters", TagCategory.THEME, 0),
                WebFictionTag("fetish", "fetish", "Fetish", TagCategory.THEME, 0),
                WebFictionTag("romance", "romance", "Romance", TagCategory.THEME, 0),
                WebFictionTag("fantasy", "fantasy", "Fantasy", TagCategory.GENRE, 0)
            )
        )
    }

    private suspend fun fetchAdultFanFictionTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("anime", "anime", "Anime", TagCategory.GENRE, 0),
                WebFictionTag("books", "books", "Books", TagCategory.GENRE, 0),
                WebFictionTag("cartoons", "cartoons", "Cartoons", TagCategory.GENRE, 0),
                WebFictionTag("comics", "comics", "Comics", TagCategory.GENRE, 0),
                WebFictionTag("games", "games", "Games", TagCategory.GENRE, 0),
                WebFictionTag("movies", "movies", "Movies", TagCategory.GENRE, 0),
                WebFictionTag("tv", "tv", "Television", TagCategory.GENRE, 0),
                WebFictionTag("original", "original", "Original Works", TagCategory.GENRE, 0),
                WebFictionTag("yaoi", "yaoi", "Yaoi", TagCategory.THEME, 0),
                WebFictionTag("yuri", "yuri", "Yuri", TagCategory.THEME, 0)
            )
        )
    }

    private suspend fun fetchBdsmlibraryTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("bondage", "bondage", "Bondage", TagCategory.THEME, 0),
                WebFictionTag("domination", "domination", "Domination", TagCategory.THEME, 0),
                WebFictionTag("submission", "submission", "Submission", TagCategory.THEME, 0),
                WebFictionTag("consensual", "consensual", "Consensual", TagCategory.THEME, 0),
                WebFictionTag("nonconsensual", "nonconsensual", "Non-Consensual", TagCategory.THEME, 0),
                WebFictionTag("romance", "romance", "Romance", TagCategory.THEME, 0),
                WebFictionTag("fetish", "fetish", "Fetish", TagCategory.THEME, 0),
                WebFictionTag("fantasy", "fantasy", "Fantasy", TagCategory.GENRE, 0)
            )
        )
    }

    private suspend fun fetchMcstoriesTags(): Result<List<WebFictionTag>> {
        return Result.success(
            listOf(
                WebFictionTag("mind-control", "mind-control", "Mind Control", TagCategory.THEME, 0),
                WebFictionTag("transformation", "transformation", "Transformation", TagCategory.THEME, 0),
                WebFictionTag("lesbian", "lesbian", "Lesbian", TagCategory.GENRE, 0),
                WebFictionTag("heterosexual", "heterosexual", "Heterosexual", TagCategory.GENRE, 0),
                WebFictionTag("bisexual", "bisexual", "Bisexual", TagCategory.GENRE, 0),
                WebFictionTag("science-fiction", "science-fiction", "Science Fiction", TagCategory.GENRE, 0),
                WebFictionTag("fantasy", "fantasy", "Fantasy", TagCategory.GENRE, 0),
                WebFictionTag("parody", "parody", "Parody", TagCategory.GENRE, 0)
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
        return withContext(Dispatchers.IO) {
            if (criteria.tags.isEmpty()) {
                return@withContext Result.failure(Exception("Select at least one tag"))
            }

            val query = criteria.tags.joinToString(" ")
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val effectiveLimit = if (criteria.limit <= 0) 50 else criteria.limit
            val page = ((criteria.offset / effectiveLimit) + 1).coerceAtLeast(1)
            val url = "https://www.scribblehub.com/?s=$encodedQuery&post_type=fictionposts&pg=$page"

            try {
                val document = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val title = document.title().orEmpty()
                if (title.contains("Just a moment", ignoreCase = true)) {
                    return@withContext Result.failure(
                        Exception(
                            "ScribbleHub requires completing a Cloudflare challenge in a browser. " +
                                "Open the search manually: $url"
                        )
                    )
                }

                val resultElements = document.select("div.search_main_box div.search_body")
                if (resultElements.isEmpty()) {
                    return@withContext Result.success(
                        StorySearchResult(
                            stories = emptyList(),
                            totalCount = criteria.offset,
                            hasMore = false,
                            nextOffset = null
                        )
                    )
                }

                val mappedStories = resultElements.mapNotNull { element ->
                    val titleElement = element.selectFirst("a.fic_title") ?: return@mapNotNull null
                    val storyUrl = titleElement.absUrl("href").ifBlank { titleElement.attr("href") }
                    if (storyUrl.isBlank()) return@mapNotNull null

                    val storyId = parseScribbleHubId(storyUrl)
                    val storyTitle = titleElement.text().ifBlank { storyUrl }
                    val author = element.selectFirst("span.fic_author a, a.fic_author")?.text()
                    val synopsis = element.selectFirst("div.fic_synopsis, div.fic_justified")?.text()
                    val cover = element.selectFirst("div.search_img img")?.absUrl("src")
                    val tagElements = element.select("a.fic_genre, a.genre")
                    val storyTags = if (tagElements.isNotEmpty()) {
                        tagElements.map { it.text() }.filter { it.isNotBlank() }
                    } else {
                        criteria.tags
                    }
                    val ratingText = element.selectFirst("span.fic_rating")?.text()

                    WebFictionStory(
                        id = storyId,
                        url = storyUrl,
                        title = storyTitle,
                        author = author,
                        description = synopsis,
                        status = StoryStatus.UNKNOWN,
                        genre = storyTags.firstOrNull(),
                        fandom = null,
                        language = "English",
                        wordCount = null,
                        chapterCount = null,
                        lastUpdated = null,
                        rating = ratingText,
                        tags = storyTags,
                        site = WebFictionSiteType.SCRIBBLE_HUB.displayName,
                        coverUrl = cover
                    )
                }

                val limitedStories = mappedStories.take(effectiveLimit)

                val hasMore = mappedStories.size > limitedStories.size
                val nextOffset = if (hasMore) criteria.offset + limitedStories.size else null
                val totalCount = criteria.offset + limitedStories.size

                Result.success(
                    StorySearchResult(
                        stories = limitedStories,
                        totalCount = totalCount,
                        hasMore = hasMore,
                        nextOffset = nextOffset
                    )
                )
            } catch (e: Exception) {
                Result.failure(
                    Exception(
                        "Unable to browse ScribbleHub automatically (${e.message ?: "unknown error"}). " +
                            "Try opening the search manually: $url",
                        e
                    )
                )
            }
        }
    }

    private fun parseScribbleHubId(url: String): String {
        return Regex("series/(\\d+)").find(url)?.groupValues?.getOrNull(1)
            ?: url.hashCode().toString()
    }

    private suspend fun browseNiftyByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                if (criteria.tags.isEmpty()) {
                    return@withContext Result.failure(Exception("Select at least one tag"))
                }
                val keywordQuery = criteria.tags.joinToString(" ") { it }
                val url =
                    "https://www.nifty.org/nifty/?keywords=${URLEncoder.encode(keywordQuery, "UTF-8")}"
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = doc.select("pre a[href*=/nifty/]")
                    .distinctBy { it.absUrl("href") }
                    .map { link ->
                        val storyUrl = link.absUrl("href")
                        WebFictionStory(
                            id = storyUrl,
                            url = storyUrl,
                            title = link.text().ifBlank { storyUrl.substringAfterLast('/') },
                            author = null,
                            description = null,
                            status = StoryStatus.UNKNOWN,
                            genre = criteria.tags.firstOrNull(),
                            fandom = null,
                            language = "English",
                            wordCount = null,
                            chapterCount = null,
                            lastUpdated = null,
                            rating = "Explicit",
                            tags = criteria.tags,
                            site = WebFictionSiteType.NIFTY.displayName
                        )
                    }

                Result.success(buildSearchResult(criteria, stories))
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    private suspend fun browseAdultFanFictionByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                if (criteria.tags.isEmpty()) {
                    return@withContext Result.failure(Exception("Select at least one tag"))
                }
                val query = criteria.tags.joinToString(" ") { it }
                val url =
                    "https://www.adult-fanfiction.org/search.php?type=story&storykeywords=${URLEncoder.encode(query, "UTF-8")}"
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = doc.select("a[href*=story.php?no=]")
                    .distinctBy { it.absUrl("href") }
                    .map { link ->
                        val storyUrl = link.absUrl("href")
                        val parent = link.parents().firstOrNull { it.hasClass("storyinfo") }
                        val summary = parent?.selectFirst(".summary, p")?.text()
                        WebFictionStory(
                            id = storyUrl,
                            url = storyUrl,
                            title = link.text().ifBlank { storyUrl.substringAfterLast('/') },
                            author = parent?.selectFirst("a[href*=profile]")?.text(),
                            description = summary,
                            status = StoryStatus.UNKNOWN,
                            genre = criteria.tags.firstOrNull(),
                            fandom = null,
                            language = "English",
                            wordCount = null,
                            chapterCount = null,
                            lastUpdated = null,
                            rating = "Explicit",
                            tags = criteria.tags,
                            site = WebFictionSiteType.ADULT_FANFICTION.displayName
                        )
                    }

                Result.success(buildSearchResult(criteria, stories))
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    private suspend fun browseBdsmlibraryByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                if (criteria.tags.isEmpty()) {
                    return@withContext Result.failure(Exception("Select at least one tag"))
                }
                val keywordQuery = criteria.tags.joinToString(" ") { it }
                val url =
                    "https://www.bdsmlibrary.com/stories/keyword.php?keyword=${URLEncoder.encode(keywordQuery, "UTF-8")}"
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = doc.select("a[href*=/story.php?storyid=]")
                    .distinctBy { it.absUrl("href") }
                    .map { link ->
                        val storyUrl = link.absUrl("href")
                        WebFictionStory(
                            id = storyUrl,
                            url = storyUrl,
                            title = link.text().ifBlank { storyUrl.substringAfter("storyid=") },
                            author = null,
                            description = null,
                            status = StoryStatus.UNKNOWN,
                            genre = criteria.tags.firstOrNull(),
                            fandom = null,
                            language = "English",
                            wordCount = null,
                            chapterCount = null,
                            lastUpdated = null,
                            rating = "Explicit",
                            tags = criteria.tags,
                            site = WebFictionSiteType.BDSM_LIBRARY.displayName
                        )
                    }

                Result.success(buildSearchResult(criteria, stories))
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    private suspend fun browseMcstoriesByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                if (criteria.tags.isEmpty()) {
                    return@withContext Result.failure(Exception("Select at least one tag"))
                }
                val keywordQuery = criteria.tags.joinToString(" ") { it }
                val url =
                    "https://mcstories.com/Search.html?Search=${URLEncoder.encode(keywordQuery, "UTF-8")}"
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = doc.select("a[href*=mcstories.com]")
                    .filter { it.absUrl("href").contains('/') }
                    .distinctBy { it.absUrl("href") }
                    .map { link ->
                        val storyUrl = link.absUrl("href")
                        WebFictionStory(
                            id = storyUrl,
                            url = storyUrl,
                            title = link.text().ifBlank { storyUrl.substringAfterLast('/') },
                            author = null,
                            description = null,
                            status = StoryStatus.UNKNOWN,
                            genre = criteria.tags.firstOrNull(),
                            fandom = null,
                            language = "English",
                            wordCount = null,
                            chapterCount = null,
                            lastUpdated = null,
                            rating = "Explicit",
                            tags = criteria.tags,
                            site = WebFictionSiteType.MCSTORIES.displayName
                        )
                    }

                Result.success(buildSearchResult(criteria, stories))
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    private suspend fun buildSearchResult(
        criteria: StorySearchCriteria,
        stories: List<WebFictionStory>
    ): StorySearchResult {
        val filtered = contentFilterHelper.filterStories(stories)
        val sliced = filtered.drop(criteria.offset)
        val limited = sliced.take(criteria.limit)
        val consumed = criteria.offset + limited.size
        val hasMore = filtered.size > consumed
        val nextOffset = if (hasMore) consumed else null
        return StorySearchResult(
            stories = limited,
            totalCount = filtered.size,
            hasMore = hasMore,
            nextOffset = nextOffset
        )
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
            WebFictionSiteType.NIFTY -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = listOf("Explicit")
            )
            WebFictionSiteType.ADULT_FANFICTION -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = false,
                supportedRatings = listOf("Mature", "Explicit")
            )
            WebFictionSiteType.BDSM_LIBRARY -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = listOf("Explicit")
            )
            WebFictionSiteType.MCSTORIES -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = listOf("Explicit")
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
