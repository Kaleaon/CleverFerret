package com.universalmedialibrary.services.ai

import android.content.Context
import com.universalmedialibrary.data.aientertainment.AIEntertainmentRepository
import com.universalmedialibrary.data.aientertainment.SynthMemory
import com.universalmedialibrary.data.local.dao.ReadingAnalyticsDao
import com.universalmedialibrary.data.local.entity.ReaderAIInsight
import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * AI Book Discussion Service
 * 
 * Enables AI agents to have meaningful, context-aware discussions about books
 * the user is reading. Features include:
 * 
 * - Spoiler-aware discussions based on reading progress
 * - Book-specific memory storage for continuous conversations
 * - Reading journey tracking and reflection
 * - Character and theme discussions
 * - Reading recommendations based on progress
 * 
 * This service integrates with AIReadingProgressService for progress data
 * and AIEntertainmentRepository for memory storage.
 */
@Singleton
class AIBookDiscussionService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiReadingProgressService: AIReadingProgressService,
    private val readingAnalyticsDao: ReadingAnalyticsDao,
    private val aiEntertainmentRepository: AIEntertainmentRepository
) {
    private val json = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    private val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.getDefault())
    
    // ==================== Discussion Initiation ====================
    
    /**
     * Start a book discussion - get all necessary context for AI
     */
    suspend fun initiateBookDiscussion(
        bookId: Long,
        aiCharacterId: Long
    ): BookDiscussionSession? = withContext(Dispatchers.IO) {
        try {
            val context = aiReadingProgressService.getBookContextForDiscussion(bookId)
                ?: return@withContext null
            val position = aiReadingProgressService.getReadingPositionContext(bookId)
                ?: return@withContext null
            
            // Get previous discussions about this book
            val previousDiscussions = getBookDiscussionMemories(aiCharacterId, bookId)
            
            // Build AI system context
            val systemContext = buildDiscussionSystemContext(context, position, previousDiscussions)
            
            BookDiscussionSession(
                bookId = bookId,
                aiCharacterId = aiCharacterId,
                bookTitle = context.title,
                bookAuthor = context.author,
                currentProgress = context.progressPercent,
                discussionContext = context,
                positionContext = position,
                systemPromptAddition = systemContext,
                previousDiscussionCount = previousDiscussions.size,
                suggestedTopics = context.suggestedTopics,
                spoilerGuidelines = position.spoilerWarning
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Get a quick discussion prompt based on current reading
     */
    suspend fun getQuickDiscussionPrompt(bookId: Long): String = withContext(Dispatchers.IO) {
        try {
            val progress = aiReadingProgressService.getBookProgress(bookId)
                ?: return@withContext "Tell me about what you're reading."
            
            when {
                progress.isJustStarted -> {
                    "I see you just started \"${progress.title}\". What made you pick up this book? Any first impressions?"
                }
                progress.isNearingCompletion -> {
                    "You're almost done with \"${progress.title}\"! How are you feeling about the book as you approach the end?"
                }
                progress.isAbandoned -> {
                    "I noticed you haven't read \"${progress.title}\" in a while. Would you like to talk about it or are you thinking of picking up something new?"
                }
                progress.progressPercent in 40f..60f -> {
                    "You're about halfway through \"${progress.title}\". How's the story developing? Any thoughts on the characters or plot so far?"
                }
                else -> {
                    "How's your reading of \"${progress.title}\" going? You're at ${progress.progressPercent.toInt()}% - I'd love to hear your thoughts!"
                }
            }
        } catch (e: Exception) {
            "Tell me about what you're currently reading!"
        }
    }
    
    // ==================== Discussion Memory ====================
    
    /**
     * Store a book discussion as a memory for future reference
     */
    suspend fun storeBookDiscussionMemory(
        aiCharacterId: Long,
        bookId: Long,
        bookTitle: String,
        discussionTopic: String,
        userThoughts: String,
        aiResponse: String,
        progressAtDiscussion: Float
    ): Long = withContext(Dispatchers.IO) {
        try {
            val memoryKey = "book_discussion_${bookId}_${System.currentTimeMillis()}"
            val content = buildString {
                appendLine("Book: $bookTitle")
                appendLine("Progress at discussion: ${progressAtDiscussion.toInt()}%")
                appendLine("Topic: $discussionTopic")
                appendLine("User shared: ${userThoughts.take(500)}")
                appendLine("Discussion summary: ${aiResponse.take(500)}")
            }
            
            val memory = SynthMemory(
                characterId = aiCharacterId,
                key = memoryKey,
                content = content,
                memoryType = "book_discussion",
                importance = calculateDiscussionImportance(userThoughts, progressAtDiscussion),
                context = "Book discussion about $bookTitle at ${progressAtDiscussion.toInt()}% progress",
                tags = json.encodeToString(listOf("book", bookTitle, "discussion", "reading")),
                metadata = json.encodeToString(mapOf(
                    "bookId" to bookId.toString(),
                    "bookTitle" to bookTitle,
                    "progressPercent" to progressAtDiscussion.toString(),
                    "topic" to discussionTopic,
                    "date" to dateFormat.format(Date())
                ))
            )
            
            aiEntertainmentRepository.createMemory(memory)
        } catch (e: Exception) {
            -1L
        }
    }
    
    /**
     * Get previous discussions about a specific book
     */
    suspend fun getBookDiscussionMemories(
        aiCharacterId: Long,
        bookId: Long,
        limit: Int = 10
    ): List<BookDiscussionMemory> = withContext(Dispatchers.IO) {
        try {
            val memories = aiEntertainmentRepository.searchMemories(
                characterId = aiCharacterId,
                query = "book_discussion_$bookId",
                limit = limit
            )
            
            memories.mapNotNull { memory ->
                try {
                    val metadata = json.decodeFromString<Map<String, String>>(memory.metadata)
                    BookDiscussionMemory(
                        memoryId = memory.id,
                        bookId = metadata["bookId"]?.toLongOrNull() ?: bookId,
                        bookTitle = metadata["bookTitle"] ?: "",
                        progressAtDiscussion = metadata["progressPercent"]?.toFloatOrNull() ?: 0f,
                        topic = metadata["topic"] ?: "",
                        discussionDate = memory.createdAt,
                        summaryContent = memory.content
                    )
                } catch (e: Exception) {
                    null
                }
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Store user's opinion/reaction about a book
     */
    suspend fun storeBookOpinion(
        aiCharacterId: Long,
        bookId: Long,
        bookTitle: String,
        opinionType: BookOpinionType,
        opinion: String,
        currentProgress: Float
    ): Long = withContext(Dispatchers.IO) {
        try {
            val memoryKey = "book_opinion_${bookId}_${opinionType.name.lowercase()}"
            val content = buildString {
                appendLine("Book: $bookTitle")
                appendLine("Opinion type: ${opinionType.displayName}")
                appendLine("At progress: ${currentProgress.toInt()}%")
                appendLine("User's thoughts: $opinion")
            }
            
            val importance = when (opinionType) {
                BookOpinionType.OVERALL_RATING -> 0.9f
                BookOpinionType.FAVORITE_PART -> 0.8f
                BookOpinionType.DISLIKED_PART -> 0.7f
                BookOpinionType.CHARACTER_OPINION -> 0.7f
                BookOpinionType.THEME_REFLECTION -> 0.75f
                BookOpinionType.RECOMMENDATION -> 0.85f
                BookOpinionType.EMOTIONAL_REACTION -> 0.8f
            }
            
            val memory = SynthMemory(
                characterId = aiCharacterId,
                key = memoryKey,
                content = content,
                memoryType = "book_opinion",
                importance = importance,
                context = "${opinionType.displayName} about $bookTitle",
                tags = json.encodeToString(listOf("book", bookTitle, "opinion", opinionType.name.lowercase())),
                metadata = json.encodeToString(mapOf(
                    "bookId" to bookId.toString(),
                    "bookTitle" to bookTitle,
                    "opinionType" to opinionType.name,
                    "progressPercent" to currentProgress.toString(),
                    "date" to dateFormat.format(Date())
                ))
            )
            
            aiEntertainmentRepository.createMemory(memory)
        } catch (e: Exception) {
            -1L
        }
    }
    
    /**
     * Get all stored opinions about a book
     */
    suspend fun getBookOpinions(
        aiCharacterId: Long,
        bookId: Long
    ): List<StoredBookOpinion> = withContext(Dispatchers.IO) {
        try {
            val memories = aiEntertainmentRepository.searchMemories(
                characterId = aiCharacterId,
                query = "book_opinion_$bookId",
                limit = 20
            )
            
            memories.mapNotNull { memory ->
                try {
                    val metadata = json.decodeFromString<Map<String, String>>(memory.metadata)
                    StoredBookOpinion(
                        memoryId = memory.id,
                        bookId = metadata["bookId"]?.toLongOrNull() ?: bookId,
                        bookTitle = metadata["bookTitle"] ?: "",
                        opinionType = BookOpinionType.valueOf(metadata["opinionType"] ?: "OVERALL_RATING"),
                        progressAtOpinion = metadata["progressPercent"]?.toFloatOrNull() ?: 0f,
                        opinion = memory.content,
                        createdAt = memory.createdAt
                    )
                } catch (e: Exception) {
                    null
                }
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    // ==================== Discussion Guidance ====================
    
    /**
     * Get discussion guidance for the AI based on reading progress
     */
    suspend fun getDiscussionGuidance(bookId: Long): DiscussionGuidance = withContext(Dispatchers.IO) {
        try {
            val progress = aiReadingProgressService.getBookProgress(bookId)
            val position = aiReadingProgressService.getReadingPositionContext(bookId)
            
            if (progress == null || position == null) {
                return@withContext DiscussionGuidance.default()
            }
            
            val insights = readingAnalyticsDao.getInsightsByItemId(bookId).first()
            
            DiscussionGuidance(
                canDiscussPlot = true,
                plotBoundary = "Up to page ${progress.currentPage} / chapter ${progress.currentChapter}",
                canDiscussEnding = progress.isCompleted || progress.progressPercent >= 95f,
                canDiscussCharacterFates = progress.progressPercent >= 75f,
                canAskForPredictions = !progress.isCompleted && progress.progressPercent < 90f,
                suggestedApproach = getSuggestedApproach(progress),
                emotionalTone = getEmotionalTone(progress),
                discussionDepth = getDiscussionDepth(progress, insights),
                themes = insights.find { it.insightType == ReaderAIInsightType.THEMES }?.keyThemes ?: emptyList(),
                avoidTopics = getTopicsToAvoid(progress)
            )
        } catch (e: Exception) {
            DiscussionGuidance.default()
        }
    }
    
    /**
     * Generate spoiler-safe discussion questions
     */
    suspend fun generateDiscussionQuestions(
        bookId: Long,
        count: Int = 3
    ): List<DiscussionQuestion> = withContext(Dispatchers.IO) {
        try {
            val progress = aiReadingProgressService.getBookProgress(bookId) ?: return@withContext emptyList()
            val context = aiReadingProgressService.getBookContextForDiscussion(bookId) ?: return@withContext emptyList()
            
            val questions = mutableListOf<DiscussionQuestion>()
            
            // Progress-based questions
            when {
                progress.isJustStarted -> {
                    questions.add(DiscussionQuestion(
                        question = "What initially drew you to this book?",
                        category = QuestionCategory.INITIAL_INTEREST,
                        safeAtProgress = 0f
                    ))
                    questions.add(DiscussionQuestion(
                        question = "How do you like the author's writing style so far?",
                        category = QuestionCategory.WRITING_STYLE,
                        safeAtProgress = 5f
                    ))
                }
                progress.progressPercent in 20f..40f -> {
                    questions.add(DiscussionQuestion(
                        question = "Which character are you most interested in following?",
                        category = QuestionCategory.CHARACTERS,
                        safeAtProgress = 20f
                    ))
                    questions.add(DiscussionQuestion(
                        question = "What do you think will happen next?",
                        category = QuestionCategory.PREDICTIONS,
                        safeAtProgress = 20f
                    ))
                }
                progress.progressPercent in 40f..70f -> {
                    questions.add(DiscussionQuestion(
                        question = "Has the story surprised you in any way?",
                        category = QuestionCategory.PLOT,
                        safeAtProgress = 40f
                    ))
                    questions.add(DiscussionQuestion(
                        question = "What themes are you noticing in the story?",
                        category = QuestionCategory.THEMES,
                        safeAtProgress = 40f
                    ))
                }
                progress.progressPercent in 70f..95f -> {
                    questions.add(DiscussionQuestion(
                        question = "How do you think it will end?",
                        category = QuestionCategory.PREDICTIONS,
                        safeAtProgress = 70f
                    ))
                    questions.add(DiscussionQuestion(
                        question = "What's been the most memorable moment so far?",
                        category = QuestionCategory.HIGHLIGHTS,
                        safeAtProgress = 70f
                    ))
                }
                progress.isCompleted || progress.progressPercent >= 95f -> {
                    questions.add(DiscussionQuestion(
                        question = "What did you think of the ending?",
                        category = QuestionCategory.ENDING,
                        safeAtProgress = 95f
                    ))
                    questions.add(DiscussionQuestion(
                        question = "Would you recommend this book to others?",
                        category = QuestionCategory.RECOMMENDATION,
                        safeAtProgress = 95f
                    ))
                }
            }
            
            // Genre-specific questions
            context.genres.forEach { genre ->
                when (genre.lowercase()) {
                    "mystery", "thriller" -> {
                        if (!progress.isCompleted && progress.progressPercent < 80f) {
                            questions.add(DiscussionQuestion(
                                question = "Do you have any theories about who did it?",
                                category = QuestionCategory.PREDICTIONS,
                                safeAtProgress = progress.progressPercent
                            ))
                        }
                    }
                    "fantasy", "science fiction" -> {
                        questions.add(DiscussionQuestion(
                            question = "What do you think of the world-building?",
                            category = QuestionCategory.WORLD_BUILDING,
                            safeAtProgress = 15f
                        ))
                    }
                    "romance" -> {
                        questions.add(DiscussionQuestion(
                            question = "Are you rooting for the main couple?",
                            category = QuestionCategory.CHARACTERS,
                            safeAtProgress = 20f
                        ))
                    }
                }
            }
            
            questions.filter { it.safeAtProgress <= progress.progressPercent }.take(count)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    // ==================== Reading Journey Tracking ====================
    
    /**
     * Get a summary of the user's reading journey with a book
     */
    suspend fun getReadingJourneySummary(
        aiCharacterId: Long,
        bookId: Long
    ): ReadingJourneySummary? = withContext(Dispatchers.IO) {
        try {
            val progress = aiReadingProgressService.getBookProgress(bookId) ?: return@withContext null
            val discussions = getBookDiscussionMemories(aiCharacterId, bookId)
            val opinions = getBookOpinions(aiCharacterId, bookId)
            
            val milestones = mutableListOf<ReadingMilestone>()
            
            // Started reading
            progress.startedDate?.let {
                milestones.add(ReadingMilestone(
                    type = MilestoneType.STARTED,
                    date = it,
                    progressPercent = 0f,
                    description = "Started reading"
                ))
            }
            
            // Add discussion milestones
            discussions.forEach { disc ->
                milestones.add(ReadingMilestone(
                    type = MilestoneType.DISCUSSION,
                    date = disc.discussionDate,
                    progressPercent = disc.progressAtDiscussion,
                    description = "Discussed: ${disc.topic}"
                ))
            }
            
            // Completed
            if (progress.isCompleted) {
                progress.completedDate?.let {
                    milestones.add(ReadingMilestone(
                        type = MilestoneType.COMPLETED,
                        date = it,
                        progressPercent = 100f,
                        description = "Finished reading"
                    ))
                }
            }
            
            ReadingJourneySummary(
                bookId = bookId,
                bookTitle = progress.title,
                author = progress.author,
                currentProgress = progress.progressPercent,
                isCompleted = progress.isCompleted,
                startedDate = progress.startedDate,
                completedDate = progress.completedDate,
                totalReadingTimeMinutes = progress.totalReadingTimeMinutes,
                discussionCount = discussions.size,
                opinionCount = opinions.size,
                milestones = milestones.sortedBy { it.date },
                keyOpinions = opinions.map { "${it.opinionType.displayName}: ${it.opinion.take(100)}" }
            )
        } catch (e: Exception) {
            null
        }
    }
    
    // ==================== AI Context Building ====================
    
    /**
     * Build the system context addition for AI discussions
     */
    private fun buildDiscussionSystemContext(
        context: BookDiscussionContext,
        position: ReadingPositionContext,
        previousDiscussions: List<BookDiscussionMemory>
    ): String {
        return buildString {
            appendLine("=== Book Discussion Context ===")
            appendLine()
            appendLine("The user is reading: \"${context.title}\"${context.author?.let { " by $it" } ?: ""}")
            appendLine("Current progress: ${context.progressSummary}")
            appendLine()
            appendLine("IMPORTANT SPOILER GUIDELINES:")
            appendLine("- ${position.spoilerWarning}")
            appendLine("- Safe to discuss: ${position.safeToDiscuss}")
            position.doNotSpoil?.let {
                appendLine("- DO NOT REVEAL: $it")
            }
            appendLine()
            appendLine("Reading phase: ${position.phaseDescription}")
            appendLine()
            
            if (context.genres.isNotEmpty()) {
                appendLine("Genres: ${context.genres.joinToString(", ")}")
            }
            
            if (context.keyThemes.isNotEmpty()) {
                appendLine("Key themes identified: ${context.keyThemes.joinToString(", ")}")
            }
            
            context.bookSummary?.let {
                appendLine()
                appendLine("Book synopsis: ${it.take(300)}...")
            }
            
            if (previousDiscussions.isNotEmpty()) {
                appendLine()
                appendLine("Previous discussions with user about this book:")
                previousDiscussions.take(3).forEach { disc ->
                    appendLine("- At ${disc.progressAtDiscussion.toInt()}%: ${disc.topic}")
                }
            }
            
            appendLine()
            appendLine("Suggested discussion topics: ${context.suggestedTopics.joinToString(", ")}")
            appendLine()
            appendLine("Be engaging, ask thoughtful questions, and show genuine interest in the user's reading experience.")
        }
    }
    
    private fun calculateDiscussionImportance(userThoughts: String, progress: Float): Float {
        var importance = 0.5f
        
        // Longer, more detailed thoughts are more important
        if (userThoughts.length > 200) importance += 0.1f
        if (userThoughts.length > 500) importance += 0.1f
        
        // Discussions at key points are more important
        if (progress <= 10f || progress >= 90f) importance += 0.1f
        if (progress in 45f..55f) importance += 0.05f
        
        return importance.coerceIn(0.4f, 0.95f)
    }
    
    private fun getSuggestedApproach(progress: DetailedBookProgress): String {
        return when {
            progress.isJustStarted -> "Focus on first impressions and what attracted them to the book"
            progress.isAbandoned -> "Gently ask if they want to continue or move on"
            progress.isNearingCompletion -> "Discuss the journey so far and anticipation for the ending"
            progress.progressPercent in 40f..60f -> "Engage with plot developments and character arcs"
            else -> "Ask about their current thoughts and feelings about the book"
        }
    }
    
    private fun getEmotionalTone(progress: DetailedBookProgress): String {
        return when {
            progress.isJustStarted -> "Curious and encouraging"
            progress.isAbandoned -> "Understanding and supportive"
            progress.isNearingCompletion -> "Excited and reflective"
            progress.readingStreak > 3 -> "Enthusiastic about their dedication"
            else -> "Friendly and interested"
        }
    }
    
    private fun getDiscussionDepth(
        progress: DetailedBookProgress,
        insights: List<ReaderAIInsight>
    ): String {
        val hasInsights = insights.isNotEmpty()
        
        return when {
            progress.isCompleted && hasInsights -> "Deep analysis and full reflection available"
            progress.isCompleted -> "Full discussion possible, no spoiler concerns"
            progress.progressPercent >= 75f && hasInsights -> "Can discuss themes and character development in depth"
            progress.progressPercent >= 50f -> "Moderate depth, careful of late plot reveals"
            else -> "Surface-level discussions, avoid major plot points"
        }
    }
    
    private fun getTopicsToAvoid(progress: DetailedBookProgress): List<String> {
        if (progress.isCompleted) return emptyList()
        
        val avoid = mutableListOf<String>()
        
        if (progress.progressPercent < 90f) {
            avoid.add("The ending")
            avoid.add("How it all turns out")
        }
        
        if (progress.progressPercent < 75f) {
            avoid.add("Major plot twists in the final quarter")
            avoid.add("Character fates")
        }
        
        if (progress.progressPercent < 50f) {
            avoid.add("Mid-book revelations")
            avoid.add("Key plot turns")
        }
        
        return avoid
    }
}

// ==================== Data Classes ====================

@Serializable
data class BookDiscussionSession(
    val bookId: Long,
    val aiCharacterId: Long,
    val bookTitle: String,
    val bookAuthor: String?,
    val currentProgress: Float,
    val discussionContext: BookDiscussionContext,
    val positionContext: ReadingPositionContext,
    val systemPromptAddition: String,
    val previousDiscussionCount: Int,
    val suggestedTopics: List<String>,
    val spoilerGuidelines: String
)

@Serializable
data class BookDiscussionMemory(
    val memoryId: Long,
    val bookId: Long,
    val bookTitle: String,
    val progressAtDiscussion: Float,
    val topic: String,
    val discussionDate: Long,
    val summaryContent: String
)

@Serializable
enum class BookOpinionType(val displayName: String) {
    OVERALL_RATING("Overall Rating"),
    FAVORITE_PART("Favorite Part"),
    DISLIKED_PART("Least Favorite Part"),
    CHARACTER_OPINION("Character Opinion"),
    THEME_REFLECTION("Theme Reflection"),
    RECOMMENDATION("Recommendation"),
    EMOTIONAL_REACTION("Emotional Reaction")
}

@Serializable
data class StoredBookOpinion(
    val memoryId: Long,
    val bookId: Long,
    val bookTitle: String,
    val opinionType: BookOpinionType,
    val progressAtOpinion: Float,
    val opinion: String,
    val createdAt: Long
)

@Serializable
data class DiscussionGuidance(
    val canDiscussPlot: Boolean,
    val plotBoundary: String,
    val canDiscussEnding: Boolean,
    val canDiscussCharacterFates: Boolean,
    val canAskForPredictions: Boolean,
    val suggestedApproach: String,
    val emotionalTone: String,
    val discussionDepth: String,
    val themes: List<String>,
    val avoidTopics: List<String>
) {
    companion object {
        fun default() = DiscussionGuidance(
            canDiscussPlot = true,
            plotBoundary = "Unknown",
            canDiscussEnding = false,
            canDiscussCharacterFates = false,
            canAskForPredictions = true,
            suggestedApproach = "Be curious and engaged",
            emotionalTone = "Friendly",
            discussionDepth = "General",
            themes = emptyList(),
            avoidTopics = listOf("Ending", "Major plot points")
        )
    }
}

@Serializable
data class DiscussionQuestion(
    val question: String,
    val category: QuestionCategory,
    val safeAtProgress: Float
)

@Serializable
enum class QuestionCategory {
    INITIAL_INTEREST,
    WRITING_STYLE,
    CHARACTERS,
    PLOT,
    PREDICTIONS,
    THEMES,
    HIGHLIGHTS,
    WORLD_BUILDING,
    ENDING,
    RECOMMENDATION,
    EMOTIONAL_RESPONSE
}

@Serializable
data class ReadingJourneySummary(
    val bookId: Long,
    val bookTitle: String,
    val author: String?,
    val currentProgress: Float,
    val isCompleted: Boolean,
    val startedDate: Long?,
    val completedDate: Long?,
    val totalReadingTimeMinutes: Int,
    val discussionCount: Int,
    val opinionCount: Int,
    val milestones: List<ReadingMilestone>,
    val keyOpinions: List<String>
)

@Serializable
data class ReadingMilestone(
    val type: MilestoneType,
    val date: Long,
    val progressPercent: Float,
    val description: String
)

@Serializable
enum class MilestoneType {
    STARTED,
    REACHED_QUARTER,
    REACHED_HALFWAY,
    REACHED_THREE_QUARTERS,
    DISCUSSION,
    OPINION_SHARED,
    COMPLETED
}
