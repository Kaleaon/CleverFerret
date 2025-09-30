# Plex Integration Data Models

This document describes all data models used in the Plex integration.

## Authentication Models

### PlexPinResponse
Response from PIN request API.

```kotlin
data class PlexPinResponse(
    val id: Int,                    // PIN identifier
    val code: String,               // 4-character PIN code (e.g., "ABCD")
    val product: String,            // "CleverFerret"
    val trusted: Boolean,           // Whether this is a trusted device
    val clientIdentifier: String,   // Unique device identifier
    val location: PlexPinLocation?, // Geographic location info
    val expiresIn: Int,            // Time until PIN expires (seconds)
    val createdAt: String,         // ISO timestamp
    val expiresAt: String,         // ISO timestamp
    val authToken: String?,        // Present after user authenticates
    val newRegistration: Boolean?  // Whether this is a new user
)
```

### PlexPinAuthData
Internal representation of PIN data for UI.

```kotlin
data class PlexPinAuthData(
    val pinId: String,      // "12345"
    val pinCode: String,    // "ABCD"
    val expiresAt: String   // "2024-01-15T10:30:00Z"
)
```

### PlexAuthResult
Result of successful authentication.

```kotlin
data class PlexAuthResult(
    val token: String,      // Authentication token
    val userId: String,     // Plex user ID
    val username: String,   // Display username
    val email: String,      // User email
    val thumb: String?      // Profile picture URL
)
```

### PlexUserResponse
Full user account information from Plex.tv.

```kotlin
data class PlexUserResponse(
    val id: Long,                      // User ID
    val uuid: String,                  // Unique identifier
    val username: String,              // Username
    val title: String,                 // Display name
    val email: String,                 // Email address
    val friendlyName: String,          // Friendly display name
    val locale: String?,               // Locale (e.g., "en")
    val confirmed: Boolean,            // Email confirmed
    val joinedAt: Long,               // Unix timestamp
    val emailOnlyAuth: Boolean,        // Email-only auth enabled
    val hasPassword: Boolean,          // Has password set
    val protected: Boolean,            // Account protected
    val thumb: String?,                // Avatar URL
    val authToken: String?,            // Auth token
    val mailingListStatus: String?,    // Mailing list status
    val mailingListActive: Boolean,    // On mailing list
    val scrobbleTypes: String?,        // Scrobble settings
    val country: String?,              // Country code
    val subscription: PlexSubscription?, // Subscription info
    val subscriptionDescription: String?, // Plan description
    val restricted: Boolean,           // Restricted account
    val anonymous: Boolean?,           // Anonymous mode
    val home: Boolean,                // In a Plex Home
    val guest: Boolean,               // Guest account
    val homeSize: Int,                // Number in home
    val homeAdmin: Boolean,           // Home admin
    val maxHomeSize: Int,             // Max home size
    val rememberExpiresAt: Long       // Remember token expiry
)
```

## Server Discovery Models

### PlexResourceResponse
Server information from discovery API.

```kotlin
data class PlexResourceResponse(
    val name: String,                  // Server name
    val product: String?,              // "Plex Media Server"
    val productVersion: String?,       // "1.40.0.1234"
    val platform: String?,             // "Linux"
    val platformVersion: String?,      // "5.15.0"
    val device: String?,               // Device type
    val clientIdentifier: String,      // Server unique ID
    val createdAt: String,            // ISO timestamp
    val lastSeenAt: String,           // ISO timestamp
    val provides: String,             // "server,player,sync-target"
    val ownerId: Long?,               // Owner's user ID
    val sourceTitle: String?,         // Source description
    val publicAddress: String?,       // Public IP
    val accessToken: String?,         // Access token
    val owned: Boolean,               // User owns this server
    val home: Boolean?,               // In user's home
    val synced: Boolean?,             // Sync enabled
    val relay: Boolean?,              // Relay available
    val presence: Boolean?,           // Server online
    val httpsRequired: Boolean?,      // HTTPS required
    val publicAddressMatches: Boolean?, // Public address matches
    val dnsRebindingProtection: Boolean?, // DNS protection
    val natLoopbackSupported: Boolean?, // NAT loopback
    val connections: List<PlexConnection>? // Available connections
)
```

### PlexConnection
Connection information for a server.

```kotlin
data class PlexConnection(
    val protocol: String,  // "http" or "https"
    val address: String,   // "192.168.1.100" or "plex.example.com"
    val port: Int,        // 32400
    val uri: String,      // "http://192.168.1.100:32400"
    val local: Boolean,   // Is local network connection
    val relay: Boolean?,  // Is relay connection
    val IPv6: Boolean?    // Is IPv6 connection
)
```

### PlexDiscoveredServer
Simplified server info for UI display.

```kotlin
data class PlexDiscoveredServer(
    val name: String,              // "My Plex Server"
    val clientIdentifier: String,  // Unique server ID
    val owned: Boolean,            // User owns this server
    val accessToken: String,       // Token for this server
    val connections: List<PlexServerConnection> // Available connections
)
```

