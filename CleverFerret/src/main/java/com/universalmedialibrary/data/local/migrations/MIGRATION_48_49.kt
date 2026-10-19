package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from database version 48 to 49.
 * Adds custom_fonts table for imported custom TTF/OTF font registry.
 */
val MIGRATION_48_49: Migration = object : Migration(48, 49) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS `custom_fonts` (
                `id` TEXT NOT NULL,
                `displayName` TEXT NOT NULL,
                `filePath` TEXT NOT NULL,
                `importedAt` INTEGER NOT NULL,
                PRIMARY KEY(`id`)
            )
        """.trimIndent())
    }
}
