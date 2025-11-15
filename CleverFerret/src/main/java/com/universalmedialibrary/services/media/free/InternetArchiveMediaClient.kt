package com.universalmedialibrary.services.media.free

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class InternetArchiveMediaClient @Inject constructor(
    private val okHttpClient: OkHttpClient
) {

    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
        coerceInputValues = true
    }

    suspend fun fetchMedia(
        collections: List<String>,
        query: String?,
        preferredFormats: Set<String>,
        fallbackFormats: Set<String>,
        type: FreeMediaType,
        limit: Int
    ): List<FreeMediaItem> = withContext(Dispatchers.IO) {
        if (collections.isEmpty()) return@withContext emptyList()

        val searchQuery = buildString {
            append("collection:(")
            append(collections.joinToString(" OR "))
            append(")")
            if (!query.isNullOrBlank()) {
                append(" AND (title:(")
                append(query)
                append(") OR creator:(")
                append(query)
                append("))")
            }
        }

        val url = "$BASE_URL/advancedsearch.php?q=${encode(searchQuery)}&" +
            "fl[]=identifier&fl[]=title&fl[]=description&fl[]=creator&fl[]=year&fl[]=mediatype&" +
            "sort[]=downloads+desc&rows=${limit.coerceIn(1, 200)}&output=json"

        val request = Request.Builder()
            .url(url)
            .header("User-Agent", USER_AGENT)
            .build()

        okHttpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw IOException("Internet Archive request failed: HTTP ${response.code}")
            }

            val body = response.body?.string() ?: ""
            if (body.isBlank()) return@withContext emptyList()

            val root = json.parseToJsonElement(body)
            val docs = (root as? JsonObject)
                ?.get("response") as? JsonObject
                ?: return@withContext emptyList()

            val results = docs["docs"]?.jsonArray ?: JsonArray(emptyList())

            results.mapNotNull { doc ->
                parseMediaDocument(
                    doc,
                    preferredFormats,
                    fallbackFormats,
                    type
                )
            }
        }
    }

    private suspend fun parseMediaDocument(
        element: JsonElement,
        preferredFormats: Set<String>,
        fallbackFormats: Set<String>,
        type: FreeMediaType
    ): FreeMediaItem? = withContext(Dispatchers.IO) {
        val doc = element as? JsonObject ?: return@withContext null
        val identifier = doc["identifier"]?.jsonPrimitive?.contentOrNull ?: return@withContext null
        val title = doc["title"]?.jsonPrimitive?.contentOrNull ?: identifier
        val description = doc["description"]?.jsonPrimitive?.contentOrNull
        val creator = doc["creator"]?.jsonPrimitive?.contentOrNull
        val year = doc["year"]?.jsonPrimitive?.contentOrNull
        val mediatype = doc["mediatype"]?.jsonPrimitive?.contentOrNull

        // Filter to expected media types
        when (type) {
            FreeMediaType.COMIC -> if (mediatype != null && mediatype !in COMIC_MEDIA_TYPES) return@withContext null
            FreeMediaType.FEATURE_FILM -> if (mediatype != null && mediatype !in MOVIE_MEDIA_TYPES) return@withContext null
            FreeMediaType.NATIONAL_SCREENING_ROOM -> Unit // handled via collection selection
        }

        val metadata = fetchMetadata(identifier) ?: return@withContext null

        val files = metadata.files
        if (files.isEmpty()) return@withContext null

        val preferred = files.filterByFormats(preferredFormats)
        val downloads = if (preferred.isNotEmpty()) preferred else files.filterByFormats(fallbackFormats)
        if (downloads.isEmpty()) return@withContext null

        val downloadOptions = downloads.mapNotNull { file ->
            val name = file.name ?: return@mapNotNull null
            FreeMediaDownloadOption(
                url = buildDownloadUrl(identifier, name),
                label = file.format ?: name.substringAfterLast('/', name),
                format = file.format ?: "",
                sizeBytes = file.size?.toLongOrNull()
            )
        }

        if (downloadOptions.isEmpty()) return@withContext null

        val thumbnail = metadata.files.firstOrNull { it.name?.endsWith(".jpg", true) == true || it.name?.endsWith(".png", true) == true }
            ?.name
            ?.let { buildDownloadUrl(identifier, it) }

        val streamUrl = downloadOptions.firstOrNull()?.url

        FreeMediaItem(
            id = "iamedia_$identifier",
            type = type,
            source = FreeMediaSource.INTERNET_ARCHIVE,
            title = title,
            creator = creator,
            description = description,
            thumbnailUrl = thumbnail,
            streamingUrl = streamUrl,
            detailUrl = "https://archive.org/details/$identifier",
            downloadOptions = downloadOptions,
            tags = metadata.metadata.subject?.split(';', ',')?.map { it.trim() }?.filter { it.isNotEmpty() } ?: emptyList(),
            runtimeSeconds = metadata.metadata.runtimeSeconds,
            year = year
        )
    }

    private fun List<MetadataFile>.filterByFormats(formats: Set<String>): List<MetadataFile> {
        if (formats.isEmpty()) return emptyList()
        return filter { file ->
            val format = file.format?.lowercase() ?: ""
            val name = file.name?.lowercase() ?: ""
            formats.any { token ->
                format.contains(token) || name.endsWith(".$token")
            }
        }
    }

    private suspend fun fetchMetadata(identifier: String): MetadataResponse? = withContext(Dispatchers.IO) {
        val request = Request.Builder()
            .url("$BASE_URL/metadata/$identifier")
            .header("User-Agent", USER_AGENT)
            .build()

        okHttpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) return@withContext null
            val body = response.body?.string() ?: return@withContext null
            return@withContext runCatching {
                json.decodeFromString(MetadataResponse.serializer(), body)
            }.getOrNull()
        }
    }

    private fun encode(value: String): String = java.net.URLEncoder.encode(value, Charsets.UTF_8.name())

    private fun buildDownloadUrl(identifier: String, fileName: String): String =
        "https://archive.org/download/$identifier/$fileName"

    companion object {
        private const val BASE_URL = "https://archive.org"
        private const val USER_AGENT = "CleverFerret/1.0 (InternetArchiveMediaClient)"

        private val COMIC_MEDIA_TYPES = setOf("texts", "image")
        private val MOVIE_MEDIA_TYPES = setOf("movies")
    }
}

@Serializable
private data class MetadataResponse(
    val files: List<MetadataFile> = emptyList(),
    val metadata: MetadataDetails = MetadataDetails()
)

@Serializable
private data class MetadataFile(
    val name: String? = null,
    val format: String? = null,
    val size: String? = null
)

@Serializable
private data class MetadataDetails(
    val subject: String? = null,
    val runtime: String? = null
) {
    val runtimeSeconds: Long?
        get() = runtime?.split(':')?.mapNotNull { it.toLongOrNull() }?.let { parts ->
            when (parts.size) {
                3 -> (parts[0] * 3600) + (parts[1] * 60) + parts[2]
                2 -> (parts[0] * 60) + parts[1]
                1 -> parts[0]
                else -> null
            }
        }
}
