package com.universalmedialibrary.data

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index

/**
 * Tag entity for categorizing and organizing media items
 *
 * Tags can be used for:
 * - Genre classification (e.g., "Science Fiction", "Mystery")
 * - Custom collections (e.g., "To Read", "Favorites")
 * - Series or franchise grouping
 * - Reading status (e.g., "Currently Reading", "Completed")
 */
@Entity(
    tableName = "tags",
    indices = [Index(value = ["name"], unique = true)]
)
data class Tag(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String
)
