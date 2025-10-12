# CleverFerret Integration Guide

## Overview

This guide documents the new integrations and features added to CleverFerret, transforming it into a comprehensive universal media manager with support for external media servers, network storage, and enhanced metadata APIs.

## New Features

### 1. Media Server Integration

CleverFerret now supports integration with popular media server platforms:

#### Jellyfin Integration
- **Official SDK**: Uses the official Jellyfin Kotlin SDK for type-safe API access
- **Features**:
  - User authentication with username/password
  - Library browsing and search
  - Recently added items
  - Playback progress tracking
  - Mark items as played/unplayed
  - Direct streaming support

**Usage Example**:
```kotlin
val jellyfinClient = JellyfinClient(okHttpClient)
jellyfinClient.initialize("http://192.168.1.100:8096", "your-api-key")

// Authenticate
val result = jellyfinClient.authenticate(serverUrl, username, password)

// Get libraries
val libraries = jellyfinClient.getLibraryViews()

// Search for content
val searchResults = jellyfinClient.searchItems("Star Wars")
```

#### Plex Integration
- **REST API**: Direct integration with Plex Media Server API
- **Features**:
  - Server information retrieval
  - Library sections and items
  - Recently added and on-deck content
  - Metadata retrieval
  - Collections and playlists

**Usage Example**:
```kotlin
val plexApi = apiManager.createPlexApi(
    baseUrl = "http://192.168.1.101:32400",
    token = "your-plex-token"
)

val serverInfo = plexApi.getServerInfo()
val libraries = plexApi.getLibrarySections()
val recentlyAdded = plexApi.getRecentlyAdded()
```

#### Emby Integration
- **REST API**: Integration with Emby Media Server
- **Features**:
  - User authentication
  - Library views and items
  - Server information
  - Item details and metadata

**Usage Example**:
```kotlin
val embyApi = apiManager.createEmbyApi(
    baseUrl = "http://192.168.1.102:8096",
    apiKey = "your-api-key"
)

val serverInfo = embyApi.getServerInfo()
val items = embyApi.getLibraryItems(userId, types = "Movie,Series")
```

### 2. Content Discovery APIs

#### Librivox Audiobooks
- **Free public domain audiobooks**
- Search by title, author, or genre
- RSS feed URLs for direct streaming
- Complete metadata including duration and language

**Usage Example**:
```kotlin
val librivoxApi = apiManager.createLibrivoxApi()
val audiobooks = librivoxApi.searchAudiobooks(
    title = "Science Fiction",
    limit = 50
)
```

#### Apple Podcasts (iTunes Search API)
- **2.6+ million podcasts**
- Search by term with filtering
- Artwork URLs in multiple resolutions
- Feed URLs for subscription

**Usage Example**:
```kotlin
val podcastsApi = apiManager.createApplePodcastsApi()
val podcasts = podcastsApi.searchPodcasts(
    term = "technology",
    limit = 25
)
```

#### The Movie Database (TMDb)
- **Comprehensive movie and TV metadata**
- Search movies and TV shows
- Detailed information including cast, crew, ratings
- High-quality poster and backdrop images

**Usage Example**:
```kotlin
val tmdbApi = apiManager.createTmdbApi()
val movies = tmdbApi.searchMovies(
    apiKey = "your-api-key",
    query = "Inception"
)
val details = tmdbApi.getMovieDetails(movieId, apiKey)
```

#### Open Library
- **Book metadata and bibliographic data**
- Search by title, author, ISBN
- Cover images and subject information
- Work and edition details

**Usage Example**:
```kotlin
val openLibraryApi = apiManager.createOpenLibraryApi()
val books = openLibraryApi.searchBooks(query = "Kotlin Programming")
val bookDetails = openLibraryApi.getBookByIsbn("9781234567890")
```

### 3. Network Storage Integration

#### SMB/CIFS Support
- **Access Windows shares and NAS devices**
- Full file operations (read, write, delete)
- Directory browsing and creation
- Progress tracking for uploads/downloads
- Support for SMB2 and SMB3 protocols

**Usage Example**:
```kotlin
val networkStorage = NetworkStorageService(context)
networkStorage.initialize(
    domain = "WORKGROUP",
    username = "user",
    password = "password"
)

// List files
val files = networkStorage.listFiles("smb://192.168.1.100/media/")

// Download file
networkStorage.downloadFile(
    smbUrl = "smb://192.168.1.100/media/movie.mp4",
    localUri = localFileUri,
    progressCallback = { current, total ->
        // Update progress UI
    }
)
```

#### WebDAV Support
- **Cloud storage integration** (Nextcloud, ownCloud, etc.)
- File and directory operations
- Move, copy, and delete operations
- PROPFIND for metadata retrieval

