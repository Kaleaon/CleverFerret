package com.universalmedialibrary.api.plugin.grpc

import com.universalmedialibrary.api.plugin.ContentBrowseResult
import com.universalmedialibrary.api.plugin.ContentCategory
import com.universalmedialibrary.api.plugin.ContentFormat
import com.universalmedialibrary.api.plugin.ContentItem
import com.universalmedialibrary.api.plugin.CoverSize
import com.universalmedialibrary.api.plugin.DownloadProgress
import com.universalmedialibrary.api.plugin.DownloadStatus
import com.universalmedialibrary.api.plugin.HealthStatus
import com.universalmedialibrary.api.plugin.MediaMetadata
import com.universalmedialibrary.api.plugin.MediaType
import com.universalmedialibrary.api.plugin.MetadataQuery
import com.universalmedialibrary.api.plugin.MetadataSearchResult
import com.universalmedialibrary.api.plugin.PersonInfo
import com.universalmedialibrary.api.plugin.PluginCapability
import com.universalmedialibrary.api.plugin.PluginCategory
import com.universalmedialibrary.api.plugin.PluginHealth
import com.universalmedialibrary.api.plugin.RatingInfo
import com.universalmedialibrary.api.plugin.SeriesInfo
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

/**
 * Serialized IPC message representation for gRPC and Android Service IPC transport
 */
@Serializable
data class PluginIpcRequest(
    val serviceName: String,
    val methodName: String,
    val payloadJson: String,
    val timeoutMs: Long = 5000L
)

@Serializable
data class PluginIpcResponse(
    val success: Boolean,
    val payloadJson: String? = null,
    val errorMessage: String? = null,
    val errorCode: Int = 0
)

/**
 * Bidirectional mappers for Plugin System domain models and IPC transport payloads.
 */
object GrpcProtoMappers {
    val jsonFormatter = Json {
        ignoreUnknownKeys = true
        encodeDefaults = true
    }

    // =========================================================================
    // ENUM MAPPINGS
    // =========================================================================

    fun mapMediaTypeToString(mediaType: MediaType): String = mediaType.name
    fun mapStringToMediaType(name: String): MediaType {
        return try {
            MediaType.valueOf(name)
        } catch (_: Exception) {
            MediaType.BOOK
        }
    }

    fun mapCoverSizeToString(coverSize: CoverSize): String = coverSize.name
    fun mapStringToCoverSize(name: String): CoverSize {
        return try {
            CoverSize.valueOf(name)
        } catch (_: Exception) {
            CoverSize.LARGE
        }
    }

    fun mapHealthStatusToString(status: HealthStatus): String = status.name
    fun mapStringToHealthStatus(name: String): HealthStatus {
        return try {
            HealthStatus.valueOf(name)
        } catch (_: Exception) {
            HealthStatus.UNKNOWN
        }
    }

    fun mapDownloadStatusToString(status: DownloadStatus): String = status.name
    fun mapStringToDownloadStatus(name: String): DownloadStatus {
        return try {
            DownloadStatus.valueOf(name)
        } catch (_: Exception) {
            DownloadStatus.PENDING
        }
    }

    // =========================================================================
    // DOMAIN MODEL SERIALIZATION FOR IPC
    // =========================================================================

    fun serializeMetadataQuery(query: MetadataQuery): String = jsonFormatter.encodeToString(query)
    fun deserializeMetadataQuery(json: String): MetadataQuery = jsonFormatter.decodeFromString(json)

    fun serializeSearchResults(results: List<MetadataSearchResult>): String = jsonFormatter.encodeToString(results)
    fun deserializeSearchResults(json: String): List<MetadataSearchResult> = jsonFormatter.decodeFromString(json)

    fun serializeMediaMetadata(metadata: MediaMetadata): String = jsonFormatter.encodeToString(metadata)
    fun deserializeMediaMetadata(json: String): MediaMetadata = jsonFormatter.decodeFromString(json)

    fun serializeContentBrowseResult(result: ContentBrowseResult): String = jsonFormatter.encodeToString(result)
    fun deserializeContentBrowseResult(json: String): ContentBrowseResult = jsonFormatter.decodeFromString(json)

    fun serializeContentItems(items: List<ContentItem>): String = jsonFormatter.encodeToString(items)
    fun deserializeContentItems(json: String): List<ContentItem> = jsonFormatter.decodeFromString(json)

    fun serializeContentItem(item: ContentItem): String = jsonFormatter.encodeToString(item)
    fun deserializeContentItem(json: String): ContentItem = jsonFormatter.decodeFromString(json)

    fun serializeDownloadProgress(progress: DownloadProgress): String = jsonFormatter.encodeToString(progress)
    fun deserializeDownloadProgress(json: String): DownloadProgress = jsonFormatter.decodeFromString(json)

    fun serializePluginHealth(health: PluginHealth): String = jsonFormatter.encodeToString(health)
    fun deserializePluginHealth(json: String): PluginHealth = jsonFormatter.decodeFromString(json)
}
