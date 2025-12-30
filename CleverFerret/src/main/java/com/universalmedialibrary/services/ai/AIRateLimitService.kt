package com.universalmedialibrary.services.ai

import android.content.Context
import android.content.SharedPreferences
import com.universalmedialibrary.utils.ErrorLogger
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.serialization.Serializable
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicLong
import javax.inject.Inject
import javax.inject.Singleton

/**
 * AI Rate Limiting Service
 * 
 * Controls the rate of AI chat interactions and requests to prevent abuse,
 * manage costs, and ensure fair usage across different providers and users.
 */
@Singleton
class AIRateLimitService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val PREFS_NAME = "ai_rate_limit_prefs"
        private const val KEY_GLOBAL_CONFIG = "global_rate_limit_config"
        private const val KEY_PROVIDER_CONFIG_PREFIX = "provider_config_"
        private const val KEY_USER_STATS_PREFIX = "user_stats_"
        private const val KEY_GLOBAL_STATS = "global_stats"
        
        // Default rate limits (requests per minute)
        private const val DEFAULT_GLOBAL_LIMIT = 60 // 60 requests per minute
        private const val DEFAULT_OPENAI_LIMIT = 100 // OpenAI: 100 rpm
        private const val DEFAULT_GEMINI_LIMIT = 60 // Gemini: 60 rpm
        private const val DEFAULT_OLLAMA_LIMIT = 30 // Local Ollama: 30 rpm
    }
    
    private val preferences: SharedPreferences = 
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    
    private val json = kotlinx.serialization.json.Json { 
        ignoreUnknownKeys = true 
        encodeDefaults = true
    }
    
    // In-memory tracking for current window
    private val requestWindows = ConcurrentHashMap<String, LocalRequestWindow>()
    private val userStats = ConcurrentHashMap<String, LocalUserRateStats>()
    private val globalStats = AtomicLong(0)
    
    private val _rateLimitStatus = MutableStateFlow<LocalRateLimitStatus>(LocalRateLimitStatus.ALLOWED)
    val rateLimitStatus: StateFlow<LocalRateLimitStatus> = _rateLimitStatus.asStateFlow()
    
    private val _usageStatistics = MutableStateFlow<LocalUsageStatistics?>(null)
    val usageStatistics: StateFlow<LocalUsageStatistics?> = _usageStatistics.asStateFlow()
    
    init {
        initializeDefaultConfig()
        cleanupExpiredWindows()
    }
    
    // ==================== Rate Limiting ====================
    
    /**
     * Check if a request is allowed based on rate limits
     */
    suspend fun checkRateLimit(
        provider: LocalAIProvider,
        userId: String? = null,
        requestType: LocalRequestType = LocalRequestType.CHAT
    ): LocalRateLimitResult {
        val currentTime = System.currentTimeMillis()
        val windowKey = getWindowKey(provider, userId, requestType)
        
        // Get or create request window
        val window = requestWindows.getOrPut(windowKey) {
            LocalRequestWindow(
                provider = provider.name,
                userId = userId,
                requestType = requestType,
                windowStartMs = currentTime,
                requestCount = 0
            )
        }
        
        // Reset window if expired
        val windowDurationMs = 60_000L // 1 minute
        if (currentTime - window.windowStartMs > windowDurationMs) {
            window.windowStartMs = currentTime
            window.requestCount = 0
        }
        
        // Check various rate limits
        val limits = getEffectiveLimits(provider)
        
        // Global limit
        if (window.requestCount >= limits.globalLimit) {
            updateRateLimitStatus(LocalRateLimitStatus.GLOBAL_LIMIT_EXCEEDED)
            return LocalRateLimitResult(
                allowed = false,
                reason = "Global rate limit exceeded (${limits.globalLimit} requests/minute)",
                retryAfterMs = windowDurationMs - (currentTime - window.windowStartMs),
                currentUsage = window.requestCount,
                limit = limits.globalLimit
            )
        }
        
        // Provider-specific limit
        if (window.requestCount >= limits.providerLimit) {
            updateRateLimitStatus(LocalRateLimitStatus.PROVIDER_LIMIT_EXCEEDED)
            return LocalRateLimitResult(
                allowed = false,
                reason = "Provider rate limit exceeded for ${provider.name} (${limits.providerLimit} requests/minute)",
                retryAfterMs = windowDurationMs - (currentTime - window.windowStartMs),
                currentUsage = window.requestCount,
                limit = limits.providerLimit
            )
        }
        
        // User-specific limit (if user is specified)
        if (userId != null && window.requestCount >= limits.userLimit) {
            updateRateLimitStatus(LocalRateLimitStatus.USER_LIMIT_EXCEEDED)
            return LocalRateLimitResult(
                allowed = false,
                reason = "User rate limit exceeded (${limits.userLimit} requests/minute)",
                retryAfterMs = windowDurationMs - (currentTime - window.windowStartMs),
                currentUsage = window.requestCount,
                limit = limits.userLimit
            )
        }
        
        // Request is allowed
        window.requestCount++
        updateRateLimitStatus(LocalRateLimitStatus.ALLOWED)
        
        // Update statistics
        updateStatistics(provider, userId, requestType)
        
        return LocalRateLimitResult(
            allowed = true,
            currentUsage = window.requestCount,
            limit = limits.globalLimit
        )
    }
    
    /**
     * Record a completed request (for statistics)
     */
    suspend fun recordRequest(
        provider: LocalAIProvider,
        userId: String? = null,
        requestType: LocalRequestType,
        success: Boolean,
        responseTimeMs: Long,
        tokensUsed: Int = 0
    ) {
        val stats = getUserStats(userId)
        stats.totalRequests++
        
        if (success) {
            stats.successfulRequests++
            stats.totalTokens += tokensUsed
        } else {
            stats.failedRequests++
        }
        
        stats.totalResponseTime += responseTimeMs
        stats.lastRequestTime = System.currentTimeMillis()
        
        globalStats.incrementAndGet()
        updateUsageStatistics()
    }
    
    // ==================== Configuration Management ====================
    
    /**
     * Configure rate limits for a specific provider
     */
    fun configureProviderLimits(
        provider: LocalAIProvider,
        limits: RateLimits
    ) {
        val configJson = json.encodeToString(limits)
        preferences.edit()
            .putString(KEY_PROVIDER_CONFIG_PREFIX + provider.name, configJson)
            .apply()
        
        ErrorLogger.logInfo(
            "AIRateLimit", 
            "Updated rate limits for ${provider.name}: ${limits.providerLimit} rpm"
        )
    }
    
    /**
     * Configure global rate limits
     */
    fun configureGlobalLimits(limits: RateLimits) {
        val configJson = json.encodeToString(limits)
        preferences.edit()
            .putString(KEY_GLOBAL_CONFIG, configJson)
            .apply()
        
        ErrorLogger.logInfo(
            "AIRateLimit", 
            "Updated global rate limits: ${limits.globalLimit} rpm"
        )
    }
    
    /**
     * Get current rate limits for a provider
     */
    fun getRateLimits(provider: LocalAIProvider): RateLimits {
        val configJson = preferences.getString(KEY_PROVIDER_CONFIG_PREFIX + provider.name, null)
        return if (configJson != null) {
            try {
                json.decodeFromString<RateLimits>(configJson)
            } catch (e: Exception) {
                ErrorLogger.logWarning("AIRateLimit", "Failed to parse provider config", e)
                getDefaultLimits(provider)
            }
        } else {
            getDefaultLimits(provider)
        }
    }
    
    // ==================== Statistics and Monitoring ====================
    
    /**
     * Get usage statistics for monitoring
     */
    fun getUsageStatistics(): LocalUsageStatistics {
        val currentWindows = requestWindows.values.toList()
        val totalRequests = globalStats.get()
        val totalUsers = userStats.size
        
        return LocalUsageStatistics(
            totalRequests = totalRequests,
            activeUsers = totalUsers,
            activeWindows = currentWindows.size,
            providerUsage = currentWindows.groupBy { it.provider }
                .mapValues { (_, windows) -> windows.sumOf { it.requestCount } },
            requestTypeUsage = currentWindows.groupBy { it.requestType }
                .mapValues { (_, windows) -> windows.sumOf { it.requestCount } },
            averageResponseTime = if (totalRequests > 0) {
                userStats.values.map { it.totalResponseTime }.average() / totalUsers
            } else 0.0,
            successRate = if (totalRequests > 0) {
                (userStats.values.sumOf { it.successfulRequests }.toDouble() / totalRequests) * 100
            } else 100.0
        )
    }
    
    /**
     * Get detailed statistics for a specific user
     */
    fun getUserStatistics(userId: String?): LocalUserRateStats {
        return getUserStats(userId)
    }
    
    /**
     * Reset all statistics
     */
    fun resetStatistics() {
        requestWindows.clear()
        userStats.clear()
        globalStats.set(0)
        _usageStatistics.value = null
    }
    
    /**
     * Get current rate limit configuration
     */
    fun getRateLimitConfig(): RateLimitConfig {
        return RateLimitConfig(
            globalLimit = DEFAULT_GLOBAL_LIMIT,
            providerLimits = mapOf(
                LocalAIProvider.OPENAI.name to DEFAULT_OPENAI_LIMIT,
                LocalAIProvider.GEMINI.name to DEFAULT_GEMINI_LIMIT,
                LocalAIProvider.OLLAMA.name to DEFAULT_OLLAMA_LIMIT
            ),
            userLimits = emptyMap(),
            dailyLimits = emptyMap(),
            burstCapacity = 10,
            enabled = true
        )
    }
    
    /**
     * Update rate limit configuration
     */
    fun updateRateLimitConfig(config: RateLimitConfig) {
        // Save configuration to preferences
        val configJson = json.encodeToString(config)
        preferences.edit()
            .putString("rate_limit_config", configJson)
            .apply()
        
        // Apply new configuration
        _rateLimitStatus.value = if (config.enabled) {
            LocalRateLimitStatus.ALLOWED
        } else {
            LocalRateLimitStatus.RATE_LIMIT_DISABLED
        }
    }
    
    /**
     * Enable rate limiting
     */
    fun enableRateLimiting() {
        val currentConfig = getRateLimitConfig()
        updateRateLimitConfig(currentConfig.copy(enabled = true))
    }
    
    /**
     * Disable rate limiting
     */
    fun disableRateLimiting() {
        val currentConfig = getRateLimitConfig()
        updateRateLimitConfig(currentConfig.copy(enabled = false))
    }
    
    /**
     * Reset statistics for a specific user
     */
    fun resetUserStatistics(userId: String?) {
        val userKey = userId ?: "anonymous"
        userStats.remove(userKey)
        
        // Remove user-specific windows
        requestWindows.keys.removeIf { it.contains("user:$userKey") }
        
        ErrorLogger.logInfo("AIRateLimit", "Statistics reset for user: $userKey")
    }
    
    // ==================== Private Helper Methods ====================
    
    private fun initializeDefaultConfig() {
        // Initialize default configurations if not present
        if (!preferences.contains(KEY_GLOBAL_CONFIG)) {
            configureGlobalLimits(RateLimits(
                globalLimit = DEFAULT_GLOBAL_LIMIT,
                providerLimit = DEFAULT_GLOBAL_LIMIT,
                userLimit = DEFAULT_GLOBAL_LIMIT / 2,
                burstLimit = DEFAULT_GLOBAL_LIMIT * 2,
                dailyLimit = DEFAULT_GLOBAL_LIMIT * 24 * 7 // Weekly limit
            ))
        }
        
        // Configure provider-specific defaults
        LocalAIProvider.values().forEach { provider ->
            if (!preferences.contains(KEY_PROVIDER_CONFIG_PREFIX + provider.name)) {
                configureProviderLimits(provider, getDefaultLimits(provider))
            }
        }
    }
    
    private fun getDefaultLimits(provider: LocalAIProvider): RateLimits {
        return when (provider) {
            LocalAIProvider.OPENAI -> RateLimits(
                globalLimit = DEFAULT_OPENAI_LIMIT,
                providerLimit = DEFAULT_OPENAI_LIMIT,
                userLimit = DEFAULT_OPENAI_LIMIT / 4, // 25 per minute per user
                burstLimit = DEFAULT_OPENAI_LIMIT * 2,
                dailyLimit = DEFAULT_OPENAI_LIMIT * 24 * 3 // 3 days of continuous use
            )
            LocalAIProvider.GEMINI -> RateLimits(
                globalLimit = DEFAULT_GEMINI_LIMIT,
                providerLimit = DEFAULT_GEMINI_LIMIT,
                userLimit = DEFAULT_GEMINI_LIMIT / 3, // 20 per minute per user
                burstLimit = DEFAULT_GEMINI_LIMIT * 2,
                dailyLimit = DEFAULT_GEMINI_LIMIT * 24 * 2
            )
            LocalAIProvider.OLLAMA -> RateLimits(
                globalLimit = DEFAULT_OLLAMA_LIMIT,
                providerLimit = DEFAULT_OLLAMA_LIMIT,
                userLimit = DEFAULT_OLLAMA_LIMIT / 2, // 15 per minute per user
                burstLimit = DEFAULT_OLLAMA_LIMIT * 2,
                dailyLimit = DEFAULT_OLLAMA_LIMIT * 24
            )
            LocalAIProvider.CUSTOM -> RateLimits(
                globalLimit = 60, // Default custom limit
                providerLimit = 60,
                userLimit = 20,
                burstLimit = 120,
                dailyLimit = 60 * 24
            )
        }
    }
    
    private fun getEffectiveLimits(provider: LocalAIProvider): RateLimits {
        val globalLimits = getGlobalLimits()
        val providerLimits = getRateLimits(provider)
        
        // Use the most restrictive limits
        return RateLimits(
            globalLimit = minOf(globalLimits.globalLimit, providerLimits.globalLimit),
            providerLimit = providerLimits.providerLimit,
            userLimit = minOf(globalLimits.userLimit, providerLimits.userLimit),
            burstLimit = minOf(globalLimits.burstLimit, providerLimits.burstLimit),
            dailyLimit = minOf(globalLimits.dailyLimit, providerLimits.dailyLimit)
        )
    }
    
    private fun getGlobalLimits(): RateLimits {
        val configJson = preferences.getString(KEY_GLOBAL_CONFIG, null)
        return if (configJson != null) {
            try {
                json.decodeFromString<RateLimits>(configJson)
            } catch (e: Exception) {
                ErrorLogger.logWarning("AIRateLimit", "Failed to parse global config", e)
                RateLimits(
                    globalLimit = DEFAULT_GLOBAL_LIMIT,
                    providerLimit = DEFAULT_GLOBAL_LIMIT,
                    userLimit = DEFAULT_GLOBAL_LIMIT / 2,
                    burstLimit = DEFAULT_GLOBAL_LIMIT * 2,
                    dailyLimit = DEFAULT_GLOBAL_LIMIT * 24 * 7
                )
            }
        } else {
            getDefaultLimits(LocalAIProvider.OPENAI) // Use OpenAI as default
        }
    }
    
    private fun getWindowKey(provider: LocalAIProvider, userId: String?, requestType: LocalRequestType): String {
        val userKey = userId ?: "anonymous"
        return "${provider.name}:user:$userKey:type:${requestType.name}"
    }
    
    private fun getUserStats(userId: String?): LocalUserRateStats {
        val userKey = userId ?: "anonymous"
        return userStats.getOrPut(userKey) {
            LocalUserRateStats(
                userId = userId,
                totalRequests = 0,
                successfulRequests = 0,
                failedRequests = 0,
                totalTokens = 0,
                totalResponseTime = 0,
                lastRequestTime = 0
            )
        }
    }
    
    private fun updateStatistics(provider: LocalAIProvider, userId: String?, requestType: LocalRequestType) {
        // Update user stats
        val stats = getUserStats(userId)
        stats.lastRequestTime = System.currentTimeMillis()
        
        // Update global statistics
        _usageStatistics.value = getUsageStatistics()
    }
    
    private fun updateUsageStatistics() {
        _usageStatistics.value = getUsageStatistics()
    }
    
    private fun updateRateLimitStatus(status: LocalRateLimitStatus) {
        _rateLimitStatus.value = status
    }
    
    private fun cleanupExpiredWindows() {
        // This would be called periodically to clean up old windows
        val currentTime = System.currentTimeMillis()
        val windowDurationMs = 60_000L // 1 minute
        
        requestWindows.entries.removeIf { (_, window) ->
            currentTime - window.windowStartMs > windowDurationMs * 2 // Remove windows older than 2 minutes
        }
    }
}

