package com.universalmedialibrary.services.ai

import android.content.Context
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingAnalyticsDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.local.entity.ReadingSessionLog
import com.universalmedialibrary.services.reading.ReadingAnalyticsService
import com.universalmedialibrary.services.reading.TimePeriod
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Date
import java.util.Locale
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * AI Reading Progress Service
 * 
 * Provides comprehensive reading progress data for AI agents to:
 * - See what books the user is currently reading
 * - Understand how far they are in each book
 * - Access reading history and patterns
 * - Get context for book discussions
 * - Track reading sessions and habits
 * 
 * This service enables meaningful conversations about the user's reading journey.
 */
@Singleton
class AIReadingProgressService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val readingProgressDao: ReadingProgressDao,
    private val readingAnalyticsDao: ReadingAnalyticsDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val readingAnalyticsService: ReadingAnalyticsService
) {
    private val json = Json { 
        prettyPrint = true 
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    private val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.getDefault())
    private val timeFormat = SimpleDateFormat("HH:mm", Locale.getDefault())
    private val fullDateFormat = SimpleDateFormat("MMMM d, yyyy", Locale.getDefault())
    
    // ==================== Current Reading Status ====================
    
    /**
     * Get the book(s) the user is currently reading
     * Returns detailed information about active reading sessions
     */
    suspend fun getCurrentlyReading(limit: Int = 5): List<CurrentReadingInfo> = withContext(Dispatchers.IO) {
        try {
            val inProgressItems = readingProgressDao.getRecentlyRead(limit).first()
            
            inProgressItems.mapNotNull { progress ->
                val mediaItem = mediaItemDao.getMediaItemById(progress.itemId) ?: return@mapNotNull null
                val metadata = metadataDao.getCommonMetadataByItemId(progress.itemId)
                val people = metadataDao.getPeopleForItem(progress.itemId)
                val genres = metadataDao.getGenresForItem(progress.itemId)
                
                val totalPages = estimateTotalPages(progress)
                val remainingPages = (totalPages - progress.currentPage).coerceAtLeast(0)
                val estimatedTimeRemaining = estimateTimeRemaining(progress, remainingPages)
                
                CurrentReadingInfo(
                    bookId = progress.itemId,
                    title = metadata?.title ?: mediaItem.fileName.substringBeforeLast('.'),
                    author = people.firstOrNull { it.role == "AUTHOR" }?.name,
                    currentPage = progress.currentPage,
                    totalPages = totalPages,
                    currentChapter = progress.currentChapter,
                    progressPercent = progress.percentage,
                    lastReadDate = progress.lastUpdate,
                    lastReadFormatted = formatLastRead(progress.lastUpdate),
                    totalReadingTimeMinutes = TimeUnit.MILLISECONDS.toMinutes(progress.totalReadingTime).toInt(),
                    sessionCount = progress.sessionCount,
                    estimatedMinutesRemaining = estimatedTimeRemaining,
                    genres = genres.map { it.name },
                    summary = metadata?.summary ?: metadata?.plot,
                    coverPath = metadata?.coverImagePath,
                    startedDate = progress.startedDate,
                    startedDateFormatted = progress.startedDate?.let { fullDateFormat.format(Date(it)) },
                    readingSpeed = progress.readingSpeed,
                    isNearingCompletion = progress.percentage >= 80f,
                    isJustStarted = progress.percentage <= 10f
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get the primary book the user is currently focused on
     * (The most recently read book that isn't completed)
     */
    suspend fun getPrimaryCurrentBook(): CurrentReadingInfo? = withContext(Dispatchers.IO) {
        getCurrentlyReading(1).firstOrNull()
    }
    
    /**
     * Get detailed progress for a specific book
     */
    suspend fun getBookProgress(bookId: Long): DetailedBookProgress? = withContext(Dispatchers.IO) {
        try {
            val progress = readingProgressDao.getProgressByItemIdSnapshot(bookId) ?: return@withContext null
            val mediaItem = mediaItemDao.getMediaItemById(bookId) ?: return@withContext null
            val metadata = metadataDao.getCommonMetadataByItemId(bookId)
            val people = metadataDao.getPeopleForItem(bookId)
            val genres = metadataDao.getGenresForItem(bookId)
            
            val totalPages = estimateTotalPages(progress)
            val sessions = readingAnalyticsDao.getSessionsByItemId(bookId).first()
            val totalReadingTime = readingAnalyticsDao.getTotalReadingTime(bookId) ?: 0L
            
            // Calculate reading patterns
            val readingPattern = analyzeReadingPattern(sessions)
            val averageSessionLength = if (sessions.isNotEmpty()) {
                sessions.sumOf { it.durationSeconds } / sessions.size
            } else 0L
            
            DetailedBookProgress(
                bookId = bookId,
                title = metadata?.title ?: mediaItem.fileName.substringBeforeLast('.'),
                author = people.firstOrNull { it.role == "AUTHOR" }?.name,
                currentPage = progress.currentPage,
                totalPages = totalPages,
                currentChapter = progress.currentChapter,
                totalChapters = estimateTotalChapters(metadata),
                progressPercent = progress.percentage,
                pagesRead = progress.pagesRead,
                pagesRemaining = (totalPages - progress.currentPage).coerceAtLeast(0),
                
                // Time tracking
                totalReadingTimeMinutes = TimeUnit.SECONDS.toMinutes(totalReadingTime).toInt(),
                averageSessionMinutes = TimeUnit.SECONDS.toMinutes(averageSessionLength).toInt(),
                estimatedMinutesRemaining = estimateTimeRemaining(progress, totalPages - progress.currentPage),
                
                // Session info
                sessionCount = sessions.size,
                lastSessionDate = sessions.firstOrNull()?.startTime,
                firstSessionDate = sessions.lastOrNull()?.startTime,
                
                // Reading pattern analysis
                readingPattern = readingPattern,
                preferredReadingTime = detectPreferredReadingTime(sessions),
                readingStreak = calculateReadingStreak(bookId),
                
                // Book info
                genres = genres.map { it.name },
                summary = metadata?.summary ?: metadata?.plot,
                year = metadata?.year,
                rating = metadata?.rating?.toFloat(),
                
                // Status flags
                isCompleted = progress.isCompleted,
                completedDate = progress.completedDate,
                startedDate = progress.startedDate,
                isNearingCompletion = progress.percentage >= 80f,
                isJustStarted = progress.percentage <= 10f,
                isAbandoned = isBookAbandoned(progress)
            )
        } catch (e: Exception) {
            null
        }
    }
    
    // ==================== Reading History & Patterns ====================
    
    /**
     * Get the user's reading history summary
     */
    suspend fun getReadingHistory(days: Int = 30): ReadingHistorySummary = withContext(Dispatchers.IO) {
        try {
            val stats = readingAnalyticsService.getReadingStats(
                if (days <= 7) TimePeriod.WEEKLY
                else if (days <= 31) TimePeriod.MONTHLY
                else TimePeriod.YEARLY
            )
            
            val completedBooks = readingProgressDao.getCompleted().first()
            val inProgressBooks = readingProgressDao.getInProgressItems().first()
            
            // Get recently completed books
            val recentlyCompleted = completedBooks
                .filter { it.completedDate != null && it.completedDate > System.currentTimeMillis() - TimeUnit.DAYS.toMillis(days.toLong()) }
                .take(5)
                .mapNotNull { progress ->
                    val metadata = metadataDao.getCommonMetadataByItemId(progress.itemId)
                    val people = metadataDao.getPeopleForItem(progress.itemId)
                    CompletedBookInfo(
                        bookId = progress.itemId,
                        title = metadata?.title ?: "Unknown",
                        author = people.firstOrNull { it.role == "AUTHOR" }?.name,
                        completedDate = progress.completedDate!!,
                        completedDateFormatted = fullDateFormat.format(Date(progress.completedDate)),
                        totalReadingTimeMinutes = TimeUnit.MILLISECONDS.toMinutes(progress.totalReadingTime).toInt()
                    )
                }
            
            ReadingHistorySummary(
                periodDays = days,
                totalReadingTimeMinutes = TimeUnit.SECONDS.toMinutes(stats.totalReadingTimeSeconds).toInt(),
                totalPagesRead = stats.totalPagesRead,
                booksCompleted = recentlyCompleted.size,
                booksInProgress = inProgressBooks.size,
                totalSessions = stats.totalSessions,
                daysWithReading = stats.daysRead,
                averageMinutesPerDay = TimeUnit.SECONDS.toMinutes(stats.dailyAverage).toInt(),
                averageMinutesPerSession = TimeUnit.SECONDS.toMinutes(stats.averageSessionDuration).toInt(),
                recentlyCompletedBooks = recentlyCompleted,
                readingHeatmap = stats.heatmapData.mapValues { TimeUnit.SECONDS.toMinutes(it.value).toInt() }
            )
        } catch (e: Exception) {
            ReadingHistorySummary(periodDays = days)
        }
    }
    
    /**
     * Get books the user has completed
     */
    suspend fun getCompletedBooks(limit: Int = 20): List<CompletedBookInfo> = withContext(Dispatchers.IO) {
        try {
            val completedProgress = readingProgressDao.getCompleted().first().take(limit)
            
            completedProgress.mapNotNull { progress ->
                val metadata = metadataDao.getCommonMetadataByItemId(progress.itemId)
                val people = metadataDao.getPeopleForItem(progress.itemId)
                
                CompletedBookInfo(
                    bookId = progress.itemId,
                    title = metadata?.title ?: "Unknown",
                    author = people.firstOrNull { it.role == "AUTHOR" }?.name,
                    completedDate = progress.completedDate ?: progress.lastUpdate,
                    completedDateFormatted = fullDateFormat.format(Date(progress.completedDate ?: progress.lastUpdate)),
                    totalReadingTimeMinutes = TimeUnit.MILLISECONDS.toMinutes(progress.totalReadingTime).toInt()
                )
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    // ==================== Reading Context for AI Discussions ====================
    
    /**
     * Get rich context about a book for AI to use in discussions
     * This is the primary method for AI to understand what the user is reading
     */
    suspend fun getBookContextForDiscussion(bookId: Long): BookDiscussionContext? = withContext(Dispatchers.IO) {
        try {
            val progress = getBookProgress(bookId) ?: return@withContext null
            val mediaItem = mediaItemDao.getMediaItemById(bookId) ?: return@withContext null
            val metadata = metadataDao.getCommonMetadataByItemId(bookId)
            val insights = readingAnalyticsDao.getInsightsByItemId(bookId).first()
            
            // Build context strings for AI
            val progressContext = buildProgressContext(progress)
            val readingPatternContext = buildPatternContext(progress)
            val topicSuggestions = generateDiscussionTopics(progress, insights)
            
            BookDiscussionContext(
                bookId = bookId,
                title = progress.title,
                author = progress.author,
                
                // Progress summary for AI
                progressSummary = progressContext,
                patternSummary = readingPatternContext,
                
                // Detailed data
                currentPage = progress.currentPage,
                totalPages = progress.totalPages,
                currentChapter = progress.currentChapter,
                progressPercent = progress.progressPercent,
                
                // Book information
                genres = progress.genres,
                bookSummary = metadata?.summary ?: metadata?.plot,
                year = progress.year,
                
                // AI-generated insights if available
                existingSummary = insights.find { it.insightType.name == "SUMMARY" }?.summary,
                keyThemes = insights.find { it.insightType.name == "THEMES" }?.keyThemes ?: emptyList(),
                characterAnalysis = insights.find { it.insightType.name == "CHARACTER_ANALYSIS" }?.characterAnalysis,
                
                // Suggested discussion topics
                suggestedTopics = topicSuggestions,
                
                // Reading journey info
                daysReading = calculateDaysReading(progress.firstSessionDate, progress.lastSessionDate),
                isNearingEnd = progress.isNearingCompletion,
                hasJustStarted = progress.isJustStarted,
                
                // Timing context
                lastReadDescription = formatLastRead(progress.lastSessionDate ?: 0L),
                startedDescription = progress.startedDate?.let { "Started on ${fullDateFormat.format(Date(it))}" }
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Get a formatted summary of all current reading for AI context
     * This can be injected into system prompts
     */
    suspend fun getReadingContextSummary(): String = withContext(Dispatchers.IO) {
        try {
            val currentBooks = getCurrentlyReading(5)
            if (currentBooks.isEmpty()) {
                return@withContext "The user is not currently reading any books."
            }
            
            val summary = StringBuilder()
            summary.appendLine("=== User's Current Reading ===")
            
            currentBooks.forEachIndexed { index, book ->
                summary.appendLine()
                summary.appendLine("${index + 1}. \"${book.title}\"${book.author?.let { " by $it" } ?: ""}")
                summary.appendLine("   Progress: ${book.progressPercent.toInt()}% (page ${book.currentPage}/${book.totalPages})")
                summary.appendLine("   ${book.lastReadFormatted}")
                summary.appendLine("   Reading time: ${formatDuration(book.totalReadingTimeMinutes)}")
                
                if (book.isNearingCompletion) {
                    summary.appendLine("   📖 Nearing completion!")
                } else if (book.isJustStarted) {
                    summary.appendLine("   🆕 Just started reading")
                }
                
                book.estimatedMinutesRemaining?.let {
                    summary.appendLine("   Estimated time remaining: ${formatDuration(it)}")
                }
            }
            
            // Add recent reading stats
            val history = getReadingHistory(7)
            if (history.totalReadingTimeMinutes > 0) {
                summary.appendLine()
                summary.appendLine("=== This Week's Reading ===")
                summary.appendLine("Total reading time: ${formatDuration(history.totalReadingTimeMinutes)}")
                summary.appendLine("Pages read: ${history.totalPagesRead}")
                summary.appendLine("Reading sessions: ${history.totalSessions}")
                if (history.booksCompleted > 0) {
                    summary.appendLine("Books completed: ${history.booksCompleted}")
                }
            }
            
            summary.toString()
        } catch (e: Exception) {
            "Unable to retrieve reading information."
        }
    }
    
    /**
     * Get context specifically about where the user is in a book
     * (For AI to reference when discussing plot points)
     */
    suspend fun getReadingPositionContext(bookId: Long): ReadingPositionContext? = withContext(Dispatchers.IO) {
        try {
            val progress = readingProgressDao.getProgressByItemIdSnapshot(bookId) ?: return@withContext null
            val metadata = metadataDao.getCommonMetadataByItemId(bookId)
            val totalPages = estimateTotalPages(progress)
            
            // Determine reading phase
            val phase = when {
                progress.percentage >= 90f -> ReadingPhase.FINALE
                progress.percentage >= 75f -> ReadingPhase.CLIMAX
                progress.percentage >= 50f -> ReadingPhase.MIDDLE
                progress.percentage >= 25f -> ReadingPhase.RISING_ACTION
                progress.percentage >= 10f -> ReadingPhase.EARLY
                else -> ReadingPhase.BEGINNING
            }
            
            ReadingPositionContext(
                bookId = bookId,
                title = metadata?.title ?: "Unknown",
                currentPage = progress.currentPage,
                totalPages = totalPages,
                currentChapter = progress.currentChapter,
                progressPercent = progress.percentage,
                phase = phase,
                phaseDescription = getPhaseDescription(phase),
                spoilerWarning = getSpoilerWarning(phase),
                safeToDiscuss = "Everything up to page ${progress.currentPage} (chapter ${progress.currentChapter})",
                doNotSpoil = if (progress.percentage < 90f) "Plot points after page ${progress.currentPage}" else null
            )
        } catch (e: Exception) {
            null
        }
    }
    
    // ==================== Helper Methods ====================
    
    private fun estimateTotalPages(progress: ReadingProgress): Int {
        return if (progress.percentage > 0) {
            (progress.currentPage / (progress.percentage / 100f)).toInt()
        } else {
            progress.currentPage.coerceAtLeast(1)
        }
    }
    
    private fun estimateTotalChapters(metadata: com.universalmedialibrary.data.local.entity.CommonMetadata?): Int? {
        // This would ideally come from book metadata
        return null
    }
    
    private fun estimateTimeRemaining(progress: ReadingProgress, pagesRemaining: Int): Int? {
        if (progress.readingSpeed == null || progress.readingSpeed <= 0) return null
        // readingSpeed is pages per minute
        return (pagesRemaining / progress.readingSpeed).toInt()
    }
    
    private fun formatLastRead(timestamp: Long): String {
        if (timestamp == 0L) return "Not yet read"
        
        val now = System.currentTimeMillis()
        val diffMs = now - timestamp
        val diffMinutes = TimeUnit.MILLISECONDS.toMinutes(diffMs)
        val diffHours = TimeUnit.MILLISECONDS.toHours(diffMs)
        val diffDays = TimeUnit.MILLISECONDS.toDays(diffMs)
        
        return when {
            diffMinutes < 5 -> "Just now"
            diffMinutes < 60 -> "$diffMinutes minutes ago"
            diffHours < 24 -> if (diffHours == 1L) "1 hour ago" else "$diffHours hours ago"
            diffDays == 1L -> "Yesterday"
            diffDays < 7 -> "$diffDays days ago"
            diffDays < 30 -> "${diffDays / 7} weeks ago"
            else -> fullDateFormat.format(Date(timestamp))
        }
    }
    
    private fun formatDuration(minutes: Int): String {
        return when {
            minutes < 60 -> "$minutes min"
            minutes < 120 -> "1 hr ${minutes % 60} min"
            else -> "${minutes / 60} hrs ${minutes % 60} min"
        }
    }
    
    private fun analyzeReadingPattern(sessions: List<ReadingSessionLog>): String {
        if (sessions.isEmpty()) return "No reading pattern established yet"
        
        val recentSessions = sessions.take(10)
        val avgDuration = recentSessions.map { it.durationSeconds }.average()
        val frequency = if (recentSessions.size >= 2) {
            val firstSession = recentSessions.last().startTime
            val lastSession = recentSessions.first().startTime
            val daySpan = TimeUnit.MILLISECONDS.toDays(lastSession - firstSession).coerceAtLeast(1)
            recentSessions.size.toFloat() / daySpan
        } else 0f
        
        return when {
            frequency >= 1.5f && avgDuration >= 1800 -> "Dedicated reader - reads frequently and for extended periods"
            frequency >= 1f && avgDuration >= 900 -> "Regular reader - reads most days"
            frequency >= 0.5f -> "Casual reader - reads a few times per week"
            avgDuration >= 3600 -> "Marathon reader - prefers long reading sessions"
            else -> "Light reader - occasional short sessions"
        }
    }
    
    private fun detectPreferredReadingTime(sessions: List<ReadingSessionLog>): String? {
        if (sessions.size < 3) return null
        
        val hourCounts = sessions.groupBy { session ->
            val calendar = Calendar.getInstance()
            calendar.timeInMillis = session.startTime
            calendar.get(Calendar.HOUR_OF_DAY)
        }.mapValues { it.value.size }
        
        val peakHour = hourCounts.maxByOrNull { it.value }?.key ?: return null
        
        return when (peakHour) {
            in 5..8 -> "Early morning"
            in 9..11 -> "Late morning"
            in 12..14 -> "Afternoon"
            in 15..17 -> "Late afternoon"
            in 18..20 -> "Evening"
            in 21..23 -> "Night"
            else -> "Late night"
        }
    }
    
    private suspend fun calculateReadingStreak(bookId: Long): Int {
        // Calculate consecutive days of reading
        val sessions = readingAnalyticsDao.getSessionsByItemId(bookId).first()
        if (sessions.isEmpty()) return 0
        
        val readingDays = sessions.map { session ->
            dateFormat.format(Date(session.startTime))
        }.distinct().sorted().reversed()
        
        var streak = 0
        var expectedDate = dateFormat.format(Date())
        
        for (date in readingDays) {
            if (date == expectedDate) {
                streak++
                val calendar = Calendar.getInstance()
                calendar.time = dateFormat.parse(date) ?: break
                calendar.add(Calendar.DAY_OF_YEAR, -1)
                expectedDate = dateFormat.format(calendar.time)
            } else {
                break
            }
        }
        
        return streak
    }
    
    private fun isBookAbandoned(progress: ReadingProgress): Boolean {
        if (progress.isCompleted) return false
        val daysSinceLastRead = TimeUnit.MILLISECONDS.toDays(System.currentTimeMillis() - progress.lastUpdate)
        return daysSinceLastRead > 30 && progress.percentage < 90f
    }
    
    private fun buildProgressContext(progress: DetailedBookProgress): String {
        val percentComplete = progress.progressPercent.toInt()
        val pagesInfo = "on page ${progress.currentPage} of ${progress.totalPages}"
        
        return when {
            progress.isCompleted -> "Completed reading this book"
            percentComplete >= 90 -> "Almost finished ($percentComplete%), $pagesInfo. Just a few pages left!"
            percentComplete >= 75 -> "In the final quarter ($percentComplete%), $pagesInfo. Approaching the climax."
            percentComplete >= 50 -> "About halfway through ($percentComplete%), $pagesInfo. Well into the story."
            percentComplete >= 25 -> "Making good progress ($percentComplete%), $pagesInfo. The story is developing."
            percentComplete >= 10 -> "Early in the book ($percentComplete%), $pagesInfo. Still getting introduced to the story."
            else -> "Just started ($percentComplete%), $pagesInfo. Beginning the journey."
        }
    }
    
    private fun buildPatternContext(progress: DetailedBookProgress): String {
        val parts = mutableListOf<String>()
        
        if (progress.totalReadingTimeMinutes > 0) {
            parts.add("Has spent ${formatDuration(progress.totalReadingTimeMinutes)} reading this book")
        }
        
        if (progress.sessionCount > 0) {
            parts.add("over ${progress.sessionCount} reading sessions")
        }
        
        if (progress.averageMinutesPerSession > 0) {
            parts.add("averaging ${progress.averageMinutesPerSession} minutes per session")
        }
        
        progress.preferredReadingTime?.let {
            parts.add("usually reading in the $it")
        }
        
        if (progress.readingStreak > 1) {
            parts.add("on a ${progress.readingStreak}-day reading streak")
        }
        
        return if (parts.isNotEmpty()) parts.joinToString(", ") else progress.readingPattern
    }
    
    private fun generateDiscussionTopics(
        progress: DetailedBookProgress,
        insights: List<com.universalmedialibrary.data.local.entity.ReaderAIInsight>
    ): List<String> {
        val topics = mutableListOf<String>()
        
        // Progress-based suggestions
        when {
            progress.isJustStarted -> {
                topics.add("First impressions of the book")
                topics.add("Initial thoughts on the writing style")
                topics.add("What drew you to this book?")
            }
            progress.progressPercent in 25f..50f -> {
                topics.add("Character development so far")
                topics.add("Predictions for the story")
                topics.add("Favorite moments up to this point")
            }
            progress.progressPercent in 50f..75f -> {
                topics.add("Plot twists and surprises")
                topics.add("How the story compares to expectations")
                topics.add("Themes emerging in the narrative")
            }
            progress.isNearingCompletion -> {
                topics.add("Thoughts on the story arc")
                topics.add("Favorite and least favorite parts")
                topics.add("Would you recommend this book?")
            }
        }
        
        // Genre-based suggestions
        progress.genres.forEach { genre ->
            when (genre.lowercase()) {
                "mystery", "thriller" -> topics.add("Theories about the mystery")
                "fantasy", "science fiction" -> topics.add("World-building elements")
                "romance" -> topics.add("Character relationships")
                "historical fiction" -> topics.add("Historical accuracy and setting")
                "literary fiction" -> topics.add("Deeper themes and symbolism")
            }
        }
        
        // Theme-based suggestions from AI insights
        insights.find { it.insightType.name == "THEMES" }?.keyThemes?.take(3)?.forEach { theme ->
            topics.add("The theme of $theme in the story")
        }
        
        return topics.distinct().take(5)
    }
    
    private fun calculateDaysReading(firstSession: Long?, lastSession: Long?): Int {
        if (firstSession == null || lastSession == null) return 0
        return TimeUnit.MILLISECONDS.toDays(lastSession - firstSession).toInt() + 1
    }
    
    private fun getPhaseDescription(phase: ReadingPhase): String {
        return when (phase) {
            ReadingPhase.BEGINNING -> "Just starting the book, still meeting characters and setting"
            ReadingPhase.EARLY -> "Early in the story, plot is being established"
            ReadingPhase.RISING_ACTION -> "Story is building up, conflicts are developing"
            ReadingPhase.MIDDLE -> "In the thick of things, major events unfolding"
            ReadingPhase.CLIMAX -> "Approaching the climax, tension is high"
            ReadingPhase.FINALE -> "Near the end, wrapping up the story"
        }
    }
    
    private fun getSpoilerWarning(phase: ReadingPhase): String {
        return when (phase) {
            ReadingPhase.BEGINNING, ReadingPhase.EARLY -> 
                "User is early in the book - avoid spoilers about major plot points"
            ReadingPhase.RISING_ACTION, ReadingPhase.MIDDLE -> 
                "User is mid-book - avoid spoilers about later events and the ending"
            ReadingPhase.CLIMAX -> 
                "User is nearing the end - avoid revealing the conclusion"
            ReadingPhase.FINALE -> 
                "User is almost finished - safe to discuss most of the book"
        }
    }
}

// ==================== Data Classes ====================

@Serializable
data class CurrentReadingInfo(
    val bookId: Long,
    val title: String,
    val author: String?,
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val progressPercent: Float,
    val lastReadDate: Long,
    val lastReadFormatted: String,
    val totalReadingTimeMinutes: Int,
    val sessionCount: Int,
    val estimatedMinutesRemaining: Int?,
    val genres: List<String>,
    val summary: String?,
    val coverPath: String?,
    val startedDate: Long?,
    val startedDateFormatted: String?,
    val readingSpeed: Float?,
    val isNearingCompletion: Boolean,
    val isJustStarted: Boolean
)

@Serializable
data class DetailedBookProgress(
    val bookId: Long,
    val title: String,
    val author: String?,
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val totalChapters: Int?,
    val progressPercent: Float,
    val pagesRead: Int,
    val pagesRemaining: Int,
    
    // Time tracking
    val totalReadingTimeMinutes: Int,
    val averageSessionMinutes: Int,
    val estimatedMinutesRemaining: Int?,
    
    // Session info
    val sessionCount: Int,
    val lastSessionDate: Long?,
    val firstSessionDate: Long?,
    
    // Reading pattern analysis
    val readingPattern: String,
    val preferredReadingTime: String?,
    val readingStreak: Int,
    
    // Book info
    val genres: List<String>,
    val summary: String?,
    val year: Int?,
    val rating: Float?,
    
    // Status
    val isCompleted: Boolean,
    val completedDate: Long?,
    val startedDate: Long?,
    val isNearingCompletion: Boolean,
    val isJustStarted: Boolean,
    val isAbandoned: Boolean
)

@Serializable
data class ReadingHistorySummary(
    val periodDays: Int,
    val totalReadingTimeMinutes: Int = 0,
    val totalPagesRead: Int = 0,
    val booksCompleted: Int = 0,
    val booksInProgress: Int = 0,
    val totalSessions: Int = 0,
    val daysWithReading: Int = 0,
    val averageMinutesPerDay: Int = 0,
    val averageMinutesPerSession: Int = 0,
    val recentlyCompletedBooks: List<CompletedBookInfo> = emptyList(),
    val readingHeatmap: Map<String, Int> = emptyMap()
)

@Serializable
data class CompletedBookInfo(
    val bookId: Long,
    val title: String,
    val author: String?,
    val completedDate: Long,
    val completedDateFormatted: String,
    val totalReadingTimeMinutes: Int
)

@Serializable
data class BookDiscussionContext(
    val bookId: Long,
    val title: String,
    val author: String?,
    
    // Summaries for AI
    val progressSummary: String,
    val patternSummary: String,
    
    // Progress data
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val progressPercent: Float,
    
    // Book info
    val genres: List<String>,
    val bookSummary: String?,
    val year: Int?,
    
    // AI insights
    val existingSummary: String?,
    val keyThemes: List<String>,
    val characterAnalysis: String?,
    
    // Discussion helpers
    val suggestedTopics: List<String>,
    
    // Reading journey
    val daysReading: Int,
    val isNearingEnd: Boolean,
    val hasJustStarted: Boolean,
    val lastReadDescription: String,
    val startedDescription: String?
)

@Serializable
data class ReadingPositionContext(
    val bookId: Long,
    val title: String,
    val currentPage: Int,
    val totalPages: Int,
    val currentChapter: Int,
    val progressPercent: Float,
    val phase: ReadingPhase,
    val phaseDescription: String,
    val spoilerWarning: String,
    val safeToDiscuss: String,
    val doNotSpoil: String?
)

@Serializable
enum class ReadingPhase {
    BEGINNING,
    EARLY,
    RISING_ACTION,
    MIDDLE,
    CLIMAX,
    FINALE
}
