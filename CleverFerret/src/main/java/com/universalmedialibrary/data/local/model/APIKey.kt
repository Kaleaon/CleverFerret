package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.UUID

@Entity(tableName = "api_keys")
data class APIKey(
    @PrimaryKey
    val id: String = UUID.randomUUID().toString(),
    val keyName: String,
    val keyValue: String,
    val isActive: Boolean = true,
    val lastValidated: Long? = null,
    val validationStatus: String? = null, // "valid", "invalid", "untested"
    val provider: String, // "google_books", "tmdb", "spotify", etc.
    val category: String, // "BOOKS", "MOVIES_TV", "MUSIC", etc.
    val isRequired: Boolean = false,
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)