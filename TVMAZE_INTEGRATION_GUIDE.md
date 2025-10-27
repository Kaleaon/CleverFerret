# TVMaze API Integration Guide

## Overview

CleverFerret now includes comprehensive integration with the **TVMaze API** (https://www.tvmaze.com/api) for TV show metadata. TVMaze provides extensive TV show data including episodes, cast, crew, images, and more - all without requiring an API key! (Rate limit: ~20 requests per 10 seconds per IP)

## Features

### What TVMaze Provides

- ✅ **Complete TV Show Information** - Title, summary, genres, ratings, status
- ✅ **Full Episode Listings** - All episodes with air dates, titles, and summaries
- ✅ **Cast & Crew Data** - Comprehensive cast information with character names
- ✅ **High-Quality Images** - Posters and episode images
- ✅ **Schedule Information** - Air times and network details
- ✅ **External IDs** - Links to IMDb, TheTVDB, and TVRage
- ✅ **Season Information** - Complete season breakdowns
- ✅ **No API Key Required** - Free to use with no authentication

### Integration Components

1. **TVMazeApi.kt** - Retrofit API interface with all endpoints
2. **TVMazeService.kt** - High-level service for easy access
3. **MetadataApiService.kt** - Integrated TV show search
4. **MetadataSource.TVMAZE** - Added to metadata source enum

## Usage Examples

### 1. Search for TV Shows

```kotlin
// Inject the metadata service
@Inject
lateinit var metadataService: MetadataApiService

// Search for a TV show
suspend fun searchShows() {
    val results = metadataService.searchTVShows("Breaking Bad")
    
    results.forEach { show ->
        println("${show.title} (${show.year})")
        println("Rating: ${show.rating}/10")
        println("Genres: ${show.genres.joinToString(", ")}")
        println("Network: ${show.additionalData["network"]}")
        println("Status: ${show.additionalData["status"]}")
        println()
    }
}
```

### 2. Get Complete Show Details

```kotlin
// Get comprehensive show details including episodes
suspend fun getShowDetails() {
    // TVMaze ID for Breaking Bad is 169
    val details = metadataService.getTVShowDetails(169)
    
    details?.let { show ->
        println("Show: ${show.title}")
        println("Total Episodes: ${show.additionalData["totalEpisodes"]}")
        println("Total Seasons: ${show.additionalData["totalSeasons"]}")
        println("IMDb ID: ${show.imdbId}")
        
        // Access episodes
        val episodes = show.additionalData["episodes"] as? List<TVMazeEpisode>
        episodes?.forEach { episode ->
            println("S${episode.season}E${episode.number}: ${episode.name}")
        }
        
        // Access cast
        val cast = show.additionalData["cast"] as? List<TVMazeCastMember>
        cast?.take(5)?.forEach { member ->
            println("${member.person.name} as ${member.character.name}")
        }
    }
}
```

### 3. Direct TVMaze Service Usage

```kotlin
// Inject TVMazeService directly for more control
@Inject
lateinit var tvMazeService: TVMazeService

// Search shows
suspend fun advancedSearch() {
    val result = tvMazeService.searchShows("The Office")
    
    result.shows.forEach { show ->
        println("${show.name} - ${show.network?.name ?: show.webChannel?.name}")
        println("Status: ${show.status}")
        println("Rating: ${show.rating?.average}/10")
    }
}

// Get show with episodes
suspend fun getShowWithEpisodes() {
    val details = tvMazeService.getCompleteShowDetails(526) // The Office
    
    println("Show: ${details.show?.name}")
    println("Episodes: ${details.totalEpisodes}")
    println("Seasons: ${details.totalSeasons}")
    
    // Get episodes by season
    val episodesBySeason = tvMazeService.getEpisodesBySeason(526)
    episodesBySeason.forEach { (season, episodes) ->
        println("Season $season: ${episodes.size} episodes")
    }
}

// Get specific episode
suspend fun getSpecificEpisode() {
    val episode = tvMazeService.getEpisode(
        showId = 169,  // Breaking Bad
        season = 5,
        episode = 14   // "Ozymandias"
    )
    
    episode?.let {
        println("Episode: ${it.name}")
        println("Air Date: ${it.airdate}")
        println("Rating: ${it.rating?.average}/10")
        println("Summary: ${it.summary}")
    }
}
```

### 4. Get Episode Metadata for MediaItems

```kotlin
// Format TVMaze data for CleverFerret MediaItems
suspend fun enrichMediaItem(showId: Int, season: Int, episode: Int) {
    val metadata = tvMazeService.getEpisodeMetadataForMediaItem(
        showId = showId,
        season = season,
        episode = episode
    )
    
    metadata?.let {
        println("Show: ${it.showTitle}")
        println("Episode: ${it.episodeTitle}")
        println("S${it.season}E${it.episode}")
        println("Air Date: ${it.airDate}")
        println("Summary: ${it.summary}")
        println("Image: ${it.imageUrl}")
    }
}
```

### 5. Track Upcoming Episodes

```kotlin
// Get upcoming episodes for a show
suspend fun trackUpcoming(showId: Int) {
    val upcoming = tvMazeService.getUpcomingEpisodes(showId)
    
    upcoming.forEach { episode ->
        println("${episode.name}")
        println("S${episode.season}E${episode.number}")
        println("Airs: ${episode.airdate} at ${episode.airtime}")
    }
}
```

## API Endpoints

### Available Endpoints

| Endpoint | Description |
|----------|-------------|
| `searchShows(query)` | Search for TV shows by name |
| `getShow(showId)` | Get show information |
| `getShowWithEpisodes(showId)` | Get show with all episodes |
| `getShowWithCast(showId)` | Get show with cast information |
| `getShowEpisodes(showId)` | Get all episodes for a show |
| `getEpisodeByNumber(showId, season, episode)` | Get specific episode |
| `getSeasonEpisodes(seasonId)` | Get episodes for a season |
| `getShowCast(showId)` | Get cast members |
| `getShowCrew(showId)` | Get crew members |
| `getShowImages(showId)` | Get show images |
| `getShowSeasons(showId)` | Get season information |

## Data Models

### Key Models

- **TVMazeShow** - Complete show information
- **TVMazeEpisode** - Episode details with air dates
- **TVMazeCastMember** - Cast member with character
- **TVMazeSeason** - Season information
- **TVMazeImage** - Image URLs (medium and original)
- **TVMazeRating** - Average rating
- **TVMazeNetwork** - Network/channel information
- **TVMazeExternals** - External IDs (IMDb, TheTVDB)

### TVMazeShow Structure

```kotlin
data class TVMazeShow(
    val id: Int,
    val name: String,
    val type: String?,              // "Scripted", "Reality", etc.
    val language: String?,          // "English", etc.
    val genres: List<String>,       // ["Drama", "Crime"]
    val status: String?,            // "Ended", "Running", "In Development"
    val runtime: Int?,              // Episode runtime in minutes
    val premiered: String?,         // "2008-01-20"
    val ended: String?,             // "2013-09-29"
    val rating: TVMazeRating?,      // Average rating
    val network: TVMazeNetwork?,    // Network information
    val webChannel: TVMazeWebChannel?, // Streaming service
    val externals: TVMazeExternals?, // IMDb, TheTVDB IDs
    val image: TVMazeImage?,        // Poster images
    val summary: String?,           // HTML summary (needs cleaning)
    val officialSite: String?       // Official website
)
```

### TVMazeEpisode Structure

```kotlin
data class TVMazeEpisode(
    val id: Int,
    val name: String,
    val season: Int,
    val number: Int,
    val airdate: String?,           // "2008-01-20"
    val airtime: String?,           // "22:00"
    val runtime: Int?,              // Episode runtime
    val rating: TVMazeRating?,      // Episode rating
    val image: TVMazeImage?,        // Episode image
    val summary: String?            // Episode summary (HTML)
)
```

## Integration with CleverFerret

### 1. TV Show Playlist Manager

The TVMaze data can be used to enhance the existing `TVShowPlaylistManager`:

```kotlin
// Get all episodes for a show and create a playlist
suspend fun createShowPlaylist(tvMazeId: Int) {
    val details = tvMazeService.getCompleteShowDetails(tvMazeId)
    val show = details.show ?: return
    
    // Create playlist for the show
    val playlistId = tvShowPlaylistManager.createSeriesPlaylist(
        seriesName = show.name,
        episodeIds = matchEpisodesFromTVMaze(details.episodes),
        description = "Complete series: ${show.name}"
    )
}
```

### 2. Metadata Enrichment

Automatically enrich TV show MediaItems with TVMaze data:

```kotlin
suspend fun enrichTVShowMetadata(mediaItem: MediaItem) {
    // Extract show info from filename or existing metadata
    val showName = extractShowName(mediaItem.fileName)
    
    // Search TVMaze
    val results = tvMazeService.searchShows(showName)
    val show = results.shows.firstOrNull() ?: return
    
    // Get complete details
    val metadata = tvMazeService.getShowMetadataForMediaItem(show.id)
    
    metadata?.let {
        // Update MediaItem with TVMaze data
        updateMediaItemMetadata(mediaItem, it)
    }
}
```

### 3. Episode Tracking

Track watched episodes and get next episode information:

```kotlin
suspend fun getNextEpisode(currentEpisode: MediaItem) {
    val (showId, season, episode) = extractEpisodeInfo(currentEpisode)
    
    // Get next episode from TVMaze
    val nextEp = tvMazeService.getEpisode(showId, season, episode + 1)
        ?: tvMazeService.getEpisode(showId, season + 1, 1)
    
    nextEp?.let {
        println("Next Episode: ${it.name}")
        println("Airs: ${it.airdate}")
    }
}
```

## Benefits Over Other APIs

### TVMaze vs TMDB

| Feature | TVMaze | TMDB |
|---------|--------|------|
| **API Key Required** | ❌ No | ✅ Yes |
| **Episode Data** | ✅ Excellent | ⚠️ Limited |
| **Cast Information** | ✅ Detailed | ✅ Detailed |
| **Air Dates** | ✅ Accurate | ✅ Accurate |
| **Schedule Data** | ✅ Yes | ❌ No |
| **Free Tier** | ✅ Unlimited | ⚠️ Limited |
| **TV-Specific** | ✅ TV-focused | ⚠️ Movies + TV |

### TVMaze vs TheTVDB

| Feature | TVMaze | TheTVDB |
|---------|--------|---------|
| **API Key Required** | ❌ No | ✅ Yes |
| **Episode Data** | ✅ Complete | ✅ Complete |
| **Free Access** | ✅ Yes | ⚠️ Limited |
| **API Simplicity** | ✅ RESTful | ⚠️ More complex |
| **Real-time Updates** | ✅ Yes | ✅ Yes |

## Rate Limiting

TVMaze has rate limiting to prevent abuse:
- **20 requests per 10 seconds** per IP address
- Requests are queued and processed in order
- The service automatically handles this

## Error Handling

The TVMaze service includes comprehensive error handling:

```kotlin
val result = tvMazeService.searchShows("NonExistent Show")

if (result.error != null) {
    println("Error: ${result.error}")
} else if (result.shows.isEmpty()) {
    println("No results found")
} else {
    println("Found ${result.totalResults} results")
}
```

## Best Practices

1. **Cache Results** - TVMaze data doesn't change frequently, cache it locally
2. **Clean HTML** - Use the built-in `cleanHtmlSummary()` function for summaries
3. **Batch Requests** - Use `getCompleteShowDetails()` instead of multiple calls
4. **Respect Rate Limits** - Don't make too many requests in quick succession
5. **Use External IDs** - Link TVMaze data to IMDb and TheTVDB for cross-reference

## Example: Complete TV Show Lookup Flow

```kotlin
class TVShowLookupExample @Inject constructor(
    private val tvMazeService: TVMazeService,
    private val metadataApiService: MetadataApiService
) {
    
    suspend fun lookupAndDisplayShow(showName: String) {
        // 1. Search for the show
        val searchResults = metadataApiService.searchTVShows(showName)
        
        if (searchResults.isEmpty()) {
            println("No shows found for: $showName")
            return
        }
        
        // 2. Get the first result
        val firstResult = searchResults.first()
        val tvMazeId = firstResult.id.toInt()
        
        // 3. Get complete details
        val details = tvMazeService.getCompleteShowDetails(tvMazeId)
        val show = details.show ?: return
        
        // 4. Display information
        println("=" .repeat(50))
        println("Show: ${show.name}")
        println("=" .repeat(50))
        println("Premiered: ${show.premiered}")
        println("Status: ${show.status}")
        println("Network: ${show.network?.name ?: show.webChannel?.name}")
        println("Rating: ${show.rating?.average}/10")
        println("Genres: ${show.genres.joinToString(", ")}")
        println("Runtime: ${show.runtime} minutes")
        println()
        
        // 5. Display seasons
        println("Seasons: ${details.totalSeasons}")
        details.seasons.forEach { season ->
            println("  Season ${season.number}: ${season.episodeOrder} episodes")
        }
        println()
        
        // 6. Display episode count
        println("Total Episodes: ${details.totalEpisodes}")
        println()
        
        // 7. Display cast
        println("Cast:")
        details.cast.take(10).forEach { member ->
            println("  ${member.person.name} as ${member.character.name}")
        }
        println()
        
        // 8. Display external IDs
        println("External IDs:")
        show.externals?.imdb?.let { println("  IMDb: $it") }
        show.externals?.thetvdb?.let { println("  TheTVDB: $it") }
        println()
        
        // 9. Display recent episodes
        val recentEpisodes = details.episodes.takeLast(5)
        println("Recent Episodes:")
        recentEpisodes.forEach { episode ->
            println("  S${episode.season}E${episode.number}: ${episode.name}")
            println("    Aired: ${episode.airdate}")
        }
    }
}
```

## Summary

The TVMaze API integration provides CleverFerret with:
- ✅ Free, unlimited TV show metadata
- ✅ Complete episode listings with air dates
- ✅ Cast and crew information
- ✅ High-quality images
- ✅ No API key required
- ✅ Easy-to-use service layer
- ✅ Integration with existing metadata system

This makes TVMaze an excellent choice for TV show data in CleverFerret!
