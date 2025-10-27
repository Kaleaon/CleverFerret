package com.universalmedialibrary.services.metadata.covers

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.jsoup.Jsoup
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Amazon cover source - supports multiple countries
 */
@Singleton
class AmazonCoverSource @Inject constructor(
    private val httpClient: OkHttpClient
) : CoverSource {
    
    override val sourceName = "Amazon"
    override val priority = 9
    
    private val domains = listOf(
        "amazon.com",
        "amazon.co.uk",
        "amazon.de",
        "amazon.fr",
        "amazon.co.jp"
    )
    
    override suspend fun searchCover(
        isbn: String?,
        title: String?,
        author: String?
    ): Result<CoverResult?> = withContext(Dispatchers.IO) {
        try {
            // Try each domain until we find a result
            for (domain in domains) {
                val result = searchOnDomain(domain, isbn, title, author)
                if (result != null) {
                    return@withContext Result.success(result)
                }
            }
            Result.success(null)
        } catch (e: Exception) {
            Result.success(null)
        }
    }
    
    private suspend fun searchOnDomain(
        domain: String,
        isbn: String?,
        title: String?,
        author: String?
    ): CoverResult? {
        try {
            val searchQuery = buildSearchQuery(isbn, title, author)
            val searchUrl = "https://$domain/s?k=${searchQuery}&i=digital-text"
            
            val request = Request.Builder()
                .url(searchUrl)
                .header("User-Agent", "Mozilla/5.0 (Android)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                return null
            }
            
            val doc = Jsoup.parse(response.body?.string() ?: return null)
            
            // Find first product image
            val imageElement = doc.select("img.s-image").firstOrNull() ?: return null
            val imageUrl = imageElement.attr("src")
            
            if (imageUrl.isBlank()) {
                return null
            }
            
            // Amazon image URL manipulation for HD
            // Change resolution in the URL
            val hdUrl = imageUrl
                .replace(Regex("\\._AC_[A-Z0-9]+_"), "._AC_SX2000_")
                .replace(Regex("\\._SX\\d+_"), "._SX2000_")
                .replace(Regex("\\._SY\\d+_"), "._SY2000_")
            
            return CoverResult(
                url = hdUrl,
                width = 1600,
                height = 2400,
                quality = CoverQuality.ULTRA_HD,
                source = "$sourceName ($domain)"
            )
        } catch (e: Exception) {
            return null
        }
    }
    
    override suspend fun getCoverUrl(sourceId: String): Result<String?> {
        return Result.success(null)
    }
    
    override suspend fun downloadCover(url: String): Result<ByteArray> = 
        withContext(Dispatchers.IO) {
            try {
                val request = Request.Builder()
                    .url(url)
                    .header("User-Agent", "Mozilla/5.0 (Android)")
                    .build()
                
                val response = httpClient.newCall(request).execute()
                
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("HTTP error: ${response.code}")
                    )
                }
                
                Result.success(response.body?.bytes() ?: ByteArray(0))
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
