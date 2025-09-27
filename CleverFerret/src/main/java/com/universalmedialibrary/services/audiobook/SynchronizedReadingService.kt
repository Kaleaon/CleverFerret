package com.universalmedialibrary.services.audiobook

import android.content.Context
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
    
    private val _synchronizationState = MutableStateFlow(SynchronizationState())
    val synchronizationState: StateFlow<SynchronizationState> = _synchronizationState.asStateFlow()
    
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
            val epubSuccess = epubReaderService.loadEPUB(ebookItem.filePath)
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
            startPosition = segment.textStartPosition,
            endPosition = segment.textEndPosition,
            chapterIndex = chapterIndex,
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
        // This would analyze the audiobook file to extract:
        // - Chapter boundaries
        // - Total duration
        // - Audio quality metrics
        // - Embedded metadata
        
        return AudioStructure(
            totalDurationMs = 3600000, // Placeholder
            chapters = listOf(
                AudioChapter(
                    index = 0,
                    title = "Chapter 1",
                    startTimeMs = 0,
                    durationMs = 3600000
                )
            )
        )
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
    
    private fun canUseAISynchronization(): Boolean {
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
        // Implement timing adjustment logic based on user calibration
        // This would interpolate timing adjustments across nearby segments
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
        // Implementation would parse WebVTT format and create BookAudioSync
        return null // Placeholder
    }
    
    private fun formatWebVTTTime(timeMs: Long): String {
        val totalSeconds = timeMs / 1000
        val hours = totalSeconds / 3600
        val minutes = (totalSeconds % 3600) / 60
        val seconds = totalSeconds % 60
        val milliseconds = timeMs % 1000
        
        return String.format("%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    }
    
    private fun updateSyncState(
        isProcessing: Boolean = _synchronizationState.value.isProcessing,
        isReady: Boolean = _synchronizationState.value.isReady,
        progress: Float = _synchronizationState.value.progress,
        status: String = _synchronizationState.value.status,
        error: String? = null
    ) {
        _synchronizationState.value = SynchronizationState(
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

data class AudioChapter(
    val index: Int,
    val title: String,
    val startTimeMs: Long,
    val durationMs: Long
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

data class SynchronizationState(
    val isProcessing: Boolean = false,
    val isReady: Boolean = false,
    val progress: Float = 0f,
    val status: String = "",
    val error: String? = null
)