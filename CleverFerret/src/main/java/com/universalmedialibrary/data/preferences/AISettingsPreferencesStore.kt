package com.universalmedialibrary.data.preferences

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.intPreferencesKey
import androidx.datastore.preferences.core.longPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

val Context.aiSettingsDataStore: DataStore<Preferences> by preferencesDataStore(name = "ai_settings")

@Singleton
class AISettingsPreferencesStore @Inject constructor(
    @ApplicationContext private val context: Context
) {
    // AI Provider settings
    private val SELECTED_PROVIDER_KEY = stringPreferencesKey("selected_ai_provider")
    
    // AI Log settings
    private val AI_LOG_ENABLED_KEY = booleanPreferencesKey("ai_log_enabled")
    private val AI_LOG_STORAGE_LOCATION_KEY = stringPreferencesKey("ai_log_storage_location")
    private val AI_LOG_RETENTION_DAYS_KEY = intPreferencesKey("ai_log_retention_days")
    private val AI_LOG_AUTO_EXPORT_KEY = booleanPreferencesKey("ai_log_auto_export")
    
    // AI Tools settings
    private val AI_TOOLS_ENABLED_KEY = booleanPreferencesKey("ai_tools_enabled")
    private val AI_TOOLS_WEB_SEARCH_KEY = booleanPreferencesKey("ai_tools_web_search")
    private val AI_TOOLS_BROWSE_LIBRARY_KEY = booleanPreferencesKey("ai_tools_browse_library")
    private val AI_TOOLS_DOWNLOAD_KEY = booleanPreferencesKey("ai_tools_download")
    private val AI_TOOLS_AUTO_EXECUTE_KEY = booleanPreferencesKey("ai_tools_auto_execute")
    
    // AI Content Cache settings
    private val AI_CONTENT_CACHE_ENABLED_KEY = booleanPreferencesKey("ai_content_cache_enabled")
    private val AI_CONTENT_CACHE_SIZE_MB_KEY = longPreferencesKey("ai_content_cache_size_mb")
    private val AI_CONTENT_CACHE_LOCATION_KEY = stringPreferencesKey("ai_content_cache_location")
    
    // AI Library Access settings
    private val AI_LIBRARY_ACCESS_KEY = booleanPreferencesKey("ai_library_access")
    private val AI_LIBRARY_ACCESS_BOOKS_KEY = booleanPreferencesKey("ai_library_access_books")
    private val AI_LIBRARY_ACCESS_MOVIES_KEY = booleanPreferencesKey("ai_library_access_movies")
    private val AI_LIBRARY_ACCESS_MUSIC_KEY = booleanPreferencesKey("ai_library_access_music")
    private val AI_LIBRARY_ACCESS_COMICS_KEY = booleanPreferencesKey("ai_library_access_comics")
    
    // ==================== AI Provider ====================
    
    val selectedProvider: Flow<String> = context.aiSettingsDataStore.data
        .map { preferences ->
            preferences[SELECTED_PROVIDER_KEY] ?: "GEMINI"
        }

    suspend fun setSelectedProvider(providerId: String) {
        context.aiSettingsDataStore.edit { preferences ->
            preferences[SELECTED_PROVIDER_KEY] = providerId
        }
    }
    
    // ==================== AI Logging ====================
    
    val aiLogEnabled: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_LOG_ENABLED_KEY] ?: true }
    
    suspend fun setAiLogEnabled(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_LOG_ENABLED_KEY] = enabled }
    }
    
    val aiLogStorageLocation: Flow<String> = context.aiSettingsDataStore.data
        .map { it[AI_LOG_STORAGE_LOCATION_KEY] ?: "internal" }
    
    suspend fun setAiLogStorageLocation(location: String) {
        context.aiSettingsDataStore.edit { it[AI_LOG_STORAGE_LOCATION_KEY] = location }
    }
    
    val aiLogRetentionDays: Flow<Int> = context.aiSettingsDataStore.data
        .map { it[AI_LOG_RETENTION_DAYS_KEY] ?: 30 }
    
    suspend fun setAiLogRetentionDays(days: Int) {
        context.aiSettingsDataStore.edit { it[AI_LOG_RETENTION_DAYS_KEY] = days }
    }
    
    val aiLogAutoExport: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_LOG_AUTO_EXPORT_KEY] ?: false }
    
    suspend fun setAiLogAutoExport(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_LOG_AUTO_EXPORT_KEY] = enabled }
    }
    
    // ==================== AI Tools ====================
    
    val aiToolsEnabled: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_TOOLS_ENABLED_KEY] ?: true }
    
    suspend fun setAiToolsEnabled(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_TOOLS_ENABLED_KEY] = enabled }
    }
    
    val aiToolsWebSearchEnabled: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_TOOLS_WEB_SEARCH_KEY] ?: true }
    
    suspend fun setAiToolsWebSearchEnabled(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_TOOLS_WEB_SEARCH_KEY] = enabled }
    }
    
    val aiToolsBrowseLibraryEnabled: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_TOOLS_BROWSE_LIBRARY_KEY] ?: true }
    
    suspend fun setAiToolsBrowseLibraryEnabled(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_TOOLS_BROWSE_LIBRARY_KEY] = enabled }
    }
    
    val aiToolsDownloadEnabled: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_TOOLS_DOWNLOAD_KEY] ?: true }
    
    suspend fun setAiToolsDownloadEnabled(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_TOOLS_DOWNLOAD_KEY] = enabled }
    }
    
    val aiToolsAutoExecute: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_TOOLS_AUTO_EXECUTE_KEY] ?: false }
    
    suspend fun setAiToolsAutoExecute(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_TOOLS_AUTO_EXECUTE_KEY] = enabled }
    }
    
    // ==================== AI Content Cache ====================
    
    val aiContentCacheEnabled: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_CONTENT_CACHE_ENABLED_KEY] ?: true }
    
    suspend fun setAiContentCacheEnabled(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_CONTENT_CACHE_ENABLED_KEY] = enabled }
    }
    
    val aiContentCacheSizeMb: Flow<Long> = context.aiSettingsDataStore.data
        .map { it[AI_CONTENT_CACHE_SIZE_MB_KEY] ?: 500L }
    
    suspend fun setAiContentCacheSizeMb(sizeMb: Long) {
        context.aiSettingsDataStore.edit { it[AI_CONTENT_CACHE_SIZE_MB_KEY] = sizeMb.coerceIn(50L, 5000L) }
    }
    
    val aiContentCacheLocation: Flow<String> = context.aiSettingsDataStore.data
        .map { it[AI_CONTENT_CACHE_LOCATION_KEY] ?: "internal" }
    
    suspend fun setAiContentCacheLocation(location: String) {
        context.aiSettingsDataStore.edit { it[AI_CONTENT_CACHE_LOCATION_KEY] = location }
    }
    
    // ==================== AI Library Access ====================
    
    val aiLibraryAccessEnabled: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_LIBRARY_ACCESS_KEY] ?: true }
    
    suspend fun setAiLibraryAccessEnabled(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_LIBRARY_ACCESS_KEY] = enabled }
    }
    
    val aiLibraryAccessBooks: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_LIBRARY_ACCESS_BOOKS_KEY] ?: true }
    
    suspend fun setAiLibraryAccessBooks(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_LIBRARY_ACCESS_BOOKS_KEY] = enabled }
    }
    
    val aiLibraryAccessMovies: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_LIBRARY_ACCESS_MOVIES_KEY] ?: true }
    
    suspend fun setAiLibraryAccessMovies(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_LIBRARY_ACCESS_MOVIES_KEY] = enabled }
    }
    
    val aiLibraryAccessMusic: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_LIBRARY_ACCESS_MUSIC_KEY] ?: true }
    
    suspend fun setAiLibraryAccessMusic(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_LIBRARY_ACCESS_MUSIC_KEY] = enabled }
    }
    
    val aiLibraryAccessComics: Flow<Boolean> = context.aiSettingsDataStore.data
        .map { it[AI_LIBRARY_ACCESS_COMICS_KEY] ?: true }
    
    suspend fun setAiLibraryAccessComics(enabled: Boolean) {
        context.aiSettingsDataStore.edit { it[AI_LIBRARY_ACCESS_COMICS_KEY] = enabled }
    }
}
