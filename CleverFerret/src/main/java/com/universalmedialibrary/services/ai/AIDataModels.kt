package com.universalmedialibrary.services.ai

import kotlinx.serialization.Serializable

/**
 * Data models for AI backup, rate limiting, and content caching
 */

// ==================== Backup Models ====================

@Serializable
data class BackupMetadata(
    val backupVersion: String,
    val timestamp: Long,
    val characterCount: Int,
    val memoryCount: Int,
    val totalSize: Long,
    val checksum: String,
    val encryptionEnabled: Boolean,
    val appVersion: String
)

@Serializable
data class AICharacterBackup(
    val characterId: Long,
    val name: String,
    val description: String,
    val personality: Map<String, Any>,
    val memories: List<AIMemoryBackup>,
    val settings: Map<String, Any>,
    val createdAt: Long,
    val lastModified: Long
)

@Serializable
data class AIMemoryBackup(
    val memoryId: Long,
    val content: String,
    val memoryType: String,
    val tags: List<String>,
    val metadata: Map<String, Any>,
    val createdAt: Long,
    val emotionalWeight: Double = 0.0
)

@Serializable
data class BackupResult(
    val success: Boolean,
    val backupFile: String? = null,
    val error: String? = null,
    val stats: BackupStats? = null
)

@Serializable
data class BackupStats(
    val charactersBackedUp: Int,
    val memoriesBackedUp: Int,
    val totalSize: Long,
    val compressionRatio: Double
)

@Serializable
data class RestoreResult(
    val success: Boolean,
    val charactersRestored: Int,
    val memoriesRestored: Int,
    val error: String? = null
)

// ==================== Rate Limiting Models ====================

@Serializable
data class RateLimitConfig(
    val globalLimit: Int,
    val providerLimits: Map<String, Int>,
    val userLimits: Map<String, Int>,
    val dailyLimits: Map<String, Int>,
    val burstCapacity: Int = 10,
    val enabled: Boolean = true
)

@Serializable
data class RateLimitResult(
    val allowed: Boolean,
    val resetTime: Long? = null,
    val remainingRequests: Int? = null,
    val reason: String? = null
)

@Serializable
data class UserRateStats(
    val userId: String,
    val requestsThisMinute: Int,
    val requestsThisHour: Int,
    val requestsToday: Int,
    val totalRequests: Int,
    val lastRequestTime: Long,
    val blockedRequests: Int
)

@Serializable
data class UsageStatistics(
    val totalRequests: Long,
    val requestsPerMinute: Double,
    val requestsPerHour: Double,
    val requestsPerDay: Double,
    topUsers: List<UserRateStats>,
    topProviders: Map<String, Long>,
    blockedRequests: Long,
    averageResponseTime: Double
)

enum class RateLimitStatus {
    ALLOWED,
    GLOBAL_LIMIT_EXCEEDED,
    PROVIDER_LIMIT_EXCEEDED,
    USER_LIMIT_EXCEEDED,
    DAILY_LIMIT_EXCEEDED,
    RATE_LIMIT_DISABLED
}

// ==================== Content Cache Models ====================

@Serializable
data class CacheItem(
    val id: String,
    val url: String,
    val title: String,
    val contentType: ContentType,
    val characterId: Long? = null,
    val filePath: String,
    val fileSize: Long,
    val downloadedAt: Long,
    val lastAccessed: Long,
    val accessCount: Int,
    val tags: List<String> = emptyList(),
    val metadata: Map<String, Any> = emptyMap(),
    val checksum: String,
    val isEncrypted: Boolean = false
)

@Serializable
data class CacheMetadata(
    val id: String,
    val originalUrl: String,
    val title: String,
    val description: String? = null,
    val author: String? = null,
    val publishDate: Long? = null,
    val contentType: ContentType,
    val characterId: Long? = null,
    val downloadOptions: DownloadOptions,
    val downloadedAt: Long,
    val extractedText: String? = null,
    val summary: String? = null,
    val tags: List<String> = emptyList(),
    val processingStatus: ProcessingStatus
)

@Serializable
data class DownloadProgress(
    val url: String,
    val status: DownloadStatus,
    val progress: Float,
    val message: String,
    val downloadedBytes: Long = 0,
    val totalBytes: Long = 0,
    val error: String? = null
)

@Serializable
data class DownloadOptions(
    val includeImages: Boolean = true,
    val includeVideos: Boolean = false,
    val maxFileSize: Long = 50 * 1024 * 1024, // 50MB
    val extractText: Boolean = true,
    val generateSummary: Boolean = true,
    val customName: String? = null
)

