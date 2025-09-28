package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for tracking playback progress sync between local and Plex
 */
@Entity(
    tableName = "plex_progress",
    foreignKeys = [
        ForeignKey(
            entity = PlexMediaItem::class,
            parentColumns = ["id"],
            childColumns = ["plexMediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["plexMediaItemId"], unique = true)
    ]
)
data class PlexProgress(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val plexMediaItemId: Long,
    
    // Progress information
    val viewOffset: Long = 0, // Progress in milliseconds
    val viewCount: Int = 0,
    val lastViewedAt: Long? = null,
    
    // Sync status
    val localProgress: Long = 0, // Progress tracked locally
    val plexProgress: Long = 0, // Progress from Plex
    val needsSync: Boolean = false,
    val lastSyncedAt: Long = 0,
    
    val updatedAt: Long = System.currentTimeMillis()
)