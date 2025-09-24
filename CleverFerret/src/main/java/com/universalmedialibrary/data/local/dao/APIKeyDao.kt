package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.APIKey
import kotlinx.coroutines.flow.Flow

/**
 * DAO for API key management
 */
@Dao
interface APIKeyDao {
    
    @Query("SELECT * FROM api_keys WHERE isActive = 1 ORDER BY displayName ASC")
    fun getAllActiveAPIKeys(): Flow<List<APIKey>>
    
    @Query("SELECT * FROM api_keys ORDER BY displayName ASC")
    fun getAllAPIKeys(): Flow<List<APIKey>>
    
    @Query("SELECT * FROM api_keys WHERE provider = :provider")
    suspend fun getAPIKeyByProvider(provider: String): APIKey?
    
    @Query("SELECT * FROM api_keys WHERE category = :category AND isActive = 1")
    suspend fun getAPIKeysByCategory(category: String): List<APIKey>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAPIKey(apiKey: APIKey): Long
    
    @Update
    suspend fun updateAPIKey(apiKey: APIKey)
    
    @Delete
    suspend fun deleteAPIKey(apiKey: APIKey)
    
    @Query("UPDATE api_keys SET keyValue = :keyValue WHERE provider = :provider")
    suspend fun updateAPIKeyValue(provider: String, keyValue: String)
    
    @Query("UPDATE api_keys SET validationStatus = :status, lastValidated = :timestamp WHERE provider = :provider")
    suspend fun updateValidationStatus(provider: String, status: String, timestamp: Long)
    
    @Query("UPDATE api_keys SET isActive = :isActive WHERE provider = :provider")
    suspend fun setAPIKeyActive(provider: String, isActive: Boolean)
    
    @Query("UPDATE api_keys SET usageCount = usageCount + 1, lastUsed = :timestamp WHERE provider = :provider")
    suspend fun incrementUsage(provider: String, timestamp: Long)
    
    @Query("UPDATE api_keys SET currentDailyUsage = currentDailyUsage + 1 WHERE provider = :provider")
    suspend fun incrementDailyUsage(provider: String)
    
    @Query("UPDATE api_keys SET currentMonthlyUsage = currentMonthlyUsage + 1 WHERE provider = :provider")
    suspend fun incrementMonthlyUsage(provider: String)
    
    @Query("UPDATE api_keys SET currentDailyUsage = 0")
    suspend fun resetDailyUsage()
    
    @Query("UPDATE api_keys SET currentMonthlyUsage = 0")
    suspend fun resetMonthlyUsage()
    
    @Query("DELETE FROM api_keys WHERE provider = :provider")
    suspend fun deleteAPIKeyByProvider(provider: String)
    
    @Query("SELECT COUNT(*) FROM api_keys WHERE category = :category AND validationStatus = 'VALID' AND isActive = 1")
    suspend fun getValidAPIKeysCountByCategory(category: String): Int
    
    @Query("SELECT keyValue FROM api_keys WHERE provider = :provider AND isActive = 1 AND validationStatus = 'VALID'")
    suspend fun getAPIKeyValue(provider: String): String?
    
    @Query("SELECT provider, keyValue FROM api_keys WHERE isActive = 1 AND validationStatus = 'VALID'")
    suspend fun getActiveAPIKeysAsList(): List<APIKeyPair>
    
    // Data class for key-value pairs
    data class APIKeyPair(
        val provider: String,
        val keyValue: String
    )
}