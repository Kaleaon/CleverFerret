package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity representing a media item from Plex server for sync purposes
 */
@Entity(
    tableName = "plex_media_items",
    foreignKeys = [
        ForeignKey(
            entity = PlexServer::class,
            parentColumns = ["serverId"],
            childColumns = ["serverId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["localMediaItemId"],
            onDelete = ForeignKey.SET_NULL
        )
    ],
    indices = [
        Index(value = ["serverId"]),
        Index(value = ["plexRatingKey"], unique = true),
        Index(value = ["localMediaItemId"])
    ]
)
data class MediaItem(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val serverId: Long,
    val plexRatingKey: String, // Plex's unique identifier for the item
    val localMediaItemId: Long? = null, // Link to local MediaItem if matched

    val title: String,
    val type: String, // movie, episode, track, etc.
    val year: Int? = null,
    val duration: Long? = null, // in milliseconds

    val libraryName: String,
    val librarySectionId: String,

    val lastSynced: Long = System.currentTimeMillis()
)
