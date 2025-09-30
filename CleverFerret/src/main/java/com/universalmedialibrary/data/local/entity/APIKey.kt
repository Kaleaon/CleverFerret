package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index

/**
 * Entity for storing API keys for external services
 */
@Entity(
    tableName = "api_keys",
    indices = [
        Index(value = ["provider"], unique = true)
    ]
)
data class APIKey(
    @PrimaryKey(autoGenerate = true)
    val keyId: Long = 0,

    val provider: String, // "google_books", "tmdb", "omdb", "spotify", etc.
    val keyValue: String, // Encrypted API key
    val displayName: String,
    val description: String? = null,

    val isActive: Boolean = true,
    val validationStatus: String = "UNKNOWN", // VALID, INVALID, EXPIRED, UNKNOWN
    val lastValidated: Long? = null,

    val usageCount: Long = 0,
    val dailyLimit: Long? = null,
    val monthlyLimit: Long? = null,
    val currentDailyUsage: Long = 0,
    val currentMonthlyUsage: Long = 0,

    val category: String, // METADATA, MEDIA_DOWNLOAD, CLOUD_SYNC, etc.
    val requiredPermissions: String? = null, // JSON array of required permissions

    val dateAdded: Long = System.currentTimeMillis(),
    val lastUsed: Long? = null,
    val lastError: String? = null
)
