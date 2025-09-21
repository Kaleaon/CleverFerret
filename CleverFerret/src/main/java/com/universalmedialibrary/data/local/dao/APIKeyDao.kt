package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.APIKey
import kotlinx.coroutines.flow.Flow

@Dao
interface APIKeyDao {
    
    @Query("SELECT * FROM api_keys")
    fun getAllAPIKeys(): Flow<List<APIKey>>
    
    @Query("SELECT * FROM api_keys WHERE provider = :provider")
    suspend fun getAPIKey(provider: String): APIKey?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOrUpdate(apiKey: APIKey)
    
    @Query("UPDATE api_keys SET validation_status = :status, last_validated = :timestamp WHERE provider = :provider")
    suspend fun updateValidationStatus(provider: String, status: String, timestamp: Long = System.currentTimeMillis())
    
    @Query("DELETE FROM api_keys WHERE provider = :provider")
    suspend fun deleteAPIKey(provider: String)
    
    @Query("SELECT * FROM api_keys WHERE category = :category")
    fun getAPIKeysByCategory(category: String): Flow<List<APIKey>>
}