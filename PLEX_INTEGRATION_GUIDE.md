# Plex Integration Guide

This guide explains the Plex PIN authentication integration implemented for CleverFerret.

## Overview

The implementation provides a complete Plex authentication flow using PIN-based authentication, secure token storage, server discovery, and automatic mapping to the unified media model.

## Architecture

### Core Components

1. **PlexAuthService** - Handles authentication flow
2. **SecureTokenStorage** - Encrypted token storage
3. **PlexAuthApi** - Plex.tv API interface
4. **PlexSyncService** - Server sync and model mapping
5. **PlexAuthScreen** - User interface
6. **PlexAuthViewModel** - State management

## Usage

### 1. Starting Authentication

Users can authenticate with Plex through the PIN flow:

```kotlin
val authService = PlexAuthService(context, tokenStorage)

// Start PIN auth
viewModelScope.launch {
    val result = authService.startPinAuth()
    result.onSuccess { pinData ->
        // Display pin code to user: pinData.pinCode
        // User visits plex.tv/link and enters code
        
        // Start polling for completion
        authService.pollForAuth(pinData.pinId)
    }
}
```

### 2. Token Storage

Tokens are stored securely using EncryptedSharedPreferences:

```kotlin
// Tokens are automatically stored after successful auth
val isAuthenticated = tokenStorage.isAuthenticated()
val token = tokenStorage.getAuthToken()
val username = tokenStorage.getUsername()

// Sign out
tokenStorage.clearAuth()
```

### 3. Server Discovery

Once authenticated, discover available Plex servers:

```kotlin
val result = authService.discoverServers()
result.onSuccess { servers ->
    servers.forEach { server ->
        println("${server.name} - ${server.connections.size} connections")
    }
}
```

### 4. Adding a Server

Select a discovered server and add it to the database:

```kotlin
val connection = server.connections.firstOrNull { it.local }
    ?: server.connections.firstOrNull()

plexSyncService.addServer(
    name = server.name,
    host = connection.address,
    port = connection.port,
    token = server.accessToken
)
```

### 5. Syncing Media

Sync media from Plex servers to the unified model:

```kotlin
// Sync all active servers
plexSyncService.syncAllServers()

// Sync specific server
plexSyncService.syncServer(server)
```

## Navigation Integration

To integrate the PlexAuthScreen into your navigation graph:

```kotlin
// In your Navigation setup
composable("plex_auth") {
    PlexAuthScreen(navController = navController)
}

// Navigate to auth screen
navController.navigate("plex_auth")
```

### From Settings Screen

Add a Plex authentication option in settings:

```kotlin
// In SettingsScreen.kt
SettingsOption(
    title = "Plex Account",
    description = "Connect your Plex account",
    icon = Icons.Default.VideoLibrary,
    onClick = { navController.navigate("plex_auth") }
)
```

### From Main Menu

Add to the main navigation drawer or menu:

```kotlin
NavigationDrawerItem(
    icon = { Icon(Icons.Default.VideoLibrary, null) },
    label = { Text("Plex Integration") },
    selected = false,
    onClick = { navController.navigate("plex_auth") }
)
```

## API Endpoints

### Plex.tv Cloud API

Base URL: `https://plex.tv`

1. **Request PIN**
   - `POST /api/v2/pins`
   - Headers: `X-Plex-Product`, `X-Plex-Client-Identifier`
   - Returns: PIN code and ID

2. **Check PIN Status**
   - `GET /api/v2/pins/{pinId}`
   - Headers: `X-Plex-Client-Identifier`
   - Returns: Auth token when user completes authentication

3. **Get User Info**
   - `GET /api/v2/user`
   - Headers: `X-Plex-Token`
   - Returns: User account details

4. **Discover Servers**
   - `GET /api/v2/resources`
   - Headers: `X-Plex-Token`
   - Query: `includeHttps=1`, `includeRelay=0`
   - Returns: List of accessible servers

### Plex Media Server API

Base URL: `http://{server}:{port}` (default port: 32400)

All requests require header: `X-Plex-Token: {token}`

1. **Server Info**: `GET /`
2. **Libraries**: `GET /library/sections`
3. **Library Items**: `GET /library/sections/{key}/all`
4. **Item Details**: `GET /library/metadata/{key}`

## Data Flow

### Authentication Flow

```
User clicks "Sign in with PIN"
    ↓
PlexAuthService.startPinAuth()
    ↓
Request PIN from Plex.tv
    ↓
Display PIN code to user
    ↓
User visits plex.tv/link and enters code
    ↓
PlexAuthService.pollForAuth() (every 1 second, max 5 minutes)
    ↓
Receive auth token
    ↓
Fetch user info
    ↓
SecureTokenStorage.saveAuthToken()
    ↓
Authentication complete
```

### Sync Flow

```
User selects server from discovery list
    ↓
PlexSyncService.addServer()
    ↓
Test connection to server
    ↓
Save server to database
    ↓
PlexSyncService.syncServer()
    ↓
Fetch library sections
    ↓
Create unified Library entries
    ↓
Fetch media items from each section
    ↓
Map to unified MediaItem model
    ↓
Store with plex:// URIs
    ↓
Sync complete
```

