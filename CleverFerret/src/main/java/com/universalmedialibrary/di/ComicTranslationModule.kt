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

    /**
     * Provides the ComicTranslationCacheDao from the application's database.
     *
     * @return The ComicTranslationCacheDao instance from AppDatabase.
     */
    @Provides
    @Singleton
    fun provideComicTranslationCacheDao(
        @ApplicationContext context: Context
    ): ComicTranslationCacheDao {
        return AppDatabase.getDatabase(context).comicTranslationCacheDao()
    }

    /**
     * Supplies a configured ComicProcessorRepository when API keys are available.
     *
     * Returns a repository initialized with the stored Gemini and translation API keys and the provided DAO,
     * or `null` if keys have not been configured.
     *
     * @param dao DAO used for translation caching.
     * @param apiKeyManager Manager that provides and reports status of the required API keys.
     * @return A configured `ComicProcessorRepository` if keys are configured, `null` otherwise.
     * @throws IllegalStateException If `areKeysConfigured()` is true but either the Gemini or translation API key is missing.
     */
    @Provides
    fun provideComicProcessorRepository(
        dao: ComicTranslationCacheDao,
        apiKeyManager: ComicTranslationApiKeyManager
    ): ComicProcessorRepository? {
        // Only create repository if both API keys are configured
        if (!apiKeyManager.areKeysConfigured()) {
            return null
        }
        
        val geminiKey = apiKeyManager.getGeminiApiKey() 
            ?: throw IllegalStateException("Gemini API key not configured")
        val translateKey = apiKeyManager.getTranslateApiKey() 
            ?: throw IllegalStateException("Translation API key not configured")
        
        return ComicProcessorRepository(
            geminiApiKey = geminiKey,
            translateApiKey = translateKey,
            translationCacheDao = dao
        )
    }
}