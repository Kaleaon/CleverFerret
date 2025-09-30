package com.universalmedialibrary.services.integration.plex

import retrofit2.http.*

/**
 * Plex Media Server API Interface
 * Based on Plex API documentation
 */
interface PlexApi {

    @GET("/")
    suspend fun getServerInfo(): PlexServerInfo

    @GET("/library/sections")
    suspend fun getLibraries(): PlexLibrariesResponse

    @GET("/library/sections/{key}/all")
    suspend fun getLibraryItems(@Path("key") libraryKey: String): PlexLibraryItemsResponse

    @GET("/library/metadata/{key}")
    suspend fun getItemDetails(@Path("key") ratingKey: String): PlexItemDetailsResponse

    @PUT("/library/metadata/{key}")
    suspend fun updateItemMetadata(
        @Path("key") ratingKey: String,
        @Query("title.value") title: String?,
        @Query("summary.value") summary: String?,
        @Query("genre.value") genres: String?
    ): PlexUpdateResponse

    @POST("/library/sections/{key}/collection")
    suspend fun createCollection(
        @Path("key") libraryKey: String,
        @Query("title") title: String,
        @Query("smart") smart: Int = 0,
        @Query("uri") itemUris: String
    ): PlexCollectionResponse

    @GET("/library/collections")
    suspend fun getCollections(): PlexCollectionsResponse

    @GET("/status/sessions")
    suspend fun getCurrentSessions(): PlexSessionsResponse

    @GET("/library/recentlyAdded")
    suspend fun getRecentlyAdded(): PlexLibraryItemsResponse

    @GET("/library/onDeck")
    suspend fun getOnDeck(): PlexLibraryItemsResponse

    @GET("/playlists")
    suspend fun getPlaylists(): PlexPlaylistsResponse

    @POST("/playlists")
    suspend fun createPlaylist(
        @Query("title") title: String,
        @Query("type") type: String,
        @Query("uri") itemUris: String
    ): PlexPlaylistResponse
}

// Data models for Plex API responses
data class PlexServerInfo(
    val friendlyName: String,
    val machineIdentifier: String,
    val version: String,
    val platform: String,
    val platformVersion: String,
    val updatedAt: Long,
    val myPlex: Boolean
)

data class PlexLibrariesResponse(
    val directory: List<PlexLibraryDirectory>
)

data class PlexLibraryDirectory(
    val allowSync: Boolean,
    val art: String?,
    val composite: String?,
    val filters: Boolean,
    val refreshing: Boolean,
    val thumb: String?,
    val key: String,
    val type: String,
    val title: String,
    val agent: String?,
    val scanner: String?,
    val language: String?,
    val uuid: String,
    val updatedAt: Long,
    val createdAt: Long,
    val scannedAt: Long?,
    val count: Int?
)

data class PlexLibraryItemsResponse(
    val size: Int,
    val allowSync: Boolean,
    val identifier: String,
    val librarySectionID: String,
    val librarySectionTitle: String,
    val librarySectionUUID: String,
    val mediaTagPrefix: String,
    val mediaTagVersion: Long,
    val media: List<PlexMediaItem>
)

data class PlexMediaItem(
    val ratingKey: String,
    val key: String,
    val guid: String,
    val studio: String?,
    val type: String,
    val title: String,
    val titleSort: String?,
    val contentRating: String?,
    val summary: String?,
    val rating: Float?,
    val audienceRating: Float?,
    val year: Int?,
    val tagline: String?,
    val thumb: String?,
    val art: String?,
    val duration: Long?,
    val originallyAvailableAt: String?,
    val addedAt: Long,
    val updatedAt: Long,
    val audienceRatingImage: String?,
    val chapterSource: String?,
    val hasPremiumExtras: String?,
    val hasPremiumPrimaryExtra: String?,
    val ratingImage: String?,
    val media: List<PlexMedia>?,
    val genre: List<PlexGenre>?,
    val director: List<PlexDirector>?,
    val writer: List<PlexWriter>?,
    val country: List<PlexCountry>?,
    val role: List<PlexRole>?,
    val collection: List<PlexCollection>?
)

data class PlexMedia(
    val id: String,
    val duration: Long?,
    val bitrate: Int?,
    val width: Int?,
    val height: Int?,
    val aspectRatio: Float?,
    val audioChannels: Int?,
    val audioCodec: String?,
    val videoCodec: String?,
    val videoResolution: String?,
    val container: String?,
    val videoFrameRate: String?,
    val audioProfile: String?,
    val videoProfile: String?,
    val part: List<PlexPart>?
)

data class PlexPart(
    val id: String,
    val key: String,
    val duration: Long?,
    val file: String,
    val size: Long?,
    val audioProfile: String?,
    val container: String?,
    val videoProfile: String?,
    val stream: List<PlexStream>?
)

