package com.universalmedialibrary.services.ai

import android.content.Context
import com.universalmedialibrary.data.aientertainment.AIEntertainmentRepository
import com.universalmedialibrary.data.aientertainment.SynthCharacter
import com.universalmedialibrary.data.aientertainment.SynthMemory
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
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
 * AI Reading Agent Service
 * 
 * A comprehensive AI agent that combines all reading-related features to enable
 * rich, context-aware book discussions. This agent:
 * 
 * 1. KNOWS what the user is reading and how far they are
 * 2. REMEMBERS past discussions about books
 * 3. RESPECTS spoiler boundaries based on reading progress
 * 4. SUGGESTS discussion topics appropriate to the user's progress
 * 5. TRACKS the user's reading journey and preferences
 * 6. PROVIDES personalized book recommendations
 * 
 * This is the main entry point for AI-powered reading discussions.
 */
@Singleton
class AIReadingAgentService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val aiReadingProgressService: AIReadingProgressService,
    private val aiBookDiscussionService: AIBookDiscussionService,
    private val aiLibraryBrowserService: AILibraryBrowserService,
    private val aiEntertainmentRepository: AIEntertainmentRepository
) {
    private val json = Json {
        prettyPrint = true
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    private val dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault())
    
    // Current agent state
    private val _agentState = MutableStateFlow(ReadingAgentState())
    val agentState: StateFlow<ReadingAgentState> = _agentState.asStateFlow()
    
    private val _isProcessing = MutableStateFlow(false)
    val isProcessing: StateFlow<Boolean> = _isProcessing.asStateFlow()
    
    // ==================== Agent Initialization ====================
    
    /**
     * Initialize the reading agent for a specific AI character
     * Call this when starting a conversation
     */
    suspend fun initializeAgent(aiCharacterId: Long): ReadingAgentState = withContext(Dispatchers.IO) {
        _isProcessing.value = true
        
        try {
            // Get current reading status
            val currentBooks = aiReadingProgressService.getCurrentlyReading(5)
            val primaryBook = currentBooks.firstOrNull()
            
            // Get reading history
            val readingHistory = aiReadingProgressService.getReadingHistory(30)
            
            // Get library stats
            val libraryStats = aiLibraryBrowserService.getLibraryStats()
            
            // Build context summary
            val contextSummary = aiReadingProgressService.getReadingContextSummary()
            
            // Get previous book discussions
            val recentDiscussions = if (primaryBook != null) {
                aiBookDiscussionService.getBookDiscussionMemories(aiCharacterId, primaryBook.bookId, 5)
            } else {
                emptyList()
            }
            
            val state = ReadingAgentState(
                isInitialized = true,
                aiCharacterId = aiCharacterId,
                currentBooks = currentBooks,
                primaryBook = primaryBook,
                readingHistory = readingHistory,
                libraryStats = libraryStats,
                contextSummary = contextSummary,
                recentDiscussionCount = recentDiscussions.size,
                lastInitialized = System.currentTimeMillis()
            )
            
            _agentState.value = state
            state
        } catch (e: Exception) {
            ReadingAgentState(error = e.message)
        } finally {
            _isProcessing.value = false
        }
    }
    
    // ==================== System Prompt Enhancement ====================
    
    /**
     * Generate a system prompt addition that gives the AI full context about
     * the user's reading status
     */
    suspend fun generateReadingSystemPrompt(aiCharacterId: Long): String = withContext(Dispatchers.IO) {
        val state = if (_agentState.value.isInitialized && _agentState.value.aiCharacterId == aiCharacterId) {
            _agentState.value
        } else {
            initializeAgent(aiCharacterId)
        }
        
        buildString {
            appendLine()
            appendLine("=== READING AWARENESS CONTEXT ===")
            appendLine()
            appendLine("You have access to the user's reading progress and can discuss their books with them.")
            appendLine("Always be mindful of spoilers based on their progress.")
            appendLine()
            
            if (state.currentBooks.isNotEmpty()) {
                appendLine(state.contextSummary)
                appendLine()
                
                // Add specific guidance for the primary book
                state.primaryBook?.let { book ->
                    appendLine("=== Primary Book Discussion Context ===")
                    appendLine("The user is primarily reading: \"${book.title}\"")
                    book.author?.let { appendLine("Author: $it") }
                    appendLine("Progress: ${book.progressPercent.toInt()}% (page ${book.currentPage}/${book.totalPages})")
                    appendLine()
                    
                    if (book.isJustStarted) {
                        appendLine("📌 USER JUST STARTED: Focus on first impressions, what drew them to the book.")
                        appendLine("   AVOID: Any plot spoilers beyond the opening.")
                    } else if (book.isNearingCompletion) {
                        appendLine("📌 USER ALMOST FINISHED: Can discuss most of the book freely.")
                        appendLine("   AVOID: Only the ending/resolution if not yet complete.")
                    } else {
                        appendLine("📌 MID-BOOK: Can discuss events up to page ${book.currentPage}.")
                        appendLine("   AVOID: Plot points, twists, or revelations beyond their current page.")
                    }
                    appendLine()
                    
                    if (book.genres.isNotEmpty()) {
                        appendLine("Genres: ${book.genres.joinToString(", ")}")
                    }
                }
                
                // Add reading statistics
                state.readingHistory?.let { history ->
                    if (history.totalReadingTimeMinutes > 0) {
                        appendLine()
                        appendLine("Reading habits (last ${history.periodDays} days):")
                        appendLine("- Total reading time: ${formatMinutes(history.totalReadingTimeMinutes)}")
                        appendLine("- Books in progress: ${history.booksInProgress}")
                        appendLine("- Books completed: ${history.booksCompleted}")
                        if (history.averageMinutesPerDay > 0) {
                            appendLine("- Average reading: ${history.averageMinutesPerDay} min/day")
                        }
                    }
                }
            } else {
                appendLine("The user is not currently reading any books in the library.")
                appendLine("You can ask about their reading interests or recommend books to explore.")
            }
            
            // Library overview
            state.libraryStats?.let { stats ->
                appendLine()
                appendLine("Library Overview:")
                appendLine("- Books: ${stats.totalBooks}")
                appendLine("- Comics: ${stats.totalComics}")
                if (stats.recentAdditions.isNotEmpty()) {
                    appendLine("- Recent additions: ${stats.recentAdditions.take(3).joinToString(", ")}")
                }
            }
            
            appendLine()
            appendLine("=== END READING CONTEXT ===")
            appendLine()
            appendLine("Feel free to ask about their current book, discuss plot points (within their progress),")
            appendLine("share related recommendations, or help them explore their reading interests.")
        }
    }
    
    // ==================== Conversation Assistance ====================
    
    /**
     * Analyze a user message and determine if it's about their reading
     * Returns suggestions for how to respond
     */
    suspend fun analyzeReadingIntent(
        userMessage: String,
        aiCharacterId: Long
    ): ReadingIntentAnalysis = withContext(Dispatchers.IO) {
        val lowerMessage = userMessage.lowercase()
        
        // Ensure agent is initialized
        if (!_agentState.value.isInitialized || _agentState.value.aiCharacterId != aiCharacterId) {
            initializeAgent(aiCharacterId)
        }
        
        val state = _agentState.value
        
        // Detect reading-related intent
        val isAboutReading = containsReadingKeywords(lowerMessage)
        val isAskingAboutCurrentBook = containsCurrentBookKeywords(lowerMessage)
        val isAskingAboutProgress = containsProgressKeywords(lowerMessage)
        val isAskingForRecommendation = containsRecommendationKeywords(lowerMessage)
        val isDiscussingPlot = containsPlotDiscussionKeywords(lowerMessage)
        val isAskingAboutCharacters = containsCharacterKeywords(lowerMessage)
        val isSharingOpinion = containsOpinionKeywords(lowerMessage)
        
        // Detect which book they might be talking about
        val mentionedBook = detectMentionedBook(lowerMessage, state.currentBooks)
        
        // Generate suggestions
        val suggestions = mutableListOf<String>()
        val toolsToUse = mutableListOf<String>()
        val warningsAndGuidelines = mutableListOf<String>()
        
        if (isAskingAboutCurrentBook || isAskingAboutProgress) {
            toolsToUse.add("get_current_book")
            suggestions.add("Share their current reading progress with enthusiasm")
        }
        
        if (isAskingForRecommendation) {
            toolsToUse.add("get_recommendations")
            suggestions.add("Provide personalized recommendations based on their library")
        }
        
        if (isDiscussingPlot || isAskingAboutCharacters) {
            mentionedBook?.let { book ->
                toolsToUse.add("get_reading_position")
                warningsAndGuidelines.add("User is at ${book.progressPercent.toInt()}% - avoid spoilers beyond page ${book.currentPage}")
                
                if (book.isJustStarted) {
                    warningsAndGuidelines.add("They just started - only discuss opening/setup")
                } else if (book.isNearingCompletion) {
                    warningsAndGuidelines.add("Almost done - can discuss most events except ending")
                }
            } ?: run {
                state.primaryBook?.let { book ->
                    warningsAndGuidelines.add("Assuming discussion about \"${book.title}\" - at ${book.progressPercent.toInt()}%")
                }
            }
        }
        
        if (isSharingOpinion) {
            toolsToUse.add("store_book_opinion")
            suggestions.add("Acknowledge and remember their opinion for future discussions")
        }
        
        ReadingIntentAnalysis(
            isAboutReading = isAboutReading,
            intentType = determineIntentType(
                isAskingAboutCurrentBook, isAskingAboutProgress,
                isAskingForRecommendation, isDiscussingPlot,
                isAskingAboutCharacters, isSharingOpinion
            ),
            mentionedBook = mentionedBook,
            suggestedResponses = suggestions,
            suggestedTools = toolsToUse,
            spoilerWarnings = warningsAndGuidelines,
            currentBookContext = state.primaryBook?.let { book ->
                "Currently reading \"${book.title}\" at ${book.progressPercent.toInt()}%"
            }
        )
    }
    
    /**
     * Get a conversation starter about the user's reading
     */
    suspend fun getReadingConversationStarter(aiCharacterId: Long): String = withContext(Dispatchers.IO) {
        val state = if (_agentState.value.isInitialized && _agentState.value.aiCharacterId == aiCharacterId) {
            _agentState.value
        } else {
            initializeAgent(aiCharacterId)
        }
        
        val primaryBook = state.primaryBook
        
        when {
            primaryBook != null && primaryBook.isJustStarted -> {
                "I see you just started \"${primaryBook.title}\"! What made you pick up this book? I'd love to hear your first impressions!"
            }
            primaryBook != null && primaryBook.isNearingCompletion -> {
                "You're so close to finishing \"${primaryBook.title}\"! How are you feeling as you approach the end? No spoilers from me, I promise!"
            }
            primaryBook != null -> {
                val prompt = aiBookDiscussionService.getQuickDiscussionPrompt(primaryBook.bookId)
                prompt
            }
            state.readingHistory?.booksCompleted ?: 0 > 0 -> {
                "I noticed you've completed some books recently! Would you like to discuss any of them, or are you looking for something new to read?"
            }
            state.libraryStats?.totalBooks ?: 0 > 0 -> {
                "You have quite a library! Have you started anything recently, or would you like some suggestions on what to pick up next?"
            }
            else -> {
                "What have you been reading lately? I'd love to hear about your favorite books or help you find something new!"
            }
        }
    }
    
    // ==================== Book Discussion Helpers ====================
    
    /**
     * Start a focused discussion about a specific book
     */
    suspend fun startBookDiscussion(
        aiCharacterId: Long,
        bookId: Long
    ): BookDiscussionSession? = withContext(Dispatchers.IO) {
        aiBookDiscussionService.initiateBookDiscussion(bookId, aiCharacterId)
    }
    
    /**
     * Get discussion questions safe for the user's current progress
     */
    suspend fun getSafeDiscussionQuestions(bookId: Long, count: Int = 3): List<DiscussionQuestion> {
        return aiBookDiscussionService.generateDiscussionQuestions(bookId, count)
    }
    
    /**
     * Store a discussion for future reference
     */
    suspend fun rememberDiscussion(
        aiCharacterId: Long,
        bookId: Long,
        bookTitle: String,
        topic: String,
        userThoughts: String,
        aiResponse: String,
        progress: Float
    ): Boolean = withContext(Dispatchers.IO) {
        val memoryId = aiBookDiscussionService.storeBookDiscussionMemory(
            aiCharacterId = aiCharacterId,
            bookId = bookId,
            bookTitle = bookTitle,
            discussionTopic = topic,
            userThoughts = userThoughts,
            aiResponse = aiResponse,
            progressAtDiscussion = progress
        )
        memoryId > 0
    }
    
    /**
     * Store the user's opinion about a book
     */
    suspend fun rememberOpinion(
        aiCharacterId: Long,
        bookId: Long,
        bookTitle: String,
        opinionType: BookOpinionType,
        opinion: String,
        progress: Float
    ): Boolean = withContext(Dispatchers.IO) {
        val memoryId = aiBookDiscussionService.storeBookOpinion(
            aiCharacterId = aiCharacterId,
            bookId = bookId,
            bookTitle = bookTitle,
            opinionType = opinionType,
            opinion = opinion,
            currentProgress = progress
        )
        memoryId > 0
    }
    
    /**
     * Get the user's reading journey with a book
     */
    suspend fun getReadingJourney(
        aiCharacterId: Long,
        bookId: Long
    ): ReadingJourneySummary? {
        return aiBookDiscussionService.getReadingJourneySummary(aiCharacterId, bookId)
    }
    
    // ==================== Reading Memory Integration ====================
    
    /**
     * Store a general reading-related memory
     */
    suspend fun storeReadingMemory(
        aiCharacterId: Long,
        key: String,
        content: String,
        memoryType: String = "reading_preference",
        importance: Float = 0.6f
    ): Long = withContext(Dispatchers.IO) {
        try {
            val memory = SynthMemory(
                characterId = aiCharacterId,
                key = key,
                content = content,
                memoryType = memoryType,
                importance = importance,
                context = "Reading-related memory",
                tags = json.encodeToString(listOf("reading", memoryType)),
                metadata = json.encodeToString(mapOf(
                    "source" to "reading_agent",
                    "date" to dateFormat.format(Date())
                ))
            )
            aiEntertainmentRepository.createMemory(memory)
        } catch (e: Exception) {
            -1L
        }
    }
    
    /**
     * Search for reading-related memories
     */
    suspend fun recallReadingMemories(
        aiCharacterId: Long,
        query: String,
        limit: Int = 10
    ): List<SynthMemory> = withContext(Dispatchers.IO) {
        try {
            aiEntertainmentRepository.searchMemories(aiCharacterId, query, limit)
                .filter { it.memoryType.contains("reading") || it.memoryType.contains("book") }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Store the user's reading preferences
     */
    suspend fun storeReadingPreference(
        aiCharacterId: Long,
        preferenceType: ReadingPreferenceType,
        value: String
    ): Long {
        return storeReadingMemory(
            aiCharacterId = aiCharacterId,
            key = "reading_pref_${preferenceType.name.lowercase()}",
            content = "${preferenceType.displayName}: $value",
            memoryType = "reading_preference",
            importance = 0.75f
        )
    }
    
    // ==================== Helper Methods ====================
    
    private fun containsReadingKeywords(message: String): Boolean {
        val keywords = listOf(
            "book", "reading", "read", "page", "chapter", "author",
            "novel", "story", "fiction", "finished", "completing",
            "started", "beginning", "ending", "character"
        )
        return keywords.any { message.contains(it) }
    }
    
    private fun containsCurrentBookKeywords(message: String): Boolean {
        val keywords = listOf(
            "currently reading", "reading now", "current book",
            "what am i reading", "am i reading", "my book"
        )
        return keywords.any { message.contains(it) }
    }
    
    private fun containsProgressKeywords(message: String): Boolean {
        val keywords = listOf(
            "how far", "progress", "what page", "where am i",
            "how much", "percentage", "almost done", "finished"
        )
        return keywords.any { message.contains(it) }
    }
    
    private fun containsRecommendationKeywords(message: String): Boolean {
        val keywords = listOf(
            "recommend", "suggestion", "what should i read",
            "similar to", "like this", "next book", "looking for"
        )
        return keywords.any { message.contains(it) }
    }
    
    private fun containsPlotDiscussionKeywords(message: String): Boolean {
        val keywords = listOf(
            "what happens", "plot", "story", "scene", "moment",
            "event", "twist", "reveal", "discovery", "conflict"
        )
        return keywords.any { message.contains(it) }
    }
    
    private fun containsCharacterKeywords(message: String): Boolean {
        val keywords = listOf(
            "character", "protagonist", "antagonist", "hero",
            "villain", "relationship", "romance", "development"
        )
        return keywords.any { message.contains(it) }
    }
    
    private fun containsOpinionKeywords(message: String): Boolean {
        val keywords = listOf(
            "i think", "i feel", "love", "hate", "favorite",
            "least favorite", "opinion", "rating", "recommend"
        )
        return keywords.any { message.contains(it) }
    }
    
    private fun detectMentionedBook(
        message: String,
        currentBooks: List<CurrentReadingInfo>
    ): CurrentReadingInfo? {
        // Check if any current book title is mentioned
        for (book in currentBooks) {
            if (message.contains(book.title.lowercase())) {
                return book
            }
            // Also check for partial title matches
            val titleWords = book.title.lowercase().split(" ").filter { it.length > 3 }
            if (titleWords.count { message.contains(it) } >= 2) {
                return book
            }
        }
        return null
    }
    
    private fun determineIntentType(
        isCurrentBook: Boolean,
        isProgress: Boolean,
        isRecommendation: Boolean,
        isPlot: Boolean,
        isCharacter: Boolean,
        isOpinion: Boolean
    ): ReadingIntentType {
        return when {
            isCurrentBook || isProgress -> ReadingIntentType.PROGRESS_CHECK
            isRecommendation -> ReadingIntentType.RECOMMENDATION_REQUEST
            isPlot || isCharacter -> ReadingIntentType.PLOT_DISCUSSION
            isOpinion -> ReadingIntentType.SHARING_OPINION
            else -> ReadingIntentType.GENERAL_READING
        }
    }
    
    private fun formatMinutes(minutes: Int): String {
        return when {
            minutes < 60 -> "$minutes min"
            minutes < 120 -> "1 hr ${minutes % 60} min"
            else -> "${minutes / 60} hrs ${minutes % 60} min"
        }
    }
    
    /**
     * Refresh the agent state with current data
     */
    suspend fun refreshState(aiCharacterId: Long) {
        initializeAgent(aiCharacterId)
    }
    
    /**
     * Clear the agent state
     */
    fun clearState() {
        _agentState.value = ReadingAgentState()
    }
}

// ==================== Data Classes ====================

@Serializable
data class ReadingAgentState(
    val isInitialized: Boolean = false,
    val aiCharacterId: Long = 0,
    val currentBooks: List<CurrentReadingInfo> = emptyList(),
    val primaryBook: CurrentReadingInfo? = null,
    val readingHistory: ReadingHistorySummary? = null,
    val libraryStats: LibraryStats? = null,
    val contextSummary: String = "",
    val recentDiscussionCount: Int = 0,
    val lastInitialized: Long = 0,
    val error: String? = null
)

@Serializable
data class ReadingIntentAnalysis(
    val isAboutReading: Boolean,
    val intentType: ReadingIntentType,
    val mentionedBook: CurrentReadingInfo?,
    val suggestedResponses: List<String>,
    val suggestedTools: List<String>,
    val spoilerWarnings: List<String>,
    val currentBookContext: String?
)

@Serializable
enum class ReadingIntentType {
    PROGRESS_CHECK,
    PLOT_DISCUSSION,
    CHARACTER_DISCUSSION,
    RECOMMENDATION_REQUEST,
    SHARING_OPINION,
    READING_HISTORY,
    GENERAL_READING
}

@Serializable
enum class ReadingPreferenceType(val displayName: String) {
    FAVORITE_GENRE("Favorite Genre"),
    FAVORITE_AUTHOR("Favorite Author"),
    READING_PACE("Reading Pace"),
    PREFERRED_LENGTH("Preferred Book Length"),
    DISLIKED_GENRE("Disliked Genre"),
    READING_GOAL("Reading Goal"),
    PREFERRED_FORMAT("Preferred Format")
}
