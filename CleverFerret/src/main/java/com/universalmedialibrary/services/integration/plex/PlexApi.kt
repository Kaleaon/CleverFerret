package com.universalmedialibrary.services.integration.plex

import retrofit2.Response
import retrofit2.http.*

/**
 * Plex Media Server API Interface
 * 
 * Complete Retrofit interface for Plex Media Server communication
 * Supports authentication, server discovery, library browsing, and metadata fetching
 */
interface PlexApi {
    
    // ====== Authentication Endpoints ======
    
    /**
     * Request a PIN for authentication
     */
    @POST("pins")
    @Headers(
        "X-Plex-Product: CleverFerret",
        "X-Plex-Version: 1.0.0",
        "X-Plex-Device: Android",
        "X-Plex-Platform: Android"
    )
    suspend fun requestPin(
        @Header("X-Plex-Client-Identifier") clientId: String,
        @Field("strong") strong: Boolean = true
    ): Response<PlexAuthPin>
    
    /**
     * Check PIN status for authentication
     */
    @GET("pins/{pinId}")
    @Headers(
        "X-Plex-Product: CleverFerret",
        "X-Plex-Version: 1.0.0",
        "X-Plex-Device: Android",
        "X-Plex-Platform: Android"
    )
    suspend fun checkPin(
        @Path("pinId") pinId: Int,
        @Header("X-Plex-Client-Identifier") clientId: String,
        @Query("code") code: String
    ): Response<PlexAuthPin>
    
    /**
     * Get user information
     */
    @GET("user")
    suspend fun getUser(
        @Header("X-Plex-Token") token: String
    ): Response<PlexUser>
    
    /**
     * Get available Plex servers/resources
     */
    @GET("pms/resources")
    suspend fun getResources(
        @Header("X-Plex-Token") token: String,
        @Query("includeHttps") includeHttps: Int = 1,
        @Query("includeRelay") includeRelay: Int = 1,
        @Query("includeIPv6") includeIPv6: Int = 1
    ): Response<List<PlexResource>>
    
    // ====== Server Information Endpoints ======
    
    /**
     * Get server information (root endpoint)
     */
    @GET("/")
    suspend fun getServerInfo(
        @Header("X-Plex-Token") token: String? = null
    ): Response<PlexServerInfo>
    
    /**
     * Get server identity
     */
    @GET("identity")
    suspend fun getServerIdentity(): Response<PlexServerInfo>
    
    // ====== Library Endpoints ======
    
    /**
     * Get all library sections
     */
    @GET("library/sections")
    suspend fun getLibrarySections(
        @Header("X-Plex-Token") token: String
    ): Response<PlexLibrariesResponse>
    
    /**
     * Get library section content
     */
    @GET("library/sections/{sectionId}/all")
    suspend fun getLibrarySectionContent(
        @Path("sectionId") sectionId: String,
        @Header("X-Plex-Token") token: String,
        @Query("sort") sort: String = "titleSort:asc",
        @Query("includeGuids") includeGuids: Int = 1
    ): Response<PlexMediaResponse>
    
    /**
     * Get library section recently added
     */
    @GET("library/sections/{sectionId}/recentlyAdded")
    suspend fun getLibrarySectionRecentlyAdded(
        @Path("sectionId") sectionId: String,
        @Header("X-Plex-Token") token: String,
        @Query("X-Plex-Container-Start") start: Int = 0,
        @Query("X-Plex-Container-Size") size: Int = 50
    ): Response<PlexMediaResponse>
    
    /**
     * Get library section on deck
     */
    @GET("library/sections/{sectionId}/onDeck")
    suspend fun getLibrarySectionOnDeck(
        @Path("sectionId") sectionId: String,
        @Header("X-Plex-Token") token: String
    ): Response<PlexMediaResponse>
    
    // ====== Media Item Endpoints ======
    
    /**
     * Get media item metadata
     */
    @GET("library/metadata/{ratingKey}")
    suspend fun getMediaMetadata(
        @Path("ratingKey") ratingKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("includeGuids") includeGuids: Int = 1,
        @Query("includeExtras") includeExtras: Int = 1,
        @Query("includeRelated") includeRelated: Int = 1
    ): Response<PlexMediaResponse>
    
    /**
     * Get media item children (seasons, episodes, tracks, etc.)
     */
    @GET("library/metadata/{ratingKey}/children")
    suspend fun getMediaChildren(
        @Path("ratingKey") ratingKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("includeGuids") includeGuids: Int = 1
    ): Response<PlexMediaResponse>
    
    /**
     * Get media item relatives (related content)
     */
    @GET("library/metadata/{ratingKey}/related")
    suspend fun getMediaRelated(
        @Path("ratingKey") ratingKey: String,
        @Header("X-Plex-Token") token: String
    ): Response<PlexMediaResponse>
    
    // ====== Search Endpoints ======
    
