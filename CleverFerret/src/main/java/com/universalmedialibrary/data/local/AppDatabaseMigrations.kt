package com.universalmedialibrary.data.local

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Database migrations for AppDatabase
 * 
 * CRITICAL: Always add migrations when incrementing database version
 * to prevent data loss on app upgrades.
 */
object AppDatabaseMigrations {
    
    /**
     * Migration from version 20 to 21
     */
    val MIGRATION_20_21 = object : Migration(20, 21) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Add any schema changes for version 21
        }
    }
    
    /**
     * Migration from version 21 to 22
     */
    val MIGRATION_21_22 = object : Migration(21, 22) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Add any schema changes for version 22
        }
    }
    
    /**
     * Migration from version 22 to 23
     * Adds comic panel detection and translation tables
     */
    val MIGRATION_22_23 = object : Migration(22, 23) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create comic_panels table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS comic_panels (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    comicId TEXT NOT NULL,
                    pageNumber INTEGER NOT NULL,
                    panelIndex INTEGER NOT NULL,
                    x REAL NOT NULL,
                    y REAL NOT NULL,
                    width REAL NOT NULL,
                    height REAL NOT NULL,
                    confidence REAL NOT NULL,
                    detectionMethod TEXT NOT NULL,
                    createdAt INTEGER NOT NULL
                )
            """.trimIndent())
            
            // Create unique index
            database.execSQL("""
                CREATE UNIQUE INDEX IF NOT EXISTS index_comic_panels_comicId_pageNumber_panelIndex 
                ON comic_panels (comicId, pageNumber, panelIndex)
            """.trimIndent())
            
            // Create comic_translations table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS comic_translations (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    panelId INTEGER NOT NULL,
                    originalText TEXT NOT NULL,
                    translatedText TEXT NOT NULL,
                    sourceLanguage TEXT NOT NULL,
                    targetLanguage TEXT NOT NULL,
                    bubbleX REAL NOT NULL,
                    bubbleY REAL NOT NULL,
                    bubbleWidth REAL NOT NULL,
                    bubbleHeight REAL NOT NULL,
                    confidence REAL NOT NULL,
                    createdAt INTEGER NOT NULL,
                    FOREIGN KEY(panelId) REFERENCES comic_panels(id) ON DELETE CASCADE
                )
            """.trimIndent())
            
            // Create comic_reading_sessions table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS comic_reading_sessions (
                    comicId TEXT PRIMARY KEY NOT NULL,
                    currentPage INTEGER NOT NULL,
                    currentPanel INTEGER NOT NULL,
                    totalPages INTEGER NOT NULL,
                    readingMode TEXT NOT NULL,
                    translationEnabled INTEGER NOT NULL,
                    targetLanguage TEXT NOT NULL,
                    lastReadAt INTEGER NOT NULL,
                    createdAt INTEGER NOT NULL
                )
            """.trimIndent())
        }
    }
    
    /**
     * Migration from version 23 to 24
     * Adds OPDS catalog support
     */
    val MIGRATION_23_24 = object : Migration(23, 24) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create opds_catalogs table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS opds_catalogs (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    url TEXT NOT NULL,
                    username TEXT,
                    password TEXT,
                    description TEXT,
                    iconUrl TEXT,
                    isDefault INTEGER NOT NULL,
                    isEnabled INTEGER NOT NULL,
                    lastAccessedAt INTEGER NOT NULL,
                    accessCount INTEGER NOT NULL,
                    opdsVersion TEXT NOT NULL,
                    searchUrl TEXT,
                    createdAt INTEGER NOT NULL,
                    updatedAt INTEGER NOT NULL
                )
            """.trimIndent())
            
            // Create opds_downloads table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS opds_downloads (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    catalogId INTEGER NOT NULL,
                    title TEXT NOT NULL,
                    authors TEXT NOT NULL,
                    downloadUrl TEXT NOT NULL,
                    localPath TEXT,
                    status TEXT NOT NULL,
                    progress INTEGER NOT NULL,
                    fileSize INTEGER NOT NULL,
                    downloadedBytes INTEGER NOT NULL,
                    mimeType TEXT,
                    coverUrl TEXT,
                    identifier TEXT,
                    publisher TEXT,
                    publishedDate TEXT,
                    language TEXT,
                    description TEXT,
                    createdAt INTEGER NOT NULL,
                    startedAt INTEGER,
                    completedAt INTEGER,
                    errorMessage TEXT,
                    FOREIGN KEY(catalogId) REFERENCES opds_catalogs(id) ON DELETE CASCADE
                )
            """.trimIndent())
        }
    }
    
    /**
     * Migration from version 24 to 25
     * Adds Comic Translation Cache table for Gemini AI translations
     */
    val MIGRATION_24_25 = object : Migration(24, 25) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create comic_translation_cache table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS comic_translation_cache (
                    pageId TEXT PRIMARY KEY NOT NULL,
                    comicId TEXT NOT NULL,
                    pageNumber INTEGER NOT NULL,
                    translationData TEXT NOT NULL,
                    targetLanguage TEXT NOT NULL,
                    cachedAt INTEGER NOT NULL
                )
            """.trimIndent())
            
            // Create index for faster queries by comicId
            database.execSQL("""
                CREATE INDEX IF NOT EXISTS index_comic_translation_cache_comicId 
                ON comic_translation_cache (comicId)
            """.trimIndent())
        }
    }
    
    /**
     * Migration from version 25 to 26
     * Adds settings tables for general, security, and API settings
     */
    val MIGRATION_25_26 = object : Migration(25, 26) {
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
    
    /**
     * Migration from version 26 to 27
     * Adds YAACC (DLNA/UPnP) server support
     */
    val MIGRATION_26_27 = object : Migration(26, 27) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create yaacc_servers table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS yaacc_servers (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    host TEXT NOT NULL,
                    port INTEGER NOT NULL DEFAULT 8200,
                    deviceType TEXT,
                    friendlyName TEXT,
                    manufacturer TEXT,
                    modelName TEXT,
                    udn TEXT,
                    lastSynced INTEGER NOT NULL DEFAULT 0,
                    isActive INTEGER NOT NULL DEFAULT 1,
                    dateAdded INTEGER NOT NULL
                )
            """.trimIndent())
            
            // Create unique index for host and port combination
            database.execSQL("""
                CREATE UNIQUE INDEX IF NOT EXISTS index_yaacc_servers_host_port 
                ON yaacc_servers (host, port)
            """.trimIndent())
        }
    }
    
    /**
     * Migration from version 27 to 28
     * Adds Calibre features: Fanfiction and Audiobook support
     */
    val MIGRATION_27_28 = object : Migration(27, 28) {
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

    val MIGRATION_28_29 = object : Migration(28, 29) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Migration 28 to 29 - Add search history support
            // This was already applied but migration object was missing
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS search_history (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    query TEXT NOT NULL,
                    timestamp INTEGER NOT NULL
                )
            """.trimIndent())
            
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS saved_searches (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    query TEXT NOT NULL,
                    created_at INTEGER NOT NULL
                )
            """.trimIndent())
        }
    }

    val MIGRATION_29_30 = object : Migration(29, 30) {
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
    
    /**
     * Migration from version 30 to 31
     * Adds ambient sound feature tables
     */
    val MIGRATION_30_31 = object : Migration(30, 31) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create ambient_sounds table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS ambient_sounds (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    category TEXT NOT NULL,
                    soundType TEXT NOT NULL,
                    audioResourcePath TEXT,
                    audioUrl TEXT,
                    iconType TEXT NOT NULL DEFAULT 'nature',
                    description TEXT NOT NULL DEFAULT '',
                    keywords TEXT NOT NULL,
                    volume REAL NOT NULL DEFAULT 0.5,
                    isEnabled INTEGER NOT NULL DEFAULT 1,
                    isFavorite INTEGER NOT NULL DEFAULT 0,
                    createdAt INTEGER NOT NULL,
                    updatedAt INTEGER NOT NULL
                )
            """.trimIndent())
            
            // Create ambient_playlists table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS ambient_playlists (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    description TEXT NOT NULL DEFAULT '',
                    soundIds TEXT NOT NULL,
                    autoSwitch INTEGER NOT NULL DEFAULT 0,
                    isActive INTEGER NOT NULL DEFAULT 0,
                    createdAt INTEGER NOT NULL,
                    updatedAt INTEGER NOT NULL
                )
            """.trimIndent())
            
            // Create ambient_reading_sessions table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS ambient_reading_sessions (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    mediaItemId INTEGER NOT NULL,
                    playlistId INTEGER,
                    activeSoundIds TEXT NOT NULL,
                    startTime INTEGER NOT NULL,
                    endTime INTEGER,
                    detectedContext TEXT,
                    manualOverride INTEGER NOT NULL DEFAULT 0
                )
            """.trimIndent())
        }
    }
    
    /**
     * Migration from version 31 to 32
     * Adds audio pack import feature tables
     */
    val MIGRATION_31_32 = object : Migration(31, 32) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create audio_packs table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS audio_packs (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    description TEXT NOT NULL DEFAULT '',
                    sourceZipPath TEXT NOT NULL,
                    extractedPath TEXT NOT NULL,
                    soundCount INTEGER NOT NULL DEFAULT 0,
                    totalSizeMB INTEGER NOT NULL DEFAULT 0,
                    importedAt INTEGER NOT NULL,
                    isEnabled INTEGER NOT NULL DEFAULT 1,
                    metadata TEXT NOT NULL
                )
            """.trimIndent())
            
            // Create audio_pack_sounds linking table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS audio_pack_sounds (
                    packId INTEGER NOT NULL,
                    soundId INTEGER NOT NULL,
                    PRIMARY KEY (packId, soundId)
                )
            """.trimIndent())
        }
    }

    val MIGRATION_32_33 = object : Migration(32, 33) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Add OCR cache table (from main branch)
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS ocr_cache (
                    id TEXT PRIMARY KEY NOT NULL,
                    mediaItemId TEXT NOT NULL,
                    pageNumber INTEGER NOT NULL DEFAULT 0,
                    text TEXT NOT NULL,
                    blocksJson TEXT NOT NULL,
                    confidence REAL NOT NULL DEFAULT 0.0,
                    timestamp INTEGER NOT NULL,
                    language TEXT NOT NULL DEFAULT 'en'
                )
            """.trimIndent())
            
            // Create indices for better query performance
            database.execSQL("""
                CREATE INDEX IF NOT EXISTS index_ocr_cache_mediaItemId 
                ON ocr_cache(mediaItemId)
            """.trimIndent())
            
            database.execSQL("""
                CREATE INDEX IF NOT EXISTS index_ocr_cache_mediaItemId_pageNumber 
                ON ocr_cache(mediaItemId, pageNumber)
            """.trimIndent())
            
            database.execSQL("""
                CREATE INDEX IF NOT EXISTS index_ocr_cache_timestamp 
                ON ocr_cache(timestamp)
            """.trimIndent())
        }
    }

    val MIGRATION_33_34 = object : Migration(33, 34) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Create collaborative_sessions table for playlist sharing
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS collaborative_sessions (
                    sessionId TEXT PRIMARY KEY NOT NULL,
                    name TEXT NOT NULL,
                    playlistId INTEGER NOT NULL,
                    hostDeviceId TEXT NOT NULL,
                    hostDeviceName TEXT NOT NULL,
                    sessionType TEXT NOT NULL,
                    status TEXT NOT NULL,
                    createdAt INTEGER NOT NULL,
                    startedAt INTEGER,
                    endedAt INTEGER,
                    maxClients INTEGER NOT NULL DEFAULT 10,
                    allowClientAdditions INTEGER NOT NULL DEFAULT 1,
                    allowClientVoting INTEGER NOT NULL DEFAULT 1,
                    requiresApproval INTEGER NOT NULL DEFAULT 0,
                    qrCodeData TEXT,
                    connectionPort INTEGER NOT NULL DEFAULT 8080,
                    castSessionId TEXT,
                    currentTrackIndex INTEGER NOT NULL DEFAULT 0,
                    isPlaying INTEGER NOT NULL DEFAULT 0
                )
            """.trimIndent())

            // Create session_clients table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS session_clients (
                    clientId TEXT PRIMARY KEY NOT NULL,
                    sessionId TEXT NOT NULL,
                    deviceName TEXT NOT NULL,
                    deviceType TEXT NOT NULL,
                    joinedAt INTEGER NOT NULL,
                    lastActiveAt INTEGER NOT NULL,
                    permissions TEXT NOT NULL,
                    isConnected INTEGER NOT NULL DEFAULT 1,
                    contributedTracks INTEGER NOT NULL DEFAULT 0,
                    votesUsed INTEGER NOT NULL DEFAULT 0,
                    FOREIGN KEY(sessionId) REFERENCES collaborative_sessions(sessionId) ON DELETE CASCADE
                )
            """.trimIndent())

            // Create session_queue_items table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS session_queue_items (
                    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    sessionId TEXT NOT NULL,
                    mediaItemId INTEGER NOT NULL,
                    addedBy TEXT NOT NULL,
                    position INTEGER NOT NULL,
                    votes INTEGER NOT NULL DEFAULT 0,
                    addedAt INTEGER NOT NULL,
                    playedAt INTEGER,
                    status TEXT NOT NULL,
                    approvedBy TEXT,
                    FOREIGN KEY(sessionId) REFERENCES collaborative_sessions(sessionId) ON DELETE CASCADE
                )
            """.trimIndent())

            // Create session_votes table
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS session_votes (
                    sessionId TEXT NOT NULL,
                    clientId TEXT NOT NULL,
                    queueItemId INTEGER NOT NULL,
                    voteType TEXT NOT NULL,
                    timestamp INTEGER NOT NULL,
                    PRIMARY KEY(sessionId, clientId, queueItemId),
                    FOREIGN KEY(sessionId) REFERENCES collaborative_sessions(sessionId) ON DELETE CASCADE
                )
            """.trimIndent())

            // Create indices for better query performance
            database.execSQL("""
                CREATE INDEX IF NOT EXISTS index_session_clients_sessionId 
                ON session_clients(sessionId)
            """.trimIndent())

            database.execSQL("""
                CREATE INDEX IF NOT EXISTS index_session_queue_items_sessionId 
                ON session_queue_items(sessionId)
            """.trimIndent())

            database.execSQL("""
                CREATE INDEX IF NOT EXISTS index_session_votes_sessionId 
                ON session_votes(sessionId)
            """.trimIndent())
        }
    }
}
