package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.debug.DebugReportingService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module providing debug-related dependencies
 * 
 * Note: FeatureFlagManager is not provided here because it has an @Inject constructor
 * with @Singleton scope, allowing Dagger to construct it automatically.
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
}
