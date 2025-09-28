package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Entity representing a Plex Media Server connection
 */
@Entity(tableName = "plex_servers")
data class PlexServer(
    @PrimaryKey(autoGenerate = true)
    val serverId: Long = 0,
    
    val name: String,
    val host: String,
    val port: Int = 32400,
    val token: String,
    val machineIdentifier: String? = null,
    val version: String? = null,
    
    val isActive: Boolean = true,
    val lastConnected: Long = 0,
    val lastSynced: Long = 0,
    
    val dateAdded: Long = System.currentTimeMillis()
)