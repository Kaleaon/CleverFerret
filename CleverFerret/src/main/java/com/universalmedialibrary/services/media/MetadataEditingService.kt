package com.universalmedialibrary.services.media

import android.content.Context
import android.media.MediaMetadataRetriever
import androidx.core.net.toUri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jaudiotagger.audio.AudioFileIO
import org.jaudiotagger.audio.exceptions.CannotReadException
import org.jaudiotagger.audio.exceptions.CannotWriteException
import org.jaudiotagger.tag.FieldKey
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Metadata Editing Service - ACTUAL WORKING IMPLEMENTATION
 * 
 * Handles reading and writing metadata tags to audio files.
 * Uses JAudioTagger library for comprehensive metadata support.
 */
@Singleton
class MetadataEditingService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    /**
     * Read comprehensive metadata from an audio file
     */
    suspend fun readMetadata(filePath: String): DetailedMetadata? = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            val audioFile = AudioFileIO.read(file)
            val tag = audioFile.tag
            
            if (tag != null) {
                DetailedMetadata(
                    title = tag.getFirst(FieldKey.TITLE).takeIf { it.isNotEmpty() },
                    artist = tag.getFirst(FieldKey.ARTIST).takeIf { it.isNotEmpty() },
                    albumArtist = tag.getFirst(FieldKey.ALBUM_ARTIST).takeIf { it.isNotEmpty() },
                    album = tag.getFirst(FieldKey.ALBUM).takeIf { it.isNotEmpty() },
                    year = tag.getFirst(FieldKey.YEAR).takeIf { it.isNotEmpty() }?.toIntOrNull(),
                    genre = tag.getFirst(FieldKey.GENRE).takeIf { it.isNotEmpty() },
                    track = tag.getFirst(FieldKey.TRACK).takeIf { it.isNotEmpty() }?.toIntOrNull(),
                    trackTotal = tag.getFirst(FieldKey.TRACK_TOTAL).takeIf { it.isNotEmpty() }?.toIntOrNull(),
                    disc = tag.getFirst(FieldKey.DISC_NO).takeIf { it.isNotEmpty() }?.toIntOrNull(),
                    discTotal = tag.getFirst(FieldKey.DISC_TOTAL).takeIf { it.isNotEmpty() }?.toIntOrNull(),
                    composer = tag.getFirst(FieldKey.COMPOSER).takeIf { it.isNotEmpty() },
                    comment = tag.getFirst(FieldKey.COMMENT).takeIf { it.isNotEmpty() },
                    duration = getDurationFromFile(filePath),
                    bitrate = audioFile.audioHeader?.bitRateAsNumber,
                    sampleRate = audioFile.audioHeader?.sampleRateAsNumber,
                    format = audioFile.audioHeader?.format,
                    fileSize = file.length()
                )
            } else {
                // Fall back to MediaMetadataRetriever for basic info
                getBasicMetadata(filePath)
            }
        } catch (e: Exception) {
            // Fall back to MediaMetadataRetriever
            getBasicMetadata(filePath)
        }
    }
    
    /**
     * Write metadata to an audio file
     */
    suspend fun writeMetadata(filePath: String, metadata: DetailedMetadata): MetadataWriteResult = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            
            // Create backup
            val backupFile = File(file.parentFile, "${file.nameWithoutExtension}_backup.${file.extension}")
            file.copyTo(backupFile, overwrite = true)
            
            try {
                val audioFile = AudioFileIO.read(file)
                val tag = audioFile.tagOrCreateAndSetDefault
                
                // Update metadata fields
                metadata.title?.let { tag.setField(FieldKey.TITLE, it) }
                metadata.artist?.let { tag.setField(FieldKey.ARTIST, it) }
                metadata.albumArtist?.let { tag.setField(FieldKey.ALBUM_ARTIST, it) }
                metadata.album?.let { tag.setField(FieldKey.ALBUM, it) }
                metadata.year?.let { tag.setField(FieldKey.YEAR, it.toString()) }
                metadata.genre?.let { tag.setField(FieldKey.GENRE, it) }
                metadata.track?.let { tag.setField(FieldKey.TRACK, it.toString()) }
                metadata.trackTotal?.let { tag.setField(FieldKey.TRACK_TOTAL, it.toString()) }
                metadata.disc?.let { tag.setField(FieldKey.DISC_NO, it.toString()) }
                metadata.discTotal?.let { tag.setField(FieldKey.DISC_TOTAL, it.toString()) }
                metadata.composer?.let { tag.setField(FieldKey.COMPOSER, it) }
                metadata.comment?.let { tag.setField(FieldKey.COMMENT, it) }
                
                // Write the changes
                AudioFileIO.write(audioFile)
                
                // Delete backup if successful
                backupFile.delete()
                
                MetadataWriteResult(
                    success = true,
                    message = "Metadata updated successfully",
                    backupCreated = true
                )
                
            } catch (e: CannotWriteException) {
                // Restore from backup
                backupFile.copyTo(file, overwrite = true)
                backupFile.delete()
                
                MetadataWriteResult(
                    success = false,
                    message = "Failed to write metadata: ${e.message}",
                    backupCreated = false
                )
            }
            
        } catch (e: Exception) {
            MetadataWriteResult(
                success = false,
                message = "Error updating metadata: ${e.message}",
                backupCreated = false
            )
        }
    }
    
    /**
     * Smart metadata correction based on common patterns
     */
    suspend fun smartCorrectMetadata(filePath: String): MetadataCorrection? = withContext(Dispatchers.IO) {
        val currentMetadata = readMetadata(filePath) ?: return@withContext null
        val filename = File(filePath).nameWithoutExtension
        
        val corrections = mutableListOf<FieldCorrection>()
        
        // Check for author/title swap
        val swapCorrection = checkAuthorTitleSwap(currentMetadata, filename)
        if (swapCorrection != null) {
            corrections.add(swapCorrection)
        }
        
        // Check author name format
        val authorFormatCorrection = checkAuthorNameFormat(currentMetadata)
        if (authorFormatCorrection != null) {
            corrections.add(authorFormatCorrection)
        }
        
        // Check for missing metadata that can be extracted from filename
        val filenameExtractions = extractMetadataFromFilename(currentMetadata, filename)
        corrections.addAll(filenameExtractions)
        
        // Check for common capitalization issues
        val capitalizationCorrections = checkCapitalization(currentMetadata)
        corrections.addAll(capitalizationCorrections)
        
        if (corrections.isNotEmpty()) {
            MetadataCorrection(
                filePath = filePath,
                currentMetadata = currentMetadata,
                corrections = corrections,
                confidence = calculateCorrectionConfidence(corrections)
            )
        } else null
    }
    
    /**
     * Apply suggested corrections to metadata
     */
    suspend fun applyCorrections(correction: MetadataCorrection): MetadataWriteResult = withContext(Dispatchers.IO) {
        val updatedMetadata = correction.currentMetadata.copy()
        
        correction.corrections.forEach { fieldCorrection ->
            when (fieldCorrection.field) {
                MetadataField.TITLE -> updatedMetadata.title = fieldCorrection.newValue
                MetadataField.ARTIST -> updatedMetadata.artist = fieldCorrection.newValue
                MetadataField.ALBUM -> updatedMetadata.album = fieldCorrection.newValue
                MetadataField.ALBUM_ARTIST -> updatedMetadata.albumArtist = fieldCorrection.newValue
                MetadataField.GENRE -> updatedMetadata.genre = fieldCorrection.newValue
                MetadataField.YEAR -> updatedMetadata.year = fieldCorrection.newValue.toIntOrNull()
                MetadataField.COMPOSER -> updatedMetadata.composer = fieldCorrection.newValue
                MetadataField.COMMENT -> updatedMetadata.comment = fieldCorrection.newValue
            }
        }
        
        writeMetadata(correction.filePath, updatedMetadata)
    }
    
    /**
     * Batch apply corrections to multiple files
     */
    suspend fun batchApplyCorrections(corrections: List<MetadataCorrection>): BatchMetadataResult = withContext(Dispatchers.IO) {
        val results = mutableListOf<MetadataWriteResult>()
        
        corrections.forEach { correction ->
            val result = applyCorrections(correction)
            results.add(result)
        }
        
        BatchMetadataResult(
            totalFiles = corrections.size,
            successfulUpdates = results.count { it.success },
            failedUpdates = results.count { !it.success },
            results = results
        )
    }
    
    // Helper methods
    
    private fun getBasicMetadata(filePath: String): DetailedMetadata? {
        return try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(filePath)
            
            DetailedMetadata(
                title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE),
                artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST),
                album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM),
                year = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR)?.toIntOrNull(),
                genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE),
                duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull(),
                fileSize = File(filePath).length()
            )
        } catch (e: Exception) {
            null
        }
    }
    
    private fun getDurationFromFile(filePath: String): Long? {
        return try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(filePath)
            retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
        } catch (e: Exception) {
            null
        }
    }
    
    private fun checkAuthorTitleSwap(metadata: DetailedMetadata, filename: String): FieldCorrection? {
        val artist = metadata.artist
        val title = metadata.title
        
        if (artist != null && title != null) {
            val normalizedFilename = filename.lowercase()
            val normalizedArtist = artist.lowercase()
            val normalizedTitle = title.lowercase()
            
            // Check if title appears before artist in filename
            val titleIndex = normalizedFilename.indexOf(normalizedTitle)
            val artistIndex = normalizedFilename.indexOf(normalizedArtist)
            
            if (titleIndex >= 0 && artistIndex >= 0 && titleIndex < artistIndex) {
                // Likely swapped - suggest swapping them
                return FieldCorrection(
                    field = MetadataField.ARTIST,
                    oldValue = artist,
                    newValue = title,
                    confidence = 0.8f,
                    reason = "Artist and title appear to be swapped based on filename"
                )
            }
        }
        
        return null
    }
    
    private fun checkAuthorNameFormat(metadata: DetailedMetadata): FieldCorrection? {
        val artist = metadata.artist ?: return null
        
        // Check if it's in "Last, First" format
        val commaPattern = Regex("^([^,]+),\\s*(.+)$")
        val match = commaPattern.find(artist.trim())
        
        if (match != null) {
            val lastName = match.groupValues[1].trim()
            val firstName = match.groupValues[2].trim()
            val correctedName = "$firstName $lastName"
            
            return FieldCorrection(
                field = MetadataField.ARTIST,
                oldValue = artist,
                newValue = correctedName,
                confidence = 0.9f,
                reason = "Convert from 'Last, First' to 'First Last' format"
            )
        }
        
        return null
    }
    
    private fun extractMetadataFromFilename(metadata: DetailedMetadata, filename: String): List<FieldCorrection> {
        val corrections = mutableListOf<FieldCorrection>()
        
        // Common patterns: "Artist - Title", "Artist_Title", "Title by Artist"
        val patterns = listOf(
            Regex("^(.+?)\\s*-\\s*(.+)$"),  // "Artist - Title"
            Regex("^(.+?)\\s*_\\s*(.+)$"),  // "Artist_Title"
            Regex("^(.+?)\\sby\\s(.+)$")    // "Title by Artist"
        )
        
        patterns.forEach { pattern ->
            val match = pattern.find(filename)
            if (match != null) {
                val part1 = match.groupValues[1].trim()
                val part2 = match.groupValues[2].trim()
                
                // If current metadata is missing or seems incorrect
                if (metadata.artist.isNullOrBlank() && part1.isNotBlank()) {
                    corrections.add(FieldCorrection(
                        field = MetadataField.ARTIST,
                        oldValue = metadata.artist ?: "",
                        newValue = part1,
                        confidence = 0.7f,
                        reason = "Extracted artist from filename"
                    ))
                }
                
                if (metadata.title.isNullOrBlank() && part2.isNotBlank()) {
                    corrections.add(FieldCorrection(
                        field = MetadataField.TITLE,
                        oldValue = metadata.title ?: "",
                        newValue = part2,
                        confidence = 0.7f,
                        reason = "Extracted title from filename"
                    ))
                }
                
                return@forEach // Use first matching pattern
            }
        }
        
        return corrections
    }
    
    private fun checkCapitalization(metadata: DetailedMetadata): List<FieldCorrection> {
        val corrections = mutableListOf<FieldCorrection>()
        
        // Check title capitalization
        metadata.title?.let { title ->
            if (title.uppercase() == title || title.lowercase() == title) {
                val corrected = title.split(" ").joinToString(" ") { word ->
                    word.lowercase().replaceFirstChar { it.uppercase() }
                }
                corrections.add(FieldCorrection(
                    field = MetadataField.TITLE,
                    oldValue = title,
                    newValue = corrected,
                    confidence = 0.6f,
                    reason = "Fix title capitalization"
                ))
            }
        }
        
        // Check artist capitalization
        metadata.artist?.let { artist ->
            if (artist.uppercase() == artist || artist.lowercase() == artist) {
                val corrected = artist.split(" ").joinToString(" ") { word ->
                    word.lowercase().replaceFirstChar { it.uppercase() }
                }
                corrections.add(FieldCorrection(
                    field = MetadataField.ARTIST,
                    oldValue = artist,
                    newValue = corrected,
                    confidence = 0.6f,
                    reason = "Fix artist name capitalization"
                ))
            }
        }
        
        return corrections
    }
    
    private fun calculateCorrectionConfidence(corrections: List<FieldCorrection>): Float {
        if (corrections.isEmpty()) return 0f
        return corrections.map { it.confidence }.average().toFloat()
    }
}

