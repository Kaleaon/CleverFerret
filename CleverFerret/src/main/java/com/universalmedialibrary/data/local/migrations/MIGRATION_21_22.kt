package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 21 to 22
 * No-op: version bump only, no schema changes.
 */
internal val MIGRATION_21_22: Migration = object : Migration(21, 22) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // No schema changes — version bump only
    }
}

