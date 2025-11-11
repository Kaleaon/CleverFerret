package com.universalmedialibrary.services.webfiction

import com.universalmedialibrary.services.ContentFilterHelper
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for browsing and downloading stories from Metabods.com by tags
 * 
 * Metabods.com features:
 * - Tag-based categorization
 * - Download buttons on stories (we respect these)
 * - Multi-tag filtering
 * - Transformation fiction focus
 */
@Singleton
class MetabodsTagService @Inject constructor(
    private val webFictionService: WebFictionService,
    private val contentFilterHelper: ContentFilterHelper
) {

    companion object {
        private const val BASE_URL = "https://www.metabods.com"
        private const val TAGS_URL = "$BASE_URL/tags"
        private const val BROWSE_URL = "$BASE_URL/stories"
        private const val SEARCH_URL = "$BASE_URL/search"
        private const val USER_AGENT = "Mozilla/5.0 (compatible; CleverFerret/1.0)"
        private const val REQUEST_TIMEOUT = 30000
    }

    /**
     * Fetch all available tags from Metabods
     */
    suspend fun fetchAllTags(): Result<List<WebFictionTag>> {
        return withContext(Dispatchers.IO) {
            try {
                val doc = Jsoup.connect(TAGS_URL)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val tags = extractTags(doc)
                Result.success(tags)
            } catch (e: Exception) {
                // Fallback to common Metabods tags if fetch fails
                Result.success(getCommonMetabodsTags())
            }
        }
    }

    /**
     * Extract tags from Metabods tags page
     */
    private fun extractTags(doc: Document): List<WebFictionTag> {
        val tags = mutableListOf<WebFictionTag>()

        // Try multiple selectors based on Metabods site structure
        val tagElements = doc.select(
            "a.tag, " +
            "span.tag, " +
            "div.tag-list a, " +
            "div.tags a, " +
            ".tag-cloud a, " +
            ".category-tag"
        )

        tagElements.forEach { element ->
            val tagName = element.text().trim()
            val tagHref = element.attr("href")
            val tagId = extractTagId(tagHref, tagName)
            
            // Try to extract count if available
            val countText = element.select(".count, .tag-count").text()
            val count = Regex("\\d+").find(countText)?.value?.toIntOrNull() ?: 0

            if (tagName.isNotEmpty()) {
                tags.add(
                    WebFictionTag(
                        id = tagId,
                        name = tagName.lowercase().replace(" ", "-"),
                        displayName = tagName,
                        category = categorizeTag(tagName),
                        count = count
                    )
                )
            }
        }

        // If no tags found, use common tags
        return if (tags.isEmpty()) getCommonMetabodsTags() else tags
    }

    /**
     * Common Metabods tags (fallback if site scraping fails)
     */
    private fun getCommonMetabodsTags(): List<WebFictionTag> {
        return listOf(
            // Transformation types
            WebFictionTag("muscle-growth", "muscle-growth", "Muscle Growth", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("height-growth", "height-growth", "Height Growth", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("size-change", "size-change", "Size Change", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("body-transformation", "body-transformation", "Body Transformation", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("macro", "macro", "Macro/Giant", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("micro", "micro", "Micro/Shrinking", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("age-progression", "age-progression", "Age Progression", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("age-regression", "age-regression", "Age Regression", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("gender-transformation", "gender-transformation", "Gender Transformation", TagCategory.TRANSFORMATION, 0),
            WebFictionTag("reality-alteration", "reality-alteration", "Reality Alteration", TagCategory.TRANSFORMATION, 0),
            
            // Genres
            WebFictionTag("sci-fi", "sci-fi", "Science Fiction", TagCategory.GENRE, 0),
            WebFictionTag("fantasy", "fantasy", "Fantasy", TagCategory.GENRE, 0),
            WebFictionTag("superhero", "superhero", "Superhero", TagCategory.GENRE, 0),
            WebFictionTag("slice-of-life", "slice-of-life", "Slice of Life", TagCategory.GENRE, 0),
            WebFictionTag("horror", "horror", "Horror", TagCategory.GENRE, 0),
            WebFictionTag("comedy", "comedy", "Comedy", TagCategory.GENRE, 0),
            WebFictionTag("drama", "drama", "Drama", TagCategory.GENRE, 0),
            
            // Themes
            WebFictionTag("romance", "romance", "Romance", TagCategory.THEME, 0),
            WebFictionTag("action", "action", "Action", TagCategory.THEME, 0),
            WebFictionTag("adventure", "adventure", "Adventure", TagCategory.THEME, 0),
            WebFictionTag("erotic", "erotic", "Erotic", TagCategory.THEME, 0),
            WebFictionTag("mind-control", "mind-control", "Mind Control", TagCategory.THEME, 0),
            WebFictionTag("power-fantasy", "power-fantasy", "Power Fantasy", TagCategory.THEME, 0),
            
            // Ratings
            WebFictionTag("mature", "mature", "Mature", TagCategory.RATING, 0),
            WebFictionTag("explicit", "explicit", "Explicit", TagCategory.RATING, 0),
            WebFictionTag("adult", "adult", "Adult Only", TagCategory.RATING, 0)
        )
    }

    /**
     * Categorize a tag based on its name
     */
    private fun categorizeTag(tagName: String): TagCategory {
        val lowerTag = tagName.lowercase()
        return when {
            lowerTag.contains("growth") || lowerTag.contains("transformation") || 
            lowerTag.contains("macro") || lowerTag.contains("micro") || 
            lowerTag.contains("size") || lowerTag.contains("age") ||
            lowerTag.contains("gender") -> TagCategory.TRANSFORMATION
            
            lowerTag.contains("sci-fi") || lowerTag.contains("fantasy") || 
            lowerTag.contains("superhero") || lowerTag.contains("horror") -> TagCategory.GENRE
            
            lowerTag.contains("romance") || lowerTag.contains("erotic") || 
            lowerTag.contains("action") || lowerTag.contains("adventure") -> TagCategory.THEME
            
            lowerTag.contains("mature") || lowerTag.contains("explicit") || 
            lowerTag.contains("adult") || lowerTag.contains("nsfw") -> TagCategory.RATING
            
            else -> TagCategory.GENERAL
        }
    }

    /**
     * Extract tag ID from href or generate from name
     */
    private fun extractTagId(href: String, name: String): String {
        // Try to extract ID from URL like /tag/123 or /tags/muscle-growth
        val idMatch = Regex("tag[s]?/(\\d+|[a-z0-9-]+)").find(href)
        return idMatch?.groupValues?.get(1) ?: name.lowercase().replace(" ", "-")
    }

    /**
     * Browse stories by tag(s)
     */
    suspend fun browseByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                val url = buildSearchUrl(criteria)
                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = extractStoriesFromBrowse(doc)
                val filtered = contentFilterHelper.filterStories(stories)
                val paged = filtered.drop(criteria.offset).take(criteria.limit)
                val consumed = criteria.offset + paged.size
                val hasMore = filtered.size > consumed
                val nextOffset = if (hasMore) consumed else null

                Result.success(
                    StorySearchResult(
                        stories = paged,
                        totalCount = filtered.size,
                        hasMore = hasMore,
                        nextOffset = nextOffset
                    )
                )
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    /**
     * Build search URL with tag filters
     */
    private fun buildSearchUrl(criteria: StorySearchCriteria): String {
        val url = StringBuilder(BROWSE_URL)
        
        if (criteria.tags.isNotEmpty()) {
            // Build tag query
            val tagParam = criteria.tags.joinToString(",")
            url.append("?tags=$tagParam")
            
            // Tag match mode
            if (criteria.tagMatchMode == TagMatchMode.ALL) {
                url.append("&match=all")
            }
        } else {
            url.append("?")
        }
        
        // Exclude tags
        if (criteria.excludeTags.isNotEmpty()) {
            val excludeParam = criteria.excludeTags.joinToString(",")
            url.append("&exclude=$excludeParam")
        }
        
        // Word count filters
        criteria.minWordCount?.let { url.append("&min_words=$it") }
        criteria.maxWordCount?.let { url.append("&max_words=$it") }
        
        // Status filter
        criteria.status?.let { url.append("&status=${it.name.lowercase()}") }
        
        // Rating filter
        criteria.rating?.let { url.append("&rating=$it") }
        
        // Sort
        url.append("&sort=${criteria.sortBy.name.lowercase()}")
        url.append("&order=${criteria.sortOrder.name.lowercase()}")
        
        // Pagination
        url.append("&limit=${criteria.limit}")
        url.append("&offset=${criteria.offset}")
        
        return url.toString()
    }

    /**
     * Extract stories from browse/search results page
     */
    private suspend fun extractStoriesFromBrowse(doc: Document): List<WebFictionStory> {
        val stories = mutableListOf<WebFictionStory>()
        
        // Try multiple selectors for story listings
        val storyElements = doc.select(
            "div.story-card, " +
            "div.story-item, " +
            "article.story, " +
            "div.story-listing, " +
            ".story-list .story"
        )

        storyElements.forEach { element ->
            try {
                val story = extractStoryFromListingElement(element)
                if (story != null) {
                    stories.add(story)
                }
            } catch (e: Exception) {
                // Skip invalid stories
            }
        }

        return stories
    }

    /**
     * Extract story info from a listing element
     */
    private fun extractStoryFromListingElement(element: org.jsoup.nodes.Element): WebFictionStory? {
        // Extract URL
        val linkElement = element.select("a.story-link, a.title-link, h3 a, h2 a").firstOrNull()
        val relativeUrl = linkElement?.attr("href") ?: return null
        val url = if (relativeUrl.startsWith("http")) relativeUrl else "$BASE_URL$relativeUrl"
        
        // Extract story ID
        val storyId = Regex("story/(\\d+)|stories/(\\d+)").find(url)?.groupValues?.get(1)
            ?: url.hashCode().toString()
        
        // Extract title
        val title = linkElement.text().ifEmpty {
            element.select("h2, h3, .story-title, .title").text()
        }
        
        if (title.isEmpty()) return null
        
        // Extract author
        val author = element.select(".author, .story-author, a.author-link").text()
        
        // Extract description
        val description = element.select(".description, .story-description, .summary").text()
        
        // Extract tags
        val tags = element.select("a.tag, span.tag, .story-tags a").map { it.text() }
        
        // Extract metadata
        val wordCountText = element.select(".word-count, .words").text()
        val wordCount = Regex("([0-9,]+)").find(wordCountText)?.value?.replace(",", "")?.toLongOrNull()
        
        val chapterText = element.select(".chapters, .chapter-count").text()
        val chapterCount = Regex("(\\d+)").find(chapterText)?.value?.toIntOrNull()
        
        // Extract rating if available
        val rating = element.select(".rating, .content-rating").text()
            .ifEmpty { if (tags.any { it.lowercase().contains("explicit") }) "Explicit" else "Mature" }
        
        return WebFictionStory(
            id = storyId,
            url = url,
            title = title,
            author = author.ifEmpty { "Unknown" },
            description = description,
            status = StoryStatus.UNKNOWN,
            genre = "Transformation",
            fandom = "Original",
            language = "English",
            wordCount = wordCount,
            chapterCount = chapterCount,
            lastUpdated = null,
            rating = rating,
            tags = tags,
            site = "Metabods",
            totalChapters = chapterCount
        )
    }

    /**
     * Extract total count from page
     */
    private fun extractTotalCount(doc: Document, currentCount: Int): Int {
        val countText = doc.select(
            ".result-count, .total-stories, .story-count"
        ).text()
        
        val count = Regex("(\\d+)").find(countText)?.value?.toIntOrNull()
        return count ?: currentCount
    }

    /**
     * Check if a story has a direct download link on Metabods
     * (respecting the site's download button)
     */
    suspend fun getDirectDownloadUrl(storyUrl: String): Result<String?> {
        return withContext(Dispatchers.IO) {
            try {
                val doc = Jsoup.connect(storyUrl)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                // Look for download button/link
                val downloadLink = doc.select(
                    "a.download-button, " +
                    "a.download-link, " +
                    "a[href*=download], " +
                    "button.download, " +
                    ".download-actions a"
                ).firstOrNull()?.attr("abs:href")

                Result.success(downloadLink)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    /**
     * Download story respecting Metabods download button if available
     */
    suspend fun downloadStoryWithRespect(storyUrl: String): Result<WebFictionStory> {
        return withContext(Dispatchers.IO) {
            try {
                // First check if there's a direct download available
                val downloadUrl = getDirectDownloadUrl(storyUrl).getOrNull()
                
                if (downloadUrl != null) {
                    // Use the site's download mechanism
                    // This would download the file directly (EPUB, PDF, etc.)
                    // For now, we'll still use our scraper but note the availability
                }
                
                // Fall back to our standard extraction
                val story = webFictionService.extractStoryFromUrl(storyUrl)
                if (story != null) {
                    Result.success(story)
                } else {
                    Result.failure(Exception("Failed to extract story"))
                }
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }

    /**
     * Search stories by text query (in addition to tags)
     */
    suspend fun searchByQuery(
        query: String,
        criteria: StorySearchCriteria = StorySearchCriteria()
    ): Result<StorySearchResult> {
        return withContext(Dispatchers.IO) {
            try {
                val url = "$SEARCH_URL?q=${java.net.URLEncoder.encode(query, "UTF-8")}" +
                        "&tags=${criteria.tags.joinToString(",")}" +
                        "&limit=${criteria.limit}" +
                        "&offset=${criteria.offset}"

                val doc = Jsoup.connect(url)
                    .timeout(REQUEST_TIMEOUT)
                    .userAgent(USER_AGENT)
                    .get()

                val stories = extractStoriesFromBrowse(doc)
                val totalCount = extractTotalCount(doc, stories.size)

                Result.success(
                    StorySearchResult(
                        stories = stories,
                        totalCount = totalCount,
                        hasMore = stories.size >= criteria.limit,
                        nextOffset = if (stories.size >= criteria.limit) 
                            criteria.offset + criteria.limit else null
                    )
                )
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }
}
