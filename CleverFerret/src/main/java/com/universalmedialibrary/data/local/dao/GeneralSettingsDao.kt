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
    
    @Query("UPDATE general_settings SET themeMode = :mode WHERE id = 1")
    suspend fun setThemeMode(mode: String)
    
    @Query("UPDATE general_settings SET themePalette = :palette WHERE id = 1")
    suspend fun setThemePalette(palette: String)
    
    @Query("UPDATE general_settings SET defaultFontSize = :size WHERE id = 1")
    suspend fun setFontSize(size: Int)
    
    @Query("UPDATE general_settings SET defaultPlaybackSpeed = :speed WHERE id = 1")
    suspend fun setPlaybackSpeed(speed: Float)
    
    @Query("UPDATE general_settings SET autoPlayNext = :enabled WHERE id = 1")
    suspend fun setAutoPlayNext(enabled: Boolean)
    
    @Query("DELETE FROM general_settings")
    suspend fun deleteAll()
}
