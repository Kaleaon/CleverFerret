package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration 49 -> 50:
 * 1. Creates `progress_sync_journal` table and indexes for immutable progress event tracking.
 * 2. Adds `sequenceNumber` and `vectorClock` columns to `reading_progress` table.
 */
val MIGRATION_49_50: Migration = object : Migration(49, 50) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS `progress_sync_journal` (
                `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                `itemId` TEXT NOT NULL,
                `position` INTEGER NOT NULL,
                `actionType` TEXT NOT NULL,
                `sequenceNumber` INTEGER NOT NULL,
                `vectorClock` TEXT NOT NULL,
                `createdAt` INTEGER NOT NULL,
                `isProcessed` INTEGER NOT NULL DEFAULT 0,
                `processedAt` INTEGER
            )
        """.trimIndent())

        database.execSQL("CREATE INDEX IF NOT EXISTS `index_progress_sync_journal_itemId` ON `progress_sync_journal`(`itemId`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_progress_sync_journal_isProcessed` ON `progress_sync_journal`(`isProcessed`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_progress_sync_journal_createdAt` ON `progress_sync_journal`(`createdAt`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_progress_sync_journal_itemId_sequenceNumber` ON `progress_sync_journal`(`itemId`, `sequenceNumber`)")

        database.execSQL("ALTER TABLE `reading_progress` ADD COLUMN `sequenceNumber` INTEGER NOT NULL DEFAULT 0")
        database.execSQL("ALTER TABLE `reading_progress` ADD COLUMN `vectorClock` TEXT NOT NULL DEFAULT '{}'")
    }
}
