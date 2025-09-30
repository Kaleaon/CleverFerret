# Plex Integration Architecture

## System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                         CleverFerret App                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌────────────────────────────────────────────────────────┐   │
│  │                    UI Layer (Compose)                   │   │
│  │  ┌─────────────────┐       ┌─────────────────────┐    │   │
│  │  │ PlexAuthScreen  │       │ PlexSyncScreen      │    │   │
│  │  │ - PIN display   │       │ - Sync status       │    │   │
│  │  │ - Server list   │       │ - Progress tracking │    │   │
│  │  └────────┬────────┘       └──────────┬──────────┘    │   │
│  │           │                           │                │   │
│  │  ┌────────▼────────┐       ┌──────────▼──────────┐   │   │
│  │  │PlexAuthViewModel│       │PlexSyncViewModel    │   │   │
│  │  │ - State mgmt    │       │ - Sync coordination │   │   │
│  │  └────────┬────────┘       └──────────┬──────────┘   │   │
│  └───────────┼────────────────────────────┼──────────────┘   │
│              │                            │                   │
│  ┌───────────▼────────────────────────────▼──────────────┐   │
│  │              Service Layer (Business Logic)            │   │
│  │  ┌─────────────────┐       ┌─────────────────────┐   │   │
│  │  │ PlexAuthService │       │ PlexSyncService     │   │   │
│  │  │ - PIN auth      │◄──────┤ - Media sync        │   │   │
│  │  │ - Discovery     │       │ - Model mapping     │   │   │
│  │  │ - Token mgmt    │       │ - Progress tracking │   │   │
│  │  └────────┬────────┘       └──────────┬──────────┘   │   │
│  │           │                           │                │   │
│  │  ┌────────▼────────┐                 │                │   │
│  │  │SecureTokenStorage│◄────────────────┘                │   │
│  │  │ - Encrypted prefs│                                  │   │
│  │  │ - Token storage  │                                  │   │
│  │  └─────────────────┘                                  │   │
│  └───────────┬──────────────────────────────────────────┘   │
│              │                                               │
│  ┌───────────▼──────────────────────────────────────────┐   │
│  │            Network Layer (Retrofit)                   │   │
│  │  ┌─────────────────┐       ┌─────────────────────┐  │   │
│  │  │  PlexAuthApi    │       │  PlexApi            │  │   │
│  │  │  - PIN endpoints│       │  - Server endpoints │  │   │
│  │  │  - User info    │       │  - Media endpoints  │  │   │
│  │  └────────┬────────┘       └──────────┬──────────┘  │   │
│  └───────────┼────────────────────────────┼─────────────┘   │
│              │                            │                  │
│  ┌───────────▼────────────────────────────▼─────────────┐   │
│  │           Data Layer (Room Database)                  │   │
│  │  ┌────────────────────────────────────────────────┐  │   │
│  │  │ PlexServer │ PlexMediaItem │ PlexProgress      │  │   │
│  │  │ PlexRating │ PlexCollection│ ...               │  │   │
│  │  └────────────┬───────────────────────────────────┘  │   │
│  │               │                                       │   │
│  │  ┌────────────▼───────────────────────────────────┐  │   │
│  │  │         Unified Model (MediaItem)              │  │   │
│  │  │  - All media in single model                   │  │   │
│  │  │  - plex:// URI scheme                          │  │   │
│  │  └────────────────────────────────────────────────┘  │   │
│  └───────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘

            ▲                                    ▲
            │                                    │
            │ HTTPS                              │ HTTP(S)
            │                                    │
            │                                    │