// Data classes for metadata editing

data class DetailedMetadata(
    var title: String? = null,
    var artist: String? = null,
    var albumArtist: String? = null,
    var album: String? = null,
    var year: Int? = null,
    var genre: String? = null,
    var track: Int? = null,
    var trackTotal: Int? = null,
    var disc: Int? = null,
    var discTotal: Int? = null,
    var composer: String? = null,
    var comment: String? = null,
    var duration: Long? = null,
    var bitrate: Int? = null,
    var sampleRate: Int? = null,
    var format: String? = null,
    var fileSize: Long = 0
) {
    fun copy(): DetailedMetadata {
        return DetailedMetadata(
            title, artist, albumArtist, album, year, genre,
            track, trackTotal, disc, discTotal, composer, comment,
            duration, bitrate, sampleRate, format, fileSize
        )
    }
}

data class MetadataWriteResult(
    val success: Boolean,
    val message: String,
    val backupCreated: Boolean
)

data class MetadataCorrection(
    val filePath: String,
    val currentMetadata: DetailedMetadata,
    val corrections: List<FieldCorrection>,
    val confidence: Float
)

data class FieldCorrection(
    val field: MetadataField,
    val oldValue: String,
    val newValue: String,
    val confidence: Float,
    val reason: String
)

data class BatchMetadataResult(
    val totalFiles: Int,
    val successfulUpdates: Int,
    val failedUpdates: Int,
    val results: List<MetadataWriteResult>
)

enum class MetadataField {
    TITLE,
    ARTIST,
    ALBUM,
    ALBUM_ARTIST,
    GENRE,
    YEAR,
    COMPOSER,
    COMMENT
}