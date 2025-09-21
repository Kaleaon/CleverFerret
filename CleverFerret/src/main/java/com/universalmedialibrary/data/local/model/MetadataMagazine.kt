package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to a magazine issue.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property issueNumber The issue number of the magazine.
 * @property volumeNumber The volume number of the magazine.
 * @property publicationDate The publication date of the issue.
 * @property issn The International Standard Serial Number (ISSN) of the magazine.
 * @property magazineTitle The title of the magazine series.
 * @property articleCount The number of articles in the issue.
 * @property coverStory The title of the cover story.
 * @property editor The editor of the magazine issue.
 */
@Entity(
    tableName = "metadata_magazine",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataMagazine(
    @PrimaryKey
    val itemId: Long,
    val issueNumber: String? = null,
    val volumeNumber: String? = null,
    val publicationDate: String? = null,
    val issn: String? = null,
    val magazineTitle: String? = null,
    val articleCount: Int? = null,
    val coverStory: String? = null,
    val editor: String? = null
)