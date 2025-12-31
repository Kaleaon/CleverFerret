package com.universalmedialibrary.data.migration

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import com.universalmedialibrary.data.local.entity.TagCategory
import com.universalmedialibrary.data.local.entity.MediaType
import com.universalmedialibrary.data.local.entity.RelationshipType

/**
 * Database migration for Universal Search and Tagging System.
 * Version X to X+1 migration that adds all universal system tables.
 */
object UniversalSystemMigration {
    
    /**
     * Migration from current version to universal system version.
     * Update the from/to versions based on your current database version.
     */
    val MIGRATION_UNIVERSAL_SYSTEM = object : Migration(1, 2) {
        override fun migrate(database: SupportSQLiteDatabase) {
            createUniversalTagsTable(database)
            createMediaTagRelationsTable(database)
            createSearchHistoryTable(database)
            createContentRelationshipsTable(database)
            createIndexes(database)
            insertSystemTags(database)
        }
    }
    
    private fun createUniversalTagsTable(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS universal_tags (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                color TEXT,
                icon TEXT,
                category TEXT NOT NULL DEFAULT 'CUSTOM',
                created_at INTEGER NOT NULL,
                updated_at INTEGER NOT NULL,
                usage_count INTEGER NOT NULL DEFAULT 0,
                is_system_tag INTEGER NOT NULL DEFAULT 0,
                description TEXT,
                parent_tag_id INTEGER,
                is_active INTEGER NOT NULL DEFAULT 1
            )
            """.trimIndent()
        )
    }
    
    private fun createMediaTagRelationsTable(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS media_tag_relations (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                media_id TEXT NOT NULL,
                media_type TEXT NOT NULL,
                tag_id INTEGER NOT NULL,
                confidence REAL NOT NULL DEFAULT 1.0,
                source TEXT NOT NULL DEFAULT 'MANUAL',
                created_at INTEGER NOT NULL,
                created_by TEXT,
                weight REAL NOT NULL DEFAULT 1.0,
                is_verified INTEGER NOT NULL DEFAULT 0,
                last_applied INTEGER NOT NULL,
                FOREIGN KEY(tag_id) REFERENCES universal_tags(id) ON DELETE CASCADE
            )
            """.trimIndent()
        )
    }
    
    private fun createSearchHistoryTable(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS search_history (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                query TEXT NOT NULL,
                normalized_query TEXT NOT NULL,
                filters TEXT,
                media_types TEXT,
                result_count INTEGER NOT NULL DEFAULT 0,
                timestamp INTEGER NOT NULL,
                user_id TEXT,
                session_id TEXT,
                clicked_result_id TEXT,
                clicked_result_type TEXT,
                search_duration_ms INTEGER NOT NULL DEFAULT 0,
                is_favorite INTEGER NOT NULL DEFAULT 0,
                search_source TEXT NOT NULL DEFAULT 'MANUAL',
                suggestion_clicked INTEGER NOT NULL DEFAULT 0
            )
            """.trimIndent()
        )
    }
    
    private fun createContentRelationshipsTable(database: SupportSQLiteDatabase) {
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS content_relationships (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                source_media_id TEXT NOT NULL,
                source_media_type TEXT NOT NULL,
                target_media_id TEXT NOT NULL,
                target_media_type TEXT NOT NULL,
                relationship_type TEXT NOT NULL,
                strength REAL NOT NULL DEFAULT 0.0,
                confidence REAL NOT NULL DEFAULT 0.0,
                created_at INTEGER NOT NULL,
                updated_at INTEGER NOT NULL,
                created_by TEXT NOT NULL DEFAULT 'SYSTEM',
                metadata TEXT,
                is_mutual INTEGER NOT NULL DEFAULT 0,
                decay_factor REAL NOT NULL DEFAULT 1.0,
                user_affinity REAL NOT NULL DEFAULT 0.0
            )
            """.trimIndent()
        )
    }
    
    private fun createIndexes(database: SupportSQLiteDatabase) {
        // Universal tags indexes
        database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_universal_tags_name ON universal_tags(name)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_universal_tags_category ON universal_tags(category)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_universal_tags_created_at ON universal_tags(created_at)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_universal_tags_usage_count ON universal_tags(usage_count)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_universal_tags_parent_tag_id ON universal_tags(parent_tag_id)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_universal_tags_is_active ON universal_tags(is_active)")
        
        // Media tag relations indexes
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_tag_relations_media_id_type ON media_tag_relations(media_id, media_type)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_tag_relations_tag_id ON media_tag_relations(tag_id)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_tag_relations_created_at ON media_tag_relations(created_at)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_tag_relations_confidence ON media_tag_relations(confidence)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_tag_relations_source ON media_tag_relations(source)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_media_tag_relations_weight ON media_tag_relations(weight)")
        
        // Search history indexes
        database.execSQL("CREATE INDEX IF NOT EXISTS index_search_history_query ON search_history(query)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_search_history_timestamp ON search_history(timestamp)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_search_history_user_id ON search_history(user_id)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_search_history_media_types ON search_history(media_types)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_search_history_result_count ON search_history(result_count)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_search_history_normalized_query ON search_history(normalized_query)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_search_history_is_favorite ON search_history(is_favorite)")
        
        // Content relationships indexes
        database.execSQL("CREATE INDEX IF NOT EXISTS index_content_relationships_source ON content_relationships(source_media_id, source_media_type)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_content_relationships_target ON content_relationships(target_media_id, target_media_type)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_content_relationships_type ON content_relationships(relationship_type)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_content_relationships_strength ON content_relationships(strength)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_content_relationships_created_at ON content_relationships(created_at)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_content_relationships_created_by ON content_relationships(created_by)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_content_relationships_confidence ON content_relationships(confidence)")
    }
    
    private fun insertSystemTags(database: SupportSQLiteDatabase) {
        val currentTime = System.currentTimeMillis()
        
        // Insert common system tags
        val systemTags = listOf(
            // Genre tags
            Triple("Fiction", TagCategory.GENRE.name, "#2196F3"),
            Triple("Non-Fiction", TagCategory.GENRE.name, "#2196F3"),
            Triple("Science Fiction", TagCategory.GENRE.name, "#2196F3"),
            Triple("Fantasy", TagCategory.GENRE.name, "#2196F3"),
            Triple("Mystery", TagCategory.GENRE.name, "#2196F3"),
            Triple("Romance", TagCategory.GENRE.name, "#2196F3"),
            Triple("Thriller", TagCategory.GENRE.name, "#2196F3"),
            Triple("Biography", TagCategory.GENRE.name, "#2196F3"),
            Triple("History", TagCategory.GENRE.name, "#2196F3"),
            Triple("Self-Help", TagCategory.GENRE.name, "#2196F3"),
            
            // Mood tags
            Triple("Relaxing", TagCategory.MOOD.name, "#9C27B0"),
            Triple("Energetic", TagCategory.MOOD.name, "#9C27B0"),
            Triple("Focus", TagCategory.MOOD.name, "#9C27B0"),
            Triple("Sleep", TagCategory.MOOD.name, "#9C27B0"),
            Triple("Workout", TagCategory.MOOD.name, "#9C27B0"),
            Triple("Meditation", TagCategory.MOOD.name, "#9C27B0"),
            Triple("Happy", TagCategory.MOOD.name, "#9C27B0"),
            Triple("Melancholy", TagCategory.MOOD.name, "#9C27B0"),
            
            // Status tags
            Triple("To Read", TagCategory.STATUS.name, "#009688"),
            Triple("Reading", TagCategory.STATUS.name, "#009688"),
            Triple("Finished", TagCategory.STATUS.name, "#009688"),
            Triple("To Listen", TagCategory.STATUS.name, "#009688"),
            Triple("Listening", TagCategory.STATUS.name, "#009688"),
            Triple("To Watch", TagCategory.STATUS.name, "#009688"),
            Triple("Watching", TagCategory.STATUS.name, "#009688"),
            
            // Priority tags
            Triple("High Priority", TagCategory.PRIORITY.name, "#F44336"),
            Triple("Medium Priority", TagCategory.PRIORITY.name, "#FF9800"),
            Triple("Low Priority", TagCategory.PRIORITY.name, "#4CAF50"),
            
            // Rating tags
            Triple("5 Stars", TagCategory.RATING.name, "#795548"),
            Triple("4 Stars", TagCategory.RATING.name, "#795548"),
            Triple("3 Stars", TagCategory.RATING.name, "#795548"),
            Triple("2 Stars", TagCategory.RATING.name, "#795548"),
            Triple("1 Star", TagCategory.RATING.name, "#795548"),
            
            // Collection tags
            Triple("Favorites", TagCategory.COLLECTION.name, "#FF9800"),
            Triple("Later", TagCategory.COLLECTION.name, "#FF9800"),
            Triple("Archive", TagCategory.COLLECTION.name, "#FF9800"),
            Triple("Reference", TagCategory.COLLECTION.name, "#FF9800"),
            
            // Language tags
            Triple("English", TagCategory.LANGUAGE.name, "#3F51B5"),
            Triple("Spanish", TagCategory.LANGUAGE.name, "#3F51B5"),
            Triple("French", TagCategory.LANGUAGE.name, "#3F51B5"),
            Triple("German", TagCategory.LANGUAGE.name, "#3F51B5"),
            Triple("Chinese", TagCategory.LANGUAGE.name, "#3F51B5"),
            Triple("Japanese", TagCategory.LANGUAGE.name, "#3F51B5"),
            
            // Format tags
            Triple("PDF", TagCategory.FORMAT.name, "#8BC34A"),
            Triple("EPUB", TagCategory.FORMAT.name, "#8BC34A"),
            Triple("MOBI", TagCategory.FORMAT.name, "#8BC34A"),
            Triple("MP3", TagCategory.FORMAT.name, "#8BC34A"),
            Triple("MP4", TagCategory.FORMAT.name, "#8BC34A"),
            Triple("CBZ", TagCategory.FORMAT.name, "#8BC34A"),
            Triple("CBR", TagCategory.FORMAT.name, "#8BC34A"),
            
            // Source tags
            Triple("Local", TagCategory.SOURCE.name, "#00BCD4"),
            Triple("Cloud", TagCategory.SOURCE.name, "#00BCD4"),
            Triple("OPDS", TagCategory.SOURCE.name, "#00BCD4"),
            Triple("Calibre", TagCategory.SOURCE.name, "#00BCD4"),
            Triple("Google Play", TagCategory.SOURCE.name, "#00BCD4"),
            Triple("Amazon", TagCategory.SOURCE.name, "#00BCD4"),
            
            // System tags
            Triple("Recently Added", TagCategory.SYSTEM.name, "#FF5722"),
            Triple("Recently Played", TagCategory.SYSTEM.name, "#FF5722"),
            Triple("Recently Read", TagCategory.SYSTEM.name, "#FF5722"),
            Triple("Popular", TagCategory.SYSTEM.name, "#FF5722"),
            Triple("Recommended", TagCategory.SYSTEM.name, "#FF5722"),
            Triple("Trending", TagCategory.SYSTEM.name, "#FF5722")
        )
        
        systemTags.forEach { (name, category, color) ->
            database.execSQL(
                """
                INSERT INTO universal_tags (name, category, color, is_system_tag, created_at, updated_at)
                VALUES (?, ?, ?, 1, ?, ?)
                """.trimIndent(),
                arrayOf(name, category, color, currentTime, currentTime)
            )
        }
    }
    
    /**
     * Additional migration for adding new columns if needed in future versions.
     */
    val MIGRATION_ADD_TAG_METADATA = object : Migration(2, 3) {
        override fun migrate(database: SupportSQLiteDatabase) {
            // Add any additional columns that might be needed in future
            // database.execSQL("ALTER TABLE universal_tags ADD COLUMN new_column TEXT")
        }
    }
}