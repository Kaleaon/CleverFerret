package com.universalmedialibrary.data.settings

import android.content.Context
import android.content.SharedPreferences
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKeys
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Secure Settings Repository for API Keys and Sensitive Data
 * 
 * Uses Android's EncryptedSharedPreferences to securely store:
 * - API keys (Gemini, TMDB, MusicBrainz, etc.)
 * - User preferences
 * - Usage statistics
 * - Authentication tokens
 */
@Singleton
class SecureSettingsRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val masterKeyAlias = MasterKeys.getOrCreate(MasterKeys.AES256_GCM_SPEC)
    
    private val encryptedPrefs: SharedPreferences by lazy {
        EncryptedSharedPreferences.create(
            "clever_ferret_secure_prefs",
            masterKeyAlias,
            context,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }
    
    private val regularPrefs: SharedPreferences by lazy {
        context.getSharedPreferences("clever_ferret_prefs", Context.MODE_PRIVATE)
    }
    
    // State flows for reactive UI updates
    private val _geminiApiKey = MutableStateFlow("")
    val geminiApiKey: StateFlow<String> = _geminiApiKey.asStateFlow()
    
    private val _tmdbApiKey = MutableStateFlow("")
    val tmdbApiKey: StateFlow<String> = _tmdbApiKey.asStateFlow()
    
    private val _musicBrainzEnabled = MutableStateFlow(true)
    val musicBrainzEnabled: StateFlow<Boolean> = _musicBrainzEnabled.asStateFlow()
    
    companion object {
        // Secure keys (encrypted)
        private const val KEY_GEMINI_API = "gemini_api_key"
        private const val KEY_TMDB_API = "tmdb_api_key"
        private const val KEY_LASTFM_API = "lastfm_api_key"
        private const val KEY_GOOGLE_BOOKS_API = "google_books_api_key"
        
        // Regular preferences (non-sensitive)
        private const val KEY_GEMINI_TTS_ENABLED = "gemini_tts_enabled"
        private const val KEY_GEMINI_OCR_ENABLED = "gemini_ocr_enabled"
        private const val KEY_MUSICBRAINZ_ENABLED = "musicbrainz_enabled"
        private const val KEY_API_USAGE_TRACKING = "api_usage_tracking"
        
        // Usage statistics
        private const val KEY_GEMINI_CALLS_MONTH = "gemini_calls_this_month"
        private const val KEY_TMDB_CALLS_MONTH = "tmdb_calls_this_month"
        private const val KEY_LAST_RESET_DATE = "usage_last_reset_date"
    }
    
    init {
        // Load current values into state flows
        _geminiApiKey.value = getGeminiApiKey()
        _tmdbApiKey.value = getTmdbApiKey()
        _musicBrainzEnabled.value = isMusicBrainzEnabled()
    }
    
    // Gemini API Key Management
    fun saveGeminiApiKey(apiKey: String) {
        encryptedPrefs.edit().putString(KEY_GEMINI_API, apiKey).apply()
        _geminiApiKey.value = apiKey
    }
    
    fun getGeminiApiKey(): String {
        return encryptedPrefs.getString(KEY_GEMINI_API, "") ?: ""
    }
    
    fun hasGeminiApiKey(): Boolean = getGeminiApiKey().isNotBlank()
    
    // TMDB API Key Management
    fun saveTmdbApiKey(apiKey: String) {
        encryptedPrefs.edit().putString(KEY_TMDB_API, apiKey).apply()
        _tmdbApiKey.value = apiKey
    }
    
    fun getTmdbApiKey(): String {
        return encryptedPrefs.getString(KEY_TMDB_API, "") ?: ""
    }
    
    fun hasTmdbApiKey(): Boolean = getTmdbApiKey().isNotBlank()
    
    // Last.fm API Key Management
    fun saveLastFmApiKey(apiKey: String) {
        encryptedPrefs.edit().putString(KEY_LASTFM_API, apiKey).apply()
    }
    
    fun getLastFmApiKey(): String {
        return encryptedPrefs.getString(KEY_LASTFM_API, "") ?: ""
    }
    
    fun hasLastFmApiKey(): Boolean = getLastFmApiKey().isNotBlank()
    
    // Google Books API Key Management
    fun saveGoogleBooksApiKey(apiKey: String) {
        encryptedPrefs.edit().putString(KEY_GOOGLE_BOOKS_API, apiKey).apply()
    }
    
    fun getGoogleBooksApiKey(): String {
        return encryptedPrefs.getString(KEY_GOOGLE_BOOKS_API, "") ?: ""
    }
    
    fun hasGoogleBooksApiKey(): Boolean = getGoogleBooksApiKey().isNotBlank()
    
    // Feature Toggles
    fun setGeminiTtsEnabled(enabled: Boolean) {
        regularPrefs.edit().putBoolean(KEY_GEMINI_TTS_ENABLED, enabled).apply()
    }
    
    fun isGeminiTtsEnabled(): Boolean {
        return regularPrefs.getBoolean(KEY_GEMINI_TTS_ENABLED, true)
    }
    
    fun setGeminiOcrEnabled(enabled: Boolean) {
        regularPrefs.edit().putBoolean(KEY_GEMINI_OCR_ENABLED, enabled).apply()
    }
    
    fun isGeminiOcrEnabled(): Boolean {
        return regularPrefs.getBoolean(KEY_GEMINI_OCR_ENABLED, true)
    }
    
    fun setMusicBrainzEnabled(enabled: Boolean) {
        regularPrefs.edit().putBoolean(KEY_MUSICBRAINZ_ENABLED, enabled).apply()
        _musicBrainzEnabled.value = enabled
    }
    
    fun isMusicBrainzEnabled(): Boolean {
        return regularPrefs.getBoolean(KEY_MUSICBRAINZ_ENABLED, true)
    }
    
    // Usage Tracking
    fun incrementGeminiCalls() {
        val currentCalls = getGeminiCallsThisMonth()
        regularPrefs.edit().putInt(KEY_GEMINI_CALLS_MONTH, currentCalls + 1).apply()
    }
    
    fun getGeminiCallsThisMonth(): Int {
        checkAndResetMonthlyUsage()
        return regularPrefs.getInt(KEY_GEMINI_CALLS_MONTH, 0)
    }
    
    fun incrementTmdbCalls() {
        val currentCalls = getTmdbCallsThisMonth()
        regularPrefs.edit().putInt(KEY_TMDB_CALLS_MONTH, currentCalls + 1).apply()
    }
    
    fun getTmdbCallsThisMonth(): Int {
        checkAndResetMonthlyUsage()
        return regularPrefs.getInt(KEY_TMDB_CALLS_MONTH, 0)
    }
    
    private fun checkAndResetMonthlyUsage() {
        val lastResetDate = regularPrefs.getLong(KEY_LAST_RESET_DATE, 0)
        val currentTime = System.currentTimeMillis()
        val currentMonth = java.util.Calendar.getInstance().apply {
            timeInMillis = currentTime
        }.get(java.util.Calendar.MONTH)
        
        val lastResetMonth = java.util.Calendar.getInstance().apply {
            timeInMillis = if (lastResetDate == 0L) currentTime else lastResetDate
        }.get(java.util.Calendar.MONTH)
        
        if (currentMonth != lastResetMonth) {
            // Reset monthly counters
            regularPrefs.edit()
                .putInt(KEY_GEMINI_CALLS_MONTH, 0)
                .putInt(KEY_TMDB_CALLS_MONTH, 0)
                .putLong(KEY_LAST_RESET_DATE, currentTime)
                .apply()
        }
    }
    
    // Estimated costs (approximate)
    fun getEstimatedMonthlyCost(): Double {
        val geminiCalls = getGeminiCallsThisMonth()
        val tmdbCalls = getTmdbCallsThisMonth()
        
        // Rough estimates (actual costs vary)
        val geminiFreeLimit = 1000 // Free calls per month
        val geminiCostPerCall = 0.001 // $0.001 per call after free limit
        
        val geminiCost = if (geminiCalls > geminiFreeLimit) {
            (geminiCalls - geminiFreeLimit) * geminiCostPerCall
        } else 0.0
        
        // TMDB is free, but we might add paid services later
        val tmdbCost = 0.0
        
        return geminiCost + tmdbCost
    }
    
    // Clear all data (for testing/reset)
    fun clearAllApiKeys() {
        encryptedPrefs.edit().clear().apply()
        _geminiApiKey.value = ""
        _tmdbApiKey.value = ""
    }
    
    fun clearUsageStats() {
        regularPrefs.edit()
            .remove(KEY_GEMINI_CALLS_MONTH)
            .remove(KEY_TMDB_CALLS_MONTH)
            .remove(KEY_LAST_RESET_DATE)
            .apply()
    }
}