package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "maintenance_changes",
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["status"]),
        Index(value = ["createdAt"])
    ]
)
data class MaintenanceChange(
    @PrimaryKey(autoGenerate = true)
    val changeId: Long = 0,

    val itemId: Long,
    val changeType: String, // METADATA_UPDATE, COVER_UPDATE, FILE_RENAME, DUPLICATE, OTHER
    val summary: String,

    // JSON payloads for before/after
    val oldDataJson: String? = null,
    val newDataJson: String? = null,

    val status: String = "PENDING", // PENDING, ACCEPTED, REJECTED
    val createdAt: Long = System.currentTimeMillis(),
    val decidedAt: Long? = null
)

