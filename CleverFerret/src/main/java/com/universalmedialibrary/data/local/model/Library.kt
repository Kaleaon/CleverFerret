package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.Date

/**
 * Represents a library, which is a top-level container for media items of a specific type.
 *
 * @property libraryId The unique identifier for the library.
 * @property name The user-defined name of the library.
 * @property type The type of media this library holds (e.g., 'BOOK', 'MOVIE', 'MUSIC').
 * @property path The file system path to the root directory of the library.
 * @property dateCreated The date the library was created.
 * @property dateModified The timestamp of when this library's settings were last modified.
 */
@Entity(tableName = "libraries")
data class Library(
    @PrimaryKey(autoGenerate = true)
    val libraryId: Long = 0,
    val name: String,
    val type: String, // e.g., 'BOOK', 'MOVIE', 'MUSIC'
    val path: String,
    val dateCreated: Date = Date(),
    val dateModified: Long = System.currentTimeMillis()
)
