# Plex API Research from Official Documentation

## Source
**Repository**: https://github.com/LukeHagar/plex-docs  
**OpenAPI Specs**:
- `plex-tv-spec-dereferenced.yaml` - Plex.tv cloud API
- `plex-media-server-spec-dereferenced.yaml` - Media Server API

---

## Key Findings from Official Specs

### 1. Required Headers for Plex.tv API

**All requests must include**:
```
X-Plex-Client-Identifier: {UUID}    [REQUIRED]
X-Plex-Product: CleverFerret         [REQUIRED]
X-Plex-Version: 1.0.0               [RECOMMENDED]
X-Plex-Platform: Android            [RECOMMENDED]
X-Plex-Device: Android              [RECOMMENDED]
X-Plex-Device-Name: CleverFerret    [RECOMMENDED]
X-Plex-Platform-Version: {version}  [OPTIONAL]
```

**For authenticated requests, add**:
```
X-Plex-Token: {auth_token}
```

### 2. PIN Authentication Flow (Official)

#### Step 1: Request PIN
```http
POST https://plex.tv/api/v2/pins?strong=false
Headers:
  X-Plex-Client-Identifier: {client-uuid}
  X-Plex-Product: CleverFerret

Response 200:
{
  "id": 123456,
  "code": "XY7K",
  "product": "CleverFerret",
  "trusted": false,
  "clientIdentifier": "{client-uuid}",
  "expiresIn": 1800,
  "createdAt": "2025-10-07T...",
  "expiresAt": "2025-10-07T...",
  "authToken": null,
  "newRegistration": null
}
```

**Parameters**:
- `strong=false`: Returns 4-digit code for plex.tv/link
- `strong=true`: Returns strong code for other auth flows

#### Step 2: User Authenticates
User visits **plex.tv/link** and enters the 4-digit code

#### Step 3: Poll for Token
```http
GET https://plex.tv/api/v2/pins/{pinId}
Headers:
  X-Plex-Client-Identifier: {client-uuid}

Response 200 (while waiting):
{
  "id": 123456,
  "code": "XY7K",
  "authToken": null,
  ...
}

Response 200 (after user authenticates):
{
  "id": 123456,
  "code": "XY7K",
  "authToken": "abc123xyz...",  // TOKEN RECEIVED!
  ...
}
```

**Polling Strategy**:
- Poll every 1 second
- Max 300 attempts (5 minutes)
- 404 response is normal while waiting
- authToken becomes populated when user authenticates

#### Step 4: Get User Info
```http
GET https://plex.tv/api/v2/user
Headers:
  X-Plex-Token: {auth_token}
  X-Plex-Client-Identifier: {client-uuid}

Response 200:
{
  "id": 789,
  "uuid": "f3df4e01bfca0787",
  "username": "JohnDoe",
  "title": "John Doe",
  "email": "john@example.com",
  "friendlyName": "John",
  "locale": "en",
  "confirmed": true,
  "joinedAt": 1234567890,
  "thumb": "https://plex.tv/users/abc/avatar",
  "authToken": "abc123xyz...",
  "subscription": {
    "active": true,
    "status": "Active",
    "plan": "lifetime",
    "features": [...]
  },
  ...
}
```

### 3. Server Discovery

```http
GET https://plex.tv/api/v2/resources?includeHttps=1&includeRelay=0&includeIPv6=0
Headers:
  X-Plex-Token: {auth_token}
  X-Plex-Client-Identifier: {client-uuid}

Response 200:
[
  {
    "name": "My Plex Server",
    "product": "Plex Media Server",
    "productVersion": "1.31.3.6868",
    "platform": "Linux",
    "platformVersion": "5.19.17",
    "device": "PC",
    "clientIdentifier": "abc123...",
    "createdAt": "2022-06-02T00:54:26Z",
    "lastSeenAt": "2023-04-11T05:53:59Z",
    "provides": "server",
    "ownerId": "789",
    "owned": true,
    "accessToken": "server-specific-token",
    "httpsRequired": false,
    "publicAddress": "123.45.67.89",
    "connections": [
      {
        "protocol": "https",
        "address": "192.168.1.100",
        "port": 32400,
        "uri": "https://192.168.1.100:32400",
        "local": true,
        "relay": false,
        "IPv6": false
      },
      {
        "protocol": "https",
        "address": "123.45.67.89",
        "port": 32400,
        "uri": "https://123.45.67.89:32400",
        "local": false,
        "relay": false,
        "IPv6": false
      }
    ]
  }
]
```

**Query Parameters**:
- `includeHttps=1`: Include HTTPS connections (recommended)
- `includeRelay=0`: Exclude relay connections (faster, more reliable)
- `includeIPv6=0`: Exclude IPv6 connections (compatibility)

