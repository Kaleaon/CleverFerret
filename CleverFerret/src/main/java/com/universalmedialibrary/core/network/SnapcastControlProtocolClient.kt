package com.universalmedialibrary.core.network

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.buildJsonObject
import kotlinx.serialization.json.doubleOrNull
import kotlinx.serialization.json.intOrNull
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive

/** Lightweight Snapcast JSON-RPC protocol parser/serializer used by audio sync features. */
class SnapcastControlProtocolClient(
    private val json: Json = Json { ignoreUnknownKeys = true }
) {

    fun parseFrame(frame: String): SnapcastProtocolMessage {
        val payload = json.parseToJsonElement(frame).jsonObject
        val method = payload["method"]?.jsonPrimitive?.content
        val id = payload["id"]?.jsonPrimitive?.intOrNull
        val params = payload["params"]?.jsonObject
        val result = payload["result"]?.jsonObject

        return when {
            method == "Stream.OnTime" -> {
                val stream = params?.get("stream")?.jsonPrimitive?.content.orEmpty()
                val serverTimeMs = params?.get("serverTimeMs")?.jsonPrimitive?.doubleOrNull ?: 0.0
                SnapcastProtocolMessage.StreamTimeSync(streamId = stream, serverTimeMs = serverTimeMs)
            }
            method == "Group.OnUpdate" -> {
                val groupName = params?.get("group")?.jsonPrimitive?.content.orEmpty()
                val members = params?.get("members")?.jsonArray?.map { it.jsonPrimitive.content }.orEmpty()
                SnapcastProtocolMessage.GroupUpdated(groupName = groupName, members = members)
            }
            method == "Client.OnLatency" -> {
                val clientId = params?.get("clientId")?.jsonPrimitive?.content.orEmpty()
                val latencyMs = params?.get("latencyMs")?.jsonPrimitive?.intOrNull ?: 0
                SnapcastProtocolMessage.LatencyUpdate(clientId = clientId, latencyMs = latencyMs)
            }
            result != null && id != null -> {
                SnapcastProtocolMessage.Ack(id = id, ok = true, payload = result)
            }
            id != null && payload.containsKey("error") -> {
                SnapcastProtocolMessage.Ack(id = id, ok = false, payload = payload)
            }
            else -> {
                SnapcastProtocolMessage.Unknown(payload)
            }
        }
    }

    fun buildSetClientVolumeRequest(id: Int, clientId: String, volume: Int): String =
        json.encodeToString(
            JsonObject.serializer(),
            baseRequest(
                id = id,
                method = "Client.SetVolume",
                params = buildJsonObject {
                    put("id", JsonPrimitive(clientId))
                    put("volume", JsonPrimitive(volume.coerceIn(0, 100)))
                }
            )
        )

    fun buildJoinGroupRequest(id: Int, clientId: String, group: String): String =
        json.encodeToString(
            JsonObject.serializer(),
            baseRequest(
                id = id,
                method = "Group.Join",
                params = buildJsonObject {
                    put("clientId", JsonPrimitive(clientId))
                    put("group", JsonPrimitive(group))
                }
            )
        )

    fun buildLeaveGroupRequest(id: Int, clientId: String): String =
        json.encodeToString(
            JsonObject.serializer(),
            baseRequest(
                id = id,
                method = "Group.Leave",
                params = buildJsonObject {
                    put("clientId", JsonPrimitive(clientId))
                }
            )
        )

    private fun baseRequest(id: Int, method: String, params: JsonObject): JsonObject =
        buildJsonObject {
            put("id", JsonPrimitive(id))
            put("jsonrpc", JsonPrimitive("2.0"))
            put("method", JsonPrimitive(method))
            put("params", params)
        }
}

sealed interface SnapcastProtocolMessage {
    @Serializable
    data class StreamTimeSync(
        @SerialName("stream")
        val streamId: String,
        val serverTimeMs: Double
    ) : SnapcastProtocolMessage

    @Serializable
    data class GroupUpdated(val groupName: String, val members: List<String>) : SnapcastProtocolMessage

    @Serializable
    data class LatencyUpdate(val clientId: String, val latencyMs: Int) : SnapcastProtocolMessage

    data class Ack(val id: Int, val ok: Boolean, val payload: JsonObject) : SnapcastProtocolMessage

    data class Unknown(val payload: JsonObject) : SnapcastProtocolMessage
}
