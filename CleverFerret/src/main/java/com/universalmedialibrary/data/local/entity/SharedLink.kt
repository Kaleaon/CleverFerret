package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "shared_links",
    indices = [
        Index(value = ["token"], unique = true),
        Index(value = ["targetType", "targetId"])
    ]
)
data class SharedLink(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val targetType: String, // LIBRARY, COLLECTION, ITEM
    val targetId: Long,
    val token: String,
    val createdAt: Long = System.currentTimeMillis(),
    val expiresAt: Long? = null,
    val enabled: Boolean = true
)

