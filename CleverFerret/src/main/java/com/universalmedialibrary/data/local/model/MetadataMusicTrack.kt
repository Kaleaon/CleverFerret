package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to a music track.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property artist The primary artist of the track.
 * @property albumTitle The title of the album this track belongs to.
 * @property albumId The ID of the album this track belongs to.
 * @property trackNumber The track number on the album.
 * @property discNumber The disc number if the album has multiple discs.
 * @property duration The duration of the track in seconds.
 * @property genre The genre of the music track.
 * @property releaseYear The year the track was released.
 * @property bitrate The bitrate of the audio file.
 * @property sampleRate The sample rate of the audio file.
 */
@Entity(
    tableName = "metadata_music_track",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = Album::class,
            parentColumns = ["albumId"],
            childColumns = ["albumId"],
            onDelete = ForeignKey.SET_NULL // If an album is deleted, we don't want to delete the track
        )
    ],
    indices = [androidx.room.Index(value = ["albumId"])]
)
data class MetadataMusicTrack(
    @PrimaryKey
    val itemId: Long,
    val artist: String?,
    val albumTitle: String?,
    val albumId: Long?,
    val trackNumber: Int?,
    val discNumber: Int?,
    val duration: Int?, // in seconds
    val genre: String?,
    val releaseYear: Int?,
    val bitrate: Int?,
    val sampleRate: Int?
)
