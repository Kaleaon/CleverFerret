package com.universalmedialibrary.services.integration.plex

import com.google.gson.annotations.SerializedName
import org.simpleframework.xml.Attribute
import org.simpleframework.xml.Element
import org.simpleframework.xml.ElementList
import org.simpleframework.xml.Root

/**
 * Plex API Data Models
 * 
 * Comprehensive data models for Plex Media Server API responses
 * Supports both XML and JSON parsing for different Plex endpoints
 */

// Authentication Models
data class PlexAuthPin(
    @SerializedName("id") val id: Int,
    @SerializedName("code") val code: String,
    @SerializedName("product") val product: String = "CleverFerret",
    @SerializedName("trusted") val trusted: Boolean = true,
    @SerializedName("clientIdentifier") val clientIdentifier: String,
    @SerializedName("location") val location: PlexLocation? = null,
    @SerializedName("expiresIn") val expiresIn: Int = 1800,
    @SerializedName("createdAt") val createdAt: String,
    @SerializedName("expiresAt") val expiresAt: String,
    @SerializedName("authToken") val authToken: String? = null,
    @SerializedName("newRegistration") val newRegistration: Boolean? = null
)

data class PlexLocation(
    @SerializedName("code") val code: String,
    @SerializedName("european_union_member") val europeanUnionMember: Boolean,
    @SerializedName("continent_code") val continentCode: String,
    @SerializedName("country") val country: String,
    @SerializedName("time_zone") val timeZone: String
)

data class PlexUser(
    @SerializedName("id") val id: Int,
    @SerializedName("uuid") val uuid: String,
    @SerializedName("username") val username: String,
    @SerializedName("title") val title: String,
    @SerializedName("email") val email: String,
    @SerializedName("friendlyName") val friendlyName: String,
    @SerializedName("locale") val locale: String? = null,
    @SerializedName("confirmed") val confirmed: Boolean,
    @SerializedName("joinedAt") val joinedAt: Long,
    @SerializedName("authentication_token") val authenticationToken: String,
    @SerializedName("subscription") val subscription: PlexSubscription? = null
)

data class PlexSubscription(
    @SerializedName("active") val active: Boolean,
    @SerializedName("subscribedAt") val subscribedAt: String? = null,
    @SerializedName("status") val status: String? = null,
    @SerializedName("paymentService") val paymentService: String? = null,
    @SerializedName("plan") val plan: String? = null
)

// Server Discovery Models
data class PlexResource(
    @SerializedName("name") val name: String,
    @SerializedName("product") val product: String,
    @SerializedName("productVersion") val productVersion: String,
    @SerializedName("platform") val platform: String,
    @SerializedName("platformVersion") val platformVersion: String,
    @SerializedName("device") val device: String,
    @SerializedName("clientIdentifier") val clientIdentifier: String,
    @SerializedName("createdAt") val createdAt: String,
    @SerializedName("lastSeenAt") val lastSeenAt: String,
    @SerializedName("provides") val provides: String,
    @SerializedName("ownerId") val ownerId: Int? = null,
    @SerializedName("sourceTitle") val sourceTitle: String? = null,
    @SerializedName("publicAddress") val publicAddress: String? = null,
    @SerializedName("accessToken") val accessToken: String? = null,
    @SerializedName("owned") val owned: Boolean,
    @SerializedName("home") val home: Boolean,
    @SerializedName("synced") val synced: Boolean,
    @SerializedName("relay") val relay: Boolean,
    @SerializedName("presence") val presence: Boolean,
    @SerializedName("httpsRequired") val httpsRequired: Boolean,
    @SerializedName("publicAddressMatches") val publicAddressMatches: Boolean,
    @SerializedName("dnsRebindingProtection") val dnsRebindingProtection: Boolean,
    @SerializedName("natLoopbackSupported") val natLoopbackSupported: Boolean,
    @SerializedName("connections") val connections: List<PlexConnection>
)

data class PlexConnection(
    @SerializedName("protocol") val protocol: String,
    @SerializedName("address") val address: String,
    @SerializedName("port") val port: Int,
    @SerializedName("uri") val uri: String,
    @SerializedName("local") val local: Boolean,
    @SerializedName("relay") val relay: Boolean,
    @SerializedName("IPv6") val ipv6: Boolean
)