    /**
     * Search across all libraries
     */
    @GET("search")
    suspend fun searchAll(
        @Header("X-Plex-Token") token: String,
        @Query("query") query: String,
        @Query("limit") limit: Int = 20,
        @Query("includeGuids") includeGuids: Int = 1
    ): Response<PlexMediaResponse>
    
    /**
     * Search within a specific library section
     */
    @GET("library/sections/{sectionId}/search")
    suspend fun searchLibrarySection(
        @Path("sectionId") sectionId: String,
        @Header("X-Plex-Token") token: String,
        @Query("query") query: String,
        @Query("limit") limit: Int = 20
    ): Response<PlexMediaResponse>
    
    // ====== Playback State Endpoints ======
    
    /**
     * Mark item as played
     */
    @GET(":/scrobble")
    suspend fun markAsPlayed(
        @Header("X-Plex-Token") token: String,
        @Query("key") key: String,
        @Query("identifier") identifier: String = "com.plexapp.plugins.library"
    ): Response<PlexMediaResponse>
    
    /**
     * Mark item as unplayed
     */
    @GET(":/unscrobble")
    suspend fun markAsUnplayed(
        @Header("X-Plex-Token") token: String,
        @Query("key") key: String,
        @Query("identifier") identifier: String = "com.plexapp.plugins.library"
    ): Response<PlexMediaResponse>
    
    /**
     * Update progress
     */
    @GET(":/progress")
    suspend fun updateProgress(
        @Header("X-Plex-Token") token: String,
        @Query("key") key: String,
        @Query("identifier") identifier: String = "com.plexapp.plugins.library",
        @Query("time") time: Long,
        @Query("state") state: String = "playing"
    ): Response<PlexMediaResponse>
    
    // ====== Collections and Playlists ======
    
    /**
     * Get collections
     */
    @GET("library/collections")
    suspend fun getCollections(
        @Header("X-Plex-Token") token: String,
        @Query("includeGuids") includeGuids: Int = 1
    ): Response<PlexMediaResponse>
    
    /**
     * Create collection
     */
    @POST("library/collections")
    suspend fun createCollection(
        @Header("X-Plex-Token") token: String,
        @Query("type") type: Int,
        @Query("title") title: String,
        @Query("smart") smart: Int = 0,
        @Query("sectionId") sectionId: String? = null
    ): Response<PlexMediaResponse>
    
    /**
     * Add items to collection
     */
    @PUT("library/collections/{collectionId}/items")
    suspend fun addToCollection(
        @Path("collectionId") collectionId: String,
        @Header("X-Plex-Token") token: String,
        @Query("uri") uri: String
    ): Response<PlexMediaResponse>
    
    // ====== Server Statistics ======
    
    /**
     * Get server statistics
     */
    @GET("library/sections/{sectionId}/stats")
    suspend fun getLibraryStats(
        @Path("sectionId") sectionId: String,
        @Header("X-Plex-Token") token: String
    ): Response<PlexMediaResponse>
    
    /**
     * Get server activities
     */
    @GET("activities")
    suspend fun getServerActivities(
        @Header("X-Plex-Token") token: String
    ): Response<PlexMediaResponse>
    
    /**
     * Get transcode sessions
     */
    @GET("transcode/sessions")
    suspend fun getTranscodeSessions(
        @Header("X-Plex-Token") token: String
    ): Response<PlexMediaResponse>
}

// Helper constants for Plex API URLs
object PlexApiConstants {
    const val PLEX_AUTH_BASE_URL = "https://plex.tv/"
    const val PLEX_API_BASE_URL = "https://plex.tv/api/v2/"
    const val PLEX_RESOURCES_URL = "https://plex.tv/api/resources"
    
    // Headers
    const val HEADER_CLIENT_IDENTIFIER = "X-Plex-Client-Identifier"
    const val HEADER_TOKEN = "X-Plex-Token"
    const val HEADER_PRODUCT = "X-Plex-Product"
    const val HEADER_VERSION = "X-Plex-Version"
    const val HEADER_DEVICE = "X-Plex-Device"
    const val HEADER_PLATFORM = "X-Plex-Platform"
    
    // Client Info
    const val CLIENT_PRODUCT = "CleverFerret"
    const val CLIENT_VERSION = "1.0.0"
    const val CLIENT_DEVICE = "Android"
    const val CLIENT_PLATFORM = "Android"
    
    // Media Types
    const val MEDIA_TYPE_MOVIE = "movie"
    const val MEDIA_TYPE_SHOW = "show"
    const val MEDIA_TYPE_SEASON = "season"
    const val MEDIA_TYPE_EPISODE = "episode"
    const val MEDIA_TYPE_ARTIST = "artist"
    const val MEDIA_TYPE_ALBUM = "album"
    const val MEDIA_TYPE_TRACK = "track"
    const val MEDIA_TYPE_PHOTO = "photo"
    
    // Library Types
    const val LIBRARY_TYPE_MOVIE = "movie"
    const val LIBRARY_TYPE_SHOW = "show"  
    const val LIBRARY_TYPE_MUSIC = "artist"
    const val LIBRARY_TYPE_PHOTO = "photo"
}