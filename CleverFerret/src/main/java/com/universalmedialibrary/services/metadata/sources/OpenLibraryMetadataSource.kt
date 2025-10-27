package com.universalmedialibrary.services.metadata.sources

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Open Library metadata source
 */
@Singleton
class OpenLibraryMetadataSource @Inject constructor(
    private val httpClient: OkHttpClient
) : MetadataSource {
    
    override val sourceName = "Open Library"
    override val priority = 7
    override val supportedTypes = listOf(MediaType.BOOK, MediaType.EBOOK)
    
    private val baseUrl = "https://openlibrary.org"
    
    override suspend fun search(
        query: String?,
        isbn: String?,
        title: String?,
        author: String?,
        maxResults: Int
    ): Result<List<MetadataSearchResult>> = withContext(Dispatchers.IO) {
        try {
            val searchUrl = when {
                !isbn.isNullOrBlank() -> "$baseUrl/isbn/$isbn.json"
                !query.isNullOrBlank() -> "$baseUrl/search.json?q=${URLEncoder.encode(query, "UTF-8")}&limit=$maxResults"
                !title.isNullOrBlank() && !author.isNullOrBlank() -> 
                    "$baseUrl/search.json?title=${URLEncoder.encode(title, "UTF-8")}&author=${URLEncoder.encode(author, "UTF-8")}&limit=$maxResults"
                !title.isNullOrBlank() -> "$baseUrl/search.json?title=${URLEncoder.encode(title, "UTF-8")}&limit=$maxResults"
                else -> return@withContext Result.failure(
                    Exception("No search criteria provided")
                )
            }
            
            val request = Request.Builder()
                .url(searchUrl)
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                return@withContext Result.failure(
                    Exception("HTTP error: ${response.code}")
                )
            }
            
            val json = JSONObject(response.body?.string() ?: "")
            
            // Handle ISBN direct lookup
            if (!isbn.isNullOrBlank()) {
                val result = parseSingleWork(json, isbn)
                return@withContext Result.success(listOfNotNull(result))
            }
            
            // Handle search results
            val docs = json.optJSONArray("docs") ?: return@withContext Result.success(emptyList())
            
            val results = (0 until minOf(docs.length(), maxResults)).mapNotNull { i ->
                val doc = docs.getJSONObject(i)
                parseSearchResult(doc)
            }
            
            Result.success(results)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    override suspend fun getDetails(sourceId: String): Result<EnhancedMetadata?> = 
        withContext(Dispatchers.IO) {
            try {
                val url = "$baseUrl/works/$sourceId.json"
                
                val request = Request.Builder()
                    .url(url)
                    .build()
                
                val response = httpClient.newCall(request).execute()
                
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("HTTP error: ${response.code}")
                    )
                }
                
                val json = JSONObject(response.body?.string() ?: "")
                val metadata = parseWorkDetails(json, sourceId)
                
                Result.success(metadata)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    private fun parseSearchResult(doc: JSONObject): MetadataSearchResult? {
        val key = doc.optString("key") ?: return null
        val title = doc.optString("title") ?: return null
        
        val authors = doc.optJSONArray("author_name")?.let { array ->
            (0 until array.length()).map { array.getString(it) }
        } ?: emptyList()
        
        val coverId = doc.optInt("cover_i", -1).takeIf { it != -1 }
        val coverUrl = coverId?.let { "https://covers.openlibrary.org/b/id/$it-L.jpg" }
        
        val isbn = doc.optJSONArray("isbn")?.optString(0)
        val publishDate = doc.optInt("first_publish_year", -1)
            .takeIf { it != -1 }?.toString()
        
        return MetadataSearchResult(
            sourceId = key.removePrefix("/works/"),
            title = title,
            authors = authors,
            description = null,
            coverUrl = coverUrl,
            isbn = isbn,
            publishDate = publishDate,
            source = sourceName
        )
    }
    
    private fun parseSingleWork(json: JSONObject, isbn: String): MetadataSearchResult? {
        val title = json.optString("title") ?: return null
        
        val authors = json.optJSONArray("authors")?.let { array ->
            (0 until array.length()).mapNotNull { i ->
                val authorKey = array.getJSONObject(i).optString("key")
                // Would need additional API call to get author name
                null
            }
        } ?: emptyList()
        
        val coverId = json.optJSONArray("covers")?.optInt(0)?.takeIf { it > 0 }
        val coverUrl = coverId?.let { "https://covers.openlibrary.org/b/id/$it-L.jpg" }
        
        val workKey = json.optJSONArray("works")
            ?.optJSONObject(0)
            ?.optString("key")
            ?.removePrefix("/works/")
        
        return MetadataSearchResult(
            sourceId = workKey ?: isbn,
            title = title,
            authors = authors,
            description = null,
            coverUrl = coverUrl,
            isbn = isbn,
            publishDate = json.optString("publish_date"),
            source = sourceName
        )
    }
    
    private suspend fun parseWorkDetails(json: JSONObject, sourceId: String): EnhancedMetadata {
        val title = json.getString("title")
        
        val description = json.optJSONObject("description")?.optString("value")
            ?: json.optString("description")
        
        val authors = json.optJSONArray("authors")?.let { array ->
            (0 until array.length()).mapNotNull { i ->
                val authorKey = array.getJSONObject(i)
                    .optJSONObject("author")
                    ?.optString("key")
                
                // Fetch author name
                authorKey?.let { fetchAuthorName(it) }
            }
        } ?: emptyList()
        
        val subjects = json.optJSONArray("subjects")?.let { array ->
            (0 until array.length()).map { array.getString(it) }
        } ?: emptyList()
        
        val coverId = json.optJSONArray("covers")?.optInt(0)?.takeIf { it > 0 }
        val coverUrl = coverId?.let { "https://covers.openlibrary.org/b/id/$it-L.jpg" }
        
        return EnhancedMetadata(
            title = title,
            authors = authors,
            description = description,
            categories = subjects,
            genres = subjects,
            sourceId = sourceId,
            source = sourceName,
            coverUrl = coverUrl
        )
    }
    
    private suspend fun fetchAuthorName(authorKey: String): String? {
        return try {
            val url = "$baseUrl$authorKey.json"
            
            val request = Request.Builder()
                .url(url)
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (response.isSuccessful) {
                val json = JSONObject(response.body?.string() ?: "")
                json.optString("name")
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
}