// ==================== Data Classes (local to AIRateLimitService) ====================

@Serializable
data class RateLimits(
    val globalLimit: Int,    // Global requests per minute
    val providerLimit: Int,  // Provider-specific requests per minute
    val userLimit: Int,      // Per-user requests per minute
    val burstLimit: Int,     // Burst capacity
    val dailyLimit: Int      // Daily limit
)

// Local version with different structure than AIDataModels version
data class LocalRateLimitResult(
    val allowed: Boolean,
    val reason: String? = null,
    val retryAfterMs: Long = 0,
    val currentUsage: Int = 0,
    val limit: Int = 0
)

// Local version with different values than AIDataModels version  
enum class LocalRateLimitStatus {
    ALLOWED,
    GLOBAL_LIMIT_EXCEEDED,
    PROVIDER_LIMIT_EXCEEDED,
    USER_LIMIT_EXCEEDED,
    RATE_LIMIT_DISABLED
}

// Local version with different structure than AIDataModels version
data class LocalUsageStatistics(
    val totalRequests: Long,
    val activeUsers: Int,
    val activeWindows: Int,
    val providerUsage: Map<String, Int>,
    val requestTypeUsage: Map<LocalRequestType, Int>,
    val averageResponseTime: Double,
    val successRate: Double,
    val requestsPerMinute: Int = 0,
    val requestsPerDay: Int = 0,
    val blockedRequests: Long = 0
)

// Local version with different structure than AIDataModels version
data class LocalUserRateStats(
    val userId: String?,
    var totalRequests: Long = 0,
    var successfulRequests: Long = 0,
    var failedRequests: Long = 0,
    var totalTokens: Long = 0,
    var totalResponseTime: Long = 0,
    var lastRequestTime: Long = 0
) {
    val successRate: Double 
        get() = if (totalRequests > 0) (successfulRequests.toDouble() / totalRequests) * 100 else 0.0
    val averageResponseTime: Double 
        get() = if (totalRequests > 0) totalResponseTime.toDouble() / totalRequests else 0.0
}

// Local version - not @Serializable like AIDataModels version
data class LocalRequestWindow(
    val provider: String,
    val userId: String?,
    val requestType: LocalRequestType,
    var windowStartMs: Long,
    var requestCount: Int
)

// Local version with fewer values than AIDataModels version
enum class LocalRequestType {
    CHAT,
    GENERATION,
    ANALYSIS,
    SEARCH,
    DOWNLOAD
}

// Local version (AIDataModels has AIProviderType instead)
enum class LocalAIProvider {
    OPENAI,
    GEMINI,
    OLLAMA,
    CUSTOM
}