package com.universalmedialibrary.services.metadata.covers

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.net.URLEncoder

/**
 * Base abstract class for cover image sources.
 * Provides shared cover downloading, query building, and default interface method implementations.
 */
abstract class BaseCoverSource(
    protected val httpClient: OkHttpClient
) : CoverSource {

    override suspend fun getCoverUrl(sourceId: String): Result<String?> {
        return Result.success(null)
    }

    @Suppress("TooGenericExceptionCaught")
    override suspend fun downloadCover(url: String): Result<ByteArray> =
        withContext(Dispatchers.IO) {
            try {
                val request = Request.Builder()
                    .url(url)
                    .header("User-Agent", "Mozilla/5.0 (Android)")
                    .build()

                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(
                            Exception("HTTP error: ${response.code}")
                        )
                    }

                    val bytes = response.body?.bytes()
                        ?: return@withContext Result.failure(IllegalStateException("Empty body"))
                    Result.success(bytes)
                }
            } catch (e: Exception) {
                Result.failure(e)
            }
        }

    protected open fun buildSearchQuery(isbn: String?, title: String?, author: String?): String {
        return when {
            !isbn.isNullOrBlank() -> URLEncoder.encode(isbn, "UTF-8")
            !title.isNullOrBlank() && !author.isNullOrBlank() ->
                URLEncoder.encode("$title $author", "UTF-8")
            !title.isNullOrBlank() -> URLEncoder.encode(title, "UTF-8")
            else -> ""
        }
    }
}