// Server Info Models (XML)
@Root(name = "MediaContainer", strict = false)
data class PlexServerInfo(
    @field:Attribute(name = "size", required = false) var size: Int = 0,
    @field:Attribute(name = "allowCameraUpload", required = false) var allowCameraUpload: Boolean = false,
    @field:Attribute(name = "allowChannelAccess", required = false) var allowChannelAccess: Boolean = false,
    @field:Attribute(name = "allowMediaDeletion", required = false) var allowMediaDeletion: Boolean = false,
    @field:Attribute(name = "allowSharing", required = false) var allowSharing: Boolean = false,
    @field:Attribute(name = "allowSync", required = false) var allowSync: Boolean = false,
    @field:Attribute(name = "backgroundProcessing", required = false) var backgroundProcessing: Boolean = false,
    @field:Attribute(name = "certificate", required = false) var certificate: Boolean = false,
    @field:Attribute(name = "companionProxy", required = false) var companionProxy: Boolean = false,
    @field:Attribute(name = "diagnostics", required = false) var diagnostics: String = "",
    @field:Attribute(name = "eventStream", required = false) var eventStream: Boolean = false,
    @field:Attribute(name = "friendlyName", required = false) var friendlyName: String = "",
    @field:Attribute(name = "hubSearch", required = false) var hubSearch: Boolean = false,
    @field:Attribute(name = "itemClusters", required = false) var itemClusters: Boolean = false,
    @field:Attribute(name = "livetv", required = false) var livetv: Int = 0,
    @field:Attribute(name = "machineIdentifier", required = false) var machineIdentifier: String = "",
    @field:Attribute(name = "mediaProviders", required = false) var mediaProviders: Boolean = false,
    @field:Attribute(name = "multiuser", required = false) var multiuser: Boolean = false,
    @field:Attribute(name = "myPlex", required = false) var myPlex: Boolean = false,
    @field:Attribute(name = "myPlexMappingState", required = false) var myPlexMappingState: String = "",
    @field:Attribute(name = "myPlexSigninState", required = false) var myPlexSigninState: String = "",
    @field:Attribute(name = "myPlexSubscription", required = false) var myPlexSubscription: Boolean = false,
    @field:Attribute(name = "myPlexUsername", required = false) var myPlexUsername: String = "",
    @field:Attribute(name = "ownerFeatures", required = false) var ownerFeatures: String = "",
    @field:Attribute(name = "photoAutoTag", required = false) var photoAutoTag: Boolean = false,
    @field:Attribute(name = "platform", required = false) var platform: String = "",
    @field:Attribute(name = "platformVersion", required = false) var platformVersion: String = "",
    @field:Attribute(name = "pluginHost", required = false) var pluginHost: Boolean = false,
    @field:Attribute(name = "readOnlyLibraries", required = false) var readOnlyLibraries: Boolean = false,
    @field:Attribute(name = "requestParametersInCookie", required = false) var requestParametersInCookie: Boolean = false,
    @field:Attribute(name = "streamingBrainABRVersion", required = false) var streamingBrainABRVersion: Int = 0,
    @field:Attribute(name = "streamingBrainVersion", required = false) var streamingBrainVersion: Int = 0,
    @field:Attribute(name = "sync", required = false) var sync: Boolean = false,
    @field:Attribute(name = "transcoderActiveVideoSessions", required = false) var transcoderActiveVideoSessions: Int = 0,
    @field:Attribute(name = "transcoderAudio", required = false) var transcoderAudio: Boolean = false,
    @field:Attribute(name = "transcoderLyrics", required = false) var transcoderLyrics: Boolean = false,
    @field:Attribute(name = "transcoderPhoto", required = false) var transcoderPhoto: Boolean = false,
    @field:Attribute(name = "transcoderSubtitles", required = false) var transcoderSubtitles: Boolean = false,
    @field:Attribute(name = "transcoderVideo", required = false) var transcoderVideo: Boolean = false,
    @field:Attribute(name = "transcoderVideoBitrates", required = false) var transcoderVideoBitrates: String = "",
    @field:Attribute(name = "transcoderVideoQualities", required = false) var transcoderVideoQualities: String = "",
    @field:Attribute(name = "transcoderVideoResolutions", required = false) var transcoderVideoResolutions: String = "",
    @field:Attribute(name = "updatedAt", required = false) var updatedAt: Long = 0,
    @field:Attribute(name = "updater", required = false) var updater: Boolean = false,
    @field:Attribute(name = "version", required = false) var version: String = "",
    @field:Attribute(name = "voiceSearch", required = false) var voiceSearch: Boolean = false
)

