package com.universalmedialibrary.services.epub

import android.content.Context
import android.graphics.Bitmap
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Readium Audiobook Service
 * 
 * NOTE: Temporarily disabled.
 * Will be re-enabled in v1.1.0 after resolving API compatibility.
 * For standalone MP3/M4A/FLAC files, use AudioPlaybackManager.
 */
@Singleton
class ReadiumAudiobookService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ReadiumAudiobookService"

    fun isReadiumAudiobook(filePath: String): Boolean {
        val extension = File(filePath).extension.lowercase()
        return extension in listOf("audiobook", "lcpa")
    }

    suspend fun openPublication(audiobookPath: String) = null

    suspend fun extractMetadata(audiobookPath: String): AudiobookMetadata? = withContext(Dispatchers.IO) {
        Log.w(TAG, "Readium Audiobook temporarily disabled. Use AudioPlaybackManager.")
        null
    }

    suspend fun extractCover(audiobookPath: String): Bitmap? = withContext(Dispatchers.IO) {
        null
    }

    suspend fun extractChapters(audiobookPath: String): List<AudiobookChapter> = withContext(Dispatchers.IO) {
        emptyList()
    }

    suspend fun extractAudioFiles(publication: Any?): List<String> = emptyList()
}

data class AudiobookMetadata(
    val title: String,
    val authors: List<String> = emptyList(),
    val narrators: List<String> = emptyList(),
    val publisher: String? = null,
    val publishedDate: String? = null,
    val description: String? = null,
    val duration: Long? = null,
    val numberOfChapters: Int = 0,
    val language: String? = null,
    val identifier: String? = null
)

data class AudiobookChapter(
    val index: Int,
    val title: String,
    val href: String,
    val duration: Long? = null
)
