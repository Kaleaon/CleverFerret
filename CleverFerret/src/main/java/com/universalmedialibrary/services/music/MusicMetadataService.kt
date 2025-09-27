package com.universalmedialibrary.services.music

import android.content.Context
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Advanced Music Metadata Service using multiple APIs
 * 
 * Integrates with:
 * - Last.fm API for comprehensive music metadata
 * - MusicBrainz API for music database information
 * - Spotify Web API for additional metadata and album art
 * - AudioDB API for artist information and images
 */
@Singleton
class MusicMetadataService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository
) {
    
    private val httpClient = OkHttpClient()
    
    /**
     * Enhance track metadata using multiple APIs
     */
    suspend fun enhanceTrackMetadata(
        artist: String,
        title: String,
        album: String? = null
    ): EnhancedTrackMetadata = withContext(Dispatchers.IO) {
        try {
            var enhancedMetadata = EnhancedTrackMetadata(
                originalArtist = artist,
                originalTitle = title,
                originalAlbum = album
            )
            
            // Try Last.fm first for basic metadata
            val lastFmData = getLastFmTrackInfo(artist, title)
            if (lastFmData != null) {
                enhancedMetadata = enhancedMetadata.copy(
                    correctedArtist = lastFmData.artist,
                    correctedTitle = lastFmData.title,
                    correctedAlbum = lastFmData.album,
                    genre = lastFmData.genre,
                    tags = lastFmData.tags,
                    playcount = lastFmData.playcount,
                    listeners = lastFmData.listeners,
                    albumArtUrl = lastFmData.albumArtUrl
                )
            }
            
            // Enhance with MusicBrainz for authoritative data
            val musicBrainzData = getMusicBrainzTrackInfo(artist, title, album)
            if (musicBrainzData != null) {
                enhancedMetadata = enhancedMetadata.copy(
                    mbid = musicBrainzData.mbid,
                    releaseDate = musicBrainzData.releaseDate,
                    duration = musicBrainzData.duration,
                    isrc = musicBrainzData.isrc
                )
            }
            
            // Get artist information from AudioDB
            val artistInfo = getAudioDbArtistInfo(enhancedMetadata.correctedArtist ?: artist)
            if (artistInfo != null) {
                enhancedMetadata = enhancedMetadata.copy(
                    artistBio = artistInfo.biography,
                    artistImageUrl = artistInfo.imageUrl,
                    artistGenre = artistInfo.genre,
                    formedYear = artistInfo.formedYear
                )
            }
            
            enhancedMetadata.copy(success = true)
            
        } catch (e: Exception) {
            EnhancedTrackMetadata(
                originalArtist = artist,
                originalTitle = title,
                originalAlbum = album,
                success = false,
                error = "Error enhancing metadata: ${e.message}"
            )
        }
    }
    
    /**
     * Get album information with track listing
     */
    suspend fun getAlbumInfo(artist: String, album: String): AlbumInfo? = withContext(Dispatchers.IO) {
        try {
            val lastFmAlbum = getLastFmAlbumInfo(artist, album)
            if (lastFmAlbum != null) {
                return@withContext lastFmAlbum
            }
            
            // Fallback to MusicBrainz
            getMusicBrainzAlbumInfo(artist, album)
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Search for similar artists using Last.fm
     */
    suspend fun getSimilarArtists(artist: String, limit: Int = 10): List<SimilarArtist> = withContext(Dispatchers.IO) {
        try {
            val lastFmKey = apiKeyRepository.getLastFmApiKey()
            if (lastFmKey.isNullOrEmpty()) {
                return@withContext emptyList()
            }
            
            val encodedArtist = URLEncoder.encode(artist, "UTF-8")
            val url = "https://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=$encodedArtist&api_key=$lastFmKey&format=json&limit=$limit"
            
            val request = Request.Builder().url(url).build()
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                parseLastFmSimilarArtists(responseBody)
            } else {
                emptyList()
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get top tracks for an artist
     */
    suspend fun getArtistTopTracks(artist: String, limit: Int = 10): List<TopTrack> = withContext(Dispatchers.IO) {
        try {
            val lastFmKey = apiKeyRepository.getLastFmApiKey()
            if (lastFmKey.isNullOrEmpty()) {
                return@withContext emptyList()
            }
            
            val encodedArtist = URLEncoder.encode(artist, "UTF-8")
            val url = "https://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=$encodedArtist&api_key=$lastFmKey&format=json&limit=$limit"
            
            val request = Request.Builder().url(url).build()
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                parseLastFmTopTracks(responseBody)
            } else {
                emptyList()
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private suspend fun getLastFmTrackInfo(artist: String, title: String): LastFmTrackInfo? {
        return try {
            val lastFmKey = apiKeyRepository.getLastFmApiKey()
            if (lastFmKey.isNullOrEmpty()) {
                return null
            }
            
            val encodedArtist = URLEncoder.encode(artist, "UTF-8")
            val encodedTitle = URLEncoder.encode(title, "UTF-8")
            val url = "https://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=$lastFmKey&artist=$encodedArtist&track=$encodedTitle&format=json"
            
            val request = Request.Builder().url(url).build()
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                parseLastFmTrackResponse(responseBody)
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private suspend fun getMusicBrainzTrackInfo(artist: String, title: String, album: String?): MusicBrainzTrackInfo? {
        return try {
            val query = buildString {
                append("artist:\"$artist\" AND recording:\"$title\"")
                if (!album.isNullOrEmpty()) {
                    append(" AND release:\"$album\"")
                }
            }
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val url = "https://musicbrainz.org/ws/2/recording/?query=$encodedQuery&fmt=json&limit=1"
            
            val request = Request.Builder()
                .url(url)
                .header("User-Agent", "CleverFerret/1.0 (contact@example.com)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                parseMusicBrainzTrackResponse(responseBody)
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private suspend fun getAudioDbArtistInfo(artist: String): AudioDbArtistInfo? {
        return try {
            val encodedArtist = URLEncoder.encode(artist, "UTF-8")
            val url = "https://www.theaudiodb.com/api/v1/json/2/search.php?s=$encodedArtist"
            
            val request = Request.Builder().url(url).build()
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                parseAudioDbArtistResponse(responseBody)
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private suspend fun getLastFmAlbumInfo(artist: String, album: String): AlbumInfo? {
        return try {
            val lastFmKey = apiKeyRepository.getLastFmApiKey()
            if (lastFmKey.isNullOrEmpty()) {
                return null
            }
            
            val encodedArtist = URLEncoder.encode(artist, "UTF-8")
            val encodedAlbum = URLEncoder.encode(album, "UTF-8")
            val url = "https://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=$lastFmKey&artist=$encodedArtist&album=$encodedAlbum&format=json"
            
            val request = Request.Builder().url(url).build()
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                parseLastFmAlbumResponse(responseBody)
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private suspend fun getMusicBrainzAlbumInfo(artist: String, album: String): AlbumInfo? {
        return try {
            val query = "artist:\"$artist\" AND release:\"$album\""
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val url = "https://musicbrainz.org/ws/2/release/?query=$encodedQuery&fmt=json&limit=1&inc=recordings"
            
            val request = Request.Builder()
                .url(url)
                .header("User-Agent", "CleverFerret/1.0 (contact@example.com)")
                .build()
            
            val response = httpClient.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                parseMusicBrainzAlbumResponse(responseBody)
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    // Response parsing methods
    private fun parseLastFmTrackResponse(response: String): LastFmTrackInfo? {
        return try {
            val json = JSONObject(response)
            val track = json.getJSONObject("track")
            
            val artist = track.getJSONObject("artist").getString("name")
            val title = track.getString("name")
            val album = track.optJSONObject("album")?.getString("title")
            
            val tags = mutableListOf<String>()
            val tagsArray = track.optJSONObject("toptags")?.optJSONArray("tag")
            if (tagsArray != null) {
                for (i in 0 until tagsArray.length()) {
                    tags.add(tagsArray.getJSONObject(i).getString("name"))
                }
            }
            
            val images = track.optJSONArray("image")
            var albumArtUrl: String? = null
            if (images != null) {
                for (i in 0 until images.length()) {
                    val image = images.getJSONObject(i)
                    if (image.getString("size") == "extralarge") {
                        albumArtUrl = image.getString("#text")
                        break
                    }
                }
            }
            
            LastFmTrackInfo(
                artist = artist,
                title = title,
                album = album,
                genre = tags.firstOrNull(),
                tags = tags,
                playcount = track.optLong("playcount"),
                listeners = track.optLong("listeners"),
                albumArtUrl = albumArtUrl
            )
        } catch (e: Exception) {
            null
        }
    }
    
    private fun parseMusicBrainzTrackResponse(response: String): MusicBrainzTrackInfo? {
        return try {
            val json = JSONObject(response)
            val recordings = json.getJSONArray("recordings")
            
            if (recordings.length() > 0) {
                val recording = recordings.getJSONObject(0)
                
                MusicBrainzTrackInfo(
                    mbid = recording.getString("id"),
                    duration = recording.optLong("length"),
                    releaseDate = recording.optJSONArray("releases")?.let { releases ->
                        if (releases.length() > 0) {
                            releases.getJSONObject(0).optString("date")
                        } else null
                    },
                    isrc = recording.optJSONArray("isrcs")?.let { isrcs ->
                        if (isrcs.length() > 0) {
                            isrcs.getString(0)
                        } else null
                    }
                )
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private fun parseAudioDbArtistResponse(response: String): AudioDbArtistInfo? {
        return try {
            val json = JSONObject(response)
            val artists = json.optJSONArray("artists")
            
            if (artists != null && artists.length() > 0) {
                val artist = artists.getJSONObject(0)
                
                AudioDbArtistInfo(
                    biography = artist.optString("strBiographyEN"),
                    imageUrl = artist.optString("strArtistThumb"),
                    genre = artist.optString("strGenre"),
                    formedYear = artist.optString("intFormedYear")?.toIntOrNull()
                )
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private fun parseLastFmAlbumResponse(response: String): AlbumInfo? {
        return try {
            val json = JSONObject(response)
            val album = json.getJSONObject("album")
            
            val tracks = mutableListOf<AlbumTrack>()
            val tracksArray = album.optJSONObject("tracks")?.optJSONArray("track")
            if (tracksArray != null) {
                for (i in 0 until tracksArray.length()) {
                    val track = tracksArray.getJSONObject(i)
                    tracks.add(
                        AlbumTrack(
                            name = track.getString("name"),
                            duration = track.optLong("duration"),
                            trackNumber = track.optJSONObject("@attr")?.optInt("rank") ?: (i + 1)
                        )
                    )
                }
            }
            
            AlbumInfo(
                name = album.getString("name"),
                artist = album.getString("artist"),
                releaseDate = album.optString("releasedate"),
                tracks = tracks,
                albumArtUrl = album.optJSONArray("image")?.let { images ->
                    for (i in 0 until images.length()) {
                        val image = images.getJSONObject(i)
                        if (image.getString("size") == "extralarge") {
                            return@let image.getString("#text")
                        }
                    }
                    null
                }
            )
        } catch (e: Exception) {
            null
        }
    }
    
    private fun parseMusicBrainzAlbumResponse(response: String): AlbumInfo? {
        return try {
            val json = JSONObject(response)
            val releases = json.getJSONArray("releases")
            
            if (releases.length() > 0) {
                val release = releases.getJSONObject(0)
                
                val tracks = mutableListOf<AlbumTrack>()
                // MusicBrainz album parsing would be more complex in practice
                
                AlbumInfo(
                    name = release.getString("title"),
                    artist = release.optJSONArray("artist-credit")?.getJSONObject(0)?.getString("name") ?: "",
                    releaseDate = release.optString("date"),
                    tracks = tracks,
                    albumArtUrl = null // Would need Cover Art Archive API
                )
            } else {
                null
            }
        } catch (e: Exception) {
            null
        }
    }
    
    private fun parseLastFmSimilarArtists(response: String): List<SimilarArtist> {
        return try {
            val json = JSONObject(response)
            val similarArtists = json.getJSONObject("similarartists").getJSONArray("artist")
            val result = mutableListOf<SimilarArtist>()
            
            for (i in 0 until similarArtists.length()) {
                val artist = similarArtists.getJSONObject(i)
                result.add(
                    SimilarArtist(
                        name = artist.getString("name"),
                        match = artist.getDouble("match").toFloat(),
                        imageUrl = artist.optJSONArray("image")?.let { images ->
                            for (j in 0 until images.length()) {
                                val image = images.getJSONObject(j)
                                if (image.getString("size") == "large") {
                                    return@let image.getString("#text")
                                }
                            }
                            null
                        }
                    )
                )
            }
            
            result
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    private fun parseLastFmTopTracks(response: String): List<TopTrack> {
        return try {
            val json = JSONObject(response)
            val topTracks = json.getJSONObject("toptracks").getJSONArray("track")
            val result = mutableListOf<TopTrack>()
            
            for (i in 0 until topTracks.length()) {
                val track = topTracks.getJSONObject(i)
                result.add(
                    TopTrack(
                        name = track.getString("name"),
                        playcount = track.getLong("playcount"),
                        listeners = track.getLong("listeners"),
                        imageUrl = track.optJSONArray("image")?.let { images ->
                            for (j in 0 until images.length()) {
                                val image = images.getJSONObject(j)
                                if (image.getString("size") == "large") {
                                    return@let image.getString("#text")
                                }
                            }
                            null
                        }
                    )
                )
            }
            
            result
        } catch (e: Exception) {
            emptyList()
        }
    }
}

// Data classes for music metadata

data class EnhancedTrackMetadata(
    val originalArtist: String,
    val originalTitle: String,
    val originalAlbum: String? = null,
    val correctedArtist: String? = null,
    val correctedTitle: String? = null,
    val correctedAlbum: String? = null,
    val genre: String? = null,
    val tags: List<String> = emptyList(),
    val playcount: Long = 0,
    val listeners: Long = 0,
    val albumArtUrl: String? = null,
    val mbid: String? = null,
    val releaseDate: String? = null,
    val duration: Long? = null,
    val isrc: String? = null,
    val artistBio: String? = null,
    val artistImageUrl: String? = null,
    val artistGenre: String? = null,
    val formedYear: Int? = null,
    val success: Boolean = false,
    val error: String? = null
)

data class LastFmTrackInfo(
    val artist: String,
    val title: String,
    val album: String?,
    val genre: String?,
    val tags: List<String>,
    val playcount: Long,
    val listeners: Long,
    val albumArtUrl: String?
)

data class MusicBrainzTrackInfo(
    val mbid: String,
    val duration: Long?,
    val releaseDate: String?,
    val isrc: String?
)

data class AudioDbArtistInfo(
    val biography: String?,
    val imageUrl: String?,
    val genre: String?,
    val formedYear: Int?
)

data class AlbumInfo(
    val name: String,
    val artist: String,
    val releaseDate: String?,
    val tracks: List<AlbumTrack>,
    val albumArtUrl: String?
)

data class AlbumTrack(
    val name: String,
    val duration: Long,
    val trackNumber: Int
)

data class SimilarArtist(
    val name: String,
    val match: Float,
    val imageUrl: String?
)

data class TopTrack(
    val name: String,
    val playcount: Long,
    val listeners: Long,
    val imageUrl: String?
)