package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for tracking Plex collections/playlists
 */
@Entity(
    tableName = "plex_collections",
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
        Index(value = ["plexRatingKey"], unique = true)
    ]
)
data class PlexCollection(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val serverId: Long,
    val plexRatingKey: String, // Plex's unique identifier for the collection
    
    val title: String,
    val type: String, // collection, playlist
    val summary: String? = null,
    val itemCount: Int = 0,
    
    val thumb: String? = null,
    val art: String? = null,
    
    val lastSynced: Long = System.currentTimeMillis()
)

/**
 * Junction entity for collection items
 */
@Entity(
    tableName = "plex_collection_items",
    foreignKeys = [
        ForeignKey(
            entity = PlexCollection::class,
            parentColumns = ["id"],
            childColumns = ["collectionId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = PlexMediaItem::class,
            parentColumns = ["id"],
            childColumns = ["plexMediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["collectionId"]),
        Index(value = ["plexMediaItemId"])
    ]
)
data class PlexCollectionItem(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val collectionId: Long,
    val plexMediaItemId: Long,
    val sortOrder: Int = 0
)