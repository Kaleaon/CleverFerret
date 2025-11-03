package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverter
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

/**
 * Entity representing an imported audio pack
 * Allows users to import custom ambient sounds via zip files
 */
@Entity(tableName = "audio_packs")
data class AudioPack(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val description: String = "",
    val sourceZipPath: String, // Original zip file path
    val extractedPath: String, // Where sounds were extracted (SD card or internal)
    val soundCount: Int = 0,
    val totalSizeMB: Int = 0,
    val importedAt: Long = System.currentTimeMillis(),
    val isEnabled: Boolean = true,
    val metadata: AudioPackMetadata = AudioPackMetadata()
)

/**
 * Metadata about the audio pack
 */
@Serializable
data class AudioPackMetadata(
    val author: String = "",
    val version: String = "",
    val license: String = "",
    val tags: List<String> = emptyList(),
    val category: String = "",
    val averageBitDepth: Int = 0,
    val averageSampleRate: Int = 0
)

/**
 * Entity linking audio pack to individual sounds
 */
@Entity(
    tableName = "audio_pack_sounds",
    primaryKeys = ["packId", "soundId"]
)
data class AudioPackSound(
    val packId: Long,
    val soundId: Long
)

/**
 * Imported audio file metadata
 */
data class ImportedAudioFile(
    val fileName: String,
    val filePath: String,
    val fileSizeMB: Float,
    val duration: Long, // in milliseconds
    val bitDepth: Int,
    val sampleRate: Int,
    val channels: Int,
    val format: String, // mp3, wav, ogg, etc.
    val detectedCategory: AmbientCategory? = null,
    val detectedType: AmbientSoundType? = null,
    val suggestedKeywords: List<String> = emptyList()
)

/**
 * Type converters for AudioPack metadata
 */
class AudioPackConverters {
    private val json = Json { ignoreUnknownKeys = true }

    @TypeConverter
    fun fromAudioPackMetadata(value: AudioPackMetadata): String {
        return json.encodeToString(value)
    }

    @TypeConverter
    fun toAudioPackMetadata(value: String): AudioPackMetadata {
        return json.decodeFromString(value)
    }
}
