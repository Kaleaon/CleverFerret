package com.universalmedialibrary.services.plex

import retrofit2.Response
import retrofit2.http.*

/**
 * Retrofit interface for Plex Media Server API
 */
interface PlexApi {
    
    /**
     * Get server information
     */
    @GET("/")
    suspend fun getServerInfo(
        @Header("X-Plex-Token") token: String
    ): Response<PlexServerInfo>
    
    /**
     * Get all libraries on the server
     */
    @GET("/library/sections")
    suspend fun getLibraries(
        @Header("X-Plex-Token") token: String
    ): Response<PlexLibrariesResponse>
    
    /**
     * Get all items in a library
     */
    @GET("/library/sections/{key}/all")
    suspend fun getLibraryItems(
        @Path("key") libraryKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("X-Plex-Container-Start") start: Int = 0,
        @Query("X-Plex-Container-Size") size: Int = 50
    ): Response<PlexLibraryItemsResponse>
    
    /**
     * Get specific media item metadata
     */
    @GET("/library/metadata/{key}")
    suspend fun getMediaItem(
        @Path("key") ratingKey: String,
        @Header("X-Plex-Token") token: String
    ): Response<PlexLibraryItemsResponse>
    
    /**
     * Get recently added items
     */
    @GET("/library/recentlyAdded")
    suspend fun getRecentlyAdded(
        @Header("X-Plex-Token") token: String,
        @Query("X-Plex-Container-Size") size: Int = 50
    ): Response<PlexLibraryItemsResponse>
    
    /**
     * Get all collections
     */
    @GET("/library/collections")
    suspend fun getCollections(
        @Header("X-Plex-Token") token: String
    ): Response<PlexCollectionsResponse>
    
    /**
     * Get collection items
     */
    @GET("/library/collections/{key}/children")
    suspend fun getCollectionItems(
        @Path("key") collectionKey: String,
        @Header("X-Plex-Token") token: String
    ): Response<PlexLibraryItemsResponse>
    
    /**
     * Update media item metadata (rating, tags, etc.)
     */
    @PUT("/library/metadata/{key}")
    suspend fun updateMediaItem(
        @Path("key") ratingKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("userRating") rating: Float? = null,
        @Query("type") type: String? = null
    ): Response<Unit>
    
    /**
     * Update playback progress
     */
    @POST("/:/progress")
    suspend fun updateProgress(
        @Header("X-Plex-Token") token: String,
        @Query("identifier") identifier: String = "com.plexapp.plugins.library",
        @Query("time") time: Long,
        @Query("state") state: String,
        @Query("ratingKey") ratingKey: String,
        @Query("key") key: String
    ): Response<Unit>
    
    /**
     * Mark item as watched
     */
    @POST("/:/scrobble")
    suspend fun markWatched(
        @Path("key") ratingKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("identifier") identifier: String = "com.plexapp.plugins.library"
    ): Response<Unit>
    
    /**
     * Mark item as unwatched
     */
    @POST("/:/unscrobble")
    suspend fun markUnwatched(
        @Path("key") ratingKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("identifier") identifier: String = "com.plexapp.plugins.library"
    ): Response<Unit>
    
    /**
     * Create a new collection
     */
    @POST("/library/collections")
    suspend fun createCollection(
        @Header("X-Plex-Token") token: String,
        @Query("type") type: String,
        @Query("title") title: String,
        @Query("smart") smart: Int = 0,
        @Query("sectionId") sectionId: String
    ): Response<Unit>
    
    /**
     * Add item to collection
     */
    @PUT("/library/collections/{key}/items")
    suspend fun addToCollection(
        @Path("key") collectionKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("uri") uri: String // format: server://machineId/com.plexapp.plugins.library/library/metadata/ratingKey
    ): Response<Unit>
    
    /**
     * Remove item from collection
     */
    @DELETE("/library/collections/{key}/items")
    suspend fun removeFromCollection(
        @Path("key") collectionKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("uri") uri: String
    ): Response<Unit>
    
    /**
     * Search for items
     */
    @GET("/library/sections/{key}/search")
    suspend fun searchLibrary(
        @Path("key") libraryKey: String,
        @Header("X-Plex-Token") token: String,
        @Query("query") query: String,
        @Query("type") type: String? = null
    ): Response<PlexLibraryItemsResponse>
}