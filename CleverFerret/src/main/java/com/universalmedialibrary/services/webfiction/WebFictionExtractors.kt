package com.universalmedialibrary.services.webfiction

import org.jsoup.Jsoup

internal suspend fun extractFromAO3(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.select("h2.title").text()
    val author = doc.select("a[rel=author]").text()
    val description = doc.select("div.summary blockquote").text()
    val tags = doc.select("dd.freeform a.tag").map { it.text() }
    val rating = doc.select("dd.rating a.tag").text()
    val statusText = doc.select("dd.status a.tag").text()
    val chapterCount = doc.select("dd.chapters").text().split("/")[0].toIntOrNull() ?: 1
    val language = doc.select("dd.language").text()
    val wordCountText = doc.select("dd.words").text().replace(",", "")
    val wordCount = wordCountText.toLongOrNull()

    val storyId = extractAO3Id(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author,
        description = description,
        status = parseStoryStatus(statusText),
        genre = null,
        fandom = null,
        language = language.ifEmpty { null },
        wordCount = wordCount,
        chapterCount = chapterCount,
        lastUpdated = null,
        rating = rating.ifEmpty { null },
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.ARCHIVE_OF_OUR_OWN),
        totalChapters = chapterCount
    )
}

internal suspend fun extractFromFFN(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.select("b.xcontrast_txt").text()
    val author = doc.select("a.xcontrast_txt").first()?.text() ?: "Unknown"
    val description = doc.select("div#profile_top div.xcontrast_txt").text()
    val storyInfo = doc.select("span.xgray").text()

    // Parse story info (Rating, Language, Chapters, etc.)
    val chapterCount = Regex("Chapters: (\\d+)").find(storyInfo)?.groupValues?.getOrNull(1)?.toIntOrNull() ?: 1
    val statusText = if ("Complete" in storyInfo) "Complete" else "In-Progress"
    val language = Regex("Language: ([^-]+)").find(storyInfo)?.groupValues?.getOrNull(1)?.trim()
    val wordCountText = Regex("Words: ([0-9,]+)").find(storyInfo)?.groupValues?.getOrNull(1)?.replace(",", "")
    val wordCount = wordCountText?.toLongOrNull()
    val rating = Regex("Rated: ([^-]+)").find(storyInfo)?.groupValues?.getOrNull(1)?.trim()
    val genre = Regex("Genre: ([^-]+)").find(storyInfo)?.groupValues?.getOrNull(1)?.trim()

    val storyId = extractFFNId(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author,
        description = description,
        status = parseStoryStatus(statusText),
        genre = genre,
        fandom = null,
        language = language,
        wordCount = wordCount,
        chapterCount = chapterCount,
        lastUpdated = null,
        rating = rating,
        site = siteTypeToString(WebFictionSiteType.FANFICTION_NET),
        totalChapters = chapterCount
    )
}

internal suspend fun extractFromWebnovel(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.select("h1.pt4").text()
    val author = doc.select("address a").text()
    val description = doc.select("p").firstOrNull { it.text().isNotEmpty() }?.text() ?: ""
    val coverUrl = doc.select("i.g_thumb img").attr("src")
    val tags = doc.select("p.tags a").map { it.text() }

    val storyId = extractWebnovelId(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author,
        description = description,
        status = StoryStatus.UNKNOWN,
        genre = tags.firstOrNull(),
        fandom = null,
        language = null,
        wordCount = null,
        chapterCount = null,
        lastUpdated = null,
        rating = null,
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.WEBNOVEL),
        coverUrl = coverUrl
    )
}

