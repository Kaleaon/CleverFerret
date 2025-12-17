package com.universalmedialibrary.data.remote.freesound

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class FreesoundSearchResponse(
    val count: Int,
    val next: String? = null,
    val previous: String? = null,
    val results: List<FreesoundSoundSummary>
)

@Serializable
data class FreesoundSoundSummary(
    val id: Int,
    val name: String,
    val tags: List<String>,
    val license: String,
    val username: String
)

@Serializable
data class FreesoundSound(
    val id: Int,
    val name: String,
    val tags: List<String>,
    val description: String,
    val created: String,
    val license: String,
    val type: String,
    val channels: Int,
    val filesize: Long,
    val bitrate: Int,
    val bitdepth: Int,
    val duration: Double,
    val samplerate: Int,
    val username: String,
    val download: String,
    @SerialName("bookmark_count") val bookmarkCount: Int = 0,
    val previews: FreesoundPreviews,
    val images: FreesoundImages,
    @SerialName("num_downloads") val numDownloads: Int,
    @SerialName("avg_rating") val avgRating: Double,
    @SerialName("num_ratings") val numRatings: Int,
    val rate: String,
    val comments: String,
    @SerialName("similar_sounds") val similarSounds: String,
    val analysis: String? = null,
    @SerialName("analysis_frames") val analysisFrames: String? = null,
    @SerialName("analysis_stats") val analysisStats: String? = null,
    val url: String
)

@Serializable
data class FreesoundPreviews(
    @SerialName("preview-lq-mp3") val previewLqMp3: String,
    @SerialName("preview-hq-mp3") val previewHqMp3: String,
    @SerialName("preview-lq-ogg") val previewLqOgg: String,
    @SerialName("preview-hq-ogg") val previewHqOgg: String
)

@Serializable
data class FreesoundImages(
    @SerialName("waveform_l") val waveformL: String,
    @SerialName("waveform_m") val waveformM: String,
    @SerialName("spectral_l") val spectralL: String,
    @SerialName("spectral_m") val spectralM: String
)
