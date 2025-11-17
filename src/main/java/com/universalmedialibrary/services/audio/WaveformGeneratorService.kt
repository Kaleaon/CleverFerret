package com.universalmedialibrary.services.audio

import android.media.MediaExtractor
import android.media.MediaFormat
import com.universalmedialibrary.data.local.dao.AudioWaveformDao
import com.universalmedialibrary.data.local.entity.AudioWaveform
import com.universalmedialibrary.data.local.entity.WaveformQuality
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.util.zip.GZIPOutputStream
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.max

/**
 * Service for generating and managing audio waveforms
 * Inspired by FDWaveformView's waveform rendering
 */
@Singleton
class WaveformGeneratorService @Inject constructor(
    private val waveformDao: AudioWaveformDao
) {
    
    /**
     * Generate waveform data for an audio file
     */
    suspend fun generateWaveform(
        itemId: Long,
        audioPath: String,
        quality: WaveformQuality = WaveformQuality.MEDIUM
    ): Result<AudioWaveform> = withContext(Dispatchers.IO) {
        try {
            val extractor = MediaExtractor()
            extractor.setDataSource(audioPath)
            
            // Find audio track
            var audioTrackIndex = -1
            var audioFormat: MediaFormat? = null
            
            for (i in 0 until extractor.trackCount) {
                val format = extractor.getTrackFormat(i)
                val mime = format.getString(MediaFormat.KEY_MIME) ?: continue
                
                if (mime.startsWith("audio/")) {
                    audioTrackIndex = i
                    audioFormat = format
                    break
                }
            }
            
            if (audioTrackIndex == -1 || audioFormat == null) {
                return@withContext Result.failure(Exception("No audio track found"))
            }
            
              extractor.selectTrack(audioTrackIndex)

              // Extract audio properties
              val sampleRate = audioFormat.getInteger(MediaFormat.KEY_SAMPLE_RATE)
              val channelCount = audioFormat.getInteger(MediaFormat.KEY_CHANNEL_COUNT)
              val duration = audioFormat.getLong(MediaFormat.KEY_DURATION)

              // Generate samples based on quality
              val samplesPerSecond = when (quality) {
                  WaveformQuality.LOW -> 10
                  WaveformQuality.MEDIUM -> 20
                  WaveformQuality.HIGH -> 50
                  WaveformQuality.ULTRA -> 100
              }

              val totalSamples = ((duration / 1_000_000) * samplesPerSecond).toInt()
              val samples = extractAudioSamples(
                  extractor = extractor,
                  targetSampleCount = totalSamples,
                  channelCount = channelCount,
                  durationUs = duration
              )

              // Compress sample data
              val compressedData = compressSamples(samples)

              val waveform = AudioWaveform(
                  itemId = itemId,
                  sampleData = compressedData,
                  totalSamples = samples.size,
                  sampleRate = sampleRate,
                  channels = channelCount,
                  duration = duration / 1000, // Convert to milliseconds
                  renderQuality = quality
              )

              waveformDao.insertWaveform(waveform)
              extractor.release()

              Result.success(waveform)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Extract audio samples from media file
     */
    private fun extractAudioSamples(
        extractor: MediaExtractor,
        targetSampleCount: Int,
        channelCount: Int,
        durationUs: Long
    ): FloatArray {
        val samples = FloatArray(targetSampleCount)
        val buffer = ByteBuffer.allocate(256 * 1024)
        var sampleIndex = 0
        var maxAmplitude = 0f

        val effectiveTargetCount = targetSampleCount.takeIf { it > 0 } ?: 1
        val durationMs = durationUs / 1000L
        val samplesPerBucket = if (durationMs > 0L && effectiveTargetCount > 0) {
            val bucketSize = durationMs / effectiveTargetCount
            max(1, bucketSize.coerceAtMost(Int.MAX_VALUE.toLong()).toInt())
        } else {
            1
        }
        var currentBucket = mutableListOf<Float>()

        while (extractor.readSampleData(buffer, 0) >= 0 && sampleIndex < targetSampleCount) {
            buffer.rewind()

            // Calculate RMS amplitude for this buffer
            var sum = 0.0
            var count = 0

            while (buffer.hasRemaining()) {
                val sample = buffer.short.toFloat() / Short.MAX_VALUE
                sum += sample * sample
                count++
            }

            val rms = if (count > 0) kotlin.math.sqrt(sum / count).toFloat() else 0f
            currentBucket.add(rms)

            if (currentBucket.size >= samplesPerBucket) {
                val average = currentBucket.average().toFloat()
                samples[sampleIndex] = average
                maxAmplitude = max(maxAmplitude, average)
                currentBucket.clear()
                sampleIndex++
            }

            extractor.advance()
            buffer.clear()
        }

        // Normalize samples
        if (maxAmplitude > 0) {
            for (i in samples.indices) {
                samples[i] = samples[i] / maxAmplitude
            }
        }

        return samples
    }
    
    /**
     * Compress sample data using GZIP
     */
    private fun compressSamples(samples: FloatArray): ByteArray {
        val byteStream = ByteArrayOutputStream()
        val gzipStream = GZIPOutputStream(byteStream)
        
        // Convert floats to bytes (4 bytes per float)
        val buffer = ByteBuffer.allocate(samples.size * 4)
        samples.forEach { buffer.putFloat(it) }
        
        gzipStream.write(buffer.array())
        gzipStream.close()
        
        return byteStream.toByteArray()
    }
    
    /**
     * Get waveform for an item
     */
    suspend fun getWaveform(itemId: Long): AudioWaveform? {
        return waveformDao.getWaveformByItemId(itemId)
    }
    
    /**
     * Delete waveform for an item
     */
    suspend fun deleteWaveform(itemId: Long) {
        waveformDao.deleteWaveformByItemId(itemId)
    }
    
    /**
     * Clean up old waveforms
     */
    suspend fun cleanupOldWaveforms(daysOld: Int = 30) {
        val timestamp = System.currentTimeMillis() - (daysOld * 24 * 60 * 60 * 1000L)
        waveformDao.deleteOldWaveforms(timestamp)
    }
}

/**
 * Waveform rendering data for UI
 */
data class WaveformRenderData(
    val samples: FloatArray,
    val totalSamples: Int,
    val duration: Long,
    val sampleRate: Int
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as WaveformRenderData

        if (!samples.contentEquals(other.samples)) return false
        if (totalSamples != other.totalSamples) return false
        if (duration != other.duration) return false
        if (sampleRate != other.sampleRate) return false

        return true
    }

    override fun hashCode(): Int {
        var result = samples.contentHashCode()
        result = 31 * result + totalSamples
        result = 31 * result + duration.hashCode()
        result = 31 * result + sampleRate
        return result
    }
}