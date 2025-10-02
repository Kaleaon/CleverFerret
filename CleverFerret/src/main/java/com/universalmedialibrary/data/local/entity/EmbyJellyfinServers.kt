package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "emby_servers",
    indices = [Index(value = ["host","port"], unique = true)]
)
data class EmbyServer(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val host: String,
    val port: Int = 8096,
    val apiKey: String? = null,
    val userId: String? = null,
    val lastSynced: Long = 0,
    val isActive: Boolean = true
)

@Entity(
    tableName = "jellyfin_servers",
    indices = [Index(value = ["host","port"], unique = true)]
)
data class JellyfinServer(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val host: String,
    val port: Int = 8096,
    val apiKey: String? = null,
    val userId: String? = null,
    val lastSynced: Long = 0,
    val isActive: Boolean = true
)

