package com.universalmedialibrary.services.audiobook

import android.content.Context
import android.media.MediaMetadataRetriever
import com.universalmedialibrary.data.local.dao.AudiobookDao
import com.universalmedialibrary.data.local.entity.AudiobookEntity
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.time.Duration.Companion.milliseconds

/**
 * Service for managing audiobooks
 */
@Singleton
class AudiobookService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val audiobookDao: AudiobookDao
) {
    
    /**
     * Import audiobook from file
     */
    suspend fun importAudiobook(filePath: String): Result<AudiobookEntity> = 
        withContext(Dispatchers.IO) {
            try {
                val file = File(filePath)
                if (!file.exists()) {
                    return@withContext Result.failure(
                        Exception("File not found: $filePath")
                    )
                }
                
                val metadata = extractMetadata(filePath)
                val coverPath = metadata.coverArt?.let { 
                    saveCoverArt(it, metadata.title)
                }
                
                val entity = AudiobookEntity(
                    id = UUID.randomUUID().toString(),
                    filePath = filePath,
                    title = metadata.title,
                    author = metadata.author,
                    narrator = metadata.narrator,
                    description = metadata.description,
                    genre = metadata.genre,
                    publisher = metadata.publisher,
                    publishDate = metadata.publishDate,
                    duration = metadata.duration.inWholeSeconds,
                    bitrate = metadata.bitrate,
                    sampleRate = metadata.sampleRate,
                    codec = metadata.codec,
                    coverPath = coverPath,
                    chapterCount = metadata.chapters.size,
                    chapters = metadata.chapters,
                    language = metadata.language,
                    dateAdded = System.currentTimeMillis(),
                    lastPlayedPosition = 0,
                    isFinished = false
                )
                
                audiobookDao.insert(entity)
                Result.success(entity)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    /**
     * Extract metadata from audiobook file
     */
    private suspend fun extractMetadata(filePath: String): AudiobookMetadata = 
        withContext(Dispatchers.IO) {
            val retriever = MediaMetadataRetriever()
            
            try {
                retriever.setDataSource(filePath)
                
                val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
                    ?: File(filePath).nameWithoutExtension
                val author = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_AUTHOR)
                val narrator = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
                // METADATA_KEY_COMMENT is used for description/comments in audio files
                val description = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_COMMENT)
                val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE)
                val date = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE)
                val durationMs = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
                    ?.toLongOrNull() ?: 0L
                val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)
                    ?.toIntOrNull()
                val coverArt = retriever.embeddedPicture
                
                val chapters = extractChapters(filePath, durationMs)
                
                AudiobookMetadata(
                    title = title,
                    author = author,
                    narrator = narrator,
                    description = description,
                    genre = genre,
                    publisher = null,
                    publishDate = date,
                    duration = durationMs.milliseconds,
                    bitrate = bitrate,
                    sampleRate = null,
                    codec = null,
                    chapters = chapters,
                    coverArt = coverArt,
                    language = "en"
                )
            } finally {
                retriever.release()
            }
        }
    
    /**
     * Extract chapter information
     * Note: Android MediaMetadataRetriever doesn't support chapter extraction
     * This is a placeholder for potential future enhancement
     */
    private fun extractChapters(filePath: String, totalDurationMs: Long): List<AudioChapter> {
        // For now, return empty list
        // Could be enhanced with external library support
        return emptyList()
    }
    
    /**
     * Save cover art to storage
     */
    private suspend fun saveCoverArt(coverArt: ByteArray, title: String): String = 
        withContext(Dispatchers.IO) {
            val coversDir = File(context.filesDir, "audiobook_covers")
            coversDir.mkdirs()
            
            val sanitizedTitle = title.replace(Regex("[^a-zA-Z0-9.-]"), "_")
                .take(50)
            val coverFile = File(coversDir, "$sanitizedTitle.jpg")
            
            coverFile.writeBytes(coverArt)
            coverFile.absolutePath
        }
    
    /**
     * Update playback position
     */
    suspend fun updatePosition(audiobookId: String, positionSeconds: Long) {
        withContext(Dispatchers.IO) {
            audiobookDao.updatePosition(audiobookId, positionSeconds)
        }
    }
    
    /**
     * Mark audiobook as finished
     */
    suspend fun markFinished(audiobookId: String, finished: Boolean = true) {
        withContext(Dispatchers.IO) {
            audiobookDao.updateFinished(audiobookId, finished)
        }
    }
    
    /**
     * Delete audiobook
     */
    suspend fun deleteAudiobook(audiobookId: String) {
        withContext(Dispatchers.IO) {
            val audiobook = audiobookDao.getById(audiobookId)
            audiobook?.let {
                // Delete cover file if exists
                it.coverPath?.let { path ->
                    File(path).delete()
                }
                // Delete from database
                audiobookDao.delete(it)
            }
        }
    }
}
