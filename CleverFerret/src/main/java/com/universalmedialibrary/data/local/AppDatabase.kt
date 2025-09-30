package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import android.content.Context
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*


// Temporarily disabled to resolve KSP build issues
/*
@Database(
    entities = [
        // Phase 2: Starting with minimal entities only for build fix
        com.universalmedialibrary.data.local.model.Library::class,
        com.universalmedialibrary.data.local.model.APIKey::class

    ],
    version = 10,
    exportSchema = false
)
*/
abstract class AppDatabase : RoomDatabase() {
    
    // Core DAOs - Minimized for build fix
    abstract fun libraryDao(): LibraryDao
    abstract fun apiKeyDao(): APIKeyDao

    
    // Temporarily disabled until build is fixed
    // abstract fun mediaItemDao(): MediaItemDao
    // abstract fun metadataDao(): MetadataDao
    // abstract fun bookmarkDao(): BookmarkDao
    
    // Additional DAOs - Temporarily disabled until entities are properly configured
    // abstract fun readerSettingsDao(): ReaderSettingsDao
    // abstract fun annotationDao(): AnnotationDao
    // abstract fun searchIndexDao(): SearchIndexDao
    // abstract fun readingStatisticsDao(): ReadingStatisticsDao
    
    // Plex DAOs - Temporarily disabled
    // abstract fun plexServerDao(): PlexServerDao
    // abstract fun plexMediaItemDao(): PlexMediaItemDao
    // abstract fun plexSyncDao(): PlexSyncDao
    
    // Playback queue DAOs - Temporarily disabled
    // abstract fun playbackQueueDao(): PlaybackQueueDao
    // abstract fun queueItemDao(): QueueItemDao
    // abstract fun playbackSessionDao(): PlaybackSessionDao


    companion object {
        const val DATABASE_NAME = "universal-media-library.db"
        
        @Volatile
        private var INSTANCE: AppDatabase? = null
        
        fun getDatabase(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDatabase::class.java,
                    DATABASE_NAME
                )
                .fallbackToDestructiveMigration() // For development - will implement proper migrations later
                .build()
                INSTANCE = instance
                instance
            }
        }
    }
}
