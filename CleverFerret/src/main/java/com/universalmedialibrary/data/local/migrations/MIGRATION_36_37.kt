package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_36_37: Migration = object : Migration(36, 37) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            ALTER TABLE metadata_music_track ADD COLUMN waveformData BLOB
            """.trimIndent()
        )
        database.execSQL(
            """
            ALTER TABLE metadata_music_track ADD COLUMN waveformSampleCount INTEGER NOT NULL DEFAULT 0
            """.trimIndent()
        )
        database.execSQL(
            """
            ALTER TABLE metadata_music_track ADD COLUMN waveformFrameDurationMs INTEGER NOT NULL DEFAULT 20
            """.trimIndent()
        )
        database.execSQL(
            """
            ALTER TABLE metadata_music_track ADD COLUMN waveformOffsetMs INTEGER NOT NULL DEFAULT 0
            """.trimIndent()
        )
        database.execSQL(
            """
            ALTER TABLE metadata_music_track ADD COLUMN waveformGeneratedAt INTEGER
            """.trimIndent()
        )
        database.execSQL(
            """
            ALTER TABLE metadata_music_track ADD COLUMN waveformVersion INTEGER NOT NULL DEFAULT 1
            """.trimIndent()
        )
    }
}

