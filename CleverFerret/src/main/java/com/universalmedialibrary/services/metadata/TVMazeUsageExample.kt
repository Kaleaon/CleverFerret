package com.universalmedialibrary.services.metadata

import javax.inject.Inject

/**
 * TVMaze API Usage Examples
 * 
 * This file demonstrates various ways to use the TVMaze API integration
 * in CleverFerret for TV show metadata.
 * 
 * Examples include:
 * - Searching for TV shows
 * - Getting complete show details
 * - Fetching episodes by season
 * - Getting cast information
 * - Tracking upcoming episodes
 * - Enriching MediaItem metadata
 */
class TVMazeUsageExample @Inject constructor(
    private val tvMazeService: TVMazeService,
    private val metadataApiService: MetadataApiService
) {
    
    /**
     * Example 1: Basic Show Search
     * 
     * Search for TV shows by name and display results
     */
    suspend fun example1_BasicSearch() {
        println("=== Example 1: Basic Show Search ===")
        
        val results = metadataApiService.searchTVShows("Breaking Bad")
        
        results.forEach { show ->
            println("\nShow: ${show.title}")
            println("Year: ${show.year}")
            println("Rating: ${show.rating}/10")
            println("Genres: ${show.genres.joinToString(", ")}")
            println("IMDb: ${show.imdbId}")
            println("Description: ${show.description?.take(100)}...")
            
            // Additional TVMaze-specific data
            println("\nTVMaze Data:")
            println("  TVMaze ID: ${show.additionalData["tvMazeId"]}")
            println("  Network: ${show.additionalData["network"]}")
            println("  Status: ${show.additionalData["status"]}")
            println("  Runtime: ${show.additionalData["runtime"]} minutes")
            println("  TheTVDB ID: ${show.additionalData["tvdbId"]}")
        }
    }
    
    /**
     * Example 2: Complete Show Details with Episodes
     * 
     * Get comprehensive information including all episodes
     */
    suspend fun example2_CompleteShowDetails() {
        println("\n=== Example 2: Complete Show Details ===")
        
        // TVMaze ID for Breaking Bad is 169
        val details = tvMazeService.getCompleteShowDetails(169)
        
        details.show?.let { show ->
            println("Show: ${show.name}")
            println("Type: ${show.type}")
            println("Language: ${show.language}")
            println("Premiered: ${show.premiered}")
            println("Ended: ${show.ended}")
            println("Status: ${show.status}")
            println("Rating: ${show.rating?.average}/10")
            println("Runtime: ${show.runtime} minutes")
            println("Network: ${show.network?.name}")
            println("Genres: ${show.genres.joinToString(", ")}")
            println("\nExternal IDs:")
            println("  IMDb: ${show.externals?.imdb}")
            println("  TheTVDB: ${show.externals?.thetvdb}")
            println("\nSummary: ${show.summary?.replace(Regex("<[^>]*>"), "")?.take(200)}...")
        }
        
        println("\nTotal Episodes: ${details.totalEpisodes}")
        println("Total Seasons: ${details.totalSeasons}")
        
        // Display first 5 episodes
        println("\nFirst 5 Episodes:")
        details.episodes.take(5).forEach { episode ->
            println("  S${episode.season}E${episode.number}: ${episode.name}")
            println("    Air Date: ${episode.airdate}")
            println("    Rating: ${episode.rating?.average}/10")
        }
        
        // Display cast
        println("\nMain Cast:")
        details.cast.take(10).forEach { member ->
            println("  ${member.person.name} as ${member.character.name}")
        }
        
        // Display seasons
        println("\nSeasons:")
        details.seasons.forEach { season ->
            println("  Season ${season.number}: ${season.episodeOrder} episodes")
            println("    Premiered: ${season.premiereDate}")
            println("    Ended: ${season.endDate}")
        }
    }
    
    /**
     * Example 3: Get Episodes by Season
     * 
     * Fetch all episodes for a specific season
     */
    suspend fun example3_EpisodesBySeason() {
        println("\n=== Example 3: Episodes by Season ===")
        
        val episodesBySeason = tvMazeService.getEpisodesBySeason(169) // Breaking Bad
        
        episodesBySeason.forEach { (season, episodes) ->
            println("\nSeason $season (${episodes.size} episodes):")
            episodes.forEach { episode ->
                println("  ${episode.number}. ${episode.name}")
                println("     Air Date: ${episode.airdate}")
                println("     Runtime: ${episode.runtime} min")
            }
        }
    }
    
    /**
     * Example 4: Get Specific Episode
     * 
     * Fetch details for a specific episode by season and episode number
     */
    suspend fun example4_SpecificEpisode() {
        println("\n=== Example 4: Specific Episode ===")
        
        // Get "Ozymandias" - Breaking Bad S05E14
        val episode = tvMazeService.getEpisode(
            showId = 169,
            season = 5,
            episode = 14
        )
        
        episode?.let {
            println("Episode: ${it.name}")
            println("Season ${it.season}, Episode ${it.number}")
            println("Air Date: ${it.airdate} at ${it.airtime}")
            println("Runtime: ${it.runtime} minutes")
            println("Rating: ${it.rating?.average}/10")
            println("Summary: ${it.summary?.replace(Regex("<[^>]*>"), "")}")
            println("Image URL: ${it.image?.original}")
        }
    }
    
    /**
     * Example 5: Search Multiple Shows
     * 
     * Compare multiple TV shows
     */
    suspend fun example5_CompareShows() {
        println("\n=== Example 5: Compare Shows ===")
        
        val shows = listOf("The Wire", "The Sopranos", "Breaking Bad", "Game of Thrones")
        
        shows.forEach { showName ->
            val results = metadataApiService.searchTVShows(showName)
            val firstResult = results.firstOrNull()
            
            firstResult?.let { show ->
                println("\n${show.title} (${show.year})")
                println("  Rating: ${show.rating}/10")
                println("  Network: ${show.additionalData["network"]}")
                println("  Status: ${show.additionalData["status"]}")
            }
        }
    }
    
    /**
     * Example 6: Get Cast Information
     * 
     * Detailed cast member information
     */
    suspend fun example6_CastInformation() {
        println("\n=== Example 6: Cast Information ===")
        
        val cast = tvMazeService.getShowCast(526) // The Office
        
        println("The Office Cast (${cast.size} members):\n")
        
        cast.take(15).forEach { member ->
            println("Actor: ${member.person.name}")
            println("  Character: ${member.character.name}")
            println("  Gender: ${member.person.gender}")
            println("  Country: ${member.person.country?.name}")
            println("  Birthday: ${member.person.birthday}")
            println()
        }
    }
    
    /**
     * Example 7: Track Upcoming Episodes
     * 
     * Get episodes that haven't aired yet
     */
    suspend fun example7_UpcomingEpisodes() {
        println("\n=== Example 7: Upcoming Episodes ===")
        
        // Example with a currently airing show
        // Note: You'll need to use a show that's currently on air
        val showId = 60993 // Example show ID
        
        val upcoming = tvMazeService.getUpcomingEpisodes(showId)
        
        if (upcoming.isEmpty()) {
            println("No upcoming episodes found (show may have ended)")
        } else {
            println("Upcoming Episodes:")
            upcoming.forEach { episode ->
                println("\nS${episode.season}E${episode.number}: ${episode.name}")
                println("  Airs: ${episode.airdate} at ${episode.airtime}")
                println("  Network: (from show data)")
            }
        }
    }
    
    /**
     * Example 8: Get Show Metadata for MediaItem
     * 
     * Format TVMaze data for use with CleverFerret MediaItems
     */
    suspend fun example8_ShowMetadataForMediaItem() {
        println("\n=== Example 8: Show Metadata for MediaItem ===")
        
        val metadata = tvMazeService.getShowMetadataForMediaItem(169) // Breaking Bad
        
        metadata?.let {
            println("TVMaze ID: ${it.tvMazeId}")
            println("Title: ${it.title}")
            println("Summary: ${it.summary?.take(200)}...")
            println("Genres: ${it.genres.joinToString(", ")}")
            println("Rating: ${it.rating}/10")
            println("Premiered: ${it.premiered}")
            println("Ended: ${it.ended}")
            println("Status: ${it.status}")
            println("Network: ${it.network}")
            println("Runtime: ${it.runtime} minutes")
            println("Language: ${it.language}")
            println("Official Site: ${it.officialSite}")
            println("Poster URL: ${it.posterUrl}")
            println("IMDb ID: ${it.imdbId}")
            println("TheTVDB ID: ${it.tvdbId}")
            println("Schedule: ${it.scheduleDays.joinToString(", ")} at ${it.scheduleTime}")
        }
    }
    
    /**
     * Example 9: Get Episode Metadata for MediaItem
     * 
     * Format episode data for use with CleverFerret MediaItems
     */
    suspend fun example9_EpisodeMetadataForMediaItem() {
        println("\n=== Example 9: Episode Metadata for MediaItem ===")
        
        val episodeMetadata = tvMazeService.getEpisodeMetadataForMediaItem(
            showId = 169,
            season = 1,
            episode = 1
        )
        
        episodeMetadata?.let {
            println("Episode Details:")
            println("  TVMaze Episode ID: ${it.tvMazeEpisodeId}")
            println("  TVMaze Show ID: ${it.tvMazeShowId}")
            println("  Show: ${it.showTitle}")
            println("  Episode: ${it.episodeTitle}")
            println("  Season: ${it.season}")
            println("  Episode Number: ${it.episode}")
            println("  Summary: ${it.summary?.take(200)}...")
            println("  Air Date: ${it.airDate}")
            println("  Runtime: ${it.runtime} minutes")
            println("  Rating: ${it.rating}/10")
            println("  Image URL: ${it.imageUrl}")
        }
    }
    
    /**
     * Example 10: Advanced - Get Complete Show with Filtering
     * 
     * Get show data and filter/process it
     */
    suspend fun example10_AdvancedFiltering() {
        println("\n=== Example 10: Advanced Filtering ===")
        
        val details = tvMazeService.getCompleteShowDetails(82) // Game of Thrones
        
        // Filter highly rated episodes
        val highlyRated = details.episodes.filter { 
            (it.rating?.average ?: 0.0) >= 9.0 
        }.sortedByDescending { 
            it.rating?.average 
        }
        
        println("Highly Rated Episodes (9.0+):")
        highlyRated.take(10).forEach { episode ->
            println("  S${episode.season}E${episode.number}: ${episode.name}")
            println("    Rating: ${episode.rating?.average}/10")
        }
        
        // Get season statistics
        println("\nSeason Statistics:")
        details.episodes.groupBy { it.season }.forEach { (season, episodes) ->
            val avgRating = episodes.mapNotNull { it.rating?.average }.average()
            println("  Season $season: ${episodes.size} episodes, avg rating: ${"%.2f".format(avgRating)}/10")
        }
        
        // Get episodes with specific characteristics
        val longEpisodes = details.episodes.filter { (it.runtime ?: 0) > 60 }
        println("\nEpisodes longer than 60 minutes: ${longEpisodes.size}")
    }
    
    /**
     * Run all examples
     */
    suspend fun runAllExamples() {
        example1_BasicSearch()
        example2_CompleteShowDetails()
        example3_EpisodesBySeason()
        example4_SpecificEpisode()
        example5_CompareShows()
        example6_CastInformation()
        example7_UpcomingEpisodes()
        example8_ShowMetadataForMediaItem()
        example9_EpisodeMetadataForMediaItem()
        example10_AdvancedFiltering()
    }
}

