package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents a music album in the media library.
 *
 * @property albumId The unique identifier for the album.
 * @property title The title of the album.
 * @property albumArtist The primary artist of the album.
 * @property releaseYear The year the album was released.
 * @property albumArtPath The file path to the album's cover art.
 */
@Entity(tableName = "albums")
data class Album(
    @PrimaryKey(autoGenerate = true)
    val albumId: Long = 0,
    val title: String,
    val albumArtist: String?, // For simplicity, using a string. In a fuller implementation, this could be a foreign key to a 'People' table.
    val releaseYear: Int?,
    val albumArtPath: String?
)
