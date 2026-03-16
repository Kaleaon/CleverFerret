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
     * No-op: version bump only, no schema changes.
     */
    val MIGRATION_20_21 = object : Migration(20, 21) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // No schema changes — version bump only
        }
    }

    /**
     * Migration from version 21 to 22
     * No-op: version bump only, no schema changes.
     */
    val MIGRATION_21_22 = object : Migration(21, 22) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // No schema changes — version bump only
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

    val MIGRATION_34_35 = object : Migration(34, 35) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Add playback and user preference columns to media_items
            database.execSQL(
                """
                ALTER TABLE media_items ADD COLUMN isFavorite INTEGER NOT NULL DEFAULT 0
                """.trimIndent()
            )
            database.execSQL(
                """
                ALTER TABLE media_items ADD COLUMN playCount INTEGER NOT NULL DEFAULT 0
                """.trimIndent()
            )
            database.execSQL(
                """
                ALTER TABLE media_items ADD COLUMN lastPlayed INTEGER NOT NULL DEFAULT 0
                """.trimIndent()
            )
        }
    }

      val MIGRATION_35_36 = object : Migration(35, 36) {
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

        val MIGRATION_36_37 = object : Migration(36, 37) {
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

        val MIGRATION_37_38 = object : Migration(37, 38) {
            override fun migrate(database: SupportSQLiteDatabase) {
                database.execSQL(
                    """
                    ALTER TABLE reading_progress ADD COLUMN lastModified INTEGER NOT NULL DEFAULT ${System.currentTimeMillis()}
                    """.trimIndent()
                )
            }
        }

          val MIGRATION_38_39 = object : Migration(38, 39) {
              override fun migrate(database: SupportSQLiteDatabase) {
                  // Custom book sources
                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS book_sources (
                          sourceId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          sourceName TEXT NOT NULL,
                          sourceUrl TEXT NOT NULL,
                          sourceGroup TEXT,
                          sourceType TEXT NOT NULL,
                          enabled INTEGER NOT NULL DEFAULT 1,
                          enabledExplore INTEGER NOT NULL DEFAULT 1,
                          customOrder INTEGER NOT NULL DEFAULT 0,
                          weight INTEGER NOT NULL DEFAULT 0,
                          header TEXT,
                          loginUrl TEXT,
                          loginCheckJs TEXT,
                          enabledCookieJar INTEGER NOT NULL DEFAULT 1,
                          concurrentRate TEXT,
                          jsLib TEXT,
                          searchUrl TEXT,
                          searchRule TEXT,
                          exploreUrl TEXT,
                          exploreRule TEXT,
                          bookInfoRule TEXT,
                          tocRule TEXT,
                          contentRule TEXT,
                          bookSourceComment TEXT,
                          lastUpdateTime INTEGER NOT NULL,
                          respondTime INTEGER NOT NULL,
                          bookUrlPattern TEXT,
                          coverDecodeJs TEXT,
                          tags TEXT NOT NULL DEFAULT '[]'
                      )
                      """.trimIndent()
                  )

                  // Book chapters
                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS book_chapters (
                          chapterId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          bookId INTEGER NOT NULL,
                          chapterIndex INTEGER NOT NULL,
                          chapterName TEXT NOT NULL,
                          chapterUrl TEXT,
                          content TEXT,
                          contentCached INTEGER NOT NULL DEFAULT 0,
                          wordCount INTEGER NOT NULL DEFAULT 0,
                          isVolume INTEGER NOT NULL DEFAULT 0,
                          isVip INTEGER NOT NULL DEFAULT 0,
                          isPay INTEGER NOT NULL DEFAULT 0,
                          updateTime INTEGER NOT NULL,
                          lastReadTime INTEGER,
                          readProgress REAL NOT NULL DEFAULT 0,
                          isRead INTEGER NOT NULL DEFAULT 0,
                          FOREIGN KEY(bookId) REFERENCES media_items(itemId) ON DELETE CASCADE
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_book_chapters_bookId ON book_chapters(bookId)")
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_book_chapters_chapterIndex ON book_chapters(chapterIndex)")

                  // Enhanced annotations
                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS enhanced_annotations (
                          annotationId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          itemId INTEGER NOT NULL,
                          text TEXT NOT NULL,
                          note TEXT,
                          quote TEXT,
                          chapterId INTEGER,
                          chapterName TEXT,
                          pageNumber INTEGER,
                          position REAL NOT NULL DEFAULT 0,
                          colorTag TEXT NOT NULL,
                          stylePreset TEXT NOT NULL,
                          createdAt INTEGER NOT NULL,
                          modifiedAt INTEGER NOT NULL,
                          aiSummary TEXT,
                          aiTranslation TEXT,
                          aiInsights TEXT,
                          tags TEXT NOT NULL DEFAULT '[]',
                          FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_enhanced_annotations_itemId ON enhanced_annotations(itemId)")
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_enhanced_annotations_createdAt ON enhanced_annotations(createdAt)")
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_enhanced_annotations_colorTag ON enhanced_annotations(colorTag)")

                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS annotation_cards (
                          cardId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          annotationId INTEGER NOT NULL,
                          template TEXT NOT NULL,
                          backgroundColor INTEGER NOT NULL,
                          textColor INTEGER NOT NULL,
                          accentColor INTEGER NOT NULL,
                          includeBookCover INTEGER NOT NULL DEFAULT 1,
                          includeBookTitle INTEGER NOT NULL DEFAULT 1,
                          includeAuthor INTEGER NOT NULL DEFAULT 1,
                          includeTimestamp INTEGER NOT NULL DEFAULT 0,
                          imageUrl TEXT,
                          generatedAt INTEGER NOT NULL,
                          FOREIGN KEY(annotationId) REFERENCES enhanced_annotations(annotationId) ON DELETE CASCADE
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_annotation_cards_annotationId ON annotation_cards(annotationId)")

                  // Reading analytics
                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS reading_analytics (
                          analyticsId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          itemId INTEGER NOT NULL,
                          date TEXT NOT NULL,
                          readingTimeSeconds INTEGER NOT NULL DEFAULT 0,
                          pagesRead INTEGER NOT NULL DEFAULT 0,
                          wordsRead INTEGER NOT NULL DEFAULT 0,
                          sessionCount INTEGER NOT NULL DEFAULT 0,
                          averageSessionDuration INTEGER NOT NULL DEFAULT 0,
                          firstReadTime INTEGER NOT NULL,
                          lastReadTime INTEGER NOT NULL,
                          FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_analytics_itemId ON reading_analytics(itemId)")
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_analytics_date ON reading_analytics(date)")

                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS reading_session_logs (
                          sessionId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          itemId INTEGER NOT NULL,
                          startTime INTEGER NOT NULL,
                          endTime INTEGER,
                          durationSeconds INTEGER NOT NULL DEFAULT 0,
                          startProgress REAL NOT NULL DEFAULT 0,
                          endProgress REAL NOT NULL DEFAULT 0,
                          pagesRead INTEGER NOT NULL DEFAULT 0,
                          wordsRead INTEGER NOT NULL DEFAULT 0,
                          deviceInfo TEXT,
                          FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_session_logs_itemId ON reading_session_logs(itemId)")
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_session_logs_startTime ON reading_session_logs(startTime)")

                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS ai_book_insights (
                          insightId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          itemId INTEGER NOT NULL,
                          insightType TEXT NOT NULL,
                          summary TEXT,
                          mindMap TEXT,
                          keyThemes TEXT NOT NULL DEFAULT '[]',
                          characterAnalysis TEXT,
                          perspectiveAnalysis TEXT,
                          generatedAt INTEGER NOT NULL,
                          modelUsed TEXT,
                          confidence REAL NOT NULL DEFAULT 0,
                          FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_ai_book_insights_itemId ON ai_book_insights(itemId)")

                  // Audio waveforms
                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS audio_waveforms (
                          waveformId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          itemId INTEGER NOT NULL,
                          sampleData BLOB NOT NULL,
                          totalSamples INTEGER NOT NULL,
                          sampleRate INTEGER NOT NULL,
                          channels INTEGER NOT NULL,
                          duration INTEGER NOT NULL,
                          bitDepth INTEGER NOT NULL DEFAULT 16,
                          zoomLevel REAL NOT NULL DEFAULT 1.0,
                          renderQuality TEXT NOT NULL,
                          generatedAt INTEGER NOT NULL,
                          fileHash TEXT,
                          version INTEGER NOT NULL DEFAULT 1,
                          FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_audio_waveforms_itemId ON audio_waveforms(itemId)")

                  // Multi-room audio sync
                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS audio_sync_servers (
                          serverId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          serverName TEXT NOT NULL,
                          serverUrl TEXT NOT NULL,
                          port INTEGER NOT NULL DEFAULT 1704,
                          enabled INTEGER NOT NULL DEFAULT 1,
                          isLocalServer INTEGER NOT NULL DEFAULT 0,
                          codec TEXT NOT NULL,
                          sampleRate INTEGER NOT NULL DEFAULT 48000,
                          bitDepth INTEGER NOT NULL DEFAULT 16,
                          channels INTEGER NOT NULL DEFAULT 2,
                          bufferMs INTEGER NOT NULL DEFAULT 1000,
                          latencyMs INTEGER NOT NULL DEFAULT 0,
                          lastConnected INTEGER,
                          createdAt INTEGER NOT NULL
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_audio_sync_servers_serverName ON audio_sync_servers(serverName)")

                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS audio_sync_clients (
                          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          serverId INTEGER NOT NULL,
                          clientId TEXT NOT NULL,
                          clientName TEXT NOT NULL,
                          enabled INTEGER NOT NULL DEFAULT 1,
                          volume INTEGER NOT NULL DEFAULT 100,
                          muted INTEGER NOT NULL DEFAULT 0,
                          latencyMs INTEGER NOT NULL DEFAULT 0,
                          groupId INTEGER,
                          connected INTEGER NOT NULL DEFAULT 0,
                          lastSeen INTEGER,
                          deviceType TEXT,
                          osVersion TEXT,
                          appVersion TEXT
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_audio_sync_clients_serverId ON audio_sync_clients(serverId)")
                  database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_audio_sync_clients_clientId ON audio_sync_clients(clientId)")

                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS audio_sync_groups (
                          groupId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          serverId INTEGER NOT NULL,
                          groupName TEXT NOT NULL,
                          enabled INTEGER NOT NULL DEFAULT 1,
                          volume INTEGER NOT NULL DEFAULT 100,
                          muted INTEGER NOT NULL DEFAULT 0,
                          streamId TEXT,
                          createdAt INTEGER NOT NULL
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_audio_sync_groups_serverId ON audio_sync_groups(serverId)")

                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS audio_streams (
                          streamId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          serverId INTEGER NOT NULL,
                          streamName TEXT NOT NULL,
                          streamType TEXT NOT NULL,
                          sourceUri TEXT NOT NULL,
                          codec TEXT NOT NULL,
                          sampleRate INTEGER NOT NULL DEFAULT 48000,
                          bitDepth INTEGER NOT NULL DEFAULT 16,
                          channels INTEGER NOT NULL DEFAULT 2,
                          enabled INTEGER NOT NULL DEFAULT 1,
                          playing INTEGER NOT NULL DEFAULT 0,
                          createdAt INTEGER NOT NULL
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_audio_streams_serverId ON audio_streams(serverId)")

                  database.execSQL(
                      """
                      CREATE TABLE IF NOT EXISTS sync_statistics (
                          statId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                          clientId TEXT NOT NULL,
                          timestamp INTEGER NOT NULL,
                          timeDeviationMs REAL NOT NULL DEFAULT 0,
                          bufferLevel INTEGER NOT NULL DEFAULT 0,
                          droppedFrames INTEGER NOT NULL DEFAULT 0,
                          latencyMs INTEGER NOT NULL DEFAULT 0,
                          jitterMs REAL NOT NULL DEFAULT 0,
                          packetLoss REAL NOT NULL DEFAULT 0
                      )
                      """.trimIndent()
                  )
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_sync_statistics_clientId ON sync_statistics(clientId)")
                  database.execSQL("CREATE INDEX IF NOT EXISTS index_sync_statistics_timestamp ON sync_statistics(timestamp)")
              }
          }

    /**
     * Migration from version 42 to 43
     * Adds enhanced tag system with hierarchies, synonyms, categories,
     * and smart collection rules for auto-suggested playlists and groupings
     */
    val MIGRATION_42_43 = object : Migration(42, 43) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Tag Hierarchies (parent-child relationships)
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS tag_hierarchies (
                    hierarchyId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    parentTagId INTEGER NOT NULL,
                    childTagId INTEGER NOT NULL,
                    depth INTEGER NOT NULL DEFAULT 1,
                    FOREIGN KEY(parentTagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE,
                    FOREIGN KEY(childTagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_hierarchies_parentTagId ON tag_hierarchies(parentTagId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_hierarchies_childTagId ON tag_hierarchies(childTagId)")
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_tag_hierarchies_parent_child ON tag_hierarchies(parentTagId, childTagId)")

            // Tag Synonyms
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS tag_synonyms (
                    synonymId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    primaryTagId INTEGER NOT NULL,
                    synonymName TEXT NOT NULL,
                    languageCode TEXT,
                    isOfficial INTEGER NOT NULL DEFAULT 0,
                    FOREIGN KEY(primaryTagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_synonyms_primaryTagId ON tag_synonyms(primaryTagId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_synonyms_synonymName ON tag_synonyms(synonymName)")
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_tag_synonyms_primary_name ON tag_synonyms(primaryTagId, synonymName)")

            // Tag Categories
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS tag_categories (
                    categoryId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    displayName TEXT NOT NULL,
                    description TEXT,
                    color TEXT,
                    iconName TEXT,
                    displayOrder INTEGER NOT NULL DEFAULT 0,
                    isSystemCategory INTEGER NOT NULL DEFAULT 0,
                    isMutuallyExclusive INTEGER NOT NULL DEFAULT 0
                )
            """.trimIndent())
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_tag_categories_name ON tag_categories(name)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_categories_displayOrder ON tag_categories(displayOrder)")

            // Tag Category Assignments
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS tag_category_assignments (
                    assignmentId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    tagId INTEGER NOT NULL,
                    categoryId INTEGER NOT NULL,
                    FOREIGN KEY(tagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE,
                    FOREIGN KEY(categoryId) REFERENCES tag_categories(categoryId) ON DELETE CASCADE
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_category_assignments_tagId ON tag_category_assignments(tagId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_category_assignments_categoryId ON tag_category_assignments(categoryId)")
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_tag_category_assignments_tag_cat ON tag_category_assignments(tagId, categoryId)")

            // Smart Tag Rules
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS smart_tag_rules (
                    ruleId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    tagId INTEGER NOT NULL,
                    name TEXT NOT NULL,
                    description TEXT,
                    ruleType TEXT NOT NULL,
                    matchField TEXT NOT NULL,
                    matchPattern TEXT NOT NULL,
                    isRegex INTEGER NOT NULL DEFAULT 0,
                    caseSensitive INTEGER NOT NULL DEFAULT 0,
                    applicableMediaTypes TEXT,
                    isEnabled INTEGER NOT NULL DEFAULT 1,
                    priority INTEGER NOT NULL DEFAULT 0,
                    createdAt INTEGER NOT NULL,
                    applyCount INTEGER NOT NULL DEFAULT 0,
                    FOREIGN KEY(tagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_tag_rules_tagId ON smart_tag_rules(tagId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_tag_rules_isEnabled ON smart_tag_rules(isEnabled)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_tag_rules_priority ON smart_tag_rules(priority)")

            // Tag Analytics
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS tag_analytics (
                    analyticsId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    tagId INTEGER NOT NULL,
                    period TEXT NOT NULL,
                    newTaggings INTEGER NOT NULL DEFAULT 0,
                    searchCount INTEGER NOT NULL DEFAULT 0,
                    filterCount INTEGER NOT NULL DEFAULT 0,
                    avgEngagementTime INTEGER NOT NULL DEFAULT 0,
                    FOREIGN KEY(tagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_analytics_tagId ON tag_analytics(tagId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_tag_analytics_period ON tag_analytics(period)")
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_tag_analytics_tag_period ON tag_analytics(tagId, period)")

            // Related Tags
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS related_tags (
                    relationId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    tagId INTEGER NOT NULL,
                    relatedTagId INTEGER NOT NULL,
                    relationType TEXT NOT NULL,
                    relationStrength REAL NOT NULL DEFAULT 0.5,
                    isAutoDiscovered INTEGER NOT NULL DEFAULT 1,
                    coOccurrenceCount INTEGER NOT NULL DEFAULT 0,
                    FOREIGN KEY(tagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE,
                    FOREIGN KEY(relatedTagId) REFERENCES unified_tags(tagId) ON DELETE CASCADE
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_related_tags_tagId ON related_tags(tagId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_related_tags_relatedTagId ON related_tags(relatedTagId)")
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_related_tags_pair ON related_tags(tagId, relatedTagId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_related_tags_strength ON related_tags(relationStrength)")

            // Smart Collection Rules
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS smart_collection_rules (
                    ruleId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    name TEXT NOT NULL,
                    collectionType TEXT NOT NULL,
                    description TEXT,
                    queryRules TEXT NOT NULL,
                    targetMediaTypes TEXT,
                    maxItems INTEGER,
                    sortBy TEXT NOT NULL DEFAULT 'dateAdded',
                    sortDescending INTEGER NOT NULL DEFAULT 1,
                    isEnabled INTEGER NOT NULL DEFAULT 1,
                    refreshInterval INTEGER NOT NULL DEFAULT 0,
                    lastRefreshed INTEGER NOT NULL DEFAULT 0,
                    currentItemCount INTEGER NOT NULL DEFAULT 0,
                    coverStrategy TEXT NOT NULL DEFAULT 'FIRST_ITEM',
                    customCoverPath TEXT,
                    isSystemGenerated INTEGER NOT NULL DEFAULT 0,
                    displayPriority INTEGER NOT NULL DEFAULT 0,
                    createdAt INTEGER NOT NULL
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_collection_rules_name ON smart_collection_rules(name)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_collection_rules_type ON smart_collection_rules(collectionType)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_collection_rules_enabled ON smart_collection_rules(isEnabled)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_collection_rules_lastRefreshed ON smart_collection_rules(lastRefreshed)")

            // Smart Collection Cache
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS smart_collection_cache (
                    cacheId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    ruleId INTEGER NOT NULL,
                    itemId INTEGER NOT NULL,
                    sortOrder INTEGER NOT NULL DEFAULT 0,
                    matchScore REAL NOT NULL DEFAULT 1.0,
                    cachedAt INTEGER NOT NULL,
                    FOREIGN KEY(ruleId) REFERENCES smart_collection_rules(ruleId) ON DELETE CASCADE
                )
            """.trimIndent())
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_collection_cache_ruleId ON smart_collection_cache(ruleId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_collection_cache_itemId ON smart_collection_cache(itemId)")
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_smart_collection_cache_rule_item ON smart_collection_cache(ruleId, itemId)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_smart_collection_cache_sortOrder ON smart_collection_cache(sortOrder)")

            // Dismissed Suggestions
            database.execSQL("""
                CREATE TABLE IF NOT EXISTS dismissed_suggestions (
                    dismissalId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                    suggestionKey TEXT NOT NULL,
                    dismissedAt INTEGER NOT NULL,
                    reason TEXT
                )
            """.trimIndent())
            database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_dismissed_suggestions_key ON dismissed_suggestions(suggestionKey)")
            database.execSQL("CREATE INDEX IF NOT EXISTS index_dismissed_suggestions_dismissedAt ON dismissed_suggestions(dismissedAt)")

            // Insert default tag categories
            database.execSQL("""
                INSERT INTO tag_categories (name, displayName, description, color, displayOrder, isSystemCategory) VALUES
                ('genre', 'Genre', 'Content genre categories', '#4CAF50', 1, 1),
                ('mood', 'Mood', 'Emotional tone or atmosphere', '#2196F3', 2, 1),
                ('theme', 'Theme', 'Central themes and topics', '#9C27B0', 3, 1),
                ('content_warning', 'Content Warning', 'Content advisories', '#F44336', 4, 1),
                ('status', 'Status', 'Reading/viewing status', '#FF9800', 5, 1)
            """.trimIndent())
        }
    }
}
