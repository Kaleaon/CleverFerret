package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.services.ai.AIToolsService
import com.universalmedialibrary.services.backup.LocalBackupService
import com.universalmedialibrary.services.cloud.GoogleDriveOAuthService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for Cloud, Backup, and AI Tools services
 */
@Module
@InstallIn(SingletonComponent::class)
object CloudBackupModule {
    
    @Provides
    @Singleton
    fun provideGoogleDriveOAuthService(
        @ApplicationContext context: Context
    ): GoogleDriveOAuthService {
        return GoogleDriveOAuthService(context)
    }
    
    @Provides
    @Singleton
    fun provideLocalBackupService(
        @ApplicationContext context: Context
    ): LocalBackupService {
        return LocalBackupService(context)
    }
    
    @Provides
    @Singleton
    fun provideAIToolsService(
        @ApplicationContext context: Context
    ): AIToolsService {
        return AIToolsService(context)
    }
}
