package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from database version 48 to 49.
 * Adds the `crdt_operation_journal` table for operation-based delta CRDT syncing.
 */
val MIGRATION_48_49: Migration = object : Migration(48, 49) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS `crdt_operation_journal` (
                `operationId` TEXT NOT NULL,
                `entityId` TEXT NOT NULL,
                `entityType` TEXT NOT NULL,
                `fieldPath` TEXT NOT NULL,
                `operationType` TEXT NOT NULL,
                `valueJson` TEXT,
                `elementId` TEXT,
                `deviceId` TEXT NOT NULL,
                `lamportTimestamp` INTEGER NOT NULL,
                `wallTimestamp` INTEGER NOT NULL,
                `isSynced` INTEGER NOT NULL,
                `isCompacted` INTEGER NOT NULL,
                PRIMARY KEY(`operationId`)
            )
        """.trimIndent())

        database.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_entityId_fieldPath` " +
                "ON `crdt_operation_journal` (`entityId`, `fieldPath`)"
        )
        database.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_lamportTimestamp` " +
                "ON `crdt_operation_journal` (`lamportTimestamp`)"
        )
        database.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_isSynced` " +
                "ON `crdt_operation_journal` (`isSynced`)"
        )
        database.execSQL(
            "CREATE INDEX IF NOT EXISTS `index_crdt_operation_journal_isCompacted` " +
                "ON `crdt_operation_journal` (`isCompacted`)"
        )
    }
}