┌───────────┴──────────┐           ┌────────────┴──────────┐
│    Plex.tv Cloud     │           │   Plex Media Server   │
│  - Authentication    │           │   - Media libraries   │
│  - User management   │           │   - Media metadata    │
│  - Server discovery  │           │   - Playback control  │
└──────────────────────┘           └───────────────────────┘
```

## Authentication Flow

```
┌──────┐                 ┌─────────────┐              ┌─────────┐
│ User │                 │CleverFerret │              │Plex.tv  │
└───┬──┘                 └──────┬──────┘              └────┬────┘
    │                           │                          │
    │ 1. Click "Sign in"       │                          │
    ├──────────────────────────►│                          │
    │                           │                          │
    │                           │ 2. POST /api/v2/pins    │
    │                           ├─────────────────────────►│
    │                           │                          │
    │                           │ 3. PIN Response          │
    │                           │◄─────────────────────────┤
    │                           │    {code: "ABCD", id: 123}
    │                           │                          │
    │ 4. Display PIN "ABCD"    │                          │
    │◄──────────────────────────┤                          │
    │                           │                          │
    │ 5. Visit plex.tv/link    │                          │
    │ Enter code "ABCD"         │                          │
    ├───────────────────────────┼─────────────────────────►│
    │                           │                          │
    │ 6. User authorizes        │                          │
    │                           │                          │
    │                           │ 7. Poll PIN (every 1s)   │
    │                           ├─────────────────────────►│
    │                           │                          │
    │                           │ 8. Token Response        │
    │                           │◄─────────────────────────┤
    │                           │    {authToken: "xyz..."}  │
    │                           │                          │
    │                           │ 9. GET /api/v2/user     │
    │                           ├─────────────────────────►│
    │                           │    X-Plex-Token: xyz...  │
    │                           │                          │
    │                           │ 10. User Info            │
    │                           │◄─────────────────────────┤
    │                           │                          │
    │                           │ 11. Store token securely │
    │                           │  (EncryptedSharedPrefs)  │
    │                           │                          │
    │ 12. "Success!"           │                          │
    │◄──────────────────────────┤                          │
    │                           │                          │
```

## Server Discovery & Sync Flow

```
┌──────┐         ┌─────────────┐      ┌─────────┐      ┌──────────┐
│ User │         │CleverFerret │      │Plex.tv  │      │Plex Server│
└───┬──┘         └──────┬──────┘      └────┬────┘      └────┬─────┘
    │                   │                   │                │
    │ 1. "Discover"    │                   │                │
    ├──────────────────►│                   │                │
    │                   │                   │                │
    │                   │ 2. GET resources  │                │
    │                   ├──────────────────►│                │
    │                   │                   │                │
    │                   │ 3. Server list    │                │
    │                   │◄──────────────────┤                │
    │                   │                   │                │
    │ 4. Show servers  │                   │                │
    │◄──────────────────┤                   │                │
    │                   │                   │                │
    │ 5. Select server │                   │                │
    ├──────────────────►│                   │                │
    │                   │                   │                │
    │                   │ 6. Test connection               │
    │                   ├──────────────────────────────────►│
    │                   │    GET /                          │
    │                   │                                   │
    │                   │ 7. Server info                    │
    │                   │◄──────────────────────────────────┤
    │                   │                                   │
    │                   │ 8. Get libraries                  │
    │                   ├──────────────────────────────────►│
    │                   │    GET /library/sections          │
    │                   │                                   │
    │                   │ 9. Library list                   │
    │                   │◄──────────────────────────────────┤
    │                   │                                   │
    │                   │ 10. For each library:             │
    │                   │    GET /library/sections/{id}/all │
    │                   ├──────────────────────────────────►│
    │                   │                                   │
    │                   │ 11. Media items                   │
    │                   │◄──────────────────────────────────┤
    │                   │                                   │
    │                   │ 12. Map to unified model          │
    │                   │  (Create MediaItem entries)       │
    │                   │                                   │
    │ 13. "Sync done!" │                   │                │
    │◄──────────────────┤                   │                │
    │                   │                   │                │
```

## Data Model Relationships

```
┌────────────────────────────────────────────────────────────────┐
│                         Database Schema                         │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────┐                                               │
│  │ PlexServer  │                                               │
│  │─────────────│                                               │
│  │ serverId PK │                                               │
│  │ name        │                                               │
│  │ host        │                                               │
│  │ token       │                                               │
│  └──────┬──────┘                                               │
│         │ 1:N                                                  │
│         │                                                      │
│  ┌──────▼──────────┐            ┌─────────────────┐          │
│  │ PlexMediaItem   │            │ Library         │          │
│  │─────────────────│            │─────────────────│          │
│  │ id PK           │            │ libraryId PK    │          │
│  │ serverId FK     │            │ name            │          │
│  │ plexRatingKey   │            │ path            │          │
│  │ title           │◄───────────┤ type            │          │
│  │ type            │   Maps to  └─────────┬───────┘          │
│  └──────┬──────────┘                      │ 1:N              │
│         │ 1:1                             │                   │
│         │                                 │                   │
│  ┌──────▼──────────┐            ┌────────▼────────┐          │
│  │ PlexProgress    │            │ MediaItem       │          │
│  │─────────────────│            │─────────────────│          │
│  │ id PK           │            │ itemId PK       │          │
│  │ plexMediaItemId │            │ libraryId FK    │          │
│  │ localProgress   │            │ filePath        │          │
│  │ plexProgress    │            │ fileName        │          │
│  │ needsSync       │            │ mediaType       │          │
│  └─────────────────┘            │ thumbnailPath   │          │
│         │ 1:1                   └─────────────────┘          │
│         │                                                      │
│  ┌──────▼──────────┐                                          │
│  │ PlexRating      │                                          │
│  │─────────────────│                                          │
│  │ id PK           │                                          │
│  │ plexMediaItemId │                                          │
│  │ localRating     │                                          │
│  │ plexRating      │                                          │
│  │ needsSync       │                                          │
│  └─────────────────┘                                          │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

