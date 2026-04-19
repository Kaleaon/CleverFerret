package com.universalmedialibrary.services.opds

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserFactory
import java.io.IOException
import java.io.InputStream
import java.io.StringReader
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Thin OPDS/Atom client responsible for downloading and parsing feeds.
 *
 * The parser focuses on the fields CleverFerret needs right now:
 *  - Feed title (for breadcrumb/headings)
 *  - Entry metadata (title, authors, summary, language, timestamps)
 *  - Acquisition/download links on each entry
 *
 * The implementation avoids third-party XML dependencies by using [XmlPullParser].
 */
@Singleton
class OPDSClient @Inject constructor(
    private val okHttpClient: OkHttpClient
) {

    suspend fun fetchFeed(url: String): OPDSFeed = withContext(Dispatchers.IO) {
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", USER_AGENT)
            .build()

        executeWithRetry(url) {
            okHttpClient.newCall(request).execute().use { response ->
                ensureSuccess(response)
                response.body?.byteStream()?.use { stream ->
                    try {
                        parseFeed(stream, url)
                    } catch (parseError: IllegalStateException) {
                        throw parseError
                    } catch (parseError: Exception) {
                        throw IllegalStateException(
                            "Malformed OPDS feed at '$url': ${parseError.message ?: "unable to parse XML"}",
                            parseError
                        )
                    }
                } ?: throw IllegalStateException("Empty OPDS response body")
            }
        }
    }

    private suspend fun <T> executeWithRetry(url: String, block: () -> T): T {
        var attempt = 0
        var lastError: Throwable? = null

        while (attempt < MAX_RETRY_ATTEMPTS) {
            attempt += 1
            try {
                return block()
            } catch (error: Throwable) {
                lastError = error
                val shouldRetry = shouldRetryTransient(error) && attempt < MAX_RETRY_ATTEMPTS
                if (!shouldRetry) {
                    throw when (error) {
                        is IOException -> IllegalStateException(
                            "Unable to reach OPDS server after $attempt attempt(s): $url",
                            error
                        )
                        else -> error
                    }
                }

                delay(calculateBackoffMillis(attempt))
            }
        }

        throw IllegalStateException("Unable to reach OPDS server: $url", lastError)
    }

    private fun shouldRetryTransient(error: Throwable): Boolean {
        return when (error) {
            is TransientHttpException -> true
            is IOException -> true
            else -> false
        }
    }

    private fun calculateBackoffMillis(attempt: Int): Long {
        val exponent = (attempt - 1).coerceAtLeast(0)
        return INITIAL_BACKOFF_MS * (1L shl exponent)
    }

    private fun ensureSuccess(response: Response) {
        if (!response.isSuccessful) {
            val reason = when (response.code) {
                401 -> "Authentication required (HTTP 401)."
                403 -> "Access forbidden (HTTP 403). Check OPDS credentials/permissions."
                404 -> "Catalog/feed not found (HTTP 404)."
                else -> "OPDS request failed: HTTP ${response.code} ${response.message}"
            }

            if (response.code in RETRYABLE_HTTP_CODES) {
                throw TransientHttpException(response.code, reason)
            }
            throw IllegalStateException(reason)
        }
    }

    private fun parseFeed(stream: InputStream, requestUrl: String): OPDSFeed {
        // Read and sanitize XML content to handle malformed entity references
        // (e.g., unescaped & characters in Internet Archive feeds)
        val rawContent = stream.bufferedReader().use { it.readText() }
        val sanitizedContent = sanitizeXmlEntities(rawContent)

        val parser = XmlPullParserFactory.newInstance().apply {
            isNamespaceAware = true
        }.newPullParser().apply {
            setInput(StringReader(sanitizedContent))
        }

        val baseUrl = requestUrl.toHttpUrlOrNull()
        var eventType = parser.eventType

        var sawFeedRoot = false
        var feedTitle = ""
        val feedLinks = mutableListOf<OPDSLink>()
        val entries = mutableListOf<OPDSEntry>()

        var currentEntry: EntryBuilder? = null
        var insideAuthor = false

        while (eventType != XmlPullParser.END_DOCUMENT) {
            when (eventType) {
                XmlPullParser.START_TAG -> {
                    when (parser.name) {
                        "feed" -> {
                            sawFeedRoot = true
                        }
                        "title" -> {
                            val text = parser.nextTextOrEmpty()
                            if (currentEntry != null) {
                                currentEntry.title = text
                            } else {
                                feedTitle = text
                            }
                        }
                        "subtitle", "content", "summary" -> {
                            val text = parser.nextTextOrEmpty()
                            currentEntry?.apply {
                                if (summary.isNullOrBlank()) {
                                    summary = text
                                }
                            }
                        }
                        "language", "dc:language" -> {
                            currentEntry?.language = parser.nextTextOrEmpty()
                        }
                        "updated" -> currentEntry?.updated = parser.nextTextOrEmpty()
                        "published" -> currentEntry?.published = parser.nextTextOrEmpty()
                        "entry" -> currentEntry = EntryBuilder()
                        "author" -> {
                            insideAuthor = true
                        }
                        "name" -> if (insideAuthor) {
                            currentEntry?.authors?.add(parser.nextTextOrEmpty())
                        }
                        "link" -> {
                            val href = parser.getAttributeValue(null, "href")
                                ?: parser.getAttributeValue("", "href")
                            val titleAttr = parser.getAttributeValue(null, "title")
                                ?: parser.getAttributeValue("", "title")
                            val relAttr = parser.getAttributeValue(null, "rel")
                                ?: parser.getAttributeValue("", "rel")
                            val typeAttr = parser.getAttributeValue(null, "type")
                                ?: parser.getAttributeValue("", "type")
                            val relList = relAttr?.splitWhitespace().orEmpty()
                            val resolvedHref = href?.let { resolveHref(baseUrl, it) } ?: ""
                            val link = OPDSLink(
                                href = resolvedHref,
                                title = titleAttr,
                                rel = relList,
                                type = typeAttr
                            )

                            if (currentEntry != null) {
                                if (relList.any { it.contains("acquisition") }) {
                                    currentEntry.acquisitionLinks.add(link)
                                } else if (relList.any { it.contains("subsection") || it.contains("collection") } ||
                                    typeAttr?.contains("application/atom+xml", ignoreCase = true) == true
                                ) {
                                    currentEntry.navigationLinks.add(link)
                                }
                                if (relList.any { it.contains("image") } ||
                                    typeAttr?.startsWith("image") == true
                                ) {
                                    currentEntry.coverUrl = resolvedHref
                                }
                            } else {
                                feedLinks.add(link)
                            }
                        }
                    }
                }

                XmlPullParser.END_TAG -> {
                    when (parser.name) {
                        "author" -> insideAuthor = false
                        "entry" -> {
                            currentEntry?.build()?.let(entries::add)
                            currentEntry = null
                        }
                    }
                }
            }

            eventType = parser.next()
        }

        if (!sawFeedRoot) {
            throw IllegalStateException("Malformed OPDS feed: missing <feed> root element.")
        }
        if (feedTitle.isBlank() && entries.isEmpty() && feedLinks.isEmpty()) {
            throw IllegalStateException("Malformed OPDS feed: no title, entries, or navigation links were found.")
        }

        return OPDSFeed(
            title = feedTitle.ifBlank { "Untitled Catalog" },
            entries = entries,
            navigation = feedLinks
        )
    }

    private fun resolveHref(baseUrl: okhttp3.HttpUrl?, href: String): String {
        return when {
            href.startsWith("http://") || href.startsWith("https://") -> href
            baseUrl != null -> baseUrl.resolve(href)?.toString() ?: href
            else -> href
        }
    }

    fun buildSearchUrl(template: String, query: String): String {
        val encoded = URLEncoder.encode(query, "UTF-8")
        return when {
            template.contains("{query}") -> template.replace("{query}", encoded)
            template.contains("{q}") -> template.replace("{q}", encoded)
            template.contains("%s") -> template.replace("%s", encoded)
            template.contains("%QUERY%") -> template.replace("%QUERY%", encoded)
            template.contains("%q") -> template.replace("%q", encoded)
            else -> {
                val url = template.toHttpUrlOrNull()
                if (url != null) {
                    url.newBuilder()
                        .addQueryParameter("search", encoded)
                        .build()
                        .toString()
                } else {
                    if (template.contains("?")) "$template&search=$encoded"
                    else "$template?search=$encoded"
                }
            }
        }
    }

    private fun XmlPullParser.nextTextOrEmpty(): String {
        return try {
            nextText()?.trim().orEmpty()
        } catch (e: Exception) {
            ""
        }
    }

    private fun String.splitWhitespace(): List<String> {
        return trim().split("\\s+".toRegex()).filter { it.isNotBlank() }
    }

    private data class EntryBuilder(
        var title: String = "",
        var summary: String? = null,
        var published: String? = null,
        var updated: String? = null,
        var language: String? = null,
        var coverUrl: String? = null,
        val authors: MutableList<String> = mutableListOf(),
        val acquisitionLinks: MutableList<OPDSLink> = mutableListOf(),
        val navigationLinks: MutableList<OPDSLink> = mutableListOf()
    ) {
        fun build(): OPDSEntry {
            return OPDSEntry(
                title = title.ifBlank { "Untitled" },
                authors = authors.filter { it.isNotBlank() },
                summary = summary?.takeIf { it.isNotBlank() },
                published = published?.takeIf { it.isNotBlank() },
                updated = updated?.takeIf { it.isNotBlank() },
                language = language?.takeIf { it.isNotBlank() },
                coverUrl = coverUrl?.takeIf { it.isNotBlank() },
                acquisitionLinks = acquisitionLinks.toList(),
                navigationLinks = navigationLinks.toList()
            )
        }
    }

    private class TransientHttpException(val statusCode: Int, message: String) : IOException(message)

    companion object {
        private const val USER_AGENT = "CleverFerret/1.0 (OPDSClient)"
        private const val MAX_RETRY_ATTEMPTS = 3
        private const val INITIAL_BACKOFF_MS = 250L
        private val RETRYABLE_HTTP_CODES = setOf(408, 429, 500, 502, 503, 504)

        /**
         * Regex to match ampersands that are NOT part of valid XML entity references.
         * Valid entities are: &amp; &lt; &gt; &quot; &apos; or numeric refs like &#123; or &#x1F;
         * This matches bare '&' followed by something that doesn't look like a valid entity.
         */
        private val INVALID_AMPERSAND_REGEX = Regex(
            "&(?!(amp|lt|gt|quot|apos|#\\d+|#x[0-9a-fA-F]+);)"
        )
        private val INVALID_NUMERIC_ENTITY_REGEX = Regex("&#(?!\\d+;|x[0-9a-fA-F]+;)")
        private val INVALID_NAMED_ENTITY_REGEX = Regex("&([A-Za-z]+)(?!;)")
    }

    /**
     * Sanitizes XML content by escaping unescaped ampersands and malformed entity-like tokens.
     *
     * Some OPDS feeds (notably Internet Archive) contain malformed XML with unescaped
     * ampersands in URLs or text content, causing parser failures.
     */
    private fun sanitizeXmlEntities(xmlContent: String): String {
        val escapedAmpersands = xmlContent.replace(INVALID_AMPERSAND_REGEX, "&amp;")
        val fixedNumericEntityPrefixes = escapedAmpersands.replace(INVALID_NUMERIC_ENTITY_REGEX, "&amp;#")
        return fixedNumericEntityPrefixes.replace(INVALID_NAMED_ENTITY_REGEX) { match ->
            "&amp;${match.groupValues[1]}"
        }
    }
}
