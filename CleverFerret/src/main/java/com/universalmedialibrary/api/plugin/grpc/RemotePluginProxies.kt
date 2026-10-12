package com.universalmedialibrary.api.plugin.grpc

import android.util.Log
import com.universalmedialibrary.api.plugin.ConfigurationOption
import com.universalmedialibrary.api.plugin.ContentBrowseResult
import com.universalmedialibrary.api.plugin.ContentItem
import com.universalmedialibrary.api.plugin.ContentSourcePlugin
import com.universalmedialibrary.api.plugin.CoverSize
import com.universalmedialibrary.api.plugin.DownloadProgress
import com.universalmedialibrary.api.plugin.DownloadStatus
import com.universalmedialibrary.api.plugin.HealthStatus
import com.universalmedialibrary.api.plugin.MediaMetadata
import com.universalmedialibrary.api.plugin.MediaType
import com.universalmedialibrary.api.plugin.MetadataProviderPlugin
import com.universalmedialibrary.api.plugin.MetadataQuery
import com.universalmedialibrary.api.plugin.MetadataSearchResult
import com.universalmedialibrary.api.plugin.Plugin
import com.universalmedialibrary.api.plugin.PluginCapability
import com.universalmedialibrary.api.plugin.PluginCategory
import com.universalmedialibrary.api.plugin.PluginHealth
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeout
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive

/**
 * Base proxy for remote out-of-process gRPC / IPC plugins.
 * Enforces call timeouts (default 5s) and catches all remote process exceptions
 * to ensure external process crashes do not crash the primary application.
 */
@Suppress("LongParameterList")
abstract class RemotePluginProxy(
    override val id: String,
    override val name: String,
    override val version: String,
    override val description: String,
    override val author: String,
    override val category: PluginCategory,
    override var isEnabled: Boolean = true,
    override val capabilities: Set<PluginCapability> = emptySet(),
    override val configurationOptions: List<ConfigurationOption> = emptyList(),
    private val ipcBridge: IPluginIPCBridge,
    private val processMonitor: PluginProcessMonitor? = null,
    val callTimeoutMs: Long = DEFAULT_CALL_TIMEOUT_MS
) : Plugin {

    companion object {
        const val TAG = "RemotePluginProxy"
        const val DEFAULT_CALL_TIMEOUT_MS = 5000L
    }

    protected suspend fun executeRemoteCall(
        methodName: String,
        payloadJson: String = "{}"
    ): Result<String> = withContext(Dispatchers.IO) {
        runCatching {
            withTimeout(callTimeoutMs) {
                val request = PluginIpcRequest(
                    serviceName = id,
                    methodName = methodName,
                    payloadJson = payloadJson,
                    timeoutMs = callTimeoutMs
                )
                val requestJson = GrpcProtoMappers.jsonFormatter.encodeToString(request)
                val responseJson = ipcBridge.executeRequest(requestJson)
                val response = GrpcProtoMappers.jsonFormatter.decodeFromString<PluginIpcResponse>(responseJson)

                if (response.success) {
                    response.payloadJson ?: ""
                } else {
                    val error = response.errorMessage ?: "Remote IPC call failed"
                    Log.w(TAG, "Remote execution failed for $id.$methodName: $error")
                    throw RemotePluginException("Remote call error on plugin $id: $error")
                }
            }
        }.onFailure { e ->
            Log.e(TAG, "Exception during remote call to plugin $id method $methodName", e)
            processMonitor?.onProcessDied(id)
        }
    }

    override suspend fun initialize(): Result<Unit> {
        return executeRemoteCall("initialize").map { }
    }

    override suspend fun shutdown() {
        executeRemoteCall("shutdown")
    }

    override suspend fun healthCheck(): PluginHealth {
        val monitorHealth = processMonitor?.getHealthStatus(id)
        if (monitorHealth != null && monitorHealth.status == HealthStatus.UNHEALTHY) {
            return monitorHealth
        }

        return executeRemoteCall("healthCheck").mapCatching { json ->
            GrpcProtoMappers.deserializePluginHealth(json)
        }.getOrElse { e ->
            PluginHealth(
                status = HealthStatus.UNHEALTHY,
                message = "Remote plugin healthCheck failed: ${e.message}"
            )
        }
    }
}

/**
 * Proxy implementation for remote metadata provider plugins.
 */
