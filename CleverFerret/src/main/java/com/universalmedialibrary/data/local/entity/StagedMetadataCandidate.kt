package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Entity for staging auto-generated or remote API fetched metadata candidates
 * before committing them to primary library tables.
 */
@Serializable
@Entity(
    tableName = "staged_metadata_candidates",
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["status"]),
        Index(value = ["expiresAt"])
    ]
)
data class StagedMetadataCandidate(
    @PrimaryKey(autoGenerate = true)
    val candidateId: Long = 0,

    val itemId: Long,

    val title: String? = null,
    val sortTitle: String? = null,
    val originalTitle: String? = null,

    val year: Int? = null,
    val releaseDate: Long? = null,

    val rating: Float? = null,

    val summary: String? = null,
    val plot: String? = null,
    val tagline: String? = null,

    val coverImagePath: String? = null,
    val backdropImagePath: String? = null,

    val language: String? = null,
    val country: String? = null,

    val tags: String? = null,

    val confidenceScore: Float = 0.80f,
    val source: String = "AUTOMATED_INGESTION",
    val status: String = "PENDING",

    val createdAt: Long = System.currentTimeMillis(),
    val expiresAt: Long = System.currentTimeMillis() + (30L * 24 * 60 * 60 * 1000L) // 30-day default TTL
)
