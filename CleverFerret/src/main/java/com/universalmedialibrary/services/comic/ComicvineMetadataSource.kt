package com.universalmedialibrary.services.comic

import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comicvine API metadata source
 */
@Singleton
class ComicvineMetadataSource @Inject constructor(
    private val httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository
) : ComicMetadataSource {
    
    override val sourceName = "Comicvine"
    
    private val baseUrl = "https://comicvine.gamespot.com/api"
    
    override suspend fun searchSeries(seriesName: String): Result<List<ComicSeries>> = 
        withContext(Dispatchers.IO) {
            try {
                val apiKey = apiKeyRepository.getAPIKeyValue("comicvine")
                    ?: return@withContext Result.failure(
                        Exception("Comicvine API key not configured")
                    )
                
                val url = "$baseUrl/search/" +
                          "?api_key=$apiKey" +
                          "&format=json" +
                          "&resources=volume" +
                          "&query=${URLEncoder.encode(seriesName, "UTF-8")}" +
                          "&limit=10"
                
                val request = Request.Builder()
                    .url(url)
                    .header("User-Agent", "CleverFerret/1.0")
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(
                            Exception("HTTP error: ${response.code}")
                        )
                    }
                    
                    val json = JSONObject(response.body?.string() ?: "")
                    val results = json.getJSONArray("results")
                    
                    val series = (0 until results.length()).map { i ->
                        val volume = results.getJSONObject(i)
                        ComicSeries(
                            id = volume.getString("id"),
                            name = volume.getString("name"),
                            startYear = volume.optInt("start_year", 0).takeIf { it > 0 },
                            publisher = volume.optJSONObject("publisher")?.optString("name"),
                            description = volume.optString("description"),
                            imageUrl = volume.optJSONObject("image")?.optString("medium_url"),
                            issueCount = volume.optInt("count_of_issues", 0)
                        )
                    }
                    
                    Result.success(series)
                }
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    override suspend fun getIssue(
        volumeId: String,
        issueNumber: Int
    ): Result<ComicIssue?> = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getAPIKeyValue("comicvine")
                ?: return@withContext Result.failure(
                    Exception("Comicvine API key not configured")
                )
            
            val url = "$baseUrl/issues/" +
                      "?api_key=$apiKey" +
                      "&format=json" +
                      "&filter=volume:$volumeId,issue_number:$issueNumber" +
                      "&limit=1"
            
            val request = Request.Builder()
                .url(url)
                .header("User-Agent", "CleverFerret/1.0")
                .build()
            
            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("HTTP error: ${response.code}")
                    )
                }
                
                val json = JSONObject(response.body?.string() ?: "")
                val results = json.getJSONArray("results")
                
                if (results.length() == 0) {
                    return@withContext Result.success(null)
                }
                
                val issue = results.getJSONObject(0)
                
                val comicIssue = ComicIssue(
                    id = issue.getString("id"),
                    volumeId = volumeId,
                    issueNumber = issue.getString("issue_number"),
                    name = issue.optString("name"),
                    description = issue.optString("description"),
                    coverUrl = issue.optJSONObject("image")?.optString("medium_url"),
                    coverDate = issue.optString("cover_date"),
                    creators = parseCreators(issue),
                    characters = parseCharacters(issue),
                    teams = parseTeams(issue),
                    locations = parseLocations(issue),
                    storyArcs = parseStoryArcs(issue),
                    publisher = parsePublisher(issue)
                )
                
                Result.success(comicIssue)
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    override suspend fun getVolume(volumeId: String): Result<ComicVolume?> = 
        withContext(Dispatchers.IO) {
            try {
                val apiKey = apiKeyRepository.getAPIKeyValue("comicvine")
                    ?: return@withContext Result.failure(
                        Exception("Comicvine API key not configured")
                    )
                
                val url = "$baseUrl/volume/4050-$volumeId/" +
                          "?api_key=$apiKey" +
                          "&format=json"
                
                val request = Request.Builder()
                    .url(url)
                    .header("User-Agent", "CleverFerret/1.0")
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(
                            Exception("HTTP error: ${response.code}")
                        )
                    }
                    
                    val json = JSONObject(response.body?.string() ?: "")
                    val results = json.getJSONObject("results")
                    
                    val volume = ComicVolume(
                        id = results.getString("id"),
                        name = results.getString("name"),
                        startYear = results.optInt("start_year", 0).takeIf { it > 0 },
                        publisher = results.optJSONObject("publisher")?.let {
                            Publisher(it.getString("name"), it.getString("id"))
                        },
                        description = results.optString("description"),
                        imageUrl = results.optJSONObject("image")?.optString("medium_url"),
                        issueCount = results.optInt("count_of_issues", 0),
                        creators = emptyList() // Would need additional API call
                    )
                    
                    Result.success(volume)
                }
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    /**
     * Test API key validity
     */
    suspend fun testApiKey(apiKey: String): Result<Boolean> = withContext(Dispatchers.IO) {
        try {
            val url = "$baseUrl/volumes/?api_key=$apiKey&format=json&limit=1"
            
            val request = Request.Builder()
                .url(url)
                .build()
            
            httpClient.newCall(request).execute().use { response ->
                if (response.isSuccessful) {
                    val json = JSONObject(response.body?.string() ?: "")
                    val statusCode = json.optInt("status_code")
                    
                    if (statusCode == 1) {
                        Result.success(true)
                    } else {
                        Result.failure(Exception("Invalid API key"))
                    }
                } else {
                    Result.failure(Exception("HTTP error: ${response.code}"))
                }
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    // Helper parsers
    
    private fun parseCreators(issue: JSONObject): List<Creator> {
        val creators = mutableListOf<Creator>()
        
        // Person credits
        issue.optJSONArray("person_credits")?.let { array ->
            for (i in 0 until array.length()) {
                val person = array.getJSONObject(i)
                creators.add(
                    Creator(
                        name = person.getString("name"),
                        role = person.optString("role", "creator")
                    )
                )
            }
        }
        
        return creators
    }
    
    private fun parseCharacters(issue: JSONObject): List<Character> {
        val characters = mutableListOf<Character>()
        
        issue.optJSONArray("character_credits")?.let { array ->
            for (i in 0 until array.length()) {
                val char = array.getJSONObject(i)
                characters.add(
                    Character(
                        name = char.getString("name"),
                        id = char.optString("id")
                    )
                )
            }
        }
        
        return characters
    }
    
    private fun parseTeams(issue: JSONObject): List<Team> {
        val teams = mutableListOf<Team>()
        
        issue.optJSONArray("team_credits")?.let { array ->
            for (i in 0 until array.length()) {
                val team = array.getJSONObject(i)
                teams.add(
                    Team(
                        name = team.getString("name"),
                        id = team.optString("id")
                    )
                )
            }
        }
        
        return teams
    }
    
    private fun parseLocations(issue: JSONObject): List<Location> {
        val locations = mutableListOf<Location>()
        
        issue.optJSONArray("location_credits")?.let { array ->
            for (i in 0 until array.length()) {
                val location = array.getJSONObject(i)
                locations.add(
                    Location(
                        name = location.getString("name"),
                        id = location.optString("id")
                    )
                )
            }
        }
        
        return locations
    }
    
    private fun parseStoryArcs(issue: JSONObject): List<StoryArc> {
        val storyArcs = mutableListOf<StoryArc>()
        
        issue.optJSONArray("story_arc_credits")?.let { array ->
            for (i in 0 until array.length()) {
                val arc = array.getJSONObject(i)
                storyArcs.add(
                    StoryArc(
                        name = arc.getString("name"),
                        id = arc.optString("id")
                    )
                )
            }
        }
        
        return storyArcs
    }
    
    private fun parsePublisher(issue: JSONObject): Publisher? {
        return issue.optJSONObject("volume")
            ?.optJSONObject("publisher")
            ?.let {
                Publisher(
                    name = it.getString("name"),
                    id = it.optString("id")
                )
            }
    }
}
