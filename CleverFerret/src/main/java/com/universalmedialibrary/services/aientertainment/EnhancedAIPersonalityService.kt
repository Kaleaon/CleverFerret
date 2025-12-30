package com.universalmedialibrary.services.aientertainment

import android.content.Context
import android.content.SharedPreferences
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.services.ai.MoodChange
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.text.SimpleDateFormat
import java.util.*
import java.util.concurrent.ConcurrentHashMap
import javax.inject.Inject
import javax.inject.Singleton
import kotlin.math.abs

/**
 * Enhanced AI Personality Service
 * 
 * Provides advanced personality management with:
 * - Dynamic personality evolution based on interactions
 * - Mood tracking and emotional state management
 * - Trait development and reinforcement learning
 * - Memory context and relationship management
 * - Long-term personality persistence
 */
@Singleton
class EnhancedAIPersonalityService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val synthCharacterManager: SynthCharacterManager,
    private val synthMemoryManager: SynthMemoryManager
) {
    
    companion object {
        private const val PREFS_NAME = "ai_personality_prefs"
        private const val KEY_PERSONALITY_STATE_PREFIX = "personality_state_"
        private const val KEY_MOOD_HISTORY_PREFIX = "mood_history_"
        private const val KEY_TRAIT_EVOLUTION_PREFIX = "trait_evolution_"
        
        // Personality parameters
        private const val TRAIT_DECAY_RATE = 0.98 // Daily decay factor
        private const val MOOD_INFLUENCE_WEIGHT = 0.3 // How much mood affects personality
        private const val MEMORY_REINFORCEMENT_WEIGHT = 0.2 // How much memories reinforce traits
        private const val MAX_HISTORY_DAYS = 30 // Days to keep history
    }
    
    private val preferences: SharedPreferences = 
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    
    private val json = Json { 
        ignoreUnknownKeys = true 
        prettyPrint = true
        encodeDefaults = true
    }
    
    // In-memory personality states
    private val personalityStates = ConcurrentHashMap<Long, PersonalityState>()
    private val moodHistories = ConcurrentHashMap<Long, List<MoodEntry>>()
    private val traitEvolutions = ConcurrentHashMap<Long, List<TraitChange>>()
    
    private val _personalityEvents = MutableStateFlow<List<SynthPersonalityEvent>>(emptyList())
    val personalityEvents: StateFlow<List<SynthPersonalityEvent>> = _personalityEvents.asStateFlow()
    
    init {
        loadPersonalityStates()
        cleanupOldHistory()
    }
    
    // ==================== Personality State Management ====================
    
    /**
     * Get current personality state for a character
     */
    fun getPersonalityState(characterId: Long): PersonalityState {
        return personalityStates.getOrPut(characterId) {
            loadPersonalityState(characterId) ?: createDefaultPersonalityState(characterId)
        }
    }
    
    /**
     * Update personality based on interaction
     */
    suspend fun updatePersonalityFromInteraction(
        characterId: Long,
        interaction: PersonalityInteraction
    ): PersonalityUpdateResult {
        val currentState = getPersonalityState(characterId)
        val character = synthCharacterManager.getCharacter(characterId)
            ?: return PersonalityUpdateResult.error("Character not found")
        
        try {
            // Analyze interaction for personality changes
            val traitChanges = analyzeInteractionTraits(interaction, currentState)
            val moodChange = analyzeInteractionMood(interaction, currentState)
            
            // Update traits
            val updatedTraits = mutableMapOf<String, Double>()
            updatedTraits.putAll(currentState.traits)
            
            traitChanges.forEach { (trait, change) ->
                val currentValue = updatedTraits[trait] ?: 0.0
                val newValue = (currentValue + change).coerceIn(0.0, 1.0)
                updatedTraits[trait] = newValue
                
                // Record trait change
                recordTraitChange(characterId, trait, currentValue, newValue, change)
            }
            
            // Update mood
            val updatedMood = if (moodChange != null) {
                val newIntensity = (currentState.currentMood.intensity + moodChange.intensityChange).coerceIn(0.0, 1.0)
                val newMood = if (moodChange.newMood != null) {
                    currentState.currentMood.copy(current = moodChange.newMood, intensity = newIntensity)
                } else {
                    currentState.currentMood.copy(intensity = newIntensity)
                }
                newMood
            } else {
                currentState.currentMood
            }
            
            // Update personality state
            val updatedState = currentState.copy(
                traits = updatedTraits,
                currentMood = updatedMood,
                lastInteractionTime = System.currentTimeMillis(),
                totalInteractions = currentState.totalInteractions + 1,
                personalityScore = calculatePersonalityScore(updatedTraits, updatedMood)
            )
            
            // Apply trait decay for time passed
            val finalState = applyTimeBasedDecay(updatedState)
            
            // Save updated state
            personalityStates[characterId] = finalState
            savePersonalityState(characterId, finalState)
            
            // Record mood change
            recordMoodEntry(characterId, updatedMood)
            
            // Create personality event
            val event = SynthPersonalityEvent(
                id = 0, // Auto-generated
                characterId = characterId,
                eventType = determineEventType(traitChanges, moodChange),
                description = generateEventDescription(interaction, traitChanges, moodChange),
                traitChanges = json.encodeToString(traitChanges),
                moodChanges = json.encodeToString(moodChange ?: MoodChange()),
                createdAt = System.currentTimeMillis()
            )
            
            _personalityEvents.value = listOf(event) + _personalityEvents.value.take(99)
            
            return PersonalityUpdateResult.success(
                finalState,
                traitChanges,
                moodChange,
                event
            )
            
        } catch (e: Exception) {
            ErrorLogger.logError("EnhancedAIPersonality", "Failed to update personality", e)
            return PersonalityUpdateResult.error("Failed to update personality: ${e.message}")
        }
    }
    
    /**
     * Apply memory reinforcement to personality
     */
    suspend fun reinforcePersonalityFromMemories(
        characterId: Long,
        memories: List<SynthMemory>
    ): PersonalityUpdateResult {
        val currentState = getPersonalityState(characterId)
        
        try {
            // Analyze memories for trait reinforcement
            val memoryTraits = analyzeMemoriesForTraits(memories, currentState)
            
            // Update traits with memory reinforcement
            val updatedTraits = mutableMapOf<String, Double>()
            updatedTraits.putAll(currentState.traits)
            
            memoryTraits.forEach { (trait, reinforcement) ->
                val currentValue = updatedTraits[trait] ?: 0.0
                val newValue = (currentValue + reinforcement * MEMORY_REINFORCEMENT_WEIGHT).coerceIn(0.0, 1.0)
                updatedTraits[trait] = newValue
            }
            
            val updatedState = currentState.copy(
                traits = updatedTraits,
                personalityScore = calculatePersonalityScore(updatedTraits, currentState.currentMood),
                memoryCount = memories.size
            )
            
            personalityStates[characterId] = updatedState
            savePersonalityState(characterId, updatedState)
            
            return PersonalityUpdateResult.success(updatedState, memoryTraits)
            
        } catch (e: Exception) {
            ErrorLogger.logError("EnhancedAIPersonality", "Failed to reinforce personality from memories", e)
            return PersonalityUpdateResult.error("Failed to reinforce personality: ${e.message}")
        }
    }
    
    /**
     * Get mood evolution over time
     */
    fun getMoodEvolution(characterId: Long, days: Int = 7): List<MoodEntry> {
        val history = moodHistories[characterId] ?: emptyList()
        val cutoff = System.currentTimeMillis() - (days * 24 * 60 * 60 * 1000L)
        
        return history.filter { it.timestamp >= cutoff }
            .sortedBy { it.timestamp }
    }
    
    /**
     * Get trait evolution over time
     */
    fun getTraitEvolution(characterId: Long, days: Int = 30): List<TraitChange> {
        val evolution = traitEvolutions[characterId] ?: emptyList()
        val cutoff = System.currentTimeMillis() - (days * 24 * 60 * 60 * 1000L)
        
        return evolution.filter { it.timestamp >= cutoff }
            .sortedBy { it.timestamp }
    }
    
    /**
     * Get personality insights and analytics
     */
    fun getPersonalityInsights(characterId: Long): PersonalityInsights {
        val state = getPersonalityState(characterId)
        val moodHistory = getMoodEvolution(characterId, 30)
        val traitEvolution = getTraitEvolution(characterId, 30)
        
        // Analyze dominant traits
        val dominantTraits = state.traits.entries
            .sortedByDescending { it.value }
            .take(5)
            .map { (trait, value) -> TraitInsight(trait, value, getTraitTrend(trait, traitEvolution)) }
        
        // Analyze mood patterns
        val moodPatterns = analyzeMoodPatterns(moodHistory)
        
        // Calculate personality stability
        val stability = calculatePersonalityStability(traitEvolution)
        
        // Generate personality summary
        val summary = generatePersonalitySummary(state, dominantTraits, moodPatterns)
        
        return PersonalityInsights(
            personalityScore = state.personalityScore,
            dominantTraits = dominantTraits,
            moodPatterns = moodPatterns,
            stability = stability,
            totalInteractions = state.totalInteractions,
            evolutionRate = calculateEvolutionRate(traitEvolution),
            summary = summary
        )
    }
    
    // ==================== Private Helper Methods ====================
    
    private fun loadPersonalityStates() {
        // This would load all saved personality states from preferences
        // For now, we'll create default states as needed
    }
    
    private fun loadPersonalityState(characterId: Long): PersonalityState? {
        val stateJson = preferences.getString(KEY_PERSONALITY_STATE_PREFIX + characterId, null)
        return if (stateJson != null) {
            try {
                json.decodeFromString<PersonalityState>(stateJson)
            } catch (e: Exception) {
                ErrorLogger.logWarning("EnhancedAIPersonality", "Failed to load personality state for character $characterId", e)
                null
            }
        } else {
            null
        }
    }
    
    private fun savePersonalityState(characterId: Long, state: PersonalityState) {
        val stateJson = json.encodeToString(state)
        preferences.edit()
            .putString(KEY_PERSONALITY_STATE_PREFIX + characterId, stateJson)
            .apply()
    }
    
    private fun createDefaultPersonalityState(characterId: Long): PersonalityState {
        return PersonalityState(
            characterId = characterId,
            traits = getDefaultTraits(),
            currentMood = MoodState(),
            personalityScore = 0.5,
            lastInteractionTime = System.currentTimeMillis(),
            totalInteractions = 0,
            memoryCount = 0
        )
    }
    
    private fun getDefaultTraits(): Map<String, Double> {
        return mapOf(
            "friendliness" to 0.7,
            "curiosity" to 0.6,
            "creativity" to 0.5,
            "empathy" to 0.6,
            "humor" to 0.4,
            "intelligence" to 0.7,
            "confidence" to 0.5,
            "openness" to 0.6
        )
    }
    
    private fun analyzeInteractionTraits(
        interaction: PersonalityInteraction,
        currentState: PersonalityState
    ): Map<String, Double> {
        val traitChanges = mutableMapOf<String, Double>()
        
        // Analyze message content for trait indicators
        val content = interaction.message.lowercase()
        
        // Friendliness
        if (content.contains("thank") || content.contains("appreciate") || content.contains("love")) {
            traitChanges["friendliness"] = 0.1
        }
        
        // Curiosity
        if (content.contains("?") || content.contains("curious") || content.contains("wonder")) {
            traitChanges["curiosity"] = 0.05
        }
        
        // Creativity
        if (content.contains("creative") || content.contains("imagine") || content.contains("art")) {
            traitChanges["creativity"] = 0.08
        }
        
        // Empathy
        if (content.contains("understand") || content.contains("feel") || content.contains("sorry")) {
            traitChanges["empathy"] = 0.1
        }
        
        // Humor
        if (interaction.sentiment == SentimentType.HUMOROUS || content.contains("joke") || content.contains("funny")) {
            traitChanges["humor"] = 0.15
        }
        
        // Intelligence
        if (content.contains("analyze") || content.contains("research") || content.contains("study")) {
            traitChanges["intelligence"] = 0.05
        }
        
        // Confidence
        if (interaction.sentiment == SentimentType.CONFIDENT || content.contains("certain") || content.contains("sure")) {
            traitChanges["confidence"] = 0.08
        }
        
        return traitChanges
    }
    
    private fun analyzeInteractionMood(
        interaction: PersonalityInteraction,
        currentState: PersonalityState
    ): MoodChange? {
        return when (interaction.sentiment) {
            SentimentType.POSITIVE -> MoodChange(intensityChange = 0.1)
            SentimentType.NEGATIVE -> MoodChange(intensityChange = -0.05)
            SentimentType.EXCITED -> MoodChange(
                newMood = "excited",
                intensityChange = 0.2
            )
            SentimentType.CALM -> MoodChange(
                newMood = "calm",
                intensityChange = 0.1
            )
            SentimentType.SAD -> MoodChange(
                newMood = "sad",
                intensityChange = 0.1
            )
            SentimentType.ANGRY -> MoodChange(
                newMood = "angry",
                intensityChange = 0.15
            )
            else -> null
        }
    }
    
    private fun analyzeMemoriesForTraits(
        memories: List<SynthMemory>,
        currentState: PersonalityState
    ): Map<String, Double> {
        val traitReinforcement = mutableMapOf<String, Double>()
        
        memories.forEach { memory ->
            val content = memory.content.lowercase()
            
            // Analyze memory content for trait reinforcement
            when (memory.memoryType) {
                "positive_interaction" -> {
                    traitReinforcement["friendliness"] = (traitReinforcement["friendliness"] ?: 0.0) + 0.02
                    traitReinforcement["empathy"] = (traitReinforcement["empathy"] ?: 0.0) + 0.01
                }
                "creative_work" -> {
                    traitReinforcement["creativity"] = (traitReinforcement["creativity"] ?: 0.0) + 0.03
                }
                "learning" -> {
                    traitReinforcement["intelligence"] = (traitReinforcement["intelligence"] ?: 0.0) + 0.02
                    traitReinforcement["curiosity"] = (traitReinforcement["curiosity"] ?: 0.0) + 0.01
                }
                "emotional_support" -> {
                    traitReinforcement["empathy"] = (traitReinforcement["empathy"] ?: 0.0) + 0.03
                }
                "humor" -> {
                    traitReinforcement["humor"] = (traitReinforcement["humor"] ?: 0.0) + 0.02
                }
            }
        }
        
        return traitReinforcement
    }
    
    private fun calculatePersonalityScore(traits: Map<String, Double>, mood: MoodState): Double {
        if (traits.isEmpty()) return 0.5
        
        val traitAverage = traits.values.average()
        val moodInfluence = mood.intensity * MOOD_INFLUENCE_WEIGHT
        
        return (traitAverage * (1 - MOOD_INFLUENCE_WEIGHT) + moodInfluence).coerceIn(0.0, 1.0)
    }
    
    private fun applyTimeBasedDecay(state: PersonalityState): PersonalityState {
        val now = System.currentTimeMillis()
        val daysSinceLastInteraction = (now - state.lastInteractionTime) / (24 * 60 * 60 * 1000.0)
        
        if (daysSinceLastInteraction <= 1.0) return state
        
        val decayFactor = Math.pow(TRAIT_DECAY_RATE, daysSinceLastInteraction)
        
        val decayedTraits = state.traits.mapValues { (_, value) ->
            (value * decayFactor).coerceIn(0.0, 1.0)
        }
        
        return state.copy(
            traits = decayedTraits,
            personalityScore = calculatePersonalityScore(decayedTraits, state.currentMood)
        )
    }
    
    private fun recordTraitChange(
        characterId: Long,
        trait: String,
        oldValue: Double,
        newValue: Double,
        change: Double
    ) {
        val change = TraitChange(
            trait = trait,
            oldValue = oldValue,
            newValue = newValue,
            change = change,
            timestamp = System.currentTimeMillis()
        )
        
        val evolution = traitEvolutions.getOrPut(characterId) { emptyList() }
        traitEvolutions[characterId] = listOf(change) + evolution.take(999)
    }
    
    private fun recordMoodEntry(characterId: Long, mood: MoodState) {
        val entry = MoodEntry(
            mood = mood.current,
            intensity = mood.intensity,
            timestamp = System.currentTimeMillis()
        )
        
        val history = moodHistories.getOrPut(characterId) { emptyList() }
        moodHistories[characterId] = listOf(entry) + history.take(999)
    }
    
    private fun determineEventType(
        traitChanges: Map<String, Double>,
        moodChange: MoodChange?
    ): String {
        return when {
            traitChanges.isNotEmpty() && moodChange != null -> "PERSONALITY_AND_MOOD_CHANGE"
            traitChanges.isNotEmpty() -> "PERSONALITY_CHANGE"
            moodChange != null -> "MOOD_CHANGE"
            else -> "INTERACTION_RECORDED"
        }
    }
    
    private fun generateEventDescription(
        interaction: PersonalityInteraction,
        traitChanges: Map<String, Double>,
        moodChange: MoodChange?
    ): String {
        val description = StringBuilder()
        
        if (traitChanges.isNotEmpty()) {
            val strongestTrait = traitChanges.maxByOrNull { it.value }?.key
            if (strongestTrait != null) {
                description.append("$strongestTrait trait strengthened")
            }
        }
        
        if (moodChange?.newMood != null) {
            if (description.isNotEmpty()) description.append("; ")
            description.append("Mood changed to ${moodChange.newMood}")
        }
        
        return description.toString()
    }
    
    private fun determineEventIcon(
        traitChanges: Map<String, Double>,
        moodChange: MoodChange?
    ): String {
        return when {
            traitChanges.isNotEmpty() -> "🧠"
            moodChange != null -> "😊"
            else -> "💬"
        }
    }
    
    private fun generateEventId(): String {
        return "event_${System.currentTimeMillis()}_${(Math.random() * 1000).toInt()}"
    }
    
    private fun getTraitTrend(trait: String, evolution: List<TraitChange>): TraitTrend {
        val recentChanges = evolution.takeLast(10).filter { it.trait == trait }
        if (recentChanges.isEmpty()) return TraitTrend.STABLE
        
        val netChange = recentChanges.sumOf { it.change }
        return when {
            netChange > 0.1 -> TraitTrend.INCREASING
            netChange < -0.1 -> TraitTrend.DECREASING
            else -> TraitTrend.STABLE
        }
    }
    
    private fun analyzeMoodPatterns(history: List<MoodEntry>): List<MoodPattern> {
        // Group by mood and calculate patterns
        val moodCounts = history.groupBy { it.mood }
            .mapValues { it.value.size }
        
        return moodCounts.map { (mood, count) ->
            MoodPattern(
                mood = mood,
                frequency = count.toDouble() / history.size,
                averageIntensity = history.filter { it.mood == mood }.map { it.intensity }.average()
            )
        }.sortedByDescending { it.frequency }
    }
    
    private fun calculatePersonalityStability(evolution: List<TraitChange>): Double {
        if (evolution.size < 2) return 1.0
        
        val recentChanges = evolution.takeLast(20)
        val changeVariance = recentChanges.map { abs(it.change) }.average()
        
        // Lower variance = higher stability
        return (1.0 - changeVariance.coerceIn(0.0, 1.0)).coerceIn(0.0, 1.0)
    }
    
    private fun calculateEvolutionRate(evolution: List<TraitChange>): Double {
        if (evolution.isEmpty()) return 0.0
        
        val recentChanges = evolution.takeLast(10)
        return recentChanges.map { abs(it.change) }.average()
    }
    
    private fun generatePersonalitySummary(
        state: PersonalityState,
        dominantTraits: List<TraitInsight>,
        moodPatterns: List<MoodPattern>
    ): String {
        val summary = StringBuilder()
        
        if (dominantTraits.isNotEmpty()) {
            val topTrait = dominantTraits.first()
            summary.append("${topTrait.trait.replaceFirstChar { it.uppercase() }} is the dominant trait ")
            summary.append("(${(topTrait.value * 100).toInt()}%). ")
        }
        
        if (moodPatterns.isNotEmpty()) {
            val dominantMood = moodPatterns.first()
            summary.append("Most often feeling ${dominantMood.mood} ")
            summary.append("(${(dominantMood.frequency * 100).toInt()}% of the time). ")
        }
        
        summary.append("Personality score: ${(state.personalityScore * 100).toInt()}%.")
        
        return summary.toString()
    }
    
    private fun cleanupOldHistory() {
        val cutoff = System.currentTimeMillis() - (MAX_HISTORY_DAYS * 24 * 60 * 60 * 1000L)
        
        moodHistories.keys.forEach { key ->
            val history = moodHistories[key]
            if (history != null) {
                moodHistories[key] = history.filter { it.timestamp >= cutoff }
            }
        }
        
        traitEvolutions.keys.forEach { key ->
            val evolution = traitEvolutions[key]
            if (evolution != null) {
                traitEvolutions[key] = evolution.filter { it.timestamp >= cutoff }
            }
        }
    }
}

