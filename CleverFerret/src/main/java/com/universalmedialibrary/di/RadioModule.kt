package com.universalmedialibrary.di

import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.RadioStationDao
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for radio streaming dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object RadioModule {
    
    @Provides
    @Singleton
    fun provideRadioStationDao(database: AppDatabase): RadioStationDao {
        return database.radioStationDao()
    }
}