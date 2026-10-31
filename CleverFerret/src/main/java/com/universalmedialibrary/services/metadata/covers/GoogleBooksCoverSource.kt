package com.universalmedialibrary.services.metadata.covers

import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Google Books cover source
 */
@Singleton
class GoogleBooksCoverSource @Inject constructor(
    httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository
) : BaseCoverSource(httpClient) {
    
    override val sourceName = "Google Books"
    override val priority = 8
    
    override suspend fun searchCover(
        isbn: String?,
        title: String?,
        author: String?
    ): Result<CoverResult?> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("google_books")
            val searchQuery = buildSearchQuery(isbn, title, author)
            
            val url = buildString {
                append("https://www.googleapis.com/books/v1/volumes?q=")
                append(searchQuery)
                append("&maxResults=1")
                if (!apiKey.isNullOrBlank()) {
                    append("&key=$apiKey")
                }
            }
            
            val request = Request.Builder()
                .url(url)
                .build()
            
            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.success(null)
                }
                
                val bodyStr = response.body?.string() ?: return@withContext Result.success(null)
                val json = JSONObject(bodyStr)
                val items = json.optJSONArray("items")
            
                if (items == null || items.length() == 0) {
                    return@withContext Result.success(null)
                }
                
                val book = items.getJSONObject(0)
                val volumeInfo = book.getJSONObject("volumeInfo")
                val imageLinks = volumeInfo.optJSONObject("imageLinks")
                
                if (imageLinks == null) {
                    return@withContext Result.success(null)
                }
                
                // Try to get highest quality image available
                val imageUrl = imageLinks.optString("extraLarge")
                    .ifBlank { imageLinks.optString("large") }
                    .ifBlank { imageLinks.optString("medium") }
                    .ifBlank { imageLinks.optString("thumbnail") }
                
                if (imageUrl.isBlank()) {
                    return@withContext Result.success(null)
                }
                
                // Enhance URL for better quality by changing zoom parameter
                val hdUrl = imageUrl
                    .replace("&zoom=1", "&zoom=3")
                    .replace("http://", "https://")
                
                val coverResult = CoverResult(
                    url = hdUrl,
                    width = 1200,
                    height = 1800,
                    quality = CoverQuality.HIGH,
                    source = sourceName,
                    sourceId = book.getString("id")
                )
                
                Result.success(coverResult)
            }
        } catch (e: Exception) {
            // Log error but return null to allow trying other sources
            android.util.Log.w("GoogleBooksCoverSource", "Failed to search cover", e)
            Result.success(null)
        }
    }
    
    protected override fun buildSearchQuery(isbn: String?, title: String?, author: String?): String {
        return when {
            !isbn.isNullOrBlank() -> "isbn:${URLEncoder.encode(isbn, "UTF-8")}"
            !title.isNullOrBlank() && !author.isNullOrBlank() -> 
                "intitle:${URLEncoder.encode(title, "UTF-8")}+inauthor:${URLEncoder.encode(author, "UTF-8")}"
            !title.isNullOrBlank() -> "intitle:${URLEncoder.encode(title, "UTF-8")}"
            else -> ""
        }
    }
}
