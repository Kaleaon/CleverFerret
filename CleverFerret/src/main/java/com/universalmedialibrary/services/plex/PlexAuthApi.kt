package com.universalmedialibrary.services.plex

import retrofit2.Response
import retrofit2.http.*

/**
 * Plex.tv API interface for authentication and user management
 * Uses the Plex.tv cloud API, not the local server API
 */
interface PlexAuthApi {

    /**
     * Request a PIN for authentication
     * POST https://plex.tv/api/v2/pins
     */
    @POST("/api/v2/pins")
    suspend fun requestPin(
        @Header("X-Plex-Product") product: String = "CleverFerret",
        @Header("X-Plex-Client-Identifier") clientId: String
    ): Response<PlexPinResponse>

    /**
     * Check PIN status to get auth token
     * GET https://plex.tv/api/v2/pins/{pinId}
     *
     * Polls this endpoint until authToken is populated (user authenticated)
     */
    @GET("/api/v2/pins/{pinId}")
    suspend fun checkPin(
        @Path("pinId") pinId: String,
        @Header("X-Plex-Client-Identifier") clientId: String,
        @Header("X-Plex-Product") product: String = "CleverFerret"
    ): Response<PlexPinResponse>

    /**
     * Get user account information
     * GET https://plex.tv/api/v2/user
     */
    @GET("/api/v2/user")
    suspend fun getUserInfo(
        @Header("X-Plex-Token") token: String
    ): Response<PlexUserResponse>

    /**
     * Get list of servers accessible to the user (devices)
     * GET https://plex.tv/api/v2/resources
     *
     * @param includeHttps 1 to include HTTPS connections, 0 to exclude
     * @param includeRelay 1 to include relay connections, 0 to exclude
     */
    @GET("/api/v2/resources")
    suspend fun getResources(
        @Header("X-Plex-Token") token: String,
        @Header("X-Plex-Client-Identifier") clientId: String,
        @Query("includeHttps") includeHttps: Int = 1,
        @Query("includeRelay") includeRelay: Int = 0,
        @Query("includeIPv6") includeIPv6: Int = 0
    ): Response<List<PlexResourceResponse>>
}

/**
 * Response models for Plex.tv API
 * Based on official OpenAPI spec from https://github.com/LukeHagar/plex-docs
 */
data class PlexPinResponse(
    val id: Int,
    val code: String,
    val product: String,
    val trusted: Boolean,
    val clientIdentifier: String,
    val location: PlexPinLocation?,
    val expiresIn: Int,
    val createdAt: String,
    val expiresAt: String,
    val authToken: String?,
    val newRegistration: Boolean?,
    // Additional fields from official spec
    val qr: String? = null // QR code URL for mobile auth
)

data class PlexPinLocation(
    val code: String,
    val europeanUnionMember: Boolean,
    val continentCode: String,
    val country: String,
    val city: String,
    val timeZone: String,
    val postalCode: String?,
    val inPrivacyRestrictedCountry: Boolean,
    val subdivisions: String?,
    val coordinates: String?
)

data class PlexUserResponse(
    val id: Long,
    val uuid: String,
    val username: String,
    val title: String,
    val email: String,
    val friendlyName: String,
    val locale: String?,
    val confirmed: Boolean,
    val joinedAt: Long,
    val emailOnlyAuth: Boolean,
    val hasPassword: Boolean,
    val protected: Boolean,
    val thumb: String?,
    val authToken: String?,
    val mailingListStatus: String?,
    val mailingListActive: Boolean,
    val scrobbleTypes: String?,
    val country: String?,
    val subscription: PlexSubscription?,
    val subscriptionDescription: String?,
    val restricted: Boolean,
    val anonymous: Boolean?,
    val home: Boolean,
    val guest: Boolean,
    val homeSize: Int,
    val homeAdmin: Boolean,
    val maxHomeSize: Int,
    val rememberExpiresAt: Long
)

data class PlexSubscription(
    val active: Boolean,
    val status: String,
    val plan: String?,
    val features: List<String>?
)

data class PlexResourceResponse(
    val name: String,
    val product: String?,
    val productVersion: String?,
    val platform: String?,
    val platformVersion: String?,
    val device: String?,
    val clientIdentifier: String,
    val createdAt: String,
    val lastSeenAt: String,
    val provides: String,
    val ownerId: Long?,
    val sourceTitle: String?,
    val publicAddress: String?,
    val accessToken: String?,
    val owned: Boolean,
    val home: Boolean?,
    val synced: Boolean?,
    val relay: Boolean?,
    val presence: Boolean?,
    val httpsRequired: Boolean?,
    val publicAddressMatches: Boolean?,
    val dnsRebindingProtection: Boolean?,
    val natLoopbackSupported: Boolean?,
    val connections: List<PlexConnection>?
)

data class PlexConnection(
    val protocol: String,
    val address: String,
    val port: Int,
    val uri: String,
    val local: Boolean,
    val relay: Boolean?,
    val IPv6: Boolean?
)
