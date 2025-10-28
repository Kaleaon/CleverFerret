package com.universalmedialibrary.services.comic

/**
 * Interface for comic metadata sources
 */
interface ComicMetadataSource {
    val sourceName: String
    
    /**
     * Search for comic series
     */
    suspend fun searchSeries(seriesName: String): Result<List<ComicSeries>>
    
    /**
     * Get specific issue
     */
    suspend fun getIssue(volumeId: String, issueNumber: Int): Result<ComicIssue?>
    
    /**
     * Get volume/series info
     */
    suspend fun getVolume(volumeId: String): Result<ComicVolume?>
}

data class ComicSeries(
    val id: String,
    val name: String,
    val startYear: Int?,
    val publisher: String?,
    val description: String?,
    val imageUrl: String?,
    val issueCount: Int
)

data class ComicVolume(
    val id: String,
    val name: String,
    val startYear: Int?,
    val publisher: Publisher?,
    val description: String?,
    val imageUrl: String?,
    val issueCount: Int,
    val creators: List<Creator> = emptyList()
)

data class ComicIssue(
    val id: String,
    val volumeId: String,
    val issueNumber: String,
    val name: String?,
    val description: String?,
    val coverUrl: String?,
    val coverDate: String?,
    val creators: List<Creator> = emptyList(),
    val characters: List<Character> = emptyList(),
    val teams: List<Team> = emptyList(),
    val locations: List<Location> = emptyList(),
    val storyArcs: List<StoryArc> = emptyList(),
    val publisher: Publisher? = null
)

data class Creator(
    val name: String,
    val role: String // "writer", "penciller", "inker", etc.
)

data class Character(
    val name: String,
    val id: String? = null
)

data class Team(
    val name: String,
    val id: String? = null
)

data class Location(
    val name: String,
    val id: String? = null
)

data class StoryArc(
    val name: String,
    val id: String? = null
)

data class Publisher(
    val name: String,
    val id: String? = null
)

/**
 * ComicInfo.xml standard format
 * Used in CBZ/CBR files
 */
data class ComicInfo(
    val title: String? = null,
    val series: String? = null,
    val number: String? = null,
    val count: Int? = null,
    val volume: Int? = null,
    val alternateSeries: String? = null,
    val alternateNumber: String? = null,
    val storyTitle: String? = null,
    val summary: String? = null,
    val notes: String? = null,
    val year: Int? = null,
    val month: Int? = null,
    val day: Int? = null,
    val writer: String? = null,
    val penciller: String? = null,
    val inker: String? = null,
    val colorist: String? = null,
    val letterer: String? = null,
    val coverArtist: String? = null,
    val editor: String? = null,
    val publisher: String? = null,
    val imprint: String? = null,
    val genre: String? = null,
    val tags: String? = null,
    val web: String? = null,
    val pageCount: Int? = null,
    val languageISO: String? = null,
    val format: String? = null,
    val blackAndWhite: String? = null,
    val manga: String? = null,
    val characters: String? = null,
    val teams: String? = null,
    val locations: String? = null,
    val scanInformation: String? = null,
    val storyArc: String? = null,
    val seriesGroup: String? = null,
    val ageRating: String? = null
)
