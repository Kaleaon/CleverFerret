package com.universalmedialibrary.di

import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.repository.HistoryRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Dependency injection module for history tracking
 */
@Module
@InstallIn(SingletonComponent::class)
object HistoryModule {
    
    @Provides
    @Singleton
    fun provideHistoryRepository(
        progressDao: ReadingProgressDao,
        bookmarkDao: BookmarkDao
    ): HistoryRepository {
        return HistoryRepository(progressDao, bookmarkDao)
    }
}
