package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverter
import androidx.room.TypeConverters
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

/**
 * Type converters for Room database
 */
class Converters {
    @TypeConverter
    fun fromStringList(value: List<String>): String {
        return Gson().toJson(value)
    }

    @TypeConverter
    fun toStringList(value: String): List<String> {
        return try {
            Gson().fromJson(value, object : TypeToken<List<String>>() {}.type) ?: emptyList()
        } catch (e: Exception) {
            emptyList()
        }
    }
}

/**
 * Entity to track downloaded stories for update detection and management
 * 
 * This table maintains a record of all stories downloaded via URL,
 * enabling automatic update detection and re-downloading of updated content.
 * 
 * Inspired by Calibre's FanFiction downloader which tracks:
 * - Story metadata and update timestamps
 * - Chapter counts for update detection
 * - Source URLs for re-downloading
 * - Last update check timestamps
 */
@Entity(tableName = "downloaded_stories")
@TypeConverters(Converters::class)
data class DownloadedStory(
    @PrimaryKey
    val id: String, // Generated from URL or site-specific ID
    
    // Story metadata
    val url: String,
    val title: String,
    val author: String,
    val site: String, // "ao3", "ffnet", "wattpad", etc.
    val siteStoryId: String, // Site-specific story ID
    
    // Update tracking
    val totalChapters: Int,
    val lastKnownChapters: Int,
    val lastUpdated: Long, // Timestamp from story site
    val lastChecked: Long, // When we last checked for updates
    val lastDownloaded: Long, // When we last downloaded
    
    // File management
    val epubFilePath: String,
    val fileSize: Long,
    val checksum: String? = null, // For integrity checking
    
    // Status tracking
    val isCompleted: Boolean = false,
    val hasUpdates: Boolean = false,
    val autoUpdateEnabled: Boolean = true,
    
    // Metadata for display
    val description: String? = null,
    val tags: List<String> = emptyList(),
    val rating: String? = null,
    val language: String = "en",
    val fandom: String? = null,
    
    // Error tracking
    val lastError: String? = null,
    val failureCount: Int = 0
)

/**
 * Entity to track story update history
 */
@Entity(tableName = "story_updates")
data class StoryUpdate(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val storyId: String, // Foreign key to DownloadedStory.id
    val updateType: String, // "NEW_CHAPTER", "METADATA_UPDATE", "COMPLETION", "ERROR"
    val previousChapters: Int,
    val newChapters: Int,
    val updateDescription: String,
    val timestamp: Long = System.currentTimeMillis(),
    val wasSuccessful: Boolean = true
)