## Security Architecture

```
┌────────────────────────────────────────────────────────────────┐
│                      Security Layers                            │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Layer 4: Application                                          │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ PlexAuthService                                           │ │
│  │ - Never logs tokens                                       │ │
│  │ - Validates responses                                     │ │
│  │ - Handles errors gracefully                               │ │
│  └───────────────────────────┬──────────────────────────────┘ │
│                              │                                 │
│  Layer 3: Token Storage                                        │
│  ┌───────────────────────────▼──────────────────────────────┐ │
│  │ SecureTokenStorage                                        │ │
│  │ ┌────────────────────────────────────────────────────┐   │ │
│  │ │ EncryptedSharedPreferences                         │   │ │
│  │ │ - AES256_GCM encryption                            │   │ │
│  │ │ - Key derivation via PBKDF2                        │   │ │
│  │ └────────────────────┬───────────────────────────────┘   │ │
│  └──────────────────────┼───────────────────────────────────┘ │
│                         │                                      │
│  Layer 2: Master Key                                           │
│  ┌──────────────────────▼───────────────────────────────────┐ │
│  │ MasterKey                                                 │ │
│  │ - AES256_GCM key scheme                                   │ │
│  │ - Per-device unique key                                   │ │
│  └──────────────────────┬───────────────────────────────────┘ │
│                         │                                      │
│  Layer 1: Hardware                                             │
│  ┌──────────────────────▼───────────────────────────────────┐ │
│  │ Android Keystore                                          │ │
│  │ - Hardware-backed key storage                             │ │
│  │ - Protected from extraction                               │ │
│  │ - Secure even if device is rooted                         │ │
│  └───────────────────────────────────────────────────────────┘ │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

## Component Interaction Matrix

```
┌──────────────┬─────────┬─────────┬─────────┬─────────┬─────────┐
│ Component    │ Auth    │ Token   │ Sync    │ DB      │ Network │
│              │ Service │ Storage │ Service │         │         │
├──────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
│ AuthScreen   │   RW    │    -    │    -    │    -    │    -    │
│              │  State  │         │         │         │         │
├──────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
│ AuthViewModel│   RW    │    -    │   R     │    -    │    -    │
│              │  Calls  │         │  Calls  │         │         │
├──────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
│ AuthService  │    -    │   RW    │    -    │    -    │   RW    │
│              │         │  Store  │         │         │  API    │
├──────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
│ TokenStorage │    -    │    -    │    -    │    -    │    -    │
│              │         │  (Self) │         │         │         │
├──────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
│ SyncService  │   R     │    -    │    -    │   RW    │   RW    │
│              │  Token  │         │         │  Store  │  API    │
├──────────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
│ SyncViewModel│    -    │    -    │   RW    │    -    │    -    │
│              │         │         │  State  │         │         │
└──────────────┴─────────┴─────────┴─────────┴─────────┴─────────┘

Legend: R = Read, W = Write, RW = Read/Write
```

## State Management

```
Authentication States:
┌──────────────────────────────────────────────────────────────┐
│                                                               │
│  Idle ──► RequestingPin ──► WaitingForUser ──► Authenticating│
│   ▲                              │                    │      │
│   │                              │                    ▼      │
│   └─────── Error ◄───────────────┴──────── Authenticated    │
│                                                       │      │
│                                                       ▼      │
│                                            DiscoveringServers│
│                                                       │      │
│                                                       ▼      │
│                                             ServersDiscovered│
│                                                               │
└──────────────────────────────────────────────────────────────┘

