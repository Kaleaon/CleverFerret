package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ComicTranslationCache
import kotlinx.coroutines.flow.Flow

/**
 * DAO for Comic Translation Cache
 * 
 * Provides database access methods for storing and retrieving
 * cached comic page translations from the Gemini AI API.
 */
@Dao
interface ComicTranslationCacheDao {
    
    /**
     * Get cached translation for a specific page
     */
    @Query("SELECT * FROM comic_translation_cache WHERE pageId = :pageId LIMIT 1")
    suspend fun getTranslation(pageId: String): ComicTranslationCache?
    
    /**
     * Get all cached translations for a comic
     */
    @Query("SELECT * FROM comic_translation_cache WHERE comicId = :comicId ORDER BY pageNumber ASC")
    suspend fun getAllTranslationsForComic(comicId: String): List<ComicTranslationCache>
    
    /**
     * Get all cached translations for a comic as Flow
     */
    @Query("SELECT * FROM comic_translation_cache WHERE comicId = :comicId ORDER BY pageNumber ASC")
    fun getAllTranslationsForComicFlow(comicId: String): Flow<List<ComicTranslationCache>>
    
    /**
     * Save a translation to cache
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun saveTranslation(translation: ComicTranslationCache)
    
    /**
     * Save multiple translations to cache
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun saveTranslations(translations: List<ComicTranslationCache>)
    
    /**
     * Delete a specific translation
     */
    @Delete
    suspend fun deleteTranslation(translation: ComicTranslationCache)
    
    /**
     * Delete all translations for a comic
     */
    @Query("DELETE FROM comic_translation_cache WHERE comicId = :comicId")
    suspend fun deleteAllTranslationsForComic(comicId: String)
    
    /**
     * Delete all cached translations (e.g., for clearing cache)
     */
    @Query("DELETE FROM comic_translation_cache")
    suspend fun deleteAllTranslations()
    
    /**
     * Get count of cached pages for a comic
     */
    @Query("SELECT COUNT(*) FROM comic_translation_cache WHERE comicId = :comicId")
    suspend fun getCachedPageCount(comicId: String): Int
    
    /**
     * Check if a page is cached
     */
    @Query("SELECT EXISTS(SELECT 1 FROM comic_translation_cache WHERE pageId = :pageId)")
    suspend fun isPageCached(pageId: String): Boolean
    
    /**
     * Get cache size in bytes (approximate, based on JSON length)
     */
    @Query("SELECT SUM(LENGTH(translationData)) FROM comic_translation_cache")
    suspend fun getCacheSizeBytes(): Long?
    
    /**
     * Delete oldest cached translations to free up space
     */
    @Query("DELETE FROM comic_translation_cache WHERE pageId IN (SELECT pageId FROM comic_translation_cache ORDER BY cachedAt ASC LIMIT :count)")
    suspend fun deleteOldestTranslations(count: Int)
}
