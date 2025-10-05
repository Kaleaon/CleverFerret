package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Radio Station entity for internet radio streaming
 */
@Entity(
    tableName = "radio_stations",
    indices = [
        Index(value = ["name"]),
        Index(value = ["genre"]),
        Index(value = ["isFavorite"])
    ]
)
data class RadioStation(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    // Station info
    val name: String,
    val description: String? = null,
    val streamUrl: String,
    val websiteUrl: String? = null,
    val logoUrl: String? = null,
    
    // Station metadata
    val genre: String? = null,
    val country: String? = null,
    val language: String? = null,
    val bitrate: Int? = null, // kbps
    val codec: String? = null, // mp3, aac, ogg, etc.
    
    // User preferences
    val isFavorite: Boolean = false,
    val customOrder: Int = 0,
    
    // Tags
    val tags: String? = null, // Comma-separated
    
    // Metadata
    val addedAt: Long = System.currentTimeMillis(),
    val lastPlayedAt: Long? = null,
    val playCount: Int = 0
)