### PlexServerConnection
Simplified connection info.

```kotlin
data class PlexServerConnection(
    val uri: String,      // "http://192.168.1.100:32400"
    val address: String,  // "192.168.1.100"
    val port: Int,       // 32400
    val protocol: String, // "http" or "https"
    val local: Boolean   // Is local connection
)
```

## Media Server API Models

### PlexServerInfo
Server information from server API.

```kotlin
data class PlexServerInfo(
    val friendlyName: String,      // "My Plex Server"
    val machineIdentifier: String, // Unique server ID
    val version: String,          // "1.40.0.1234"
    val platform: String,         // "Linux"
    val platformVersion: String,  // "5.15.0"
    val updatedAt: Long,         // Unix timestamp
    val myPlex: Boolean          // Connected to Plex.tv
)
```

### PlexLibrariesResponse
Response containing all libraries.

```kotlin
data class PlexLibrariesResponse(
    val mediaContainer: PlexLibrariesContainer
)

data class PlexLibrariesContainer(
    val directories: List<PlexLibrary>
)
```

### PlexLibrary
Library section information.

```kotlin
data class PlexLibrary(
    val key: String,        // "1" (section ID)
    val title: String,      // "Movies"
    val type: String,       // "movie", "show", "artist"
    val scanner: String?,   // "Plex Movie Scanner"
    val language: String?   // "en"
)
```

### PlexLibraryItemsResponse
Response containing media items.

```kotlin
data class PlexLibraryItemsResponse(
    val mediaContainer: PlexLibraryItemsContainer
)

data class PlexLibraryItemsContainer(
    val metadata: List<PlexMetadata>?,
    val size: Int,      // Items in this response
    val totalSize: Int  // Total items in library
)
```

### PlexMetadata
Media item metadata.

```kotlin
data class PlexMetadata(
    val ratingKey: String,      // "12345" (unique item ID)
    val key: String,           // "/library/metadata/12345"
    val title: String,         // "The Matrix"
    val type: String,          // "movie", "episode", "track"
    val year: Int?,           // 1999
    val duration: Long?,      // Duration in milliseconds
    val viewOffset: Long?,    // Watch progress in milliseconds
    val viewCount: Int?,      // Number of times watched
    val lastViewedAt: Long?,  // Unix timestamp
    val userRating: Float?,   // User rating (0-10)
    val rating: Float?,       // Critic rating (0-10)
    val summary: String?,     // Description
    val thumb: String?,       // Thumbnail path
    val art: String?,         // Background art path
    val genres: List<PlexGenre>?,     // Genre tags
    val directors: List<PlexRole>?,   // Directors
    val writers: List<PlexRole>?,     // Writers
    val actors: List<PlexRole>?,      // Actors
    val collections: List<PlexCollection>? // Collections
)
```

### PlexGenre
Genre tag.

```kotlin
data class PlexGenre(
    val tag: String  // "Action"
)
```

### PlexRole
Person role (director, actor, etc).

```kotlin
data class PlexRole(
    val tag: String,   // "Keanu Reeves"
    val role: String?  // "Neo" (character name for actors)
)
```

## Database Models

### PlexServer
Stored server configuration.

```kotlin
@Entity(tableName = "plex_servers")
data class PlexServer(
    @PrimaryKey(autoGenerate = true)
    val serverId: Long = 0,
    
    val name: String,              // "My Plex Server"
    val host: String,              // "192.168.1.100"
    val port: Int = 32400,
    val token: String,             // Access token
    val machineIdentifier: String?, // Server unique ID
    val version: String?,          // Server version
    
    val isActive: Boolean = true,  // Server enabled
    val lastConnected: Long = 0,   // Last successful connection
    val lastSynced: Long = 0,      // Last sync timestamp
    
    val dateAdded: Long = System.currentTimeMillis()
)
```

### PlexMediaItem
Plex media item stored locally.

```kotlin
@Entity(tableName = "plex_media_items")
data class PlexMediaItem(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val serverId: Long,          // Foreign key to PlexServer
    val plexRatingKey: String,   // Plex item ID
    val title: String,           // Item title
    val type: String,            // "movie", "episode", etc.
    val year: Int?,             // Release year
    val duration: Long?,        // Duration in ms
    val libraryName: String,    // Library section name
    val librarySectionId: String, // Library section ID
    
    val dateAdded: Long = System.currentTimeMillis()
)
```

### PlexProgress
Playback progress tracking.

```kotlin
@Entity(tableName = "plex_progress")
data class PlexProgress(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val plexMediaItemId: Long,   // Foreign key to PlexMediaItem
    val localProgress: Long,     // Local progress (ms)
    val plexProgress: Long = 0,  // Last known Plex progress (ms)
    val needsSync: Boolean = true, // Needs sync to Plex
    
    val lastSynced: Long = 0,
    val updatedAt: Long = System.currentTimeMillis()
)
```

