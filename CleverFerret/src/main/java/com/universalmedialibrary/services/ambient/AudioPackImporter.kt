package com.universalmedialibrary.services.ambient

import android.content.Context
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.os.Environment
import com.universalmedialibrary.data.local.dao.AmbientSoundDao
import com.universalmedialibrary.data.local.dao.AudioPackDao
import com.universalmedialibrary.data.local.entity.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipInputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for importing and managing custom audio packs from zip files
 * Extracts to SD card if available, falls back to internal storage
 */
@Singleton
class AudioPackImporter @Inject constructor(
    @ApplicationContext private val context: Context,
    private val audioPackDao: AudioPackDao,
    private val ambientSoundDao: AmbientSoundDao
) {
    
    companion object {
        private const val AUDIO_PACKS_DIR = "AudioPacks"
        private val SUPPORTED_FORMATS = listOf("mp3", "wav", "ogg", "m4a", "aac", "flac")
    }
    
    /**
     * Import result with details
     */
    data class ImportResult(
        val success: Boolean,
        val packId: Long? = null,
        val soundsImported: Int = 0,
        val errors: List<String> = emptyList(),
        val message: String = ""
    )
    
    /**
     * Get the best storage location (SD card or internal)
     */
    private fun getBestStorageLocation(): File {
        // Try to use SD card first
        val externalDirs = context.getExternalFilesDirs(null)
        val sdCard = externalDirs.getOrNull(1) // Index 1 is usually SD card
        
        return if (sdCard != null && sdCard.exists() && sdCard.canWrite()) {
            File(sdCard, AUDIO_PACKS_DIR)
        } else {
            // Fallback to internal storage
            File(context.getExternalFilesDir(null), AUDIO_PACKS_DIR)
        }
    }
    
    /**
     * Import audio pack from zip file
     */
    suspend fun importAudioPack(
        zipUri: Uri,
        packName: String? = null,
        onProgress: (Int, String) -> Unit = { _, _ -> }
    ): ImportResult = withContext(Dispatchers.IO) {
        
        val errors = mutableListOf<String>()
        val importedFiles = mutableListOf<ImportedAudioFile>()
        
        try {
            // Determine storage location
            val storageDir = getBestStorageLocation()
            if (!storageDir.exists()) {
                storageDir.mkdirs()
            }
            
            onProgress(5, "Preparing storage...")
            
            // Create unique directory for this pack
            val packDir = File(storageDir, "pack_${System.currentTimeMillis()}")
            packDir.mkdirs()
            
            onProgress(10, "Counting audio files...")
            
            // First, count total supported audio files in the zip
            val totalFilesCount = context.contentResolver.openInputStream(zipUri)?.use { inputStream ->
                var count = 0
                ZipInputStream(inputStream).use { zipStream ->
                    var entry = zipStream.nextEntry
                    while (entry != null) {
                        if (!entry.isDirectory) {
                            val fileName = entry.name.substringAfterLast("/")
                            val fileExtension = fileName.substringAfterLast(".", "").lowercase()
                            if (fileExtension in SUPPORTED_FORMATS) {
                                count++
                            }
                        }
                        zipStream.closeEntry()
                        entry = zipStream.nextEntry
                    }
                }
                count
            } ?: 0
            
            onProgress(15, "Extracting $totalFilesCount audio files...")
            
            // Extract zip file
            context.contentResolver.openInputStream(zipUri)?.use { inputStream ->
                ZipInputStream(inputStream).use { zipStream ->
                    var entry = zipStream.nextEntry
                    var processedFiles = 0
                    
                    while (entry != null) {
                        if (!entry.isDirectory) {
                            val fileName = entry.name.substringAfterLast("/")
                            val fileExtension = fileName.substringAfterLast(".", "").lowercase()
                            
                            // Only extract supported audio files
                            if (fileExtension in SUPPORTED_FORMATS) {
                                val destFile = File(packDir, fileName)
                                
                                FileOutputStream(destFile).use { output ->
                                    zipStream.copyTo(output)
                                }
                                
                                processedFiles++
                                val progress = 15 + (processedFiles * 35 / maxOf(1, totalFilesCount))
                                onProgress(progress, "Extracting: $fileName ($processedFiles/$totalFilesCount)")
                                
                                // Extract metadata from audio file
                                try {
                                    val audioFile = extractAudioMetadata(destFile)
                                    importedFiles.add(audioFile)
                                } catch (e: Exception) {
                                    errors.add("Failed to read metadata for $fileName: ${e.message}")
                                }
                            }
                        }
                        zipStream.closeEntry()
                        entry = zipStream.nextEntry
                    }
                }
            }
            
            if (importedFiles.isEmpty()) {
                return@withContext ImportResult(
                    success = false,
                    message = "No supported audio files found in zip",
                    errors = errors
                )
            }
            
            onProgress(60, "Analyzing audio files...")
            
            // Calculate pack metadata
            val totalSize = importedFiles.sumOf { it.fileSizeMB.toInt() }
            val avgBitDepth = importedFiles.mapNotNull { if (it.bitDepth > 0) it.bitDepth else null }
                .average().toInt()
            val avgSampleRate = importedFiles.mapNotNull { if (it.sampleRate > 0) it.sampleRate else null }
                .average().toInt()
            
            // Detect pack metadata from filenames and content
            val detectedMetadata = detectPackMetadata(importedFiles)
            
            onProgress(70, "Creating ambient sounds...")
            
            // Create AudioPack entity
            val audioPack = AudioPack(
                name = packName ?: "Imported Pack ${System.currentTimeMillis()}",
                description = "Imported from zip file with ${importedFiles.size} sounds",
                sourceZipPath = zipUri.toString(),
                extractedPath = packDir.absolutePath,
                soundCount = importedFiles.size,
                totalSizeMB = totalSize,
                metadata = AudioPackMetadata(
                    category = detectedMetadata.category,
                    tags = detectedMetadata.tags,
                    averageBitDepth = avgBitDepth,
                    averageSampleRate = avgSampleRate
                )
            )
            
            val packId = audioPackDao.insertPack(audioPack)
            
            onProgress(80, "Creating sound entries...")
            
            // Create AmbientSound entries for each file
            val soundIds = mutableListOf<Long>()
            importedFiles.forEachIndexed { index, audioFile ->
                onProgress(80 + (index * 15 / importedFiles.size), 
                    "Processing: ${audioFile.fileName}")
                
                val ambientSound = AmbientSound(
                    name = audioFile.fileName.substringBeforeLast(".").replace("_", " "),
                    category = audioFile.detectedCategory ?: AmbientCategory.CUSTOM,
                    soundType = audioFile.detectedType ?: AmbientSoundType.CUSTOM,
                    audioResourcePath = audioFile.filePath,
                    description = "Imported from ${audioPack.name}",
                    keywords = audioFile.suggestedKeywords
                )
                
                val soundId = ambientSoundDao.insertSound(ambientSound)
                soundIds.add(soundId)
            }
            
            onProgress(95, "Linking sounds to pack...")
            
            // Link sounds to pack
            val packSounds = soundIds.map { soundId ->
                AudioPackSound(packId = packId, soundId = soundId)
            }
            audioPackDao.insertPackSounds(packSounds)
            
            onProgress(100, "Import complete!")
            
            ImportResult(
                success = true,
                packId = packId,
                soundsImported = importedFiles.size,
                errors = errors,
                message = "Successfully imported ${importedFiles.size} sounds"
            )
            
        } catch (e: Exception) {
            ImportResult(
                success = false,
                message = "Import failed: ${e.message}",
                errors = errors + e.message.orEmpty()
            )
        }
    }
    
    /**
     * Extract metadata from audio file
     */
    private fun extractAudioMetadata(file: File): ImportedAudioFile {
        val retriever = MediaMetadataRetriever()
        
        return try {
            retriever.setDataSource(file.absolutePath)
            
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
                ?.toLongOrNull() ?: 0L
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)
                ?.toIntOrNull() ?: 0
            val sampleRate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_SAMPLERATE)
                ?.toIntOrNull() ?: 0
            
            // Estimate bit depth from bitrate and sample rate
            val estimatedBitDepth = if (sampleRate > 0) {
                (bitrate / sampleRate / 2).coerceIn(8, 32)
            } else 16
            
            val fileName = file.name.lowercase()
            val detectedCategory = detectCategoryFromFilename(fileName)
            val detectedType = detectTypeFromFilename(fileName)
            val keywords = extractKeywordsFromFilename(fileName)
            
            ImportedAudioFile(
                fileName = file.name,
                filePath = file.absolutePath,
                fileSizeMB = file.length() / (1024f * 1024f),
                duration = duration,
                bitDepth = estimatedBitDepth,
                sampleRate = sampleRate,
                channels = 2, // Assume stereo
                format = file.extension.lowercase(),
                detectedCategory = detectedCategory,
                detectedType = detectedType,
                suggestedKeywords = keywords
            )
        } finally {
            retriever.release()
        }
    }
    
    /**
     * Detect category from filename
     */
    private fun detectCategoryFromFilename(fileName: String): AmbientCategory? {
        return when {
            fileName.contains("rain") || fileName.contains("thunder") || 
            fileName.contains("storm") || fileName.contains("snow") -> AmbientCategory.WEATHER
            
            fileName.contains("ocean") || fileName.contains("water") || 
            fileName.contains("river") || fileName.contains("wave") -> AmbientCategory.WATER
            
            fileName.contains("forest") || fileName.contains("bird") || 
            fileName.contains("nature") || fileName.contains("wind") -> AmbientCategory.NATURE
            
            fileName.contains("cafe") || fileName.contains("library") || 
            fileName.contains("fire") || fileName.contains("indoor") -> AmbientCategory.INDOOR
            
            fileName.contains("city") || fileName.contains("traffic") || 
            fileName.contains("crowd") || fileName.contains("urban") -> AmbientCategory.URBAN
            
            else -> null
        }
    }
    
    /**
     * Detect sound type from filename
     */
    private fun detectTypeFromFilename(fileName: String): AmbientSoundType? {
        return AmbientSoundType.values().find { type ->
            type.keywords.any { keyword -> fileName.contains(keyword) }
        }
    }
    
    /**
     * Extract keywords from filename
     */
    private fun extractKeywordsFromFilename(fileName: String): List<String> {
        // Remove extension and split by common separators
        val cleanName = fileName.substringBeforeLast(".")
        val words = cleanName.split(Regex("[_\\-\\s]+"))
            .map { it.lowercase() }
            .filter { it.length > 2 }
        
        return words.distinct()
    }
    
    /**
     * Detect pack metadata from files
     */
    private fun detectPackMetadata(files: List<ImportedAudioFile>): AudioPackMetadata {
        val categories = files.mapNotNull { it.detectedCategory }
        val dominantCategory = categories.groupingBy { it }.eachCount()
            .maxByOrNull { it.value }?.key?.name?.lowercase() ?: "custom"
        
        val allKeywords = files.flatMap { it.suggestedKeywords }.distinct()
        
        return AudioPackMetadata(
            category = dominantCategory,
            tags = allKeywords.take(10)
        )
    }
    
    /**
     * Delete an audio pack and its files
     */
    suspend fun deleteAudioPack(packId: Long): Boolean = withContext(Dispatchers.IO) {
        try {
            val pack = audioPackDao.getPackById(packId) ?: return@withContext false
            
            // Delete extracted files
            val packDir = File(pack.extractedPath)
            if (packDir.exists()) {
                packDir.deleteRecursively()
            }
            
            // Delete sound entries
            val soundIds = audioPackDao.getSoundIdsForPack(packId)
            soundIds.forEach { soundId ->
                val sound = ambientSoundDao.getSoundById(soundId)
                sound?.let { ambientSoundDao.deleteSound(it) }
            }
            
            // Delete pack-sound links
            audioPackDao.deletePackSounds(packId)
            
            // Delete pack
            audioPackDao.deletePack(pack)
            
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Get storage info
     */
    fun getStorageInfo(): StorageInfo {
        val storageDir = getBestStorageLocation()
        
        // Check if this is SD card by comparing against external dirs
        val externalDirs = context.getExternalFilesDirs(null)
        val isSDCard = externalDirs.size > 1 && 
                       externalDirs.getOrNull(1)?.let { storageDir.absolutePath.startsWith(it.absolutePath) } == true
        
        val totalSpace = storageDir.totalSpace / (1024 * 1024 * 1024) // GB
        val freeSpace = storageDir.freeSpace / (1024 * 1024 * 1024) // GB
        val usedSpace = totalSpace - freeSpace
        
        return StorageInfo(
            location = storageDir.absolutePath,
            isSDCard = isSDCard,
            totalSpaceGB = totalSpace,
            freeSpaceGB = freeSpace,
            usedSpaceGB = usedSpace
        )
    }
    
    data class StorageInfo(
        val location: String,
        val isSDCard: Boolean,
        val totalSpaceGB: Long,
        val freeSpaceGB: Long,
        val usedSpaceGB: Long
    )
}
