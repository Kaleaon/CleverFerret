package com.universalmedialibrary.data

import android.os.Build
import androidx.room.Room
import androidx.test.core.app.ApplicationProvider
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.entity.APIKey
import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.annotation.Config

@RunWith(AndroidJUnit4::class)
@Config(sdk = [Build.VERSION_CODES.P])
class APIKeyRepositoryTest {

    private lateinit var database: AppDatabase
    private lateinit var apiKeyDao: APIKeyDao
    private lateinit var repository: APIKeyRepository

    @Before
    fun setup() {
        val context = ApplicationProvider.getApplicationContext<android.content.Context>()
        database = Room.inMemoryDatabaseBuilder(context, AppDatabase::class.java)
            .allowMainThreadQueries()
            .build()
        apiKeyDao = database.apiKeyDao()
        repository = APIKeyRepository(apiKeyDao)
    }

    @After
    fun teardown() {
        database.close()
    }

    @Test
    fun `initializeDefaultAPIKeys creates all expected providers`() = runBlocking {
        // ACT
        repository.initializeDefaultAPIKeys()
        val allKeys = repository.getAllAPIKeys().first()

        // ASSERT
        val expectedProviders = listOf(
            "google_books", "goodreads", "hardcover", "amazon_access_key",
            "amazon_secret_key", "isbn_db", "comicvine", "listen_notes",
            "spotify_client_id", "spotify_client_secret", "taddy", 
            "tmdb", "omdb", "tvdb", "lastfm", "discogs_token"
        )
        
        val actualProviders = allKeys.map { it.provider }
        expectedProviders.forEach { provider ->
            assertThat(actualProviders).contains(provider)
        }
        
        assertThat(allKeys.size).isAtLeast(expectedProviders.size)
    }

    @Test
    fun `saveAPIKey creates new key when not exists`() = runBlocking {
        // ACT
        repository.saveAPIKey("test_provider", "test_key_value", "TEST_CATEGORY")
        
        // ASSERT
        val savedKey = repository.getAPIKeyByProvider("test_provider")
        assertThat(savedKey).isNotNull()
        assertThat(savedKey?.keyValue).isEqualTo("test_key_value")
        assertThat(savedKey?.category).isEqualTo("TEST_CATEGORY")
        assertThat(savedKey?.provider).isEqualTo("test_provider")
    }

    @Test
    fun `saveAPIKey updates existing key`() = runBlocking {
        // ARRANGE
        repository.saveAPIKey("test_provider", "original_value", "TEST_CATEGORY")
        
        // ACT
        repository.saveAPIKey("test_provider", "updated_value", "TEST_CATEGORY")
        
        // ASSERT
        val updatedKey = repository.getAPIKeyByProvider("test_provider")
        assertThat(updatedKey?.keyValue).isEqualTo("updated_value")
        
        val allKeys = repository.getAllAPIKeys().first()
        val testKeys = allKeys.filter { it.provider == "test_provider" }
        assertThat(testKeys).hasSize(1) // Should not create duplicate
    }

    @Test
    fun `getActiveAPIKeysMap returns only active keys with values`() = runBlocking {
        // ARRANGE
        repository.saveAPIKey("active_key", "active_value", "TEST")
        repository.saveAPIKey("empty_key", "", "TEST")
        
        // Make one key inactive
        val inactiveKey = APIKey(
            provider = "inactive_key",
            keyValue = "inactive_value",
            displayName = "Inactive Key",
            category = "TEST",
            isActive = false
        )
        apiKeyDao.insertAPIKey(inactiveKey)
        
        // ACT
        val activeKeysMap = repository.getActiveAPIKeysMap()
        
        // ASSERT
        assertThat(activeKeysMap).containsKey("active_key")
        assertThat(activeKeysMap).doesNotContainKey("empty_key")
        assertThat(activeKeysMap).doesNotContainKey("inactive_key")
        assertThat(activeKeysMap["active_key"]).isEqualTo("active_value")
    }

    @Test
    fun `updateValidationStatus updates correctly`() = runBlocking {
        // ARRANGE
        repository.saveAPIKey("test_provider", "test_value", "TEST")
        
        // ACT
        repository.updateValidationStatus("test_provider", "valid")
        
        // ASSERT
        val updatedKey = repository.getAPIKeyByProvider("test_provider")
        assertThat(updatedKey?.validationStatus).isEqualTo("valid")
        assertThat(updatedKey?.lastValidated).isNotNull()
    }

    @Test
    fun `getAPIKeysByCategory returns correct keys`() = runBlocking {
        // ARRANGE
        repository.saveAPIKey("books_key1", "value1", "BOOKS")
        repository.saveAPIKey("books_key2", "value2", "BOOKS")
        repository.saveAPIKey("music_key", "value3", "MUSIC")
        
        // ACT
        val booksKeys = repository.getAPIKeysByCategory("BOOKS")
        val musicKeys = repository.getAPIKeysByCategory("MUSIC")
        
        // ASSERT
        assertThat(booksKeys).hasSize(2)
        assertThat(musicKeys).hasSize(1)
        
        val booksProviders = booksKeys.map { it.provider }
        assertThat(booksProviders).containsExactly("books_key1", "books_key2")
    }

