package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.GeneralSettingsEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for general settings persistence
 */
@Dao
interface GeneralSettingsDao {
    
    @Query("SELECT * FROM general_settings WHERE id = 1")
    fun getSettings(): Flow<GeneralSettingsEntity?>
    
    @Query("SELECT * FROM general_settings WHERE id = 1")
    suspend fun getSettingsSync(): GeneralSettingsEntity?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSettings(settings: GeneralSettingsEntity)
    
    @Update
    suspend fun updateSettings(settings: GeneralSettingsEntity)
    
    @Query("""
        INSERT OR REPLACE INTO general_settings (id, themeMode, themePalette, defaultFontSize, 
            defaultPlaybackSpeed, autoPlayNext)
        VALUES (
            1,
            :mode,
            COALESCE((SELECT themePalette FROM general_settings WHERE id = 1), 'default'),
            COALESCE((SELECT defaultFontSize FROM general_settings WHERE id = 1), 16),
            COALESCE((SELECT defaultPlaybackSpeed FROM general_settings WHERE id = 1), 1.0),
            COALESCE((SELECT autoPlayNext FROM general_settings WHERE id = 1), 1)
        )
    """)
    suspend fun setThemeMode(mode: String)
    
    @Query("""
        INSERT OR REPLACE INTO general_settings (id, themeMode, themePalette, defaultFontSize, 
            defaultPlaybackSpeed, autoPlayNext)
        VALUES (
            1,
            COALESCE((SELECT themeMode FROM general_settings WHERE id = 1), 'system'),
            :palette,
            COALESCE((SELECT defaultFontSize FROM general_settings WHERE id = 1), 16),
            COALESCE((SELECT defaultPlaybackSpeed FROM general_settings WHERE id = 1), 1.0),
            COALESCE((SELECT autoPlayNext FROM general_settings WHERE id = 1), 1)
        )
    """)
    suspend fun setThemePalette(palette: String)
    
    @Query("""
        INSERT OR REPLACE INTO general_settings (id, themeMode, themePalette, defaultFontSize, 
            defaultPlaybackSpeed, autoPlayNext)
        VALUES (
            1,
            COALESCE((SELECT themeMode FROM general_settings WHERE id = 1), 'system'),
            COALESCE((SELECT themePalette FROM general_settings WHERE id = 1), 'default'),
            :size,
            COALESCE((SELECT defaultPlaybackSpeed FROM general_settings WHERE id = 1), 1.0),
            COALESCE((SELECT autoPlayNext FROM general_settings WHERE id = 1), 1)
        )
    """)
    suspend fun setFontSize(size: Int)
    
    @Query("""
        INSERT OR REPLACE INTO general_settings (id, themeMode, themePalette, defaultFontSize, 
            defaultPlaybackSpeed, autoPlayNext)
        VALUES (
            1,
            COALESCE((SELECT themeMode FROM general_settings WHERE id = 1), 'system'),
            COALESCE((SELECT themePalette FROM general_settings WHERE id = 1), 'default'),
            COALESCE((SELECT defaultFontSize FROM general_settings WHERE id = 1), 16),
            :speed,
            COALESCE((SELECT autoPlayNext FROM general_settings WHERE id = 1), 1)
        )
    """)
    suspend fun setPlaybackSpeed(speed: Float)
    
    @Query("""
        INSERT OR REPLACE INTO general_settings (id, themeMode, themePalette, defaultFontSize, 
            defaultPlaybackSpeed, autoPlayNext)
        VALUES (
            1,
            COALESCE((SELECT themeMode FROM general_settings WHERE id = 1), 'system'),
            COALESCE((SELECT themePalette FROM general_settings WHERE id = 1), 'default'),
            COALESCE((SELECT defaultFontSize FROM general_settings WHERE id = 1), 16),
            COALESCE((SELECT defaultPlaybackSpeed FROM general_settings WHERE id = 1), 1.0),
            :enabled
        )
    """)
    suspend fun setAutoPlayNext(enabled: Boolean)
    
    @Query("DELETE FROM general_settings")
    suspend fun deleteAll()
}
