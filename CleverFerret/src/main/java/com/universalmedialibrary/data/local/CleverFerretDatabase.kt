package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import android.content.Context
import com.universalmedialibrary.data.local.dao.DownloadedStoryDao
import com.universalmedialibrary.data.local.dao.StoryUpdateDao
import com.universalmedialibrary.data.local.entity.DownloadedStory
import com.universalmedialibrary.data.local.entity.StoryUpdate
import com.universalmedialibrary.data.local.entity.Converters

/**
 * CleverFerret Room Database for content management
 * 
 * Manages downloaded stories, update tracking, and content metadata
 * following patterns from Calibre's plugin architecture for fanfiction management
 */
@Database(
    entities = [
        DownloadedStory::class,
        StoryUpdate::class
    ],
    version = 1,
    exportSchema = false
)
@TypeConverters(Converters::class)
abstract class CleverFerretDatabase : RoomDatabase() {
    
    abstract fun downloadedStoryDao(): DownloadedStoryDao
    abstract fun storyUpdateDao(): StoryUpdateDao
    
    companion object {
        @Volatile
        private var INSTANCE: CleverFerretDatabase? = null
        
        fun getDatabase(context: Context): CleverFerretDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    CleverFerretDatabase::class.java,
                    "cleverferret_database"
                )
                .build()
                INSTANCE = instance
                instance
            }
        }
    }
}