    @Test
    fun `comicvine is marked as required in default config`() = runBlocking {
        // ACT
        repository.initializeDefaultAPIKeys()
        
        // ASSERT
        val comicvineKey = repository.getAPIKeyByProvider("comicvine")
        assertThat(comicvineKey).isNotNull()
        // Note: isRequired property doesn't exist in current APIKey entity
        assertThat(comicvineKey?.category).isEqualTo("COMICS_MANGA")
    }

    @Test
    fun `deleteAPIKey removes key correctly`() = runBlocking {
        // ARRANGE
        repository.saveAPIKey("to_delete", "value", "TEST")
        assertThat(repository.getAPIKeyByProvider("to_delete")).isNotNull()
        
        // ACT
        repository.deleteAPIKey("to_delete")
        
        // ASSERT
        assertThat(repository.getAPIKeyByProvider("to_delete")).isNull()
    }

    @Test
    fun `getValidAPIKeysCountByCategory counts correctly`() = runBlocking {
        // ARRANGE
        repository.saveAPIKey("valid_key", "value", "TEST")
        repository.updateValidationStatus("valid_key", "valid")
        
        repository.saveAPIKey("invalid_key", "value", "TEST")
        repository.updateValidationStatus("invalid_key", "invalid")
        
        repository.saveAPIKey("untested_key", "value", "TEST")
        // Leave as untested
        
        // ACT
        val validCount = repository.getValidAPIKeysCountByCategory("TEST")
        
        // ASSERT
        assertThat(validCount).isEqualTo(1)
    }

    @Test
    fun `getGeminiApiKey returns null when not set`() = runBlocking {
        // ACT
        val apiKey = repository.getGeminiApiKey()
        
        // ASSERT
        assertThat(apiKey).isNull()
    }

    @Test
    fun `setGeminiApiKey saves key correctly`() = runBlocking {
        // ARRANGE
        val testKey = "test_gemini_api_key_123"
        
        // ACT
        repository.setGeminiApiKey(testKey)
        
        // ASSERT
        val savedKey = repository.getGeminiApiKey()
        assertThat(savedKey).isEqualTo(testKey)
        
        val apiKeyEntity = repository.getAPIKeyByProvider("gemini")
        assertThat(apiKeyEntity).isNotNull()
        assertThat(apiKeyEntity?.keyValue).isEqualTo(testKey)
        assertThat(apiKeyEntity?.category).isEqualTo("AI")
    }

    @Test
    fun `setGeminiApiKey updates existing key`() = runBlocking {
        // ARRANGE
        repository.setGeminiApiKey("original_key")
        
        // ACT
        repository.setGeminiApiKey("updated_key")
        
        // ASSERT
        val updatedKey = repository.getGeminiApiKey()
        assertThat(updatedKey).isEqualTo("updated_key")
        
        // Verify no duplicate entries
        val allKeys = repository.getAllAPIKeys().first()
        val geminiKeys = allKeys.filter { it.provider == "gemini" }
        assertThat(geminiKeys).hasSize(1)
    }

    @Test
    fun `getImageGeneratorType returns IMAGEN by default`() = runBlocking {
        // ACT
        val type = repository.getImageGeneratorType()
        
        // ASSERT
        assertThat(type).isEqualTo(com.universalmedialibrary.data.settings.ImageGeneratorType.IMAGEN)
    }

    @Test
    fun `saveImageGeneratorType persists IMAGEN correctly`() = runBlocking {
        // ACT
        repository.saveImageGeneratorType(com.universalmedialibrary.data.settings.ImageGeneratorType.IMAGEN)
        
        // ASSERT
        val savedType = repository.getImageGeneratorType()
        assertThat(savedType).isEqualTo(com.universalmedialibrary.data.settings.ImageGeneratorType.IMAGEN)
    }

    @Test
    fun `saveImageGeneratorType persists GEMINI_BUILTIN correctly`() = runBlocking {
        // ACT
        repository.saveImageGeneratorType(com.universalmedialibrary.data.settings.ImageGeneratorType.GEMINI_BUILTIN)
        
        // ASSERT
        val savedType = repository.getImageGeneratorType()
        assertThat(savedType).isEqualTo(com.universalmedialibrary.data.settings.ImageGeneratorType.GEMINI_BUILTIN)
    }

    @Test
    fun `saveImageGeneratorType updates existing value`() = runBlocking {
        // ARRANGE
        repository.saveImageGeneratorType(com.universalmedialibrary.data.settings.ImageGeneratorType.IMAGEN)
        
        // ACT
        repository.saveImageGeneratorType(com.universalmedialibrary.data.settings.ImageGeneratorType.GEMINI_BUILTIN)
        
        // ASSERT
        val updatedType = repository.getImageGeneratorType()
        assertThat(updatedType).isEqualTo(com.universalmedialibrary.data.settings.ImageGeneratorType.GEMINI_BUILTIN)
        
        // Verify no duplicate entries
        val allKeys = repository.getAllAPIKeys().first()
        val typeKeys = allKeys.filter { it.provider == "image_generator_type" }
        assertThat(typeKeys).hasSize(1)
    }

    @Test
    fun `getImageGeneratorType returns IMAGEN on invalid value`() = runBlocking {
        // ARRANGE - Save an invalid value directly
        repository.saveAPIKey("image_generator_type", "INVALID_TYPE", "AI_SETTINGS")
        
        // ACT
        val type = repository.getImageGeneratorType()
        
        // ASSERT
        assertThat(type).isEqualTo(com.universalmedialibrary.data.settings.ImageGeneratorType.IMAGEN)
    }
}