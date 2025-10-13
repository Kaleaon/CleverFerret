package com.universalmedialibrary.services.tts

/**
 * TTS Provider enumeration
 * Defines available Text-to-Speech providers
 */
enum class TtsProvider(
    val displayName: String,
    val description: String,
    val requiresApiKey: Boolean
) {
    ANDROID(
        displayName = "Android TTS",
        description = "Built-in device text-to-speech (offline, free)",
        requiresApiKey = false
    ),
    GOOGLE_CLOUD(
        displayName = "Google Cloud TTS",
        description = "High-quality neural voices (requires API key)",
        requiresApiKey = true
    ),
    GEMINI(
        displayName = "Google Gemini",
        description = "AI-powered natural speech (requires API key)",
        requiresApiKey = true
    ),
    ELEVEN_LABS(
        displayName = "ElevenLabs",
        description = "Ultra-realistic AI voices (requires API key)",
        requiresApiKey = true
    ),
    OPENAI(
        displayName = "OpenAI TTS",
        description = "Natural human-like speech (requires API key)",
        requiresApiKey = true
    );

    val isCloudBased: Boolean
        get() = this != ANDROID

    val requiresNetwork: Boolean
        get() = isCloudBased
}

/**
 * TTS Provider Settings
 * 
 * Note: apiKey is moved out of primary constructor to prevent leakage
 * via auto-generated toString() and reflection-based serialization
 */
data class TtsProviderSettings(
    val provider: TtsProvider = TtsProvider.ANDROID,
    val model: String? = null, // For providers with multiple models
    val voiceId: String? = null, // For providers with voice selection
    val useStreaming: Boolean = true, // For real-time audio streaming
    val cacheAudio: Boolean = true // Cache generated audio locally
) {
    // API key stored outside primary constructor to prevent leakage
    @Transient
    var apiKey: String? = null
    
    // Override toString to redact sensitive data
    override fun toString(): String {
        return "TtsProviderSettings(provider=$provider, model=$model, voiceId=$voiceId, " +
                "useStreaming=$useStreaming, cacheAudio=$cacheAudio, apiKey=[REDACTED])"
    }
}
