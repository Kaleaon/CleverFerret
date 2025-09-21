package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.UUID

/**
 * Represents an API key for an external service used for fetching metadata.
 *
 * @property id The unique identifier for the API key entry.
 * @property keyName A user-friendly name for the key (e.g., "My TMDB Key").
 * @property keyValue The actual value of the API key.
 * @property isActive Whether this API key is currently in use.
 * @property lastValidated The timestamp of the last time this key was validated.
 * @property validationStatus The status of the last validation ("valid", "invalid", "untested").
 * @property provider The service provider this key is for (e.g., "google_books", "tmdb").
 * @property category The category of media this key applies to (e.g., "BOOKS", "MOVIES_TV").
 * @property isRequired Whether this API key is essential for basic app functionality.
 * @property createdAt The timestamp when this key was first added.
 * @property updatedAt The timestamp when this key was last updated.
 */
@Entity(tableName = "api_keys")
data class APIKey(
    @PrimaryKey
    val id: String = UUID.randomUUID().toString(),
    val keyName: String,
    val keyValue: String,
    val isActive: Boolean = true,
    val lastValidated: Long? = null,
    /** The status of the last validation. Can be "valid", "invalid", or "untested". */
    val validationStatus: String? = null,
    val provider: String, // e.g., "google_books", "tmdb", "spotify"
    val category: String, // e.g., "BOOKS", "MOVIES_TV", "MUSIC"
    val isRequired: Boolean = false,
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)