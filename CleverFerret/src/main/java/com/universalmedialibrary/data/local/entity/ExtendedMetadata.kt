package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import kotlinx.serialization.Serializable

/**
 * Extended Metadata (EAV Pattern) for expandable properties.
 *
 * Allows adding arbitrary key-value pairs to any MediaItem without
 * altering the database schema. This enables a "Calibre-like" custom column system.
 *
 * Examples:
 * - Book: "isbn" -> "978-3-16-148410-0"
 * - Music: "bpm" -> "120", "key" -> "C Major"
 * - Movie: "director" -> "Steven Spielberg"
 * - Comic: "penciler" -> "Jim Lee", "inker" -> "Scott Williams"
 */
@Serializable
@Entity(
    tableName = "extended_metadata",
    primaryKeys = ["itemId", "key"],
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["key"]),
        Index(value = ["value"]) // Allows searching by value
    ]
)
data class ExtendedMetadata(
    val itemId: Long,
    
    /**
     * The property key (e.g., "director", "bpm", "publisher")
     * standardized to lowercase_snake_case recommended.
     */
    val key: String,
    
    /**
     * The value string.
     * For non-string types, use dataType to convert back.
     */
    val value: String,
    
    /**
     * Data type hint for UI formatting and sorting
     * Options: STRING, INT, FLOAT, BOOLEAN, DATE, RATING
     */
    val dataType: String = "STRING"
)
