package com.universalmedialibrary.services.metadata

import android.content.Context
import android.net.Uri
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Metadata fetching service inspired by Calibre's metadata sources.
 * Uses multiple sources: Open Library, Google Books API for comprehensive metadata.
 * 
 * Based on Calibre's metadata plugin architecture:
 * - https://github.com/kovidgoyal/calibre/blob/master/src/calibre/ebooks/metadata/sources/google.py
 * - Open Library API: https://openlibrary.org/dev/docs/api/books
 */
@Singleton
class BookMetadataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val json = Json { 
        ignoreUnknownKeys = true 
        isLenient = true
    }
    
    companion object {
        private const val TAG = "BookMetadataService"
        
        // Open Library endpoints
        private const val OPEN_LIBRARY_ISBN_API = "https://openlibrary.org/api/books"
        private const val OPEN_LIBRARY_SEARCH_API = "https://openlibrary.org/search.json"
        private const val OPEN_LIBRARY_COVERS = "https://covers.openlibrary.org/b"
        
        // Google Books endpoints (like Calibre's google.py)
        private const val GOOGLE_BOOKS_API = "https://www.googleapis.com/books/v1/volumes"
        
        // Timeout in milliseconds
        private const val TIMEOUT = 15000
    }
    
    /**
     * Fetch metadata from multiple sources, prioritizing ISBN lookup.
     * Follows Calibre's strategy: ISBN first, then title/author fallback.
     */
    suspend fun fetchMetadata(
        isbn: String? = null,
        title: String? = null,
        authors: List<String>? = null,
        filename: String? = null
    ): BookMetadata? = withContext(Dispatchers.IO) {
        Log.d(TAG, "Fetching metadata - ISBN: $isbn, Title: $title, Authors: $authors")
        
        // Extract info from filename if no other data
        val extractedInfo = if (isbn == null && title == null && filename != null) {
            extractInfoFromFilename(filename)
        } else null
        
        val searchIsbn = isbn ?: extractedInfo?.isbn
        val searchTitle = title ?: extractedInfo?.title
        val searchAuthors = authors ?: extractedInfo?.authors
        
        // Try ISBN lookup first (most reliable)
        if (!searchIsbn.isNullOrBlank()) {
            val normalizedIsbn = normalizeIsbn(searchIsbn)
            if (normalizedIsbn != null) {
                // Query both sources in parallel
                val results = listOf(
                    async { fetchFromOpenLibraryByIsbn(normalizedIsbn) },
                    async { fetchFromGoogleBooksByIsbn(normalizedIsbn) }
                ).awaitAll()
                
                // Merge results, preferring Open Library for non-commercial data
                val merged = mergeMetadata(results.filterNotNull())
                if (merged != null) {
                    return@withContext merged.copy(isbn = normalizedIsbn)
                }
            }
        }
        
        // Fallback to title/author search
        if (!searchTitle.isNullOrBlank()) {
            val results = listOf(
                async { searchOpenLibrary(searchTitle, searchAuthors?.firstOrNull()) },
                async { searchGoogleBooks(searchTitle, searchAuthors?.firstOrNull()) }
            ).awaitAll()
            
            val merged = mergeMetadata(results.filterNotNull())
            if (merged != null) {
                return@withContext merged
            }
        }
        
        null
    }
    
    /**
     * Fetch metadata from Open Library by ISBN.
     * Endpoint: https://openlibrary.org/api/books?bibkeys=ISBN:{isbn}&format=json&jscmd=data
     */
    private suspend fun fetchFromOpenLibraryByIsbn(isbn: String): BookMetadata? = withContext(Dispatchers.IO) {
        try {
            val url = "$OPEN_LIBRARY_ISBN_API?bibkeys=ISBN:$isbn&format=json&jscmd=data"
            val response = makeHttpRequest(url)
            
            if (response != null) {
                val jsonObject = org.json.JSONObject(response)
                val bookKey = "ISBN:$isbn"
                
                if (jsonObject.has(bookKey)) {
                    val bookData = jsonObject.getJSONObject(bookKey)
                    return@withContext parseOpenLibraryData(bookData, isbn)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching from Open Library by ISBN", e)
        }
        null
    }
    
    /**
     * Search Open Library by title and author.
     * Endpoint: https://openlibrary.org/search.json?title={title}&author={author}
     */
    private suspend fun searchOpenLibrary(title: String, author: String?): BookMetadata? = withContext(Dispatchers.IO) {
        try {
            val encodedTitle = URLEncoder.encode(title, "UTF-8")
            var url = "$OPEN_LIBRARY_SEARCH_API?title=$encodedTitle&limit=5"
            
            if (!author.isNullOrBlank()) {
                val encodedAuthor = URLEncoder.encode(author, "UTF-8")
                url += "&author=$encodedAuthor"
            }
            
            val response = makeHttpRequest(url)
            
            if (response != null) {
                val jsonObject = org.json.JSONObject(response)
                val docs = jsonObject.optJSONArray("docs")
                
                if (docs != null && docs.length() > 0) {
                    val firstResult = docs.getJSONObject(0)
                    return@withContext parseOpenLibrarySearchResult(firstResult)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching Open Library", e)
        }
        null
    }
    
    /**
     * Fetch metadata from Google Books API by ISBN.
     * Similar to Calibre's google.py implementation.
     */
    private suspend fun fetchFromGoogleBooksByIsbn(isbn: String): BookMetadata? = withContext(Dispatchers.IO) {
        try {
            val url = "$GOOGLE_BOOKS_API?q=isbn:$isbn&maxResults=1"
            val response = makeHttpRequest(url)
            
            if (response != null) {
                val jsonObject = org.json.JSONObject(response)
                val items = jsonObject.optJSONArray("items")
                
                if (items != null && items.length() > 0) {
                    val volumeInfo = items.getJSONObject(0).getJSONObject("volumeInfo")
                    return@withContext parseGoogleBooksData(volumeInfo, isbn)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching from Google Books by ISBN", e)
        }
        null
    }
    
    /**
     * Search Google Books by title and author.
     */
    private suspend fun searchGoogleBooks(title: String, author: String?): BookMetadata? = withContext(Dispatchers.IO) {
        try {
            val query = buildString {
                append("intitle:")
                append(URLEncoder.encode(title, "UTF-8"))
                if (!author.isNullOrBlank()) {
                    append("+inauthor:")
                    append(URLEncoder.encode(author, "UTF-8"))
                }
            }
            
            val url = "$GOOGLE_BOOKS_API?q=$query&maxResults=5"
            val response = makeHttpRequest(url)
            
            if (response != null) {
                val jsonObject = org.json.JSONObject(response)
                val items = jsonObject.optJSONArray("items")
                
                if (items != null && items.length() > 0) {
                    val volumeInfo = items.getJSONObject(0).getJSONObject("volumeInfo")
                    return@withContext parseGoogleBooksData(volumeInfo, null)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching Google Books", e)
        }
        null
    }
    
    private fun parseOpenLibraryData(data: org.json.JSONObject, isbn: String): BookMetadata {
        val title = data.optString("title", "")
        
        val authors = mutableListOf<String>()
        data.optJSONArray("authors")?.let { authorsArray ->
            for (i in 0 until authorsArray.length()) {
                authorsArray.optJSONObject(i)?.optString("name")?.let { authors.add(it) }
            }
        }
        
        val publishers = mutableListOf<String>()
        data.optJSONArray("publishers")?.let { pubArray ->
            for (i in 0 until pubArray.length()) {
                pubArray.optJSONObject(i)?.optString("name")?.let { publishers.add(it) }
            }
        }
        
        val subjects = mutableListOf<String>()
        data.optJSONArray("subjects")?.let { subArray ->
            for (i in 0 until subArray.length()) {
                subArray.optJSONObject(i)?.optString("name")?.let { subjects.add(it) }
            }
        }
        
        // Cover URL from Open Library
        val coverId = data.optJSONObject("cover")?.optString("medium")
            ?: "$OPEN_LIBRARY_COVERS/isbn/$isbn-M.jpg"
        
        return BookMetadata(
            title = title,
            authors = authors,
            isbn = isbn,
            publisher = publishers.firstOrNull(),
            publishDate = data.optString("publish_date", null),
            description = null, // Open Library doesn't include description in this endpoint
            coverUrl = coverId,
            subjects = subjects,
            language = null,
            pageCount = data.optInt("number_of_pages", 0).takeIf { it > 0 },
            source = MetadataSource.OPEN_LIBRARY
        )
    }
    
    private fun parseOpenLibrarySearchResult(data: org.json.JSONObject): BookMetadata {
        val title = data.optString("title", "")
        
        val authors = mutableListOf<String>()
        data.optJSONArray("author_name")?.let { authorsArray ->
            for (i in 0 until authorsArray.length()) {
                authors.add(authorsArray.getString(i))
            }
        }
        
        val subjects = mutableListOf<String>()
        data.optJSONArray("subject")?.let { subArray ->
            for (i in 0 until minOf(subArray.length(), 10)) {
                subjects.add(subArray.getString(i))
            }
        }
        
        // Get ISBN if available
        val isbns = mutableListOf<String>()
        data.optJSONArray("isbn")?.let { isbnArray ->
            for (i in 0 until isbnArray.length()) {
                isbns.add(isbnArray.getString(i))
            }
        }
        val isbn = isbns.firstOrNull { it.length == 13 } ?: isbns.firstOrNull()
        
        // Cover from cover_i field
        val coverId = data.optInt("cover_i", -1)
        val coverUrl = if (coverId > 0) "$OPEN_LIBRARY_COVERS/id/$coverId-M.jpg" else null
        
        return BookMetadata(
            title = title,
            authors = authors,
            isbn = isbn,
            publisher = data.optJSONArray("publisher")?.optString(0),
            publishDate = data.optString("first_publish_year", null),
            description = null,
            coverUrl = coverUrl,
            subjects = subjects,
            language = data.optJSONArray("language")?.optString(0),
            pageCount = null,
            source = MetadataSource.OPEN_LIBRARY
        )
    }
    
    private fun parseGoogleBooksData(volumeInfo: org.json.JSONObject, isbn: String?): BookMetadata {
        val title = volumeInfo.optString("title", "")
        
        val authors = mutableListOf<String>()
        volumeInfo.optJSONArray("authors")?.let { authorsArray ->
            for (i in 0 until authorsArray.length()) {
                authors.add(authorsArray.getString(i))
            }
        }
        
        val categories = mutableListOf<String>()
        volumeInfo.optJSONArray("categories")?.let { catArray ->
            for (i in 0 until catArray.length()) {
                categories.add(catArray.getString(i))
            }
        }
        
        // Get ISBN from industryIdentifiers if not provided
        var resolvedIsbn = isbn
        if (resolvedIsbn == null) {
            volumeInfo.optJSONArray("industryIdentifiers")?.let { identifiers ->
                for (i in 0 until identifiers.length()) {
                    val identifier = identifiers.getJSONObject(i)
                    val type = identifier.optString("type")
                    if (type == "ISBN_13" || type == "ISBN_10") {
                        resolvedIsbn = identifier.optString("identifier")
                        if (type == "ISBN_13") break // Prefer ISBN-13
                    }
                }
            }
        }
        
        // Cover URL - prefer larger thumbnail
        val imageLinks = volumeInfo.optJSONObject("imageLinks")
        val coverUrl = imageLinks?.optString("thumbnail")
            ?: imageLinks?.optString("smallThumbnail")
        
        return BookMetadata(
            title = title,
            authors = authors,
            isbn = resolvedIsbn,
            publisher = volumeInfo.optString("publisher", null),
            publishDate = volumeInfo.optString("publishedDate", null),
            description = volumeInfo.optString("description", null),
            coverUrl = coverUrl?.replace("http://", "https://"),
            subjects = categories,
            language = volumeInfo.optString("language", null),
            pageCount = volumeInfo.optInt("pageCount", 0).takeIf { it > 0 },
            source = MetadataSource.GOOGLE_BOOKS
        )
    }
    
    /**
     * Merge metadata from multiple sources.
     * Prioritizes non-null values and prefers certain sources for specific fields.
     */
    private fun mergeMetadata(results: List<BookMetadata>): BookMetadata? {
        if (results.isEmpty()) return null
        if (results.size == 1) return results.first()
        
        val primary = results.first()
        val secondary = results.getOrNull(1)
        
        return BookMetadata(
            title = primary.title.ifBlank { secondary?.title ?: "" },
            authors = primary.authors.ifEmpty { secondary?.authors ?: emptyList() },
            isbn = primary.isbn ?: secondary?.isbn,
            publisher = primary.publisher ?: secondary?.publisher,
            publishDate = primary.publishDate ?: secondary?.publishDate,
            description = primary.description ?: secondary?.description, // Google often has better descriptions
            coverUrl = primary.coverUrl ?: secondary?.coverUrl,
            subjects = (primary.subjects + (secondary?.subjects ?: emptyList())).distinct().take(15),
            language = primary.language ?: secondary?.language,
            pageCount = primary.pageCount ?: secondary?.pageCount,
            source = primary.source
        )
    }
    
    /**
     * Extract potential metadata from filename.
     * Handles common patterns like "Author - Title.epub", "Title (Year).pdf", etc.
     */
    private fun extractInfoFromFilename(filename: String): ExtractedFileInfo {
        val nameWithoutExt = filename.substringBeforeLast(".")
        
        // Try to extract ISBN from filename (common in downloaded ebooks)
        val isbnPattern = Regex("""(?:ISBN[:\s-]*)?(\d{10}|\d{13}|\d{3}[-\s]?\d[-\s]?\d{5}[-\s]?\d{3}[-\s]?\d)""", RegexOption.IGNORE_CASE)
        val isbnMatch = isbnPattern.find(nameWithoutExt)
        val isbn = isbnMatch?.groupValues?.get(1)?.replace(Regex("[-\\s]"), "")
        
        // Common patterns
        val patterns = listOf(
            // "Author - Title" or "Author – Title"
            Regex("""^(.+?)\s*[-–—]\s*(.+)$"""),
            // "Title by Author"
            Regex("""^(.+?)\s+by\s+(.+)$""", RegexOption.IGNORE_CASE),
            // "Title (Author)"
            Regex("""^(.+?)\s*\(([^)]+)\)$""")
        )
        
        for (pattern in patterns) {
            val match = pattern.find(nameWithoutExt)
            if (match != null) {
                val (part1, part2) = match.destructured
                // Determine which is title and which is author
                return if (pattern.pattern.contains("by")) {
                    ExtractedFileInfo(title = part1.trim(), authors = listOf(part2.trim()), isbn = isbn)
                } else {
                    // First part is usually author in "Author - Title" format
                    ExtractedFileInfo(title = part2.trim(), authors = listOf(part1.trim()), isbn = isbn)
                }
            }
        }
        
        // Fallback: use whole name as title
        return ExtractedFileInfo(
            title = nameWithoutExt.replace(Regex("""[\[\]_]"""), " ").trim(),
            authors = null,
            isbn = isbn
        )
    }
    
    /**
     * Normalize ISBN to ISBN-13 format.
     */
    private fun normalizeIsbn(isbn: String): String? {
        val cleaned = isbn.replace(Regex("[^0-9Xx]"), "")
        
        return when (cleaned.length) {
            10 -> convertIsbn10ToIsbn13(cleaned)
            13 -> if (cleaned.startsWith("978") || cleaned.startsWith("979")) cleaned else null
            else -> null
        }
    }
    
    private fun convertIsbn10ToIsbn13(isbn10: String): String {
        val isbn13Base = "978" + isbn10.substring(0, 9)
        var sum = 0
        for (i in isbn13Base.indices) {
            val digit = isbn13Base[i].digitToInt()
            sum += if (i % 2 == 0) digit else digit * 3
        }
        val checkDigit = (10 - (sum % 10)) % 10
        return isbn13Base + checkDigit
    }
    
    private fun makeHttpRequest(urlString: String): String? {
        var connection: HttpURLConnection? = null
        try {
            val url = URL(urlString)
            connection = url.openConnection() as HttpURLConnection
            connection.requestMethod = "GET"
            connection.connectTimeout = TIMEOUT
            connection.readTimeout = TIMEOUT
            connection.setRequestProperty("User-Agent", "CleverFerret/1.0 (Android; Ebook Manager)")
            
            if (connection.responseCode == HttpURLConnection.HTTP_OK) {
                val reader = BufferedReader(InputStreamReader(connection.inputStream))
                val response = reader.readText()
                reader.close()
                return response
            }
        } catch (e: Exception) {
            Log.e(TAG, "HTTP request failed: $urlString", e)
        } finally {
            connection?.disconnect()
        }
        return null
    }
}

/**
 * Book metadata data class
 */
data class BookMetadata(
    val title: String,
    val authors: List<String>,
    val isbn: String?,
    val publisher: String?,
    val publishDate: String?,
    val description: String?,
    val coverUrl: String?,
    val subjects: List<String>,
    val language: String?,
    val pageCount: Int?,
    val source: MetadataSource
)

enum class MetadataSource {
    OPEN_LIBRARY,
    GOOGLE_BOOKS,
    LOCAL,
    MERGED
}

private data class ExtractedFileInfo(
    val title: String?,
    val authors: List<String>?,
    val isbn: String?
)
