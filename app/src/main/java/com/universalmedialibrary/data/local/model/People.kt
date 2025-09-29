package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents a person who can be associated with a media item (e.g., an author, actor, director).
 *
 * @property personId The unique identifier for the person.
 * @property name The full name of the person.
 * @property sortName The name used for sorting, typically in "Last, First" format.
 */
@Entity(tableName = "people")
data class People(
    @PrimaryKey(autoGenerate = true)
    val personId: Long = 0,
    val name: String,
    val sortName: String?,
)
