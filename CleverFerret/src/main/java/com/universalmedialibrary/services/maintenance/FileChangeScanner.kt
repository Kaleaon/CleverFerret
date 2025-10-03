package com.universalmedialibrary.services.maintenance

import com.universalmedialibrary.data.local.entity.MaintenanceChange
import com.universalmedialibrary.data.local.entity.MediaItem
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class FileChangeScanner @Inject constructor() {
    fun scan(mediaItems: List<MediaItem>): List<MaintenanceChange> {
        val proposals = mutableListOf<MaintenanceChange>()
        mediaItems.forEach { item ->
            val file = File(item.filePath)
            if (!file.exists()) {
                proposals.add(
                    MaintenanceChange(
                        itemId = item.itemId,
                        changeType = "FILE_MISSING",
                        summary = "File not found at ${item.filePath}",
                        oldDataJson = "{\"filePath\":\"${item.filePath}\"}",
                        newDataJson = null
                    )
                )
            } else {
                val lastMod = file.lastModified()
                if (item.lastModified > 0 && lastMod > 0 && lastMod != item.lastModified) {
                    proposals.add(
                        MaintenanceChange(
                            itemId = item.itemId,
                            changeType = "FILE_MODIFIED",
                            summary = "File modified on disk",
                            oldDataJson = "{\"lastModified\":${item.lastModified}}",
                            newDataJson = "{\"lastModified\":$lastMod}"
                        )
                    )
                }
            }
        }
        return proposals
    }
}
