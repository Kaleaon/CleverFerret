package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to a podcast episode.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property showName The name of the podcast show.
 * @property episodeNumber The episode number.
 * @property seasonNumber The season number.
 * @property durationSeconds The duration of the episode in seconds.
 * @property publicationDate The date the episode was published.
 * @property description A summary or description of the episode.
 * @property transcriptPath The file path to the episode's transcript, if available.
 * @property rssUrl The URL of the podcast's RSS feed.
 * @property podcastGuid A unique identifier for the podcast episode from its feed.
 */
@Entity(
    tableName = "metadata_podcast",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataPodcast(
    @PrimaryKey
    val itemId: Long,
    val showName: String? = null,
    val episodeNumber: Int? = null,
    val seasonNumber: Int? = null,
    val durationSeconds: Int? = null,
    val publicationDate: String? = null,
    val description: String? = null,
    val transcriptPath: String? = null,
    val rssUrl: String? = null,
    val podcastGuid: String? = null
)