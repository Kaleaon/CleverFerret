package com.universalmedialibrary.services.sync

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import org.json.JSONObject

/**
 * Type-safe JSON serialization engine configured with ignoreUnknownKeys = true
 * for backward compatibility across cloud sync payload schema updates.
 */
val cloudSyncJson: Json = Json {
    prettyPrint = true
    ignoreUnknownKeys = true
    isLenient = true
    encodeDefaults = true
}

@Deprecated(
    message = "Use type-safe kotlinx.serialization models and cloudSyncJson instead.",
    replaceWith = ReplaceWith("cloudSyncJson.encodeToString(data)")
)
internal fun serializeToJson(data: Map<String, Any>): String {
    val json = JSONObject()
    data.forEach { (key, value) -> json.put(key, value) }
    return json.toString()
}

@Deprecated(
    message = "Use type-safe kotlinx.serialization models and cloudSyncJson instead.",
    replaceWith = ReplaceWith("cloudSyncJson.decodeFromString(json)")
)
internal fun deserializeFromJson(json: String): Map<String, Any> {
    val map = mutableMapOf<String, Any>()
    if (json.isBlank()) return map
    runCatching {
        val jsonObject = JSONObject(json)
        val keys = jsonObject.keys()
        while (keys.hasNext()) {
            val key = keys.next()
            map[key] = jsonObject.get(key)
        }
    }
    return map
}


