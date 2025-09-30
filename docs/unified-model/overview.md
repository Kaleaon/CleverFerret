# Unified Media Library Model - Architecture Overview

## Table of Contents
- [Introduction](#introduction)
- [Core Design Principles](#core-design-principles)
- [Data Model Architecture](#data-model-architecture)
- [Artwork Pipeline](#artwork-pipeline)
- [Future Sources](#future-sources)
- [Integration Points](#integration-points)
- [Implementation Roadmap](#implementation-roadmap)

## Introduction

The Unified Media Library Model provides a type-safe, extensible foundation for managing diverse media types (books, movies, music, audiobooks, podcasts, and TTS content) within a single, cohesive system. This document outlines the architecture, design decisions, and implementation strategy for the unified model and shared metadata/artwork pipeline.

### Goals

1. **Type Safety**: Leverage Kotlin sealed classes to provide compile-time type safety while maintaining flexibility
2. **Extensibility**: Design for easy addition of new media types without breaking existing functionality
3. **Centralized Metadata**: Share common metadata (tags, genres, collections) across all media types
4. **Unified Artwork Pipeline**: Single artwork loading system serving all UI contexts (notifications, widgets, Now Playing)
5. **Multi-Source Support**: Prepare for both local and remote media sources (Plex, Jellyfin, etc.)

## Core Design Principles

### 1. Sealed Class Hierarchy

```kotlin
sealed class UnifiedMediaItem {
    abstract val itemId: Long
    abstract val libraryId: Long
    abstract val commonMetadata: MetadataCommon?
    abstract val mediaType: MediaType
    
    data class Book(...) : UnifiedMediaItem()
    data class Movie(...) : UnifiedMediaItem()
    data class MusicTrack(...) : UnifiedMediaItem()
    data class Audiobook(...) : UnifiedMediaItem()
    data class Podcast(...) : UnifiedMediaItem()
    data class TvShow(...) : UnifiedMediaItem()
    data class Generic(...) : UnifiedMediaItem()
}
```

**Benefits:**
- **Exhaustive when statements**: Compiler ensures all types are handled
- **Type-specific properties**: Each subclass can have unique metadata
- **Common interface**: Shared properties accessible without casting
- **Extension functions**: Easy to add functionality without modifying core classes

### 2. Layered Metadata

```
┌─────────────────────────────────────────────────────────┐
│                   UnifiedMediaItem                       │
│  - Common properties (id, path, file info)              │
└───────────────────┬─────────────────────────────────────┘
                    │
            ┌───────┴───────┐
            │               │
    ┌───────▼────────┐  ┌──▼──────────────┐
    │ MetadataCommon │  │ Type-Specific   │
    │ - title        │  │ Metadata        │
    │ - year         │  │ - Book: isbn    │
    │ - rating       │  │ - Movie: imdbId │
    │ - summary      │  │ - Music: album  │
    │ - language     │  │ - etc.          │
    └────────────────┘  └─────────────────┘
```

**Benefits:**
- Reduces duplication
- Allows partial metadata (common only vs. full details)
- Easy to query and filter across types
- Lazy loading of type-specific metadata

### 3. Shared Tag/Genre/Collection System

Rather than per-type tags/genres/collections, we use unified entities that work across all media:

```kotlin
@Entity(tableName = "unified_tags")
data class UnifiedTag(
    @PrimaryKey(autoGenerate = true) val tagId: Long = 0,
    val name: String,
    val type: TagType, // USER_DEFINED, AUTO_GENERATED, IMPORTED
    val description: String? = null
)

@Entity(tableName = "unified_collections")
data class UnifiedCollection(
    @PrimaryKey(autoGenerate = true) val collectionId: Long = 0,
    val name: String,
    val type: CollectionType, // PLAYLIST, SERIES, USER_DEFINED
    val description: String? = null,
    val coverArtPath: String? = null
)
```

**Junction Tables:**
```kotlin
// Media Item → Tags (many-to-many)
@Entity(
    tableName = "item_tags",
    foreignKeys = [/* MediaItem, UnifiedTag */]
)
data class ItemTag(
    val itemId: Long,
    val tagId: Long,
    val addedAt: Long = System.currentTimeMillis()
)

// Media Item → Collections (many-to-many with order)
@Entity(
    tableName = "item_collections",
    foreignKeys = [/* MediaItem, UnifiedCollection */]
)
data class ItemCollection(
    val itemId: Long,
    val collectionId: Long,
    val sortOrder: Int = 0,
    val addedAt: Long = System.currentTimeMillis()
)
```

**Benefits:**
- Cross-media playlists (books + audiobooks, or music + podcasts)
- Unified search and filtering
- Consistent UI/UX across media types
- Easier sync with external services

## Data Model Architecture

### Current State

**Existing Entities:**
- `MediaItem` - Core entity for all media files
- `MetadataCommon` - Shared metadata fields
- `MetadataBook`, `MetadataMovie`, `MetadataMusicTrack` - Type-specific metadata
- `Genre` - Centralized genres with junction table
- `PlexTag`, `PlexCollection` - Plex-specific metadata

**Existing Model:**
- `UnifiedMediaModel.kt` - Sealed class with type-safe media items
- `MediaType` enum - All supported media types
- Extension functions for conversion

### Proposed Enhancements

#### 1. Add Unified Tags

**Purpose:** Generalize tagging beyond Plex to support:
- User-defined tags
- Auto-generated tags (from metadata extraction)
- Imported tags (from Calibre, Plex, etc.)

**Implementation:**
```kotlin
// TODO: Add to AppDatabase entities
@Entity(tableName = "unified_tags")
data class UnifiedTag(
    @PrimaryKey(autoGenerate = true)
    val tagId: Long = 0,
    val name: String,
    val type: TagType,
    val color: String? = null, // Hex color for UI
    val description: String? = null,
    val createdAt: Long = System.currentTimeMillis(),
    val lastUsed: Long = System.currentTimeMillis()
)

enum class TagType {
    USER_DEFINED,    // Manually created by user
    AUTO_GENERATED,  // Generated from metadata
    IMPORTED_PLEX,   // Imported from Plex
    IMPORTED_CALIBRE,// Imported from Calibre
    IMPORTED_JELLYFIN// Imported from Jellyfin (future)
}
```

#### 2. Add Unified Collections

**Purpose:** Create cross-media collections:
- Playlists (music, audiobooks, podcasts)
- Series/Seasons (books, TV shows)
- Reading lists (books, articles)
- Smart collections (dynamic queries)

**Implementation:**
```kotlin
// TODO: Add to AppDatabase entities
@Entity(tableName = "unified_collections")
data class UnifiedCollection(
    @PrimaryKey(autoGenerate = true)
    val collectionId: Long = 0,
    val name: String,
    val type: CollectionType,
    val description: String? = null,
    val coverArtPath: String? = null,
    val sortBy: SortField = SortField.CUSTOM,
    val sortOrder: SortOrder = SortOrder.ASCENDING,
    val isSmartCollection: Boolean = false,
    val smartQuery: String? = null, // JSON query for smart collections
    val createdAt: Long = System.currentTimeMillis(),
    val lastModified: Long = System.currentTimeMillis()
)

enum class CollectionType {
    PLAYLIST,        // Ordered playback list
    SERIES,          // Book series, TV seasons
    READING_LIST,    // Books/articles to read
    WATCH_LIST,      // Movies/shows to watch
    USER_DEFINED,    // Custom collections
    SMART            // Dynamic based on criteria
}

enum class SortField {
    CUSTOM,          // Manual ordering (sortOrder in junction)
    TITLE,
    DATE_ADDED,
    RELEASE_DATE,
    RATING,
    PLAY_COUNT
}

enum class SortOrder {
    ASCENDING,
    DESCENDING
}
```

#### 3. Enhanced UnifiedMediaModel

**Additions to consider:**
```kotlin
sealed class UnifiedMediaItem {
    // ... existing properties ...
    
    // TODO: Add computed properties for tags/collections
    // These would be loaded via repository/DAO queries
    // val tags: List<UnifiedTag>
    // val collections: List<UnifiedCollection>
    // val genres: List<Genre>
    
    // TODO: Add artwork accessors
    // val primaryArtwork: String?
    // val thumbnailArtwork: String?
    // val backgroundArtwork: String?
}
```

## Artwork Pipeline

### Current State

**Existing Implementation:**
- `ArtworkLoader.kt` - Memory-cached artwork loading
- Supports: Local files, Plex URLs, external URLs
- Features: LRU cache (20% memory), bitmap scaling
- Integration: MediaNotificationService

### Architecture

```
┌─────────────────────────────────────────────────────────┐
│                  Artwork Consumers                       │
│  - Notifications                                         │
│  - Media widgets (homescreen, lock screen)              │
│  - Now Playing UI                                        │
│  - Library grids                                         │
│  - Details screens                                       │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                  ArtworkLoader                           │
│  - Unified loading interface                            │
│  - Multi-level caching (memory → disk → source)         │
│  - Automatic scaling for target context                 │
│  - Background/batch loading                             │
└────────────────────┬────────────────────────────────────┘
                     │
            ┌────────┴────────┐
            │                 │
┌───────────▼───────┐  ┌─────▼────────────┐
│  Memory Cache     │  │  Disk Cache      │
│  (LRU, 20% RAM)   │  │  (TODO)          │
└───────────────────┘  └──────────────────┘
            │
    ┌───────┴────────┬──────────────┬───────────────┐
    │                │              │               │
┌───▼────┐  ┌───────▼──────┐  ┌───▼───────┐  ┌───▼──────┐
│ Local  │  │ Plex Server  │  │ Jellyfin  │  │ Metadata │
│ Files  │  │              │  │ (TODO)    │  │ APIs     │
│ (TODO) │  │              │  │           │  │ (TODO)   │
└────────┘  └──────────────┘  └───────────┘  └──────────┘
```

### Proposed Enhancements

#### 1. Disk Cache

**Purpose:** Reduce network requests and speed up repeated loads

**Implementation:**
```kotlin
// TODO: Add to ArtworkLoader
class DiskArtworkCache(private val cacheDir: File) {
    fun get(key: String): Bitmap?
    fun put(key: String, bitmap: Bitmap)
    fun clear()
    fun trimToSize(maxBytes: Long)
}

// TODO: Add configuration
data class ArtworkCacheConfig(
    val memoryPercent: Float = 0.2f,     // 20% of available memory
    val diskCacheSizeMB: Int = 250,       // 250 MB disk cache
    val enableDiskCache: Boolean = true,
    val preloadThumbnails: Boolean = true // Preload in background
)
```

#### 2. Media File Extraction

**Purpose:** Extract embedded artwork from media files (EPUB covers, MP3 ID3 tags, etc.)

**Implementation:**
```kotlin
// TODO: Add to ArtworkLoader
interface ArtworkExtractor {
    fun canExtract(mediaType: MediaType, extension: String): Boolean
    suspend fun extract(filePath: String): Bitmap?
}

class EpubArtworkExtractor : ArtworkExtractor {
    // TODO: Implement EPUB cover extraction
    override suspend fun extract(filePath: String): Bitmap? {
        // 1. Open EPUB as ZIP
        // 2. Find cover image (check manifest, common paths)
        // 3. Extract and decode bitmap
        return null
    }
}

class Mp3ArtworkExtractor : ArtworkExtractor {
    // TODO: Implement MP3 ID3 tag artwork extraction
    override suspend fun extract(filePath: String): Bitmap? {
        // 1. Parse ID3v2 tags
        // 2. Extract APIC frame (Attached Picture)
        // 3. Decode bitmap
        return null
    }
}

class Mp4ArtworkExtractor : ArtworkExtractor {
    // TODO: Implement MP4 metadata artwork extraction
    override suspend fun extract(filePath: String): Bitmap? {
        // 1. Parse MP4 atoms
        // 2. Find 'covr' atom
        // 3. Decode bitmap
        return null
    }
}
```

#### 3. Context-Aware Scaling

**Purpose:** Optimize artwork size for different UI contexts

**Implementation:**
```kotlin
// TODO: Add scaling presets
enum class ArtworkContext(val maxWidth: Int, val maxHeight: Int) {
    NOTIFICATION(512, 512),       // Android notification
    WIDGET_SMALL(256, 256),       // Homescreen widget
    WIDGET_LARGE(512, 512),       // Large widget
    NOW_PLAYING(1024, 1024),      // Now playing screen
    GRID_THUMBNAIL(300, 300),     // Library grid view
    DETAILS_HEADER(1920, 1080),   // Details screen
    BACKGROUND(1920, 1080)        // Background artwork
}

// TODO: Enhance loadArtwork method signature
suspend fun loadArtwork(
    mediaItem: MediaItem,
    context: ArtworkContext = ArtworkContext.GRID_THUMBNAIL
): Bitmap?
```

#### 4. Background Loading

**Purpose:** Preload artwork for better UX

**Implementation:**
```kotlin
// TODO: Add background loader
class ArtworkPreloader @Inject constructor(
    private val artworkLoader: ArtworkLoader,
    private val database: AppDatabase
) {
    suspend fun preloadForLibrary(libraryId: Long, limit: Int = 50) {
        // Load artwork for most recent/popular items
    }
    
    suspend fun preloadForQueue(queueItems: List<QueueItem>) {
        // Preload artwork for upcoming queue items
    }
    
    suspend fun preloadForCollection(collectionId: Long) {
        // Preload artwork for collection items
    }
}
```

## Future Sources

### Local Media

**Current Support:**
- ✅ File path-based media items
- ✅ Local thumbnails
- 🔄 Embedded artwork extraction (TODO)

**Future Enhancements:**
- File system watching for auto-imports
- Metadata extraction pipelines
- Duplicate detection

### Plex Media Server

**Current Support:**
- ✅ PlexMediaItem entity
- ✅ Plex artwork URLs
- ✅ Plex tags and collections
- ✅ Playback progress sync

**Integration with Unified Model:**
```kotlin
// TODO: Add conversion function
fun PlexMediaItem.toUnifiedMediaItem(): UnifiedMediaItem {
    return when (plexType) {
        "movie" -> UnifiedMediaItem.Movie(...)
        "episode" -> UnifiedMediaItem.TvShow(...)
        "track" -> UnifiedMediaItem.MusicTrack(...)
        else -> UnifiedMediaItem.Generic(...)
    }
}
```

### Jellyfin (Planned)

**Architecture:**
```kotlin
// TODO: Add Jellyfin entities
@Entity(tableName = "jellyfin_servers")
data class JellyfinServer(...)

@Entity(tableName = "jellyfin_media_items")
data class JellyfinMediaItem(...)

// TODO: Add conversion to unified model
fun JellyfinMediaItem.toUnifiedMediaItem(): UnifiedMediaItem
```

### Calibre Libraries

**Current Support:**
- ✅ CalibreImportService
- 🔄 Direct database import (in progress)

**Integration:**
- Import books as MediaItem entries
- Convert Calibre tags to UnifiedTags
- Map Calibre series to UnifiedCollections

### Metadata APIs (Future)

**Potential Sources:**
- **Books:** Open Library API, Google Books API, ISBN databases
- **Movies:** TMDB, OMDB, IMDB
- **Music:** MusicBrainz, Last.fm, Spotify metadata
- **Podcasts:** Apple Podcasts, Podchaser

**Architecture:**
```kotlin
// TODO: Add metadata provider interface
interface MetadataProvider {
    suspend fun search(query: String): List<SearchResult>
    suspend fun getDetails(id: String): MetadataDetails?
    suspend fun getArtwork(id: String): ArtworkUrls?
}
```

## Integration Points

### 1. UI Components

**Library Grid:**
```kotlin
@Composable
fun UnifiedMediaGrid(
    items: List<UnifiedMediaItem>,
    onItemClick: (UnifiedMediaItem) -> Unit
) {
    LazyVerticalGrid(...) {
        items(items) { item ->
            UnifiedMediaCard(
                item = item,
                artwork = artworkLoader.loadArtwork(
                    item, 
                    ArtworkContext.GRID_THUMBNAIL
                ),
                onClick = { onItemClick(item) }
            )
        }
    }
}
```

**Details Screen:**
```kotlin
@Composable
fun UnifiedMediaDetails(item: UnifiedMediaItem) {
    when (item) {
        is UnifiedMediaItem.Book -> BookDetailsContent(item)
        is UnifiedMediaItem.Movie -> MovieDetailsContent(item)
        is UnifiedMediaItem.MusicTrack -> MusicDetailsContent(item)
        // ... exhaustive when
    }
}
```

### 2. Playback System

```kotlin
// TODO: Enhance UnifiedPlaybackQueueManager
class UnifiedPlaybackQueueManager {
    suspend fun enqueue(item: UnifiedMediaItem) {
        when (item) {
            is UnifiedMediaItem.Book -> enqueueBook(item)
            is UnifiedMediaItem.MusicTrack -> enqueueMusic(item)
            is UnifiedMediaItem.Audiobook -> enqueueAudiobook(item)
            // ... handle each type
        }
    }
}
```

### 3. Search and Filtering

```kotlin
// TODO: Add unified search
suspend fun searchAcrossAllMedia(
    query: String,
    types: Set<MediaType> = MediaType.values().toSet(),
    tags: List<UnifiedTag> = emptyList(),
    collections: List<UnifiedCollection> = emptyList()
): List<UnifiedMediaItem>
```

### 4. Widgets and Notifications

```kotlin
// Already integrated in MediaPlaybackWidgetService
// Artwork loaded via ArtworkLoader for consistent appearance
```

## Implementation Roadmap

### Phase 1: Enhanced Data Model (Current PR)

- [x] Document unified model architecture
- [ ] Add UnifiedTag entity and DAO
- [ ] Add UnifiedCollection entity and DAO
- [ ] Add junction tables (ItemTag, ItemCollection)
- [ ] Add comprehensive TODOs marking extension points
- [ ] Update UnifiedMediaModel with tag/collection properties
- [ ] Add basic unit tests for new entities

### Phase 2: Artwork Pipeline Enhancements

- [ ] Implement disk cache for artwork
- [ ] Add artwork extractors (EPUB, MP3, MP4)
- [ ] Implement context-aware scaling
- [ ] Add background artwork preloader
- [ ] Add artwork provider interface for future sources
- [ ] Comprehensive tests for artwork pipeline

### Phase 3: Repository Integration

- [ ] Create UnifiedMediaRepository
- [ ] Implement cross-type search and filtering
- [ ] Add tag management APIs
- [ ] Add collection management APIs
- [ ] Implement smart collections (dynamic queries)

### Phase 4: UI Integration

- [ ] Create UnifiedMediaGrid component
- [ ] Create UnifiedMediaDetails component
- [ ] Add tag editor UI
- [ ] Add collection editor UI
- [ ] Add multi-select for bulk operations

### Phase 5: External Source Integration

- [ ] Complete Plex integration
- [ ] Add Jellyfin support
- [ ] Implement metadata provider framework
- [ ] Add metadata matching/deduplication
- [ ] Implement sync mechanisms

### Phase 6: Advanced Features

- [ ] Smart collections with query builder
- [ ] Cross-media recommendations
- [ ] Advanced search with boolean operators
- [ ] Batch metadata updates
- [ ] Import/export functionality

## Feature Flags

For gradual rollout and testing:

```kotlin
// TODO: Add to settings/preferences
object FeatureFlags {
    const val ENABLE_UNIFIED_TAGS = true
    const val ENABLE_UNIFIED_COLLECTIONS = true
    const val ENABLE_ARTWORK_DISK_CACHE = false // TODO: Test first
    const val ENABLE_ARTWORK_EXTRACTION = false // TODO: Implement
    const val ENABLE_SMART_COLLECTIONS = false  // TODO: Future
    const val ENABLE_JELLYFIN_SYNC = false      // TODO: Future
}
```

## Performance Considerations

1. **Lazy Loading:** Only load full metadata when needed
2. **Pagination:** Use paging for large libraries
3. **Caching:** Multi-level caching (memory → disk → source)
4. **Background Processing:** Use WorkManager for import/sync
5. **Indexing:** Proper database indices on frequently queried fields

## Security Considerations

1. **File Access:** Validate file paths to prevent directory traversal
2. **Network Requests:** Use HTTPS for all external APIs
3. **API Keys:** Securely store API keys using EncryptedSharedPreferences
4. **User Data:** Respect privacy, allow data export/deletion

## Conclusion

The Unified Media Library Model provides a solid foundation for managing diverse media types in a type-safe, extensible manner. The shared metadata and artwork pipeline ensures consistency across the application while supporting multiple media sources. This architecture is designed to grow with the application's needs while maintaining clean separation of concerns.

## References

- [Existing UnifiedMediaModel.kt](../../CleverFerret/src/main/java/com/universalmedialibrary/data/models/UnifiedMediaModel.kt)
- [Existing ArtworkLoader.kt](../../CleverFerret/src/main/java/com/universalmedialibrary/services/artwork/ArtworkLoader.kt)
- [Playback Queue & Widget Integration](../PLAYBACK_QUEUE_WIDGET_INTEGRATION.md)
- [Plex Data Models](../../PLEX_DATA_MODELS.md)
