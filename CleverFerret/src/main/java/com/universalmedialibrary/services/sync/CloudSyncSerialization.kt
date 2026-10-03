package com.universalmedialibrary.services.sync

import org.json.JSONObject
import org.json.JSONArray

internal fun serializeToJson(data: Map<String, Any>): String {
    // Simple JSON serialization
    return data.entries.joinToString(",", "{", "}") { (key, value) ->
        "\"$key\":\"$value\""
    }
}

internal fun deserializeFromJson(json: String): Map<String, Any> {
    // Simple JSON deserialization
    val entries = json.removeSurrounding("{", "}")
        .split(",")
        .mapNotNull {
            val parts = it.split(":")
            if (parts.size == 2) {
                parts[0].removeSurrounding("\"") to parts[1].removeSurrounding("\"")
            } else null
        }
    return entries.toMap()
}

