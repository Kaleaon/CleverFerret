package com.universalmedialibrary.services.analysis.fingerprint

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.media.MediaMetadataRetriever
import android.net.Uri
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.security.MessageDigest
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Content Fingerprinting Service for duplicate detection and content identification
 * Creates unique fingerprints for different media types
 */
@Singleton
class ContentFingerprinter @Inject constructor() {

    // In-memory storage for fingerprints (in production, this would be a database)
    private val fingerprintDatabase = mutableMapOf<String, ContentFingerprint>()

    /**
     * Generate fingerprint for document content
     */
    suspend fun generateDocumentFingerprint(content: String): String = withContext(Dispatchers.IO) {
        val normalized = normalizeText(content)
        val contentHash = generateHash(normalized)
        val structuralFeatures = extractTextualFeatures(normalized)

        val fingerprint = ContentFingerprint(
            id = contentHash,
            type = FingerprintType.DOCUMENT,
            primaryHash = contentHash,
            features = structuralFeatures,
            createdAt = System.currentTimeMillis()
        )

        fingerprintDatabase[contentHash] = fingerprint
        contentHash
    }

    /**
     * Generate fingerprint for video content
     */
    suspend fun generateVideoFingerprint(context: Context, uri: Uri): String = withContext(Dispatchers.IO) {
        try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(context, uri)

            // Extract multiple frames for better fingerprinting
            val frames = mutableListOf<Bitmap>()
            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull() ?: 0L

            if (duration > 0) {
                // Extract frames at different time points
                val timePoints = listOf(
                    duration * 0.1,  // 10%
                    duration * 0.3,  // 30%
                    duration * 0.5,  // 50%
                    duration * 0.7,  // 70%
                    duration * 0.9   // 90%
                ).map { it.toLong() * 1000 } // Convert to microseconds

                for (timePoint in timePoints) {
                    try {
                        val frame = retriever.getFrameAtTime(timePoint, MediaMetadataRetriever.OPTION_CLOSEST_SYNC)
                        if (frame != null) {
                            frames.add(frame)
                        }
                    } catch (e: Exception) {
                        // Skip this frame if extraction fails
                    }
                }
            }

            retriever.release()

            // Generate perceptual hash from frames
            val frameHashes = frames.map { generatePerceptualHash(it) }
            val combinedHash = generateHash(frameHashes.joinToString(","))

            // Clean up bitmaps
            frames.forEach { it.recycle() }

            val fingerprint = ContentFingerprint(
                id = combinedHash,
                type = FingerprintType.VIDEO,
                primaryHash = combinedHash,
                features = mapOf(
                    "duration" to duration.toString(),
                    "frame_count" to frames.size.toString(),
                    "frame_hashes" to frameHashes.joinToString(",")
                ),
                createdAt = System.currentTimeMillis()
            )

            fingerprintDatabase[combinedHash] = fingerprint
            combinedHash

        } catch (e: Exception) {
            // Fallback to filename-based hash
            val filename = uri.lastPathSegment ?: uri.toString()
            generateHash(filename)
        }
    }

    /**
     * Generate fingerprint for audio content
     */
    suspend fun generateAudioFingerprint(context: Context, uri: Uri): String = withContext(Dispatchers.IO) {
        try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(context, uri)

            val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull() ?: 0L
            val bitrate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE) ?: ""
            val sampleRate = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CAPTURE_FRAMERATE) ?: ""

            // Create audio signature based on metadata
            val audioSignature = listOf(
                duration.toString(),
                bitrate,
                sampleRate
            ).joinToString("|")

            retriever.release()

            val audioHash = generateHash(audioSignature)

            val fingerprint = ContentFingerprint(
                id = audioHash,
                type = FingerprintType.AUDIO,
                primaryHash = audioHash,
                features = mapOf(
                    "duration" to duration.toString(),
                    "bitrate" to bitrate,
                    "sample_rate" to sampleRate
                ),
                createdAt = System.currentTimeMillis()
            )

            fingerprintDatabase[audioHash] = fingerprint
            audioHash

        } catch (e: Exception) {
            val filename = uri.lastPathSegment ?: uri.toString()
            generateHash(filename)
        }
    }

    /**
     * Generate fingerprint for comic/image content
     */
    suspend fun generateComicFingerprint(context: Context, uri: Uri): String = withContext(Dispatchers.IO) {
        try {
            // For comics, we'll create a fingerprint based on cover image and file structure
            val inputStream = context.contentResolver.openInputStream(uri)
            val buffer = ByteArray(8192)
            val bytesRead = inputStream?.read(buffer) ?: 0
            inputStream?.close()

            // Create hash from file header
            val headerHash = generateHash(buffer.take(bytesRead).toByteArray().toString())

            val fingerprint = ContentFingerprint(
                id = headerHash,
                type = FingerprintType.COMIC,
                primaryHash = headerHash,
                features = mapOf(
                    "file_size" to bytesRead.toString(),
                    "file_type" to (uri.lastPathSegment?.substringAfterLast('.') ?: "unknown")
                ),
                createdAt = System.currentTimeMillis()
            )

            fingerprintDatabase[headerHash] = fingerprint
            headerHash

        } catch (e: Exception) {
            val filename = uri.lastPathSegment ?: uri.toString()
            generateHash(filename)
        }
    }

    /**
     * Find potential duplicates based on fingerprint similarity
     */
    suspend fun findDuplicates(fingerprint: String): List<String> = withContext(Dispatchers.IO) {
        val currentFingerprint = fingerprintDatabase[fingerprint] ?: return@withContext emptyList()

        val duplicates = mutableListOf<String>()

        for ((id, storedFingerprint) in fingerprintDatabase) {
            if (id != fingerprint && storedFingerprint.type == currentFingerprint.type) {
                val similarity = calculateSimilarity(currentFingerprint, storedFingerprint)
                if (similarity > 0.8f) { // 80% similarity threshold
                    duplicates.add(id)
                }
            }
        }

        return@withContext duplicates
    }

    /**
     * Find similar content based on features
     */
    suspend fun findSimilarContent(
        fingerprint: String,
        threshold: Float = 0.7f
    ): List<SimilarityMatch> = withContext(Dispatchers.IO) {
        val currentFingerprint = fingerprintDatabase[fingerprint] ?: return@withContext emptyList()

        val matches = mutableListOf<SimilarityMatch>()

        for ((id, storedFingerprint) in fingerprintDatabase) {
            if (id != fingerprint && storedFingerprint.type == currentFingerprint.type) {
                val similarity = calculateSimilarity(currentFingerprint, storedFingerprint)
                if (similarity >= threshold) {
                    matches.add(
                        SimilarityMatch(
                            fingerprintId = id,
                            similarity = similarity,
                            matchType = when {
                                similarity > 0.95f -> MatchType.EXACT_DUPLICATE
                                similarity > 0.8f -> MatchType.NEAR_DUPLICATE
                                similarity > 0.6f -> MatchType.SIMILAR_CONTENT
                                else -> MatchType.RELATED_CONTENT
                            }
                        )
                    )
                }
            }
        }

        return@withContext matches.sortedByDescending { it.similarity }
    }

    private fun normalizeText(text: String): String {
        return text
            .lowercase()
            .replace(Regex("[^\\p{L}\\p{N}\\s]"), "") // Keep only letters, numbers, spaces
            .replace(Regex("\\s+"), " ")
            .trim()
    }

    private fun extractTextualFeatures(text: String): Map<String, String> {
        val words = text.split("\\s+".toRegex()).filter { it.isNotEmpty() }
        val sentences = text.split(Regex("[.!?]+")).filter { it.trim().isNotEmpty() }

        return mapOf(
            "word_count" to words.size.toString(),
            "sentence_count" to sentences.size.toString(),
            "avg_word_length" to (words.map { it.length }.average().takeIf { !it.isNaN() } ?: 0.0).toString(),
            "avg_sentence_length" to (sentences.map { it.length }.average().takeIf { !it.isNaN() } ?: 0.0).toString(),
            "unique_words" to words.distinct().size.toString(),
            "first_words" to words.take(50).joinToString(" "), // First 50 words for comparison
            "character_count" to text.length.toString()
        )
    }

    private fun generatePerceptualHash(bitmap: Bitmap): String {
        // Simple perceptual hash implementation
        // Resize bitmap to 8x8 for comparison
        val resized = Bitmap.createScaledBitmap(bitmap, 8, 8, false)

        // Convert to grayscale and get average
        val pixels = IntArray(64)
        resized.getPixels(pixels, 0, 8, 0, 0, 8, 8)

        val grayValues = pixels.map { pixel ->
            val r = (pixel shr 16) and 0xFF
            val g = (pixel shr 8) and 0xFF
            val b = pixel and 0xFF
            (r * 0.299 + g * 0.587 + b * 0.114).toInt()
        }

        val average = grayValues.average()

        // Create hash based on whether each pixel is above or below average
        val hash = grayValues.map { if (it > average) "1" else "0" }.joinToString("")

        resized.recycle()
        return hash
    }

    private fun generateHash(input: String): String {
        val digest = MessageDigest.getInstance("SHA-256")
        val hashBytes = digest.digest(input.toByteArray())
        return hashBytes.joinToString("") { "%02x".format(it) }
    }

    private fun generateHash(input: ByteArray): String {
        val digest = MessageDigest.getInstance("SHA-256")
        val hashBytes = digest.digest(input)
        return hashBytes.joinToString("") { "%02x".format(it) }
    }

    private fun calculateSimilarity(fp1: ContentFingerprint, fp2: ContentFingerprint): Float {
        when (fp1.type) {
            FingerprintType.DOCUMENT -> {
                return calculateTextSimilarity(fp1.features, fp2.features)
            }
            FingerprintType.VIDEO -> {
                return calculateVideoSimilarity(fp1.features, fp2.features)
            }
            FingerprintType.AUDIO -> {
                return calculateAudioSimilarity(fp1.features, fp2.features)
            }
            FingerprintType.COMIC -> {
                return calculateImageSimilarity(fp1.features, fp2.features)
            }
        }
    }

    private fun calculateTextSimilarity(features1: Map<String, String>, features2: Map<String, String>): Float {
        val words1 = features1["first_words"]?.split(" ") ?: emptyList()
        val words2 = features2["first_words"]?.split(" ") ?: emptyList()

        val intersection = words1.intersect(words2.toSet()).size
        val union = words1.union(words2).size

        val jaccardSimilarity = if (union > 0) intersection.toFloat() / union else 0f

        // Also consider structural similarity
        val wordCount1 = features1["word_count"]?.toFloatOrNull() ?: 0f
        val wordCount2 = features2["word_count"]?.toFloatOrNull() ?: 0f
        val lengthSimilarity = 1f - kotlin.math.abs(wordCount1 - wordCount2) / kotlin.math.max(wordCount1, wordCount2)

        return (jaccardSimilarity * 0.7f + lengthSimilarity * 0.3f)
    }

    private fun calculateVideoSimilarity(features1: Map<String, String>, features2: Map<String, String>): Float {
        val duration1 = features1["duration"]?.toLongOrNull() ?: 0L
        val duration2 = features2["duration"]?.toLongOrNull() ?: 0L

        val durationSimilarity = if (kotlin.math.max(duration1, duration2) > 0) {
            1f - kotlin.math.abs(duration1 - duration2).toFloat() / kotlin.math.max(duration1, duration2)
        } else 0f

        // Compare frame hashes if available
        val frameHashes1 = features1["frame_hashes"]?.split(",") ?: emptyList()
        val frameHashes2 = features2["frame_hashes"]?.split(",") ?: emptyList()

        val frameHashSimilarity = if (frameHashes1.isNotEmpty() && frameHashes2.isNotEmpty()) {
            val minSize = kotlin.math.min(frameHashes1.size, frameHashes2.size)
            var matchingFrames = 0

            for (i in 0 until minSize) {
                if (hammingDistance(frameHashes1[i], frameHashes2[i]) < 10) { // Allow some variation
                    matchingFrames++
                }
            }

            matchingFrames.toFloat() / minSize
        } else 0f

        return (durationSimilarity * 0.4f + frameHashSimilarity * 0.6f)
    }

    private fun calculateAudioSimilarity(features1: Map<String, String>, features2: Map<String, String>): Float {
        val duration1 = features1["duration"]?.toLongOrNull() ?: 0L
        val duration2 = features2["duration"]?.toLongOrNull() ?: 0L
        val bitrate1 = features1["bitrate"]?.toIntOrNull() ?: 0
        val bitrate2 = features2["bitrate"]?.toIntOrNull() ?: 0

        val durationSimilarity = if (kotlin.math.max(duration1, duration2) > 0) {
            1f - kotlin.math.abs(duration1 - duration2).toFloat() / kotlin.math.max(duration1, duration2)
        } else 0f

        val bitrateSimilarity = if (kotlin.math.max(bitrate1, bitrate2) > 0) {
            1f - kotlin.math.abs(bitrate1 - bitrate2).toFloat() / kotlin.math.max(bitrate1, bitrate2)
        } else 0f

        return (durationSimilarity * 0.7f + bitrateSimilarity * 0.3f)
    }

    private fun calculateImageSimilarity(features1: Map<String, String>, features2: Map<String, String>): Float {
        val size1 = features1["file_size"]?.toLongOrNull() ?: 0L
        val size2 = features2["file_size"]?.toLongOrNull() ?: 0L
        val type1 = features1["file_type"] ?: ""
        val type2 = features2["file_type"] ?: ""

        val sizeSimilarity = if (kotlin.math.max(size1, size2) > 0) {
            1f - kotlin.math.abs(size1 - size2).toFloat() / kotlin.math.max(size1, size2)
        } else 0f

        val typeSimilarity = if (type1 == type2) 1f else 0f

        return (sizeSimilarity * 0.8f + typeSimilarity * 0.2f)
    }

    private fun hammingDistance(hash1: String, hash2: String): Int {
        if (hash1.length != hash2.length) return Int.MAX_VALUE

        var distance = 0
        for (i in hash1.indices) {
            if (hash1[i] != hash2[i]) {
                distance++
            }
        }
        return distance
    }
}

/**
 * Content fingerprint data structure
 */
data class ContentFingerprint(
    val id: String,
    val type: FingerprintType,
    val primaryHash: String,
    val features: Map<String, String>,
    val createdAt: Long
)

enum class FingerprintType {
    DOCUMENT, VIDEO, AUDIO, COMIC
}

data class SimilarityMatch(
    val fingerprintId: String,
    val similarity: Float,
    val matchType: MatchType
)

enum class MatchType {
    EXACT_DUPLICATE,
    NEAR_DUPLICATE,
    SIMILAR_CONTENT,
    RELATED_CONTENT
}
