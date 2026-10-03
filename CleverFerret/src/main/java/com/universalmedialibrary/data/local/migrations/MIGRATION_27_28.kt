package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 27 to 28
 * Adds Calibre features: Fanfiction and Audiobook support
 */
internal val MIGRATION_27_28: Migration = object : Migration(27, 28) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create fanfiction_stories table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS fanfiction_stories (
                id TEXT PRIMARY KEY NOT NULL,
                url TEXT NOT NULL,
                title TEXT NOT NULL,
                author TEXT,
                summary TEXT,
                site_name TEXT NOT NULL,
                word_count INTEGER NOT NULL DEFAULT 0,
                chapter_count INTEGER NOT NULL DEFAULT 0,
                completion_status TEXT NOT NULL,
                rating TEXT,
                language TEXT NOT NULL DEFAULT 'en',
                genre TEXT,
                characters TEXT,
                tags TEXT NOT NULL,
                cover_url TEXT,
                date_published INTEGER,
                date_updated INTEGER,
                date_downloaded INTEGER NOT NULL,
                last_checked INTEGER NOT NULL,
                local_epub_path TEXT,
                has_updates INTEGER NOT NULL DEFAULT 0
            )
        """.trimIndent())
        
        // Create indices for fanfiction_stories
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_fanfiction_stories_site_name 
            ON fanfiction_stories(site_name)
        """.trimIndent())
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_fanfiction_stories_completion_status 
            ON fanfiction_stories(completion_status)
        """.trimIndent())
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_fanfiction_stories_date_updated 
            ON fanfiction_stories(date_updated)
        """.trimIndent())
        
        // Create audiobooks table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audiobooks (
                id TEXT PRIMARY KEY NOT NULL,
                filePath TEXT NOT NULL,
                title TEXT NOT NULL,
                author TEXT,
                narrator TEXT,
                description TEXT,
                genre TEXT,
                publisher TEXT,
                publishDate TEXT,
                duration INTEGER NOT NULL,
                bitrate INTEGER,
                sampleRate INTEGER,
                codec TEXT,
                coverPath TEXT,
                chapterCount INTEGER NOT NULL DEFAULT 0,
                chapters TEXT NOT NULL,
                language TEXT NOT NULL DEFAULT 'en',
                lastPlayedPosition INTEGER NOT NULL DEFAULT 0,
                isFinished INTEGER NOT NULL DEFAULT 0,
                dateAdded INTEGER NOT NULL,
                lastPlayed INTEGER
            )
        """.trimIndent())
        
        // Create indices for audiobooks
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_author 
            ON audiobooks(author)
        """.trimIndent())
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_genre 
            ON audiobooks(genre)
        """.trimIndent())
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_dateAdded 
            ON audiobooks(dateAdded)
        """.trimIndent())
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_isFinished 
            ON audiobooks(isFinished)
        """.trimIndent())
    }
}

