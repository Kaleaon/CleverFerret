package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "api_keys")
data class APIKey(
    @PrimaryKey
    val provider: String,
    val keyValue: String,
    val category: String,
    val isRequired: Boolean = false,
    val validationStatus: String? = null, // "valid", "invalid", "untested"
    val lastUpdated: Long = System.currentTimeMillis(),
    val lastValidated: Long? = null
)