// ==================== Data Classes ====================

data class PersonalityState(
    val characterId: Long,
    val traits: Map<String, Double>,
    val currentMood: MoodState,
    val personalityScore: Double,
    val lastInteractionTime: Long,
    val totalInteractions: Int,
    val memoryCount: Int
)

data class PersonalityInteraction(
    val characterId: Long,
    val message: String,
    val sentiment: SentimentType,
    val context: String? = null,
    val timestamp: Long = System.currentTimeMillis()
)

data class MoodChange(
    val newMood: String? = null,
    val intensityChange: Double = 0.0
)

data class MoodEntry(
    val mood: String,
    val intensity: Double,
    val timestamp: Long
)

data class TraitChange(
    val trait: String,
    val oldValue: Double,
    val newValue: Double,
    val change: Double,
    val timestamp: Long
)

enum class TraitTrend {
    INCREASING,
    DECREASING,
    STABLE
}

data class TraitInsight(
    val trait: String,
    val value: Double,
    val trend: TraitTrend
)

data class MoodPattern(
    val mood: String,
    val frequency: Double,
    val averageIntensity: Double
)

data class PersonalityInsights(
    val personalityScore: Double,
    val dominantTraits: List<TraitInsight>,
    val moodPatterns: List<MoodPattern>,
    val stability: Double,
    val totalInteractions: Int,
    val evolutionRate: Double,
    val summary: String
)

sealed class PersonalityUpdateResult {
    data class Success(
        val state: PersonalityState,
        val traitChanges: Map<String, Double>,
        val moodChange: MoodChange? = null,
        val event: SynthPersonalityEvent? = null
    ) : PersonalityUpdateResult()
    
    data class Error(val message: String) : PersonalityUpdateResult()
    
    companion object {
        fun success(
            state: PersonalityState,
            traitChanges: Map<String, Double> = emptyMap(),
            moodChange: MoodChange? = null,
            event: SynthPersonalityEvent? = null
        ) = Success(state, traitChanges, moodChange, event)
        
        fun error(message: String) = Error(message)
    }
}

enum class SentimentType {
    POSITIVE,
    NEGATIVE,
    NEUTRAL,
    EXCITED,
    CALM,
    SAD,
    ANGRY,
    HUMOROUS,
    CONFIDENT
}