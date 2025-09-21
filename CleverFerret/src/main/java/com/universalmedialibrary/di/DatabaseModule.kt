package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for providing database-related dependencies.
 *
 * This object is responsible for creating and configuring the Room database instance
 * and providing the various Data Access Objects (DAOs) as dependencies to other
 * parts of the application.
 */
@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {

    /**
     * Provides a singleton instance of the [AppDatabase].
     *
     * This function builds the Room database, specifying the database name and
     * adding all necessary migrations to handle schema updates over time.
     *
     * @param context The application context, provided by Hilt.
     * @return A singleton instance of the [AppDatabase].
     */
    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            AppDatabase.DATABASE_NAME
        ).addMigrations(
            AppDatabase.MIGRATION_1_2,
            AppDatabase.MIGRATION_2_3,
            AppDatabase.MIGRATION_3_4,
            AppDatabase.MIGRATION_4_5,
            AppDatabase.MIGRATION_5_6
        )
         .build()
    }

    /**
     * Provides the [LibraryDao] for library management operations.
     *
     * @param appDatabase The singleton [AppDatabase] instance.
     * @return An instance of [LibraryDao].
     */
    @Provides
    fun provideLibraryDao(appDatabase: AppDatabase): LibraryDao {
        return appDatabase.libraryDao()
    }

    /**
     * Provides the [MediaItemDao] for media item management.
     *
     * @param appDatabase The singleton [AppDatabase] instance.
     * @return An instance of [MediaItemDao].
     */
    @Provides
    fun provideMediaItemDao(appDatabase: AppDatabase): MediaItemDao {
        return appDatabase.mediaItemDao()
    }

    /**
     * Provides the [MetadataDao] for metadata extraction and management.
     *
     * @param appDatabase The singleton [AppDatabase] instance.
     * @return An instance of [MetadataDao].
     */
    @Provides
    fun provideMetadataDao(appDatabase: AppDatabase): MetadataDao {
        return appDatabase.metadataDao()
    }

    /**
     * Provides the [BookmarkDao] for reading progress and bookmark management.
     *
     * @param appDatabase The singleton [AppDatabase] instance.
     * @return An instance of [BookmarkDao].
     */
    @Provides
    fun provideBookmarkDao(appDatabase: AppDatabase): BookmarkDao {
        return appDatabase.bookmarkDao()
    }
}