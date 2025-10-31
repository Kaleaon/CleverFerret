package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index
import kotlinx.serialization.Serializable

/**
 * Entity for storing search history
 */
@Serializable
@Entity(
    tableName = "search_history",
    indices = [
        Index(value = ["timestamp"]),
        Index(value = ["query"])
    ]
)
data class SearchHistory(
    @PrimaryKey(autoGenerate = true)
    val historyId: Long = 0,
    
    val query: String,
    val resultCount: Int = 0,
    val timestamp: Long = System.currentTimeMillis(),
    
    // Optional filter criteria used in the search
    val mediaTypes: String? = null, // JSON array of media types
    val sortBy: String? = null,
    val filterCriteria: String? = null // JSON string of additional filters
)

/**
 * Entity for storing saved searches
 */
@Serializable
@Entity(
    tableName = "saved_searches",
    indices = [
        Index(value = ["name"]),
        Index(value = ["createdAt"])
    ]
)
data class SavedSearchEntity(
    @PrimaryKey(autoGenerate = true)
    val savedSearchId: Long = 0,
    
    val name: String,
    val query: String,
    
    // Saved filter criteria
    val mediaTypes: String? = null, // JSON array of media types
    val sortBy: String? = null,
    val filterCriteria: String? = null, // JSON string of additional filters
    
    val createdAt: Long = System.currentTimeMillis(),
    val lastUsed: Long? = null
)
