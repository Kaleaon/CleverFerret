package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 43 to 44
 * Adds checksum persistence for downloaded podcast files.
 */
internal val MIGRATION_43_44: Migration = object : Migration(43, 44) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL(
            "ALTER TABLE podcast_episodes ADD COLUMN localFileChecksum TEXT"
        )
    }
}

