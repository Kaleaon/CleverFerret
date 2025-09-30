package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey

/**
 * Movie-specific metadata entity
 */
@Entity(
    tableName = "metadata_movie",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataMovie(
    @PrimaryKey
    val itemId: Long,

    val runtime: Int? = null, // Duration in minutes
    val budget: Long? = null,
    val revenue: Long? = null,

    val imdbId: String? = null,
    val tmdbId: String? = null,
    val rottenTomatoesId: String? = null,

    val collection: String? = null,
    val franchise: String? = null,

    val certification: String? = null, // Rating like PG-13, R, etc.
    val contentRating: String? = null,

    val aspectRatio: String? = null,
    val resolution: String? = null, // 1080p, 4K, etc.
    val videoCodec: String? = null,
    val audioCodec: String? = null,

    val watchedStatus: String = "UNWATCHED", // UNWATCHED, WATCHING, WATCHED
    val watchedDate: Long? = null,
    val watchProgress: Float = 0f, // 0.0 to 1.0
    val resumePosition: Long = 0, // Position in milliseconds

    val criticScore: Int? = null,
    val audienceScore: Int? = null,
    val metacriticScore: Int? = null
)
