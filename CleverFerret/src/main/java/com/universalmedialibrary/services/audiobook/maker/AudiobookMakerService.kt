package com.universalmedialibrary.services.audiobook.maker

import android.content.Context
import com.universalmedialibrary.services.ai.GeminiTTSService
import com.universalmedialibrary.services.ambient.AmbientSoundService
import com.universalmedialibrary.services.ambient.ContextDetectionService
import com.universalmedialibrary.services.tts.TtsProviderManager
import com.universalmedialibrary.services.tts.TtsProvider
import com.universalmedialibrary.services.tts.TextToSpeechService
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Main service for audiobook maker functionality
 * Orchestrates character voices, background sounds, and action effects
 * Supports multiple TTS providers (Gemini, ElevenLabs, OpenAI, etc.)
 */
@Singleton
class AudiobookMakerService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val bookContentAnalyzer: BookContentAnalyzer,
    private val characterVoiceService: CharacterVoiceService,
    private val actionSoundService: ActionSoundService,
    private val ambientSoundService: AmbientSoundService,
    private val contextDetectionService: ContextDetectionService,
    private val geminiTtsService: GeminiTTSService,
    private val ttsProviderManager: TtsProviderManager
) {
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    
    private val _generationStatus = MutableStateFlow(GenerationStatus())
    val generationStatus: StateFlow<GenerationStatus> = _generationStatus.asStateFlow()
    
    private var currentConfig: AudiobookGenerationConfig = AudiobookGenerationConfig()
    private var currentBookAnalysis: BookAnalysisResult? = null
    private var generatedSegments = mutableListOf<AudiobookSegment>()
    
    /**
     * Initialize the audiobook maker with a book
     */
    suspend fun initializeBook(
        bookText: String,
        title: String? = null,
        author: String? = null,
        config: AudiobookGenerationConfig = AudiobookGenerationConfig()
    ): BookAnalysisResult = withContext(Dispatchers.IO) {
        try {
            updateStatus(isGenerating = true, progress = 0.1f)
            
            currentConfig = config
            
            // Analyze book content
            val analysis = bookContentAnalyzer.analyzeBook(bookText, title, author)
            
            if (!analysis.success) {
                updateStatus(
                    isGenerating = false,
                    error = analysis.error ?: "Failed to analyze book"
                )
                return@withContext analysis
            }
            
            currentBookAnalysis = analysis
            
            // Generate voice profiles for characters if auto-detect is enabled
            if (config.autoDetectCharacters && config.useCharacterVoices) {
                updateStatus(progress = 0.3f)
                generateCharacterVoices(analysis)
            }
            
            updateStatus(isGenerating = false, progress = 1.0f)
            
            analysis
            
        } catch (e: Exception) {
            updateStatus(
                isGenerating = false,
                error = "Error initializing book: ${e.message}"
            )
            BookAnalysisResult(
                success = false,
                error = e.message
            )
        }
    }
    
    /**
     * Generate voice profiles for all detected characters
     */
    private suspend fun generateCharacterVoices(analysis: BookAnalysisResult) {
        analysis.characters.forEach { character ->
            characterVoiceService.generateVoiceProfile(character, analysis.genre)
        }
    }
    
    /**
     * Process a chapter and generate audiobook segments
     */
    suspend fun processChapter(
        chapterText: String,
        chapterId: String,
        chapterIndex: Int
    ): List<AudiobookSegment> = withContext(Dispatchers.IO) {
        try {
            val analysis = currentBookAnalysis
            if (analysis == null || !analysis.success) {
                return@withContext emptyList()
            }
            
            updateStatus(
                isGenerating = true,
                currentChapter = chapterIndex,
                progress = 0f
            )
            
            // Analyze chapter context
            val chapterContext = bookContentAnalyzer.analyzeChapter(
                chapterText,
                analysis.genre
            )
            
            // Detect ambient sounds for this chapter
            val ambientSounds = if (currentConfig.useBackgroundSounds) {
                contextDetectionService.detectAmbientContext(chapterText, 3)
            } else {
                emptyList()
            }
            
            // Detect action sounds
            val actionSounds = if (currentConfig.useActionSounds) {
                actionSoundService.detectActionSounds(chapterText, analysis.genre, 10)
            } else {
                emptyList()
            }
            
            // Split chapter into segments (narration, dialogue, etc.)
            val segments = segmentChapter(
                chapterText,
                chapterId,
                chapterContext,
                analysis,
                ambientSounds.firstOrNull()?.first?.id,
                actionSounds
            )
            
            generatedSegments.addAll(segments)
            
            updateStatus(
                isGenerating = false,
                currentChapter = chapterIndex,
                progress = 1.0f
            )
            
            segments
            
        } catch (e: Exception) {
            updateStatus(
                isGenerating = false,
                error = "Error processing chapter: ${e.message}"
            )
            emptyList()
        }
    }
    
    /**
     * Segment chapter text into audiobook segments
     * This is a simplified version - production would use more sophisticated parsing
     */
    private fun segmentChapter(
        chapterText: String,
        chapterId: String,
        context: BookContext,
        analysis: BookAnalysisResult,
        backgroundSoundId: String?,
        actionSounds: List<ActionSound>
    ): List<AudiobookSegment> {
        val segments = mutableListOf<AudiobookSegment>()
        
        // Split by paragraphs
        val paragraphs = chapterText.split("\n\n").filter { it.isNotBlank() }
        
        var currentPosition = 0L
        
        paragraphs.forEachIndexed { index, paragraph ->
            val trimmedParagraph = paragraph.trim()
            
            // Detect if this is dialogue or narration
            val isDialogue = trimmedParagraph.startsWith("\"") || 
                            trimmedParagraph.contains("\" said") ||
                            trimmedParagraph.contains("\" asked")
            
            // Estimate duration (rough: ~150 words per minute)
            val wordCount = trimmedParagraph.split("\\s+".toRegex()).size
            val estimatedDuration = (wordCount / 150.0 * 60000).toLong()
            
            val segmentType = if (isDialogue) SegmentType.DIALOGUE else SegmentType.NARRATION
            
            // Try to identify character for dialogue
            val characterId = if (isDialogue) {
                identifyCharacter(trimmedParagraph, analysis.characters)
            } else {
                null
            }
            
            // Get voice profile
            val voiceProfile = if (characterId != null) {
                characterVoiceService.getVoiceProfile(characterId)
            } else if (segmentType == SegmentType.NARRATION) {
                currentConfig.narratorVoice ?: characterVoiceService.createNarratorVoice(analysis.genre)
            } else {
                null
            }
            
            // Detect action sounds in this segment
            val segmentActionSounds = detectActionSoundsInSegment(trimmedParagraph, actionSounds)
            
            val segment = AudiobookSegment(
                id = "${chapterId}_seg_$index",
                chapterId = chapterId,
                startPosition = currentPosition,
                duration = estimatedDuration,
                type = segmentType,
                text = trimmedParagraph,
                characterId = characterId,
                voiceProfile = voiceProfile,
                backgroundSoundId = backgroundSoundId,
                actionSounds = segmentActionSounds
            )
            
            segments.add(segment)
            currentPosition += estimatedDuration
        }
        
        return segments
    }
    
    /**
     * Identify which character is speaking in a dialogue segment
     */
    private fun identifyCharacter(
        text: String,
        characters: List<BookCharacter>
    ): String? {
        // Look for character names in dialogue attribution
        characters.forEach { character ->
            if (text.contains(character.name, ignoreCase = true)) {
                return character.id
            }
        }
        return null
    }
    
    /**
     * Detect action sounds in a text segment
     */
    private fun detectActionSoundsInSegment(
        text: String,
        availableSounds: List<ActionSound>
    ): List<ActionSoundTiming> {
        val timings = mutableListOf<ActionSoundTiming>()
        val lowerText = text.lowercase()
        
        availableSounds.forEach { sound ->
            sound.keywords.forEach { keyword ->
                val index = lowerText.indexOf(keyword)
                if (index >= 0) {
                    // Estimate position based on word position
                    val wordsBeforeKeyword = lowerText.substring(0, index).split("\\s+".toRegex()).size
                    val totalWords = lowerText.split("\\s+".toRegex()).size
                    val relativePosition = if (totalWords > 0) {
                        (wordsBeforeKeyword.toFloat() / totalWords * 5000).toLong() // Rough estimate
                    } else {
                        0L
                    }
                    
                    timings.add(ActionSoundTiming(
                        soundId = sound.id,
                        relativePosition = relativePosition,
                        volume = currentConfig.effectsVolume
                    ))
                }
            }
        }
        
        return timings
    }
    
    /**
     * Generate speech audio for a segment using configured TTS provider
     */
    suspend fun generateSegmentAudio(segment: AudiobookSegment): Boolean = 
        withContext(Dispatchers.IO) {
        try {
            val voiceProfile = segment.voiceProfile ?: return@withContext false
            
            // Get active TTS service based on configuration
            val ttsService = ttsProviderManager.getActiveService()
            
            // Apply voice settings
            ttsService.setSpeechRate(voiceProfile.speed)
            ttsService.setPitch(voiceProfile.pitch)
            
            // Generate speech
            ttsService.speak(segment.text)
            
            true
        } catch (e: Exception) {
            updateStatus(error = "TTS generation failed: ${e.message}")
            false
        }
    }
    
    /**
     * Set the TTS provider for audiobook generation
     */
    suspend fun setTtsProvider(provider: TtsProviderType) {
        val ttsProvider = when (provider) {
            TtsProviderType.ANDROID -> TtsProvider.ANDROID
            TtsProviderType.GEMINI -> TtsProvider.GEMINI
            TtsProviderType.GOOGLE_CLOUD -> TtsProvider.GOOGLE_CLOUD
            TtsProviderType.ELEVEN_LABS -> TtsProvider.ELEVEN_LABS
            TtsProviderType.OPENAI -> TtsProvider.OPENAI
        }
        ttsProviderManager.setProvider(ttsProvider)
    }
    
    /**
     * Get available TTS providers
     */
    fun getAvailableProviders(): List<TtsProviderInfo> {
        return TtsProviderType.values().map { type ->
            val provider = when (type) {
                TtsProviderType.ANDROID -> TtsProvider.ANDROID
                TtsProviderType.GEMINI -> TtsProvider.GEMINI
                TtsProviderType.GOOGLE_CLOUD -> TtsProvider.GOOGLE_CLOUD
                TtsProviderType.ELEVEN_LABS -> TtsProvider.ELEVEN_LABS
                TtsProviderType.OPENAI -> TtsProvider.OPENAI
            }
            TtsProviderInfo(
                type = type,
                displayName = provider.displayName,
                description = provider.description,
                requiresApiKey = provider.requiresApiKey
            )
        }
    }
    
    /**
     * Check if a TTS provider is configured and ready
     */
    suspend fun isProviderConfigured(provider: TtsProviderType): Boolean {
        val ttsProvider = when (provider) {
            TtsProviderType.ANDROID -> TtsProvider.ANDROID
            TtsProviderType.GEMINI -> TtsProvider.GEMINI
            TtsProviderType.GOOGLE_CLOUD -> TtsProvider.GOOGLE_CLOUD
            TtsProviderType.ELEVEN_LABS -> TtsProvider.ELEVEN_LABS
            TtsProviderType.OPENAI -> TtsProvider.OPENAI
        }
        return ttsProviderManager.isProviderConfigured(ttsProvider)
    }
    
    /**
     * Get the current book analysis
     */
    fun getBookAnalysis(): BookAnalysisResult? {
        return currentBookAnalysis
    }
    
    /**
     * Get generated segments
     */
    fun getGeneratedSegments(): List<AudiobookSegment> {
        return generatedSegments.toList()
    }
    
    /**
     * Get character voice profile
     */
    fun getCharacterVoice(characterId: String): CharacterVoiceProfile? {
        return characterVoiceService.getVoiceProfile(characterId)
    }
    
    /**
     * Update character voice profile
     */
    fun updateCharacterVoice(profile: CharacterVoiceProfile) {
        characterVoiceService.updateVoiceProfile(profile)
    }
    
    /**
     * Get all character voices
     */
    fun getAllCharacterVoices(): List<CharacterVoiceProfile> {
        return characterVoiceService.getAllVoiceProfiles()
    }
    
    /**
     * Update generation status
     */
    private fun updateStatus(
        isGenerating: Boolean = _generationStatus.value.isGenerating,
        currentChapter: Int = _generationStatus.value.currentChapter,
        totalChapters: Int = _generationStatus.value.totalChapters,
        currentSegment: Int = _generationStatus.value.currentSegment,
        totalSegments: Int = _generationStatus.value.totalSegments,
        progress: Float = _generationStatus.value.progress,
        estimatedTimeRemaining: Long = _generationStatus.value.estimatedTimeRemaining,
        error: String? = null
    ) {
        _generationStatus.value = GenerationStatus(
            isGenerating = isGenerating,
            currentChapter = currentChapter,
            totalChapters = totalChapters,
            currentSegment = currentSegment,
            totalSegments = totalSegments,
            progress = progress,
            estimatedTimeRemaining = estimatedTimeRemaining,
            error = error
        )
    }
    
    /**
     * Clear all data and reset
     */
    fun reset() {
        currentBookAnalysis = null
        generatedSegments.clear()
        characterVoiceService.clearCache()
        _generationStatus.value = GenerationStatus()
    }
}
