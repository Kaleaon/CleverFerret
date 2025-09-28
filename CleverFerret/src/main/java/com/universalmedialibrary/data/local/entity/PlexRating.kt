package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for tracking rating sync between local and Plex
 */
@Entity(
    tableName = "plex_ratings",
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
data class PlexRating(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val plexMediaItemId: Long,
    
    // Rating information
    val localRating: Float? = null, // Rating in local system (0-10)
    val plexRating: Float? = null, // Rating from Plex (0-10)
    
    // Sync status  
    val needsSync: Boolean = false,
    val lastSyncedAt: Long = 0,
    
    val updatedAt: Long = System.currentTimeMillis()
)