internal suspend fun extractFromWattpad(url: String): WebFictionStory? {
    // Wattpad requires more complex handling due to dynamic loading
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.select("h1").text()
    val author = doc.select("a.username").text()
    val description = doc.select("h2.description").text()
    val coverUrl = doc.select("img.cover").attr("src")
    val tags = doc.select("div.tags a").map { it.text() }

    val storyId = extractWattpadId(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author,
        description = description,
        status = StoryStatus.UNKNOWN,
        genre = tags.firstOrNull(),
        fandom = null,
        language = null,
        wordCount = null,
        chapterCount = null,
        lastUpdated = null,
        rating = null,
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.WATTPAD),
        coverUrl = coverUrl
    )
}

internal suspend fun extractFromScribbleHub(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.select("div.fic_title").text()
    val author = doc.select("span.auth_name_fic").text()
    val description = doc.select("div.wi_fic_desc").text()
    val coverUrl = doc.select("div.fic_image img").attr("src")
    val tags = doc.select("a.fic_genre").map { it.text() }
    val statusText = doc.select("span.pub_status").text()

    val storyId = extractScribbleHubId(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author,
        description = description,
        status = parseStoryStatus(statusText),
        genre = tags.firstOrNull(),
        fandom = null,
        language = null,
        wordCount = null,
        chapterCount = null,
        lastUpdated = null,
        rating = null,
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.SCRIBBLE_HUB),
        coverUrl = coverUrl
    )
}

internal suspend fun extractFromFimFiction(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.select("h1 a").text()
    val author = doc.select("div.author a").text()
    val description = doc.select("div.description").text()
    val coverUrl = doc.select("div.story_image img").attr("src")
    val tags = doc.select("a.character_tag, a.content_tag").map { it.text() }
    val statusText = doc.select("span.completion_status").text()

    val storyId = extractFimFictionId(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author,
        description = description,
        status = parseStoryStatus(statusText),
        genre = null,
        fandom = "My Little Pony",
        language = "English",
        wordCount = null,
        chapterCount = null,
        lastUpdated = null,
        rating = null,
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.FIMFICTION),
        coverUrl = coverUrl
    )
}

internal suspend fun downloadAO3Chapters(story: WebFictionStory): List<WebFictionChapter> {
    val chapters = mutableListOf<WebFictionChapter>()

    // AO3 allows downloading entire work at once
    val fullWorkUrl = "${story.url}?view_full_work=true"
    val doc = Jsoup.connect(fullWorkUrl)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val chapterElements = doc.select("div.chapter")
    chapterElements.forEachIndexed { index, element ->
        val chapterTitle = element.select("h3.landmark").text()
        val content = element.select("div.userstuff").html()

        chapters.add(
            WebFictionChapter(
                id = "${story.id}_${index + 1}",
                storyId = story.id,
                number = index + 1,
                title = chapterTitle.ifEmpty { "Chapter ${index + 1}" },
                content = content,
                publishDate = null,
                wordCount = null,
                notes = null
            )
        )
    }

    return chapters
}

internal suspend fun downloadFFNChapters(story: WebFictionStory): List<WebFictionChapter> {
    val chapters = mutableListOf<WebFictionChapter>()

    val totalChapters = story.totalChapters ?: story.chapterCount ?: 1
    for (chapterNum in 1..totalChapters) {
        // Build chapter URL by replacing the last path segment
        val baseUrl = story.url.substringBeforeLast("/")
        val chapterUrl = "$baseUrl/$chapterNum"
        val doc = Jsoup.connect(chapterUrl)
            .timeout(30000)
            .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
            .get()

        val chapterTitle = doc.select("select option[selected]").text()
        val content = doc.select("div#storytext").html()

        chapters.add(
            WebFictionChapter(
                id = "${story.id}_$chapterNum",
                storyId = story.id,
                number = chapterNum,
                title = chapterTitle.ifEmpty { "Chapter $chapterNum" },
                content = content,
                publishDate = null,
                wordCount = null,
                notes = null
            )
        )
    }

    return chapters
}

internal suspend fun downloadWebnovelChapters(story: WebFictionStory): List<WebFictionChapter> {
    // WebNovel often requires login and has anti-scraping measures
    // This would need more sophisticated handling
    return emptyList()
}

