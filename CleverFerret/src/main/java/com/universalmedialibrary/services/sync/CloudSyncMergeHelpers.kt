package com.universalmedialibrary.services.sync

internal fun identifyConflicts(
    localItems: List<SyncItem>,
    remoteItems: List<SyncItem>
): List<CloudSyncConflict> {
    val conflicts = mutableListOf<CloudSyncConflict>()

    val remoteMap = remoteItems.associateBy { it.id }

    localItems.forEach { local ->
        val remote = remoteMap[local.id]
        if (remote != null && remote.timestamp != local.timestamp) {
            // Conflict detected
            conflicts.add(
                CloudSyncConflict(
                    itemId = local.id,
                    itemType = local.type,
                    localData = local.data,
                    remoteData = remote.data,
                    localTimestamp = local.timestamp,
                    remoteTimestamp = remote.timestamp
                )
            )
        }
    }

    return conflicts
}

internal fun mergeReadingPosition(conflict: CloudSyncConflict): SyncItem? {
    // Use the furthest reading position
    val localProgress = (conflict.localData as Map<*, *>)["progress"] as? Float ?: 0f
    val remoteProgress = (conflict.remoteData as Map<*, *>)["progress"] as? Float ?: 0f

    return if (remoteProgress > localProgress) {
        SyncItem(
            id = conflict.itemId,
            type = conflict.itemType,
            data = conflict.remoteData as Map<String, Any>,
            timestamp = conflict.remoteTimestamp,
            deviceId = ""
        )
    } else {
        null // Keep local
    }
}

internal fun mergeAnnotation(conflict: CloudSyncConflict): SyncItem? {
    // Annotations are merged by keeping both
    return null // Manual resolution needed
}

