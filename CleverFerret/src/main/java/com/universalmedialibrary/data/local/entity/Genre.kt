package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for storing genres
 */
@Entity(
    tableName = "genre",
    indices = [
        Index(value = ["name", "mediaType"]),
        Index(value = ["externalId"], unique = true)
    ]
)
data class Genre(
    @PrimaryKey(autoGenerate = true)
    val genreId: Long = 0,
    
    val name: String,
    val description: String? = null,
    val mediaType: String? = null, // Optional: BOOK, MOVIE, MUSIC, etc.
    val parentGenreId: Long? = null, // For hierarchical genres
    
    val externalId: String? = null, // ID in external database
    val lastUpdated: Long = System.currentTimeMillis()
)

/**
 * Junction entity linking media items to genres
 */
@Entity(
    tableName = "item_genre",
    primaryKeys = ["itemId", "genreId"],
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = Genre::class,
            parentColumns = ["genreId"],
            childColumns = ["genreId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["genreId"])
    ]
)
data class ItemGenre(
    val itemId: Long,
    val genreId: Long
)