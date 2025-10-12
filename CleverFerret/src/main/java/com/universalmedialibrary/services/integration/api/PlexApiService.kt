package com.universalmedialibrary.services.integration.api

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

/**
 * Plex Media Server API Service
 * Documentation: https://developer.plex.tv/
 */
interface PlexApiService {
    
    @GET("/")
    suspend fun getServerInfo(): PlexServerInfoResponse
    
    @GET("library/sections")
    suspend fun getLibrarySections(): PlexLibrarySectionsResponse
    
    @GET("library/sections/{key}/all")
    suspend fun getLibraryItems(
        @Path("key") sectionKey: String,
        @Query("X-Plex-Container-Start") start: Int = 0,
        @Query("X-Plex-Container-Size") size: Int = 50
    ): PlexLibraryItemsResponse
    
    @GET("library/metadata/{key}")
    suspend fun getItemMetadata(
        @Path("key") ratingKey: String
    ): PlexMetadataResponse
    
    @GET("library/recentlyAdded")
    suspend fun getRecentlyAdded(): PlexLibraryItemsResponse
    
    @GET("library/onDeck")
    suspend fun getOnDeck(): PlexLibraryItemsResponse
}

@Serializable
data class PlexServerInfoResponse(
    @SerialName("MediaContainer") val mediaContainer: PlexServerInfo
)

@Serializable
data class PlexServerInfo(
    val size: Int = 0,
    val allowCameraUpload: Boolean = false,
    val allowChannelAccess: Boolean = false,
    val allowMediaDeletion: Boolean = false,
    val allowSharing: Boolean = false,
    val allowSync: Boolean = false,
    val backgroundProcessing: Boolean = false,
    val certificate: Boolean = false,
    val companionProxy: Boolean = false,
    val diagnostics: String? = null,
    val eventStream: Boolean = false,
    val friendlyName: String,
    val hubSearch: Boolean = false,
    val machineIdentifier: String,
    val multiuser: Boolean = false,
    val myPlex: Boolean = false,
    val myPlexMappingState: String? = null,
    val myPlexSigninState: String? = null,
    val myPlexSubscription: Boolean = false,
    val myPlexUsername: String? = null,
    val ownerFeatures: String? = null,
    val photoAutoTag: Boolean = false,
    val platform: String,
    val platformVersion: String,
    val pluginHost: Boolean = false,
    val readOnlyLibraries: Boolean = false,
    val requestParametersInCookie: Boolean = false,
    val streamingBrainVersion: String? = null,
    val sync: Boolean = false,
    val transcoderActiveVideoSessions: Int = 0,
    val transcoderAudio: Boolean = false,
    val transcoderLyrics: Boolean = false,
    val transcoderPhoto: Boolean = false,
    val transcoderSubtitles: Boolean = false,
    val transcoderVideo: Boolean = false,
    val transcoderVideoBitrates: String? = null,
    val transcoderVideoQualities: String? = null,
    val transcoderVideoResolutions: String? = null,
    val updatedAt: Long = 0,
    val updater: Boolean = false,
    val version: String,
    val voiceSearch: Boolean = false
)

@Serializable
data class PlexLibrarySectionsResponse(
    @SerialName("MediaContainer") val mediaContainer: PlexLibrarySections
)

@Serializable
data class PlexLibrarySections(
    val size: Int,
    @SerialName("Directory") val directories: List<PlexLibrarySection> = emptyList()
)

@Serializable
data class PlexLibrarySection(
    val allowSync: Boolean = false,
    val art: String? = null,
    val composite: String? = null,
    val filters: Boolean = false,
    val refreshing: Boolean = false,
    val thumb: String? = null,
    val key: String,
    val type: String,
    val title: String,
    val agent: String? = null,
    val scanner: String? = null,
    val language: String? = null,
    val uuid: String,
    val updatedAt: Long = 0,
    val createdAt: Long = 0,
    val scannedAt: Long? = null,
    val content: Boolean = false,
    val directory: Boolean = false,
    val contentChangedAt: Long = 0,
    val hidden: Int = 0
)

@Serializable
data class PlexLibraryItemsResponse(
    @SerialName("MediaContainer") val mediaContainer: PlexLibraryItems
)

@Serializable
data class PlexLibraryItems(
    val size: Int,
    val allowSync: Boolean = false,
    val art: String? = null,
    val identifier: String? = null,
    val librarySectionID: Int? = null,
    val librarySectionTitle: String? = null,
    val librarySectionUUID: String? = null,
    val mediaTagPrefix: String? = null,
    val mediaTagVersion: Long = 0,
    val mixedParents: Boolean = false,
    val nocache: Boolean = false,
    val offset: Int = 0,
    val thumb: String? = null,
    val title1: String? = null,
    val title2: String? = null,
    val viewGroup: String? = null,
    val viewMode: Int = 0,
    @SerialName("Metadata") val metadata: List<PlexMetadataItem> = emptyList()
)

@Serializable
data class PlexMetadataResponse(
    @SerialName("MediaContainer") val mediaContainer: PlexMetadataContainer
)

@Serializable
data class PlexMetadataContainer(
    val size: Int,
    @SerialName("Metadata") val metadata: List<PlexMetadataItem> = emptyList()
)

@Serializable
data class PlexMetadataItem(
    val ratingKey: String,
    val key: String,
    val guid: String? = null,
    val studio: String? = null,
    val type: String,
    val title: String,
    val titleSort: String? = null,
    val contentRating: String? = null,
    val summary: String? = null,
    val rating: Double? = null,
    val audienceRating: Double? = null,
    val year: Int? = null,
    val tagline: String? = null,
    val thumb: String? = null,
    val art: String? = null,
    val duration: Long? = null,
    val originallyAvailableAt: String? = null,
    val addedAt: Long = 0,
    val updatedAt: Long = 0,
    val audienceRatingImage: String? = null,
    val chapterSource: String? = null,
    val primaryExtraKey: String? = null,
    val ratingImage: String? = null,
    @SerialName("Media") val media: List<PlexMedia> = emptyList(),
    @SerialName("Genre") val genres: List<PlexTag> = emptyList(),
    @SerialName("Director") val directors: List<PlexTag> = emptyList(),
    @SerialName("Writer") val writers: List<PlexTag> = emptyList(),
    @SerialName("Country") val countries: List<PlexTag> = emptyList(),
    @SerialName("Role") val roles: List<PlexRole> = emptyList()
)

@Serializable
data class PlexMedia(
    val id: Long,
    val duration: Long? = null,
    val bitrate: Int? = null,
    val width: Int? = null,
    val height: Int? = null,
    val aspectRatio: Double? = null,
    val audioChannels: Int? = null,
    val audioCodec: String? = null,
    val videoCodec: String? = null,
    val videoResolution: String? = null,
    val container: String? = null,
    val videoFrameRate: String? = null,
    val audioProfile: String? = null,
    val videoProfile: String? = null,
    @SerialName("Part") val parts: List<PlexPart> = emptyList()
)

@Serializable
data class PlexPart(
    val id: Long,
    val key: String,
    val duration: Long? = null,
    val file: String,
    val size: Long? = null,
    val audioProfile: String? = null,
    val container: String? = null,
    val videoProfile: String? = null
)

@Serializable
data class PlexTag(
    val id: Long? = null,
    val filter: String? = null,
    val tag: String
)

@Serializable
data class PlexRole(
    val id: Long? = null,
    val filter: String? = null,
    val tag: String,
    val role: String? = null,
    val thumb: String? = null
)