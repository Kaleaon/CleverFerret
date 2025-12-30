package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index
import androidx.room.ColumnInfo

/**
 * Universal Tag entity for cross-media tagging system.
 * Supports tagging of books, audio, video, documents, and all media types.
 */
@Entity(
    tableName = "universal_tags",
    indices = [
        Index(value = ["name"], unique = true),
        Index(value = ["category"]),
        Index(value = ["created_at"]),
        Index(value = ["usage_count"])
    ]
)
data class UniversalTag(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "name")
    val name: String,
    
    @ColumnInfo(name = "color")
    val color: String? = null,
    
    @ColumnInfo(name = "icon")
    val icon: String? = null,
    
    @ColumnInfo(name = "category")
    val category: TagCategory = TagCategory.CUSTOM,
    
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "updated_at")
    val updatedAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "usage_count")
    val usageCount: Int = 0,
    
    @ColumnInfo(name = "is_system_tag")
    val isSystemTag: Boolean = false,
    
    @ColumnInfo(name = "description")
    val description: String? = null,
    
    @ColumnInfo(name = "parent_tag_id")
    val parentTagId: Long? = null,
    
    @ColumnInfo(name = "is_active")
    val isActive: Boolean = true
)

/**
 * Tag categories for organization and filtering.
 */
enum class TagCategory(val displayName: String, val defaultColor: String) {
    GENRE("Genre", "#2196F3"),
    MOOD("Mood", "#9C27B0"),
    CUSTOM("Custom", "#607D8B"),
    AUTO("Auto-generated", "#4CAF50"),
    SYSTEM("System", "#FF5722"),
    COLLECTION("Collection", "#FF9800"),
    RATING("Rating", "#795548"),
    STATUS("Status", "#009688"),
    PRIORITY("Priority", "#F44336"),
    LANGUAGE("Language", "#3F51B5"),
    SOURCE("Source", "#00BCD4"),
    FORMAT("Format", "#8BC34A")
}