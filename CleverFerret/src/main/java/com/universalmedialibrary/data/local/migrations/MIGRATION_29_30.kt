package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_29_30: Migration = object : Migration(29, 30) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Add enhanced reading features columns to reader_settings table
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN colorScheme TEXT NOT NULL DEFAULT 'Classic Day'
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rulerEnabled INTEGER NOT NULL DEFAULT 0
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rulerHeight INTEGER NOT NULL DEFAULT 60
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rulerColor TEXT NOT NULL DEFAULT '#808080'
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rulerAlpha REAL NOT NULL DEFAULT 0.3
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rulerPosition REAL NOT NULL DEFAULT 0.5
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rsvpEnabled INTEGER NOT NULL DEFAULT 0
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rsvpWpm INTEGER NOT NULL DEFAULT 250
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN rsvpFontSize INTEGER NOT NULL DEFAULT 32
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN autoScrollEnabled INTEGER NOT NULL DEFAULT 0
        """.trimIndent())
        
        database.execSQL("""
            ALTER TABLE reader_settings ADD COLUMN autoScrollSpeedMultiplier REAL NOT NULL DEFAULT 1.0
        """.trimIndent())
    }
}

