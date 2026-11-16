package com.universalmedialibrary.data.crdt

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

/**
 * Thread-safe vector clock implementation for multi-device causal ordering.
 *
 * Each participating node (client/device) maintains an entry in the vector clock map.
 * When local mutations occur, the local node increments its clock value.
 * Out-of-order events and offline state transitions can be evaluated without
 * wall-clock timestamps by comparing vector dominance.
 */
@Serializable
data class VectorClock(
    val clocks: Map<String, Long> = emptyMap()
) {
    /**
     * Returns the clock counter for the given node, or 0 if not present.
     */
    fun getClock(nodeId: String): Long = clocks[nodeId] ?: 0L

    /**
     * Increments the clock for the specified node identifier by 1.
     */
    fun increment(nodeId: String): VectorClock {
        val nextMap = clocks.toMutableMap()
        val current = nextMap[nodeId] ?: 0L
        nextMap[nodeId] = current + 1L
        return VectorClock(nextMap)
    }

    /**
     * Merges this vector clock with another vector clock by taking the maximum value for each node.
     */
    fun merge(other: VectorClock): VectorClock {
        val merged = clocks.toMutableMap()
        for ((nodeId, value) in other.clocks) {
            val existing = merged[nodeId] ?: 0L
            merged[nodeId] = maxOf(existing, value)
        }
        return VectorClock(merged)
    }

    /**
     * Returns true if this vector clock strictly dominates [other].
     *
     * A vector clock V1 dominates V2 if:
     * 1. For all nodes k in either clock, V1[k] >= V2[k]
     * 2. For at least one node k, V1[k] > V2[k]
     */
    fun dominates(other: VectorClock): Boolean {
        val allNodes = clocks.keys + other.clocks.keys
        if (allNodes.isEmpty()) return false

        var strictlyGreater = false
        for (node in allNodes) {
            val thisVal = getClock(node)
            val otherVal = other.getClock(node)
            if (thisVal < otherVal) return false
            if (thisVal > otherVal) strictlyGreater = true
        }
        return strictlyGreater
    }

    /**
     * Returns true if this vector clock is concurrent with [other]
     * (neither dominates the other and they are not equal).
     */
    fun concurrentWith(other: VectorClock): Boolean {
        if (this == other) return false
        return !dominates(other) && !other.dominates(this)
    }

    /**
     * Serializes this vector clock to a JSON string.
     */
    fun toJson(): String {
        return jsonSerializer.encodeToString(clocks)
    }

    companion object {
        private val jsonSerializer = Json {
            ignoreUnknownKeys = true
            isLenient = true
        }

        /**
         * Deserializes a vector clock from a JSON string.
         * Returns an empty VectorClock on invalid/null/empty input.
         */
        fun fromJson(jsonStr: String?): VectorClock {
            if (jsonStr.isNullOrBlank() || jsonStr.trim() == "{}" || jsonStr.trim() == "null") {
                return VectorClock()
            }
            return try {
                val map = jsonSerializer.decodeFromString<Map<String, Long>>(jsonStr)
                VectorClock(map)
            } catch (_: Exception) {
                // Fallback manual key-value extraction for robustness
                parseManualJson(jsonStr)
            }
        }

        private fun parseManualJson(raw: String): VectorClock {
            return try {
                val clean = raw.trim().removeSurrounding("{", "}").trim()
                if (clean.isEmpty()) return VectorClock()
                val entries = clean.split(",")
                val map = mutableMapOf<String, Long>()
                for (entry in entries) {
                    val parts = entry.split(":")
                    if (parts.size == 2) {
                        val key = parts[0].trim().removeSurrounding("\"").trim()
                        val value = parts[1].trim().removeSurrounding("\"").toLongOrNull() ?: 0L
                        map[key] = value
                    }
                }
                VectorClock(map)
            } catch (_: Exception) {
                VectorClock()
            }
        }
    }
}