@Serializable
data class CacheStatistics(
    val totalItems: Int,
    val totalSize: Long,
    val usedSpace: Long,
    val availableSpace: Long,
    val oldestItem: Long,
    val newestItem: Long,
    val mostAccessed: List<CacheItem>,
    val contentTypeDistribution: Map<ContentType, Int>,
    val characterDistribution: Map<Long, Int>
)

enum class ContentType {
    WEBPAGE,
    PDF,
    ARTICLE,
    IMAGE,
    VIDEO,
    AUDIO,
    DOCUMENT,
    ARCHIVE,
    UNKNOWN
}

enum class DownloadStatus {
    QUEUED,
    DOWNLOADING,
    PROCESSING,
    COMPLETED,
    FAILED,
    CANCELLED,
    RETRYING
}

enum class ProcessingStatus {
    PENDING,
    PROCESSING,
    COMPLETED,
    FAILED
}

// ==================== Personality Models ====================

@Serializable
data class PersonalityState(
    val characterId: Long,
    val traits: Map<String, Double>,
    val currentMood: MoodState,
    val personalityScore: Double,
    val lastInteractionTime: Long,
    val totalInteractions: Int,
    val memoryCount: Int,
    val evolutionVersion: Int = 1
)

@Serializable
data class MoodState(
    val current: String = "neutral",
    val intensity: Double = 0.5,
    val lastChange: Long = System.currentTimeMillis(),
    val duration: Long = 0
)

@Serializable
data class PersonalityInteraction(
    val message: String,
    val sentiment: SentimentType,
    val context: String? = null,
    val response: String? = null,
    val timestamp: Long = System.currentTimeMillis()
)

@Serializable
data class MoodChange(
    val newMood: String? = null,
    val intensityChange: Double = 0.0,
    val reason: String? = null
)

@Serializable
data class TraitChange(
    val trait: String,
    val oldValue: Double,
    val newValue: Double,
    val change: Double,
    val timestamp: Long = System.currentTimeMillis(),
    val reason: String? = null
)

@Serializable
data class MoodEntry(
    val mood: String,
    val intensity: Double,
    val timestamp: Long,
    val context: String? = null
)

@Serializable
data class PersonalityUpdateResult(
    val success: Boolean,
    val newState: PersonalityState? = null,
    val traitChanges: Map<String, Double> = emptyMap(),
    val moodChange: MoodChange? = null,
    val event: SynthPersonalityEvent? = null,
    val error: String? = null
) {
    companion object {
        fun success(
            newState: PersonalityState,
            traitChanges: Map<String, Double> = emptyMap(),
            moodChange: MoodChange? = null,
            event: SynthPersonalityEvent? = null
        ) = PersonalityUpdateResult(
            success = true,
            newState = newState,
            traitChanges = traitChanges,
            moodChange = moodChange,
            event = event
        )
        
        fun error(message: String) = PersonalityUpdateResult(
            success = false,
            error = message
        )
    }
}

@Serializable
data class PersonalityInsights(
    val personalityScore: Double,
    val dominantTraits: List<TraitInsight>,
    val moodPatterns: List<MoodPattern>,
    val stability: Double,
    val totalInteractions: Int,
    val evolutionRate: Double,
    val summary: String
)

@Serializable
data class TraitInsight(
    val trait: String,
    val value: Double,
    val trend: TrendType
)

@Serializable
data class MoodPattern(
    val mood: String,
    val frequency: Double,
    val averageIntensity: Double,
    val timeOfDay: String? = null
)

enum class SentimentType {
    POSITIVE,
    NEGATIVE,
    NEUTRAL,
    EXCITED,
    CALM,
    SAD,
    ANGRY,
    HUMOROUS,
    CONFIDENT,
    CURIOUS
}

enum class TrendType {
    INCREASING,
    DECREASING,
    STABLE,
    FLUCTUATING
}

// ==================== AI Provider Enums ====================

enum class AIProvider {
    OPENAI,
    GEMINI,
    OLLAMA,
    CUSTOM
}

enum class RequestType {
    CHAT,
    GENERATION,
    ANALYSIS,
    SEARCH,
    DOWNLOAD,
    SUMMARIZATION
}

// ==================== Request Window for Rate Limiting ====================

@Serializable
data class RequestWindow(
    val provider: String,
    val userId: String?,
    val requestType: RequestType,
    val windowStartMs: Long,
    val requestCount: Int,
    val lastRequestTime: Long = System.currentTimeMillis()
)

// ==================== Location Enums ====================

enum class BackupLocation {
    INTERNAL_STORAGE,
    SD_CARD,
    EXTERNAL_STORAGE,
    CLOUD
}

// ==================== Utility Functions ====================

fun generateEventId(): String {
    return "event_${System.currentTimeMillis()}_${(1000..9999).random()}"
}

fun generateCacheId(url: String): String {
    return "cache_${url.hashCode()}_${System.currentTimeMillis()}"
}