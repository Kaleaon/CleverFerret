package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents a person who can be associated with media items, such as an author, actor, or director.
 *
 * @property personId The unique identifier for the person.
 * @property name The full name of the person.
 * @property sortName A version of the name used for sorting (e.g., "Asimov, Isaac").
 */
@Entity(tableName = "people")
data class People(
    @PrimaryKey(autoGenerate = true)
    val personId: Long = 0,
    val name: String,
    val sortName: String?
)
