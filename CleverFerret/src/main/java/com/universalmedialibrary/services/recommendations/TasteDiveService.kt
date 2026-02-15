package com.universalmedialibrary.services.recommendations

import android.util.Log
import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import okhttp3.OkHttpClient
import okhttp3.Request
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.core.logging.AppLogger

@Singleton
class TasteDiveService @Inject constructor(
    private val okHttpClient: OkHttpClient,
    private val json: Json,
    private val apiKeyRepository: APIKeyRepository
) {
    private val baseUrl = "https://tastedive.com/api/similar"

    suspend fun getSimilarItems(
        query: String,
        type: String? = null, // music, movies, shows, podcasts, books, authors, games
        limit: Int = 10
    ): List<TasteDiveItem> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("tastedive")?.trim().orEmpty()
            if (apiKey.isBlank()) {
                Log.w(TAG, "TasteDive key missing. Configure runtime API key provisioning before calling recommendations.")
                return@withContext emptyList()
            }

            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            var url = "$baseUrl?q=$encodedQuery&k=$apiKey&limit=$limit&info=1"
            
            if (type != null) {
                url += "&type=$type"
            }

            val request = Request.Builder().url(url).build()
            val response = okHttpClient.newCall(request).execute()

            if (!response.isSuccessful) return@withContext emptyList()

            val responseBody = response.body?.string() ?: return@withContext emptyList()
            val result = json.decodeFromString<TasteDiveResponse>(responseBody)
            
            result.similar.results
        } catch (e: Exception) {
            AppLogger.error("TasteDiveService", "Unhandled exception", e)
            emptyList()
        }
    }

    private companion object {
        const val TAG = "TasteDiveService"
    }
}

@Serializable
data class TasteDiveResponse(
    @SerialName("Similar") val similar: SimilarResults
)

@Serializable
data class SimilarResults(
    @SerialName("Info") val info: List<TasteDiveInfo>,
    @SerialName("Results") val results: List<TasteDiveItem>
)

@Serializable
data class TasteDiveInfo(
    @SerialName("Name") val name: String,
    @SerialName("Type") val type: String
)

@Serializable
data class TasteDiveItem(
    @SerialName("Name") val name: String,
    @SerialName("Type") val type: String,
    @SerialName("wTeaser") val teaser: String? = null,
    @SerialName("wUrl") val wikiUrl: String? = null,
    @SerialName("yUrl") val youtubeUrl: String? = null,
    @SerialName("yID") val youtubeId: String? = null
)
