package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey

/**
 * Music track-specific metadata entity
 */
@Entity(
    tableName = "metadata_music_track",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataMusicTrack(
    @PrimaryKey
    val itemId: Long,
    
    val album: String? = null,
    val albumArtist: String? = null,
    val artist: String? = null,
    val composer: String? = null,
    
    val trackNumber: Int? = null,
    val totalTracks: Int? = null,
    val discNumber: Int? = null,
    val totalDiscs: Int? = null,
    
    val duration: Long? = null, // Duration in milliseconds
    val bitrate: Int? = null,
    val sampleRate: Int? = null,
    val channels: Int? = null,
    
    val musicBrainzTrackId: String? = null,
    val musicBrainzAlbumId: String? = null,
    val musicBrainzArtistId: String? = null,
    val spotifyId: String? = null,
    
    val bpm: Int? = null,
    val key: String? = null,
    val mood: String? = null,
    val energy: Float? = null,
    
    val playCount: Int = 0,
    val lastPlayed: Long? = null,
    val isFavorite: Boolean = false,
    val skipCount: Int = 0,
    
    val lyrics: String? = null,
    val hasLyrics: Boolean = false,
    val lyricsSource: String? = null
)