@Suppress("LongParameterList")
class RemoteMetadataProviderProxy(
    id: String,
    name: String,
    version: String,
    description: String,
    author: String,
    category: PluginCategory = PluginCategory.METADATA_PROVIDER,
    isEnabled: Boolean = true,
    capabilities: Set<PluginCapability> = emptySet(),
    configurationOptions: List<ConfigurationOption> = emptyList(),
    override val supportedMediaTypes: Set<MediaType>,
    ipcBridge: IPluginIPCBridge,
    processMonitor: PluginProcessMonitor? = null,
    callTimeoutMs: Long = DEFAULT_CALL_TIMEOUT_MS
) : RemotePluginProxy(
    id, name, version, description, author, category, isEnabled,
    capabilities, configurationOptions, ipcBridge, processMonitor, callTimeoutMs
), MetadataProviderPlugin {

    override suspend fun search(query: MetadataQuery): Result<List<MetadataSearchResult>> {
        val payload = GrpcProtoMappers.serializeMetadataQuery(query)
        return executeRemoteCall("search", payload).mapCatching { json ->
            GrpcProtoMappers.deserializeSearchResults(json)
        }
    }

    override suspend fun fetchDetails(id: String, mediaType: MediaType): Result<MediaMetadata> {
        val payload = Json.encodeToString(FetchDetailsPayload(id, mediaType))
        return executeRemoteCall("fetchDetails", payload).mapCatching { json ->
            GrpcProtoMappers.deserializeMediaMetadata(json)
        }
    }

    override suspend fun fetchCoverArt(id: String, size: CoverSize): Result<String> {
        val payload = Json.encodeToString(FetchCoverArtPayload(id, size))
        return executeRemoteCall("fetchCoverArt", payload).mapCatching { json ->
            val obj = Json.parseToJsonElement(json).jsonObject
            obj["coverUrl"]?.jsonPrimitive?.content ?: ""
        }
    }

    override suspend fun fetchRecommendations(id: String, limit: Int): Result<List<MetadataSearchResult>> {
        val payload = Json.encodeToString(FetchRecsPayload(id, limit))
        return executeRemoteCall("fetchRecommendations", payload).mapCatching { json ->
            GrpcProtoMappers.deserializeSearchResults(json)
        }
    }
}

/**
 * Proxy implementation for remote content source plugins.
 */
@Suppress("LongParameterList")
class RemoteContentSourceProxy(
    id: String,
    name: String,
    version: String,
    description: String,
    author: String,
    category: PluginCategory = PluginCategory.CONTENT_SOURCE,
    isEnabled: Boolean = true,
    capabilities: Set<PluginCapability> = emptySet(),
    configurationOptions: List<ConfigurationOption> = emptyList(),
    override val supportedMediaTypes: Set<MediaType>,
    override val supportedFormats: Set<String>,
    ipcBridge: IPluginIPCBridge,
    processMonitor: PluginProcessMonitor? = null,
    callTimeoutMs: Long = DEFAULT_CALL_TIMEOUT_MS
) : RemotePluginProxy(
    id, name, version, description, author, category, isEnabled,
    capabilities, configurationOptions, ipcBridge, processMonitor, callTimeoutMs
), ContentSourcePlugin {

    override suspend fun browse(
        category: String?,
        page: Int,
        pageSize: Int
    ): Result<ContentBrowseResult> {
        val payload = Json.encodeToString(BrowsePayload(category, page, pageSize))
        return executeRemoteCall("browse", payload).mapCatching { json ->
            GrpcProtoMappers.deserializeContentBrowseResult(json)
        }
    }

    override suspend fun search(query: String, mediaType: MediaType?): Result<List<ContentItem>> {
        val metadataQuery = MetadataQuery(title = query, mediaType = mediaType)
        val payload = GrpcProtoMappers.serializeMetadataQuery(metadataQuery)
        return executeRemoteCall("search", payload).mapCatching { json ->
            GrpcProtoMappers.deserializeContentItems(json)
        }
    }

    override suspend fun getDetails(id: String): Result<ContentItem> {
        return executeRemoteCall("getContentDetails", id).mapCatching { json ->
            GrpcProtoMappers.deserializeContentItem(json)
        }
    }

    override suspend fun download(id: String, format: String?): Flow<DownloadProgress> = flow {
        emit(
            DownloadProgress(
                id = id,
                status = DownloadStatus.DOWNLOADING,
                progress = 0.1f,
                bytesDownloaded = 100,
                totalBytes = 1000
            )
        )
        val result = executeRemoteCall("getStreamUrl", id)
        if (result.isSuccess) {
            emit(
                DownloadProgress(
                    id = id,
                    status = DownloadStatus.COMPLETED,
                    progress = 1.0f,
                    bytesDownloaded = 1000,
                    totalBytes = 1000
                )
            )
        } else {
            emit(
                DownloadProgress(
                    id = id,
                    status = DownloadStatus.FAILED,
                    error = result.exceptionOrNull()?.message ?: "Remote download failed"
                )
            )
        }
    }.flowOn(Dispatchers.IO)

    override suspend fun getStreamUrl(id: String): Result<String> {
        return executeRemoteCall("getStreamUrl", id).mapCatching { json ->
            val obj = Json.parseToJsonElement(json).jsonObject
            obj["streamUrl"]?.jsonPrimitive?.content ?: ""
        }
    }
}

class RemotePluginException(message: String) : Exception(message)
