package com.universalmedialibrary.services.manga.source

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.intPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.core.stringSetPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

private val Context.mangaSourceDataStore: DataStore<Preferences> by preferencesDataStore(
    name = "manga_sources"
)

/**
 * Repository for managing manga source preferences and state
 */
@Singleton
class MangaSourceRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private val ENABLED_SOURCES = stringSetPreferencesKey("enabled_sources")
        private val PINNED_SOURCES = stringSetPreferencesKey("pinned_sources")
        private val HIDDEN_SOURCES = stringSetPreferencesKey("hidden_sources")
        private val SOURCE_ORDER = stringPreferencesKey("source_order")
    }
    
    private val json = Json {
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    /**
     * Get all configured sources
     */
    suspend fun getAllSources(): List<MangaSource> {
        val prefs = context.mangaSourceDataStore.data.first()
        val enabledIds = prefs[ENABLED_SOURCES] ?: emptySet()
        val pinnedIds = prefs[PINNED_SOURCES] ?: emptySet()
        val hiddenIds = prefs[HIDDEN_SOURCES] ?: emptySet()
        
        return MangaSourceService.BUILTIN_SOURCES
            .filter { it.id !in hiddenIds }
            .map { source ->
                source.copy(
                    isEnabled = enabledIds.isEmpty() || source.id in enabledIds,
                    isPinned = source.id in pinnedIds
                )
            }
            .sortedWith(compareByDescending<MangaSource> { it.isPinned }.thenBy { it.name })
    }
    
    /**
     * Set source enabled state
     */
    suspend fun setSourceEnabled(sourceId: String, enabled: Boolean) {
        context.mangaSourceDataStore.edit { prefs ->
            val current = prefs[ENABLED_SOURCES]?.toMutableSet() ?: mutableSetOf()
            if (enabled) {
                current.add(sourceId)
            } else {
                current.remove(sourceId)
            }
            prefs[ENABLED_SOURCES] = current
        }
    }
    
    /**
     * Set source pinned state
     */
    suspend fun setSourcePinned(sourceId: String, pinned: Boolean) {
        context.mangaSourceDataStore.edit { prefs ->
            val current = prefs[PINNED_SOURCES]?.toMutableSet() ?: mutableSetOf()
            if (pinned) {
                current.add(sourceId)
            } else {
                current.remove(sourceId)
            }
            prefs[PINNED_SOURCES] = current
        }
    }
    
    /**
     * Hide a source
     */
    suspend fun setSourceHidden(sourceId: String, hidden: Boolean) {
        context.mangaSourceDataStore.edit { prefs ->
            val current = prefs[HIDDEN_SOURCES]?.toMutableSet() ?: mutableSetOf()
            if (hidden) {
                current.add(sourceId)
            } else {
                current.remove(sourceId)
            }
            prefs[HIDDEN_SOURCES] = current
        }
    }
    
    /**
     * Check if source is enabled
     */
    suspend fun isSourceEnabled(sourceId: String): Boolean {
        val prefs = context.mangaSourceDataStore.data.first()
        val enabledIds = prefs[ENABLED_SOURCES] ?: return true
        return enabledIds.isEmpty() || sourceId in enabledIds
    }
    
    /**
     * Get enabled source IDs
     */
    suspend fun getEnabledSourceIds(): Set<String> {
        val prefs = context.mangaSourceDataStore.data.first()
        return prefs[ENABLED_SOURCES] ?: emptySet()
    }
    
    /**
     * Get pinned source IDs
     */
    suspend fun getPinnedSourceIds(): Set<String> {
        val prefs = context.mangaSourceDataStore.data.first()
        return prefs[PINNED_SOURCES] ?: emptySet()
    }
    
    /**
     * Reset all source preferences
     */
    suspend fun resetAllPreferences() {
        context.mangaSourceDataStore.edit { prefs ->
            prefs.clear()
        }
    }
}
