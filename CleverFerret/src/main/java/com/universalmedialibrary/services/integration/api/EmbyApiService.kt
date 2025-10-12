package com.universalmedialibrary.services.integration.api

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Path
import retrofit2.http.Query

/**
 * Emby Media Server API Service
 * Documentation: https://dev.emby.media/
 */
interface EmbyApiService {
    
    @POST("Users/AuthenticateByName")
    suspend fun authenticate(
        @Body credentials: EmbyAuthRequest
    ): EmbyAuthResponse
    
    @GET("System/Info")
    suspend fun getServerInfo(): EmbyServerInfo
    
    @GET("Users/{userId}/Items")
    suspend fun getLibraryItems(
        @Path("userId") userId: String,
        @Query("IncludeItemTypes") types: String = "Movie,Series,Book,Audio",
        @Query("StartIndex") startIndex: Int = 0,
        @Query("Limit") limit: Int = 50,
        @Query("Recursive") recursive: Boolean = true
    ): EmbyItemsResponse
    
    @GET("Users/{userId}/Views")
    suspend fun getLibraryViews(
        @Path("userId") userId: String
    ): EmbyItemsResponse
    
    @GET("Users/{userId}/Items/{itemId}")
    suspend fun getItemDetails(
        @Path("userId") userId: String,
        @Path("itemId") itemId: String
    ): EmbyItem
}

@Serializable
data class EmbyAuthRequest(
    @SerialName("Username") val username: String,
    @SerialName("Pw") val password: String
)

@Serializable
data class EmbyAuthResponse(
    @SerialName("User") val user: EmbyUser,
    @SerialName("AccessToken") val accessToken: String,
    @SerialName("ServerId") val serverId: String
)

@Serializable
data class EmbyUser(
    @SerialName("Name") val name: String,
    @SerialName("ServerId") val serverId: String,
    @SerialName("Id") val id: String,
    @SerialName("HasPassword") val hasPassword: Boolean = false,
    @SerialName("HasConfiguredPassword") val hasConfiguredPassword: Boolean = false,
    @SerialName("HasConfiguredEasyPassword") val hasConfiguredEasyPassword: Boolean = false,
    @SerialName("EnableAutoLogin") val enableAutoLogin: Boolean? = null,
    @SerialName("LastLoginDate") val lastLoginDate: String? = null,
    @SerialName("LastActivityDate") val lastActivityDate: String? = null,
    @SerialName("Configuration") val configuration: EmbyUserConfiguration? = null,
    @SerialName("Policy") val policy: EmbyUserPolicy? = null
)

@Serializable
data class EmbyUserConfiguration(
    @SerialName("PlayDefaultAudioTrack") val playDefaultAudioTrack: Boolean = true,
    @SerialName("SubtitleLanguagePreference") val subtitleLanguagePreference: String? = null,
    @SerialName("DisplayMissingEpisodes") val displayMissingEpisodes: Boolean = false,
    @SerialName("GroupedFolders") val groupedFolders: List<String> = emptyList(),
    @SerialName("SubtitleMode") val subtitleMode: String? = null,
    @SerialName("DisplayCollectionsView") val displayCollectionsView: Boolean = true,
    @SerialName("EnableLocalPassword") val enableLocalPassword: Boolean = false,
    @SerialName("OrderedViews") val orderedViews: List<String> = emptyList(),
    @SerialName("LatestItemsExcludes") val latestItemsExcludes: List<String> = emptyList(),
    @SerialName("MyMediaExcludes") val myMediaExcludes: List<String> = emptyList(),
    @SerialName("HidePlayedInLatest") val hidePlayedInLatest: Boolean = true,
    @SerialName("RememberAudioSelections") val rememberAudioSelections: Boolean = true,
    @SerialName("RememberSubtitleSelections") val rememberSubtitleSelections: Boolean = true,
    @SerialName("EnableNextEpisodeAutoPlay") val enableNextEpisodeAutoPlay: Boolean = true
)

@Serializable
data class EmbyUserPolicy(
    @SerialName("IsAdministrator") val isAdministrator: Boolean = false,
    @SerialName("IsHidden") val isHidden: Boolean = false,
    @SerialName("IsDisabled") val isDisabled: Boolean = false,
    @SerialName("EnableAllFolders") val enableAllFolders: Boolean = true,
    @SerialName("EnabledFolders") val enabledFolders: List<String> = emptyList()
)

