package com.universalmedialibrary.services.radio

import com.universalmedialibrary.data.local.entity.RadioStation
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.builtins.ListSerializer
import kotlinx.serialization.json.Json
import okhttp3.HttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Lightweight client for the community-maintained Radio Browser directory.
 *
 * Fetches popular stations and supports keyword searches so CleverFerret
 * can seed a rich internet radio catalog without hardcoding streams.
 */
@Singleton
class RadioBrowserService @Inject constructor(
    private val okHttpClient: OkHttpClient
) {

    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
        coerceInputValues = true
    }

    private val baseUrls = listOf(
        "https://de1.api.radio-browser.info",
        "https://nl1.api.radio-browser.info",
        "https://fr1.api.radio-browser.info",
        "https://us1.api.radio-browser.info",
        "https://api.radio-browser.info"
    )

    suspend fun fetchTopStations(
        limit: Int = 50,
        hideBroken: Boolean = true
    ): List<RadioStation> = withContext(Dispatchers.IO) {
        val queryParams = mapOf(
            "limit" to limit.toString(),
            "hidebroken" to if (hideBroken) "true" else "false"
        )

        fetchStations(
            path = "json/stations/topclick/${limit.coerceIn(1, 500)}",
            fallbackPath = "json/stations",
            fallbackQuery = queryParams
        )
    }

    suspend fun searchStations(
        query: String,
        limit: Int = 50,
        countryCode: String? = null,
        tag: String? = null
    ): List<RadioStation> = withContext(Dispatchers.IO) {
        val params = mutableMapOf(
            "name" to query,
            "limit" to limit.toString(),
            "hidebroken" to "true"
        )
        countryCode?.takeIf { it.isNotBlank() }?.let { params["countrycode"] = it }
        tag?.takeIf { it.isNotBlank() }?.let { params["tag"] = it }

        fetchStations(
            path = "json/stations/search",
            fallbackPath = "json/stations/search",
            fallbackQuery = params
        )
    }

    private suspend fun fetchStations(
        path: String,
        fallbackPath: String,
        fallbackQuery: Map<String, String?> = emptyMap()
    ): List<RadioStation> {
        val stations = mutableListOf<RadioStation>()
        var lastError: Exception? = null

        for (base in baseUrls) {
            val url = buildUrl(base, path, emptyMap()) ?: continue
            try {
                val responseBody = execute(url)
                val parsed = json.decodeFromString(
                    ListSerializer(RadioBrowserStationDto.serializer()),
                    responseBody
                )
                stations += parsed.mapNotNull(::dtoToStation)
                if (stations.isNotEmpty()) {
                    return stations.distinctBy { it.streamUrl }
                }
            } catch (e: Exception) {
                lastError = e
            }
        }

        // Fallback to generic list endpoint if topclick path is unavailable on server
        val fallbackStations = runCatching {
            val fallbackUrl = baseUrls
                .firstNotNullOfOrNull { base -> buildUrl(base, fallbackPath, fallbackQuery) }
                ?: return@runCatching emptyList()

            val responseBody = execute(fallbackUrl)
            json.decodeFromString(
                ListSerializer(RadioBrowserStationDto.serializer()),
                responseBody
            ).mapNotNull(::dtoToStation)
        }.getOrElse {
            lastError = it
            emptyList()
        }

        if (fallbackStations.isNotEmpty()) {
            return fallbackStations.distinctBy { it.streamUrl }
        }

        if (stations.isEmpty() && fallbackStations.isEmpty()) {
            throw lastError ?: IOException("Unable to load stations from Radio Browser")
        }

        return stations.distinctBy { it.streamUrl }
    }

    private fun buildUrl(
        base: String,
        path: String,
        query: Map<String, String?>
    ): HttpUrl? {
        val builder = base.toHttpUrlOrNull()?.newBuilder() ?: return null
        builder.addPathSegments(path.trimStart('/'))
        query.forEach { (key, value) ->
            value?.let { builder.addQueryParameter(key, it) }
        }
        return builder.build()
    }

    private fun execute(url: HttpUrl): String {
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", USER_AGENT)
            .header("Accept", "application/json")
            .build()

        okHttpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw IOException("HTTP ${response.code} ${response.message}")
            }
            return response.body?.string() ?: throw IOException("Empty response body")
        }
    }

    private fun dtoToStation(dto: RadioBrowserStationDto): RadioStation? {
        val streamUrl = dto.urlResolved?.takeIf { it.isNotBlank() }
            ?: dto.url?.takeIf { it.isNotBlank() }
            ?: return null

        val name = dto.name?.takeIf { it.isNotBlank() } ?: dto.stationUuid ?: return null
        val tagsString = dto.tags?.takeIf { it.isNotBlank() }
        val primaryGenre = tagsString
            ?.split(',')
            ?.map { it.trim() }
            ?.firstOrNull { it.length in 3..48 }

        val description = buildString {
            dto.state?.takeIf { it.isNotBlank() }?.let {
                append(it)
                append(" • ")
            }
            dto.country?.takeIf { it.isNotBlank() }?.let {
                append(it)
            }
            if (isNotEmpty() && tagsString != null) {
                append(" • ")
            }
            tagsString?.let {
                append(it.split(',').take(3).joinToString(", ") { tag -> tag.trim() })
            }
        }.ifBlank { null }

        return RadioStation(
            name = name,
            description = description,
            streamUrl = streamUrl,
            websiteUrl = dto.homepage?.takeIf { it.startsWith("http") },
            logoUrl = dto.favicon?.takeIf { it.startsWith("http") },
            genre = primaryGenre,
            country = dto.country,
            language = dto.language,
            bitrate = dto.bitrate?.takeIf { it > 0 },
            codec = dto.codec,
            tags = tagsString
        )
    }

    companion object {
        private const val USER_AGENT = "CleverFerret/1.0 (RadioBrowserService)"
    }
}

@Serializable
private data class RadioBrowserStationDto(
    @SerialName("stationuuid")
    val stationUuid: String? = null,
    val name: String? = null,
    val url: String? = null,
    @SerialName("url_resolved")
    val urlResolved: String? = null,
    val homepage: String? = null,
    val favicon: String? = null,
    val tags: String? = null,
    val country: String? = null,
    @SerialName("countrycode")
    val countryCode: String? = null,
    val state: String? = null,
    val language: String? = null,
    val codec: String? = null,
    val bitrate: Int? = null
)
