package com.universalmedialibrary.services.metadata.covers

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Apple Books cover source - provides ultra-high quality covers
 */
@Singleton
class AppleBooksCoverSource @Inject constructor(
    private val httpClient: OkHttpClient
) : CoverSource {
    
    override val sourceName = "Apple Books"
    override val priority = 10 // Highest - best quality
    
    override suspend fun searchCover(
        isbn: String?,
        title: String?,
        author: String?
    ): Result<CoverResult?> = withContext(Dispatchers.IO) {
        try {
            val searchQuery = buildSearchQuery(isbn, title, author)
            val url = "https://itunes.apple.com/search?media=ebook&term=$searchQuery&limit=1"
            
            val request = Request.Builder()
                .url(url)
                .header("User-Agent", "CleverFerret/1.0")
                .build()
            
            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.success(null)
                }
                
                val json = JSONObject(response.body?.string() ?: return@withContext Result.success(null))
                val results = json.getJSONArray("results")
                
                if (results.length() == 0) {
                    return@withContext Result.success(null)
                }
                
                val book = results.getJSONObject(0)
                val artworkUrl = book.getString("artworkUrl100")
                
                // Apple Books trick: Change dimensions in URL for HD
                // Replace 100x100 with 2000x2000 for ultra-high quality
                val hdUrl = artworkUrl
                    .replace("100x100bb", "2000x2000bb")
                    .replace("100x100", "2000x2000")
                
                val coverResult = CoverResult(
                    url = hdUrl,
                    width = 2000,
                    height = 2000,
                    quality = CoverQuality.ULTRA_HD,
                    source = sourceName,
                    sourceId = book.optString("trackId")
                )
                
                Result.success(coverResult)
            }
        } catch (e: Exception) {
            Result.success(null) // Don't fail, just return null
        }
    }
    
    override suspend fun getCoverUrl(sourceId: String): Result<String?> {
        return Result.success(null) // Not implemented
    }
    
    override suspend fun downloadCover(url: String): Result<ByteArray> = 
        withContext(Dispatchers.IO) {
            try {
                val request = Request.Builder()
                    .url(url)
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(
                            Exception("HTTP error: ${response.code}")
                        )
                    }
                    
                    Result.success(response.body?.bytes() ?: ByteArray(0))
                }
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    private fun buildSearchQuery(isbn: String?, title: String?, author: String?): String {
        return when {
            !isbn.isNullOrBlank() -> URLEncoder.encode(isbn, "UTF-8")
            !title.isNullOrBlank() && !author.isNullOrBlank() -> 
                URLEncoder.encode("$title $author", "UTF-8")
            !title.isNullOrBlank() -> URLEncoder.encode(title, "UTF-8")
            else -> ""
        }
    }
}