@Serializable
data class EmbyServerInfo(
    @SerialName("SystemUpdateLevel") val systemUpdateLevel: String? = null,
    @SerialName("OperatingSystemDisplayName") val operatingSystemDisplayName: String,
    @SerialName("HasPendingRestart") val hasPendingRestart: Boolean = false,
    @SerialName("IsShuttingDown") val isShuttingDown: Boolean = false,
    @SerialName("SupportsLibraryMonitor") val supportsLibraryMonitor: Boolean = true,
    @SerialName("WebSocketPortNumber") val webSocketPortNumber: Int,
    @SerialName("CompletedInstallations") val completedInstallations: List<String> = emptyList(),
    @SerialName("CanSelfRestart") val canSelfRestart: Boolean = true,
    @SerialName("CanSelfUpdate") val canSelfUpdate: Boolean = true,
    @SerialName("CanLaunchWebBrowser") val canLaunchWebBrowser: Boolean = false,
    @SerialName("ProgramDataPath") val programDataPath: String? = null,
    @SerialName("ItemsByNamePath") val itemsByNamePath: String? = null,
    @SerialName("CachePath") val cachePath: String? = null,
    @SerialName("LogPath") val logPath: String? = null,
    @SerialName("InternalMetadataPath") val internalMetadataPath: String? = null,
    @SerialName("TranscodingTempPath") val transcodingTempPath: String? = null,
    @SerialName("HttpServerPortNumber") val httpServerPortNumber: Int,
    @SerialName("SupportsHttps") val supportsHttps: Boolean = false,
    @SerialName("HttpsPortNumber") val httpsPortNumber: Int? = null,
    @SerialName("HasUpdateAvailable") val hasUpdateAvailable: Boolean = false,
    @SerialName("SupportsAutoRunAtStartup") val supportsAutoRunAtStartup: Boolean = false,
    @SerialName("HardwareAccelerationRequiresPremiere") val hardwareAccelerationRequiresPremiere: Boolean = false,
    @SerialName("LocalAddress") val localAddress: String? = null,
    @SerialName("WanAddress") val wanAddress: String? = null,
    @SerialName("RemoteAddresses") val remoteAddresses: List<String> = emptyList(),
    @SerialName("ServerName") val serverName: String,
    @SerialName("Version") val version: String,
    @SerialName("Id") val id: String
)

@Serializable
data class EmbyItemsResponse(
    @SerialName("Items") val items: List<EmbyItem>,
    @SerialName("TotalRecordCount") val totalRecordCount: Int,
    @SerialName("StartIndex") val startIndex: Int
)

@Serializable
data class EmbyItem(
    @SerialName("Name") val name: String,
    @SerialName("ServerId") val serverId: String,
    @SerialName("Id") val id: String,
    @SerialName("DateCreated") val dateCreated: String? = null,
    @SerialName("Container") val container: String? = null,
    @SerialName("SortName") val sortName: String? = null,
    @SerialName("PremiereDate") val premiereDate: String? = null,
    @SerialName("ExternalUrls") val externalUrls: List<EmbyExternalUrl> = emptyList(),
    @SerialName("Path") val path: String? = null,
    @SerialName("OfficialRating") val officialRating: String? = null,
    @SerialName("Overview") val overview: String? = null,
    @SerialName("Taglines") val taglines: List<String> = emptyList(),
    @SerialName("Genres") val genres: List<String> = emptyList(),
    @SerialName("CommunityRating") val communityRating: Double? = null,
    @SerialName("RunTimeTicks") val runTimeTicks: Long? = null,
    @SerialName("ProductionYear") val productionYear: Int? = null,
    @SerialName("ProviderIds") val providerIds: Map<String, String> = emptyMap(),
    @SerialName("IsFolder") val isFolder: Boolean = false,
    @SerialName("ParentId") val parentId: String? = null,
    @SerialName("Type") val type: String,
    @SerialName("People") val people: List<EmbyPerson> = emptyList(),
    @SerialName("Studios") val studios: List<EmbyNameIdPair> = emptyList(),
    @SerialName("GenreItems") val genreItems: List<EmbyNameIdPair> = emptyList(),
    @SerialName("TagItems") val tagItems: List<EmbyNameIdPair> = emptyList(),
    @SerialName("ImageTags") val imageTags: Map<String, String> = emptyMap(),
    @SerialName("BackdropImageTags") val backdropImageTags: List<String> = emptyList(),
    @SerialName("LocationType") val locationType: String? = null,
    @SerialName("MediaType") val mediaType: String? = null,
    @SerialName("LockedFields") val lockedFields: List<String> = emptyList(),
    @SerialName("LockData") val lockData: Boolean = false
)

@Serializable
data class EmbyExternalUrl(
    @SerialName("Name") val name: String,
    @SerialName("Url") val url: String
)

@Serializable
data class EmbyPerson(
    @SerialName("Name") val name: String,
    @SerialName("Id") val id: String,
    @SerialName("Role") val role: String? = null,
    @SerialName("Type") val type: String,
    @SerialName("PrimaryImageTag") val primaryImageTag: String? = null
)

@Serializable
data class EmbyNameIdPair(
    @SerialName("Name") val name: String,
    @SerialName("Id") val id: String
)