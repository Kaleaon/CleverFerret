package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 46 to 47
 * Adds Room FTS4 virtual table (`media_fts`) with automated database triggers
 * for offline multi-format full-text search across books, movies, music, and synced items,
 * and adds media_cache_items table for managing media stream caching and background download queue.
 */
internal val MIGRATION_46_47: Migration = object : Migration(46, 47) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // 1. Create FTS virtual table
        database.execSQL("""
            CREATE VIRTUAL TABLE IF NOT EXISTS `media_fts` USING fts4(
                `title`,
                `creator`,
                `series`,
                `tags`,
                `summary`,
                `media_type`,
                `item_id` UNINDEXED,
                `item_source` UNINDEXED,
                tokenize=unicode61
            );
        """.trimIndent())

        // 2. Populate initial index from existing media items
        database.execSQL("""
            INSERT INTO media_fts(rowid, title, creator, series, tags, summary, media_type, item_id, item_source)
            SELECT
                mi.itemId AS rowid,
                COALESCE(mc.title, mi.fileName) AS title,
                COALESCE(
                    (SELECT group_concat(p.name, ', ') FROM item_person_role ipr JOIN people p ON ipr.personId = p.personId WHERE ipr.itemId = mi.itemId),
                    mt.artist,
                    mb.additionalAuthors
                ) AS creator,
                COALESCE(mb.series, mt.album, mm.franchise, mm.collection) AS series,
                (SELECT group_concat(ut.name, ' ') FROM item_tags it JOIN unified_tags ut ON it.tagId = ut.tagId WHERE it.itemId = mi.itemId) AS tags,
                COALESCE(mc.summary, mc.plot, mb.notes) AS summary,
                mi.mediaType AS media_type,
                mi.itemId AS item_id,
                'LOCAL' AS item_source
            FROM media_items mi
            LEFT JOIN metadata_common mc ON mi.itemId = mc.itemId
            LEFT JOIN metadata_book mb ON mi.itemId = mb.itemId
            LEFT JOIN metadata_music_track mt ON mi.itemId = mt.itemId
            LEFT JOIN metadata_movie mm ON mi.itemId = mm.itemId;
        """.trimIndent())

        // 3. Populate initial index from existing synced Plex items (if not linked to local)
        database.execSQL("""
            INSERT INTO media_fts(rowid, title, creator, series, tags, summary, media_type, item_id, item_source)
            SELECT
                1000000000 + pmi.id AS rowid,
                pmi.title AS title,
                pmi.libraryName AS creator,
                NULL AS series,
                'plex' AS tags,
                pmi.libraryName AS summary,
                pmi.type AS media_type,
                pmi.id AS item_id,
                'PLEX' AS item_source
            FROM plex_media_items pmi;
        """.trimIndent())

        // 4. Create database triggers for automatic maintenance
        // media_items triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS media_items_ai AFTER INSERT ON media_items
            BEGIN
                INSERT INTO media_fts(rowid, title, creator, series, tags, summary, media_type, item_id, item_source)
                VALUES (
                    NEW.itemId,
                    NEW.fileName,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NEW.mediaType,
                    NEW.itemId,
                    'LOCAL'
                );
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS media_items_ad AFTER DELETE ON media_items
            BEGIN
                DELETE FROM media_fts WHERE rowid = OLD.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        // metadata_common triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_common_ai AFTER INSERT ON metadata_common
            BEGIN
                UPDATE media_fts
                SET title = COALESCE(NEW.title, title),
                    summary = COALESCE(NEW.summary, NEW.plot, summary)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_common_au AFTER UPDATE ON metadata_common
            BEGIN
                UPDATE media_fts
                SET title = COALESCE(NEW.title, title),
                    summary = COALESCE(NEW.summary, NEW.plot, summary)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        // metadata_book triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_book_ai AFTER INSERT ON metadata_book
            BEGIN
                UPDATE media_fts
                SET creator = COALESCE(NEW.additionalAuthors, creator),
                    series = COALESCE(NEW.series, series),
                    summary = COALESCE(NEW.notes, summary)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_book_au AFTER UPDATE ON metadata_book
            BEGIN
                UPDATE media_fts
                SET creator = COALESCE(NEW.additionalAuthors, creator),
                    series = COALESCE(NEW.series, series),
                    summary = COALESCE(NEW.notes, summary)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        // metadata_music_track triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_music_track_ai AFTER INSERT ON metadata_music_track
            BEGIN
                UPDATE media_fts
                SET creator = COALESCE(NEW.artist, creator),
                    series = COALESCE(NEW.album, series)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_music_track_au AFTER UPDATE ON metadata_music_track
            BEGIN
                UPDATE media_fts
                SET creator = COALESCE(NEW.artist, creator),
                    series = COALESCE(NEW.album, series)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        // metadata_movie triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_movie_ai AFTER INSERT ON metadata_movie
            BEGIN
                UPDATE media_fts
                SET series = COALESCE(NEW.franchise, NEW.collection, series)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS metadata_movie_au AFTER UPDATE ON metadata_movie
            BEGIN
                UPDATE media_fts
                SET series = COALESCE(NEW.franchise, NEW.collection, series)
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        // item_person_role triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS item_person_role_ai AFTER INSERT ON item_person_role
            BEGIN
                UPDATE media_fts
                SET creator = (
                    SELECT group_concat(p.name, ', ')
                    FROM item_person_role ipr
                    JOIN people p ON ipr.personId = p.personId
                    WHERE ipr.itemId = NEW.itemId
                )
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS item_person_role_ad AFTER DELETE ON item_person_role
            BEGIN
                UPDATE media_fts
                SET creator = (
                    SELECT group_concat(p.name, ', ')
                    FROM item_person_role ipr
                    JOIN people p ON ipr.personId = p.personId
                    WHERE ipr.itemId = OLD.itemId
                )
                WHERE rowid = OLD.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        // item_tags triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS item_tags_ai AFTER INSERT ON item_tags
            BEGIN
                UPDATE media_fts
                SET tags = (
                    SELECT group_concat(ut.name, ' ')
                    FROM item_tags it
                    JOIN unified_tags ut ON it.tagId = ut.tagId
                    WHERE it.itemId = NEW.itemId
                )
                WHERE rowid = NEW.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS item_tags_ad AFTER DELETE ON item_tags
            BEGIN
                UPDATE media_fts
                SET tags = (
                    SELECT group_concat(ut.name, ' ')
                    FROM item_tags it
                    JOIN unified_tags ut ON it.tagId = ut.tagId
                    WHERE it.itemId = OLD.itemId
                )
                WHERE rowid = OLD.itemId AND item_source = 'LOCAL';
            END;
        """.trimIndent())

        // plex_media_items triggers
        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS plex_media_items_ai AFTER INSERT ON plex_media_items
            BEGIN
                INSERT INTO media_fts(rowid, title, creator, series, tags, summary, media_type, item_id, item_source)
                VALUES (
                    COALESCE(NEW.localMediaItemId, 1000000000 + NEW.id),
                    NEW.title,
                    NEW.libraryName,
                    NULL,
                    'plex',
                    NEW.libraryName,
                    NEW.type,
                    NEW.id,
                    'PLEX'
                );
            END;
        """.trimIndent())

        database.execSQL("""
            CREATE TRIGGER IF NOT EXISTS plex_media_items_ad AFTER DELETE ON plex_media_items
            BEGIN
                DELETE FROM media_fts WHERE item_id = OLD.id AND item_source = 'PLEX';
            END;
        """.trimIndent())

        // 5. Create media_cache_items table and indexes
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS `media_cache_items` (
                `itemId` INTEGER NOT NULL,
                `remoteUri` TEXT NOT NULL,
                `downloadUrl` TEXT NOT NULL,
                `localPath` TEXT NOT NULL,
                `fileSize` INTEGER NOT NULL,
                `downloadedBytes` INTEGER NOT NULL,
                `downloadState` TEXT NOT NULL,
                `priority` TEXT NOT NULL,
                `isPinned` INTEGER NOT NULL,
                `lastAccessed` INTEGER NOT NULL,
                `createdAt` INTEGER NOT NULL,
                `errorMessage` TEXT,
                PRIMARY KEY(`itemId`)
            )
            """.trimIndent()
        )

        database.execSQL("CREATE INDEX IF NOT EXISTS `index_media_cache_items_remoteUri` ON `media_cache_items` (`remoteUri`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_media_cache_items_downloadState` ON `media_cache_items` (`downloadState`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_media_cache_items_isPinned` ON `media_cache_items` (`isPinned`)")
        database.execSQL("CREATE INDEX IF NOT EXISTS `index_media_cache_items_lastAccessed` ON `media_cache_items` (`lastAccessed`)")
    }
}
