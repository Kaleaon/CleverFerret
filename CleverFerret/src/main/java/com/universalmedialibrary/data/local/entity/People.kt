package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.ForeignKey
import androidx.room.Index

/**
 * Entity for storing people (authors, directors, actors, musicians, etc.)
 */
@Entity(
    tableName = "people",
    indices = [
        Index(value = ["name"]),
        Index(value = ["imdbId"], unique = true),
        Index(value = ["tmdbId"], unique = true),  
        Index(value = ["musicBrainzId"], unique = true)
    ]
)
data class People(
    @PrimaryKey(autoGenerate = true)
    val personId: Long = 0,
    
    val name: String,
    val sortName: String? = null,
    val biography: String? = null,
    val birthDate: Long? = null,
    val deathDate: Long? = null,
    val birthPlace: String? = null,
    val nationality: String? = null,
    
    val photoPath: String? = null,
    val imdbId: String? = null,
    val tmdbId: String? = null,
    val musicBrainzId: String? = null,
    
    val website: String? = null,
    val socialMedia: String? = null, // JSON with social media links
    
    val lastUpdated: Long = System.currentTimeMillis()
)

/**
 * Junction entity linking media items to people with roles
 */
@Entity(
    tableName = "item_person_role",
    primaryKeys = ["itemId", "personId", "role"],
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = People::class,
            parentColumns = ["personId"],
            childColumns = ["personId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["personId"]),
        Index(value = ["role"])
    ]
)
data class ItemPersonRole(
    val itemId: Long,
    val personId: Long,
    val role: String, // AUTHOR, DIRECTOR, ACTOR, ARTIST, COMPOSER, etc.
    
    val characterName: String? = null, // For actors
    val roleOrder: Int? = null, // For ordering in credits
    val department: String? = null, // For crew roles
    val job: String? = null // Specific job title
)