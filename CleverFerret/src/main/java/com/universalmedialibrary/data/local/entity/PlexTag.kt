package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for tracking Plex tags/genres
 */
@Entity(
    tableName = "plex_tags",
    foreignKeys = [
        ForeignKey(
            entity = PlexServer::class,
            parentColumns = ["serverId"],
            childColumns = ["serverId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["serverId"]),
        Index(value = ["serverId", "tag"], unique = true)
    ]
)
data class PlexTag(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val serverId: Long,
    val tag: String,
    val type: String, // genre, director, actor, etc.

    val lastSynced: Long = System.currentTimeMillis()
)

/**
 * Junction entity for media item tags
 */
@Entity(
    tableName = "plex_media_tags",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["id"],
            childColumns = ["plexMediaItemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = PlexTag::class,
            parentColumns = ["id"],
            childColumns = ["tagId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["plexMediaItemId"]),
        Index(value = ["tagId"])
    ]
)
data class PlexMediaTag(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    val plexMediaItemId: Long,
    val tagId: Long
)
