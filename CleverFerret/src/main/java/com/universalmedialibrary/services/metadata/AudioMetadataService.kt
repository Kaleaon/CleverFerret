package com.universalmedialibrary.services.metadata

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Audio metadata service for reading embedded tags and fetching online metadata.
 * 
 * Architecture inspired by:
 * - Metadator (https://github.com/BobbyESP/Metadator) - ID3 metadata editor
 * - TagLib wrapper (https://github.com/Kyant0/taglib) - Native audio tag reading
 * - MusicBrainz API - Comprehensive music metadata database
 * 
 * Supports reading:
 * - Embedded ID3v1/ID3v2 tags (MP3)
 * - Vorbis comments (FLAC, OGG)
 * - MP4/M4A atoms
 * - APE tags
 * 
 * Online sources:
 * - MusicBrainz (primary - open database)
 * - Cover Art Archive (album artwork)
 * - AcoustID (audio fingerprinting - future)
 */
@Singleton
class AudioMetadataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "AudioMetadataService"
        
        // MusicBrainz API endpoints
        private const val MUSICBRAINZ_BASE = "https://musicbrainz.org/ws/2"
        private const val MUSICBRAINZ_RECORDING_SEARCH = "$MUSICBRAINZ_BASE/recording"
        private const val MUSICBRAINZ_RELEASE_SEARCH = "$MUSICBRAINZ_BASE/release"
        private const val MUSICBRAINZ_ARTIST_SEARCH = "$MUSICBRAINZ_BASE/artist"
        
        // Cover Art Archive
        private const val COVER_ART_ARCHIVE = "https://coverartarchive.org/release"
        
        // User agent required by MusicBrainz
        private const val USER_AGENT = "CleverFerret/1.0 (Android; Universal Media Library)"
        
        // Rate limiting (MusicBrainz requires max 1 req/sec)
        private const val REQUEST_DELAY_MS = 1100L
        
        private const val TIMEOUT = 15000
        
        // Common audio tag keys (ID3v2 / Vorbis / MP4)
        object TagKeys {
            const val TITLE = "TITLE"
            const val ARTIST = "ARTIST"
            const val ALBUM = "ALBUM"
            const val ALBUM_ARTIST = "ALBUMARTIST"
            const val TRACK_NUMBER = "TRACKNUMBER"
            const val DISC_NUMBER = "DISCNUMBER"
            const val YEAR = "DATE"
            const val GENRE = "GENRE"
            const val COMPOSER = "COMPOSER"
            const val COMMENT = "COMMENT"
            const val LYRICS = "LYRICS"
            const val BPM = "BPM"
            const val ISRC = "ISRC"
            const val MUSICBRAINZ_TRACK_ID = "MUSICBRAINZ_TRACKID"
            const val MUSICBRAINZ_ALBUM_ID = "MUSICBRAINZ_ALBUMID"
            const val MUSICBRAINZ_ARTIST_ID = "MUSICBRAINZ_ARTISTID"
            const val MUSICBRAINZ_RELEASE_GROUP_ID = "MUSICBRAINZ_RELEASEGROUPID"
        }
    }
    
    private var lastRequestTime = 0L
    
    /**
     * Read embedded metadata from an audio file using Android's MediaMetadataRetriever.
     * This is a fallback when TagLib is not available.
     */
    suspend fun readEmbeddedMetadata(uri: Uri): AudioMetadata? = withContext(Dispatchers.IO) {
        val retriever = MediaMetadataRetriever()
        try {
            retriever.setDataSource(context, uri)
            
            val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
            val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
            val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
            val albumArtist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
            val trackNumber = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)
            val discNumber = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER)
            val year = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR)
            val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE)
            val composer = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_COMPOSER)
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull()
            val sampleRate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_SAMPLERATE)?.toIntOrNull()
            val mimeType = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_MIMETYPE)
            
            // Extract embedded album art
            val embeddedArt = retriever.embeddedPicture
            
            AudioMetadata(
                title = title,
                artist = artist,
                album = album,
                albumArtist = albumArtist,
                trackNumber = parseTrackNumber(trackNumber),
                discNumber = parseTrackNumber(discNumber),
                year = year?.toIntOrNull(),
                genre = genre,
                composer = composer,
                duration = duration,
                bitrate = bitrate,
                sampleRate = sampleRate,
                mimeType = mimeType,
                embeddedArtwork = embeddedArt,
                source = AudioMetadataSource.EMBEDDED
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error reading embedded metadata", e)
            null
        } finally {
            try {
                retriever.release()
            } catch (e: Exception) {
                Log.w(TAG, "Error releasing MediaMetadataRetriever", e)
            }
        }
    }
    
    /**
     * Fetch metadata from MusicBrainz by searching for recording (track).
     * Uses indexed search: recording:{title} AND artist:{artist}
     */
    suspend fun fetchFromMusicBrainz(
        title: String? = null,
        artist: String? = null,
        album: String? = null,
        isrc: String? = null,
        musicBrainzId: String? = null
    ): AudioMetadata? = withContext(Dispatchers.IO) {
        // If we have a MusicBrainz ID, do a direct lookup
        if (!musicBrainzId.isNullOrBlank()) {
            return@withContext lookupRecordingById(musicBrainzId)
        }
        
        // If we have ISRC, search by that (most accurate)
        if (!isrc.isNullOrBlank()) {
            val result = searchRecordingByIsrc(isrc)
            if (result != null) return@withContext result
        }
        
        // Search by title and artist
        if (!title.isNullOrBlank()) {
            return@withContext searchRecording(title, artist, album)
        }
        
        null
    }
    
    /**
     * Search MusicBrainz for a recording by title and artist.
     */
    private suspend fun searchRecording(
        title: String,
        artist: String?,
        album: String?
    ): AudioMetadata? = withContext(Dispatchers.IO) {
        try {
            enforceRateLimit()
            
            // Build Lucene-style query
            val queryParts = mutableListOf<String>()
            queryParts.add("recording:\"${escapeLucene(title)}\"")
            
            if (!artist.isNullOrBlank()) {
                queryParts.add("artist:\"${escapeLucene(artist)}\"")
            }
            if (!album.isNullOrBlank()) {
                queryParts.add("release:\"${escapeLucene(album)}\"")
            }
            
            val query = queryParts.joinToString(" AND ")
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val url = "$MUSICBRAINZ_RECORDING_SEARCH?query=$encodedQuery&limit=5&fmt=json"
            
            val response = makeHttpRequest(url)
            if (response != null) {
                return@withContext parseMusicBrainzRecordingSearch(response)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching MusicBrainz", e)
        }
        null
    }
    
    /**
     * Search by ISRC (International Standard Recording Code).
     */
    private suspend fun searchRecordingByIsrc(isrc: String): AudioMetadata? = withContext(Dispatchers.IO) {
        try {
            enforceRateLimit()
            
            val url = "$MUSICBRAINZ_RECORDING_SEARCH?query=isrc:$isrc&limit=1&fmt=json"
            val response = makeHttpRequest(url)
            
            if (response != null) {
                return@withContext parseMusicBrainzRecordingSearch(response)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching by ISRC", e)
        }
        null
    }
    
    /**
     * Direct lookup of a recording by MusicBrainz ID.
     */
    private suspend fun lookupRecordingById(mbid: String): AudioMetadata? = withContext(Dispatchers.IO) {
        try {
            enforceRateLimit()
            
            val url = "$MUSICBRAINZ_BASE/recording/$mbid?inc=artists+releases+isrcs+tags&fmt=json"
            val response = makeHttpRequest(url)
            
            if (response != null) {
                return@withContext parseMusicBrainzRecordingLookup(response)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error looking up recording by ID", e)
        }
        null
    }
    
    /**
     * Fetch album artwork from Cover Art Archive.
     */
    suspend fun fetchAlbumArtwork(releaseId: String): ByteArray? = withContext(Dispatchers.IO) {
        try {
            enforceRateLimit()
            
            // First, get the cover art info
            val infoUrl = "$COVER_ART_ARCHIVE/$releaseId"
            val infoResponse = makeHttpRequest(infoUrl)
            
            if (infoResponse != null) {
                val jsonObject = JSONObject(infoResponse)
                val images = jsonObject.optJSONArray("images")
                
                if (images != null && images.length() > 0) {
                    // Get the front cover (or first image)
                    for (i in 0 until images.length()) {
                        val image = images.getJSONObject(i)
                        if (image.optBoolean("front", false)) {
                            val imageUrl = image.optString("image")
                            if (imageUrl.isNotBlank()) {
                                return@withContext downloadImage(imageUrl)
                            }
                        }
                    }
                    
                    // Fallback to first image
                    val firstImage = images.getJSONObject(0)
                    val imageUrl = firstImage.optString("image")
                    if (imageUrl.isNotBlank()) {
                        return@withContext downloadImage(imageUrl)
                    }
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error fetching album artwork", e)
        }
        null
    }
    
    /**
     * Search for an album/release by title and artist.
     */
    suspend fun searchAlbum(
        albumTitle: String,
        artist: String?
    ): AlbumMetadata? = withContext(Dispatchers.IO) {
        try {
            enforceRateLimit()
            
            val queryParts = mutableListOf<String>()
            queryParts.add("release:\"${escapeLucene(albumTitle)}\"")
            
            if (!artist.isNullOrBlank()) {
                queryParts.add("artist:\"${escapeLucene(artist)}\"")
            }
            
            val query = queryParts.joinToString(" AND ")
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val url = "$MUSICBRAINZ_RELEASE_SEARCH?query=$encodedQuery&limit=5&fmt=json"
            
            val response = makeHttpRequest(url)
            if (response != null) {
                return@withContext parseMusicBrainzReleaseSearch(response)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error searching album", e)
        }
        null
    }
    
    /**
     * Auto-tag an audio file by combining embedded metadata with online lookup.
     */
    suspend fun autoTag(uri: Uri): AudioMetadata? = withContext(Dispatchers.IO) {
        // First, read embedded metadata
        val embedded = readEmbeddedMetadata(uri)
        
        if (embedded == null) {
            Log.w(TAG, "Could not read embedded metadata")
            return@withContext null
        }
        
        // If we have enough embedded data, try to enhance with MusicBrainz
        val mbResult = fetchFromMusicBrainz(
            title = embedded.title,
            artist = embedded.artist,
            album = embedded.album,
            isrc = embedded.isrc,
            musicBrainzId = embedded.musicBrainzRecordingId
        )
        
        // Merge results, preferring MusicBrainz for missing fields
        if (mbResult != null) {
            return@withContext mergeMetadata(embedded, mbResult)
        }
        
        embedded
    }
    
    /**
     * Batch fetch metadata for multiple files.
     */
    suspend fun batchAutoTag(uris: List<Uri>): List<Pair<Uri, AudioMetadata?>> = withContext(Dispatchers.IO) {
        uris.map { uri ->
            val metadata = autoTag(uri)
            uri to metadata
        }
    }
    
    private fun parseMusicBrainzRecordingSearch(response: String): AudioMetadata? {
        try {
            val jsonObject = JSONObject(response)
            val recordings = jsonObject.optJSONArray("recordings")
            
            if (recordings != null && recordings.length() > 0) {
                val recording = recordings.getJSONObject(0)
                return parseRecordingObject(recording)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing MusicBrainz response", e)
        }
        return null
    }
    
    private fun parseMusicBrainzRecordingLookup(response: String): AudioMetadata? {
        try {
            val recording = JSONObject(response)
            return parseRecordingObject(recording)
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing MusicBrainz lookup response", e)
        }
        return null
    }
    
    private fun parseRecordingObject(recording: JSONObject): AudioMetadata {
        val id = recording.optString("id")
        val title = recording.optString("title")
        val length = recording.optLong("length", 0) // in milliseconds
        
        // Artists
        val artistCredit = recording.optJSONArray("artist-credit")
        val artists = mutableListOf<String>()
        var primaryArtistId: String? = null
        
        if (artistCredit != null) {
            for (i in 0 until artistCredit.length()) {
                val credit = artistCredit.getJSONObject(i)
                val artist = credit.optJSONObject("artist")
                if (artist != null) {
                    artists.add(artist.optString("name"))
                    if (primaryArtistId == null) {
                        primaryArtistId = artist.optString("id")
                    }
                }
            }
        }
        
        // Releases (albums)
        val releases = recording.optJSONArray("releases")
        var albumTitle: String? = null
        var albumId: String? = null
        var releaseYear: Int? = null
        var trackNumber: Int? = null
        
        if (releases != null && releases.length() > 0) {
            val release = releases.getJSONObject(0)
            albumTitle = release.optString("title")
            albumId = release.optString("id")
            
            val date = release.optString("date")
            if (date.isNotBlank()) {
                releaseYear = date.take(4).toIntOrNull()
            }
            
            // Track number from medium
            val media = release.optJSONArray("media")
            if (media != null && media.length() > 0) {
                val medium = media.getJSONObject(0)
                val tracks = medium.optJSONArray("track")
                if (tracks != null && tracks.length() > 0) {
                    val track = tracks.getJSONObject(0)
                    trackNumber = track.optInt("number", 0).takeIf { it > 0 }
                }
            }
        }
        
        // ISRCs
        val isrcs = recording.optJSONArray("isrcs")
        val isrc = if (isrcs != null && isrcs.length() > 0) isrcs.getString(0) else null
        
        // Tags (genres)
        val tags = recording.optJSONArray("tags")
        val genres = mutableListOf<String>()
        if (tags != null) {
            for (i in 0 until minOf(tags.length(), 5)) {
                val tag = tags.getJSONObject(i)
                genres.add(tag.optString("name"))
            }
        }
        
        return AudioMetadata(
            title = title,
            artist = artists.joinToString(", "),
            album = albumTitle,
            albumArtist = artists.firstOrNull(),
            trackNumber = trackNumber,
            year = releaseYear,
            genre = genres.firstOrNull(),
            duration = length,
            isrc = isrc,
            musicBrainzRecordingId = id,
            musicBrainzReleaseId = albumId,
            musicBrainzArtistId = primaryArtistId,
            genres = genres,
            source = AudioMetadataSource.MUSICBRAINZ
        )
    }
    
    private fun parseMusicBrainzReleaseSearch(response: String): AlbumMetadata? {
        try {
            val jsonObject = JSONObject(response)
            val releases = jsonObject.optJSONArray("releases")
            
            if (releases != null && releases.length() > 0) {
                val release = releases.getJSONObject(0)
                
                val id = release.optString("id")
                val title = release.optString("title")
                val date = release.optString("date")
                val country = release.optString("country")
                val trackCount = release.optInt("track-count", 0)
                
                // Artists
                val artistCredit = release.optJSONArray("artist-credit")
                val artists = mutableListOf<String>()
                
                if (artistCredit != null) {
                    for (i in 0 until artistCredit.length()) {
                        val credit = artistCredit.getJSONObject(i)
                        val artist = credit.optJSONObject("artist")
                        if (artist != null) {
                            artists.add(artist.optString("name"))
                        }
                    }
                }
                
                return AlbumMetadata(
                    title = title,
                    artist = artists.joinToString(", "),
                    releaseDate = date,
                    country = country,
                    trackCount = trackCount,
                    musicBrainzReleaseId = id,
                    coverArtUrl = if (id.isNotBlank()) "$COVER_ART_ARCHIVE/$id/front" else null
                )
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing release search", e)
        }
        return null
    }
    
    private fun mergeMetadata(embedded: AudioMetadata, online: AudioMetadata): AudioMetadata {
        return AudioMetadata(
            title = embedded.title ?: online.title,
            artist = embedded.artist ?: online.artist,
            album = embedded.album ?: online.album,
            albumArtist = embedded.albumArtist ?: online.albumArtist,
            trackNumber = embedded.trackNumber ?: online.trackNumber,
            discNumber = embedded.discNumber ?: online.discNumber,
            year = embedded.year ?: online.year,
            genre = embedded.genre ?: online.genre,
            composer = embedded.composer ?: online.composer,
            duration = embedded.duration ?: online.duration,
            bitrate = embedded.bitrate,
            sampleRate = embedded.sampleRate,
            mimeType = embedded.mimeType,
            embeddedArtwork = embedded.embeddedArtwork,
            isrc = embedded.isrc ?: online.isrc,
            musicBrainzRecordingId = embedded.musicBrainzRecordingId ?: online.musicBrainzRecordingId,
            musicBrainzReleaseId = embedded.musicBrainzReleaseId ?: online.musicBrainzReleaseId,
            musicBrainzArtistId = embedded.musicBrainzArtistId ?: online.musicBrainzArtistId,
            genres = (embedded.genres + online.genres).distinct(),
            source = AudioMetadataSource.MERGED
        )
    }
    
    private fun parseTrackNumber(value: String?): Int? {
        if (value.isNullOrBlank()) return null
        
        // Handle "1/12" format
        val parts = value.split("/")
        return parts.firstOrNull()?.trim()?.toIntOrNull()
    }
    
    private fun escapeLucene(input: String): String {
        val specialChars = listOf('+', '-', '&', '|', '!', '(', ')', '{', '}', '[', ']', '^', '"', '~', '*', '?', ':', '\\', '/')
        var result = input
        specialChars.forEach { char ->
            result = result.replace(char.toString(), "\\$char")
        }
        return result
    }
    
    private suspend fun enforceRateLimit() {
        val now = System.currentTimeMillis()
        val elapsed = now - lastRequestTime
        if (elapsed < REQUEST_DELAY_MS) {
            kotlinx.coroutines.delay(REQUEST_DELAY_MS - elapsed)
        }
        lastRequestTime = System.currentTimeMillis()
    }
    
    private fun makeHttpRequest(urlString: String): String? {
        var connection: HttpURLConnection? = null
        try {
            val url = URL(urlString)
            connection = url.openConnection() as HttpURLConnection
            connection.requestMethod = "GET"
            connection.connectTimeout = TIMEOUT
            connection.readTimeout = TIMEOUT
            connection.setRequestProperty("User-Agent", USER_AGENT)
            connection.setRequestProperty("Accept", "application/json")
            
            if (connection.responseCode == HttpURLConnection.HTTP_OK) {
                val reader = BufferedReader(InputStreamReader(connection.inputStream))
                val response = reader.readText()
                reader.close()
                return response
            }
        } catch (e: Exception) {
            Log.e(TAG, "HTTP request failed: $urlString", e)
        } finally {
            connection?.disconnect()
        }
        return null
    }
    
    private fun downloadImage(urlString: String): ByteArray? {
        var connection: HttpURLConnection? = null
        try {
            val url = URL(urlString)
            connection = url.openConnection() as HttpURLConnection
            connection.requestMethod = "GET"
            connection.connectTimeout = TIMEOUT
            connection.readTimeout = TIMEOUT
            connection.setRequestProperty("User-Agent", USER_AGENT)
            
            if (connection.responseCode == HttpURLConnection.HTTP_OK) {
                return connection.inputStream.readBytes()
            }
        } catch (e: Exception) {
            Log.e(TAG, "Image download failed: $urlString", e)
        } finally {
            connection?.disconnect()
        }
        return null
    }
}

/**
 * Audio metadata data class
 */
data class AudioMetadata(
    val title: String?,
    val artist: String?,
    val album: String?,
    val albumArtist: String? = null,
    val trackNumber: Int? = null,
    val discNumber: Int? = null,
    val year: Int? = null,
    val genre: String? = null,
    val composer: String? = null,
    val duration: Long? = null,
    val bitrate: Int? = null,
    val sampleRate: Int? = null,
    val mimeType: String? = null,
    val embeddedArtwork: ByteArray? = null,
    val isrc: String? = null,
    val musicBrainzRecordingId: String? = null,
    val musicBrainzReleaseId: String? = null,
    val musicBrainzArtistId: String? = null,
    val genres: List<String> = emptyList(),
    val source: AudioMetadataSource = AudioMetadataSource.UNKNOWN
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as AudioMetadata
        return title == other.title && artist == other.artist && album == other.album
    }

    override fun hashCode(): Int {
        var result = title?.hashCode() ?: 0
        result = 31 * result + (artist?.hashCode() ?: 0)
        result = 31 * result + (album?.hashCode() ?: 0)
        return result
    }
}

/**
 * Album metadata data class
 */
data class AlbumMetadata(
    val title: String,
    val artist: String?,
    val releaseDate: String?,
    val country: String?,
    val trackCount: Int,
    val musicBrainzReleaseId: String?,
    val coverArtUrl: String?
)

enum class AudioMetadataSource {
    EMBEDDED,
    MUSICBRAINZ,
    MERGED,
    UNKNOWN
}
