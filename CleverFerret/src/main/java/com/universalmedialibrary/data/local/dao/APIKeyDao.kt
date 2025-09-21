package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.model.APIKey
import kotlinx.coroutines.flow.Flow

/**
 * A data class to hold a provider and its corresponding API key value.
 * Useful for creating maps of provider keys.
 *
 * @property provider The name of the API provider (e.g., "TMDB").
 * @property keyValue The API key for the provider.
 */
data class ProviderKeyPair(
    val provider: String,
    val keyValue: String
)

/**
 * Data Access Object (DAO) for managing API keys in the database.
 * Provides methods for inserting, updating, deleting, and querying API keys.
 */
@Dao
interface APIKeyDao {

    /**
     * Inserts a new API key into the database. If the key already exists, it will be replaced.
     *
     * @param apiKey The [APIKey] object to insert.
     */
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAPIKey(apiKey: APIKey)

    /**
     * Updates an existing API key in the database.
     *
     * @param apiKey The [APIKey] object to update.
     */
    @Update
    suspend fun updateAPIKey(apiKey: APIKey)

    /**
     * Retrieves all active API keys from the database, ordered by category and name.
     *
     * @return a [Flow] emitting a list of all active [APIKey]s.
     */
    @Query("SELECT * FROM api_keys WHERE isActive = 1 ORDER BY category, keyName")
    fun getAllActiveAPIKeys(): Flow<List<APIKey>>

    /**
     * Retrieves an active API key by its provider name.
     *
     * @param provider The name of the provider to search for.
     * @return The [APIKey] for the given provider, or null if not found or not active.
     */
    @Query("SELECT * FROM api_keys WHERE provider = :provider AND isActive = 1 LIMIT 1")
    suspend fun getAPIKeyByProvider(provider: String): APIKey?

    /**
     * Retrieves all active API keys for a specific category.
     *
     * @param category The category to search for (e.g., "movies", "books").
     * @return A list of active [APIKey]s for the given category.
     */
    @Query("SELECT * FROM api_keys WHERE category = :category AND isActive = 1")
    suspend fun getAPIKeysByCategory(category: String): List<APIKey>

    /**
     * Retrieves all API keys from the database, ordered by category and name.
     *
     * @return A [Flow] emitting a list of all [APIKey]s.
     */
    @Query("SELECT * FROM api_keys ORDER BY category, keyName")
    fun getAllAPIKeys(): Flow<List<APIKey>>

    /**
     * Updates the value of an API key for a specific provider.
     *
     * @param provider The provider of the key to update.
     * @param keyValue The new API key value.
     * @param updatedAt The timestamp of the update. Defaults to the current time.
     */
    @Query("UPDATE api_keys SET keyValue = :keyValue, updatedAt = :updatedAt WHERE provider = :provider")
    suspend fun updateAPIKeyValue(provider: String, keyValue: String, updatedAt: Long = System.currentTimeMillis())

    /**
     * Updates the validation status and last validated timestamp for a provider's API key.
     *
     * @param provider The provider of the key to update.
     * @param status The new validation status (e.g., "valid", "invalid").
     * @param timestamp The timestamp of the validation. Defaults to the current time.
     */
    @Query("UPDATE api_keys SET validationStatus = :status, lastValidated = :timestamp WHERE provider = :provider")
    suspend fun updateValidationStatus(provider: String, status: String, timestamp: Long = System.currentTimeMillis())

    /**
     * Deletes an API key from the database by its provider name.
     *
     * @param provider The provider of the key to delete.
     */
    @Query("DELETE FROM api_keys WHERE provider = :provider")
    suspend fun deleteAPIKeyByProvider(provider: String)

    /**
     * Sets the active status of an API key for a given provider.
     *
     * @param provider The provider of the key to update.
     * @param isActive The new active status.
     */
    @Query("UPDATE api_keys SET isActive = :isActive WHERE provider = :provider")
    suspend fun setAPIKeyActive(provider: String, isActive: Boolean)

    /**
     * Counts the number of valid and active API keys for a specific category.
     *
     * @param category The category to count keys for.
     * @return The number of valid and active keys.
     */
    @Query("SELECT COUNT(*) FROM api_keys WHERE category = :category AND isActive = 1 AND validationStatus = 'valid'")
    suspend fun getValidAPIKeysCountByCategory(category: String): Int

    /**
     * Retrieves just the key value for a given provider.
     *
     * @param provider The provider to get the key for.
     * @return The API key value as a [String], or null if not found or not active.
     */
    @Query("SELECT keyValue FROM api_keys WHERE provider = :provider AND isActive = 1 LIMIT 1")
    suspend fun getAPIKeyValue(provider: String): String?

    /**
     * Retrieves a list of active provider-key pairs.
     * This is useful for creating a map of keys for use in network requests.
     *
     * @return A list of [ProviderKeyPair] objects.
     */
    @Query("SELECT provider, keyValue FROM api_keys WHERE isActive = 1 AND keyValue != ''")
    suspend fun getActiveProviderKeys(): List<ProviderKeyPair>
}
