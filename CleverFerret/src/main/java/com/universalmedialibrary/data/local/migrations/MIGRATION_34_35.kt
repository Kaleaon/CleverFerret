package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_34_35: Migration = object : Migration(34, 35) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Add playback and user preference columns to media_items
        database.execSQL(
            """
            ALTER TABLE media_items ADD COLUMN isFavorite INTEGER NOT NULL DEFAULT 0
            """.trimIndent()
        )
        database.execSQL(
            """
            ALTER TABLE media_items ADD COLUMN playCount INTEGER NOT NULL DEFAULT 0
            """.trimIndent()
        )
        database.execSQL(
            """
            ALTER TABLE media_items ADD COLUMN lastPlayed INTEGER NOT NULL DEFAULT 0
            """.trimIndent()
        )
    }
}

