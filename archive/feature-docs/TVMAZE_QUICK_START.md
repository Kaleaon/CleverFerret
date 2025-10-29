# TVMaze API - Quick Start Guide

## What is TVMaze?

TVMaze (https://www.tvmaze.com/api) is a comprehensive TV show database API that provides:
- ✅ **Free & No API Key Required** - Start using immediately
- ✅ **Complete Episode Data** - All episodes with air dates
- ✅ **Cast & Crew Info** - Detailed cast information
- ✅ **High-Quality Images** - Posters and episode images
- ✅ **External Links** - IMDb, TheTVDB integration

## Quick Examples

### 1. Search for a TV Show

```kotlin
@Inject lateinit var metadataApiService: MetadataApiService

suspend fun searchShow() {
    val results = metadataApiService.searchTVShows("Breaking Bad")
    results.forEach { show ->
        println("${show.title} (${show.year}) - ${show.rating}/10")
    }
}
```

### 2. Get Complete Show Details

```kotlin
@Inject lateinit var tvMazeService: TVMazeService

suspend fun getShowDetails() {
    val details = tvMazeService.getCompleteShowDetails(169) // Breaking Bad
    println("${details.show?.name}: ${details.totalEpisodes} episodes")
}
```

### 3. Get Specific Episode

```kotlin
suspend fun getEpisode() {
    val episode = tvMazeService.getEpisode(
        showId = 169,
        season = 5,
        episode = 14
    )
    println("${episode?.name} aired on ${episode?.airdate}")
}
```

### 4. Get Episodes by Season

```kotlin
suspend fun getSeasonEpisodes() {
    val episodes = tvMazeService.getEpisodesBySeason(169)
    episodes.forEach { (season, episodeList) ->
        println("Season $season: ${episodeList.size} episodes")
    }
}
```

### 5. Get Cast Information

```kotlin
suspend fun getCast() {
    val cast = tvMazeService.getShowCast(169)
    cast.forEach { member ->
        println("${member.person.name} as ${member.character.name}")
    }
}
```

## Files Added

| File | Purpose |
|------|---------|
| `TVMazeApi.kt` | Retrofit API interface |
| `TVMazeService.kt` | High-level service layer |
| `MetadataApiService.kt` | Updated with TV show search |
| `TVMazeUsageExample.kt` | Complete usage examples |

## Common TV Show IDs

| Show | TVMaze ID |
|------|-----------|
| Breaking Bad | 169 |
| The Office (US) | 526 |
| Game of Thrones | 82 |
| Friends | 431 |
| The Sopranos | 527 |
| The Wire | 179 |
| Stranger Things | 2993 |
| The Walking Dead | 73 |

## Key Features

### No API Key Required
Unlike TMDB and TheTVDB, TVMaze works without authentication:

```kotlin
// Just inject and use - no API key setup needed!
@Inject lateinit var tvMazeService: TVMazeService
```

**Note**: TVMaze has rate limiting of approximately 20 requests per 10 seconds per IP address. The service automatically handles this through queuing.

### Rich Episode Data
Every episode includes:
- Episode title and number
- Air date and time
- Runtime
- Rating
- Summary
- Image URL

### External ID Linking
TVMaze provides links to:
- IMDb IDs
- TheTVDB IDs
- TVRage IDs

```kotlin
val show = tvMazeService.getShow(169)
println("IMDb: ${show?.externals?.imdb}")
println("TheTVDB: ${show?.externals?.thetvdb}")
```

## Data Models

### TVMazeShow
```kotlin
data class TVMazeShow(
    val id: Int,
    val name: String,
    val genres: List<String>,
    val status: String?,        // "Running", "Ended"
    val rating: TVMazeRating?,
    val network: TVMazeNetwork?,
    val image: TVMazeImage?,
    val externals: TVMazeExternals?
)
```

### TVMazeEpisode
```kotlin
data class TVMazeEpisode(
    val id: Int,
    val name: String,
    val season: Int,
    val number: Int,
    val airdate: String?,
    val runtime: Int?,
    val image: TVMazeImage?
)
```

## Integration Points

### 1. MetadataApiService
TV show search integrated into unified metadata service:

```kotlin
val results = metadataApiService.searchTVShows("query")
```

### 2. TVMazeService
Direct access for advanced features:

```kotlin
val service = tvMazeService
val details = service.getCompleteShowDetails(showId)
val cast = service.getShowCast(showId)
val seasons = service.getShowSeasons(showId)
```

### 3. TVShowPlaylistManager
Can be enhanced with TVMaze data:

```kotlin
// Get episodes from TVMaze
val episodes = tvMazeService.getShowEpisodes(showId)

// Create playlist with proper episode ordering
tvShowPlaylistManager.createSeriesPlaylist(
    seriesName = show.name,
    episodeIds = matchedLocalEpisodes,
    description = "Complete series"
)
```

## Rate Limiting

TVMaze has rate limiting:
- 20 requests per 10 seconds
- Automatic queuing

## Best Practices

1. **Cache Results** - TVMaze data is stable, cache it
2. **Clean HTML** - Summaries contain HTML tags
3. **Batch Requests** - Use `getCompleteShowDetails()` for efficiency
4. **Handle Errors** - Network requests can fail

## Error Handling

```kotlin
val result = tvMazeService.searchShows("query")

if (result.error != null) {
    println("Error: ${result.error}")
} else if (result.shows.isEmpty()) {
    println("No results")
} else {
    // Process results
}
```

## Additional Resources

- **API Documentation**: https://www.tvmaze.com/api
- **Integration Guide**: See `TVMAZE_INTEGRATION_GUIDE.md`
- **Usage Examples**: See `TVMazeUsageExample.kt`

## Summary

TVMaze provides CleverFerret with:
- ✅ Free, unlimited TV show metadata
- ✅ No API key required
- ✅ Complete episode listings
- ✅ Cast information
- ✅ High-quality images
- ✅ Easy integration

Perfect for TV show features in CleverFerret!
