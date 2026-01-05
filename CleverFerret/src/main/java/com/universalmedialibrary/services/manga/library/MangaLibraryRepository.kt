package com.universalmedialibrary.services.manga.library

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.core.stringSetPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import com.universalmedialibrary.services.manga.source.OnlineManga
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

private val Context.libraryDataStore: DataStore<Preferences> by preferencesDataStore(
    name = "manga_library"
)

/**
 * Repository for manga library, favorites, and categories
 * 
 * Provides persistent storage for user's manga collection
 */
@Singleton
class MangaLibraryRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private val LIBRARY_KEY = stringPreferencesKey("library")
        private val CATEGORIES_KEY = stringPreferencesKey("categories")
        private val HISTORY_KEY = stringPreferencesKey("reading_history")
        private val BOOKMARKS_KEY = stringPreferencesKey("bookmarks")
        private val KNOWN_CHAPTERS_PREFIX = "known_chapters_"
    }
    
    private val json = Json {
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    // ========================
    // Library Methods
    // ========================
    
    /**
     * Add manga to library
     */
    suspend fun addToLibrary(manga: OnlineManga, categoryIds: Set<Long> = emptySet()): LibraryManga {
        val libraryManga = LibraryManga(
            id = manga.id,
            sourceId = manga.sourceId,
            url = manga.url,
            title = manga.title,
            coverUrl = manga.coverUrl,
            author = manga.author,
            description = manga.description,
            categoryIds = categoryIds,
            totalChapters = manga.chapters?.size ?: 0,
            unreadCount = manga.chapters?.size ?: 0
        )
        
        context.libraryDataStore.edit { prefs ->
            val library = getLibraryFromPrefs(prefs).toMutableList()
            val existingIndex = library.indexOfFirst { it.id == manga.id }
            
            if (existingIndex >= 0) {
                library[existingIndex] = libraryManga.copy(
                    addedAt = library[existingIndex].addedAt,
                    lastRead = library[existingIndex].lastRead,
                    chaptersRead = library[existingIndex].chaptersRead
                )
            } else {
                library.add(libraryManga)
            }
            
            prefs[LIBRARY_KEY] = json.encodeToString(library)
        }
        
        // Initialize known chapters
        manga.chapters?.let { chapters ->
            addKnownChapterIds(manga.id, chapters.map { it.id })
        }
        
        return libraryManga
    }
    
    /**
     * Remove manga from library
     */
    suspend fun removeFromLibrary(mangaId: Long) {
        context.libraryDataStore.edit { prefs ->
            val library = getLibraryFromPrefs(prefs).filter { it.id != mangaId }
            prefs[LIBRARY_KEY] = json.encodeToString(library)
        }
    }
    
    /**
     * Check if manga is in library
     */
    suspend fun isInLibrary(mangaId: Long): Boolean {
        val prefs = context.libraryDataStore.data.first()
        return getLibraryFromPrefs(prefs).any { it.id == mangaId }
    }
    
    /**
     * Get all manga in library
     */
    suspend fun getAllLibraryManga(): List<LibraryManga> {
        val prefs = context.libraryDataStore.data.first()
        return getLibraryFromPrefs(prefs)
    }
    
    /**
     * Observe library changes
     */
    fun observeLibrary(): Flow<List<LibraryManga>> {
        return context.libraryDataStore.data.map { prefs ->
            getLibraryFromPrefs(prefs)
        }
    }
    
    /**
     * Get library with filter and sort
     */
    suspend fun getFilteredLibrary(filter: LibraryFilter): List<LibraryManga> {
        var library = getAllLibraryManga()
        
        // Apply query filter
        filter.query?.let { query ->
            if (query.isNotBlank()) {
                library = library.filter { 
                    it.title.contains(query, ignoreCase = true) ||
                    it.author?.contains(query, ignoreCase = true) == true
                }
            }
        }
        
        // Apply category filter
        filter.categories?.let { categories ->
            if (categories.isNotEmpty()) {
                library = library.filter { manga ->
                    manga.categoryIds.any { it in categories }
                }
            }
        }
        
        // Apply boolean filters
        if (filter.unreadOnly) {
            library = library.filter { it.unreadCount > 0 }
        }
        
        // Apply sorting
        library = when (filter.sortOrder) {
            LibrarySortOrder.LAST_READ -> library.sortedBy { it.lastRead }
            LibrarySortOrder.UNREAD_COUNT -> library.sortedBy { it.unreadCount }
            LibrarySortOrder.ALPHABETICAL -> library.sortedBy { it.title.lowercase() }
            LibrarySortOrder.DATE_ADDED -> library.sortedBy { it.addedAt }
            LibrarySortOrder.LAST_UPDATED -> library.sortedBy { it.lastRead }
            LibrarySortOrder.TOTAL_CHAPTERS -> library.sortedBy { it.totalChapters }
            LibrarySortOrder.RATING -> library.sortedBy { it.lastRead } // No rating yet
        }
        
        if (filter.sortDescending) {
            library = library.reversed()
        }
        
        return library
    }
    
    /**
     * Update reading progress
     */
    suspend fun updateReadingProgress(mangaId: Long, chaptersRead: Int, unreadCount: Int) {
        context.libraryDataStore.edit { prefs ->
            val library = getLibraryFromPrefs(prefs).toMutableList()
            val index = library.indexOfFirst { it.id == mangaId }
            
            if (index >= 0) {
                library[index] = library[index].copy(
                    chaptersRead = chaptersRead,
                    unreadCount = unreadCount,
                    lastRead = System.currentTimeMillis()
                )
                prefs[LIBRARY_KEY] = json.encodeToString(library)
            }
        }
    }
    
    /**
     * Toggle favorite status
     */
    suspend fun toggleFavorite(mangaId: Long): Boolean {
        var newFavoriteStatus = false
        
        context.libraryDataStore.edit { prefs ->
            val library = getLibraryFromPrefs(prefs).toMutableList()
            val index = library.indexOfFirst { it.id == mangaId }
            
            if (index >= 0) {
                newFavoriteStatus = !library[index].isFavorite
                library[index] = library[index].copy(isFavorite = newFavoriteStatus)
                prefs[LIBRARY_KEY] = json.encodeToString(library)
            }
        }
        
        return newFavoriteStatus
    }
    
    // ========================
    // Category Methods
    // ========================
    
    /**
     * Create a category
     */
    suspend fun createCategory(name: String, flags: Set<CategoryFlag> = emptySet()): MangaCategory {
        val categories = getAllCategories().toMutableList()
        val id = (categories.maxOfOrNull { it.id } ?: 0) + 1
        val order = categories.size
        
        val category = MangaCategory(
            id = id,
            name = name,
            order = order,
            flags = flags
        )
        
        categories.add(category)
        
        context.libraryDataStore.edit { prefs ->
            prefs[CATEGORIES_KEY] = json.encodeToString(categories)
        }
        
        return category
    }
    
    /**
     * Get all categories
     */
    suspend fun getAllCategories(): List<MangaCategory> {
        val prefs = context.libraryDataStore.data.first()
        val categoriesJson = prefs[CATEGORIES_KEY] ?: return getDefaultCategories()
        
        return try {
            json.decodeFromString<List<MangaCategory>>(categoriesJson)
        } catch (e: Exception) {
            getDefaultCategories()
        }
    }
    
    /**
     * Delete a category
     */
    suspend fun deleteCategory(categoryId: Long) {
        context.libraryDataStore.edit { prefs ->
            val categories = getAllCategories().filter { it.id != categoryId }
            prefs[CATEGORIES_KEY] = json.encodeToString(categories)
            
            // Remove category from all manga
            val library = getLibraryFromPrefs(prefs).map { manga ->
                manga.copy(categoryIds = manga.categoryIds - categoryId)
            }
            prefs[LIBRARY_KEY] = json.encodeToString(library)
        }
    }
    
    /**
     * Update manga categories
     */
    suspend fun updateMangaCategories(mangaId: Long, categoryIds: Set<Long>) {
        context.libraryDataStore.edit { prefs ->
            val library = getLibraryFromPrefs(prefs).toMutableList()
            val index = library.indexOfFirst { it.id == mangaId }
            
            if (index >= 0) {
                library[index] = library[index].copy(categoryIds = categoryIds)
                prefs[LIBRARY_KEY] = json.encodeToString(library)
            }
        }
    }
    
    // ========================
    // Chapter Tracking
    // ========================
    
    /**
     * Get known chapter IDs for a manga
     */
    suspend fun getKnownChapterIds(mangaId: Long): Set<Long> {
        val prefs = context.libraryDataStore.data.first()
        val key = stringSetPreferencesKey("$KNOWN_CHAPTERS_PREFIX$mangaId")
        return prefs[key]?.mapNotNull { it.toLongOrNull() }?.toSet() ?: emptySet()
    }
    
    /**
     * Add known chapter IDs
     */
    suspend fun addKnownChapterIds(mangaId: Long, chapterIds: List<Long>) {
        context.libraryDataStore.edit { prefs ->
            val key = stringSetPreferencesKey("$KNOWN_CHAPTERS_PREFIX$mangaId")
            val existing = prefs[key] ?: emptySet()
            prefs[key] = existing + chapterIds.map { it.toString() }
        }
    }
    
    // ========================
    // Reading History
    // ========================
    
    /**
     * Add reading history entry
     */
    suspend fun addHistoryEntry(entry: ReadingHistoryEntry) {
        context.libraryDataStore.edit { prefs ->
            val history = getHistoryFromPrefs(prefs).toMutableList()
            
            // Remove existing entry for same chapter
            history.removeAll { it.mangaId == entry.mangaId && it.chapterId == entry.chapterId }
            
            // Add new entry
            history.add(0, entry)
            
            // Keep only last 100 entries
            val trimmed = history.take(100)
            prefs[HISTORY_KEY] = json.encodeToString(trimmed)
        }
    }
    
    /**
     * Get reading history
     */
    suspend fun getReadingHistory(limit: Int = 50): List<ReadingHistoryEntry> {
        val prefs = context.libraryDataStore.data.first()
        return getHistoryFromPrefs(prefs).take(limit)
    }
    
    /**
     * Clear reading history
     */
    suspend fun clearHistory() {
        context.libraryDataStore.edit { prefs ->
            prefs.remove(HISTORY_KEY)
        }
    }
    
    // ========================
    // Sync Support
    // ========================
    
    /**
     * Update tracking IDs for a manga
     */
    suspend fun updateTrackingIds(mangaId: Long, trackingIds: Map<String, String>) {
        context.libraryDataStore.edit { prefs ->
            val library = getLibraryFromPrefs(prefs).toMutableList()
            val index = library.indexOfFirst { it.id == mangaId }
            
            if (index >= 0) {
                val existing = library[index].trackingIds
                library[index] = library[index].copy(
                    trackingIds = existing + trackingIds
                )
                prefs[LIBRARY_KEY] = json.encodeToString(library)
            }
        }
    }
    
    // ========================
    // Private Helpers
    // ========================
    
    private fun getLibraryFromPrefs(prefs: Preferences): List<LibraryManga> {
        val libraryJson = prefs[LIBRARY_KEY] ?: return emptyList()
        return try {
            json.decodeFromString<List<LibraryManga>>(libraryJson)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private fun getHistoryFromPrefs(prefs: Preferences): List<ReadingHistoryEntry> {
        val historyJson = prefs[HISTORY_KEY] ?: return emptyList()
        return try {
            json.decodeFromString<List<ReadingHistoryEntry>>(historyJson)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private fun getDefaultCategories(): List<MangaCategory> {
        return listOf(
            MangaCategory(
                id = 1,
                name = "Default",
                order = 0,
                flags = setOf(CategoryFlag.DEFAULT, CategoryFlag.INCLUDE_IN_UPDATES)
            )
        )
    }
}
