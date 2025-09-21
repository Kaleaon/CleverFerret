package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to a TV show episode.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property seasonNumber The season number of the episode.
 * @property episodeNumber The episode number within the season.
 * @property seriesName The name of the TV series.
 * @property network The network that aired the show.
 * @property airDate The original air date of the episode.
 * @property episodeRuntime The runtime of the episode in minutes.
 * @property tvRating The content rating of the TV show (e.g., "TV-14").
 * @property tvdbId The TVDB ID for the series or episode.
 * @property imdbId The IMDb ID for the series or episode.
 */
@Entity(
    tableName = "metadata_tv_show",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataTvShow(
    @PrimaryKey
    val itemId: Long,
    val seasonNumber: Int? = null,
    val episodeNumber: Int? = null,
    val seriesName: String? = null,
    val network: String? = null,
    val airDate: String? = null,
    val episodeRuntime: Int? = null,
    val tvRating: String? = null,
    val tvdbId: String? = null,
    val imdbId: String? = null
)