package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import com.universalmedialibrary.data.local.converters.AudioChapterListConverter
import com.universalmedialibrary.services.audiobook.AudioChapter

/**
 * Database entity for audiobooks
 */
@Entity(
    tableName = "audiobooks",
    indices = [
        Index(value = ["author"]),
        Index(value = ["genre"]),
        Index(value = ["dateAdded"]),
        Index(value = ["isFinished"])
    ]
)
@TypeConverters(AudioChapterListConverter::class)
data class AudiobookEntity(
    @PrimaryKey
    val id: String,
    
    // File info
    val filePath: String,
    
    // Basic metadata
    val title: String,
    val author: String? = null,
    val narrator: String? = null,
    val description: String? = null,
    val genre: String? = null,
    val publisher: String? = null,
    val publishDate: String? = null,
    
    // Technical info
    val duration: Long, // seconds
    val bitrate: Int? = null,
    val sampleRate: Int? = null,
    val codec: String? = null,
    
    // Cover
    val coverPath: String? = null,
    
    // Chapters
    val chapterCount: Int = 0,
    val chapters: List<AudioChapter> = emptyList(),
    
    // Language
    val language: String = "en",
    
    // Playback state
    val lastPlayedPosition: Long = 0, // seconds
    val isFinished: Boolean = false,
    
    // Timestamps
    val dateAdded: Long = System.currentTimeMillis(),
    val lastPlayed: Long? = null
)
