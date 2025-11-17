package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * AudioWaveform entity - stores waveform data for audio visualization.
 */
@Serializable
@Entity(
    tableName = "audio_waveforms",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index(value = ["itemId"], unique = true)]
)
data class AudioWaveform(
    @PrimaryKey(autoGenerate = true)
    val waveformId: Long = 0,

    val itemId: Long,

    // Waveform Data
    val sampleData: ByteArray,
    val totalSamples: Int,
    val sampleRate: Int,
    val channels: Int,

    // Audio Properties
    val duration: Long,
    val bitDepth: Int = 16,

    // Rendering Configuration
    val zoomLevel: Float = 1.0f,
    val renderQuality: WaveformQuality = WaveformQuality.MEDIUM,

    // Cache Information
    val generatedAt: Long = System.currentTimeMillis(),
    val fileHash: String? = null,
    val version: Int = 1
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as AudioWaveform

        if (waveformId != other.waveformId) return false
        if (itemId != other.itemId) return false
        if (!sampleData.contentEquals(other.sampleData)) return false
        if (totalSamples != other.totalSamples) return false

        return true
    }

    override fun hashCode(): Int {
        var result = waveformId.hashCode()
        result = 31 * result + itemId.hashCode()
        result = 31 * result + sampleData.contentHashCode()
        result = 31 * result + totalSamples
        return result
    }
}

enum class WaveformQuality {
    LOW,
    MEDIUM,
    HIGH,
    ULTRA
}

/**
 * Waveform rendering settings.
 */
@Serializable
data class WaveformRenderSettings(
    val waveColor: Int = 0xFF2196F3.toInt(),
    val progressColor: Int = 0xFF4CAF50.toInt(),
    val backgroundColor: Int = 0xFF000000.toInt(),
    val lineWidth: Float = 2.0f,
    val antiAlias: Boolean = true,
    val showProgress: Boolean = true,
    val allowScrubbing: Boolean = true,
    val allowZoom: Boolean = true,
    val allowScroll: Boolean = true
)