@Root(name = "MediaContainer", strict = false)
data class PlexLibrariesResponse(
    @field:Attribute(name = "size", required = false) var size: Int = 0,
    @field:Attribute(name = "allowSync", required = false) var allowSync: Boolean = false,
    @field:Attribute(name = "identifier", required = false) var identifier: String = "",
    @field:Attribute(name = "mediaTagPrefix", required = false) var mediaTagPrefix: String = "",
    @field:Attribute(name = "mediaTagVersion", required = false) var mediaTagVersion: Long = 0,
    @field:Attribute(name = "title1", required = false) var title1: String = "",
    @field:ElementList(name = "Directory", inline = true, required = false) var directories: List<PlexLibrary> = emptyList()
)

@Root(name = "Directory", strict = false)
data class PlexLibrary(
    @field:Attribute(name = "allowSync", required = false) var allowSync: Boolean = false,
    @field:Attribute(name = "art", required = false) var art: String = "",
    @field:Attribute(name = "composite", required = false) var composite: String = "",
    @field:Attribute(name = "filters", required = false) var filters: Boolean = false,
    @field:Attribute(name = "refreshing", required = false) var refreshing: Boolean = false,
    @field:Attribute(name = "thumb", required = false) var thumb: String = "",
    @field:Attribute(name = "key", required = false) var key: String = "",
    @field:Attribute(name = "type", required = false) var type: String = "",
    @field:Attribute(name = "title", required = false) var title: String = "",
    @field:Attribute(name = "agent", required = false) var agent: String = "",
    @field:Attribute(name = "scanner", required = false) var scanner: String = "",
    @field:Attribute(name = "language", required = false) var language: String = "",
    @field:Attribute(name = "uuid", required = false) var uuid: String = "",
    @field:Attribute(name = "updatedAt", required = false) var updatedAt: Long = 0,
    @field:Attribute(name = "createdAt", required = false) var createdAt: Long = 0,
    @field:Attribute(name = "scannedAt", required = false) var scannedAt: Long = 0,
    @field:Attribute(name = "content", required = false) var content: Boolean = false,
    @field:Attribute(name = "directory", required = false) var directory: Boolean = false,
    @field:Attribute(name = "contentChangedAt", required = false) var contentChangedAt: Long = 0,
    @field:Attribute(name = "hidden", required = false) var hidden: Int = 0,
    @field:ElementList(name = "Location", inline = true, required = false) var locations: List<PlexLocation> = emptyList()
)

@Root(name = "Location", strict = false)
data class PlexMediaLocation(
    @field:Attribute(name = "id", required = false) var id: Int = 0,
    @field:Attribute(name = "path", required = false) var path: String = ""
)

@Root(name = "MediaContainer", strict = false)
data class PlexMediaResponse(
    @field:Attribute(name = "size", required = false) var size: Int = 0,
    @field:Attribute(name = "allowSync", required = false) var allowSync: Boolean = false,
    @field:Attribute(name = "art", required = false) var art: String = "",
    @field:Attribute(name = "identifier", required = false) var identifier: String = "",
    @field:Attribute(name = "librarySectionID", required = false) var librarySectionID: Int = 0,
    @field:Attribute(name = "librarySectionTitle", required = false) var librarySectionTitle: String = "",
    @field:Attribute(name = "librarySectionUUID", required = false) var librarySectionUUID: String = "",
    @field:Attribute(name = "mediaTagPrefix", required = false) var mediaTagPrefix: String = "",
    @field:Attribute(name = "mediaTagVersion", required = false) var mediaTagVersion: Long = 0,
    @field:Attribute(name = "nocache", required = false) var nocache: Boolean = false,
    @field:Attribute(name = "thumb", required = false) var thumb: String = "",
    @field:Attribute(name = "title1", required = false) var title1: String = "",
    @field:Attribute(name = "title2", required = false) var title2: String = "",
    @field:Attribute(name = "viewGroup", required = false) var viewGroup: String = "",
    @field:Attribute(name = "viewMode", required = false) var viewMode: Int = 0,
    @field:ElementList(inline = true, required = false) var videos: List<PlexMediaItem> = emptyList(),
    @field:ElementList(name = "Directory", inline = true, required = false) var directories: List<PlexMediaItem> = emptyList()
)

