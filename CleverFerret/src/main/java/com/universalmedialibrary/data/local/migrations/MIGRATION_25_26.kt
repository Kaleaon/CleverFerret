package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 25 to 26
 * Adds settings tables for general, security, and API settings
 */
internal val MIGRATION_25_26: Migration = object : Migration(25, 26) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create general_settings table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS general_settings (
                id INTEGER PRIMARY KEY NOT NULL,
                languageCode TEXT NOT NULL,
                themeMode TEXT NOT NULL,
                themePalette TEXT NOT NULL,
                defaultFontSize INTEGER NOT NULL,
                useDynamicColors INTEGER NOT NULL,
                enableAnimations INTEGER NOT NULL,
                autoPlayNext INTEGER NOT NULL,
                defaultPlaybackSpeed REAL NOT NULL,
                rememberPlaybackPosition INTEGER NOT NULL,
                skipIntroSeconds INTEGER NOT NULL,
                skipOutroSeconds INTEGER NOT NULL,
                lastUpdated INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Create security_settings table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS security_settings (
                id INTEGER PRIMARY KEY NOT NULL,
                requireBiometric INTEGER NOT NULL,
                lockTimeoutMinutes INTEGER NOT NULL,
                allowScreenshots INTEGER NOT NULL,
                hideInRecents INTEGER NOT NULL,
                requireAuthForContentChanges INTEGER NOT NULL,
                lastUpdated INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Create api_settings table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS api_settings (
                serviceId TEXT PRIMARY KEY NOT NULL,
                isConfigured INTEGER NOT NULL,
                hasApiKey INTEGER NOT NULL,
                providerName TEXT NOT NULL,
                category TEXT NOT NULL,
                description TEXT NOT NULL,
                model TEXT,
                voiceId TEXT,
                region TEXT,
                rateLimit INTEGER,
                priority INTEGER NOT NULL,
                enabled INTEGER NOT NULL,
                lastUsed INTEGER NOT NULL,
                usageCount INTEGER NOT NULL,
                apiKeyUrl TEXT NOT NULL,
                docsUrl TEXT NOT NULL,
                createdAt INTEGER NOT NULL,
                updatedAt INTEGER NOT NULL
            )
        """.trimIndent())
        
        // Insert default general settings
        database.execSQL("""
            INSERT INTO general_settings VALUES (
                1, 'en', 'auto', 'BURGUNDY_ROSE_GOLD', 16, 1, 1, 1, 1.0, 1, 0, 0, ${System.currentTimeMillis()}
            )
        """.trimIndent())
        
        // Insert default security settings
        database.execSQL("""
            INSERT INTO security_settings VALUES (
                1, 0, 5, 1, 0, 0, ${System.currentTimeMillis()}
            )
        """.trimIndent())
    }
}

