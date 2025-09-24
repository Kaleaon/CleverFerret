package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index

/**
 * Entity for storing series information (book series, TV series, etc.)
 */
@Entity(
    tableName = "series",
    indices = [
        Index(value = ["name", "mediaType"], unique = true)
    ]
)
data class Series(
    @PrimaryKey(autoGenerate = true)
    val seriesId: Long = 0,
    
    val name: String,
    val description: String? = null,
    val totalItems: Int? = null,
    val mediaType: String, // BOOK, TV_SHOW, etc.
    
    val startYear: Int? = null,
    val endYear: Int? = null,
    val status: String? = null, // ONGOING, COMPLETED, CANCELLED
    
    val coverImagePath: String? = null,
    val externalId: String? = null,
    val lastUpdated: Long = System.currentTimeMillis()
)

/**
 * Entity for storing album information (music albums)
 */
@Entity(
    tableName = "albums",
    indices = [
        Index(value = ["title", "releaseYear", "recordLabel"]),
        Index(value = ["albumArtistId"]),
        Index(value = ["musicBrainzAlbumId"], unique = true),
        Index(value = ["spotifyAlbumId"], unique = true)
    ]
)
data class Album(
    @PrimaryKey(autoGenerate = true)
    val albumId: Long = 0,
    
    val title: String,
    val albumArtistId: Long? = null, // Reference to People table
    val releaseYear: Int? = null,
    val releaseDate: Long? = null,
    
    val albumArtPath: String? = null,
    val totalTracks: Int? = null,
    val totalDiscs: Int? = null,
    val duration: Long? = null, // Total duration in milliseconds
    
    val recordLabel: String? = null,
    val catalogNumber: String? = null,
    val barcode: String? = null,
    
    val musicBrainzAlbumId: String? = null,
    val spotifyAlbumId: String? = null,
    val lastFmAlbumId: String? = null,
    
    val lastUpdated: Long = System.currentTimeMillis()
)