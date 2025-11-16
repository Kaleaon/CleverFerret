package com.universalmedialibrary.services.music.hivefy

import android.util.Log
import com.universalmedialibrary.data.music.hivefy.SaavnAlbum
import com.universalmedialibrary.data.music.hivefy.SaavnPlaylist
import com.universalmedialibrary.data.music.hivefy.SaavnSong
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.withContext
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.booleanOrNull
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.HttpUrl
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Minimal Saavn API client that mirrors the endpoints Hivefy relies on. Instead of binding to
 * Flutter/Dart models we decode the JSON manually so that the same payloads flow nicely into
 * Kotlin data classes and Compose UI.
 */
@Singleton
class SaavnApiService @Inject constructor(
    private val okHttpClient: OkHttpClient,
    private val json: Json,
    private val ioDispatcher: CoroutineDispatcher
) {

    suspend fun fetchPlaylistByLink(
        link: String,
        limit: Int = DEFAULT_ENTITY_LIMIT
    ): SaavnPlaylist? {
        val data = executeRequest(
            pathSegments = listOf("api", "playlists"),
            queryParams = mapOf(
                "link" to link,
                "limit" to limit.toString()
            )
        ) ?: return null

        return data["data"]?.jsonObject?.let { SaavnJsonMapper.playlistFromJson(it) }
    }

    suspend fun fetchAlbumByLink(
        link: String,
        limit: Int = DEFAULT_ENTITY_LIMIT
    ): SaavnAlbum? {
        val data = executeRequest(
            pathSegments = listOf("api", "albums"),
            queryParams = mapOf(
                "link" to link,
                "limit" to limit.toString()
            )
        ) ?: return null

        return data["data"]?.jsonObject?.let { SaavnJsonMapper.albumFromJson(it) }
    }

    suspend fun fetchSongsByIds(ids: List<String>): List<SaavnSong> {
        if (ids.isEmpty()) return emptyList()

        val data = executeRequest(
            pathSegments = listOf("api", "songs"),
            queryParams = mapOf("ids" to ids.joinToString(","))
        ) ?: return emptyList()

        val songsArray = data["data"]?.jsonArrayOrNull()
        return songsArray?.mapNotNull { element ->
            element.jsonObjectOrNull()?.let { SaavnJsonMapper.songFromJson(it) }
        } ?: emptyList()
    }

    private suspend fun executeRequest(
        pathSegments: List<String>,
        queryParams: Map<String, String?> = emptyMap()
    ): JsonObject? = withContext(ioDispatcher) {
        val urlBuilder = HttpUrl.Builder()
            .scheme("https")
            .host(SAAVN_MIRROR_HOST)

        pathSegments.forEach { segment ->
            urlBuilder.addPathSegment(segment)
        }

        queryParams.forEach { (key, value) ->
            if (!value.isNullOrBlank()) {
                urlBuilder.addQueryParameter(key, value)
            }
        }

        val request = Request.Builder()
            .url(urlBuilder.build())
            .get()
            .header("Accept", "application/json")
            .header("User-Agent", USER_AGENT)
            .build()

        try {
            okHttpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    Log.w(TAG, "Saavn API request failed: ${response.code} ${response.message}")
                    return@withContext null
                }
                val body = response.body?.string().orEmpty()
                if (body.isBlank()) return@withContext null

                val root = json.parseToJsonElement(body).jsonObject
                val success = root["success"]?.jsonPrimitive?.booleanOrNull ?: false
                if (!success) {
                    Log.w(TAG, "Saavn API responded with success=false")
                    return@withContext null
                }
                root
            }
        } catch (ioe: IOException) {
            Log.e(TAG, "Saavn API network failure", ioe)
            null
        } catch (t: Throwable) {
            Log.e(TAG, "Saavn API parsing failure", t)
            null
        }
    }

    private fun JsonElement.jsonObjectOrNull(): JsonObject? =
        runCatching { jsonObject }.getOrNull()

    private fun JsonElement.jsonArrayOrNull(): JsonArray? =
        runCatching { jsonArray }.getOrNull()

    private companion object {
        private const val SAAVN_MIRROR_HOST =
            "jiosaavn-c451wwyru-sumit-kolhes-projects-94a4846a.vercel.app"
        private const val USER_AGENT =
            "Mozilla/5.0 (Android CleverFerret Hivefy Integration)"
        private const val DEFAULT_ENTITY_LIMIT = 50
        private const val TAG = "SaavnApiService"
    }
}
