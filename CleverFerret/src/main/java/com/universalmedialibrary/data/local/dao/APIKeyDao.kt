package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.model.APIKey
import kotlinx.coroutines.flow.Flow

data class ProviderKeyPair(
    val provider: String,
    val keyValue: String
)

@Dao
interface APIKeyDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAPIKey(apiKey: APIKey)

    @Update
    suspend fun updateAPIKey(apiKey: APIKey)

    @Query("SELECT * FROM api_keys WHERE isActive = 1 ORDER BY category, keyName")
    fun getAllActiveAPIKeys(): Flow<List<APIKey>>

    @Query("SELECT * FROM api_keys WHERE provider = :provider AND isActive = 1 LIMIT 1")
    suspend fun getAPIKeyByProvider(provider: String): APIKey?

    @Query("SELECT * FROM api_keys WHERE category = :category AND isActive = 1")
    suspend fun getAPIKeysByCategory(category: String): List<APIKey>

    @Query("SELECT * FROM api_keys ORDER BY category, keyName")
    fun getAllAPIKeys(): Flow<List<APIKey>>

    @Query("UPDATE api_keys SET keyValue = :keyValue, updatedAt = :updatedAt WHERE provider = :provider")
    suspend fun updateAPIKeyValue(provider: String, keyValue: String, updatedAt: Long = System.currentTimeMillis())

    @Query("UPDATE api_keys SET validationStatus = :status, lastValidated = :timestamp WHERE provider = :provider")
    suspend fun updateValidationStatus(provider: String, status: String, timestamp: Long = System.currentTimeMillis())

    @Query("DELETE FROM api_keys WHERE provider = :provider")
    suspend fun deleteAPIKeyByProvider(provider: String)

    @Query("UPDATE api_keys SET isActive = :isActive WHERE provider = :provider")
    suspend fun setAPIKeyActive(provider: String, isActive: Boolean)

    @Query("SELECT COUNT(*) FROM api_keys WHERE category = :category AND isActive = 1 AND validationStatus = 'valid'")
    suspend fun getValidAPIKeysCountByCategory(category: String): Int

    @Query("SELECT keyValue FROM api_keys WHERE provider = :provider AND isActive = 1 LIMIT 1")
    suspend fun getAPIKeyValue(provider: String): String?

    // Get active provider-key pairs for easy map conversion
    @Query("SELECT provider, keyValue FROM api_keys WHERE isActive = 1 AND keyValue != ''")
    suspend fun getActiveProviderKeys(): List<ProviderKeyPair>
}