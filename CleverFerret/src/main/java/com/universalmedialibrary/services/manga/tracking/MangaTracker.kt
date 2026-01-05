package com.universalmedialibrary.services.manga.tracking

/**
 * Interface for manga tracking services
 * 
 * Implementations provide integration with external tracking services
 * like AniList, MyAnimeList, Kitsu, and Shikimori
 */
interface MangaTracker {
    
    /**
     * The tracking service this tracker handles
     */
    val service: TrackingService
    
    /**
     * Check if the user is authenticated
     */
    suspend fun isAuthenticated(): Boolean
    
    /**
     * Get the current user's profile
     */
    suspend fun getUser(): Result<TrackingUser>
    
    /**
     * Authenticate with OAuth code
     */
    suspend fun authenticate(code: String): Result<TrackingToken>
    
    /**
     * Refresh the authentication token
     */
    suspend fun refreshToken(): Result<TrackingToken>
    
    /**
     * Logout and clear credentials
     */
    suspend fun logout()
    
    /**
     * Search for manga on the tracking service
     */
    suspend fun search(query: String): Result<List<TrackSearchResult>>
    
    /**
     * Get the user's manga list
     */
    suspend fun getMangaList(status: TrackingStatus? = null): Result<TrackingMangaList>
    
    /**
     * Get a specific tracked manga by remote ID
     */
    suspend fun getTrackedManga(remoteId: String): Result<TrackedManga?>
    
    /**
     * Add manga to tracking list
     */
    suspend fun addManga(
        remoteId: String,
        status: TrackingStatus = TrackingStatus.READING
    ): Result<TrackedManga>
    
    /**
     * Update tracked manga
     */
    suspend fun updateManga(entry: ScrobblingEntry): Result<TrackedManga>
    
    /**
     * Remove manga from tracking list
     */
    suspend fun removeManga(remoteId: String): Result<Unit>
    
    /**
     * Sync local reading progress with tracking service
     */
    suspend fun syncProgress(
        remoteId: String,
        chaptersRead: Int
    ): Result<TrackedManga>
    
    /**
     * Update score/rating
     */
    suspend fun updateScore(
        remoteId: String,
        score: Float
    ): Result<TrackedManga>
    
    /**
     * Get OAuth authorization URL
     */
    fun getAuthorizationUrl(clientId: String, redirectUri: String): String
}
