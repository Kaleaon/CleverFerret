package com.universalmedialibrary.services.gallery

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.intPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

private val Context.galleryDataStore: DataStore<Preferences> by preferencesDataStore(
    name = "gallery_preferences"
)

/**
 * Gallery Preferences Store
 * 
 * Persists gallery-specific settings and user metadata using DataStore.
 */
@Singleton
class GalleryPreferencesStore @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val dataStore = context.galleryDataStore
    
    companion object {
        // View preferences
        private val VIEW_MODE = stringPreferencesKey("view_mode")
        private val SORT_ORDER = stringPreferencesKey("sort_order")
        private val SHOW_HIDDEN = booleanPreferencesKey("show_hidden")
        private val GRID_COLUMNS = intPreferencesKey("grid_columns")
        
        // User metadata storage
        private val USER_METADATA = stringPreferencesKey("user_metadata")
        
        // Album preferences
        private val PINNED_ALBUMS = stringPreferencesKey("pinned_albums")
        private val HIDDEN_ALBUMS = stringPreferencesKey("hidden_albums")
        private val ALBUM_SORT_ORDER = stringPreferencesKey("album_sort_order")
        
        // Feature toggles
        private val ENABLE_FACE_DETECTION = booleanPreferencesKey("enable_face_detection")
        private val ENABLE_AI_TAGS = booleanPreferencesKey("enable_ai_tags")
        private val ENABLE_LOCATION_GROUPING = booleanPreferencesKey("enable_location_grouping")
        private val ENABLE_MEMORIES = booleanPreferencesKey("enable_memories")
        
        // Display preferences
        private val SHOW_FILE_INFO = booleanPreferencesKey("show_file_info")
        private val SHOW_EXIF_DATA = booleanPreferencesKey("show_exif_data")
        private val AUTO_PLAY_VIDEOS = booleanPreferencesKey("auto_play_videos")
        private val LOOP_VIDEOS = booleanPreferencesKey("loop_videos")
        
        private val json = Json { 
            ignoreUnknownKeys = true 
            encodeDefaults = true
        }
    }
    
    // ==================== VIEW PREFERENCES ====================
    
    val viewMode: Flow<GalleryViewMode> = dataStore.data.map { prefs ->
        prefs[VIEW_MODE]?.let { 
            try { GalleryViewMode.valueOf(it) } catch (e: Exception) { null }
        } ?: GalleryViewMode.GRID_MEDIUM
    }
    
    suspend fun setViewMode(mode: GalleryViewMode) {
        dataStore.edit { prefs ->
            prefs[VIEW_MODE] = mode.name
        }
    }
    
    val sortOrder: Flow<GallerySortOrder> = dataStore.data.map { prefs ->
        prefs[SORT_ORDER]?.let {
            try { GallerySortOrder.valueOf(it) } catch (e: Exception) { null }
        } ?: GallerySortOrder.DATE_TAKEN_DESC
    }
    
    suspend fun setSortOrder(order: GallerySortOrder) {
        dataStore.edit { prefs ->
            prefs[SORT_ORDER] = order.name
        }
    }
    
    val showHidden: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[SHOW_HIDDEN] ?: false
    }
    
    suspend fun setShowHidden(show: Boolean) {
        dataStore.edit { prefs ->
            prefs[SHOW_HIDDEN] = show
        }
    }
    
    val gridColumns: Flow<Int> = dataStore.data.map { prefs ->
        prefs[GRID_COLUMNS] ?: 3
    }
    
    suspend fun setGridColumns(columns: Int) {
        dataStore.edit { prefs ->
            prefs[GRID_COLUMNS] = columns.coerceIn(2, 6)
        }
    }
    
    // ==================== USER METADATA ====================
    
    suspend fun saveUserMetadata(metadata: Map<Long, GalleryUserMetadata>) {
        val jsonString = json.encodeToString(metadata.mapKeys { it.key.toString() })
        dataStore.edit { prefs ->
            prefs[USER_METADATA] = jsonString
        }
    }
    
    suspend fun loadUserMetadata(): Map<Long, GalleryUserMetadata> {
        val jsonString = dataStore.data.first()[USER_METADATA] ?: return emptyMap()
        return try {
            val stringMap: Map<String, GalleryUserMetadata> = json.decodeFromString(jsonString)
            stringMap.mapKeys { it.key.toLong() }
        } catch (e: Exception) {
            emptyMap()
        }
    }
    
    // ==================== ALBUM PREFERENCES ====================
    
    val pinnedAlbums: Flow<Set<String>> = dataStore.data.map { prefs ->
        prefs[PINNED_ALBUMS]?.let {
            try { json.decodeFromString<Set<String>>(it) } catch (e: Exception) { emptySet() }
        } ?: emptySet()
    }
    
    suspend fun setPinnedAlbums(albumIds: Set<String>) {
        dataStore.edit { prefs ->
            prefs[PINNED_ALBUMS] = json.encodeToString(albumIds)
        }
    }
    
    suspend fun toggleAlbumPin(albumId: String) {
        val current = dataStore.data.first()[PINNED_ALBUMS]?.let {
            try { json.decodeFromString<Set<String>>(it) } catch (e: Exception) { emptySet() }
        } ?: emptySet()
        
        val updated = if (albumId in current) current - albumId else current + albumId
        setPinnedAlbums(updated)
    }
    
    val hiddenAlbums: Flow<Set<String>> = dataStore.data.map { prefs ->
        prefs[HIDDEN_ALBUMS]?.let {
            try { json.decodeFromString<Set<String>>(it) } catch (e: Exception) { emptySet() }
        } ?: emptySet()
    }
    
    suspend fun setHiddenAlbums(albumIds: Set<String>) {
        dataStore.edit { prefs ->
            prefs[HIDDEN_ALBUMS] = json.encodeToString(albumIds)
        }
    }
    
    suspend fun toggleAlbumHidden(albumId: String) {
        val current = dataStore.data.first()[HIDDEN_ALBUMS]?.let {
            try { json.decodeFromString<Set<String>>(it) } catch (e: Exception) { emptySet() }
        } ?: emptySet()
        
        val updated = if (albumId in current) current - albumId else current + albumId
        setHiddenAlbums(updated)
    }
    
    // ==================== FEATURE TOGGLES ====================
    
    val enableFaceDetection: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[ENABLE_FACE_DETECTION] ?: false // Off by default (privacy)
    }
    
    suspend fun setEnableFaceDetection(enabled: Boolean) {
        dataStore.edit { prefs ->
            prefs[ENABLE_FACE_DETECTION] = enabled
        }
    }
    
    val enableAiTags: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[ENABLE_AI_TAGS] ?: false // Off by default
    }
    
    suspend fun setEnableAiTags(enabled: Boolean) {
        dataStore.edit { prefs ->
            prefs[ENABLE_AI_TAGS] = enabled
        }
    }
    
    val enableLocationGrouping: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[ENABLE_LOCATION_GROUPING] ?: true
    }
    
    suspend fun setEnableLocationGrouping(enabled: Boolean) {
        dataStore.edit { prefs ->
            prefs[ENABLE_LOCATION_GROUPING] = enabled
        }
    }
    
    val enableMemories: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[ENABLE_MEMORIES] ?: true
    }
    
    suspend fun setEnableMemories(enabled: Boolean) {
        dataStore.edit { prefs ->
            prefs[ENABLE_MEMORIES] = enabled
        }
    }
    
    // ==================== DISPLAY PREFERENCES ====================
    
    val showFileInfo: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[SHOW_FILE_INFO] ?: false
    }
    
    suspend fun setShowFileInfo(show: Boolean) {
        dataStore.edit { prefs ->
            prefs[SHOW_FILE_INFO] = show
        }
    }
    
    val showExifData: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[SHOW_EXIF_DATA] ?: true
    }
    
    suspend fun setShowExifData(show: Boolean) {
        dataStore.edit { prefs ->
            prefs[SHOW_EXIF_DATA] = show
        }
    }
    
    val autoPlayVideos: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[AUTO_PLAY_VIDEOS] ?: false
    }
    
    suspend fun setAutoPlayVideos(autoPlay: Boolean) {
        dataStore.edit { prefs ->
            prefs[AUTO_PLAY_VIDEOS] = autoPlay
        }
    }
    
    val loopVideos: Flow<Boolean> = dataStore.data.map { prefs ->
        prefs[LOOP_VIDEOS] ?: false
    }
    
    suspend fun setLoopVideos(loop: Boolean) {
        dataStore.edit { prefs ->
            prefs[LOOP_VIDEOS] = loop
        }
    }
    
    // ==================== GALLERY SETTINGS DATA CLASS ====================
    
    /**
     * Get current gallery settings as a single object
     */
    val settings: Flow<GallerySettings> = dataStore.data.map { prefs ->
        GallerySettings(
            viewMode = prefs[VIEW_MODE]?.let { 
                try { GalleryViewMode.valueOf(it) } catch (e: Exception) { null }
            } ?: GalleryViewMode.GRID_MEDIUM,
            sortOrder = prefs[SORT_ORDER]?.let {
                try { GallerySortOrder.valueOf(it) } catch (e: Exception) { null }
            } ?: GallerySortOrder.DATE_TAKEN_DESC,
            showHidden = prefs[SHOW_HIDDEN] ?: false,
            gridColumns = prefs[GRID_COLUMNS] ?: 3,
            enableFaceDetection = prefs[ENABLE_FACE_DETECTION] ?: false,
            enableAiTags = prefs[ENABLE_AI_TAGS] ?: false,
            enableLocationGrouping = prefs[ENABLE_LOCATION_GROUPING] ?: true,
            enableMemories = prefs[ENABLE_MEMORIES] ?: true,
            showFileInfo = prefs[SHOW_FILE_INFO] ?: false,
            showExifData = prefs[SHOW_EXIF_DATA] ?: true,
            autoPlayVideos = prefs[AUTO_PLAY_VIDEOS] ?: false,
            loopVideos = prefs[LOOP_VIDEOS] ?: false
        )
    }
}

/**
 * Combined gallery settings
 */
data class GallerySettings(
    val viewMode: GalleryViewMode = GalleryViewMode.GRID_MEDIUM,
    val sortOrder: GallerySortOrder = GallerySortOrder.DATE_TAKEN_DESC,
    val showHidden: Boolean = false,
    val gridColumns: Int = 3,
    val enableFaceDetection: Boolean = false,
    val enableAiTags: Boolean = false,
    val enableLocationGrouping: Boolean = true,
    val enableMemories: Boolean = true,
    val showFileInfo: Boolean = false,
    val showExifData: Boolean = true,
    val autoPlayVideos: Boolean = false,
    val loopVideos: Boolean = false
)
