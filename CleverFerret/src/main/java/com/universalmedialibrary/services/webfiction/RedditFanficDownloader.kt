package com.universalmedialibrary.services.webfiction

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.booleanOrNull
import kotlinx.serialization.json.contentOrNull
import kotlinx.serialization.json.doubleOrNull
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import org.jsoup.Jsoup
import org.jsoup.nodes.Entities
import org.jsoup.parser.Parser
import java.net.URLEncoder
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.TimeZone

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
        private const val REQUEST_TIMEOUT = 15000
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
            .header("Accept", "application/json")
            .timeout(REQUEST_TIMEOUT)
            .get()
            .text()

        val data = Json.parseToJsonElement(json).jsonObject
        val posts = data["data"]?.jsonObject?.get("children")?.jsonArray ?: kotlinx.serialization.json.JsonArray(emptyList())

        val rawChapters = posts.mapNotNull { child ->
            val post = child.jsonObject["data"]?.jsonObject ?: return@mapNotNull null
            val title = post["title"]?.jsonPrimitive?.contentOrNull ?: return@mapNotNull null
            val postAuthor = post["author"]?.jsonPrimitive?.contentOrNull ?: ""
            val createdUtc = post["created_utc"]?.jsonPrimitive?.doubleOrNull?.toLong() ?: 0L
            val isSelfPost = post["is_self"]?.jsonPrimitive?.booleanOrNull ?: false

            // Filter to only self-posts (text posts, not links) for stories
            if (!isSelfPost) return@mapNotNull null

            val permalink = post["permalink"]?.jsonPrimitive?.contentOrNull
            val directUrl = post["url_overridden_by_dest"]?.jsonPrimitive?.contentOrNull
            val url = when {
                !permalink.isNullOrBlank() -> "https://www.reddit.com$permalink"
                !directUrl.isNullOrBlank() -> directUrl
                else -> return@mapNotNull null
            }

            val selftextHtml = post["selftext_html"]?.jsonPrimitive?.contentOrNull
            val selftext = post["selftext"]?.jsonPrimitive?.contentOrNull

            // Heuristic to extract chapter number - improved patterns
            val number = Regex("(?i)(?:chapter|ch\\.?)[\\s-_]*([0-9]+)").find(title)?.groupValues?.get(1)?.toIntOrNull()
                ?: Regex("(?i)(?:part)[\\s-_]*([0-9]+)").find(title)?.groupValues?.get(1)?.toIntOrNull()
                ?: Regex("(?i)#\\s*([0-9]+)").find(title)?.groupValues?.get(1)?.toIntOrNull()
                ?: 0

            val html = buildChapterHtml(
                url = url,
                author = postAuthor,
                createdUtc = createdUtc,
                selftextHtml = selftextHtml,
                selftext = selftext
            )

            ChapterPost(
                number = number,
                title = title,
                url = url,
                html = html,
                author = postAuthor,
                createdUtc = createdUtc
            )
        }
            .toList()

        val normalizedChapters = rawChapters
            .sortedWith(
                compareBy<ChapterPost> {
                    when {
                        it.number > 0 -> it.number
                        else -> Int.MAX_VALUE
                    }
                }.thenBy { it.createdUtc }
            )
            .mapIndexed { index, chapter ->
                val normalizedNumber = if (chapter.number > 0) chapter.number else index + 1
                chapter.copy(number = normalizedNumber)
            }
            .distinctBy { it.url }

        val canonicalAuthor = author
            ?: normalizedChapters.firstOrNull { it.author.isNotBlank() }?.author

        SeriesResult(
            seriesTitle = seriesQuery,
            author = canonicalAuthor,
            chapters = normalizedChapters
        )
    }

    private fun buildChapterHtml(
        url: String,
        author: String,
        createdUtc: Long,
        selftextHtml: String?,
        selftext: String?
    ): String {
        val content = decodeSelftextHtml(selftextHtml)
            ?: convertMarkdownToHtml(selftext)
            ?: downloadPostBody(url)
            ?: "<p>Failed to fetch content from ${Entities.escape(url)}.</p>"

        return wrapChapterHtml(url, author, createdUtc, content.ifBlank { "<p>No content available.</p>" })
    }

    private fun decodeSelftextHtml(raw: String?): String? {
        if (raw.isNullOrBlank()) return null
        val decoded = Parser.unescapeEntities(raw, false).trim()
        if (decoded.isBlank()) return null
        val doc = Jsoup.parseBodyFragment(decoded)
        return doc.selectFirst("div.md")?.html()
            ?: doc.body().html().takeIf { it.isNotBlank() }
    }

    private fun convertMarkdownToHtml(text: String?): String? {
        if (text.isNullOrBlank()) return null
        val normalized = text.replace("\r\n", "\n").trim()
        if (normalized.isBlank()) return null

        val escaped = Entities.escape(normalized)
        val paragraphs = escaped
            .split("\n\n")
            .filter { it.isNotBlank() }
            .joinToString(separator = "") { paragraph ->
                "<p>${paragraph.replace("\n", "<br/>")}</p>"
            }

        return paragraphs.ifBlank { null }
    }

    private fun downloadPostBody(originalUrl: String): String? {
        val candidateUrls = mutableListOf<String>()
        if (originalUrl.contains("reddit.com") && !originalUrl.contains("old.reddit.com")) {
            candidateUrls.add(
                originalUrl
                    .replace("https://www.reddit.com", "https://old.reddit.com")
                    .replace("http://www.reddit.com", "https://old.reddit.com")
                    .replace("https://reddit.com", "https://old.reddit.com")
            )
        }
        candidateUrls.add(originalUrl)

        for (candidate in candidateUrls.distinct()) {
            try {
                val doc = Jsoup.connect(candidate)
                    .userAgent("Mozilla/5.0")
                    .timeout(REQUEST_TIMEOUT)
                    .get()

                val content = doc.select(".usertext-body .md").first()?.html()
                    ?: doc.select("div[data-test-id=post-content] div[data-click-id=text]").first()?.html()
                    ?: doc.select("article").first()?.html()
                    ?: doc.body().html()

                if (!content.isNullOrBlank()) {
                    return content
                }
            } catch (_: Exception) {
                // Try the next option
            }
        }

        return null
    }

    private fun wrapChapterHtml(url: String, author: String, createdUtc: Long, content: String): String {
        val safeUrl = Entities.escape(url)
        val metaBuilder = buildString {
            append("""<p><strong>Source:</strong> <a href="$safeUrl">$safeUrl</a></p>""")
            if (author.isNotBlank()) {
                append("""<p><strong>Author:</strong> ${Entities.escape(author)}</p>""")
            }
            formatTimestamp(createdUtc)?.let { formatted ->
                append("""<p><strong>Posted:</strong> $formatted</p>""")
            }
        }

        return """
        <article class="reddit-chapter">
          <div class="chapter-meta">
            $metaBuilder
          </div>
          <div class="chapter-content">
            $content
          </div>
        </article>
        """.trimIndent()
    }

    private fun formatTimestamp(createdUtc: Long): String? {
        if (createdUtc <= 0L) return null
        val formatter = SimpleDateFormat("yyyy-MM-dd HH:mm:ss 'UTC'", Locale.US).apply {
            timeZone = TimeZone.getTimeZone("UTC")
        }
        return formatter.format(Date(createdUtc * 1000))
    }
}
