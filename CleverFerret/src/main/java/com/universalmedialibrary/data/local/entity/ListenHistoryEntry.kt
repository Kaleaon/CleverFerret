package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(
    tableName = "listen_history",
    indices = [
        Index("mediaItemId"),
        Index("libraryId"),
        Index("startedAt"),
        Index("completedAt")
    ]
)
data class ListenHistoryEntry(
    @PrimaryKey(autoGenerate = true)
    val historyId: Long = 0,
    val mediaItemId: Long? = null,
    val libraryId: Long? = null,
    val filePath: String? = null,
    val title: String,
    val artist: String? = null,
    val album: String? = null,
    val durationMs: Long = 0,
    val listenedMs: Long = 0,
    val percentComplete: Float = 0f,
    val source: String = "LOCAL",
    val startedAt: Long = System.currentTimeMillis(),
    val completedAt: Long? = null
)

data class ListenHistoryTopItem(
    val mediaItemId: Long?,
    val title: String,
    val artist: String?,
    val playCount: Int,
    val lastPlayedAt: Long?
)

data class ListenHistoryDailyCount(
    val day: String,
    val playCount: Int
)
