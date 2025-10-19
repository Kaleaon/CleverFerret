package com.universalmedialibrary.audio

import android.media.MediaMetadataRetriever
import java.io.File

/**
 * Audio specifications and format detection
 * Supports hi-res audio detection and quality indicators
 */
data class AudioSpecs(
    val codec: String,
    val sampleRate: Int,
    val bitDepth: Int?,
    val bitrate: Int?,
    val channels: Int,
    val isLossless: Boolean,
    val isDSD: Boolean = false,
    val duration: Long = 0L
) {
    val isHiRes: Boolean
        get() = (sampleRate > 48000 || (bitDepth ?: 16) > 16) && isLossless
    
    val qualityLabel: String
        get() = when {
            isDSD -> "DSD"
            sampleRate >= 192000 -> "Studio Master"
            sampleRate >= 96000 -> "Hi-Res"
            sampleRate >= 88000 -> "Hi-Res"
            isLossless && sampleRate >= 44100 -> "Lossless"
            else -> "Standard"
        }
    
    val displayFormat: String
        get() = when {
            isDSD -> "DSD${sampleRate / 44100}"
            bitDepth != null && sampleRate > 0 -> "$bitDepth/${sampleRate / 1000}"
            else -> codec
        }
    
    val isStudioQuality: Boolean
        get() = sampleRate >= 192000 && (bitDepth ?: 0) >= 24
}

/**
 * Audio format detector
 * Identifies codec, sample rate, bit depth, and quality
 */
object AudioFormatDetector {
    
    private val losslessExtensions = setOf(
        "flac", "alac", "ape", "wav", "aiff", "aif", "dsd", "dsf", "dff",
        "wv", "tta", "tak"
    )
    
    private val dsdExtensions = setOf("dsd", "dsf", "dff")
    
    fun detectFormat(file: File): AudioSpecs? {
        return try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(file.absolutePath)
            
            val mimeType = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_MIMETYPE)
            val codec = when {
                mimeType?.contains("flac") == true -> "FLAC"
                mimeType?.contains("alac") == true -> "ALAC"
                mimeType?.contains("mpeg") == true -> "MP3"
                mimeType?.contains("mp4") == true || mimeType?.contains("aac") == true -> "AAC"
                mimeType?.contains("ogg") == true -> "Vorbis"
                mimeType?.contains("opus") == true -> "Opus"
                mimeType?.contains("wav") == true -> "WAV"
                file.extension.lowercase() in dsdExtensions -> "DSD"
                else -> mimeType ?: file.extension.uppercase()
            }
            
            val sampleRate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_SAMPLERATE)?.toIntOrNull() ?: 44100
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE)?.toIntOrNull()
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull() ?: 0L
            
            // Estimate bit depth based on bitrate and sample rate for lossless
            val bitDepth = when {
                file.extension.lowercase() in losslessExtensions -> estimateBitDepth(bitrate, sampleRate, 2)
                else -> null
            }
            
            val channels = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_NUM_TRACKS)?.toIntOrNull() ?: 2
            
            retriever.release()
            
            AudioSpecs(
                codec = codec,
                sampleRate = sampleRate,
                bitDepth = bitDepth,
                bitrate = bitrate,
                channels = channels,
                isLossless = file.extension.lowercase() in losslessExtensions,
                isDSD = file.extension.lowercase() in dsdExtensions,
                duration = duration
            )
        } catch (e: Exception) {
            null
        }
    }
    
    private fun estimateBitDepth(bitrate: Int?, sampleRate: Int, channels: Int): Int? {
        if (bitrate == null || bitrate == 0) return null
        
        // Bitrate = SampleRate * BitDepth * Channels
        // BitDepth = Bitrate / (SampleRate * Channels)
        val estimatedBitDepth = bitrate / (sampleRate * channels)
        
        return when {
            estimatedBitDepth >= 24 -> 24
            estimatedBitDepth >= 20 -> 24
            estimatedBitDepth >= 16 -> 16
            else -> 16
        }
    }
    
    fun getQualityBadgeColor(specs: AudioSpecs): Long {
        return when {
            specs.isDSD -> 0xFFD4AF37 // Gold for DSD
            specs.isStudioQuality -> 0xFFFF6B6B // Red for Studio Master
            specs.isHiRes -> 0xFF4ECDC4 // Teal for Hi-Res
            specs.isLossless -> 0xFF95E1D3 // Light teal for Lossless
            else -> 0xFF95A5A6 // Gray for standard
        }
    }
}
