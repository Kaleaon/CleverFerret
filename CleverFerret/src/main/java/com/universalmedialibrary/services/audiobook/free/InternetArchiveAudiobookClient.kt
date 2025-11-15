package com.universalmedialibrary.services.audiobook.free

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonPrimitive
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Client for the Internet Archive audio books collections.
 *
 * We use the advanced search API to pull metadata and then query the metadata
 * endpoint for each identifier to discover the actual downloadable files.
 */
@Singleton
class InternetArchiveAudiobookClient @Inject constructor(
    private val okHttpClient: OkHttpClient
) {

    private val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
        coerceInputValues = true
    }

    suspend fun search(query: String?, limit: Int): List<FreeAudiobook> = withContext(Dispatchers.IO) {
        val normalizedQuery = query?.takeIf { it.isNotBlank() }
        val searchQuery = buildString {
            append("collection:(librivoxaudio OR audio_book_collection)")
            if (normalizedQuery != null) {
                append(" AND (title:(")
                append(normalizedQuery)
                append(") OR creator:(")
                append(normalizedQuery)
                append("))")
            }
        }

        val url = "$BASE_URL/advancedsearch.php?q=${encode(searchQuery)}&" +
            "fl[]=identifier&fl[]=title&fl[]=creator&fl[]=description&" +
            "sort[]=downloads+desc&rows=${limit.coerceIn(1, 100)}&output=json"

        val request = Request.Builder()
            .url(url)
            .header("User-Agent", USER_AGENT)
            .build()

        okHttpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw IOException("Internet Archive search failed: HTTP ${response.code}")
            }

            val body = response.body?.string() ?: ""
            if (body.isBlank()) return@withContext emptyList()

            val root = json.parseToJsonElement(body)
            val responseObject = (root as? JsonObject)?.get("response") as? JsonObject ?: return@withContext emptyList()
            val docs = responseObject["docs"]?.jsonArray ?: return@withContext emptyList()

            docs.mapNotNull { doc ->
                val identifier = doc.jsonObjectString("identifier") ?: return@mapNotNull null
                val title = doc.jsonObjectString("title") ?: identifier

                val author = doc.jsonObjectString("creator")
                val description = doc.jsonObjectString("description")
                val metadata = runCatching { fetchMetadata(identifier) }.getOrElse { null }
                val files = metadata?.files ?: emptyList()
                val coverUrl = metadata?.files?.firstOrNull { it.name?.endsWith(".jpg", true) == true }?.let {
                    buildDownloadUrl(identifier, it.name ?: return@let null)
                }

                val mp3Options = files
                    .filter { file ->
                        val format = file.format.orEmpty().lowercase()
                        format.contains("mp3") && !format.contains("zip")
                    }
                    .sortedByDescending { it.bitrateValue ?: 0 }
                    .take(3)
                    .mapNotNull { file ->
                        val name = file.name ?: return@mapNotNull null
                        AudiobookDownloadOption(
                            url = buildDownloadUrl(identifier, name),
                            label = "${file.format ?: "MP3"}",
                            format = file.format ?: "MP3",
                            estimatedSizeBytes = file.sizeLong
                        )
                    }

                val zippedOptions = if (mp3Options.isEmpty()) {
                    files.filter { file ->
                        val format = file.format.orEmpty().lowercase()
                        format.contains("zip") || (file.name?.endsWith(".zip", true) == true)
                    }.mapNotNull { file ->
                        val name = file.name ?: return@mapNotNull null
                        AudiobookDownloadOption(
                            url = buildDownloadUrl(identifier, name),
                            label = file.format ?: "ZIP Archive",
                            format = file.format ?: "zip",
                            estimatedSizeBytes = file.sizeLong
                        )
                    }
                } else {
                    emptyList()
                }

                val downloadOptions = if (mp3Options.isNotEmpty()) mp3Options else zippedOptions

                // Fallback stream URL uses HTTPS direct file
                val streamUrl = downloadOptions.firstOrNull()?.url

                FreeAudiobook(
                    id = "ia_$identifier",
                    source = FreeAudiobookSource.INTERNET_ARCHIVE,
                    title = title,
                    author = author,
                    description = description,
                    coverUrl = coverUrl,
                    language = metadata?.metadata?.language,
                    durationSeconds = metadata?.metadata?.runtimeSeconds,
                    tags = metadata?.metadata?.subject?.split(';', ',')?.map { it.trim() }?.filter { it.isNotEmpty() }
                        ?: emptyList(),
                    downloadOptions = downloadOptions,
                    streamUrl = streamUrl,
                    detailUrl = "https://archive.org/details/$identifier"
                )
            }.filter { it.downloadOptions.isNotEmpty() }
        }
    }

    private fun buildDownloadUrl(identifier: String, fileName: String): String {
        return "https://archive.org/download/$identifier/$fileName"
    }

    private suspend fun fetchMetadata(identifier: String): MetadataResponse? = withContext(Dispatchers.IO) {
        val request = Request.Builder()
            .url("$BASE_URL/metadata/$identifier")
            .header("User-Agent", USER_AGENT)
            .build()

        okHttpClient.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                return@withContext null
            }
            val body = response.body?.string() ?: return@withContext null
            return@withContext runCatching {
                json.decodeFromString(MetadataResponse.serializer(), body)
            }.getOrNull()
        }
    }

    private fun JsonElement.jsonObjectString(key: String): String? {
        return (this as? JsonObject)?.get(key)?.jsonPrimitive?.content?.takeIf { it.isNotBlank() }
    }

    private fun encode(value: String): String {
        return java.net.URLEncoder.encode(value, Charsets.UTF_8.name())
    }

    @Serializable
    private data class MetadataResponse(
        val files: List<MetadataFile> = emptyList(),
        val metadata: MetadataDetails? = null
    )

    @Serializable
    private data class MetadataFile(
        val name: String? = null,
        val format: String? = null,
        val size: String? = null,
        val bitrate: String? = null
    ) {
        val bitrateValue: Int?
            get() = bitrate?.toIntOrNull()

        val sizeLong: Long?
            get() = size?.toLongOrNull()
    }

    @Serializable
    private data class MetadataDetails(
        val language: String? = null,
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

    companion object {
        private const val BASE_URL = "https://archive.org"
        private const val USER_AGENT = "CleverFerret/1.0 (InternetArchiveClient)"
    }
}
