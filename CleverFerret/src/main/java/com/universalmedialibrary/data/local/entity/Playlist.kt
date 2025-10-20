package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index
import kotlinx.serialization.Serializable

/**
 * Playlists and items for music (and potentially other audio).
 * Designed to support local persistence, sharing (export), and Plex sync.
 */
@Serializable
@Entity(tableName = "playlists")
data class Playlist(
    @PrimaryKey(autoGenerate = true)
    val playlistId: Long = 0,

    val name: String,
    val description: String? = null,
    val isLiked: Boolean = false,
    val isPublic: Boolean = false,
    val shareCode: String? = null,

    // For Plex integration (optional, if synced)
    val plexPlaylistId: String? = null,
    val lastSyncedAt: Long? = null,

    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)

@Entity(
    tableName = "playlist_items",
    foreignKeys = [
        ForeignKey(
            entity = Playlist::class,
            parentColumns = ["playlistId"],
            childColumns = ["playlistId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["mediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["playlistId"]),
        Index(value = ["mediaItemId"]),
        Index(value = ["playlistId", "position"], unique = true)
    ]
)
@Serializable
data class PlaylistItem(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val playlistId: Long,
    val mediaItemId: Long,
    val position: Int,
    val addedAt: Long = System.currentTimeMillis()
)
