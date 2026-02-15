package com.universalmedialibrary.services.ambient

import android.content.Context
import com.universalmedialibrary.data.local.dao.AmbientSoundDao
import com.universalmedialibrary.data.local.entity.AmbientSound
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.core.logging.AppLogger

@Singleton
class AmbientSoundDownloader @Inject constructor(
    @ApplicationContext private val context: Context,
    private val okHttpClient: OkHttpClient,
    private val ambientSoundDao: AmbientSoundDao
) {
    /**
     * Downloads the audio file for the given sound and updates the database with the local path.
     * Returns true if successful or already downloaded.
     */
    suspend fun downloadSound(sound: AmbientSound): Boolean = withContext(Dispatchers.IO) {
        val url = sound.audioUrl
        if (url.isNullOrBlank()) return@withContext false
        
        // Create directory if not exists
        val soundsDir = File(context.filesDir, "ambient_sounds")
        if (!soundsDir.exists()) {
            soundsDir.mkdirs()
        }
        
        // Generate filename from URL or ID
        // Handle query parameters in URL if any
        val urlPath = url.substringBefore("?")
        val extension = urlPath.substringAfterLast(".", "mp3")
        val filename = "sound_${sound.id}.$extension"
        val file = File(soundsDir, filename)
        
        // Check if file already exists and is valid (simple check)
        if (file.exists() && file.length() > 0) {
             // Update DB if not already set
             if (sound.audioResourcePath != file.absolutePath) {
                 ambientSoundDao.updateSound(sound.copy(audioResourcePath = file.absolutePath))
             }
             return@withContext true
        }

        try {
            val request = Request.Builder().url(url).build()
            val response = okHttpClient.newCall(request).execute()
            
            if (!response.isSuccessful) {
                response.close()
                return@withContext false
            }
            
            response.body?.byteStream()?.use { input ->
                FileOutputStream(file).use { output ->
                    input.copyTo(output)
                }
            }
            
            // Update DB
            ambientSoundDao.updateSound(sound.copy(audioResourcePath = file.absolutePath))
            return@withContext true
        } catch (e: Exception) {
            AppLogger.error("AmbientSoundDownloader", "Unhandled exception", e)
            // Clean up partial file
            if (file.exists()) file.delete()
            return@withContext false
        }
    }
}
