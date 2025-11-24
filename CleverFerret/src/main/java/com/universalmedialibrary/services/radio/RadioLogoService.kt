package com.universalmedialibrary.services.radio

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.local.entity.RadioStation
import com.universalmedialibrary.utils.ErrorLogger
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import java.net.URL
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service to fetch and manage radio station logos.
 * 
 * Features:
 * - Fetches logos from Radio-Browser.info (via RadioStation entity)
 * - Caches logos locally
 * - Fallback to genre-based icons if no logo available
 */
@Singleton
class RadioLogoService @Inject constructor(
    private val radioBrowserService: RadioBrowserService,
    private val radioStationDao: RadioStationDao,
    private val okHttpClient: OkHttpClient
) {

    /**
     * Ensure a station has a valid logo.
     * If missing, tries to fetch from Radio Browser API or download the URL in entity.
     */
    suspend fun ensureStationLogo(station: RadioStation, cacheDir: File): String? = withContext(Dispatchers.IO) {
        // 1. Check if we already have a local cached file
        val localFileName = "radio_logo_${station.id}.png"
        val localFile = File(cacheDir, localFileName)
        if (localFile.exists()) {
            return@withContext localFile.absolutePath
        }

        // 2. If we have a remote URL, download it
        if (!station.logoUrl.isNullOrBlank()) {
            return@withContext downloadLogo(station.logoUrl, localFile)
        }

        // 3. If no URL, try to find the station in Radio Browser to get a logo
        try {
            val results = radioBrowserService.searchStations(station.name, limit = 1)
            val match = results.firstOrNull()
            if (match?.logoUrl != null) {
                // Update DB with new URL
                radioStationDao.updateStation(station.copy(logoUrl = match.logoUrl))
                // Download
                return@withContext downloadLogo(match.logoUrl, localFile)
            }
        } catch (e: Exception) {
            ErrorLogger.logWarning("RadioLogoService", "Failed to find logo for ${station.name}", e)
        }

        return@withContext null
    }

    private fun downloadLogo(url: String, targetFile: File): String? {
        return try {
            val request = Request.Builder().url(url).build()
            okHttpClient.newCall(request).execute().use { response ->
                if (response.isSuccessful) {
                    response.body?.byteStream()?.use { input ->
                        FileOutputStream(targetFile).use { output ->
                            input.copyTo(output)
                        }
                    }
                    targetFile.absolutePath
                } else {
                    null
                }
            }
        } catch (e: Exception) {
            ErrorLogger.logError("RadioLogoService", "Failed to download logo from $url", e)
            null
        }
    }
}
