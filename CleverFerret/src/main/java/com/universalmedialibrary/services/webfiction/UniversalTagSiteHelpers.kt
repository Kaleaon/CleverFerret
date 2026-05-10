package com.universalmedialibrary.services.webfiction

import org.jsoup.Jsoup

internal suspend fun fetchAO3Tags(): Result<List<WebFictionTag>> {
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

internal suspend fun browseAO3ByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
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

internal fun buildAO3SearchUrl(criteria: StorySearchCriteria): String {
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

internal suspend fun parseAO3SearchResults(doc: org.jsoup.nodes.Document): List<WebFictionStory> {
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
            val wordCount = Regex("Words:\\s*([0-9,]+)").find(stats)?.groupValues?.getOrNull(1)?.replace(",", "")?.toLongOrNull()
            val chapters = Regex("(\\d+)/(\\d+|\\?)").find(stats)?.groupValues?.getOrNull(1)?.toIntOrNull()
            
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

internal suspend fun fetchFFNTags(): Result<List<WebFictionTag>> {
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

internal suspend fun browseFFNByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
    // FFN doesn't have great tag browsing API, would need web scraping
    return Result.failure(Exception("FFN tag browsing requires specific category selection"))
}

internal suspend fun fetchRoyalRoadTags(): Result<List<WebFictionTag>> {
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

internal suspend fun browseRoyalRoadByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
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

internal fun parseRoyalRoadSearchResults(doc: org.jsoup.nodes.Document): List<WebFictionStory> {
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

internal fun extractRoyalRoadDisplayNameAndCount(raw: String): Pair<String, Int> {
    val countMatch = royalRoadCountRegex.find(raw)
    val count = countMatch?.groupValues?.getOrNull(1)?.replace(",", "")?.toIntOrNull() ?: 0
    val displayName = raw.replace(royalRoadCountRegex, "").trim()
    return displayName to count
}

internal fun extractRoyalRoadTagId(element: org.jsoup.nodes.Element, displayName: String): String {
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

internal fun sanitizeTagId(value: String): String {
    return fileNameSanitizer.sanitizeTagId(value)
}

internal fun categorizeRoyalRoadTag(tagName: String): TagCategory {
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

internal fun getRoyalRoadFallbackTags(): List<WebFictionTag> = listOf(
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

internal fun buildRoyalRoadSearchUrl(criteria: StorySearchCriteria): String {
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