**Usage Example**:
```kotlin
val webDavClient = WebDavClient(context, okHttpClient)
webDavClient.initialize(
    serverUrl = "https://cloud.example.com/remote.php/webdav",
    username = "user",
    password = "password"
)

// List files
val files = webDavClient.listFiles("/Documents")

// Upload file
webDavClient.uploadFile(
    localUri = localFileUri,
    remotePath = "/Documents/file.pdf"
)
```

### 4. User Interface Enhancements

#### Media Server Settings Screen
- Add and manage multiple media servers
- Test connections
- View connection status
- Support for Jellyfin, Plex, and Emby

**Navigation**:
```kotlin
// From Settings screen
navController.navigate("media_servers")
```

#### Network Storage Settings Screen
- Configure SMB/CIFS shares
- Add WebDAV storage
- Test connections and browse files
- Manage multiple storage locations

**Navigation**:
```kotlin
// From Settings screen
navController.navigate("network_storage")
```

## Architecture

### Dependency Injection

All new services are provided through Hilt modules:

- **ApiModule**: Provides API services (Librivox, TMDb, etc.)
- **NetworkModule**: Provides network services (Jellyfin, SMB, WebDAV)

### Data Layer

New Room entities for persistent storage:
- `JellyfinServer`: Jellyfin server configurations
- `PlexServer`: Plex server configurations
- `EmbyServer`: Emby server configurations

### Repository Pattern

Services follow the repository pattern with:
- Clear separation of concerns
- Coroutine-based async operations
- Result types for error handling
- Flow-based reactive updates

## Dependencies Added

```kotlin
// Kotlinx Serialization for Retrofit
implementation("com.jakewharton.retrofit:retrofit2-kotlinx-serialization-converter:1.0.0")

// Jellyfin SDK
implementation("org.jellyfin.sdk:jellyfin-core:1.5.4")

// SMB/CIFS support
implementation("eu.agno3.jcifs:jcifs-ng:2.1.10")
```

## Configuration

### API Keys Required

1. **TMDb API**: Register at https://www.themoviedb.org/settings/api
2. **Plex Token**: Obtain from Plex account settings
3. **Jellyfin/Emby**: Use server credentials

### Network Configuration

For SMB/CIFS access:
- Ensure network connectivity to shares
- Verify firewall allows SMB ports (445)
- Use correct domain/workgroup settings

For WebDAV:
- Use HTTPS for secure connections
- Verify server supports WebDAV protocol
- Check authentication requirements

## Best Practices

### Error Handling

All network operations return `Result<T>`:

```kotlin
val result = jellyfinClient.getLibraryViews()
result.fold(
    onSuccess = { libraries ->
        // Handle success
    },
    onFailure = { error ->
        // Handle error
    }
)
```

### Coroutines

All operations are suspend functions:

```kotlin
viewModelScope.launch {
    val items = jellyfinClient.getLibraryItems()
    // Update UI
}
```

### Security

- Store credentials securely using EncryptedSharedPreferences
- Use HTTPS for WebDAV connections
- Validate server certificates
- Never log sensitive information

## Testing

### Unit Tests

Test individual components:

```kotlin
@Test
fun `test Jellyfin authentication`() = runTest {
    val client = JellyfinClient(mockOkHttpClient)
    val result = client.authenticate(serverUrl, username, password)
    assertTrue(result.isSuccess)
}
```

### Integration Tests

Test full workflows:

```kotlin
@Test
fun `test media server sync`() = runTest {
    // Add server
    viewModel.addServer(ServerType.JELLYFIN, name, url, username, password, "")
    
    // Verify connection
    val state = viewModel.uiState.first()
    assertTrue(state.jellyfinServers.first().isConnected)
}
```

## Troubleshooting

### Jellyfin Connection Issues
- Verify server URL is correct (include port)
- Check username and password
- Ensure server is accessible from device
- Review server logs for authentication errors

### Plex Connection Issues
- Verify X-Plex-Token is valid
- Check server is running and accessible
- Ensure token has required permissions
- Test with Plex web interface first

### SMB/CIFS Issues
- Verify network connectivity
- Check firewall settings
- Ensure SMB is enabled on server
- Try different SMB protocol versions
- Verify credentials and domain

### WebDAV Issues
- Check server URL format
- Verify WebDAV is enabled
- Test with WebDAV client (e.g., Cyberduck)
- Review server logs for errors
- Check SSL certificate validity

## Future Enhancements

Potential improvements:
- Automatic server discovery (mDNS/Bonjour)
- Offline caching of metadata
- Background sync services
- Multi-server search
- Cross-server playlists
- Advanced filtering and sorting
- Server-side transcoding support
- Download queue management

## Contributing

When adding new integrations:
1. Follow existing architecture patterns
2. Use dependency injection
3. Implement proper error handling
4. Add comprehensive documentation
5. Include unit tests
6. Update this guide

## License

CleverFerret is licensed under the terms specified in the main LICENSE file.

## Support

For issues or questions:
- GitHub Issues: https://github.com/Kaleaon/CleverFerret/issues
- Documentation: This file and inline code comments