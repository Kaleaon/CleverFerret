package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Represents music-track-specific metadata associated with a [MediaItem].
 *
 * This entity creates a one-to-one relationship with a [MediaItem] and links to an [Album].
 * If the associated [Album] is deleted, the `albumId` in this record will be set to null,
 * but the track metadata itself will not be deleted.
 *
 * @property itemId The unique identifier for this metadata record, which is also the foreign key to the associated [MediaItem].
 * @property albumId The foreign key referencing the [Album] this track belongs to. Can be null if the track is not part of an album.
 * @property trackNumber The track number on the album.
 * @property discNumber The disc number if the album has multiple discs.
 * @property duration The duration of the track in seconds.
 */
@Entity(
    tableName = "metadata_music_track",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE,
        ),
        ForeignKey(
            entity = Album::class,
            parentColumns = ["albumId"],
            childColumns = ["albumId"],
            onDelete = ForeignKey.SET_NULL, // If an album is deleted, we don't want to delete the track
        ),
    ],
    indices = [Index(value = ["albumId"])],
)
data class MetadataMusicTrack(
    @PrimaryKey
    val itemId: Long,
    val albumId: Long?,
    val trackNumber: Int?,
    val discNumber: Int?,
    val duration: Int?, // in seconds
)
