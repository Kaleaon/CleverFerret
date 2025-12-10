package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.debug.DebugReportingService
import com.universalmedialibrary.debug.FeatureFlagManager
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module providing debug-related dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object DebugModule {
    
    @Provides
    @Singleton
    fun provideDebugReportingService(
        @ApplicationContext context: Context
    ): DebugReportingService {
        return DebugReportingService(context)
    }
    
    @Provides
    @Singleton
    fun provideFeatureFlagManager(
        @ApplicationContext context: Context
    ): FeatureFlagManager {
        return FeatureFlagManager(context)
    }
}
