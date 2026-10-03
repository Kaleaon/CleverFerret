package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_37_38: Migration = object : Migration(37, 38) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            ALTER TABLE reading_progress ADD COLUMN lastModified INTEGER NOT NULL DEFAULT ${System.currentTimeMillis()}
            """.trimIndent()
        )
    }
}

