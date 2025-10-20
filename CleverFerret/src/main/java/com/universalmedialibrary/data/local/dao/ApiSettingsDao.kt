package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.ApiSettingsEntity
import kotlinx.coroutines.flow.Flow

@Dao
interface ApiSettingsDao {
    
    @Query("SELECT * FROM api_settings")
    fun getAllSettings(): Flow<List<ApiSettingsEntity>>
    
    @Query("SELECT * FROM api_settings WHERE serviceId = :serviceId")
    fun getSettingsByService(serviceId: String): Flow<ApiSettingsEntity?>
    
    @Query("SELECT * FROM api_settings WHERE serviceId = :serviceId")
    suspend fun getSettingsByServiceSync(serviceId: String): ApiSettingsEntity?
    
    @Query("SELECT * FROM api_settings WHERE category = :category")
    fun getSettingsByCategory(category: String): Flow<List<ApiSettingsEntity>>
    
    @Query("SELECT * FROM api_settings WHERE isConfigured = 1")
    fun getConfiguredSettings(): Flow<List<ApiSettingsEntity>>
    
    @Query("SELECT * FROM api_settings WHERE isConfigured = 0")
    fun getUnconfiguredSettings(): Flow<List<ApiSettingsEntity>>
    
    @Query("SELECT * FROM api_settings WHERE enabled = 1")
    fun getEnabledSettings(): Flow<List<ApiSettingsEntity>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSetting(setting: ApiSettingsEntity)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSettings(settings: List<ApiSettingsEntity>)
    
    @Update
    suspend fun updateSetting(setting: ApiSettingsEntity)
    
    @Delete
    suspend fun deleteSetting(setting: ApiSettingsEntity)
    
    @Query("DELETE FROM api_settings WHERE serviceId = :serviceId")
    suspend fun deleteByServiceId(serviceId: String)
    
    @Query("UPDATE api_settings SET isConfigured = :configured, hasApiKey = :hasKey, updatedAt = :timestamp WHERE serviceId = :serviceId")
    suspend fun updateConfigurationStatus(
        serviceId: String,
        configured: Boolean,
        hasKey: Boolean,
        timestamp: Long = System.currentTimeMillis()
    )
    
    @Query("UPDATE api_settings SET enabled = :enabled, updatedAt = :timestamp WHERE serviceId = :serviceId")
    suspend fun updateEnabled(
        serviceId: String,
        enabled: Boolean,
        timestamp: Long = System.currentTimeMillis()
    )
    
    @Query("UPDATE api_settings SET model = :model, updatedAt = :timestamp WHERE serviceId = :serviceId")
    suspend fun updateModel(
        serviceId: String,
        model: String,
        timestamp: Long = System.currentTimeMillis()
    )
    
    @Query("UPDATE api_settings SET voiceId = :voiceId, updatedAt = :timestamp WHERE serviceId = :serviceId")
    suspend fun updateVoiceId(
        serviceId: String,
        voiceId: String,
        timestamp: Long = System.currentTimeMillis()
    )
    
    @Query("UPDATE api_settings SET lastUsed = :timestamp, usageCount = usageCount + 1 WHERE serviceId = :serviceId")
    suspend fun recordUsage(
        serviceId: String,
        timestamp: Long = System.currentTimeMillis()
    )
    
    @Query("UPDATE api_settings SET priority = :priority, updatedAt = :timestamp WHERE serviceId = :serviceId")
    suspend fun updatePriority(
        serviceId: String,
        priority: Int,
        timestamp: Long = System.currentTimeMillis()
    )
    
    @Query("DELETE FROM api_settings")
    suspend fun deleteAll()
}
