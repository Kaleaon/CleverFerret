# Fanart.tv Integration Guide

## Overview

The CleverFerret app now supports fetching high-quality fanart from [Fanart.tv](https://fanart.tv) for movies, TV shows, music artists, and albums. This integration provides superior artwork quality compared to standard API sources.

## Features

✅ **Movie Fanart**: High-quality posters, backdrops, logos, and clearart  
✅ **TV Show Fanart**: Show posters, backgrounds, season posters, and character art  
✅ **Music Artist Fanart**: Artist photos, backgrounds, HD logos, and banners  
✅ **Album Fanart**: Album covers and CD art  
✅ **Automatic Caching**: Downloaded images are cached locally for offline access  
✅ **Batch Enhancement**: Enhance artwork for your entire library  

## Setup

### 1. Get a Fanart.tv API Key

1. Visit [Fanart.tv](https://fanart.tv/get-an-api-key/)
2. Create an account or sign in
3. Request a personal API key (free)
4. Copy your API key

### 2. Configure in App

1. Open **Settings** → **API Settings**
2. Scroll to **Artwork Providers**
3. Enable **Fanart.tv**
4. Paste your API key
5. Click **Save Artwork Settings**

## Architecture

### Core Components

```
┌─────────────────────────────────────────────────┐
│         Fanart.tv Integration                    │
└─────────────────────────────────────────────────┘
                        │
        ┌───────────────┼───────────────┐
        │               │               │
        ▼               ▼               ▼
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│ FanartTvApi  │ │FanartTvService│ │ArtworkEnhance│
│  (Retrofit)  │ │  (Business)  │ │ment Service  │
└──────────────┘ └──────────────┘ └──────────────┘
```

### File Structure

```
services/integration/api/
├── FanartTvApi.kt              # Retrofit API interface & models
├── ApiManager.kt               # API factory (updated)

services/integration/
├── FanartTvService.kt          # Core Fanart.tv service
├── MetadataWithFanartService.kt # Integration helper

services/metadata/
└── ArtworkEnhancementService.kt # Artwork enhancement coordinator
```

## API Reference

### FanartTvApi

Retrofit interface for Fanart.tv API v3.

```kotlin
interface FanartTvApi {
    // Get movie fanart by TMDb ID
    suspend fun getMovieFanart(movieId: String, apiKey: String): FanartTvMovieResponse
    
    // Get TV show fanart by TVDB ID
    suspend fun getTvFanart(tvId: String, apiKey: String): FanartTvTvResponse
    
    // Get artist fanart by MusicBrainz ID
    suspend fun getArtistFanart(artistId: String, apiKey: String): FanartTvArtistResponse
    
    // Get album fanart by MusicBrainz release-group ID
    suspend fun getAlbumFanart(albumId: String, apiKey: String): FanartTvAlbumResponse
}
```

### FanartTvService

High-level service for fetching fanart.

```kotlin
@Singleton
class FanartTvService @Inject constructor(...)
```

**Key Methods:**

- `suspend fun isEnabled(): Boolean` - Check if API is configured
- `suspend fun fetchMovieFanart(tmdbId: String): Pair<String?, String?>?` - Get movie poster & backdrop URLs
- `suspend fun fetchTvFanart(tvdbId: String): Pair<String?, String?>?` - Get TV poster & backdrop URLs
- `suspend fun fetchArtistFanart(mbid: String): Pair<String?, String?>?` - Get artist thumb & background URLs
- `suspend fun fetchAlbumFanart(albumMbid: String): String?` - Get album cover URL
- `suspend fun downloadAndCacheImage(imageUrl: String, filename: String): String?` - Download & cache image
- `suspend fun clearCache()` - Clear fanart cache
- `suspend fun getCacheSize(): Long` - Get cache size in bytes

### ArtworkEnhancementService

Coordinates artwork enhancement with database updates.

```kotlin
@Singleton
class ArtworkEnhancementService @Inject constructor(...)
```

**Key Methods:**

- `suspend fun enhanceMovieArtwork(itemId: Long, tmdbId: String, downloadAndCache: Boolean = true): Boolean`
- `suspend fun enhanceTvArtwork(itemId: Long, tvdbId: String, downloadAndCache: Boolean = true): Boolean`
- `suspend fun enhanceArtistArtwork(itemId: Long, musicBrainzId: String, downloadAndCache: Boolean = true): Boolean`
- `suspend fun enhanceAlbumArtwork(itemId: Long, albumMbid: String, downloadAndCache: Boolean = true): Boolean`
- `suspend fun batchEnhanceArtwork(items: List<Triple<Long, String, ArtworkType>>): Int`

## Usage Examples

### Example 1: Enhance Movie Artwork

```kotlin
@Inject
lateinit var artworkEnhancementService: ArtworkEnhancementService

// Enhance a movie with TMDb ID
viewModelScope.launch {
    val success = artworkEnhancementService.enhanceMovieArtwork(
        itemId = 123L,
        tmdbId = "603", // The Matrix
        downloadAndCache = true
    )
    
    if (success) {
        Log.d(TAG, "Enhanced movie artwork")
    }
}
```

### Example 2: Fetch Fanart URLs Only

```kotlin
@Inject
lateinit var fanartTvService: FanartTvService

viewModelScope.launch {
    val fanart = fanartTvService.fetchMovieFanart("603")
    if (fanart != null) {
        val (posterUrl, backdropUrl) = fanart
        Log.d(TAG, "Poster: $posterUrl")
        Log.d(TAG, "Backdrop: $backdropUrl")
    }
}
```

### Example 3: Batch Enhance Library

```kotlin
@Inject
lateinit var artworkEnhancementService: ArtworkEnhancementService

viewModelScope.launch {
    // Prepare list of items to enhance
    val items = listOf(
        Triple(123L, "603", ArtworkType.MOVIE),      // The Matrix
        Triple(124L, "550", ArtworkType.MOVIE),      // Fight Club
        Triple(125L, "76479", ArtworkType.TV_SHOW)   // The Boys
    )
    
    val count = artworkEnhancementService.batchEnhanceArtwork(items)
    Log.d(TAG, "Enhanced $count of ${items.size} items")
}
```

### Example 4: Save Movie with Automatic Fanart

```kotlin
@Inject
lateinit var metadataWithFanartService: MetadataWithFanartService

viewModelScope.launch {
    val metadata = MetadataCommon(
        itemId = 123,
        title = "The Matrix",
        year = 1999,
        summary = "A computer hacker learns from mysterious rebels..."
    )
    
    val movieMetadata = MetadataMovie(
        itemId = 123,
        tmdbId = "603",
        imdbId = "tt0133093"
    )
    
    val success = metadataWithFanartService.saveMovieWithFanart(
        metadata,
        movieMetadata
    )
    
    if (success) {
        Log.d(TAG, "Saved movie with enhanced fanart")
    }
}
```

### Example 5: Check Fanart.tv Status

```kotlin
@Inject
lateinit var fanartTvService: FanartTvService

viewModelScope.launch {
    if (fanartTvService.isEnabled()) {
        Log.d(TAG, "Fanart.tv is enabled and ready")
        
        val cacheSize = fanartTvService.getCacheSize()
        val sizeMB = cacheSize / (1024.0 * 1024.0)
        Log.d(TAG, "Cache size: %.2f MB".format(sizeMB))
    } else {
        Log.d(TAG, "Fanart.tv is not configured")
    }
}
```

### Example 6: Music Artist Fanart

```kotlin
@Inject
lateinit var artworkEnhancementService: ArtworkEnhancementService

viewModelScope.launch {
    // Enhance artist with MusicBrainz ID
    val success = artworkEnhancementService.enhanceArtistArtwork(
        itemId = 456L,
        musicBrainzId = "65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab", // Metallica
        downloadAndCache = true
    )
    
    if (success) {
        Log.d(TAG, "Enhanced artist artwork")
    }
}
```

## Data Models

### FanartTvMovieResponse

```kotlin
data class FanartTvMovieResponse(
    val name: String,
    val tmdbId: String,
    val imdbId: String?,
    val moviePosters: List<FanartImage>?,
    val movieBackgrounds: List<FanartImage>?,
    val hdMovieLogos: List<FanartImage>?,
    val movieDiscs: List<FanartImage>?,
    // ... more fields
)
```

### FanartTvTvResponse

```kotlin
data class FanartTvTvResponse(
    val name: String,
    val thetvdbId: String,
    val hdTvLogos: List<FanartImage>?,
    val showBackgrounds: List<FanartImage>?,
    val tvPosters: List<FanartImage>?,
    val seasonPosters: List<FanartImage>?,
    // ... more fields
)
```

### FanartTvArtistResponse

```kotlin
data class FanartTvArtistResponse(
    val name: String,
    val mbidId: String,
    val artistBackgrounds: List<FanartImage>?,
    val artistThumbs: List<FanartImage>?,
    val hdMusicLogos: List<FanartImage>?,
    val albums: Map<String, FanartTvAlbumArt>?
)
```

### FanartImage

```kotlin
data class FanartImage(
    val id: String,
    val url: String,        // Direct URL to image
    val lang: String,       // Language code (e.g., "en")
    val likes: String       // Number of likes (popularity)
)
```

## Best Practices

### 1. Check if Enabled First

Always check if Fanart.tv is enabled before making requests:

```kotlin
if (fanartTvService.isEnabled()) {
    // Fetch fanart
}
```

### 2. Handle Null Results

Not all content has fanart available:

```kotlin
val fanart = fanartTvService.fetchMovieFanart(tmdbId)
if (fanart != null) {
    val (poster, backdrop) = fanart
    // Use artwork
} else {
    // Fall back to default source
}
```

### 3. Use Caching

Enable caching for better performance and offline access:

```kotlin
artworkEnhancementService.enhanceMovieArtwork(
    itemId = id,
    tmdbId = tmdbId,
    downloadAndCache = true  // Recommended
)
```

### 4. Batch Operations

For large libraries, use batch operations:

```kotlin
val items = getMoviesNeedingArtwork()
val count = artworkEnhancementService.batchEnhanceArtwork(items)
```

### 5. Error Handling

Always handle potential errors:

```kotlin
try {
    val fanart = fanartTvService.fetchMovieFanart(tmdbId)
    // Process fanart
} catch (e: Exception) {
    Log.e(TAG, "Error fetching fanart", e)
    // Fall back to alternative source
}
```

## Image Quality

Fanart.tv provides various image types with different qualities:

### Movies
- **HD Movie Posters**: High-resolution posters
- **HD Movie Backgrounds**: 1920x1080 backdrops
- **HD Movie Logos**: Transparent PNG logos
- **HD Clear Art**: Transparent character art

### TV Shows
- **HD TV Logos**: High-resolution transparent logos
- **Show Backgrounds**: 1920x1080 backgrounds
- **Season Posters**: Individual season artwork
- **Character Art**: Transparent character renders

### Music
- **HD Music Logos**: High-resolution artist logos
- **Artist Backgrounds**: 1920x1080 artist photos
- **Album Covers**: High-resolution album art (up to 1000x1000)

## API Limits

Fanart.tv free API has the following limits:
- **Rate Limit**: 2 requests per second
- **Daily Limit**: No official daily limit for personal use
- **Response Time**: Typically < 500ms

## Troubleshooting

### Issue: "Fanart.tv is not enabled"

**Solution**: Check that:
1. API key is configured in Settings → API Settings
2. Fanart.tv toggle is enabled
3. API key is valid

### Issue: No fanart returned

**Possible causes**:
1. Content not in Fanart.tv database
2. Invalid external ID (TMDb/TVDB/MusicBrainz)
3. API key invalid or expired

**Solution**: Check logs for error messages and verify IDs.

### Issue: Images not loading

**Possible causes**:
1. Network connectivity issues
2. Cache full or corrupted
3. Invalid image URLs

**Solution**: Clear cache and retry:
```kotlin
fanartTvService.clearCache()
```

## Future Enhancements

Potential improvements for future versions:

- [ ] UI for browsing available fanart types
- [ ] User selection of preferred artwork
- [ ] Automatic artwork updates
- [ ] Support for additional artwork types (banners, thumbnails, etc.)
- [ ] Integration with other artwork providers (Last.fm, etc.)
- [ ] Bulk artwork refresh tool
- [ ] Artwork quality settings (HD only, standard, etc.)

## API Documentation

Full Fanart.tv API documentation:  
https://fanarttv.docs.apiary.io/

## Support

For issues or questions:
1. Check logs for error messages
2. Verify API key is valid
3. Ensure external IDs are correct
4. Check network connectivity

## License

Fanart.tv content is subject to their terms of service:  
https://fanart.tv/terms-and-conditions/