data class PlexStream(
    val id: String,
    val streamType: Int,
    val default: Boolean?,
    val codec: String?,
    val index: Int?,
    val bitrate: Int?,
    val language: String?,
    val languageTag: String?,
    val languageCode: String?,
    val bitDepth: Int?,
    val chromaLocation: String?,
    val chromaSubsampling: String?,
    val codedHeight: Int?,
    val codedWidth: Int?,
    val colorPrimaries: String?,
    val colorRange: String?,
    val colorSpace: String?,
    val colorTrc: String?,
    val frameRate: Float?,
    val hasScalingMatrix: Boolean?,
    val height: Int?,
    val level: Int?,
    val profile: String?,
    val refFrames: Int?,
    val scanType: String?,
    val streamIdentifier: String?,
    val width: Int?,
    val displayTitle: String?,
    val extendedDisplayTitle: String?
)

data class PlexGenre(
    val id: String,
    val filter: String,
    val tag: String,
    val count: Int?
)

data class PlexDirector(
    val id: String,
    val filter: String,
    val tag: String,
    val count: Int?
)

data class PlexWriter(
    val id: String,
    val filter: String,
    val tag: String,
    val count: Int?
)

data class PlexCountry(
    val id: String,
    val filter: String,
    val tag: String,
    val count: Int?
)

data class PlexRole(
    val id: String,
    val filter: String,
    val tag: String,
    val role: String?,
    val thumb: String?,
    val count: Int?
)

data class PlexCollection(
    val id: String,
    val filter: String,
    val tag: String,
    val count: Int?
)

data class PlexItemDetailsResponse(
    val size: Int,
    val allowSync: Boolean,
    val identifier: String,
    val librarySectionID: String,
    val librarySectionTitle: String,
    val librarySectionUUID: String,
    val mediaTagPrefix: String,
    val mediaTagVersion: Long,
    val metadata: List<PlexMediaItem>
)

data class PlexUpdateResponse(
    val code: Int,
    val status: String
)

data class PlexCollectionResponse(
    val code: Int,
    val status: String,
    val collection: PlexCollectionItem?
)

data class PlexCollectionItem(
    val key: String,
    val title: String,
    val type: String,
    val summary: String?,
    val index: Int?,
    val thumb: String?,
    val addedAt: Long,
    val updatedAt: Long
)

data class PlexCollectionsResponse(
    val size: Int,
    val metadata: List<PlexCollectionItem>
)

data class PlexSessionsResponse(
    val size: Int,
    val metadata: List<PlexSession>
)

data class PlexSession(
    val addedAt: Long,
    val art: String?,
    val duration: Long?,
    val grandparentArt: String?,
    val grandparentGuid: String?,
    val grandparentKey: String?,
    val grandparentRatingKey: String?,
    val grandparentThumb: String?,
    val grandparentTitle: String?,
    val guid: String,
    val index: Int?,
    val key: String,
    val lastViewedAt: Long?,
    val librarySectionID: String,
    val librarySectionKey: String,
    val librarySectionTitle: String,
    val parentArt: String?,
    val parentGuid: String?,
    val parentIndex: Int?,
    val parentKey: String?,
    val parentRatingKey: String?,
    val parentThumb: String?,
    val parentTitle: String?,
    val parentYear: Int?,
    val ratingKey: String,
    val sessionKey: String,
    val summary: String?,
    val thumb: String?,
    val title: String,
    val type: String,
    val updatedAt: Long,
    val viewOffset: Long?,
    val year: Int?,
    val user: PlexUser?,
    val player: PlexPlayer?,
    val session: PlexSessionInfo?
)

data class PlexUser(
    val id: String,
    val thumb: String?,
    val title: String
)

data class PlexPlayer(
    val address: String,
    val device: String?,
    val machineIdentifier: String,
    val model: String?,
    val platform: String?,
    val platformVersion: String?,
    val product: String?,
    val profile: String?,
    val remotePublicAddress: String?,
    val state: String?,
    val title: String?,
    val vendor: String?,
    val version: String?
)

data class PlexSessionInfo(
    val id: String,
    val bandwidth: Int?,
    val location: String?
)

data class PlexPlaylistsResponse(
    val size: Int,
    val metadata: List<PlexPlaylist>
)

data class PlexPlaylist(
    val ratingKey: String,
    val key: String,
    val guid: String,
    val type: String,
    val title: String,
    val titleSort: String?,
    val summary: String?,
    val smart: Boolean,
    val playlistType: String,
    val composite: String?,
    val duration: Long?,
    val leafCount: Int,
    val addedAt: Long,
    val updatedAt: Long
)

data class PlexPlaylistResponse(
    val code: Int,
    val status: String,
    val playlist: PlexPlaylist?
)
