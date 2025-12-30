# Centralized Search Implementation

## Overview

All file formats, tags, and related metadata are now centrally searchable through unified registries and a universal search service.

## Components Created

### 1. FormatRegistry (`core/FormatRegistry.kt`)
Centralized registry for all file formats supported by the application.

**Features:**
- Registers formats from `SupportedBookFormat` enum
- Includes audio formats (MP3, M4A, FLAC, OGG, WAV, AAC, Opus, Audiobook)
- Includes video formats (MP4, MKV, AVI, WebM, MOV, M4V)
- Includes image formats (PNG, JPG, WebP, GIF, BMP, SVG)
- Indexed by extension and MIME type
- Organized by category (EBOOK, DOCUMENT, AUDIO, VIDEO, COMIC, IMAGE, ARCHIVE, TEXT, OTHER)

**Search Capabilities:**
- `searchFormats(query)` - Search by extension, display name, description, or MIME type
- `getFormatByExtension(extension)` - Get format info by file extension
- `getFormatByMimeType(mimeType)` - Get format info by MIME type
- `getFormatsByCategory(category)` - Get all formats in a category
- `getAllFormats()` - Get all registered formats
- `isSupported(extension)` - Check if extension is supported
- `isReadable(extension)` - Check if extension is readable

### 2. TagRegistry (`core/TagRegistry.kt`)
Centralized registry for all tags across the application.

**Features:**
- Unifies tags from multiple sources:
  - UnifiedTag system (user-defined, auto-generated)
  - WebFiction tags (AO3, FanFiction.net, Royal Road, etc.)
  - Music tags (ID3 tags, genres)
  - Plex tags (imported from Plex servers)
  - Calibre tags (imported from Calibre libraries)
  - Jellyfin tags (imported from Jellyfin servers)

**Search Capabilities:**
- `searchTags(query, category, source, limit)` - Search tags across all sources
- `getAllTags(category, source, limit)` - Get all tags with optional filters
- `getPopularTags(limit)` - Get most used tags
- `getRecentTags(limit)` - Get recently used tags
- `convertWebFictionTag()` - Convert web fiction tags to unified format
- `convertUnifiedTag()` - Convert unified tags to searchable format

### 3. UniversalSearchService (`core/UniversalSearchService.kt`)
Single entry point for all search functionality.

**Features:**
- Unified search across formats and tags
- Filter by category or source
- Combined results with sorting
- Convenience methods for common operations

**Methods:**
- `searchAll(query, includeFormats, includeTags, formatCategory, tagSource)` - Search everything
- `searchFormats(query, category)` - Search formats only
- `searchTags(query, category, source)` - Search tags only
- `getAllFormats()` - Get all formats
- `getFormatsByCategory(category)` - Get formats by category
- `getFormatByExtension(extension)` - Get format by extension
- `getFormatByMimeType(mimeType)` - Get format by MIME type
- `isFormatSupported(extension)` - Check format support
- `isFormatReadable(extension)` - Check if format is readable
- `getPopularTags(limit)` - Get popular tags
- `getRecentTags(limit)` - Get recent tags

### 4. UniversalSearchScreen (`ui/search/UniversalSearchScreen.kt`)
UI component for searching formats and tags.

**Features:**
- Search bar with real-time results
- Category browsing
- Format cards showing extension, MIME type, description, and reader service
- Tag cards showing name, description, usage count, and source
- Empty state handling

### 5. UniversalSearchViewModel (`ui/search/UniversalSearchViewModel.kt`)
ViewModel for the universal search screen.

**Features:**
- Debounced search (300ms)
- Category filtering
- State management
- Flow-based reactive updates

## Integration Points

### Services Updated
1. **OpdsServer** - Now uses `FormatRegistry` for MIME type detection
2. **UnifiedReaderService** - Injected with `FormatRegistry` for format information

### Services Available for Integration
- Any service can inject `FormatRegistry`, `TagRegistry`, or `UniversalSearchService`
- All registries are `@Singleton` and automatically provided by Hilt

## Usage Examples

### Search Formats
```kotlin
@Inject lateinit var universalSearchService: UniversalSearchService

// Search all formats
val formats = universalSearchService.searchFormats("epub")

// Get format by extension
val format = universalSearchService.getFormatByExtension("pdf")

// Get all ebook formats
val ebooks = universalSearchService.getFormatsByCategory(FormatRegistry.FormatCategory.EBOOK)
```

### Search Tags
```kotlin
// Search tags
val tagsFlow = universalSearchService.searchTags("science fiction")

// Get popular tags
val popularTags = universalSearchService.getPopularTags(limit = 20)
```

### Combined Search
```kotlin
// Search everything
val results = universalSearchService.searchAll(
    query = "epub",
    includeFormats = true,
    includeTags = true
)
```

## Benefits

1. **Centralized** - All format and tag information in one place
2. **Searchable** - Full-text search across all metadata
3. **Extensible** - Easy to add new formats or tag sources
4. **Type-safe** - Strong typing with Kotlin data classes
5. **Performant** - Indexed lookups by extension and MIME type
6. **Unified** - Single API for all search operations

## Future Enhancements

- Add format capabilities (read, write, edit, convert)
- Add tag hierarchies and relationships
- Add format conversion capabilities
- Add tag suggestions based on usage patterns
- Add format validation and verification
- Add tag synonyms and aliases
