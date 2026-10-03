package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_35_36: Migration = object : Migration(35, 36) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS library_scan_settings (
                libraryId INTEGER NOT NULL PRIMARY KEY,
                includePaths TEXT NOT NULL DEFAULT '[]',
                excludePaths TEXT NOT NULL DEFAULT '[]',
                includeSubdirectories INTEGER NOT NULL DEFAULT 1,
                minFileSizeBytes INTEGER NOT NULL DEFAULT 0,
                minAudioDurationMs INTEGER NOT NULL DEFAULT 0,
                preventDuplicates INTEGER NOT NULL DEFAULT 1,
                deduplicationStrategy TEXT NOT NULL DEFAULT 'PATH',
                minListenPercent INTEGER NOT NULL DEFAULT 35,
                minListenSeconds INTEGER NOT NULL DEFAULT 30,
                lastUpdated INTEGER NOT NULL DEFAULT ${System.currentTimeMillis()}
            )
            """.trimIndent()
        )
          database.execSQL(
              """
              CREATE TABLE IF NOT EXISTS listen_history (
                  historyId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                  mediaItemId INTEGER,
                  libraryId INTEGER,
                  filePath TEXT,
                  title TEXT NOT NULL,
                  artist TEXT,
                  album TEXT,
                  durationMs INTEGER NOT NULL DEFAULT 0,
                  listenedMs INTEGER NOT NULL DEFAULT 0,
                  percentComplete REAL NOT NULL DEFAULT 0,
                  source TEXT NOT NULL DEFAULT 'LOCAL',
                  startedAt INTEGER NOT NULL,
                  completedAt INTEGER
              )
              """.trimIndent()
          )
          database.execSQL("CREATE INDEX IF NOT EXISTS index_listen_history_mediaItemId ON listen_history(mediaItemId)")
          database.execSQL("CREATE INDEX IF NOT EXISTS index_listen_history_libraryId ON listen_history(libraryId)")
          database.execSQL("CREATE INDEX IF NOT EXISTS index_listen_history_startedAt ON listen_history(startedAt)")
          database.execSQL("CREATE INDEX IF NOT EXISTS index_listen_history_completedAt ON listen_history(completedAt)")
    }
}