## Unified Model Mapping

Plex items are mapped to the unified MediaItem model:

```kotlin
MediaItem(
    libraryId = unifiedLibraryId,
    filePath = "plex://${serverId}/${ratingKey}",
    fileName = plexMetadata.title,
    fileExtension = "", // Not applicable
    fileSize = 0L, // Not available from Plex
    fileHash = ratingKey, // Use rating key as identifier
    mediaType = "MOVIE" | "TV_SHOW" | "MUSIC_TRACK",
    hasThumbnail = true,
    thumbnailPath = plexMetadata.thumb
)
```

### Type Mapping

- Plex `movie` → Unified `MOVIE`
- Plex `show/season/episode` → Unified `TV_SHOW`
- Plex `artist/album/track` → Unified `MUSIC_TRACK`

## Security

### Encrypted Storage

- Uses `androidx.security:security-crypto` library
- AES256_GCM encryption via MasterKey
- Key stored in Android Keystore
- Secure even if device is rooted

### Best Practices

1. **Never log tokens** - Tokens are sensitive credentials
2. **Use HTTPS** - All Plex.tv API calls use HTTPS
3. **Token rotation** - Users can sign out and re-authenticate
4. **Per-device tokens** - Each device gets its own token via PIN flow

## Error Handling

The implementation handles various error cases:

1. **Network errors** - Graceful retry with user feedback
2. **PIN timeout** - 5-minute timeout with clear error message
3. **Invalid token** - Automatic sign-out and re-authentication
4. **Server unavailable** - Skip failed servers during sync
5. **API rate limits** - Exponential backoff (future enhancement)

## UI States

The PlexAuthScreen handles these states:

1. **Idle** - Show sign-in button
2. **RequestingPin** - Loading indicator
3. **WaitingForUser** - Display PIN code and instructions
4. **Authenticating** - Fetching user info
5. **Authenticated** - Success message
6. **DiscoveringServers** - Loading server list
7. **ServersDiscovered** - Display server selection
8. **Error** - Error message with retry option

## Testing

### Unit Tests

```kotlin
@Test
fun testIsAuthenticated_whenTokenExists_returnsTrue() = runBlocking {
    every { tokenStorage.isAuthenticated() } returns true
    val result = authService.isAuthenticated()
    assert(result)
}
```

### Manual Testing

1. Start auth flow and verify PIN displays
2. Visit plex.tv/link and enter PIN
3. Verify authentication completes
4. Check server discovery works
5. Select server and verify sync
6. Check MediaItem entries created with plex:// URIs
7. Test sign-out clears credentials

## Configuration

### Client Identifier

Each device needs a unique identifier:

```kotlin
// Auto-generated and stored in SharedPreferences
// Format: UUID (e.g., "123e4567-e89b-12d3-a456-426614174000")
```

### Polling Configuration

```kotlin
private const val PIN_POLL_INTERVAL_MS = 1000L // 1 second
private const val PIN_MAX_POLL_ATTEMPTS = 300 // 5 minutes
```

### Server Connection

```kotlin
// Prefer local connections over remote
val connection = server.connections.firstOrNull { it.local }
    ?: server.connections.firstOrNull()
```

## Future Enhancements

1. **Background sync** - Periodic sync using WorkManager
2. **Push notifications** - Alert on new content
3. **Watch status sync** - Bidirectional progress tracking
4. **Collection sync** - Import Plex collections
5. **Playlist sync** - Sync Plex playlists
6. **Download support** - Offline viewing
7. **Cast integration** - Cast to Plex-enabled devices
8. **Multi-user support** - Switch between Plex accounts

## Troubleshooting

### Authentication Issues

**Problem:** PIN doesn't authenticate
- **Solution:** Check internet connection, try new PIN

**Problem:** Token expired
- **Solution:** Sign out and re-authenticate

### Server Discovery Issues

**Problem:** No servers found
- **Solution:** Verify Plex account has access to servers

**Problem:** Can't connect to server
- **Solution:** Check firewall, try remote connection

### Sync Issues

**Problem:** Items not appearing
- **Solution:** Check server connectivity, verify library access

**Problem:** Duplicate items
- **Solution:** Check mapping logic, verify unique identifiers

## Dependencies

```kotlin
// Security
implementation("androidx.security:security-crypto:1.1.0-alpha06")

// Networking
implementation("com.squareup.retrofit2:retrofit:2.11.0")
implementation("com.squareup.retrofit2:converter-gson:2.11.0")

// Dependency Injection
implementation("com.google.dagger:hilt-android:2.54")
```

## References

- [Plex API Documentation](https://www.plexopedia.com/plex-media-server/api/)
- [Android Security Library](https://developer.android.com/topic/security/data)
- [Retrofit Documentation](https://square.github.io/retrofit/)

## Support

For issues or questions about the Plex integration:

1. Check this guide for common solutions
2. Review the code comments in the implementation
3. Check Plex API status at status.plex.tv
4. File an issue in the CleverFerret repository
