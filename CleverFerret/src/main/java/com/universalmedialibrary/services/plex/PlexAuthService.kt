package com.universalmedialibrary.services.plex

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for handling Plex authentication using PIN flow
 */
@Singleton
class PlexAuthService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val tokenStorage: SecureTokenStorage,
    private val authApi: PlexAuthApi
) {

    companion object {
        private const val TAG = "PlexAuthService"
        private const val PIN_POLL_INTERVAL_MS = 1000L
        private const val PIN_MAX_POLL_ATTEMPTS = 300 // 5 minutes
    }

    private val _authState = MutableStateFlow<PlexAuthState>(PlexAuthState.Idle)
    val authState: Flow<PlexAuthState> = _authState.asStateFlow()

    private val clientIdentifier: String by lazy {
        // Generate or retrieve a unique client identifier for this device
        val prefs = context.getSharedPreferences("plex_client", Context.MODE_PRIVATE)
        prefs.getString("client_id", null) ?: run {
            val newId = UUID.randomUUID().toString()
            prefs.edit().putString("client_id", newId).apply()
            newId
        }
    }

    /**
     * Start the PIN authentication flow
     * Returns the PIN code that the user needs to enter at plex.tv/link
     *
     * Uses official Plex.tv API: POST /api/v2/pins
     */
    suspend fun startPinAuth(): Result<PlexPinAuthData> {
        return try {
            _authState.value = PlexAuthState.RequestingPin

            // Request PIN with all required headers per official API spec
            val response = authApi.requestPin(
                clientId = clientIdentifier
            )

            if (response.isSuccessful && response.body() != null) {
                val pinData = response.body()!!
                val authData = PlexPinAuthData(
                    pinId = pinData.id.toString(),
                    pinCode = pinData.code,
                    expiresAt = pinData.expiresAt
                )

                _authState.value = PlexAuthState.WaitingForUser(authData)
                Log.d(TAG, "PIN requested successfully: ${authData.pinCode}")
                Result.success(authData)
            } else {
                val error = "Failed to request PIN: ${response.code()} ${response.message()}"
                Log.e(TAG, error)
                _authState.value = PlexAuthState.Error(error)
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error requesting PIN", e)
            _authState.value = PlexAuthState.Error(e.message ?: "Unknown error")
            Result.failure(e)
        }
    }

    /**
     * Poll for PIN authentication completion
     * This should be called in a loop after startPinAuth
     *
     * Polls GET /api/v2/pins/{pinId} until authToken is populated
     * Max 300 attempts (5 minutes) at 1 second intervals
     */
    suspend fun pollForAuth(pinId: String): Result<PlexAuthResult> {
        var attempts = 0

        Log.d(TAG, "Starting PIN polling for ID: $pinId")

        while (attempts < PIN_MAX_POLL_ATTEMPTS) {
            try {
                val response = authApi.checkPin(pinId, clientIdentifier)

                if (response.isSuccessful && response.body() != null) {
                    val pinData = response.body()!!

                    if (!pinData.authToken.isNullOrEmpty()) {
                        // User has authenticated!
                        return completeAuthentication(pinData.authToken)
                    }
                }

                // Wait before next poll
                delay(PIN_POLL_INTERVAL_MS)
                attempts++

            } catch (e: Exception) {
                Log.e(TAG, "Error polling PIN", e)
                if (attempts >= PIN_MAX_POLL_ATTEMPTS - 1) {
                    _authState.value = PlexAuthState.Error(e.message ?: "Polling failed")
                    return Result.failure(e)
                }
                delay(PIN_POLL_INTERVAL_MS)
                attempts++
            }
        }

        val error = "Authentication timeout - PIN expired"
        _authState.value = PlexAuthState.Error(error)
        return Result.failure(Exception(error))
    }

    /**
     * Complete authentication after receiving token
     */
    private suspend fun completeAuthentication(token: String): Result<PlexAuthResult> {
        return try {
            _authState.value = PlexAuthState.FetchingUserInfo

            Log.d(TAG, "Fetching user info with token")

            // Get user information with all required headers
            val userResponse = authApi.getUserInfo(token)

            if (userResponse.isSuccessful && userResponse.body() != null) {
                val user = userResponse.body()!!

                // Save token securely
                tokenStorage.saveAuthToken(
                    token = token,
                    userId = user.id.toString(),
                    username = user.username
                )

                val authResult = PlexAuthResult(
                    token = token,
                    userId = user.id.toString(),
                    username = user.username,
                    email = user.email,
                    thumb = user.thumb
                )

                _authState.value = PlexAuthState.Authenticated(authResult)
                Result.success(authResult)
            } else {
                val error = "Failed to get user info: ${userResponse.message()}"
                _authState.value = PlexAuthState.Error(error)
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error completing authentication", e)
            _authState.value = PlexAuthState.Error(e.message ?: "Unknown error")
            Result.failure(e)
        }
    }

    /**
     * Authenticate directly with Plex username/password credentials.
     * Stores the returned token on success.
     */
    suspend fun authenticateWithCredentials(
        username: String,
        password: String
    ): Result<PlexAuthResult> {
        return try {
            if (username.isBlank() || password.isBlank()) {
                val message = "Username and password are required"
                _authState.value = PlexAuthState.Error(message)
                return Result.failure(IllegalArgumentException(message))
            }

            _authState.value = PlexAuthState.FetchingUserInfo

            val response = authApi.signInWithCredentials(username, password)
            if (!response.isSuccessful || response.body() == null) {
                val error = when (response.code()) {
                    401 -> "Invalid Plex credentials"
                    else -> "Failed to sign in: ${response.code()} ${response.message()}"
                }
                Log.e(TAG, error)
                _authState.value = PlexAuthState.Error(error)
                return Result.failure(Exception(error))
            }

            val user = response.body()!!
            val token = user.authToken
            if (token.isNullOrEmpty()) {
                val error = "Plex authentication succeeded but no token was returned"
                Log.e(TAG, error)
                _authState.value = PlexAuthState.Error(error)
                return Result.failure(IllegalStateException(error))
            }

            tokenStorage.saveAuthToken(
                token = token,
                userId = user.id.toString(),
                username = user.username
            )

            val authResult = PlexAuthResult(
                token = token,
                userId = user.id.toString(),
                username = user.username,
                email = user.email,
                thumb = user.thumb
            )

            _authState.value = PlexAuthState.Authenticated(authResult)
            Result.success(authResult)
        } catch (e: Exception) {
            Log.e(TAG, "Error signing in with credentials", e)
            _authState.value = PlexAuthState.Error(e.message ?: "Unknown error")
            Result.failure(e)
        }
    }

    /**
     * Discover available Plex servers for the authenticated user
     *
     * Uses GET /api/v2/resources to find all owned and shared servers
     * Filters for devices that provide "server" capability
     */
    suspend fun discoverServers(): Result<List<PlexDiscoveredServer>> {
        return try {
            val token = tokenStorage.getAuthToken()
            if (token.isNullOrEmpty()) {
                Log.e(TAG, "Cannot discover servers: Not authenticated")
                return Result.failure(Exception("Not authenticated"))
            }

            _authState.value = PlexAuthState.DiscoveringServers
            Log.d(TAG, "Discovering Plex servers...")

            val response = authApi.getResources(
                token = token,
                clientId = clientIdentifier,
                includeHttps = 1,
                includeRelay = 0,
                includeIPv6 = 0
            )

            if (response.isSuccessful && response.body() != null) {
                val servers = response.body()!!
                    .filter { it.provides.contains("server") }
                    .map { resource ->
                        PlexDiscoveredServer(
                            name = resource.name,
                            clientIdentifier = resource.clientIdentifier,
                            owned = resource.owned,
                            accessToken = resource.accessToken ?: token,
                            connections = resource.connections?.map { conn ->
                                PlexServerConnection(
                                    uri = conn.uri,
                                    address = conn.address,
                                    port = conn.port,
                                    protocol = conn.protocol,
                                    local = conn.local
                                )
                            } ?: emptyList()
                        )
                    }

                Result.success(servers)
            } else {
                val error = "Failed to discover servers: ${response.message()}"
                Result.failure(Exception(error))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error discovering servers", e)
            Result.failure(e)
        }
    }

    /**
     * Sign out and clear stored credentials
     */
    fun signOut() {
        tokenStorage.clearAuth()
        _authState.value = PlexAuthState.Idle
    }

    /**
     * Clear any error state and revert to idle
     */
    fun clearError() {
        if (_authState.value is PlexAuthState.Error) {
            _authState.value = PlexAuthState.Idle
        }
    }

    /**
     * Check if user is currently authenticated
     */
    fun isAuthenticated(): Boolean {
        return tokenStorage.isAuthenticated()
    }

    /**
     * Get stored token if available
     */
    fun getStoredToken(): String? {
        return tokenStorage.getAuthToken()
    }

    /**
     * Get stored username if available
     */
    fun getStoredUsername(): String? {
        return tokenStorage.getUsername()
    }
}

/**
 * Auth state sealed class
 */
sealed class PlexAuthState {
    object Idle : PlexAuthState()
    object RequestingPin : PlexAuthState()
    data class WaitingForUser(val pinData: PlexPinAuthData) : PlexAuthState()
    object FetchingUserInfo : PlexAuthState()
    data class Authenticated(val result: PlexAuthResult) : PlexAuthState()
    object DiscoveringServers : PlexAuthState()
    data class Error(val message: String) : PlexAuthState()
}

/**
 * PIN authentication data
 */
data class PlexPinAuthData(
    val pinId: String,
    val pinCode: String,
    val expiresAt: String
)

/**
 * Authentication result
 */
data class PlexAuthResult(
    val token: String,
    val userId: String,
    val username: String,
    val email: String,
    val thumb: String?
)

/**
 * Server information from discovery
 */
data class PlexDiscoveredServer(
    val name: String,
    val clientIdentifier: String,
    val owned: Boolean,
    val accessToken: String,
    val connections: List<PlexServerConnection>
)

data class PlexServerConnection(
    val uri: String,
    val address: String,
    val port: Int,
    val protocol: String,
    val local: Boolean
)
