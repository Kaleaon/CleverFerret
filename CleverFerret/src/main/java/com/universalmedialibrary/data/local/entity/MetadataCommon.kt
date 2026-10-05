package com.universalmedialibrary.data.local.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index
import kotlinx.serialization.Serializable

/**
 * Common metadata fields shared across all media types
 *
 * This table stores metadata that applies to books, movies, music, etc.
 * Type-specific metadata is stored in separate tables.
 */
@Serializable
@Entity(
    tableName = "metadata_common",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"])
    ]
)
data class MetadataCommon(
    @PrimaryKey
    val itemId: Long,

    val title: String,
    val sortTitle: String? = null,
    val originalTitle: String? = null,

    val year: Int? = null,
    val releaseDate: Long? = null,

    val rating: Float? = null,
    val userRating: Float? = null,
    val communityRating: Float? = null,

    val summary: String? = null,
    val plot: String? = null,
    val tagline: String? = null,

    val coverImagePath: String? = null,
    val backdropImagePath: String? = null,

    val language: String? = null,
    val country: String? = null,

    val lastUpdated: Long = System.currentTimeMillis(),
    val metadataSource: String? = null, // API source used
    val externalId: String? = null, // ID in external database

    // User interaction metadata
    val isFavorite: Boolean = false,
    val isDownloaded: Boolean = false,
    @ColumnInfo(defaultValue = "0")
    val isVerified: Boolean = false
)