### PlexRating
User rating tracking.

```kotlin
@Entity(tableName = "plex_ratings")
data class PlexRating(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val plexMediaItemId: Long,    // Foreign key to PlexMediaItem
    val localRating: Float?,      // Local rating (0-10)
    val plexRating: Float? = null, // Last known Plex rating
    val needsSync: Boolean = true, // Needs sync to Plex
    
    val lastSynced: Long = 0,
    val updatedAt: Long = System.currentTimeMillis()
)
```

### PlexCollection
Plex collection/playlist.

```kotlin
@Entity(tableName = "plex_collections")
data class PlexCollection(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val serverId: Long,          // Foreign key to PlexServer
    val plexRatingKey: String,   // Collection ID in Plex
    val title: String,           // Collection name
    val type: String,            // Collection type
    val summary: String?,        // Description
    val itemCount: Int = 0,      // Number of items
    
    val dateAdded: Long = System.currentTimeMillis()
)
```

## UI State Models

### PlexAuthState
Authentication flow state.

```kotlin
sealed class PlexAuthState {
    object Idle : PlexAuthState()
    object RequestingPin : PlexAuthState()
    data class WaitingForUser(val pinData: PlexPinAuthData) : PlexAuthState()
    object FetchingUserInfo : PlexAuthState()
    data class Authenticated(val result: PlexAuthResult) : PlexAuthState()
    object DiscoveringServers : PlexAuthState()
    data class Error(val message: String) : PlexAuthState()
}
```

### PlexAuthUiState
UI-specific auth state.

```kotlin
sealed class PlexAuthUiState {
    object Idle : PlexAuthUiState()
    object RequestingPin : PlexAuthUiState()
    data class WaitingForUser(val pinCode: String) : PlexAuthUiState()
    object Authenticating : PlexAuthUiState()
    data class Authenticated(val username: String, val email: String) : PlexAuthUiState()
    object DiscoveringServers : PlexAuthUiState()
    data class ServersDiscovered(val count: Int) : PlexAuthUiState()
    data class Error(val message: String) : PlexAuthUiState()
}
```

### PlexSyncStatus
Sync operation status.

```kotlin
sealed class PlexSyncStatus {
    object Idle : PlexSyncStatus()
    data class Syncing(val message: String) : PlexSyncStatus()
    data class Success(val message: String) : PlexSyncStatus()
    data class Error(val message: String) : PlexSyncStatus()
}
```

## Unified Model Mapping

How Plex items map to the unified MediaItem model:

```kotlin
// Plex item
PlexMetadata(
    ratingKey = "12345",
    title = "The Matrix",
    type = "movie",
    year = 1999,
    thumb = "/library/metadata/12345/thumb/1234567890"
)

// Maps to unified MediaItem
MediaItem(
    libraryId = 1,                           // Unified library ID
    filePath = "plex://abc123/12345",        // plex://{serverId}/{ratingKey}
    fileName = "The Matrix",                 // Use title as filename
    fileExtension = "",                      // Not applicable for Plex
    fileSize = 0L,                          // Not available from Plex
    fileHash = "12345",                     // Use ratingKey as hash
    mediaType = "MOVIE",                    // Mapped from Plex type
    mimeType = null,                        // Not applicable
    isAvailable = true,                     // Server online
    hasMetadata = true,                     // Metadata available
    hasThumbnail = true,                    // Thumb available
    thumbnailPath = "/library/metadata/12345/thumb/1234567890"
)
```

### Type Mapping Table

| Plex Type | Unified Type | Description |
|-----------|--------------|-------------|
| `movie` | `MOVIE` | Feature films |
| `show` | `TV_SHOW` | TV series |
| `season` | `TV_SHOW` | TV season |
| `episode` | `TV_SHOW` | TV episode |
| `artist` | `MUSIC_TRACK` | Music artist |
| `album` | `MUSIC_TRACK` | Music album |
| `track` | `MUSIC_TRACK` | Music track |
| Other | `OTHER` | Unknown type |

## Constants

### API Base URLs

```kotlin
const val PLEX_TV_BASE_URL = "https://plex.tv"
const val DEFAULT_PLEX_PORT = 32400
```

### Polling Configuration

```kotlin
const val PIN_POLL_INTERVAL_MS = 1000L      // 1 second
const val PIN_MAX_POLL_ATTEMPTS = 300        // 5 minutes
```

### Headers

```kotlin
const val HEADER_PLEX_TOKEN = "X-Plex-Token"
const val HEADER_PLEX_PRODUCT = "X-Plex-Product"
const val HEADER_PLEX_CLIENT_ID = "X-Plex-Client-Identifier"
```

## Summary

The data models follow these principles:

1. **Separation of Concerns** - API models separate from DB models
2. **Immutability** - Most models are immutable data classes
3. **Type Safety** - Sealed classes for state management
4. **Nullability** - Optional fields properly marked
5. **Documentation** - Clear field descriptions
6. **Mapping** - Clean conversion between Plex and unified models