internal suspend fun downloadWattpadChapters(story: WebFictionStory): List<WebFictionChapter> {
    // Wattpad requires handling dynamic content loading
    // This would need more sophisticated handling
    return emptyList()
}

internal suspend fun extractFromMetabods(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    // Metabods has a specific structure for stories
    val title = doc.select("h1.story-title, h1").first()?.text() ?: doc.title()
    val author = doc.select("span.author, a.author, div.author-name").text()
    val description = doc.select("div.story-description, div.description, p.description").text()
    val tags = doc.select("a.tag, span.tag").map { it.text() }
    val rating = "M" // Metabods is adult content, default to Mature
    val statusText = doc.select("span.status, div.status").text()

    // Extract chapter count
    val chapterLinks = doc.select("a[href*=/chapter], div.chapter-list a")
    val chapterCount = if (chapterLinks.isNotEmpty()) chapterLinks.size else 1

    val storyId = extractMetabodsId(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author.ifEmpty { "Unknown" },
        description = description,
        status = parseStoryStatus(statusText),
        genre = tags.firstOrNull() ?: "Transformation",
        fandom = "Original",
        language = "English",
        wordCount = null,
        chapterCount = chapterCount,
        lastUpdated = null,
        rating = rating,
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.METABODS),
        totalChapters = chapterCount
    )
}

internal suspend fun extractFromLiterotica(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.select("h1").first()?.text() ?: doc.title()
    val author = doc.select("span.y_eU, a.y_eU").text()
    val description = doc.select("div.aa_ht").text()
    val tags = doc.select("a.y_eV").map { it.text() }
    val rating = "E" // Literotica is explicit adult content

    val storyId = extractLiteroticaId(url)

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author.ifEmpty { "Unknown" },
        description = description,
        status = StoryStatus.COMPLETED,
        genre = tags.firstOrNull(),
        fandom = "Original",
        language = "English",
        wordCount = null,
        chapterCount = 1,
        lastUpdated = null,
        rating = rating,
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.LITEROTICA)
    )
}

internal suspend fun extractFromNifty(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val heading = doc.selectFirst("h2")?.text() ?: doc.title()
    val (title, author) = heading.split(" by ").let {
        it.firstOrNull() to it.getOrNull(1)
    }
    val description = doc.selectFirst("p")?.text()
    val tags = doc.select("a[href*=keywords]").map { it.text() }

    val storyId = url.substringAfterLast('/').substringBefore(".").ifEmpty { url.hashCode().toString() }

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title ?: doc.title(),
        author = author ?: "Unknown",
        description = description,
        status = StoryStatus.UNKNOWN,
        genre = tags.firstOrNull(),
        fandom = null,
        language = "English",
        wordCount = null,
        chapterCount = 1,
        lastUpdated = null,
        rating = "Explicit",
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.NIFTY)
    )
}

internal suspend fun extractFromAdultFanFiction(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.selectFirst(".storyinfo h2, .story-title, h1")?.text() ?: doc.title()
    val author = doc.selectFirst(".authorinfo a, .storyinfo a[href*=profile]")?.text()
    val description = doc.selectFirst(".summary, .storysummary, .storyinfo p")?.text()
    val tags = doc.select(".storyinfo a[href*=/category/], .storyinfo a[href*=/tags/]").map { it.text() }

    val storyId = url.substringAfter("story.php?no=").ifEmpty { url.hashCode().toString() }

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author ?: "Unknown",
        description = description,
        status = StoryStatus.UNKNOWN,
        genre = tags.firstOrNull(),
        fandom = null,
        language = "English",
        wordCount = null,
        chapterCount = 1,
        lastUpdated = null,
        rating = tags.firstOrNull { it.contains("Rated", ignoreCase = true) },
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.ADULT_FANFICTION)
    )
}

