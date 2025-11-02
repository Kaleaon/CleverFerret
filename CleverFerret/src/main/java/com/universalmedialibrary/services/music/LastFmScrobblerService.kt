package com.universalmedialibrary.services.music

import android.util.Log
import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.net.URLEncoder
import java.security.MessageDigest
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.io.encoding.Base64
import kotlin.io.encoding.ExperimentalEncodingApi

/**
 * Last.fm Scrobbler Service
 * 
 * Scrobbles tracks to Last.fm for music tracking and recommendations.
 * Features:
 * - "Now Playing" notifications
 * - Track scrobbling when 50% played or 4 minutes (whichever comes first)
 * - Offline queue for failed scrobbles
 * - Session management with API authentication
 */
@Singleton
class LastFmScrobblerService @Inject constructor(
    private val apiKeyRepository: APIKeyRepository
) {
    
    private val TAG = "LastFmScrobbler"
    private val API_ROOT = "https://ws.audioscrobbler.com/2.0/"
    
    private val _state = MutableStateFlow(ScrobblerState())
    val state: StateFlow<ScrobblerState> = _state.asStateFlow()
    
    private val offlineQueue = mutableListOf<ScrobbleData>()
    
    /**
     * Initialize Last.fm session
     * @return true if session is valid/created
     */
    suspend fun initialize(): Boolean = withContext(Dispatchers.IO) {
        try {
            val apiKey = apiKeyRepository.getLastFmApiKey()
            val sessionKey = apiKeyRepository.getLastFmSessionKey()
            
            if (apiKey.isNullOrBlank()) {
                _state.value = _state.value.copy(
                    isEnabled = false,
                    error = "Last.fm API key not configured"
                )
                return@withContext false
            }
            
            _state.value = _state.value.copy(
                isEnabled = true,
                hasSessionKey = !sessionKey.isNullOrBlank(),
                apiKey = apiKey,
                sessionKey = sessionKey
            )
            
            true
        } catch (e: Exception) {
            Log.e(TAG, "Failed to initialize Last.fm", e)
            _state.value = _state.value.copy(
                isEnabled = false,
                error = e.message
            )
            false
        }
    }
    
    /**
     * Update "Now Playing" status on Last.fm
     */
    suspend fun updateNowPlaying(
        artist: String,
        track: String,
        album: String? = null,
        duration: Long? = null
    ): Boolean = withContext(Dispatchers.IO) {
        if (!_state.value.isEnabled || _state.value.sessionKey == null) {
            Log.d(TAG, "Last.fm not enabled or no session key")
            return@withContext false
        }
        
        try {
            val params = mutableMapOf(
                "method" to "track.updateNowPlaying",
                "artist" to artist,
                "track" to track,
                "api_key" to _state.value.apiKey,
                "sk" to _state.value.sessionKey!!
            )
            
            album?.let { params["album"] = it }
            duration?.let { params["duration"] = (it / 1000).toString() }
            
            val response = makeApiCall(params)
            
            _state.value = _state.value.copy(
                nowPlaying = NowPlayingInfo(artist, track, album),
                lastScrobbleTime = System.currentTimeMillis()
            )
            
            true
        } catch (e: Exception) {
            Log.e(TAG, "Failed to update now playing", e)
            _state.value = _state.value.copy(error = e.message)
            false
        }
    }
    
    /**
     * Scrobble a track to Last.fm
     * Should be called when track has been played for 50% of duration or 4 minutes
     */
    suspend fun scrobble(
        artist: String,
        track: String,
        timestamp: Long = System.currentTimeMillis() / 1000,
        album: String? = null,
        duration: Long? = null
    ): Boolean = withContext(Dispatchers.IO) {
        if (!_state.value.isEnabled || _state.value.sessionKey == null) {
            // Add to offline queue
            offlineQueue.add(ScrobbleData(artist, track, timestamp, album, duration))
            return@withContext false
        }
        
        try {
            val params = mutableMapOf(
                "method" to "track.scrobble",
                "artist" to artist,
                "track" to track,
                "timestamp" to timestamp.toString(),
                "api_key" to _state.value.apiKey,
                "sk" to _state.value.sessionKey!!
            )
            
            album?.let { params["album"] = it }
            duration?.let { params["duration"] = (it / 1000).toString() }
            
            val response = makeApiCall(params)
            
            _state.value = _state.value.copy(
                scrobbleCount = _state.value.scrobbleCount + 1,
                lastScrobbleTime = System.currentTimeMillis()
            )
            
            // Try to flush offline queue
            if (offlineQueue.isNotEmpty()) {
                flushOfflineQueue()
            }
            
            true
        } catch (e: Exception) {
            Log.e(TAG, "Failed to scrobble track", e)
            // Add to offline queue for retry
            offlineQueue.add(ScrobbleData(artist, track, timestamp, album, duration))
            _state.value = _state.value.copy(error = e.message)
            false
        }
    }
    
    /**
     * Attempt to flush offline scrobble queue
     */
    private suspend fun flushOfflineQueue() {
        val iterator = offlineQueue.iterator()
        while (iterator.hasNext()) {
            val data = iterator.next()
            val success = scrobble(
                artist = data.artist,
                track = data.track,
                timestamp = data.timestamp,
                album = data.album,
                duration = data.duration
            )
            if (success) {
                iterator.remove()
            } else {
                // Stop trying if one fails
                break
            }
        }
    }
    
    /**
     * Get authentication URL for user to authorize the app
     */
    fun getAuthUrl(): String {
        val apiKey = _state.value.apiKey
        return "https://www.last.fm/api/auth/?api_key=$apiKey&cb=cleverferret://lastfm/callback"
    }
    
    /**
     * Make authenticated API call to Last.fm
     */
    @OptIn(ExperimentalEncodingApi::class)
    private suspend fun makeApiCall(params: Map<String, String>): String {
        val secret = apiKeyRepository.getLastFmSecret() ?: throw Exception("Last.fm secret not configured")
        
        // Generate API signature
        val signature = generateSignature(params, secret)
        val finalParams = params.toMutableMap()
        finalParams["api_sig"] = signature
        finalParams["format"] = "json"
        
        // Build POST body
        val postData = finalParams.map { "${it.key}=${URLEncoder.encode(it.value, "UTF-8")}" }
            .joinToString("&")
        
        // Make HTTP POST request (simplified - would use OkHttp or similar in production)
        val url = java.net.URL(API_ROOT)
        val connection = url.openConnection() as java.net.HttpURLConnection
        
        try {
            connection.requestMethod = "POST"
            connection.doOutput = true
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
            
            connection.outputStream.use { os ->
                os.write(postData.toByteArray())
            }
            
            val response = connection.inputStream.bufferedReader().use { it.readText() }
            
            if (connection.responseCode != 200) {
                throw Exception("Last.fm API error: ${connection.responseCode}")
            }
            
            return response
        } finally {
            connection.disconnect()
        }
    }
    
    /**
     * Generate API signature for Last.fm authentication
     */
    private fun generateSignature(params: Map<String, String>, secret: String): String {
        // Sort parameters alphabetically and concatenate
        val sorted = params.toSortedMap()
        val concatenated = sorted.map { "${it.key}${it.value}" }.joinToString("") + secret
        
        // MD5 hash
        val md = MessageDigest.getInstance("MD5")
        val digest = md.digest(concatenated.toByteArray())
        return digest.joinToString("") { "%02x".format(it) }
    }
    
    /**
     * Enable/disable scrobbling
     */
    fun setEnabled(enabled: Boolean) {
        _state.value = _state.value.copy(isEnabled = enabled)
    }
    
    /**
     * Get offline queue size
     */
    fun getOfflineQueueSize(): Int = offlineQueue.size
}

/**
 * Scrobbler state
 */
data class ScrobblerState(
    val isEnabled: Boolean = false,
    val hasSessionKey: Boolean = false,
    val apiKey: String = "",
    val sessionKey: String? = null,
    val nowPlaying: NowPlayingInfo? = null,
    val scrobbleCount: Int = 0,
    val lastScrobbleTime: Long = 0,
    val error: String? = null
)

/**
 * Now playing information
 */
data class NowPlayingInfo(
    val artist: String,
    val track: String,
    val album: String?
)

/**
 * Offline scrobble data
 */
data class ScrobbleData(
    val artist: String,
    val track: String,
    val timestamp: Long,
    val album: String?,
    val duration: Long?
)
