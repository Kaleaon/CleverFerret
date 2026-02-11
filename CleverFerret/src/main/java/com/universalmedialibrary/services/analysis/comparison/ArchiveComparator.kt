package com.universalmedialibrary.services.analysis.comparison

import com.universalmedialibrary.services.analysis.ArchiveItem
import com.universalmedialibrary.services.analysis.ArchiveMatch
import com.universalmedialibrary.services.analysis.ArchiveMatchType
import com.universalmedialibrary.services.analysis.ExtractedMetadata
import com.universalmedialibrary.services.metadata.ComprehensiveMetadataService
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONArray
import org.json.JSONObject
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Compares content against known archives to find matches
 */
@Singleton
class ArchiveComparator @Inject constructor(
    private val metadataService: ComprehensiveMetadataService
) {

    /**
     * Compare extracted metadata against archive databases
     */
    suspend fun compareAgainstArchives(metadata: ExtractedMetadata): List<ArchiveMatch> {
        val matches = mutableListOf<ArchiveMatch>()

        // Compare against various archives
        matches.addAll(compareAgainstLibraryOfCongress(metadata))
        matches.addAll(compareAgainstWorldCat(metadata))
        matches.addAll(compareAgainstInternetArchive(metadata))
        matches.addAll(compareAgainstGoodreads(metadata))

        return matches.sortedByDescending { it.confidence }
    }

    private suspend fun compareAgainstLibraryOfCongress(metadata: ExtractedMetadata): List<ArchiveMatch> {
        return withContext(Dispatchers.IO) {
            try {
                val queryParts = mutableListOf<String>()
                metadata.title?.let { queryParts.add(it) }
                metadata.author?.let { queryParts.add(it) }
                if (queryParts.isEmpty()) return@withContext emptyList()

                val query = URLEncoder.encode(queryParts.joinToString(" "), "UTF-8")
                val url = URL("https://www.loc.gov/search/?q=$query&fo=json")
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "GET"
                connection.connectTimeout = 10_000
                connection.readTimeout = 10_000
                connection.setRequestProperty("Accept", "application/json")

                if (connection.responseCode != HttpURLConnection.HTTP_OK) {
                    return@withContext emptyList()
                }

                val responseBody = connection.inputStream.bufferedReader().use { it.readText() }
                val json = JSONObject(responseBody)
                val results = json.optJSONArray("results") ?: return@withContext emptyList()

                val matches = mutableListOf<ArchiveMatch>()
                val limit = minOf(results.length(), 10)

                for (i in 0 until limit) {
                    val item = results.getJSONObject(i)
                    val itemTitle = item.optString("title", "").trim()
                    val itemAuthor = item.optJSONArray("contributor")?.let { contributors ->
                        if (contributors.length() > 0) contributors.optString(0) else null
                    }?.trim()
                    val itemDate = item.optString("date", null)
                    val itemId = item.optString("id", "loc-${i}")

                    if (itemTitle.isEmpty()) continue

                    val archiveItem = ArchiveItem(
                        id = itemId,
                        title = itemTitle,
                        author = itemAuthor,
                        year = itemDate,
                        isbn = null,
                        source = "Library of Congress",
                        metadata = mapOf(
                            "url" to itemId,
                            "type" to item.optString("original_format", "unknown")
                        )
                    )

                    val archiveMetadata = ExtractedMetadata(
                        title = itemTitle,
                        author = itemAuthor,
                        description = item.optString("description", null),
                        publishDate = itemDate,
                        genre = null,
                        language = item.optJSONArray("language")?.optString(0),
                        isbn = null,
                        publisher = null,
                        pageCount = null,
                        extractionMethod = "loc_api"
                    )

                    val similarity = calculateSimilarity(metadata, archiveMetadata)
                    if (similarity > 0.3f) {
                        val matchType = when {
                            similarity >= 0.9f -> ArchiveMatchType.EXACT_MATCH
                            similarity >= 0.7f -> ArchiveMatchType.FUZZY_MATCH
                            similarity >= 0.4f -> ArchiveMatchType.PARTIAL_MATCH
                            else -> ArchiveMatchType.NO_MATCH
                        }

                        val matchedFields = mutableListOf<String>()
                        if (metadata.title != null && itemTitle.isNotEmpty()) matchedFields.add("title")
                        if (metadata.author != null && itemAuthor != null) matchedFields.add("author")

                        matches.add(
                            ArchiveMatch(
                                matchType = matchType,
                                confidence = similarity,
                                sourceArchive = "Library of Congress",
                                matchedItem = archiveItem,
                                similarityScore = similarity,
                                matchedFields = matchedFields
                            )
                        )
                    }
                }

                matches
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    private suspend fun compareAgainstWorldCat(metadata: ExtractedMetadata): List<ArchiveMatch> {
        return withContext(Dispatchers.IO) {
            try {
                val queryParts = mutableListOf<String>()
                metadata.title?.let { queryParts.add(it) }
                metadata.author?.let { queryParts.add(it) }
                if (queryParts.isEmpty()) return@withContext emptyList()

                val query = URLEncoder.encode(queryParts.joinToString(" "), "UTF-8")
                val url = URL("https://openlibrary.org/search.json?q=$query")
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "GET"
                connection.connectTimeout = 10_000
                connection.readTimeout = 10_000
                connection.setRequestProperty("Accept", "application/json")

                if (connection.responseCode != HttpURLConnection.HTTP_OK) {
                    return@withContext emptyList()
                }

                val responseBody = connection.inputStream.bufferedReader().use { it.readText() }
                val json = JSONObject(responseBody)
                val docs = json.optJSONArray("docs") ?: return@withContext emptyList()

                val matches = mutableListOf<ArchiveMatch>()
                val limit = minOf(docs.length(), 10)

                for (i in 0 until limit) {
                    val doc = docs.getJSONObject(i)
                    val itemTitle = doc.optString("title", "").trim()
                    val itemAuthor = doc.optJSONArray("author_name")?.let { authors ->
                        if (authors.length() > 0) authors.optString(0) else null
                    }?.trim()
                    val firstPublishYear = doc.optString("first_publish_year", null)
                    val itemIsbn = doc.optJSONArray("isbn")?.let { isbns ->
                        if (isbns.length() > 0) isbns.optString(0) else null
                    }
                    val olKey = doc.optString("key", "ol-${i}")

                    if (itemTitle.isEmpty()) continue

                    val archiveItem = ArchiveItem(
                        id = olKey,
                        title = itemTitle,
                        author = itemAuthor,
                        year = firstPublishYear,
                        isbn = itemIsbn,
                        source = "Open Library (WorldCat)",
                        metadata = mapOf(
                            "edition_count" to (doc.optInt("edition_count", 0)),
                            "publisher" to (doc.optJSONArray("publisher")?.optString(0) ?: "unknown")
                        )
                    )

                    val archiveMetadata = ExtractedMetadata(
                        title = itemTitle,
                        author = itemAuthor,
                        description = null,
                        publishDate = firstPublishYear,
                        genre = doc.optJSONArray("subject")?.optString(0),
                        language = doc.optJSONArray("language")?.optString(0),
                        isbn = itemIsbn,
                        publisher = doc.optJSONArray("publisher")?.optString(0),
                        pageCount = doc.optInt("number_of_pages_median", 0).let { if (it > 0) it else null },
                        extractionMethod = "openlibrary_search_api"
                    )

                    val similarity = calculateSimilarity(metadata, archiveMetadata)
                    if (similarity > 0.3f) {
                        val matchType = when {
                            similarity >= 0.9f -> ArchiveMatchType.EXACT_MATCH
                            similarity >= 0.7f -> ArchiveMatchType.FUZZY_MATCH
                            similarity >= 0.4f -> ArchiveMatchType.PARTIAL_MATCH
                            else -> ArchiveMatchType.NO_MATCH
                        }

                        val matchedFields = mutableListOf<String>()
                        if (metadata.title != null && itemTitle.isNotEmpty()) matchedFields.add("title")
                        if (metadata.author != null && itemAuthor != null) matchedFields.add("author")
                        if (metadata.isbn != null && itemIsbn != null && metadata.isbn == itemIsbn) matchedFields.add("isbn")

                        matches.add(
                            ArchiveMatch(
                                matchType = matchType,
                                confidence = similarity,
                                sourceArchive = "Open Library (WorldCat)",
                                matchedItem = archiveItem,
                                similarityScore = similarity,
                                matchedFields = matchedFields
                            )
                        )
                    }
                }

                matches
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    private suspend fun compareAgainstInternetArchive(metadata: ExtractedMetadata): List<ArchiveMatch> {
        return withContext(Dispatchers.IO) {
            try {
                val queryParts = mutableListOf<String>()
                metadata.title?.let { queryParts.add(it) }
                metadata.author?.let { queryParts.add(it) }
                if (queryParts.isEmpty()) return@withContext emptyList()

                val query = URLEncoder.encode(queryParts.joinToString(" "), "UTF-8")
                val url = URL(
                    "https://archive.org/advancedsearch.php?q=$query&output=json&rows=10&fl[]=identifier,title,creator,date,isbn"
                )
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "GET"
                connection.connectTimeout = 10_000
                connection.readTimeout = 10_000
                connection.setRequestProperty("Accept", "application/json")

                if (connection.responseCode != HttpURLConnection.HTTP_OK) {
                    return@withContext emptyList()
                }

                val responseBody = connection.inputStream.bufferedReader().use { it.readText() }
                val json = JSONObject(responseBody)
                val response = json.optJSONObject("response") ?: return@withContext emptyList()
                val docs = response.optJSONArray("docs") ?: return@withContext emptyList()

                val matches = mutableListOf<ArchiveMatch>()
                val limit = minOf(docs.length(), 10)

                for (i in 0 until limit) {
                    val doc = docs.getJSONObject(i)
                    val itemTitle = doc.optString("title", "").trim()
                    val itemAuthor = doc.optString("creator", "").trim().ifEmpty { null }
                    val itemDate = doc.optString("date", null)
                    val itemIsbn = doc.optString("isbn", null)
                    val identifier = doc.optString("identifier", "ia-${i}")

                    if (itemTitle.isEmpty()) continue

                    val archiveItem = ArchiveItem(
                        id = identifier,
                        title = itemTitle,
                        author = itemAuthor,
                        year = itemDate,
                        isbn = itemIsbn,
                        source = "Internet Archive",
                        metadata = mapOf(
                            "url" to "https://archive.org/details/$identifier"
                        )
                    )

                    val archiveMetadata = ExtractedMetadata(
                        title = itemTitle,
                        author = itemAuthor,
                        description = null,
                        publishDate = itemDate,
                        genre = null,
                        language = null,
                        isbn = itemIsbn,
                        publisher = null,
                        pageCount = null,
                        extractionMethod = "internet_archive_api"
                    )

                    val similarity = calculateSimilarity(metadata, archiveMetadata)
                    if (similarity > 0.3f) {
                        val matchType = when {
                            similarity >= 0.9f -> ArchiveMatchType.EXACT_MATCH
                            similarity >= 0.7f -> ArchiveMatchType.FUZZY_MATCH
                            similarity >= 0.4f -> ArchiveMatchType.PARTIAL_MATCH
                            else -> ArchiveMatchType.NO_MATCH
                        }

                        val matchedFields = mutableListOf<String>()
                        if (metadata.title != null && itemTitle.isNotEmpty()) matchedFields.add("title")
                        if (metadata.author != null && itemAuthor != null) matchedFields.add("author")
                        if (metadata.isbn != null && itemIsbn != null && metadata.isbn == itemIsbn) matchedFields.add("isbn")

                        matches.add(
                            ArchiveMatch(
                                matchType = matchType,
                                confidence = similarity,
                                sourceArchive = "Internet Archive",
                                matchedItem = archiveItem,
                                similarityScore = similarity,
                                matchedFields = matchedFields
                            )
                        )
                    }
                }

                matches
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    private suspend fun compareAgainstGoodreads(metadata: ExtractedMetadata): List<ArchiveMatch> {
        // Goodreads API is deprecated; using Open Library's title+author search instead
        return withContext(Dispatchers.IO) {
            try {
                val params = mutableListOf<String>()
                metadata.title?.let { params.add("title=${URLEncoder.encode(it, "UTF-8")}") }
                metadata.author?.let { params.add("author=${URLEncoder.encode(it, "UTF-8")}") }
                if (params.isEmpty()) return@withContext emptyList()

                val url = URL("https://openlibrary.org/search.json?${params.joinToString("&")}")
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "GET"
                connection.connectTimeout = 10_000
                connection.readTimeout = 10_000
                connection.setRequestProperty("Accept", "application/json")

                if (connection.responseCode != HttpURLConnection.HTTP_OK) {
                    return@withContext emptyList()
                }

                val responseBody = connection.inputStream.bufferedReader().use { it.readText() }
                val json = JSONObject(responseBody)
                val docs = json.optJSONArray("docs") ?: return@withContext emptyList()

                val matches = mutableListOf<ArchiveMatch>()
                val limit = minOf(docs.length(), 10)

                for (i in 0 until limit) {
                    val doc = docs.getJSONObject(i)
                    val itemTitle = doc.optString("title", "").trim()
                    val itemAuthor = doc.optJSONArray("author_name")?.let { authors ->
                        if (authors.length() > 0) authors.optString(0) else null
                    }?.trim()
                    val firstPublishYear = doc.optString("first_publish_year", null)
                    val itemIsbn = doc.optJSONArray("isbn")?.let { isbns ->
                        if (isbns.length() > 0) isbns.optString(0) else null
                    }
                    val olKey = doc.optString("key", "ol-goodreads-${i}")
                    val coverEditionKey = doc.optString("cover_edition_key", null)

                    if (itemTitle.isEmpty()) continue

                    val archiveItem = ArchiveItem(
                        id = olKey,
                        title = itemTitle,
                        author = itemAuthor,
                        year = firstPublishYear,
                        isbn = itemIsbn,
                        source = "Open Library (Goodreads alternative)",
                        metadata = buildMap {
                            put("url", "https://openlibrary.org$olKey")
                            if (coverEditionKey != null) {
                                put("cover_url", "https://covers.openlibrary.org/b/olid/$coverEditionKey-M.jpg")
                            }
                            put("edition_count", doc.optInt("edition_count", 0))
                        }
                    )

                    val archiveMetadata = ExtractedMetadata(
                        title = itemTitle,
                        author = itemAuthor,
                        description = null,
                        publishDate = firstPublishYear,
                        genre = doc.optJSONArray("subject")?.optString(0),
                        language = doc.optJSONArray("language")?.optString(0),
                        isbn = itemIsbn,
                        publisher = doc.optJSONArray("publisher")?.optString(0),
                        pageCount = doc.optInt("number_of_pages_median", 0).let { if (it > 0) it else null },
                        extractionMethod = "openlibrary_title_author_api"
                    )

                    val similarity = calculateSimilarity(metadata, archiveMetadata)
                    if (similarity > 0.3f) {
                        val matchType = when {
                            similarity >= 0.9f -> ArchiveMatchType.EXACT_MATCH
                            similarity >= 0.7f -> ArchiveMatchType.FUZZY_MATCH
                            similarity >= 0.4f -> ArchiveMatchType.PARTIAL_MATCH
                            else -> ArchiveMatchType.NO_MATCH
                        }

                        val matchedFields = mutableListOf<String>()
                        if (metadata.title != null && itemTitle.isNotEmpty()) matchedFields.add("title")
                        if (metadata.author != null && itemAuthor != null) matchedFields.add("author")
                        if (metadata.isbn != null && itemIsbn != null && metadata.isbn == itemIsbn) matchedFields.add("isbn")

                        matches.add(
                            ArchiveMatch(
                                matchType = matchType,
                                confidence = similarity,
                                sourceArchive = "Open Library (Goodreads alternative)",
                                matchedItem = archiveItem,
                                similarityScore = similarity,
                                matchedFields = matchedFields
                            )
                        )
                    }
                }

                matches
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    /**
     * Calculate similarity score between two metadata objects
     */
    private fun calculateSimilarity(metadata1: ExtractedMetadata, metadata2: ExtractedMetadata): Float {
        var score = 0f
        var factors = 0

        // Title similarity
        if (metadata1.title != null && metadata2.title != null) {
            score += calculateStringSimilarity(metadata1.title!!, metadata2.title!!)
            factors++
        }

        // Author similarity
        if (metadata1.author != null && metadata2.author != null) {
            score += calculateStringSimilarity(metadata1.author!!, metadata2.author!!)
            factors++
        }

        // ISBN exact match
        if (metadata1.isbn != null && metadata2.isbn != null) {
            score += if (metadata1.isbn == metadata2.isbn) 1.0f else 0.0f
            factors++
        }

        return if (factors > 0) score / factors else 0f
    }

    private fun calculateStringSimilarity(str1: String, str2: String): Float {
        // Simple Levenshtein distance-based similarity
        val maxLength = maxOf(str1.length, str2.length)
        if (maxLength == 0) return 1.0f

        val distance = levenshteinDistance(str1.lowercase(), str2.lowercase())
        return 1.0f - (distance.toFloat() / maxLength)
    }

    private fun levenshteinDistance(str1: String, str2: String): Int {
        val dp = Array(str1.length + 1) { IntArray(str2.length + 1) }

        for (i in 0..str1.length) dp[i][0] = i
        for (j in 0..str2.length) dp[0][j] = j

        for (i in 1..str1.length) {
            for (j in 1..str2.length) {
                dp[i][j] = if (str1[i - 1] == str2[j - 1]) {
                    dp[i - 1][j - 1]
                } else {
                    1 + minOf(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1])
                }
            }
        }

        return dp[str1.length][str2.length]
    }
}
