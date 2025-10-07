package com.universalmedialibrary.core

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit

/**
 * Feature flags for controlling experimental and optional features
 *
 * This object controls which features are enabled in the application.
 * Features can be toggled at runtime and persisted to SharedPreferences.
 * 
 * Usage:
 *   FeatureFlags.init(context)
 *   if (FeatureFlags.USE_EPUB4J) { ... }
 *   FeatureFlags.setFlag(FeatureFlag.USE_EPUB4J, false)
 */
object FeatureFlags {
    private const val PREFS_NAME = "feature_flags"
    private var prefs: SharedPreferences? = null

    /**
     * Initialize feature flags with application context
     * Call this from Application.onCreate()
     */
    fun init(context: Context) {
        if (prefs == null) {
            prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        }
    }

    /**
     * Enable EPUB4J integration for advanced EPUB parsing
     */
    var USE_EPUB4J: Boolean
        get() = prefs?.getBoolean("USE_EPUB4J", true) ?: true
        set(value) { prefs?.edit { putBoolean("USE_EPUB4J", value) } }

    /**
     * Enable Gemini AI integration for OCR and book identification
     * Requires valid API key to function
     */
    var ENABLE_GEMINI: Boolean
        get() = prefs?.getBoolean("ENABLE_GEMINI", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_GEMINI", value) } }

    /**
     * Enable cloud-based Text-to-Speech services
     * Currently supports Google Cloud TTS (when credentials provided)
     */
    var ENABLE_CLOUD_TTS: Boolean
        get() = prefs?.getBoolean("ENABLE_CLOUD_TTS", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_CLOUD_TTS", value) } }

    /**
     * Enable ExoPlayer for advanced media playback
     * Provides better audio/video support than basic MediaPlayer
     */
    var ENABLE_EXOPLAYER: Boolean
        get() = prefs?.getBoolean("ENABLE_EXOPLAYER", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_EXOPLAYER", value) } }

    /**
     * Enable podcast discovery and management features
     */
    var ENABLE_PODCASTS: Boolean
        get() = prefs?.getBoolean("ENABLE_PODCASTS", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_PODCASTS", value) } }

    /**
     * Enable advanced reader features like TTS integration
     */
    var ENABLE_ADVANCED_READER: Boolean
        get() = prefs?.getBoolean("ENABLE_ADVANCED_READER", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_ADVANCED_READER", value) } }

    /**
     * Enable metadata enhancement via AI services
     */
    var ENABLE_AI_METADATA: Boolean
        get() = prefs?.getBoolean("ENABLE_AI_METADATA", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_AI_METADATA", value) } }

    /**
     * Enable audiobook player with advanced features
     */
    var ENABLE_AUDIOBOOK_PLAYER: Boolean
        get() = prefs?.getBoolean("ENABLE_AUDIOBOOK_PLAYER", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_AUDIOBOOK_PLAYER", value) } }

    /**
     * Enable synchronized reading (read-along) functionality
     */
    var ENABLE_SYNCHRONIZED_READING: Boolean
        get() = prefs?.getBoolean("ENABLE_SYNCHRONIZED_READING", true) ?: true
        set(value) { prefs?.edit { putBoolean("ENABLE_SYNCHRONIZED_READING", value) } }

    /**
     * Enable experimental features (use with caution)
     */
    var ENABLE_EXPERIMENTAL: Boolean
        get() = prefs?.getBoolean("ENABLE_EXPERIMENTAL", false) ?: false
        set(value) { prefs?.edit { putBoolean("ENABLE_EXPERIMENTAL", value) } }

    /**
     * Feature flag enumeration for UI access
     */
    enum class FeatureFlag(
        val key: String,
        val displayName: String,
        val description: String,
        val defaultValue: Boolean
    ) {
        USE_EPUB4J(
            "USE_EPUB4J",
            "EPUB4J Integration",
            "Advanced EPUB parsing capabilities",
            true
        ),
        ENABLE_GEMINI(
            "ENABLE_GEMINI",
            "Gemini AI",
            "OCR and book identification",
            true
        ),
        ENABLE_CLOUD_TTS(
            "ENABLE_CLOUD_TTS",
            "Cloud Text-to-Speech",
            "Google Cloud TTS support",
            true
        ),
        ENABLE_EXOPLAYER(
            "ENABLE_EXOPLAYER",
            "ExoPlayer",
            "Advanced media playback",
            true
        ),
        ENABLE_PODCASTS(
            "ENABLE_PODCASTS",
            "Podcasts",
            "Podcast discovery and management",
            true
        ),
        ENABLE_ADVANCED_READER(
            "ENABLE_ADVANCED_READER",
            "Advanced Reader",
            "TTS integration and advanced features",
            true
        ),
        ENABLE_AI_METADATA(
            "ENABLE_AI_METADATA",
            "AI Metadata Enhancement",
            "Automatic metadata enhancement via AI",
            true
        ),
        ENABLE_AUDIOBOOK_PLAYER(
            "ENABLE_AUDIOBOOK_PLAYER",
            "Audiobook Player",
            "Advanced audiobook playback features",
            true
        ),
        ENABLE_SYNCHRONIZED_READING(
            "ENABLE_SYNCHRONIZED_READING",
            "Synchronized Reading",
            "Read-along functionality",
            true
        ),
        ENABLE_EXPERIMENTAL(
            "ENABLE_EXPERIMENTAL",
            "Experimental Features",
            "Unstable experimental features",
            false
        )
    }

    /**
     * Get all feature flags for UI display
     */
    fun getAllFlags(): List<Pair<FeatureFlag, Boolean>> {
        return FeatureFlag.entries.map { flag ->
            flag to (prefs?.getBoolean(flag.key, flag.defaultValue) ?: flag.defaultValue)
        }
    }

    /**
     * Set a feature flag value
     */
    fun setFlag(flag: FeatureFlag, enabled: Boolean) {
        prefs?.edit {
            putBoolean(flag.key, enabled)
        }
    }

    /**
     * Reset all flags to default values
     */
    fun resetToDefaults() {
        prefs?.edit {
            FeatureFlag.entries.forEach { flag ->
                putBoolean(flag.key, flag.defaultValue)
            }
        }
    }
}
