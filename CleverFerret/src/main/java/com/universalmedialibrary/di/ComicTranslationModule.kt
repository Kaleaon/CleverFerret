package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.ComicTranslationCacheDao
import com.universalmedialibrary.services.comic.ComicProcessorRepository
import com.universalmedialibrary.services.comic.ComicTranslationApiKeyManager
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt Module for Comic Translation dependencies
 * 
 * This module provides the necessary dependencies for the comic translation feature,
 * including the repository, DAO, and API key manager.
 * 
 * The API keys are securely stored using EncryptedSharedPreferences and retrieved
 * at runtime when creating the repository instance.
 */
@Module
@InstallIn(SingletonComponent::class)
object ComicTranslationModule {

    @Provides
    @Singleton
    fun provideComicTranslationCacheDao(
        @ApplicationContext context: Context
    ): ComicTranslationCacheDao {
        return AppDatabase.getDatabase(context).comicTranslationCacheDao()
    }

    /**
     * Provides the ComicProcessorRepository with user-configured API key
     * 
     * The repository uses on-device ML Kit for translation, so only Gemini API key is needed.
     * If key is not configured, null is returned.
     * 
     * Usage pattern:
     * 1. Check if key is configured using ComicTranslationApiKeyManager.areKeysConfigured()
     * 2. If not configured, show setup UI to collect key
     * 3. Once configured, the repository can be safely injected and used
     */
    @Provides
    @Singleton
    fun provideComicProcessorRepository(
        dao: ComicTranslationCacheDao,
        apiKeyManager: ComicTranslationApiKeyManager
    ): ComicProcessorRepository? {
        // Only create repository if Gemini API key is configured
        if (!apiKeyManager.areKeysConfigured()) {
            return null
        }
        
        val geminiKey = apiKeyManager.getGeminiApiKey() 
            ?: throw IllegalStateException("Gemini API key not configured")
        
        return ComicProcessorRepository(
            geminiApiKey = geminiKey,
            translationCacheDao = dao
        )
    }
}
