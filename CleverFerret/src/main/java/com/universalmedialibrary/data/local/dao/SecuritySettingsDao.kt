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
    
    @Query("""
        INSERT OR REPLACE INTO security_settings (id, requireBiometric, lockTimeoutMinutes, 
            allowScreenshots, hideInRecents)
        VALUES (
            1,
            :enabled,
            COALESCE((SELECT lockTimeoutMinutes FROM security_settings WHERE id = 1), 15),
            COALESCE((SELECT allowScreenshots FROM security_settings WHERE id = 1), 1),
            COALESCE((SELECT hideInRecents FROM security_settings WHERE id = 1), 0)
        )
    """)
    suspend fun setRequireBiometric(enabled: Boolean)
    
    @Query("""
        INSERT OR REPLACE INTO security_settings (id, requireBiometric, lockTimeoutMinutes, 
            allowScreenshots, hideInRecents)
        VALUES (
            1,
            COALESCE((SELECT requireBiometric FROM security_settings WHERE id = 1), 0),
            :minutes,
            COALESCE((SELECT allowScreenshots FROM security_settings WHERE id = 1), 1),
            COALESCE((SELECT hideInRecents FROM security_settings WHERE id = 1), 0)
        )
    """)
    suspend fun setLockTimeout(minutes: Int)
    
    @Query("""
        INSERT OR REPLACE INTO security_settings (id, requireBiometric, lockTimeoutMinutes, 
            allowScreenshots, hideInRecents)
        VALUES (
            1,
            COALESCE((SELECT requireBiometric FROM security_settings WHERE id = 1), 0),
            COALESCE((SELECT lockTimeoutMinutes FROM security_settings WHERE id = 1), 15),
            :allowed,
            COALESCE((SELECT hideInRecents FROM security_settings WHERE id = 1), 0)
        )
    """)
    suspend fun setAllowScreenshots(allowed: Boolean)
    
    @Query("""
        INSERT OR REPLACE INTO security_settings (id, requireBiometric, lockTimeoutMinutes, 
            allowScreenshots, hideInRecents)
        VALUES (
            1,
            COALESCE((SELECT requireBiometric FROM security_settings WHERE id = 1), 0),
            COALESCE((SELECT lockTimeoutMinutes FROM security_settings WHERE id = 1), 15),
            COALESCE((SELECT allowScreenshots FROM security_settings WHERE id = 1), 1),
            :hide
        )
    """)
    suspend fun setHideInRecents(hide: Boolean)
    
    @Query("DELETE FROM security_settings")
    suspend fun deleteAll()
}
