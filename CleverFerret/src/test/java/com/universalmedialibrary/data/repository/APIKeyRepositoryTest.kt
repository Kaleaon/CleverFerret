package com.universalmedialibrary.data.repository

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.APIKeyDao
import com.universalmedialibrary.data.local.dao.ProviderKeyPair
import com.universalmedialibrary.data.local.entity.APIKey
import com.universalmedialibrary.data.settings.ImageGeneratorType
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.runTest
import org.junit.Test

class APIKeyRepositoryTest {

    private val dao = FakeApiKeyDao()
    private val repository = APIKeyRepository(dao)

    @Test
    fun `saveAPIKey sets pending validation for non blank values`() = runTest {
        repository.saveAPIKey(
            provider = "gemini",
            keyValue = "secret-key",
            category = "AI_SERVICES"
        )

        val stored = dao.getAPIKeyByProvider("gemini")
        assertThat(stored).isNotNull()
        assertThat(stored?.validationStatus).isEqualTo("PENDING_VALIDATION")
    }

    @Test
    fun `saveAPIKey keeps unknown status for blank key value`() = runTest {
        repository.saveAPIKey(
            provider = "openai",
            keyValue = "",
            category = "AI_SERVICES"
        )

        val stored = dao.getAPIKeyByProvider("openai")
        assertThat(stored?.validationStatus).isEqualTo("UNKNOWN")
    }

    @Test
    fun `setGeminiApiKey writes key under AI_SERVICES category`() = runTest {
        repository.setGeminiApiKey("abc123")

        val stored = dao.getAPIKeyByProvider("gemini")
        assertThat(stored?.category).isEqualTo("AI_SERVICES")
    }

    @Test
    fun `getImageGeneratorType falls back to default when stored value is invalid`() = runTest {
        dao.insertAPIKey(
            APIKey(
                provider = "image_generator_type",
                keyValue = "NOT_A_REAL_ENUM",
                displayName = "Image Generator Type",
                category = "AI_SETTINGS"
            )
        )

        val result = repository.getImageGeneratorType()

        assertThat(result).isEqualTo(ImageGeneratorType.IMAGEN)
    }

    private class FakeApiKeyDao : APIKeyDao {
        private val backing = LinkedHashMap<String, APIKey>()
        private val allFlow = MutableStateFlow<List<APIKey>>(emptyList())

        override suspend fun insertAPIKey(apiKey: APIKey) {
            val keyId = if (apiKey.keyId == 0L) backing.size + 1L else apiKey.keyId
            backing[apiKey.provider] = apiKey.copy(keyId = keyId)
            emitAll()
        }

        override suspend fun updateAPIKey(apiKey: APIKey) {
            backing[apiKey.provider] = apiKey
            emitAll()
        }

        override fun getAllActiveAPIKeys(): Flow<List<APIKey>> =
            MutableStateFlow(backing.values.filter { it.isActive })

        override suspend fun getAPIKeyByProvider(provider: String): APIKey? =
            backing[provider]?.takeIf { it.isActive }

        override suspend fun getAPIKeysByCategory(category: String): List<APIKey> =
            backing.values.filter { it.category == category && it.isActive }

        override fun getAllAPIKeys(): Flow<List<APIKey>> = allFlow

        override suspend fun updateAPIKeyValue(provider: String, keyValue: String, timestamp: Long) {
            val current = backing[provider] ?: return
            backing[provider] = current.copy(keyValue = keyValue, lastUsed = timestamp)
            emitAll()
        }

        override suspend fun updateValidationStatus(provider: String, status: String, timestamp: Long) {
            val current = backing[provider] ?: return
            backing[provider] = current.copy(validationStatus = status, lastValidated = timestamp)
            emitAll()
        }

        override suspend fun deleteAPIKeyByProvider(provider: String) {
            backing.remove(provider)
            emitAll()
        }

        override suspend fun setAPIKeyActive(provider: String, isActive: Boolean) {
            val current = backing[provider] ?: return
            backing[provider] = current.copy(isActive = isActive)
            emitAll()
        }

        override suspend fun getValidAPIKeysCountByCategory(category: String): Int =
            backing.values.count {
                it.category == category && it.isActive && it.validationStatus.equals("valid", ignoreCase = true)
            }

        override suspend fun getAPIKeyValue(provider: String): String? =
            backing[provider]?.takeIf { it.isActive }?.keyValue

        override suspend fun getActiveProviderKeys(): List<ProviderKeyPair> =
            backing.values
                .filter { it.isActive && it.keyValue.isNotBlank() }
                .map { ProviderKeyPair(it.provider, it.keyValue) }

        private fun emitAll() {
            allFlow.value = backing.values.toList()
        }
    }
}