Sync States:
┌──────────────────────────────────────────────────────────────┐
│                                                               │
│  Idle ──► Syncing ──┬──► Success                            │
│   ▲                  │                                        │
│   │                  └──► Error                              │
│   │                       │                                   │
│   └───────────────────────┘                                  │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

## Error Handling Strategy

```
┌────────────────────────────────────────────────────────────────┐
│                    Error Handling Flow                          │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Network Error                                                  │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ 1. Catch exception                                        │ │
│  │ 2. Log error (no sensitive data)                         │ │
│  │ 3. Update state to Error                                 │ │
│  │ 4. Show user-friendly message                            │ │
│  │ 5. Provide retry option                                  │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                 │
│  Authentication Timeout                                         │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ 1. Poll reaches max attempts                             │ │
│  │ 2. Cancel polling                                        │ │
│  │ 3. Clear PIN data                                        │ │
│  │ 4. Show timeout message                                  │ │
│  │ 5. Return to Idle state                                  │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                 │
│  Invalid Token                                                  │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ 1. Detect 401 Unauthorized                               │ │
│  │ 2. Clear stored token                                    │ │
│  │ 3. Return to Idle state                                  │ │
│  │ 4. Prompt for re-authentication                          │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                 │
│  Server Unavailable                                             │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ 1. Mark server as offline                                │ │
│  │ 2. Skip in sync operations                               │ │
│  │ 3. Continue with other servers                           │ │
│  │ 4. Log warning                                           │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

## Performance Considerations

```
┌────────────────────────────────────────────────────────────────┐
│                     Performance Strategy                        │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Network Efficiency                                             │
│  - Batch API calls where possible                              │
│  - Use pagination for large libraries                          │
│  - Cache server connections                                    │
│  - Prefer local connections                                    │
│                                                                 │
│  Database Efficiency                                            │
│  - Use transactions for bulk inserts                           │
│  - Index on commonly queried fields                            │
│  - Clean up stale data periodically                            │
│                                                                 │
│  UI Responsiveness                                              │
│  - All network calls on IO dispatcher                          │
│  - State updates on main thread                                │
│  - Show loading indicators                                     │
│  - Cancel operations on screen exit                            │
│                                                                 │
│  Memory Management                                              │
│  - Stream large responses                                      │
│  - Release resources promptly                                  │
│  - Use weak references where appropriate                       │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

## Testing Strategy

```
┌────────────────────────────────────────────────────────────────┐
│                        Test Coverage                            │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Unit Tests (PlexAuthServiceTest.kt)                           │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ - Authentication flow                                     │ │
│  │ - Token storage                                           │ │
│  │ - Server discovery                                        │ │
│  │ - Error handling                                          │ │
│  │ - State management                                        │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                 │
│  Integration Tests (Future)                                     │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ - End-to-end auth flow                                   │ │
│  │ - Server sync                                             │ │
│  │ - Model mapping                                           │ │
│  │ - Database operations                                     │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                 │
│  UI Tests (Future)                                              │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │ - Screen navigation                                       │ │
│  │ - User interactions                                       │ │
│  │ - Error displays                                          │ │
│  │ - State transitions                                       │ │
│  └──────────────────────────────────────────────────────────┘ │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

## Future Extensions

```
┌────────────────────────────────────────────────────────────────┐
│                   Extensibility Points                          │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Authentication                                                 │
│  - Multiple Plex accounts                                      │
│  - OAuth2 flow (alternative)                                   │
│  - SSO integration                                             │
│                                                                 │
│  Sync                                                           │
│  - Background sync with WorkManager                            │
│  - Incremental sync (deltas)                                   │
│  - Bidirectional progress sync                                 │
│  - Watch status sync                                           │
│                                                                 │
│  Media                                                          │
│  - Playback integration                                        │
│  - Download for offline                                        │
│  - Cast to Plex-enabled devices                                │
│  - Transcoding support                                         │
│                                                                 │
│  Features                                                       │
│  - Collection management                                       │
│  - Playlist sync                                               │
│  - Smart recommendations                                       │
│  - Activity feed                                               │
│                                                                 │
│  Other Services                                                 │
│  - Jellyfin (similar API)                                      │
│  - Emby (similar API)                                          │
│  - Kodi (XBMC)                                                 │
│  - Generic DLNA servers                                        │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

This architecture provides a solid foundation for Plex integration with
clear separation of concerns, robust error handling, and extensibility
for future enhancements.
