package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

internal val MIGRATION_38_39: Migration = object : Migration(38, 39) {
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

