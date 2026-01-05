package com.universalmedialibrary.services.manga.updates

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.longPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.core.stringSetPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import com.universalmedialibrary.services.manga.source.MangaUpdate
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.first
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

private val Context.updateDataStore: DataStore<Preferences> by preferencesDataStore(
    name = "manga_updates"
)

/**
 * Repository for storing manga update data
 */
@Singleton
class MangaUpdateRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private val UPDATES_KEY = stringPreferencesKey("updates")
        private val SEEN_CHAPTERS_PREFIX = "seen_chapters_"
        private val LAST_CHECK_KEY = longPreferencesKey("last_check")
    }
    
    private val json = Json {
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    /**
     * Save updates
     */
    suspend fun saveUpdates(updates: List<MangaUpdate>) {
        context.updateDataStore.edit { prefs ->
            val existing = prefs[UPDATES_KEY]?.let {
                try { json.decodeFromString<List<MangaUpdate>>(it) } catch (e: Exception) { emptyList() }
            } ?: emptyList()
            
            // Merge and keep recent updates (last 7 days)
            val cutoff = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000)
            val merged = (updates + existing)
                .distinctBy { "${it.manga.id}_${it.newChapters.firstOrNull()?.id}" }
                .filter { it.timestamp > cutoff }
                .sortedByDescending { it.timestamp }
                .take(100)
            
            prefs[UPDATES_KEY] = json.encodeToString(merged)
        }
    }
    
    /**
     * Get all updates
     */
    suspend fun getAllUpdates(): List<MangaUpdate> {
        val prefs = context.updateDataStore.data.first()
        val updatesJson = prefs[UPDATES_KEY] ?: return emptyList()
        
        return try {
            json.decodeFromString<List<MangaUpdate>>(updatesJson)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Clear all updates
     */
    suspend fun clearUpdates() {
        context.updateDataStore.edit { prefs ->
            prefs.remove(UPDATES_KEY)
        }
    }
    
    /**
     * Mark chapters as seen
     */
    suspend fun markChaptersAsSeen(mangaId: Long, chapterIds: List<Long>) {
        context.updateDataStore.edit { prefs ->
            val key = stringSetPreferencesKey("$SEEN_CHAPTERS_PREFIX$mangaId")
            val existing = prefs[key] ?: emptySet()
            prefs[key] = existing + chapterIds.map { it.toString() }
        }
    }
    
    /**
     * Check if chapter is seen
     */
    suspend fun isChapterSeen(mangaId: Long, chapterId: Long): Boolean {
        val prefs = context.updateDataStore.data.first()
        val key = stringSetPreferencesKey("$SEEN_CHAPTERS_PREFIX$mangaId")
        val seen = prefs[key] ?: return false
        return chapterId.toString() in seen
    }
    
    /**
     * Get unseen update count
     */
    suspend fun getUnseenUpdateCount(): Int {
        val updates = getAllUpdates()
        var count = 0
        
        for (update in updates) {
            for (chapter in update.newChapters) {
                if (!isChapterSeen(update.manga.id, chapter.id)) {
                    count++
                }
            }
        }
        
        return count
    }
    
    /**
     * Set last check time
     */
    suspend fun setLastCheckTime(time: Long) {
        context.updateDataStore.edit { prefs ->
            prefs[LAST_CHECK_KEY] = time
        }
    }
    
    /**
     * Get last check time
     */
    suspend fun getLastCheckTime(): Long {
        val prefs = context.updateDataStore.data.first()
        return prefs[LAST_CHECK_KEY] ?: 0L
    }
}
