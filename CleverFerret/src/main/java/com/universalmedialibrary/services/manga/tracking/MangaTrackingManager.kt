package com.universalmedialibrary.services.manga.tracking

import android.util.Log
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manga Tracking Manager
 * 
 * Coordinates all manga tracking services and provides a unified interface
 * for tracking reading progress across multiple services.
 * 
 * Inspired by Futon/Kotatsu's scrobbling system
 */
@Singleton
class MangaTrackingManager @Inject constructor(
    private val aniListTracker: AniListTracker,
    private val myAnimeListTracker: MyAnimeListTracker,
    private val tokenStorage: TrackingTokenStorage
) {
    
    companion object {
        private const val TAG = "MangaTrackingManager"
    }
    
    private val _authenticatedServices = MutableStateFlow<Set<TrackingService>>(emptySet())
    val authenticatedServices: StateFlow<Set<TrackingService>> = _authenticatedServices.asStateFlow()
    
    private val trackers: Map<TrackingService, MangaTracker> = mapOf(
        TrackingService.ANILIST to aniListTracker,
        TrackingService.MYANIMELIST to myAnimeListTracker
        // Add more trackers here as they're implemented
    )
    
    init {
        refreshAuthenticationStatus()
    }
    
    /**
     * Get a tracker for a specific service
     */
    fun getTracker(service: TrackingService): MangaTracker? {
        return trackers[service]
    }
    
    /**
     * Get all available trackers
     */
    fun getAllTrackers(): List<MangaTracker> {
        return trackers.values.toList()
    }
    
    /**
     * Check which services are authenticated
     */
    fun refreshAuthenticationStatus() {
        _authenticatedServices.value = tokenStorage.getAuthenticatedServices().toSet()
    }
    
    /**
     * Check if any service is authenticated
     */
    fun hasAnyAuthentication(): Boolean {
        return _authenticatedServices.value.isNotEmpty()
    }
    
    /**
     * Authenticate with a tracking service
     */
    suspend fun authenticate(service: TrackingService, code: String): Result<TrackingToken> {
        val tracker = trackers[service]
            ?: return Result.failure(Exception("Tracker not available for $service"))
        
        val result = tracker.authenticate(code)
        if (result.isSuccess) {
            refreshAuthenticationStatus()
        }
        return result
    }
    
    /**
     * Logout from a tracking service
     */
    suspend fun logout(service: TrackingService) {
        trackers[service]?.logout()
        refreshAuthenticationStatus()
    }
    
    /**
     * Logout from all services
     */
    suspend fun logoutAll() {
        trackers.values.forEach { it.logout() }
        refreshAuthenticationStatus()
    }
    
    /**
     * Search for manga across all authenticated services
     */
    suspend fun searchAll(query: String): Map<TrackingService, List<TrackSearchResult>> {
        val results = mutableMapOf<TrackingService, List<TrackSearchResult>>()
        
        for ((service, tracker) in trackers) {
            if (!tokenStorage.hasToken(service)) continue
            
            tracker.search(query).onSuccess { searchResults ->
                results[service] = searchResults
            }.onFailure { e ->
                Log.e(TAG, "Search failed for $service", e)
            }
        }
        
        return results
    }
    
    /**
     * Sync reading progress to all authenticated services
     */
    suspend fun syncProgressToAll(
        mangaId: Long,
        remoteIds: Map<TrackingService, String>,
        chaptersRead: Int
    ): Map<TrackingService, Result<TrackedManga>> {
        val results = mutableMapOf<TrackingService, Result<TrackedManga>>()
        
        for ((service, remoteId) in remoteIds) {
            val tracker = trackers[service] ?: continue
            if (!tokenStorage.hasToken(service)) continue
            
            results[service] = tracker.syncProgress(remoteId, chaptersRead)
        }
        
        return results
    }
    
    /**
     * Get tracked manga from all authenticated services
     */
    suspend fun getTrackedMangaFromAll(
        remoteIds: Map<TrackingService, String>
    ): Map<TrackingService, TrackedManga?> {
        val results = mutableMapOf<TrackingService, TrackedManga?>()
        
        for ((service, remoteId) in remoteIds) {
            val tracker = trackers[service] ?: continue
            if (!tokenStorage.hasToken(service)) continue
            
            tracker.getTrackedManga(remoteId).onSuccess { tracked ->
                results[service] = tracked
            }.onFailure { e ->
                Log.e(TAG, "Failed to get tracked manga from $service", e)
            }
        }
        
        return results
    }
    
    /**
     * Add manga to tracking on all authenticated services
     */
    suspend fun addToAllServices(
        remoteIds: Map<TrackingService, String>,
        status: TrackingStatus = TrackingStatus.READING
    ): Map<TrackingService, Result<TrackedManga>> {
        val results = mutableMapOf<TrackingService, Result<TrackedManga>>()
        
        for ((service, remoteId) in remoteIds) {
            val tracker = trackers[service] ?: continue
            if (!tokenStorage.hasToken(service)) continue
            
            results[service] = tracker.addManga(remoteId, status)
        }
        
        return results
    }
    
    /**
     * Get user profile from a service
     */
    suspend fun getUser(service: TrackingService): Result<TrackingUser> {
        val tracker = trackers[service]
            ?: return Result.failure(Exception("Tracker not available for $service"))
        
        if (!tokenStorage.hasToken(service)) {
            return Result.failure(Exception("Not authenticated with $service"))
        }
        
        return tracker.getUser()
    }
    
    /**
     * Get manga list from a service
     */
    suspend fun getMangaList(
        service: TrackingService,
        status: TrackingStatus? = null
    ): Result<TrackingMangaList> {
        val tracker = trackers[service]
            ?: return Result.failure(Exception("Tracker not available for $service"))
        
        if (!tokenStorage.hasToken(service)) {
            return Result.failure(Exception("Not authenticated with $service"))
        }
        
        return tracker.getMangaList(status)
    }
    
    /**
     * Get OAuth authorization URL for a service
     */
    fun getAuthorizationUrl(service: TrackingService, clientId: String): String? {
        val tracker = trackers[service] ?: return null
        val redirectUri = when (service) {
            TrackingService.ANILIST -> "cleverferret://anilist-callback"
            TrackingService.MYANIMELIST -> "cleverferret://mal-callback"
            TrackingService.KITSU -> "cleverferret://kitsu-callback"
            TrackingService.SHIKIMORI -> "cleverferret://shikimori-callback"
        }
        return tracker.getAuthorizationUrl(clientId, redirectUri)
    }
    
    /**
     * Check if token needs refresh
     */
    suspend fun refreshTokenIfNeeded(service: TrackingService): Boolean {
        if (!tokenStorage.isTokenExpired(service)) return true
        
        val tracker = trackers[service] ?: return false
        return tracker.refreshToken().isSuccess
    }
}
