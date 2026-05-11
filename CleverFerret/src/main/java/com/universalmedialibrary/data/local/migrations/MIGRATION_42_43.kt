package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

/**
 * Migration from version 42 to 43
 * Adds enhanced tag system with hierarchies, synonyms, categories,
 * and smart collection rules for auto-suggested playlists and groupings
 */
internal val MIGRATION_42_43: Migration = object : Migration(42, 43) {
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

