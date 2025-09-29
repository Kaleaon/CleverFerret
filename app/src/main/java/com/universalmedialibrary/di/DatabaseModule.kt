package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
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
 * This module is installed in the [SingletonComponent], meaning that all dependencies
 * provided here will have a singleton scope and will be available throughout the application's lifecycle.
 */
@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {
    /**
     * Provides a singleton instance of the [AppDatabase].
     *
     * @param context The application context provided by Hilt.
     * @return The singleton [AppDatabase] instance for the application.
     */
    @Provides
    @Singleton
    fun provideAppDatabase(
        @ApplicationContext context: Context,
    ): AppDatabase =
        Room
            .databaseBuilder(
                context,
                AppDatabase::class.java,
                AppDatabase.DATABASE_NAME,
            ).build()

    /**
     * Provides an instance of [LibraryDao].
     *
     * @param appDatabase The singleton [AppDatabase] instance.
     * @return An instance of [LibraryDao].
     */
    @Provides
    fun provideLibraryDao(appDatabase: AppDatabase): LibraryDao = appDatabase.libraryDao()

    /**
     * Provides an instance of [MediaItemDao].
     *
     * @param appDatabase The singleton [AppDatabase] instance.
     * @return An instance of [MediaItemDao].
     */
    @Provides
    fun provideMediaItemDao(appDatabase: AppDatabase): MediaItemDao = appDatabase.mediaItemDao()

    /**
     * Provides an instance of [MetadataDao].
     *
     * @param appDatabase The singleton [AppDatabase] instance.
     * @return An instance of [MetadataDao].
     */
    @Provides
    fun provideMetadataDao(appDatabase: AppDatabase): MetadataDao = appDatabase.metadataDao()
}
