package com.universalmedialibrary.ui.player.components

/**
 * Models for player components
 */

data class AudioTrack(
    val id: Int,
    val language: String?,
    val label: String?,
    val isDefault: Boolean = false,
    val channels: Int = 2,
    val sampleRate: Int = 44100
)

data class SubtitleTrack(
    val id: Int,
    val language: String?,
    val label: String?,
    val isDefault: Boolean = false,
    val format: String?, // "srt", "ass", "vtt", etc.
    val isForced: Boolean = false
)

data class Chapter(
    val id: Int,
    val title: String?,
    val startTime: Long, // in milliseconds
    val endTime: Long,
    val thumbnailUrl: String?
)

data class PlaybackState(
    val isPlaying: Boolean = false,
    val currentPosition: Long = 0L,
    val duration: Long = 0L,
    val bufferedPosition: Long = 0L,
    val playbackSpeed: Float = 1.0f,
    val volume: Float = 1.0f,
    val isBuffering: Boolean = false,
    val hasError: Boolean = false,
    val errorMessage: String? = null
)

data class MediaInfo(
    val title: String?,
    val artist: String?,
    val album: String?,
    val duration: Long,
    val fileSize: Long?,
    val format: String?,
    val codec: String?,
    val bitrate: Int?,
    val sampleRate: Int?,
    val channels: Int?
)