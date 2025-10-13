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
     * Retrieve the cached translation for a specific page.
     *
     * @param pageId The unique identifier of the page.
     * @return The cached `ComicTranslationCache` for the page, or `null` if none exists.
     */
    @Query("SELECT * FROM comic_translation_cache WHERE pageId = :pageId LIMIT 1")
    suspend fun getTranslation(pageId: String): ComicTranslationCache?
    
    /**
     * Retrieve cached translations for the specified comic ordered by ascending page number.
     *
     * @param comicId The identifier of the comic whose cached translations to retrieve.
     * @return A list of ComicTranslationCache objects ordered by pageNumber ascending.
     */
    @Query("SELECT * FROM comic_translation_cache WHERE comicId = :comicId ORDER BY pageNumber ASC")
    suspend fun getAllTranslationsForComic(comicId: String): List<ComicTranslationCache>
    
    /**
     * Observe cached translations for a comic ordered by page number.
     *
     * @return A Flow that emits lists of ComicTranslationCache for the specified comic, ordered by ascending `pageNumber`.
     */
    @Query("SELECT * FROM comic_translation_cache WHERE comicId = :comicId ORDER BY pageNumber ASC")
    fun getAllTranslationsForComicFlow(comicId: String): Flow<List<ComicTranslationCache>>
    
    /**
     * Inserts or replaces the provided translation in the comic translation cache.
     *
     * @param translation The ComicTranslationCache entity to save or replace.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun saveTranslation(translation: ComicTranslationCache)
    
    /**
     * Save or update multiple comic translations in the cache.
     *
     * Existing rows with the same primary key are replaced.
     *
     * @param translations List of ComicTranslationCache entities to insert or replace.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun saveTranslations(translations: List<ComicTranslationCache>)
    
    /**
     * Removes the provided translation entry from the cache.
     *
     * @param translation The cached ComicTranslationCache to delete.
     */
    @Delete
    suspend fun deleteTranslation(translation: ComicTranslationCache)
    
    /**
     * Removes all cached translations for the specified comic.
     *
     * @param comicId The comic identifier whose cached translations will be deleted.
     */
    @Query("DELETE FROM comic_translation_cache WHERE comicId = :comicId")
    suspend fun deleteAllTranslationsForComic(comicId: String)
    
    /**
     * Removes all entries from the comic_translation_cache table.
     *
     * This permanently deletes every cached translation row in the local cache.
     */
    @Query("DELETE FROM comic_translation_cache")
    suspend fun deleteAllTranslations()
    
    /**
     * Counts the cached translation pages for the specified comic.
     *
     * @param comicId The identifier of the comic whose cached pages are counted.
     * @return The number of cached pages for the specified comic.
     */
    @Query("SELECT COUNT(*) FROM comic_translation_cache WHERE comicId = :comicId")
    suspend fun getCachedPageCount(comicId: String): Int
    
    /**
     * Determine whether a page with the given pageId exists in the translation cache.
     *
     * @return `true` if a cached translation for the page exists, `false` otherwise.
     */
    @Query("SELECT EXISTS(SELECT 1 FROM comic_translation_cache WHERE pageId = :pageId)")
    suspend fun isPageCached(pageId: String): Boolean
    
    /**
     * Returns the approximate total size of the translation cache in bytes.
     *
     * The value is calculated by summing the character lengths of the `translationData` JSON for all rows;
     * it may be `null` if the table contains no entries.
     *
     * @return The summed length of `translationData` across all cached entries, or `null` when there are no rows.
     */
    @Query("SELECT SUM(LENGTH(translationData)) FROM comic_translation_cache")
    suspend fun getCacheSizeBytes(): Long?
    
    /**
     * Removes the oldest cached translations to free space.
     *
     * @param count The maximum number of oldest cached translations to delete, determined by the `cachedAt` timestamp.
     */
    @Query("DELETE FROM comic_translation_cache WHERE pageId IN (SELECT pageId FROM comic_translation_cache ORDER BY cachedAt ASC LIMIT :count)")
    suspend fun deleteOldestTranslations(count: Int)
}