**Filter**:
- Only use resources where `provides` contains "server"
- Owned servers have `owned: true`
- Each server has multiple `connections` (try local first)

### 4. Media Server API

#### Get Server Info
```http
GET https://{server-address}:32400/
Headers:
  X-Plex-Token: {server-token}
  X-Plex-Client-Identifier: {client-uuid}

Response:
{
  "friendlyName": "My Plex Server",
  "machineIdentifier": "xyz789abc...",
  "version": "1.32.5.7349",
  "platform": "Linux",
  "myPlex": true,
  ...
}
```

#### Get Libraries
```http
GET https://{server-address}:32400/library/sections
Headers:
  X-Plex-Token: {server-token}

Response:
{
  "MediaContainer": {
    "size": 3,
    "Directory": [
      {
        "allowSync": true,
        "art": "/:/resources/movie-fanart.jpg",
        "composite": "/library/sections/1/composite/...",
        "filters": true,
        "refreshing": false,
        "thumb": "/:/resources/movie.png",
        "key": "1",
        "type": "movie",
        "title": "Movies",
        "agent": "tv.plex.agents.movie",
        "scanner": "Plex Movie",
        "language": "en-US",
        "uuid": "abc-123-def-456",
        "updatedAt": 1234567890,
        "createdAt": 1234567890,
        "scannedAt": 1234567890,
        "count": 250
      }
    ]
  }
}
```

#### Get Library Items
```http
GET https://{server-address}:32400/library/sections/{key}/all
Headers:
  X-Plex-Token: {server-token}

Response:
{
  "MediaContainer": {
    "size": 250,
    "allowSync": true,
    "identifier": "com.plexapp.plugins.library",
    "librarySectionID": "1",
    "librarySectionTitle": "Movies",
    "librarySectionUUID": "abc-123-def-456",
    "Metadata": [
      {
        "ratingKey": "12345",
        "key": "/library/metadata/12345",
        "guid": "plex://movie/5d77686...",
        "studio": "Warner Bros.",
        "type": "movie",
        "title": "The Matrix",
        "contentRating": "R",
        "summary": "A hacker discovers...",
        "rating": 8.7,
        "year": 1999,
        "duration": 8160000,
        "thumb": "/library/metadata/12345/thumb/...",
        "art": "/library/metadata/12345/art/...",
        "addedAt": 1234567890,
        "updatedAt": 1234567890,
        "Genre": [
          { "tag": "Action" },
          { "tag": "Science Fiction" }
        ],
        "Media": [...]
      }
    ]
  }
}
```

---

## Implementation Corrections Needed

### ✅ Already Correct
1. Base URL: `https://plex.tv/api/v2` ✓
2. PIN endpoint: `POST /pins` ✓
3. Token check: `GET /pins/{pinId}` ✓
4. User info: `GET /user` ✓
5. Resources: `GET /resources` ✓

### ✅ Now Fixed
1. Added all required headers (X-Plex-Product, etc.)
2. Added `strong` parameter to PIN request
3. Added client identifier to all endpoints
4. Added proper logging
5. Handle 404 responses during polling (expected)

### ✅ Response Models
Our models match the official spec:
- PlexPinResponse ✓
- PlexUserResponse ✓
- PlexResourceResponse ✓
- PlexConnection ✓

---

## Best Practices from Official Docs

### Connection Priority
1. **Local HTTPS** (192.168.x.x) - Fastest, most secure
2. **Local HTTP** (fallback)
3. **Remote HTTPS** (public IP) - Accessible from anywhere
4. **Remote HTTP** (last resort)
5. **Skip relay** connections (slower, less reliable)

### Headers Best Practices
- **Always send X-Plex-Client-Identifier** (UUID per device)
- **Include X-Plex-Product** (app name)
- **Add X-Plex-Platform** (Android)
- **Persist client ID** across app restarts

### Error Handling
- **200**: Success
- **400**: Bad request (missing parameters)
- **401**: Unauthorized (missing/invalid token)
- **404**: Not found (normal during PIN polling)

### Security
- **Always use HTTPS** when available
- **Store tokens encrypted** (we use AES256-GCM ✓)
- **Include authentication tokens** in headers, not query params
- **Validate server certificates**

---

## Implementation Status

### ✅ Fully Compliant
Our implementation now matches the official Plex API specification:

1. **Authentication**: Proper PIN flow with all headers ✓
2. **Polling**: Correct polling strategy with 404 handling ✓
3. **Headers**: All required headers included ✓
4. **Endpoints**: Using correct URLs and methods ✓
5. **Response models**: Match official spec ✓
6. **Security**: Encrypted storage + HTTPS ✓
7. **Connection selection**: Local-first strategy ✓
8. **Error handling**: Proper HTTP status codes ✓

**The implementation is now 100% compliant with official Plex API docs!** ✅

