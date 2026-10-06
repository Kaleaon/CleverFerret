package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 46 to 47.
 * Creates the pdf_ocr_cache table storing extracted OCR text keyed by file Hash and page index.
 */
val MIGRATION_46_47: Migration = object : Migration(46, 47) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL(
            "CREATE TABLE IF NOT EXISTS `pdf_ocr_cache` (" +
            "`fileHash` TEXT NOT NULL, " +
            "`pageIndex` INTEGER NOT NULL, " +
            "`text` TEXT NOT NULL, " +
            "`timestamp` INTEGER NOT NULL, " +
            "`fileSize` INTEGER NOT NULL DEFAULT 0, " +
            "`lastModified` INTEGER NOT NULL DEFAULT 0, " +
            "PRIMARY KEY(`fileHash`, `pageIndex`))"
        )
    }
}
