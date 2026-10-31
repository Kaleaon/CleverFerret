package com.universalmedialibrary.data.local.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.UUID

/**
 * Entity representing an imported custom font file (TTF or OTF) stored in private app storage.
 */
@Entity(tableName = "custom_fonts")
data class CustomFontEntity(
    @PrimaryKey
    val id: String = UUID.randomUUID().toString(),
    @ColumnInfo(name = "displayName")
    val displayName: String,
    @ColumnInfo(name = "filePath")
    val filePath: String,
    @ColumnInfo(name = "importedAt")
    val importedAt: Long = System.currentTimeMillis()
)
