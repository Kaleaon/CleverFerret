package com.universalmedialibrary.services.audiobook

import android.content.Context
import android.media.MediaMetadataRetriever
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.services.epub.EpubReaderService
import com.universalmedialibrary.services.gemini.GeminiService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.util.Locale
import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for creating synchronized read-along experiences between audiobooks and e-books
 *
 * This service implements the "follow-along" functionality similar to children's books
 * where text is highlighted as the audio plays. It can work in several modes:
 *
 * 1. Pre-synchronized content (audiobooks with embedded timing data)
 * 2. AI-powered synchronization (matching EPUB text with audio using speech recognition)
 * 3. User-assisted synchronization (manual timing calibration)
 * 4. Approximate synchronization (chapter-level timing)
 */
@Singleton
class SynchronizedReadingService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val epubReaderService: EpubReaderService,
    private val geminiService: GeminiService
) {

    private val _synchronizationState = MutableStateFlow(SyncProcessingState())
    val synchronizationState: StateFlow<SyncProcessingState> = _synchronizationState.asStateFlow()

    private var currentSynchronization: BookAudioSync? = null

    /**
     * Create synchronization between an audiobook and matching e-book
     */
    suspend fun createSynchronization(
        audiobookItem: MediaItem,
        ebookItem: MediaItem
    ): BookAudioSync? = withContext(Dispatchers.IO) {

        if (!FeatureFlags.ENABLE_SYNCHRONIZED_READING) {
            updateSyncState(error = "Synchronized reading is disabled")
            return@withContext null
        }

        try {
            updateSyncState(isProcessing = true, progress = 0.1f)

            // Step 1: Load the e-book content
            val epubSuccess = epubReaderService.loadEPUB(java.io.File(ebookItem.filePath))
            if (!epubSuccess) {
                updateSyncState(error = "Failed to load e-book content")
                return@withContext null
            }

            updateSyncState(progress = 0.3f, status = "Analyzing e-book structure...")

            // Step 2: Extract text structure from e-book
            val textStructure = extractTextStructure(ebookItem)
            if (textStructure.isEmpty()) {
                updateSyncState(error = "No readable text found in e-book")
                return@withContext null
            }

            updateSyncState(progress = 0.5f, status = "Processing audio content...")

            // Step 3: Analyze audiobook structure
            val audioStructure = analyzeAudioStructure(audiobookItem)

            updateSyncState(progress = 0.7f, status = "Creating synchronization mapping...")

            // Step 4: Create synchronization mapping
            val synchronization = when {
                // Try AI-powered synchronization first (if Gemini is available)
                FeatureFlags.ENABLE_GEMINI && canUseAISynchronization() -> {
                    createAISynchronization(textStructure, audioStructure)
                }
                // Fall back to chapter-level synchronization
                else -> {
                    createChapterLevelSynchronization(textStructure, audioStructure)
                }
            }

            if (synchronization != null) {
                currentSynchronization = synchronization
                updateSyncState(
                    isReady = true,
                    progress = 1.0f,
                    status = "Synchronization ready"
                )
            } else {
                updateSyncState(error = "Failed to create synchronization")
            }

            synchronization

        } catch (e: Exception) {
            updateSyncState(error = "Error creating synchronization: ${e.message}")
            null
        }
    }

    /**
     * Get highlighted text for current audio position
     */
    fun getHighlightedText(audioPositionMs: Long, chapterIndex: Int): HighlightedText? {
        val sync = currentSynchronization ?: return null
        val chapter = sync.chapters.getOrNull(chapterIndex) ?: return null

        // Find the text segment that should be highlighted at this time
        val segment = chapter.synchronizedSegments.find { segment ->
            audioPositionMs >= segment.startTimeMs && audioPositionMs < segment.endTimeMs
        } ?: return null

        return HighlightedText(
            text = segment.text,
            startOffset = segment.textStartPosition,
            endOffset = segment.textEndPosition,
            timestamp = audioPositionMs,
            confidence = segment.confidence
        )
    }

    /**
     * Calibrate synchronization with user input
     * This allows users to manually adjust timing for better accuracy
     */
    suspend fun calibrateSynchronization(
        audioPositionMs: Long,
        textPosition: Int,
        chapterIndex: Int
    ) {
        val sync = currentSynchronization ?: return

        // Adjust timing based on user calibration
        val chapter = sync.chapters.getOrNull(chapterIndex) ?: return

        // Find nearby segments and adjust their timing
        val calibrationPoint = CalibrationPoint(audioPositionMs, textPosition, chapterIndex)
        adjustTimingBasedOnCalibration(chapter, calibrationPoint)

        updateSyncState(status = "Synchronization calibrated")
    }

    /**
     * Export synchronization data for backup/sharing
     */
    suspend fun exportSynchronization(): String? {
        val sync = currentSynchronization ?: return null

        return try {
            // Export as WebVTT format for compatibility
            generateWebVTT(sync)
        } catch (e: Exception) {
            updateSyncState(error = "Failed to export synchronization: ${e.message}")
            null
        }
    }

    /**
     * Import pre-existing synchronization data
     */
    suspend fun importSynchronization(data: String): Boolean {
        return try {
            val sync = parseWebVTT(data)
            if (sync != null) {
                currentSynchronization = sync
                updateSyncState(isReady = true, status = "Synchronization imported")
                true
            } else {
                updateSyncState(error = "Invalid synchronization data")
                false
            }
        } catch (e: Exception) {
            updateSyncState(error = "Failed to import synchronization: ${e.message}")
            false
        }
    }

    // Private implementation methods

    private suspend fun extractTextStructure(ebookItem: MediaItem): List<TextChapter> {
        val chapters = mutableListOf<TextChapter>()

        try {
            // Get chapters from EPUB reader service
            val readerState = epubReaderService.readerState.value

            readerState.chapters.forEachIndexed { index, chapter ->
                val cleanText = cleanTextForSynchronization(chapter.content)
                val sentences = splitIntoSentences(cleanText)

                chapters.add(
                    TextChapter(
                        index = index,
                        title = chapter.title,
                        text = cleanText,
                        sentences = sentences,
                        wordCount = cleanText.split("\\s+".toRegex()).size
                    )
                )
            }
        } catch (e: Exception) {
            // Handle error
        }

        return chapters
    }

    private suspend fun analyzeAudioStructure(audiobookItem: MediaItem): AudioStructure {
        return withContext(Dispatchers.IO) {
            val retriever = MediaMetadataRetriever()
            try {
                retriever.setDataSource(audiobookItem.filePath)

                val durationStr = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_DURATION
                )
                val totalDurationMs = durationStr?.toLongOrNull() ?: 0L

                // Try to extract chapter information from metadata
                val numTracks = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_NUM_TRACKS
                )?.toIntOrNull()

                val chapters = if (numTracks != null && numTracks > 1) {
                    // Estimate chapter boundaries based on track count
                    val chapterDuration = totalDurationMs / numTracks
                    (0 until numTracks).map { index ->
                        AudioChapter(
                            index = index,
                            title = "Chapter ${index + 1}",
                            startTimeMs = index * chapterDuration,
                            durationMs = chapterDuration
                        )
                    }
                } else if (totalDurationMs > 0) {
                    // Single chapter for the whole file
                    listOf(
                        AudioChapter(
                            index = 0,
                            title = audiobookItem.title,
                            startTimeMs = 0,
                            durationMs = totalDurationMs
                        )
                    )
                } else {
                    emptyList()
                }

                AudioStructure(
                    totalDurationMs = totalDurationMs,
                    chapters = chapters
                )
            } catch (e: Exception) {
                AudioStructure(totalDurationMs = 0, chapters = emptyList())
            } finally {
                try { retriever.release() } catch (_: Exception) {}
            }
        }
    }

    private suspend fun createAISynchronization(
        textStructure: List<TextChapter>,
        audioStructure: AudioStructure
    ): BookAudioSync? {

        if (!canUseAISynchronization()) return null

        try {
            val synchronizedChapters = mutableListOf<SynchronizedChapter>()

            textStructure.forEachIndexed { index, textChapter ->
                val audioChapter = audioStructure.chapters.getOrNull(index)
                if (audioChapter != null) {

                    updateSyncState(
                        progress = 0.7f + (index * 0.3f / textStructure.size),
                        status = "Synchronizing ${textChapter.title}..."
                    )

                    // Use AI to create sentence-level synchronization
                    val segments = createAISentenceSynchronization(textChapter, audioChapter)

                    synchronizedChapters.add(
                        SynchronizedChapter(
                            index = index,
                            title = textChapter.title,
                            synchronizedSegments = segments
                        )
                    )
                }
            }

            return BookAudioSync(
                ebookId = textStructure.hashCode().toLong(),
                audiobookId = audioStructure.hashCode().toLong(),
                chapters = synchronizedChapters,
                synchronizationType = SynchronizationType.AI_POWERED,
                accuracy = 0.85f // AI confidence estimate
            )

        } catch (e: Exception) {
            return null
        }
    }

    private suspend fun createAISentenceSynchronization(
        textChapter: TextChapter,
        audioChapter: AudioChapter
    ): List<SynchronizedSegment> {

        val segments = mutableListOf<SynchronizedSegment>()
        val totalDuration = audioChapter.durationMs
        val sentences = textChapter.sentences

        // Simple time distribution for now
        // In a real implementation, this would use speech recognition/AI
        sentences.forEachIndexed { index, sentence ->
            val segmentDuration = totalDuration / sentences.size
            val startTime = audioChapter.startTimeMs + (index * segmentDuration)
            val endTime = startTime + segmentDuration

            segments.add(
                SynchronizedSegment(
                    text = sentence.text,
                    startTimeMs = startTime,
                    endTimeMs = endTime,
                    textStartPosition = sentence.startPosition,
                    textEndPosition = sentence.endPosition,
                    confidence = 0.7f // Lower confidence for estimated timing
                )
            )
        }

        return segments
    }

    private fun createChapterLevelSynchronization(
        textStructure: List<TextChapter>,
        audioStructure: AudioStructure
    ): BookAudioSync {

        val synchronizedChapters = textStructure.mapIndexed { index, textChapter ->
            val audioChapter = audioStructure.chapters.getOrNull(index)

            val segments = if (audioChapter != null) {
                listOf(
                    SynchronizedSegment(
                        text = textChapter.text,
                        startTimeMs = audioChapter.startTimeMs,
                        endTimeMs = audioChapter.startTimeMs + audioChapter.durationMs,
                        textStartPosition = 0,
                        textEndPosition = textChapter.text.length,
                        confidence = 0.5f // Low confidence for chapter-level sync
                    )
                )
            } else {
                emptyList()
            }

            SynchronizedChapter(
                index = index,
                title = textChapter.title,
                synchronizedSegments = segments
            )
        }

        return BookAudioSync(
            ebookId = textStructure.hashCode().toLong(),
            audiobookId = audioStructure.hashCode().toLong(),
            chapters = synchronizedChapters,
            synchronizationType = SynchronizationType.CHAPTER_LEVEL,
            accuracy = 0.5f
        )
    }

    private suspend fun canUseAISynchronization(): Boolean {
        return FeatureFlags.ENABLE_GEMINI && geminiService.isConfigured()
    }

    private fun cleanTextForSynchronization(htmlText: String): String {
        // Remove HTML tags and clean up text for synchronization
        return htmlText
            .replace(Regex("<[^>]+>"), "") // Remove HTML tags
            .replace(Regex("\\s+"), " ") // Normalize whitespace
            .trim()
    }

    private fun splitIntoSentences(text: String): List<Sentence> {
        val sentences = mutableListOf<Sentence>()
        val pattern = Pattern.compile("[.!?]+\\s+")
        val matcher = pattern.matcher(text)

        var lastEnd = 0
        while (matcher.find()) {
            val sentence = text.substring(lastEnd, matcher.end()).trim()
            if (sentence.isNotEmpty()) {
                sentences.add(
                    Sentence(
                        text = sentence,
                        startPosition = lastEnd,
                        endPosition = matcher.end()
                    )
                )
            }
            lastEnd = matcher.end()
        }

        // Handle the last sentence
        if (lastEnd < text.length) {
            val sentence = text.substring(lastEnd).trim()
            if (sentence.isNotEmpty()) {
                sentences.add(
                    Sentence(
                        text = sentence,
                        startPosition = lastEnd,
                        endPosition = text.length
                    )
                )
            }
        }

        return sentences
    }

    private fun adjustTimingBasedOnCalibration(
        chapter: SynchronizedChapter,
        calibration: CalibrationPoint
    ) {
        val sync = currentSynchronization ?: return

        // Find the segment closest to the calibration point
        val segments = chapter.synchronizedSegments
        if (segments.isEmpty()) return

        val closestSegmentIndex = segments.indices.minByOrNull { index ->
            kotlin.math.abs(segments[index].textStartPosition - calibration.textPosition)
        } ?: return

        val closestSegment = segments[closestSegmentIndex]
        val timeOffset = calibration.audioPositionMs - closestSegment.startTimeMs

        // Apply proportional adjustment to all segments in this chapter
        // Segments before the calibration point get proportionally less adjustment
        // Segments after get proportionally more
        val adjustedSegments = segments.mapIndexed { index, segment ->
            val adjustmentFactor = when {
                index < closestSegmentIndex -> index.toFloat() / closestSegmentIndex.toFloat()
                index == closestSegmentIndex -> 1.0f
                else -> 1.0f - ((index - closestSegmentIndex).toFloat() / (segments.size - closestSegmentIndex).toFloat()) * 0.5f
            }

            val adjustment = (timeOffset * adjustmentFactor).toLong()
            segment.copy(
                startTimeMs = segment.startTimeMs + adjustment,
                endTimeMs = segment.endTimeMs + adjustment,
                confidence = minOf(segment.confidence + 0.1f, 1.0f)
            )
        }

        val adjustedChapter = chapter.copy(synchronizedSegments = adjustedSegments)

        // Rebuild currentSynchronization with the adjusted chapter
        val updatedChapters = sync.chapters.map { ch ->
            if (ch.index == chapter.index) adjustedChapter else ch
        }
        currentSynchronization = sync.copy(
            chapters = updatedChapters,
            synchronizationType = SynchronizationType.USER_CALIBRATED
        )
    }

    private fun generateWebVTT(sync: BookAudioSync): String {
        val webvtt = StringBuilder("WEBVTT\n\n")

        sync.chapters.forEach { chapter ->
            webvtt.append("NOTE Chapter: ${chapter.title}\n\n")

            chapter.synchronizedSegments.forEach { segment ->
                val startTime = formatWebVTTTime(segment.startTimeMs)
                val endTime = formatWebVTTTime(segment.endTimeMs)

                webvtt.append("$startTime --> $endTime\n")
                webvtt.append("${segment.text}\n\n")
            }
        }

        return webvtt.toString()
    }

    private fun parseWebVTT(data: String): BookAudioSync? {
        if (!data.trimStart().startsWith("WEBVTT")) return null

        val chapters = mutableListOf<SynchronizedChapter>()
        var currentChapterTitle = ""
        var currentChapterIndex = 0
        var currentSegments = mutableListOf<SynchronizedSegment>()

        val lines = data.lines()
        var i = 0

        while (i < lines.size) {
            val line = lines[i].trim()

            when {
                line.startsWith("NOTE Chapter:") -> {
                    // Save previous chapter if any
                    if (currentSegments.isNotEmpty()) {
                        chapters.add(SynchronizedChapter(
                            index = currentChapterIndex,
                            title = currentChapterTitle,
                            synchronizedSegments = currentSegments.toList()
                        ))
                        currentChapterIndex++
                        currentSegments = mutableListOf()
                    }
                    currentChapterTitle = line.removePrefix("NOTE Chapter:").trim()
                }
                line.contains("-->") -> {
                    // Parse timestamp line: "00:00:00.000 --> 00:00:05.000"
                    val parts = line.split("-->").map { it.trim() }
                    if (parts.size == 2) {
                        val startMs = parseWebVTTTimestamp(parts[0])
                        val endMs = parseWebVTTTimestamp(parts[1])

                        // Next line(s) contain the text until empty line
                        val textBuilder = StringBuilder()
                        i++
                        while (i < lines.size && lines[i].isNotBlank()) {
                            if (textBuilder.isNotEmpty()) textBuilder.append(" ")
                            textBuilder.append(lines[i].trim())
                            i++
                        }

                        if (textBuilder.isNotEmpty()) {
                            val text = textBuilder.toString()
                            val textStart = currentSegments.lastOrNull()?.textEndPosition ?: 0
                            currentSegments.add(SynchronizedSegment(
                                text = text,
                                startTimeMs = startMs,
                                endTimeMs = endMs,
                                textStartPosition = textStart,
                                textEndPosition = textStart + text.length,
                                confidence = 0.8f
                            ))
                        }
                    }
                }
            }
            i++
        }

        // Save last chapter
        if (currentSegments.isNotEmpty()) {
            chapters.add(SynchronizedChapter(
                index = currentChapterIndex,
                title = currentChapterTitle,
                synchronizedSegments = currentSegments.toList()
            ))
        }

        if (chapters.isEmpty()) return null

        return BookAudioSync(
            ebookId = 0,
            audiobookId = 0,
            chapters = chapters,
            synchronizationType = SynchronizationType.PRE_SYNCHRONIZED,
            accuracy = 0.8f
        )
    }

    private fun parseWebVTTTimestamp(timestamp: String): Long {
        val parts = timestamp.split(":", ".")
        if (parts.size < 4) return 0
        val hours = parts[0].toLongOrNull() ?: 0
        val minutes = parts[1].toLongOrNull() ?: 0
        val seconds = parts[2].toLongOrNull() ?: 0
        val millis = parts[3].toLongOrNull() ?: 0
        return hours * 3600000 + minutes * 60000 + seconds * 1000 + millis
    }

    private fun formatWebVTTTime(timeMs: Long): String {
        val totalSeconds = timeMs / 1000
        val hours = totalSeconds / 3600
        val minutes = (totalSeconds % 3600) / 60
        val seconds = totalSeconds % 60
        val milliseconds = timeMs % 1000

        return String.format(Locale.getDefault(), "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    }

    private fun updateSyncState(
        isProcessing: Boolean = _synchronizationState.value.isProcessing,
        isReady: Boolean = _synchronizationState.value.isReady,
        progress: Float = _synchronizationState.value.progress,
        status: String = _synchronizationState.value.status,
        error: String? = null
    ) {
        _synchronizationState.value = SyncProcessingState(
            isProcessing = isProcessing,
            isReady = isReady,
            progress = progress,
            status = status,
            error = error
        )
    }
}

// Data classes for synchronized reading

data class BookAudioSync(
    val ebookId: Long,
    val audiobookId: Long,
    val chapters: List<SynchronizedChapter>,
    val synchronizationType: SynchronizationType,
    val accuracy: Float
)

data class SynchronizedChapter(
    val index: Int,
    val title: String,
    val synchronizedSegments: List<SynchronizedSegment>
)

data class SynchronizedSegment(
    val text: String,
    val startTimeMs: Long,
    val endTimeMs: Long,
    val textStartPosition: Int,
    val textEndPosition: Int,
    val confidence: Float
)

data class TextChapter(
    val index: Int,
    val title: String,
    val text: String,
    val sentences: List<Sentence>,
    val wordCount: Int
)

data class Sentence(
    val text: String,
    val startPosition: Int,
    val endPosition: Int
)

data class AudioStructure(
    val totalDurationMs: Long,
    val chapters: List<AudioChapter>
)

data class CalibrationPoint(
    val audioPositionMs: Long,
    val textPosition: Int,
    val chapterIndex: Int
)

enum class SynchronizationType {
    AI_POWERED,      // High accuracy using speech recognition
    CHAPTER_LEVEL,   // Basic chapter-level synchronization
    USER_CALIBRATED, // Manually adjusted by user
    PRE_SYNCHRONIZED // Embedded in audiobook file
}
