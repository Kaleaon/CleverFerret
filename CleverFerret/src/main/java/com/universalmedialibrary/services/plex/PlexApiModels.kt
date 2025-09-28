package com.universalmedialibrary.services.plex

import com.google.gson.annotations.SerializedName

/**
 * Data models for Plex Media Server API responses
 */

data class PlexServerInfo(
    @SerializedName("friendlyName") val friendlyName: String,
    @SerializedName("machineIdentifier") val machineIdentifier: String,
    @SerializedName("version") val version: String,
    @SerializedName("platform") val platform: String? = null,
    @SerializedName("platformVersion") val platformVersion: String? = null
)

data class PlexLibrariesResponse(
    @SerializedName("MediaContainer") val mediaContainer: PlexLibrariesContainer
)

data class PlexLibrariesContainer(
    @SerializedName("Directory") val directories: List<PlexLibrary>
)

data class PlexLibrary(
    @SerializedName("key") val key: String,
    @SerializedName("title") val title: String,
    @SerializedName("type") val type: String,
    @SerializedName("scanner") val scanner: String? = null,
    @SerializedName("language") val language: String? = null
)

data class PlexLibraryItemsResponse(
    @SerializedName("MediaContainer") val mediaContainer: PlexLibraryItemsContainer
)

data class PlexLibraryItemsContainer(
    @SerializedName("Metadata") val metadata: List<PlexMetadata>? = null,
    @SerializedName("size") val size: Int = 0,
    @SerializedName("totalSize") val totalSize: Int = 0
)

data class PlexMetadata(
    @SerializedName("ratingKey") val ratingKey: String,
    @SerializedName("key") val key: String,
    @SerializedName("title") val title: String,
    @SerializedName("type") val type: String,
    @SerializedName("year") val year: Int? = null,
    @SerializedName("duration") val duration: Long? = null,
    @SerializedName("viewOffset") val viewOffset: Long? = null,
    @SerializedName("viewCount") val viewCount: Int? = null,
    @SerializedName("lastViewedAt") val lastViewedAt: Long? = null,
    @SerializedName("userRating") val userRating: Float? = null,
    @SerializedName("rating") val rating: Float? = null,
    @SerializedName("summary") val summary: String? = null,
    @SerializedName("thumb") val thumb: String? = null,
    @SerializedName("art") val art: String? = null,
    @SerializedName("Genre") val genres: List<PlexGenre>? = null,
    @SerializedName("Director") val directors: List<PlexRole>? = null,
    @SerializedName("Writer") val writers: List<PlexRole>? = null,
    @SerializedName("Role") val actors: List<PlexRole>? = null,
    @SerializedName("Collection") val collections: List<PlexCollection>? = null
)

data class PlexGenre(
    @SerializedName("tag") val tag: String
)

data class PlexRole(
    @SerializedName("tag") val tag: String,
    @SerializedName("role") val role: String? = null
)

data class PlexCollection(
    @SerializedName("tag") val tag: String
)

data class PlexCollectionsResponse(
    @SerializedName("MediaContainer") val mediaContainer: PlexCollectionsContainer
)

data class PlexCollectionsContainer(
    @SerializedName("Metadata") val metadata: List<PlexCollectionMetadata>? = null
)

data class PlexCollectionMetadata(
    @SerializedName("ratingKey") val ratingKey: String,
    @SerializedName("title") val title: String,
    @SerializedName("type") val type: String,
    @SerializedName("summary") val summary: String? = null,
    @SerializedName("childCount") val childCount: Int = 0,
    @SerializedName("thumb") val thumb: String? = null,
    @SerializedName("art") val art: String? = null
)

data class PlexUpdateRequest(
    @SerializedName("type") val type: String,
    @SerializedName("id") val id: String,
    @SerializedName("viewOffset") val viewOffset: Long? = null,
    @SerializedName("userRating") val userRating: Float? = null
)

data class PlexProgressUpdateRequest(
    @SerializedName("identifier") val identifier: String = "com.plexapp.plugins.library",
    @SerializedName("time") val time: Long,
    @SerializedName("state") val state: String = "playing", // playing, paused, stopped
    @SerializedName("ratingKey") val ratingKey: String,
    @SerializedName("key") val key: String,
    @SerializedName("playQueueItemID") val playQueueItemID: String? = null
)