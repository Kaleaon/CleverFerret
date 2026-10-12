package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Entity representing an external media item mapped from third-party platforms
 * (Plex, Calibre, Jellyfin, Emby, YAACC, Poweramp).
 */
@Entity(
    tableName = "external_media_entities",
    indices = [
        Index(value = ["providerId", "externalId"], unique = true),
        Index(value = ["mediaItemId"]),
        Index(value = ["providerId"])
    ]
)
data class ExternalMediaEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val providerId: String,          // e.g., "plex", "calibre", "jellyfin", "emby", "yaacc", "poweramp"
    val externalId: String,          // Unique remote ID on target platform
    val mediaItemId: Long? = null,   // Optional link to local media_items.itemId

    val title: String,
    val creator: String? = null,      // Artist, Author, etc.
    val series: String? = null,
    val mediaType: String,            // BOOK, MUSIC, MOVIE, SHOW, AUDIOBOOK, COMIC, PODCAST, etc.
    val uri: String? = null,          // Stream / remote URI or file URL
    val coverUrl: String? = null,
    val summary: String? = null,
    val tags: String? = null,
    val progress: Float = 0f,         // Reading or playback progress (0.0 to 1.0)

    val lastSyncedAt: Long = System.currentTimeMillis(),
    val extraMetadata: String? = null
)
