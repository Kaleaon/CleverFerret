package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents movie-specific metadata associated with a [MediaItem].
 *
 * This entity creates a one-to-one relationship with a [MediaItem] by using the same
 * primary key (`itemId`). It stores details that are unique to movies.
 *
 * @property itemId The unique identifier for this metadata record, which is also the foreign key to the associated [MediaItem].
 * @property tagline The movie's tagline.
 * @property runtime The runtime of the movie in minutes.
 */
@Entity(
    tableName = "metadata_movie",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE,
        ),
    ],
)
data class MetadataMovie(
    @PrimaryKey
    val itemId: Long,
    val tagline: String?,
    val runtime: Int?, // in minutes
)
