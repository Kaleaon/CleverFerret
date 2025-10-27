package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Entity representing a YAACC (DLNA/UPnP) Media Server connection
 * YAACC is an open-source UPnP/DLNA client for Android
 */
@Entity(
    tableName = "yaacc_servers",
    indices = [Index(value = ["host","port"], unique = true)]
)
data class YaaccServer(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val name: String,
    val host: String,
    val port: Int = 8200, // Default UPnP port
    
    // UPnP/DLNA specific fields
    val deviceType: String? = null, // UPnP device type
    val friendlyName: String? = null, // UPnP friendly name
    val manufacturer: String? = null,
    val modelName: String? = null,
    val udn: String? = null, // Unique Device Name (UUID)
    
    val lastSynced: Long = 0,
    val isActive: Boolean = true,
    val dateAdded: Long = System.currentTimeMillis()
) {
    val serverId: Long get() = id
    val url: String get() = "http://$host:$port"
}
