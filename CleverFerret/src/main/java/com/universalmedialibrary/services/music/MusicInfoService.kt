package com.universalmedialibrary.services.music

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.net.URLEncoder
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.core.logging.AppLogger

@Singleton
class MusicInfoService @Inject constructor(
    private val okHttpClient: OkHttpClient
) {

    data class SongInfo(
        val artist: String,
        val title: String,
        val album: String? = null,
        val coverUrl: String? = null,
        val year: String? = null
    )

    suspend fun fetchSongInfo(query: String): SongInfo? = withContext(Dispatchers.IO) {
        try {
            // Use iTunes Search API - It's free, public, and returns high quality covers
            val encodedQuery = URLEncoder.encode(query, "UTF-8")
            val url = "https://itunes.apple.com/search?term=$encodedQuery&media=music&limit=1"
            
            val request = Request.Builder().url(url).build()
            val response = okHttpClient.newCall(request).execute()
            
            if (!response.isSuccessful) return@withContext null
            
            val jsonStr = response.body?.string() ?: return@withContext null
            val json = JSONObject(jsonStr)
            
            if (json.getInt("resultCount") == 0) return@withContext null
            
            val result = json.getJSONArray("results").getJSONObject(0)
            
            val artist = result.optString("artistName")
            val title = result.optString("trackName")
            val album = result.optString("collectionName")
            // Get high res artwork (default is 100x100)
            val coverUrl = result.optString("artworkUrl100").replace("100x100", "600x600")
            val year = result.optString("releaseDate").take(4)
            
            SongInfo(artist, title, album, coverUrl, year)
            
        } catch (e: Exception) {
            AppLogger.error("MusicInfoService", "Unhandled exception", e)
            null
        }
    }
}
