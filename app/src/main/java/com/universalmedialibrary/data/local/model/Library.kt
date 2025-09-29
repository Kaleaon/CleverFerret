package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents a single media library within the application.
 *
 * A library is a top-level container for a specific type of media, such as books, movies, or music.
 * Each library is associated with a directory path on the device's storage.
 *
 * @property libraryId The unique identifier for the library.
 * @property name The user-defined name of the library (e.g., "My E-books", "Sci-Fi Movies").
 * @property type The type of media this library contains (e.g., 'BOOK', 'MOVIE', 'MUSIC').
 * @property path The absolute file path to the root directory of this library.
 */
@Entity(tableName = "libraries")
data class Library(
    @PrimaryKey(autoGenerate = true)
    val libraryId: Long = 0,
    val name: String,
    val type: String, // e.g., 'BOOK', 'MOVIE', 'MUSIC'
    val path: String,
)
