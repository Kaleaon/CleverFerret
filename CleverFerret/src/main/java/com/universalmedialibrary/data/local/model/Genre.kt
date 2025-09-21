package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents a genre that can be associated with media items.
 *
 * @property genreId The unique identifier for the genre.
 * @property name The name of the genre (e.g., "Science Fiction", "Fantasy").
 */
@Entity(tableName = "genres")
data class Genre(
    @PrimaryKey(autoGenerate = true)
    val genreId: Long = 0,
    val name: String
)
