package com.universalmedialibrary.services.manga.tracking

import kotlinx.serialization.Serializable

/**
 * Manga Tracking Models
 * 
 * Models for tracking manga reading progress on external services
 * Inspired by Futon/Kotatsu tracking integration
 */

/**
 * Supported tracking services
 */
enum class TrackingService(
    val displayName: String,
    val baseUrl: String,
    val supportsPrivateStatus: Boolean = true
) {
    ANILIST("AniList", "https://anilist.co"),
    MYANIMELIST("MyAnimeList", "https://myanimelist.net"),
    KITSU("Kitsu", "https://kitsu.app"),
    SHIKIMORI("Shikimori", "https://shikimori.one");
    
    fun getAuthUrl(): String = when (this) {
        ANILIST -> "https://anilist.co/api/v2/oauth/authorize"
        MYANIMELIST -> "https://myanimelist.net/v1/oauth2/authorize"
        KITSU -> "https://kitsu.app/api/oauth/authorize"
        SHIKIMORI -> "https://shikimori.one/oauth/authorize"
    }
    
    fun getTokenUrl(): String = when (this) {
        ANILIST -> "https://anilist.co/api/v2/oauth/token"
        MYANIMELIST -> "https://myanimelist.net/v1/oauth2/token"
        KITSU -> "https://kitsu.app/api/oauth/token"
        SHIKIMORI -> "https://shikimori.one/oauth/token"
    }
}

/**
 * Tracking status for manga
 */
enum class TrackingStatus(val displayName: String) {
    READING("Reading"),
    COMPLETED("Completed"),
    ON_HOLD("On Hold"),
    DROPPED("Dropped"),
    PLAN_TO_READ("Plan to Read"),
    REREADING("Re-reading");
    
    fun toAniListStatus(): String = when (this) {
        READING -> "CURRENT"
        COMPLETED -> "COMPLETED"
        ON_HOLD -> "PAUSED"
        DROPPED -> "DROPPED"
        PLAN_TO_READ -> "PLANNING"
        REREADING -> "REPEATING"
    }
    
    fun toMALStatus(): String = when (this) {
        READING -> "reading"
        COMPLETED -> "completed"
        ON_HOLD -> "on_hold"
        DROPPED -> "dropped"
        PLAN_TO_READ -> "plan_to_read"
        REREADING -> "reading"
    }
    
    fun toKitsuStatus(): String = when (this) {
        READING -> "current"
        COMPLETED -> "completed"
        ON_HOLD -> "on_hold"
        DROPPED -> "dropped"
        PLAN_TO_READ -> "planned"
        REREADING -> "current"
    }
    
    companion object {
        fun fromAniListStatus(status: String): TrackingStatus = when (status.uppercase()) {
            "CURRENT" -> READING
            "COMPLETED" -> COMPLETED
            "PAUSED" -> ON_HOLD
            "DROPPED" -> DROPPED
            "PLANNING" -> PLAN_TO_READ
            "REPEATING" -> REREADING
            else -> READING
        }
        
        fun fromMALStatus(status: String): TrackingStatus = when (status.lowercase()) {
            "reading" -> READING
            "completed" -> COMPLETED
            "on_hold" -> ON_HOLD
            "dropped" -> DROPPED
            "plan_to_read" -> PLAN_TO_READ
            else -> READING
        }
        
        fun fromKitsuStatus(status: String): TrackingStatus = when (status.lowercase()) {
            "current" -> READING
            "completed" -> COMPLETED
            "on_hold" -> ON_HOLD
            "dropped" -> DROPPED
            "planned" -> PLAN_TO_READ
            else -> READING
        }
    }
}

/**
 * Tracked manga item on external service
 */
@Serializable
data class TrackedManga(
    val id: Long,
    val remoteId: String,
    val service: TrackingService,
    val mangaId: Long,
    val title: String,
    val coverUrl: String? = null,
    val status: TrackingStatus = TrackingStatus.READING,
    val score: Float = 0f,
    val chaptersRead: Int = 0,
    val totalChapters: Int = 0,
    val startDate: Long? = null,
    val finishDate: Long? = null,
    val notes: String? = null,
    val isPrivate: Boolean = false,
    val lastUpdated: Long = System.currentTimeMillis()
)

/**
 * Search result from tracking service
 */
@Serializable
data class TrackSearchResult(
    val remoteId: String,
    val title: String,
    val coverUrl: String? = null,
    val summary: String? = null,
    val totalChapters: Int = 0,
    val score: Float = 0f,
    val startDate: String? = null,
    val status: String? = null,
    val service: TrackingService
)

/**
 * Authentication token for tracking service
 */
@Serializable
data class TrackingToken(
    val service: TrackingService,
    val accessToken: String,
    val refreshToken: String? = null,
    val expiresAt: Long = 0L,
    val userId: String? = null,
    val username: String? = null
)

/**
 * User profile from tracking service
 */
@Serializable
data class TrackingUser(
    val service: TrackingService,
    val id: String,
    val username: String,
    val avatarUrl: String? = null,
    val profileUrl: String? = null,
    val mangaCount: Int = 0,
    val chaptersRead: Int = 0
)

/**
 * Scrobbling entry to send to tracking service
 */
@Serializable
data class ScrobblingEntry(
    val remoteId: String,
    val service: TrackingService,
    val status: TrackingStatus,
    val score: Float = 0f,
    val chaptersRead: Int = 0,
    val startDate: Long? = null,
    val finishDate: Long? = null,
    val notes: String? = null,
    val isPrivate: Boolean = false
)

/**
 * Manga list from tracking service
 */
@Serializable
data class TrackingMangaList(
    val service: TrackingService,
    val items: List<TrackedManga>,
    val totalCount: Int,
    val hasNextPage: Boolean = false
)
