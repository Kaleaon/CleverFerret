package com.universalmedialibrary.services.audiobook.free

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Minimal client for the Lit2Go catalog.
 *
 * Lit2Go exposes a JSON API documented at https://etc.usf.edu/lit2go/api/.
 * The responses are fairly small (a couple hundred items) so we currently
 * fetch a single page and filter client-side.
 */
@Singleton
class Lit2GoClient @Inject constructor(
    private val okHttpClient: OkHttpClient
) {

    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
        coerceInputValues = true
    }

    suspend fun fetchBooks(query: String?, limit: Int): List<FreeAudiobook> = withContext(Dispatchers.IO) {
        val request = Request.Builder()
            .url("$BASE_URL/books/")
            .header("User-Agent", USER_AGENT)
            .build()

        okHttpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw IOException("Lit2Go request failed with HTTP ${response.code}")
            }

            val body = response.body?.string() ?: ""
            if (body.isBlank()) {
                return@withContext emptyList()
            }

            val root = json.parseToJsonElement(body)
            val booksArray = when (root) {
                is JsonArray -> root
                is JsonObject -> root["books"] as? JsonArray ?: JsonArray(emptyList())
                else -> JsonArray(emptyList())
            }

            val normalizedQuery = query?.trim()?.lowercase()

            booksArray
                .mapNotNull { element -> parseBook(element) }
                .filter { book ->
                    if (normalizedQuery.isNullOrBlank()) {
                        true
                    } else {
                        val haystack = listOfNotNull(book.title, book.author, book.description)
                            .joinToString(" ")
                            .lowercase()
                        haystack.contains(normalizedQuery)
                    }
                }
                .take(limit)
        }
    }

    private fun parseBook(element: JsonElement): FreeAudiobook? {
        val obj = element as? JsonObject ?: return null
        val id = obj.string("id")
            ?: obj.string("book_id")
            ?: obj.string("permalink")
            ?: obj.string("slug")
            ?: return null

        val title = obj.string("title") ?: obj.string("name") ?: return null
        val author = obj.string("author") ?: obj.string("author_name")
        val description = obj.string("description") ?: obj.string("summary")
        val coverUrl = obj.string("image_url") ?: obj.string("cover") ?: obj.string("thumbnail_url")

        val downloadUrl = obj.string("download_url")
            ?: obj.string("zip_url")
            ?: obj.string("mp3_zip")
            ?: obj.string("audio_url")
        val streamUrl = obj.string("stream_url") ?: obj.string("audio_url")

        val downloadOptions = if (downloadUrl != null) {
            val format = inferFormat(downloadUrl)
            val label = when (format.lowercase()) {
                "zip" -> "Download ZIP"
                "m4b" -> "Download M4B"
                else -> "Download MP3"
            }
            listOf(
                AudiobookDownloadOption(
                    url = downloadUrl,
                    label = label,
                    format = format
                )
            )
        } else {
            emptyList()
        }

        return FreeAudiobook(
            id = "lit2go_$id",
            source = FreeAudiobookSource.LIT2GO,
            title = title,
            author = author,
            description = description,
            coverUrl = coverUrl,
            language = obj.string("language") ?: "en",
            durationSeconds = obj.string("runtime")?.toLongOrNull(),
            tags = obj.string("keywords")?.split(',')?.map { it.trim() }?.filter { it.isNotEmpty() } ?: emptyList(),
            downloadOptions = downloadOptions,
            streamUrl = streamUrl ?: downloadUrl,
            detailUrl = obj.string("permalink") ?: obj.string("url")
        )
    }

    private fun JsonObject.string(key: String): String? {
        return this[key]?.jsonPrimitive?.contentOrNull?.takeIf { it.isNotBlank() }
    }

    private fun inferFormat(url: String): String {
        return when {
            url.endsWith(".zip", ignoreCase = true) -> "zip"
            url.endsWith(".mp3", ignoreCase = true) -> "mp3"
            url.endsWith(".m4b", ignoreCase = true) -> "m4b"
            else -> "audio"
        }
    }

    companion object {
        private const val BASE_URL = "https://etc.usf.edu/lit2go/api"
        private const val USER_AGENT = "CleverFerret/1.0 (Lit2GoClient)"
    }
}
