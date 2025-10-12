# Phase 2: Media Services - Implementation Guide

## Overview
This document provides the implementation details for fixing all media service TODO items.

## TODO Items to Fix

### 1. AudiobookService.kt (2 TODOs)

#### TODO #1: Load audiobook cover art (Line 86)
**Current Code:**
```kotlin
artwork = null // TODO: Load audiobook cover art
```

**Fixed Code:**
```kotlin
// Load audiobook cover art using ArtworkLoader
val artworkLoader = com.universalmedialibrary.services.artwork.ArtworkLoader(
    context,
    okhttp3.OkHttpClient(),
    com.universalmedialibrary.services.cache.CacheManager(context)
)
val artwork = artworkLoader.loadArtwork(
    mediaItem = mediaItem,
    maxWidth = 512,
    maxHeight = 512
)

// Use in mediaController.startPlayback
artwork = artwork
```

**Better Approach - Inject ArtworkLoader:**
Add to class constructor:
```kotlin
@Singleton
class AudiobookService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaRepository: MediaRepository,
    private val exoPlayerService: ExoPlayerService,
    private val mediaController: MediaController,
    private val artworkLoader: ArtworkLoader  // ADD THIS
) {
```

Then use:
```kotlin
val artwork = artworkLoader.loadArtwork(
    mediaItem = mediaItem,
    maxWidth = 512,
    maxHeight = 512
)
```

#### TODO #2: Extract author from metadata (Line 147)
**Current Code:**
```kotlin
author = "Unknown Author", // TODO: Extract from metadata when available
```

**Fixed Code:**
```kotlin
// Extract author from metadata
val metadata = metadataExtractionService.extractMetadata(mediaItem)
val author = metadata.commonMetadata?.creator ?: 
             metadata.bookMetadata?.author ?: 
             "Unknown Author"
```

**Better Approach - Inject MetadataExtractionService:**
Add to class constructor:
```kotlin
private val metadataExtractionService: MetadataExtractionService  // ADD THIS
```

### 2. AdvancedMusicPlayerService.kt (2 TODOs)

#### TODO #1: Load artwork from albumArtUrl
**Location:** Line ~XX (need to find exact line)

**Fixed Code:**
```kotlin
// Load artwork from album art URL or embedded metadata
val artwork = if (!albumArtUrl.isNullOrEmpty()) {
    artworkLoader.loadFromUrl(
        url = albumArtUrl,
        maxWidth = 512,
        maxHeight = 512
    )
} else {
    // Try to extract from file
    artworkLoader.loadArtwork(
        mediaItem = mediaItem,
        maxWidth = 512,
        maxHeight = 512
    )
}
```

#### TODO #2: Extract duration from file metadata
**Fixed Code:**
```kotlin
// Extract duration using MediaMetadataRetriever
val retriever = MediaMetadataRetriever()
val duration = try {
    retriever.setDataSource(mediaItem.filePath)
    retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull() ?: 0L
} catch (e: Exception) {
    0L
} finally {
    retriever.release()
}
```

**Better Approach - Use MetadataExtractionService:**
```kotlin
val metadata = metadataExtractionService.extractMetadata(mediaItem)
val duration = metadata.musicMetadata?.duration ?: 0L
```

### 3. MediaNotificationService.kt (4 TODOs)

#### TODO #1: Implement proper initialization strategy
**Current:** Manual factory or lazy initialization needed

**Fixed Approach:**
```kotlin
// Use Hilt for proper dependency injection
@Singleton
class MediaNotificationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaSessionManager: MediaSessionManager,
    private val artworkLoader: ArtworkLoader
) {
    // Lazy initialization of notification manager
    private val notificationManager by lazy {
        context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
    }
    
    // Initialize notification channel on first use
    init {
        createNotificationChannel()
    }
}
```

#### TODO #2: Get MediaSession from proper source
**Fixed Code:**
```kotlin
// Get MediaSession from MediaSessionManager
private fun getMediaSession(): MediaSession? {
    return mediaSessionManager.getCurrentSession()
}
```

#### TODO #3: Initialize artworkLoader properly
**Fixed Code:**
```kotlin
// Inject ArtworkLoader via constructor (already done above)
// Use it in notification building:
private suspend fun loadNotificationArtwork(mediaItem: MediaItem): Bitmap? {
    return artworkLoader.loadArtwork(
        mediaItem = mediaItem,
        maxWidth = 256,  // Smaller for notifications
        maxHeight = 256
    )
}
```

#### TODO #4: Investigate proper Media3 notification integration
**Implementation:**
```kotlin
// Use Media3's MediaNotification.Provider
import androidx.media3.session.MediaNotification
import androidx.media3.session.DefaultMediaNotificationProvider

class MediaNotificationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaSessionManager: MediaSessionManager,
    private val artworkLoader: ArtworkLoader
) {
    private val notificationProvider = DefaultMediaNotificationProvider.Builder(context)
        .setChannelId(NOTIFICATION_CHANNEL_ID)
        .setChannelName(R.string.notification_channel_name)
        .build()
    
    fun showNotification(mediaSession: MediaSession) {
        val notification = notificationProvider.createNotification(
            mediaSession,
            emptyList(), // Custom actions
            MediaNotification.ActionFactory { _, _ -> null },
            onNotificationChangedCallback
        )
        // Show notification
    }
}
```

### 4. MediaSessionManager.kt (1 TODO)

#### TODO: Set duration for MediaMetadata
**Current Code:**
```kotlin
// TODO: Set duration for MediaMetadata - need to check Media3 API
```

**Fixed Code:**
```kotlin
// Set duration using Media3 MediaMetadata
import androidx.media3.common.MediaMetadata as Media3Metadata

val metadata = Media3Metadata.Builder()
    .setTitle(title)
    .setArtist(artist)
    .setAlbumTitle(album)
    .setArtworkUri(artworkUri)
    // Set duration in milliseconds
    .setExtras(Bundle().apply {
        putLong(Media3Metadata.EXTRA_DURATION_MS, durationMs)
    })
    .build()

mediaSession.setMetadata(metadata)
```

## Implementation Steps

### Step 1: Update Service Constructors
Add required dependencies to all service constructors:
- ArtworkLoader
- MetadataExtractionService
- MediaSessionManager (where needed)

### Step 2: Implement Artwork Loading
Replace all `artwork = null` with proper artwork loading calls.

### Step 3: Implement Metadata Extraction
Replace all hardcoded metadata with extracted values.

### Step 4: Update Media3 Integration
Properly integrate Media3 notification system.

### Step 5: Test All Changes
- Test audiobook playback with cover art
- Test music playback with album art
- Test notifications with artwork
- Test metadata extraction

## Dependencies to Add

### In build.gradle.kts (if not already present):
```kotlin
// Media3 for notifications
implementation("androidx.media3:media3-session:1.8.0")
implementation("androidx.media3:media3-ui:1.8.0")

// OkHttp for network operations
implementation("com.squareup.okhttp3:okhttp:4.12.0")

// Metadata extraction
implementation("androidx.media:media:1.7.0")
```

## Testing Checklist

- [ ] Audiobook cover art loads correctly
- [ ] Music album art loads correctly
- [ ] Metadata extraction works for all formats
- [ ] Notifications show artwork
- [ ] Duration displays correctly
- [ ] No memory leaks in artwork loading
- [ ] Cache works properly
- [ ] Network artwork loads correctly

## Next Phase

After completing these fixes, move to Phase 3: Playlist Managers (15 TODOs)