@Root(strict = false)
data class PlexMediaItem(
    @field:Attribute(name = "ratingKey", required = false) var ratingKey: String = "",
    @field:Attribute(name = "key", required = false) var key: String = "",
    @field:Attribute(name = "parentRatingKey", required = false) var parentRatingKey: String = "",
    @field:Attribute(name = "grandparentRatingKey", required = false) var grandparentRatingKey: String = "",
    @field:Attribute(name = "guid", required = false) var guid: String = "",
    @field:Attribute(name = "parentGuid", required = false) var parentGuid: String = "",
    @field:Attribute(name = "grandparentGuid", required = false) var grandparentGuid: String = "",
    @field:Attribute(name = "type", required = false) var type: String = "",
    @field:Attribute(name = "title", required = false) var title: String = "",
    @field:Attribute(name = "grandparentKey", required = false) var grandparentKey: String = "",
    @field:Attribute(name = "parentKey", required = false) var parentKey: String = "",
    @field:Attribute(name = "librarySectionTitle", required = false) var librarySectionTitle: String = "",
    @field:Attribute(name = "librarySectionID", required = false) var librarySectionID: Int = 0,
    @field:Attribute(name = "librarySectionKey", required = false) var librarySectionKey: String = "",
    @field:Attribute(name = "grandparentTitle", required = false) var grandparentTitle: String = "",
    @field:Attribute(name = "parentTitle", required = false) var parentTitle: String = "",
    @field:Attribute(name = "contentRating", required = false) var contentRating: String = "",
    @field:Attribute(name = "summary", required = false) var summary: String = "",
    @field:Attribute(name = "rating", required = false) var rating: Float = 0f,
    @field:Attribute(name = "audienceRating", required = false) var audienceRating: Float = 0f,
    @field:Attribute(name = "year", required = false) var year: Int = 0,
    @field:Attribute(name = "tagline", required = false) var tagline: String = "",
    @field:Attribute(name = "thumb", required = false) var thumb: String = "",
    @field:Attribute(name = "art", required = false) var art: String = "",
    @field:Attribute(name = "parentThumb", required = false) var parentThumb: String = "",
    @field:Attribute(name = "grandparentThumb", required = false) var grandparentThumb: String = "",
    @field:Attribute(name = "grandparentArt", required = false) var grandparentArt: String = "",
    @field:Attribute(name = "grandparentTheme", required = false) var grandparentTheme: String = "",
    @field:Attribute(name = "duration", required = false) var duration: Long = 0,
    @field:Attribute(name = "originallyAvailableAt", required = false) var originallyAvailableAt: String = "",
    @field:Attribute(name = "addedAt", required = false) var addedAt: Long = 0,
    @field:Attribute(name = "updatedAt", required = false) var updatedAt: Long = 0,
    @field:Attribute(name = "audienceRatingImage", required = false) var audienceRatingImage: String = "",
    @field:Attribute(name = "chapterSource", required = false) var chapterSource: String = "",
    @field:Attribute(name = "primaryExtraKey", required = false) var primaryExtraKey: String = "",
    @field:Attribute(name = "ratingImage", required = false) var ratingImage: String = "",
    @field:Attribute(name = "studio", required = false) var studio: String = "",
    @field:Attribute(name = "titleSort", required = false) var titleSort: String = "",
    @field:Attribute(name = "viewCount", required = false) var viewCount: Int = 0,
    @field:Attribute(name = "lastViewedAt", required = false) var lastViewedAt: Long = 0,
    @field:Attribute(name = "originalTitle", required = false) var originalTitle: String = "",
    @field:Attribute(name = "viewOffset", required = false) var viewOffset: Long = 0,
    @field:Attribute(name = "skipCount", required = false) var skipCount: Int = 0,
    @field:Attribute(name = "index", required = false) var index: Int = 0,
    @field:Attribute(name = "parentIndex", required = false) var parentIndex: Int = 0,
    @field:Attribute(name = "leafCount", required = false) var leafCount: Int = 0,
    @field:Attribute(name = "viewedLeafCount", required = false) var viewedLeafCount: Int = 0,
    @field:Attribute(name = "childCount", required = false) var childCount: Int = 0
)

// Connection State and Status Models
data class PlexConnectionState(
    val serverName: String,
    val isConnected: Boolean,
    val connectionUrl: String?,
    val lastConnected: Long?,
    val errorMessage: String? = null
)

data class PlexLibraryStats(
    val totalItems: Int,
    val totalSize: Long,
    val lastScanned: Long?,
    val libraryType: String,
    val serverName: String
)

// Integration State Model
data class PlexIntegrationState(
    val isAuthenticated: Boolean = false,
    val currentUser: PlexUser? = null,
    val connectedServers: List<PlexConnectionState> = emptyList(),
    val availableServers: List<PlexResource> = emptyList(),
    val libraries: List<PlexLibrary> = emptyList(),
    val isLoading: Boolean = false,
    val error: String? = null,
    val authPin: PlexAuthPin? = null
)