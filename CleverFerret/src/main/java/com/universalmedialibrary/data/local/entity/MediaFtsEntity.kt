package com.universalmedialibrary.data.local.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Fts4
import androidx.room.PrimaryKey

/**
 * FTS Virtual Table Entity for high-performance offline multi-format search
 */
@Entity(tableName = "media_fts")
@Fts4
data class MediaFtsEntity(
    @PrimaryKey
    @ColumnInfo(name = "rowid")
    val rowid: Int,

    @ColumnInfo(name = "title")
    val title: String = "",

    @ColumnInfo(name = "creator")
    val creator: String = "",

    @ColumnInfo(name = "series")
    val series: String = "",

    @ColumnInfo(name = "tags")
    val tags: String = "",

    @ColumnInfo(name = "summary")
    val summary: String = "",

    @ColumnInfo(name = "media_type")
    val mediaType: String = "",

    @ColumnInfo(name = "item_id")
    val itemId: Long = 0L,

    @ColumnInfo(name = "item_source")
    val itemSource: String = "LOCAL"
)
