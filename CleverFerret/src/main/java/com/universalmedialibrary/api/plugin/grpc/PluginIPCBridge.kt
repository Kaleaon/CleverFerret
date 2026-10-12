package com.universalmedialibrary.api.plugin.grpc

import android.os.Binder
import android.os.IBinder
import android.os.Parcel
import android.util.Log
import com.universalmedialibrary.api.plugin.Plugin
import kotlinx.coroutines.runBlocking
import java.util.concurrent.ConcurrentHashMap

/**
 * Interface for inter-process communication with remote plugin services.
 */
interface IPluginIPCBridge : IBinder {
    fun executeRequest(requestJson: String): String
    fun ping(): Boolean
}

/**
 * Binder implementation hosted by the isolated plugin process service.
 * Receives IPC requests from the main application process and delegates
 * execution to local plugin instances hosted in the remote process.
 */
class PluginIPCBridgeBinder(
    private val hostedPlugins: ConcurrentHashMap<String, Plugin> = ConcurrentHashMap()
) : Binder(), IPluginIPCBridge {

    companion object {
        private const val TAG = "PluginIPCBridgeBinder"
        const val TRANSACTION_EXECUTE_REQUEST = IBinder.FIRST_CALL_TRANSACTION + 1
        const val TRANSACTION_PING = IBinder.FIRST_CALL_TRANSACTION + 2
        const val INTERFACE_DESCRIPTOR = "com.universalmedialibrary.api.plugin.grpc.IPluginIPCBridge"
    }

    fun registerPlugin(plugin: Plugin) {
        hostedPlugins[plugin.id] = plugin
        Log.i(TAG, "Registered plugin ${plugin.id} in isolated process binder bridge")
    }

    fun unregisterPlugin(pluginId: String) {
        hostedPlugins.remove(pluginId)
        Log.i(TAG, "Unregistered plugin $pluginId from isolated process binder bridge")
    }

    override fun ping(): Boolean = true

    override fun executeRequest(requestJson: String): String {
        return try {
            val request = GrpcProtoMappers.jsonFormatter.decodeFromString<PluginIpcRequest>(requestJson)
            val plugin = hostedPlugins[request.serviceName]
                ?: return GrpcProtoMappers.jsonFormatter.encodeToString(
                    PluginIpcResponse(
                        success = false,
                        errorMessage = "Plugin service ${request.serviceName} not found in remote process",
                        errorCode = 404
                    )
                )

            val response = runBlocking {
                try {
                    val resultJson = executePluginMethod(plugin, request.methodName, request.payloadJson)
                    PluginIpcResponse(
                        success = true,
                        payloadJson = resultJson
                    )
                } catch (e: Exception) {
                    Log.e(TAG, "Error executing remote method ${request.methodName} on ${request.serviceName}", e)
                    PluginIpcResponse(
                        success = false,
                        errorMessage = e.message ?: "Unknown remote execution error",
                        errorCode = 500
                    )
                }
            }

            GrpcProtoMappers.jsonFormatter.encodeToString(response)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to parse or execute IPC request: $requestJson", e)
            GrpcProtoMappers.jsonFormatter.encodeToString(
                PluginIpcResponse(
                    success = false,
                    errorMessage = e.message ?: "Failed to parse IPC request",
                    errorCode = 400
                )
            )
        }
    }

    private suspend fun executePluginMethod(plugin: Plugin, methodName: String, payloadJson: String): String {
        return when (methodName) {
            "initialize", "shutdown", "healthCheck" -> executeControlMethod(plugin, methodName)
            "search" -> executeSearchMethod(plugin, payloadJson)
            "fetchDetails", "fetchCoverArt", "fetchRecommendations" -> executeMetadataMethod(plugin, methodName, payloadJson)
            "browse", "getContentDetails", "getStreamUrl" -> executeContentSourceMethod(plugin, methodName, payloadJson)
            else -> throw UnsupportedOperationException("Method $methodName not supported on remote plugin ${plugin.id}")
        }
    }

    private suspend fun executeControlMethod(plugin: Plugin, methodName: String): String {
        return when (methodName) {
            "initialize" -> {
                plugin.initialize()
                "{\"status\":\"initialized\"}"
            }
            "shutdown" -> {
                plugin.shutdown()
                "{\"status\":\"shutdown\"}"
            }
            "healthCheck" -> {
                val health = plugin.healthCheck()
                GrpcProtoMappers.serializePluginHealth(health)
            }
            else -> throw UnsupportedOperationException("Unknown control method $methodName")
        }
    }

    private suspend fun executeSearchMethod(plugin: Plugin, payloadJson: String): String {
        val query = GrpcProtoMappers.deserializeMetadataQuery(payloadJson)
        return when (plugin) {
            is com.universalmedialibrary.api.plugin.MetadataProviderPlugin -> {
                val results = plugin.search(query).getOrThrow()
                GrpcProtoMappers.serializeSearchResults(results)
            }
            is com.universalmedialibrary.api.plugin.ContentSourcePlugin -> {
                val items = plugin.search(query.title ?: "", query.mediaType).getOrThrow()
                GrpcProtoMappers.serializeContentItems(items)
            }
            else -> throw UnsupportedOperationException("Plugin ${plugin.id} does not support search")
        }
    }

    private suspend fun executeMetadataMethod(plugin: Plugin, methodName: String, payloadJson: String): String {
        val metadataPlugin = plugin as? com.universalmedialibrary.api.plugin.MetadataProviderPlugin
            ?: throw UnsupportedOperationException("Plugin ${plugin.id} does not support $methodName")

        return when (methodName) {
            "fetchDetails" -> {
                val request = GrpcProtoMappers.jsonFormatter.decodeFromString<FetchDetailsPayload>(payloadJson)
                val metadata = metadataPlugin.fetchDetails(request.id, request.mediaType).getOrThrow()
                GrpcProtoMappers.serializeMediaMetadata(metadata)
            }
            "fetchCoverArt" -> {
                val request = GrpcProtoMappers.jsonFormatter.decodeFromString<FetchCoverArtPayload>(payloadJson)
                val coverUrl = metadataPlugin.fetchCoverArt(request.id, request.size).getOrThrow()
                "{\"coverUrl\":\"$coverUrl\"}"
            }
            "fetchRecommendations" -> {
                val request = GrpcProtoMappers.jsonFormatter.decodeFromString<FetchRecsPayload>(payloadJson)
                val results = metadataPlugin.fetchRecommendations(request.id, request.limit).getOrThrow()
                GrpcProtoMappers.serializeSearchResults(results)
            }
            else -> throw UnsupportedOperationException("Unknown metadata method $methodName")
        }
    }

    private suspend fun executeContentSourceMethod(plugin: Plugin, methodName: String, payloadJson: String): String {
        val contentPlugin = plugin as? com.universalmedialibrary.api.plugin.ContentSourcePlugin
            ?: throw UnsupportedOperationException("Plugin ${plugin.id} does not support $methodName")

        return when (methodName) {
            "browse" -> {
                val request = GrpcProtoMappers.jsonFormatter.decodeFromString<BrowsePayload>(payloadJson)
                val browseResult = contentPlugin.browse(request.category, request.page, request.pageSize).getOrThrow()
                GrpcProtoMappers.serializeContentBrowseResult(browseResult)
            }
            "getContentDetails" -> {
                val item = contentPlugin.getDetails(payloadJson).getOrThrow()
                GrpcProtoMappers.serializeContentItem(item)
            }
            "getStreamUrl" -> {
                val streamUrl = contentPlugin.getStreamUrl(payloadJson).getOrThrow()
                "{\"streamUrl\":\"$streamUrl\"}"
            }
            else -> throw UnsupportedOperationException("Unknown content source method $methodName")
        }
    }

    override fun onTransact(code: Int, data: Parcel, reply: Parcel?, flags: Int): Boolean {
        return when (code) {
            TRANSACTION_EXECUTE_REQUEST -> {
                data.enforceInterface(INTERFACE_DESCRIPTOR)
                val requestJson = data.readString() ?: ""
                val responseJson = executeRequest(requestJson)
                reply?.writeNoException()
                reply?.writeString(responseJson)
                true
            }
            TRANSACTION_PING -> {
                data.enforceInterface(INTERFACE_DESCRIPTOR)
                val isAlive = ping()
                reply?.writeNoException()
                reply?.writeInt(if (isAlive) 1 else 0)
                true
            }
            else -> super.onTransact(code, data, reply, flags)
        }
    }
}

@kotlinx.serialization.Serializable
data class FetchDetailsPayload(val id: String, val mediaType: com.universalmedialibrary.api.plugin.MediaType)

@kotlinx.serialization.Serializable
data class FetchCoverArtPayload(val id: String, val size: com.universalmedialibrary.api.plugin.CoverSize)

@kotlinx.serialization.Serializable
data class FetchRecsPayload(val id: String, val limit: Int)

@kotlinx.serialization.Serializable
data class BrowsePayload(val category: String? = null, val page: Int = 1, val pageSize: Int = 50)
