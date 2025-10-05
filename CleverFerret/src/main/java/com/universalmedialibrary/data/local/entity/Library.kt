package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Entity representing a media library in the Universal Media Library system
 *
 * Each library represents a collection of media items of a specific type
 * (books, movies, music, etc.) stored in a particular file system location.
 */
@Entity(tableName = "libraries")
data class Library(
    @PrimaryKey(autoGenerate = true)
    val libraryId: Long = 0,

    val name: String,
    val type: String, // BOOK, MOVIE, TV_SHOW, MUSIC, COMIC, PODCAST, etc.
    val path: String,
    val source: String = "LOCAL", // LOCAL, PLEX, JELLYFIN, EMBY, CALIBRE
    val dateModified: Long = System.currentTimeMillis()
)
