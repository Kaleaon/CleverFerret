package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.repository.SettingsRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module providing settings-related dependencies.
 * 
 * This module is installed in the SingletonComponent, making the provided
 * dependencies available application-wide with singleton scope.
 */
@Module
@InstallIn(SingletonComponent::class)
object SettingsModule {

    /**
     * Provides a singleton instance of SettingsRepository.
     * 
     * @param context Application context for accessing SharedPreferences
     * @return Singleton SettingsRepository instance
     */
    @Provides
    @Singleton
    fun provideSettingsRepository(
        @ApplicationContext context: Context
    ): SettingsRepository {
        return SettingsRepository(context)
    }
}
