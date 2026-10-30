package com.universalmedialibrary.core

import android.content.Context

/**
 * Feature flags for controlling experimental and optional features
 *
 * This object controls which features are enabled in the application.
 * Feature evaluation is delegated to [FeatureFlagRegistry] which enforces
 * build-variant specific gating rules (immutable true in Release, mutable in Debug).
 */
object FeatureFlags {

    @Volatile
    private var registry: FeatureFlagRegistry = ReleaseFeatureFlagRegistry()

    /**
     * Initialize feature flags with application context
     * Call this from Application.onCreate()
     */
    fun init(context: Context) {
        if (com.universalmedialibrary.BuildConfig.DEBUG) {
            registry = DebugFeatureFlagRegistry(context.applicationContext)
        } else {
            registry = ReleaseFeatureFlagRegistry()
        }
    }

    /**
     * Set explicit FeatureFlagRegistry instance (e.g. via Hilt DI or testing)
     */
    fun setRegistry(newRegistry: FeatureFlagRegistry) {
        registry = newRegistry
    }

    /**
     * Get active registry instance
     */
    fun getRegistry(): FeatureFlagRegistry = registry

    /**
     * Enable EPUB4J integration for advanced EPUB parsing
     */
    var USE_EPUB4J: Boolean
        get() = registry.isEpub4jEnabled
        set(value) { setFlag(FeatureFlag.USE_EPUB4J, value) }

    /**
     * Enable Gemini AI integration for OCR and book identification
     */
    var ENABLE_GEMINI: Boolean
        get() = registry.isGeminiEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_GEMINI, value) }

    /**
     * Enable cloud-based Text-to-Speech services
     */
    var ENABLE_CLOUD_TTS: Boolean
        get() = registry.isCloudTtsEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_CLOUD_TTS, value) }

    /**
     * Enable ExoPlayer for advanced media playback
     */
    var ENABLE_EXOPLAYER: Boolean
        get() = registry.isExoPlayerEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_EXOPLAYER, value) }

    /**
     * Enable podcast discovery and management features
     */
    var ENABLE_PODCASTS: Boolean
        get() = registry.isPodcastsEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_PODCASTS, value) }

    /**
     * Enable advanced reader features like TTS integration
     */
    var ENABLE_ADVANCED_READER: Boolean
        get() = registry.isAdvancedReaderEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_ADVANCED_READER, value) }

    /**
     * Enable metadata enhancement via AI services
     */
    var ENABLE_AI_METADATA: Boolean
        get() = registry.isAiMetadataEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_AI_METADATA, value) }

    /**
     * Enable audiobook player with advanced features
     */
    var ENABLE_AUDIOBOOK_PLAYER: Boolean
        get() = registry.isAudiobookPlayerEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_AUDIOBOOK_PLAYER, value) }

    /**
     * Enable synchronized reading (read-along) functionality
     */
    var ENABLE_SYNCHRONIZED_READING: Boolean
        get() = registry.isSynchronizedReadingEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_SYNCHRONIZED_READING, value) }

    /**
     * Enable experimental features
     */
    var ENABLE_EXPERIMENTAL: Boolean
        get() = registry.isExperimentalEnabled
        set(value) { setFlag(FeatureFlag.ENABLE_EXPERIMENTAL, value) }

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
        return registry.getAllFlags()
    }

    /**
     * Set a feature flag value
     */
    fun setFlag(flag: FeatureFlag, enabled: Boolean) {
        registry.setFlag(flag, enabled)
    }

    /**
     * Reset all flags to default values
     */
    fun resetToDefaults() {
        registry.resetToDefaults()
    }
}
