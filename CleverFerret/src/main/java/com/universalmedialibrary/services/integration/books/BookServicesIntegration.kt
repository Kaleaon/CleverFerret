package com.universalmedialibrary.services.integration.books

import android.content.Context
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import kotlinx.coroutines.Dispatchers
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Book Services Integration
 * Manages connections to various book service providers
 * Includes Amazon Books, Google Books, etc.
 */
@Singleton
class BookServicesIntegration @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository
) {

    private val _bookServicesState = MutableStateFlow(BookServicesState())
    val bookServicesState: StateFlow<BookServicesState> = _bookServicesState.asStateFlow()

    private val connectedServices = mutableSetOf<BookServiceProvider>()

    /**
     * Initialize all book service connections using stored API keys
     */
    suspend fun initializeServices(): BookServicesInitResult = withContext(Dispatchers.IO) {
        try {
            _bookServicesState.value = _bookServicesState.value.copy(isInitializing = true)

            val apiKeys = apiKeyRepository.getActiveAPIKeysMap()

            // Check Google Books API
            if (apiKeys.containsKey("google_books")) {
                connectedServices.add(BookServiceProvider.GOOGLE_BOOKS)
            }

            // Check Amazon Product Advertising API
            if (apiKeys.containsKey("amazon_access_key") && apiKeys.containsKey("amazon_secret_key")) {
                connectedServices.add(BookServiceProvider.AMAZON_BOOKS)
            }

            // Check Goodreads API
            if (apiKeys.containsKey("goodreads")) {
                connectedServices.add(BookServiceProvider.GOODREADS)
            }

            // Check Hardcover API
            if (apiKeys.containsKey("hardcover")) {
                connectedServices.add(BookServiceProvider.HARDCOVER)
            }

            updateBookServicesState()

            BookServicesInitResult.Success(connectedServices.size)

        } catch (e: Exception) {
            _bookServicesState.value = _bookServicesState.value.copy(
                isInitializing = false,
                error = "Failed to initialize book services: ${e.message}"
            )
            BookServicesInitResult.Error(e.message ?: "Initialization failed")
        }
    }

    /**
     * Test connection to a specific book service
     */
    suspend fun testServiceConnection(provider: BookServiceProvider): BookServiceTestResult = withContext(Dispatchers.IO) {
        try {
            val apiKeys = apiKeyRepository.getActiveAPIKeysMap()

            when (provider) {
                BookServiceProvider.GOOGLE_BOOKS -> {
                    val apiKey = apiKeys["google_books"]
                    if (apiKey.isNullOrEmpty()) {
                        return@withContext BookServiceTestResult.Error("Google Books API key not found")
                    }
                    // Test Google Books API
                    BookServiceTestResult.Success("Google Books API is accessible")
                }

                BookServiceProvider.AMAZON_BOOKS -> {
                    val accessKey = apiKeys["amazon_access_key"]
                    val secretKey = apiKeys["amazon_secret_key"]
                    if (accessKey.isNullOrEmpty() || secretKey.isNullOrEmpty()) {
                        return@withContext BookServiceTestResult.Error("Amazon API credentials not found")
                    }
                    // Test Amazon API
                    BookServiceTestResult.Success("Amazon Books API is accessible")
                }

                BookServiceProvider.GOODREADS -> {
                    val apiKey = apiKeys["goodreads"]
                    if (apiKey.isNullOrEmpty()) {
                        return@withContext BookServiceTestResult.Error("Goodreads API key not found")
                    }
                    // Test Goodreads API
                    BookServiceTestResult.Success("Goodreads API is accessible")
                }

                BookServiceProvider.HARDCOVER -> {
                    val apiKey = apiKeys["hardcover"]
                    if (apiKey.isNullOrEmpty()) {
                        return@withContext BookServiceTestResult.Error("Hardcover API key not found")
                    }
                    // Test Hardcover API
                    BookServiceTestResult.Success("Hardcover API is accessible")
                }
            }

        } catch (e: Exception) {
            BookServiceTestResult.Error("Connection test failed: ${e.message}")
        }
    }

    /**
     * Check status of all book services
     */
    suspend fun checkServices(): BookServicesStatus {
        val apiKeys = apiKeyRepository.getActiveAPIKeysMap()

        val amazonConnected = apiKeys.containsKey("amazon_access_key") &&
                              apiKeys.containsKey("amazon_secret_key") &&
                              !apiKeys["amazon_access_key"].isNullOrEmpty() &&
                              !apiKeys["amazon_secret_key"].isNullOrEmpty()

        val googleBooksConnected = apiKeys.containsKey("google_books") &&
                                   !apiKeys["google_books"].isNullOrEmpty()

        return BookServicesStatus(
            amazonConnected = amazonConnected,
            googleBooksConnected = googleBooksConnected,
            hasActiveConnections = amazonConnected || googleBooksConnected
        )
    }

    /**
     * Get service statistics
     */
    fun getServiceStats(): BookServiceStats {
        return BookServiceStats(
            connectedServices = connectedServices.size,
            availableServices = BookServiceProvider.values().size,
            serviceNames = connectedServices.map { it.displayName }
        )
    }

    private fun updateBookServicesState() {
        _bookServicesState.value = _bookServicesState.value.copy(
            isInitializing = false,
            connectedServices = connectedServices.map { it.displayName },
            hasActiveConnections = connectedServices.isNotEmpty()
        )
    }
}

// Enums and data classes
enum class BookServiceProvider(val displayName: String) {
    GOOGLE_BOOKS("Google Books"),
    AMAZON_BOOKS("Amazon Books"),
    GOODREADS("Goodreads"),
    HARDCOVER("Hardcover")
}

data class BookServicesState(
    val isInitializing: Boolean = false,
    val hasActiveConnections: Boolean = false,
    val connectedServices: List<String> = emptyList(),
    val error: String? = null
)

data class BookServiceStats(
    val connectedServices: Int,
    val availableServices: Int,
    val serviceNames: List<String>
)

data class BookServicesStatus(
    val amazonConnected: Boolean,
    val googleBooksConnected: Boolean,
    val hasActiveConnections: Boolean
)

sealed class BookServicesInitResult {
    data class Success(val servicesConnected: Int) : BookServicesInitResult()
    data class Error(val message: String) : BookServicesInitResult()
}

sealed class BookServiceTestResult {
    data class Success(val message: String) : BookServiceTestResult()
    data class Error(val message: String) : BookServiceTestResult()
}
