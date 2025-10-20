package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.SecuritySettingsEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for security settings persistence
 */
@Dao
interface SecuritySettingsDao {
    
    @Query("SELECT * FROM security_settings WHERE id = 1")
    fun getSettings(): Flow<SecuritySettingsEntity?>
    
    @Query("SELECT * FROM security_settings WHERE id = 1")
    suspend fun getSettingsSync(): SecuritySettingsEntity?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSettings(settings: SecuritySettingsEntity)
    
    @Update
    suspend fun updateSettings(settings: SecuritySettingsEntity)
    
    @Query("UPDATE security_settings SET requireBiometric = :enabled WHERE id = 1")
    suspend fun setRequireBiometric(enabled: Boolean)
    
    @Query("UPDATE security_settings SET lockTimeoutMinutes = :minutes WHERE id = 1")
    suspend fun setLockTimeout(minutes: Int)
    
    @Query("UPDATE security_settings SET allowScreenshots = :allowed WHERE id = 1")
    suspend fun setAllowScreenshots(allowed: Boolean)
    
    @Query("UPDATE security_settings SET hideInRecents = :hide WHERE id = 1")
    suspend fun setHideInRecents(hide: Boolean)
    
    @Query("DELETE FROM security_settings")
    suspend fun deleteAll()
}
