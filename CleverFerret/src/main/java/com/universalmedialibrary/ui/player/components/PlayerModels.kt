package com.universalmedialibrary.ui.player.components

/**
 * Represents an audio track in a media file.
 *
 * @property id The unique identifier for the track.
 * @property language The language of the track.
 * @property label The label for the track.
 * @property isDefault Whether this is the default audio track.
 * @property channels The number of audio channels.
 * @property sampleRate The sample rate of the audio.
 */
data class AudioTrack(
    val id: Int,
    val language: String?,
    val label: String?,
    val isDefault: Boolean = false,
    val channels: Int = 2,
    val sampleRate: Int = 44100
)

/**
 * Represents a subtitle track in a media file.
 *
 * @property id The unique identifier for the track.
 * @property language The language of the track.
 * @property label The label for the track.
 * @property isDefault Whether this is the default subtitle track.
 * @property format The format of the subtitle track (e.g., "srt", "ass").
 * @property isForced Whether this is a forced subtitle track.
 */
data class SubtitleTrack(
    val id: Int,
    val language: String?,
    val label: String?,
    val isDefault: Boolean = false,
    val format: String?, // "srt", "ass", "vtt", etc.
    val isForced: Boolean = false
)

/**
 * Represents a chapter in a media file.
 *
 * @property id The unique identifier for the chapter.
 * @property title The title of the chapter.
 * @property startTime The start time of the chapter in milliseconds.
 * @property endTime The end time of the chapter in milliseconds.
 * @property thumbnailUrl The URL for a thumbnail image for the chapter.
 */
data class Chapter(
    val id: Int,
    val title: String?,
    val startTime: Long, // in milliseconds
    val endTime: Long,
    val thumbnailUrl: String?
)

/**
 * Represents the playback state of the media player.
 *
 * @property isPlaying Whether the player is currently playing.
 * @property currentPosition The current playback position in milliseconds.
 * @property duration The total duration of the media in milliseconds.
 * @property bufferedPosition The buffered position in milliseconds.
 * @property playbackSpeed The current playback speed.
 * @property volume The current volume.
 * @property isBuffering Whether the player is currently buffering.
 * @property hasError Whether an error has occurred.
 * @property errorMessage The error message, if any.
 */
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

/**
 * Represents information about a media file.
 *
 * @property title The title of the media.
 * @property artist The artist of the media.
 * @property album The album of the media.
 * @property duration The duration of the media in milliseconds.
 * @property fileSize The size of the file in bytes.
 * @property format The format of the file.
 * @property codec The codec of the media.
 * @property bitrate The bitrate of the media.
 * @property sampleRate The sample rate of the media.
 * @property channels The number of channels in the media.
 */
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