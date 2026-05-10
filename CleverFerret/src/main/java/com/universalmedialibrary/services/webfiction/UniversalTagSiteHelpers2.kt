package com.universalmedialibrary.services.webfiction

import org.jsoup.Jsoup

internal suspend fun fetchWattpadTags(): Result<List<WebFictionTag>> {
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

internal suspend fun browseWattpadByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
    return Result.failure(Exception("Wattpad tag browsing requires authentication"))
}

internal suspend fun fetchScribbleHubTags(): Result<List<WebFictionTag>> {
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

internal suspend fun fetchLiteroticaTags(): Result<List<WebFictionTag>> {
    return Result.success(
        listOf(
            WebFictionTag("erotic", "erotic", "Erotic", TagCategory.RATING, 0),
            WebFictionTag("bdsm", "bdsm", "BDSM", TagCategory.THEME, 0),
            WebFictionTag("romance", "romance", "Romance", TagCategory.THEME, 0),
            WebFictionTag("group", "group", "Group", TagCategory.THEME, 0)
        )
    )
}

internal suspend fun fetchNiftyTags(): Result<List<WebFictionTag>> {
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

internal suspend fun fetchAdultFanFictionTags(): Result<List<WebFictionTag>> {
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

internal suspend fun fetchBdsmlibraryTags(): Result<List<WebFictionTag>> {
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

internal suspend fun fetchMcstoriesTags(): Result<List<WebFictionTag>> {
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

internal suspend fun fetchQQTags(): Result<List<WebFictionTag>> {
    return Result.success(
        listOf(
            WebFictionTag("nsfw", "nsfw", "NSFW", TagCategory.RATING, 0),
            WebFictionTag("quest", "quest", "Quest", TagCategory.GENRE, 0),
            WebFictionTag("original", "original", "Original", TagCategory.GENRE, 0)
        )
    )
}

internal suspend fun browseScribbleHubByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
    return withContext(Dispatchers.IO) {
        if (criteria.tags.isEmpty()) {
            return@withContext Result.failure(Exception("Select at least one tag"))
        }

        val query = criteria.tags.joinToString(" ")
        val encodedQuery = URLEncoder.encode(query, "UTF-8")
        val effectiveLimit = if (criteria.limit <= 0) 50 else criteria.limit
        val pageSize = SCRIBBLE_HUB_PAGE_SIZE
        val page = ((criteria.offset / pageSize) + 1).coerceAtLeast(1)
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

            val offsetWithinPage = criteria.offset % pageSize
            val pagedStories = mappedStories.drop(offsetWithinPage)
            val limitedStories = pagedStories.take(effectiveLimit)

            val hasMore = pagedStories.size > limitedStories.size || mappedStories.size == pageSize
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

internal fun parseScribbleHubId(url: String): String {
    return Regex("series/(\\d+)").find(url)?.groupValues?.getOrNull(1)
        ?: url.hashCode().toString()
}

internal suspend fun browseNiftyByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
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

internal suspend fun browseAdultFanFictionByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
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

internal suspend fun browseBdsmlibraryByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
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

internal suspend fun browseMcstoriesByTags(criteria: StorySearchCriteria): Result<StorySearchResult> {
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