internal suspend fun extractFromBdsmlibrary(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.selectFirst("h1, h2.title")?.text() ?: doc.title()
    val author = doc.selectFirst("a[href*=/authors/]")?.text()
    val description = doc.selectFirst(".storyHeader p, .summary, .description")?.text()
    val tags = doc.select("a[href*=/categories/], a[href*=/tags/]").map { it.text() }

    val storyId = url.substringAfter("story.php?storyid=").ifEmpty { url.hashCode().toString() }

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author ?: "Unknown",
        description = description,
        status = StoryStatus.UNKNOWN,
        genre = tags.firstOrNull(),
        fandom = null,
        language = "English",
        wordCount = null,
        chapterCount = 1,
        lastUpdated = null,
        rating = "Explicit",
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.BDSM_LIBRARY)
    )
}

internal suspend fun extractFromMcstories(url: String): WebFictionStory? {
    val doc = Jsoup.connect(url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val title = doc.selectFirst("h1, title")?.text() ?: doc.title()
    val author = doc.selectFirst("a[href*=Authors], .byline a")?.text()
    val description = doc.selectFirst("blockquote, .synopsis, p")?.text()
    val tags = doc.select("a[href*=tags], a[href*=search]").map { it.text() }

    val storyId = url.substringAfterLast('/').substringBefore(".").ifEmpty { url.hashCode().toString() }

    return WebFictionStory(
        id = storyId,
        url = url,
        title = title,
        author = author ?: "Unknown",
        description = description,
        status = StoryStatus.UNKNOWN,
        genre = tags.firstOrNull(),
        fandom = null,
        language = "English",
        wordCount = null,
        chapterCount = 1,
        lastUpdated = null,
        rating = "Explicit",
        tags = tags,
        site = siteTypeToString(WebFictionSiteType.MCSTORIES)
    )
}

internal suspend fun downloadMetabodsChapters(story: WebFictionStory): List<WebFictionChapter> {
    val chapters = mutableListOf<WebFictionChapter>()

    val doc = Jsoup.connect(story.url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    // Get all chapter links
    val chapterLinks = doc.select("a[href*=/chapter], div.chapter-list a")

    if (chapterLinks.isEmpty()) {
        // Single chapter story
        val content = doc.select("div.story-content, div.chapter-content, article").html()
        chapters.add(
            WebFictionChapter(
                id = "${story.id}_1",
                storyId = story.id,
                number = 1,
                title = story.title,
                content = content,
                publishDate = null,
                wordCount = null,
                notes = null
            )
        )
    } else {
        // Multi-chapter story
        chapterLinks.forEachIndexed { index, link ->
            val chapterUrl = link.absUrl("href")
            val chapterTitle = link.text()

            val chapterDoc = Jsoup.connect(chapterUrl)
                .timeout(30000)
                .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
                .get()

            val content = chapterDoc.select("div.story-content, div.chapter-content, article").html()

            chapters.add(
                WebFictionChapter(
                    id = "${story.id}_${index + 1}",
                    storyId = story.id,
                    number = index + 1,
                    title = chapterTitle.ifEmpty { "Chapter ${index + 1}" },
                    content = content,
                    publishDate = null,
                    wordCount = null,
                    notes = null
                )
            )
        }
    }

    return chapters
}

internal suspend fun downloadLiteroticaChapters(story: WebFictionStory): List<WebFictionChapter> {
    val chapters = mutableListOf<WebFictionChapter>()

    val doc = Jsoup.connect(story.url)
        .timeout(30000)
        .userAgent("Mozilla/5.0 (compatible; CleverFerret/1.0)")
        .get()

    val content = doc.select("div.aa_ht").html()

    chapters.add(
        WebFictionChapter(
            id = "${story.id}_1",
            storyId = story.id,
            number = 1,
            title = story.title,
            content = content,
            publishDate = null,
            wordCount = null,
            notes = null
        )
    )

    return chapters
}

