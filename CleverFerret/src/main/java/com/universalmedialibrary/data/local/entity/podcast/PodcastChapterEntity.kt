package com.universalmedialibrary.data.local.entity.podcast

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Podcast chapter entity
 * Represents chapter marks within a podcast episode (based on Podlove Simple Chapters)
 */
@Entity(
    tableName = "podcast_chapters",
    foreignKeys = [
        ForeignKey(
            entity = PodcastEpisodeEntity::class,
            parentColumns = ["id"],
            childColumns = ["episodeId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["episodeId"]),
        Index(value = ["startTime"])
    ]
)
data class PodcastChapterEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,

    // Foreign key
    val episodeId: Long,

    // Chapter info
    val title: String,
    val startTime: Long, // in milliseconds
    val endTime: Long? = null, // in milliseconds, null if unknown

    // Optional metadata
    val url: String? = null, // Link to chapter resource
    val imageUrl: String? = null, // Chapter-specific image

    // Chapter type
    val chapterType: String = "normal", // normal, ad, intro, outro, etc.

    // Order
    val chapterIndex: Int = 0
)
