package com.universalmedialibrary.services.audio

import android.media.MediaCodec
import android.media.MediaExtractor
import android.media.MediaFormat
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.nio.ByteOrder
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt

@Singleton
class WaveformGenerator @Inject constructor() {

    suspend fun generate(
        file: File,
        durationMsHint: Long? = null,
        maxSamples: Int = DEFAULT_TARGET_SAMPLES,
        frameDurationMs: Int = DEFAULT_FRAME_DURATION_MS
    ): WaveformResult? = withContext(Dispatchers.IO) {
        if (!file.exists() || file.length() <= 0 || maxSamples <= 0) return@withContext null

        val extractor = MediaExtractor()
        try {
            extractor.setDataSource(file.absolutePath)
        } catch (_: Exception) {
            extractor.release()
            return@withContext null
        }

        val trackIndex = (0 until extractor.trackCount).firstOrNull { index ->
            val format = extractor.getTrackFormat(index)
            val mime = format.getString(MediaFormat.KEY_MIME) ?: return@firstOrNull false
            mime.startsWith("audio/")
        } ?: run {
            extractor.release()
            return@withContext null
        }

        extractor.selectTrack(trackIndex)
        val format = extractor.getTrackFormat(trackIndex)
        val mime = format.getString(MediaFormat.KEY_MIME) ?: run {
            extractor.release()
            return@withContext null
        }

        val sampleRate = if (format.containsKey(MediaFormat.KEY_SAMPLE_RATE)) {
            format.getInteger(MediaFormat.KEY_SAMPLE_RATE)
        } else DEFAULT_SAMPLE_RATE

        val channelCount = if (format.containsKey(MediaFormat.KEY_CHANNEL_COUNT)) {
            format.getInteger(MediaFormat.KEY_CHANNEL_COUNT)
        } else DEFAULT_CHANNEL_COUNT

        val durationUs = when {
            format.containsKey(MediaFormat.KEY_DURATION) -> format.getLong(MediaFormat.KEY_DURATION)
            durationMsHint != null -> durationMsHint * 1000
            else -> -1L
        }

        val codec = try {
            MediaCodec.createDecoderByType(mime)
        } catch (_: Exception) {
            extractor.release()
            return@withContext null
        }

        try {
            codec.configure(format, null, null, 0)
            codec.start()

            val bufferInfo = MediaCodec.BufferInfo()
            val amplitudes = ArrayList<Float>()
            val chunkSizeSamples = max(((sampleRate * frameDurationMs) / 1000) * channelCount, 1)
            var frameSampleCount = 0
            var accumulator = 0f

            var sawInputEos = false
            var sawOutputEos = false

            while (!sawOutputEos) {
                if (!sawInputEos) {
                    val inputIndex = codec.dequeueInputBuffer(DEQUEUE_TIMEOUT_US)
                    if (inputIndex >= 0) {
                        val inputBuffer = codec.getInputBuffer(inputIndex) ?: continue
                        val size = extractor.readSampleData(inputBuffer, 0)
                        if (size < 0) {
                            codec.queueInputBuffer(
                                inputIndex,
                                0,
                                0,
                                0,
                                MediaCodec.BUFFER_FLAG_END_OF_STREAM
                            )
                            sawInputEos = true
                        } else {
                            val presentationTimeUs = extractor.sampleTime
                            codec.queueInputBuffer(inputIndex, 0, size, presentationTimeUs, 0)
                            extractor.advance()
                        }
                    }
                }

                val outputIndex = codec.dequeueOutputBuffer(bufferInfo, DEQUEUE_TIMEOUT_US)
                when {
                    outputIndex >= 0 -> {
                        val outputBuffer = codec.getOutputBuffer(outputIndex) ?: break
                        outputBuffer.order(ByteOrder.nativeOrder())
                        outputBuffer.position(bufferInfo.offset)
                        outputBuffer.limit(bufferInfo.offset + bufferInfo.size)

                        while (outputBuffer.remaining() >= 2) {
                            val normalized = outputBuffer.short.toFloat() / Short.MAX_VALUE
                            accumulator += abs(normalized)
                            frameSampleCount++

                            if (frameSampleCount >= chunkSizeSamples) {
                                amplitudes.add((accumulator / frameSampleCount).coerceIn(0f, 1f))
                                accumulator = 0f
                                frameSampleCount = 0
                            }
                        }

                        codec.releaseOutputBuffer(outputIndex, false)
                        if (bufferInfo.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0) {
                            sawOutputEos = true
                        }
                    }

                    outputIndex == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED -> {
                        // no-op
                    }

                    outputIndex == MediaCodec.INFO_TRY_AGAIN_LATER -> {
                        if (sawInputEos) break
                    }
                }
            }

            if (frameSampleCount > 0) {
                amplitudes.add((accumulator / frameSampleCount).coerceIn(0f, 1f))
            }

            if (amplitudes.isEmpty()) {
                null
            } else {
                val normalized = if (amplitudes.size <= maxSamples) {
                    amplitudes
                } else {
                    downsample(amplitudes, maxSamples)
                }

                val bytes = ByteArray(normalized.size) { index ->
                    val value = (normalized[index].coerceIn(0f, 1f) * 255f).roundToInt().coerceIn(0, 255)
                    value.toByte()
                }

                WaveformResult(
                    samples = bytes,
                    sampleCount = bytes.size,
                    frameDurationMs = frameDurationMs,
                    durationMs = if (durationUs > 0) durationUs / 1000 else normalized.size.toLong() * frameDurationMs,
                    sampleRate = sampleRate,
                    channelCount = channelCount,
                    generatedAt = System.currentTimeMillis()
                )
            }
        } catch (_: Exception) {
            null
        } finally {
            try {
                codec.stop()
            } catch (_: Exception) { }
            try {
                codec.release()
            } catch (_: Exception) { }
            extractor.release()
        }
    }

    private fun downsample(source: List<Float>, targetSize: Int): List<Float> {
        if (targetSize <= 0) return emptyList()
        if (source.size <= targetSize) return source

        val chunkSize = source.size / targetSize.toFloat()
        return List(targetSize) { index ->
            val start = (index * chunkSize).toInt()
            val end = min(((index + 1) * chunkSize).toInt(), source.size)
            if (start >= source.size) {
                0f
            } else {
                val slice = source.subList(start, max(start + 1, end))
                slice.average().toFloat().coerceIn(0f, 1f)
            }
        }
    }

    companion object {
        private const val DEFAULT_FRAME_DURATION_MS = 20
        private const val DEFAULT_TARGET_SAMPLES = 2048
        private const val DEFAULT_SAMPLE_RATE = 44_100
        private const val DEFAULT_CHANNEL_COUNT = 2
        private const val DEQUEUE_TIMEOUT_US = 10_000L
    }
}

data class WaveformResult(
    val samples: ByteArray,
    val sampleCount: Int,
    val frameDurationMs: Int,
    val durationMs: Long,
    val sampleRate: Int,
    val channelCount: Int,
    val generatedAt: Long,
    val version: Int = 1
)
