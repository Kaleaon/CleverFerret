package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import com.universalmedialibrary.data.local.converters.*
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.migration.UniversalSystemMigration

/**
 * Main Room database for CleverFerret universal media library.
 * Includes all entities for cross-media search, tagging, and relationships.
 */
@Database(
    entities = [
        // Existing entities (keep your current ones)
        // Add existing entities here...
        
        // New universal system entities
        UniversalTag::class,
        MediaTagRelation::class,
        SearchHistory::class,
        ContentRelationship::class
    ],
    version = 2, // Update this based on your current version + 1
    exportSchema = true
)
@TypeConverters(
    // Existing converters
    MediaTypeConverter::class,
    TagCategoryConverter::class,
    TagSourceConverter::class,
    SearchSourceConverter::class,
    RelationshipTypeConverter::class,
    RelationshipSourceConverter::class
)
abstract class UniversalMediaLibraryDatabase : RoomDatabase() {
    
    // Existing DAOs
    // abstract fun existingDao(): ExistingDao
    
    // New universal system DAOs
    abstract fun universalTagDao(): UniversalTagDao
    abstract fun mediaTagRelationDao(): MediaTagRelationDao
    abstract fun searchHistoryDao(): SearchHistoryDao
    abstract fun contentRelationshipDao(): ContentRelationshipDao
    
    companion object {
        const val DATABASE_NAME = "universal_media_library_database"
        
        // Migration array - add your existing migrations plus the new one
        val MIGRATIONS = arrayOf<Migration>(
            // Add your existing migrations here...
            UniversalSystemMigration.MIGRATION_UNIVERSAL_SYSTEM
        )
        
        // Additional migrations for future updates
        val FUTURE_MIGRATIONS = arrayOf<Migration>(
            UniversalSystemMigration.MIGRATION_ADD_TAG_METADATA
        )
    }
}

/**
 * Type converters for Room database.
 */
class MediaTypeConverter {
    @androidx.room.TypeConverter
    fun fromMediaType(mediaType: MediaType): String = mediaType.name
    
    @androidx.room.TypeConverter
    fun toMediaType(mediaType: String): MediaType = MediaType.valueOf(mediaType)
}

class TagCategoryConverter {
    @androidx.room.TypeConverter
    fun fromTagCategory(category: TagCategory): String = category.name
    
    @androidx.room.TypeConverter
    fun toTagCategory(category: String): TagCategory = TagCategory.valueOf(category)
}

class TagSourceConverter {
    @androidx.room.TypeConverter
    fun fromTagSource(source: TagSource): String = source.name
    
    @androidx.room.TypeConverter
    fun toTagSource(source: String): TagSource = TagSource.valueOf(source)
}

class SearchSourceConverter {
    @androidx.room.TypeConverter
    fun fromSearchSource(source: SearchSource): String = source.name
    
    @androidx.room.TypeConverter
    fun toSearchSource(source: String): SearchSource = SearchSource.valueOf(source)
}

class RelationshipTypeConverter {
    @androidx.room.TypeConverter
    fun fromRelationshipType(type: RelationshipType): String = type.name
    
    @androidx.room.TypeConverter
    fun toRelationshipType(type: String): RelationshipType = RelationshipType.valueOf(type)
}

class RelationshipSourceConverter {
    @androidx.room.TypeConverter
    fun fromRelationshipSource(source: RelationshipSource): String = source.name
    
    @androidx.room.TypeConverter
    fun toRelationshipSource(source: String): RelationshipSource = RelationshipSource.valueOf(source)
}