/**
 * Example: Integration with TVShowPlaylistManager
 * 
 * Shows how to use TVMaze data with the existing playlist manager
 */
class TVMazePlaylistIntegration @Inject constructor(
    private val tvMazeService: TVMazeService
    // In real code, also inject TVShowPlaylistManager
) {
    
    /**
     * Create a playlist for a TV show using TVMaze data
     */
    suspend fun createShowPlaylistFromTVMaze(showName: String) {
        // Search for the show
        val searchResult = tvMazeService.searchShows(showName)
        val show = searchResult.shows.firstOrNull() ?: return
        
        // Get complete details
        val details = tvMazeService.getCompleteShowDetails(show.id)
        
        println("Creating playlist for ${show.name}")
        println("Total episodes: ${details.totalEpisodes}")
        println("Seasons: ${details.totalSeasons}")
        
        // In real code, you would:
        // 1. Match episodes from TVMaze to local MediaItems
        // 2. Create playlist using TVShowPlaylistManager
        // 3. Add episodes in correct order
        
        details.episodes.forEach { episode ->
            println("Would add: S${episode.season}E${episode.number} - ${episode.name}")
        }
    }
    
    /**
     * Enrich local episode files with TVMaze metadata
     */
    suspend fun enrichLocalEpisodesWithTVMaze(showId: Int) {
        val details = tvMazeService.getCompleteShowDetails(showId)
        
        details.episodes.forEach { episode ->
            // In real code, match this to local MediaItem and update metadata
            println("Enriching S${episode.season}E${episode.number}")
            println("  Title: ${episode.name}")
            println("  Air Date: ${episode.airdate}")
            println("  Summary: ${episode.summary?.take(50)}...")
        }
    }
}
