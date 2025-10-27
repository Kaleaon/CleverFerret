package com.universalmedialibrary.services.webfiction

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.net.URLEncoder
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonArray

/**
 * Reddit fanfiction downloader for series like "Out of Cruel Space" (HFY).
 * Fetches latest chapter posts, orders them, and extracts readable HTML.
 * 
 * Reddit API Configuration:
 * - Client ID: EvU-yXXa66v0qe94RLorQw
 * - User Agent: CleverFerret:OutOfCruelSpaceDownloader:v1.0
 */
class RedditFanficDownloader {

    companion object {
        const val REDDIT_CLIENT_ID = "EvU-yXXa66v0qe94RLorQw"
        const val USER_AGENT = "CleverFerret:OutOfCruelSpaceDownloader:v1.0 (Android)"
    }

    data class ChapterPost(
        val number: Int,
        val title: String,
        val url: String,
        val html: String,
        val author: String = "",
        val createdUtc: Long = 0L
    )

    data class SeriesResult(
        val seriesTitle: String,
        val author: String?,
        val chapters: List<ChapterPost>
    )

    /**
     * Fetch chapters by Reddit search. Example:
     * seriesQuery: "Out of Cruel Space", subreddit: "HFY".
     * 
     * For "Out of Cruel Space" specifically, also filter by author "KyleKKent"
     */
    suspend fun fetchSeries(
        seriesQuery: String,
        subreddit: String = "HFY",
        maxPosts: Int = 100,
        author: String? = null
    ): SeriesResult = withContext(Dispatchers.IO) {
        val authorQuery = if (author != null) " author:$author" else ""
        val q = URLEncoder.encode("$seriesQuery$authorQuery", Charsets.UTF_8.name())
        val searchUrl = "https://www.reddit.com/r/$subreddit/search.json?q=$q&restrict_sr=1&sort=new&limit=$maxPosts&t=all"

        val json = Jsoup.connect(searchUrl)
            .ignoreContentType(true)
            .userAgent(USER_AGENT)
            .timeout(15000)
            .get()
            .text()

        val data = kotlinx.serialization.json.Json.parseToJsonElement(json).jsonObject
        val posts = data["data"]?.jsonObject?.get("children")?.jsonArray ?: kotlinx.serialization.json.JsonArray(emptyList())

        val chapters = posts.mapNotNull { child ->
            val post = child.jsonObject["data"]?.jsonObject ?: return@mapNotNull null
            val title = post["title"]?.toString()?.trim('"') ?: return@mapNotNull null
            val postAuthor = post["author"]?.toString()?.trim('"') ?: ""
            val createdUtc = post["created_utc"]?.toString()?.toDoubleOrNull()?.toLong() ?: 0L
            val isSelfPost = post["is_self"]?.toString() == "true"
            
            // Filter to only self-posts (text posts, not links) for stories
            if (!isSelfPost) return@mapNotNull null
            
            val url = post["url_overridden_by_dest"]?.toString()?.trim('"')
                ?: ("https://www.reddit.com" + (post["permalink"]?.toString()?.trim('"') ?: return@mapNotNull null))

            // Heuristic to extract chapter number - improved patterns
            val number = Regex("(?i)(?:chapter|ch\\.?)[\\s-_]*([0-9]+)").find(title)?.groupValues?.get(1)?.toIntOrNull()
                ?: Regex("(?i)(?:part)[\\s-_]*([0-9]+)").find(title)?.groupValues?.get(1)?.toIntOrNull()
                ?: Regex("(?i)#\\s*([0-9]+)").find(title)?.groupValues?.get(1)?.toIntOrNull()
                ?: 0

            val html = fetchPostHtml(url)
            ChapterPost(
                number = number, 
                title = title, 
                url = url, 
                html = html,
                author = postAuthor,
                createdUtc = createdUtc
            )
        }
            .sortedWith(compareBy<ChapterPost> { it.number }.thenBy { it.createdUtc })
            .toList()

        SeriesResult(
            seriesTitle = seriesQuery,
            author = null,
            chapters = chapters
        )
    }

    private fun fetchPostHtml(url: String): String {
        return try {
            val doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0")
                .timeout(15000)
                .get()

            // Prefer old.reddit if possible for consistent markup
            if (url.contains("reddit.com") && !url.contains("old.reddit.com")) {
                val oldUrl = url.replace("www.reddit.com", "old.reddit.com")
                return fetchPostHtml(oldUrl)
            }

            // Extract self-text content if available
            val content = doc.select(".usertext-body .md").first()?.html()
                ?: doc.select("div[data-test-id=post-content] div[data-click-id=text]").first()?.html()
                ?: doc.select("article").first()?.html()
                ?: doc.body().html()

            """
            <article class="reddit-chapter">
              <h2><a href="$url">Source</a></h2>
              $content
            </article>
            """.trimIndent()
        } catch (e: Exception) {
            "<p>Failed to fetch content from $url: ${e.message}</p>"
        }
    }
}
