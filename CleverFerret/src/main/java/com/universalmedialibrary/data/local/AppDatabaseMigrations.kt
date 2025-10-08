package com.universalmedialibrary.data.local

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Database migrations for AppDatabase
 * Preserves user data across schema changes
 */
object AppDatabaseMigrations {

    /**
     * Migration from version 20 to 21
     * Adds: DownloadedStory, StoryUpdate, and PlexServer entities
     */
    val MIGRATION_20_21 = object : Migration(20, 21) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create DownloadedStory table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS `downloaded_stories` (
                    `id` TEXT NOT NULL PRIMARY KEY,
                    `url` TEXT NOT NULL,
                    `title` TEXT NOT NULL,
                    `author` TEXT,
                    `summary` TEXT,
                    `totalChapters` INTEGER NOT NULL,
                    `downloadedChapters` INTEGER NOT NULL,
                    `lastChapter` INTEGER NOT NULL,
                    `isCompleted` INTEGER NOT NULL DEFAULT 0,
                    `autoUpdateEnabled` INTEGER NOT NULL DEFAULT 1,
                    `lastChecked` INTEGER,
                    `downloadedDate` INTEGER NOT NULL,
                    `lastReadChapter` INTEGER NOT NULL DEFAULT 0,
                    `lastReadPosition` INTEGER NOT NULL DEFAULT 0,
                    `rating` REAL,
                    `tags` TEXT
                )
            """.trimIndent())

            // Create StoryUpdate table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS `story_updates` (
                    `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    `storyId` TEXT NOT NULL,
                    `previousChapterCount` INTEGER NOT NULL,
                    `newChapterCount` INTEGER NOT NULL,
                    `checkDate` INTEGER NOT NULL,
                    `wasNotified` INTEGER NOT NULL DEFAULT 0,
                    FOREIGN KEY(`storyId`) REFERENCES `downloaded_stories`(`id`) ON DELETE CASCADE
                )
            """.trimIndent())

            // Create index for story updates
            database.execSQL("""
                CREATE INDEX IF NOT EXISTS `index_story_updates_storyId`
                ON `story_updates` (`storyId`)
            """.trimIndent())

            // Create PlexServer table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS `plex_servers` (
                    `serverId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    `name` TEXT NOT NULL,
                    `host` TEXT NOT NULL,
                    `port` INTEGER NOT NULL DEFAULT 32400,
                    `token` TEXT NOT NULL,
                    `machineIdentifier` TEXT,
                    `version` TEXT,
                    `isActive` INTEGER NOT NULL DEFAULT 1,
                    `lastConnected` INTEGER NOT NULL DEFAULT 0,
                    `lastSynced` INTEGER NOT NULL DEFAULT 0,
                    `dateAdded` INTEGER NOT NULL
                )
            """.trimIndent())
        }
    }
}
