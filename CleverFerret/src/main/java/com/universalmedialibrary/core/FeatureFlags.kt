package com.universalmedialibrary.core

/**
 * Feature flags for controlling experimental and optional features
 *
 * This object controls which features are enabled in the application.
 * Features can be disabled to maintain build stability or when
 * dependencies/API keys are not available.
 */
object FeatureFlags {

    /**
     * Enable EPUB4J integration for advanced EPUB parsing
     */
    const val USE_EPUB4J = true

    /**
     * Enable Gemini AI integration for OCR and book identification
     * Requires valid API key to function
     */
    const val ENABLE_GEMINI = true

    /**
     * Enable cloud-based Text-to-Speech services
     * Currently supports Google Cloud TTS (when credentials provided)
     */
    const val ENABLE_CLOUD_TTS = true

    /**
     * Enable ExoPlayer for advanced media playback
     * Provides better audio/video support than basic MediaPlayer
     */
    const val ENABLE_EXOPLAYER = true

    /**
     * Enable podcast discovery and management features
     */
    const val ENABLE_PODCASTS = true

    /**
     * Enable advanced reader features like TTS integration
     */
    const val ENABLE_ADVANCED_READER = true

    /**
     * Enable metadata enhancement via AI services
     */
    const val ENABLE_AI_METADATA = true

    /**
     * Enable audiobook player with advanced features
     */
    const val ENABLE_AUDIOBOOK_PLAYER = true

    /**
     * Enable synchronized reading (read-along) functionality
     */
    const val ENABLE_SYNCHRONIZED_READING = true

    /**
     * Enable experimental features (use with caution)
     */
    const val ENABLE_EXPERIMENTAL = false
}
