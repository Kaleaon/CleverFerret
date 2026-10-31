package com.universalmedialibrary.core

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Feature Flag Registry Interface
 *
 * Provides build-aware feature flag values and mutation capabilities.
 */
interface FeatureFlagRegistry {
    val isEpub4jEnabled: Boolean
    val isGeminiEnabled: Boolean
    val isCloudTtsEnabled: Boolean
    val isExoPlayerEnabled: Boolean
    val isPodcastsEnabled: Boolean
    val isAdvancedReaderEnabled: Boolean
    val isAiMetadataEnabled: Boolean
    val isAudiobookPlayerEnabled: Boolean
    val isSynchronizedReadingEnabled: Boolean
    val isExperimentalEnabled: Boolean

    fun isEnabled(flag: FeatureFlags.FeatureFlag): Boolean
    fun setFlag(flag: FeatureFlags.FeatureFlag, enabled: Boolean)
    fun getAllFlags(): List<Pair<FeatureFlags.FeatureFlag, Boolean>>
    fun resetToDefaults()
}

/**
 * Release Feature Flag Registry Implementation
 *
 * Enforces immutable `true` values for mature production capabilities:
 * - USE_EPUB4J
 * - ENABLE_EXOPLAYER
 * - ENABLE_PODCASTS
 * - ENABLE_ADVANCED_READER
 * - ENABLE_AUDIOBOOK_PLAYER
 * - ENABLE_SYNCHRONIZED_READING
 *
 * Toggle modifications for mature capabilities are ignored in release builds.
 */
class ReleaseFeatureFlagRegistry @Inject constructor() : FeatureFlagRegistry {

    override val isEpub4jEnabled: Boolean get() = true
    override val isGeminiEnabled: Boolean get() = true
    override val isCloudTtsEnabled: Boolean get() = true
    override val isExoPlayerEnabled: Boolean get() = true
    override val isPodcastsEnabled: Boolean get() = true
    override val isAdvancedReaderEnabled: Boolean get() = true
    override val isAiMetadataEnabled: Boolean get() = true
    override val isAudiobookPlayerEnabled: Boolean get() = true
    override val isSynchronizedReadingEnabled: Boolean get() = true
    override val isExperimentalEnabled: Boolean get() = false

    override fun isEnabled(flag: FeatureFlags.FeatureFlag): Boolean {
        return when (flag) {
            FeatureFlags.FeatureFlag.USE_EPUB4J -> isEpub4jEnabled
            FeatureFlags.FeatureFlag.ENABLE_EXOPLAYER -> isExoPlayerEnabled
            FeatureFlags.FeatureFlag.ENABLE_PODCASTS -> isPodcastsEnabled
            FeatureFlags.FeatureFlag.ENABLE_ADVANCED_READER -> isAdvancedReaderEnabled
            FeatureFlags.FeatureFlag.ENABLE_AUDIOBOOK_PLAYER -> isAudiobookPlayerEnabled
            FeatureFlags.FeatureFlag.ENABLE_SYNCHRONIZED_READING -> isSynchronizedReadingEnabled
            FeatureFlags.FeatureFlag.ENABLE_GEMINI -> isGeminiEnabled
            FeatureFlags.FeatureFlag.ENABLE_CLOUD_TTS -> isCloudTtsEnabled
            FeatureFlags.FeatureFlag.ENABLE_AI_METADATA -> isAiMetadataEnabled
            FeatureFlags.FeatureFlag.ENABLE_EXPERIMENTAL -> isExperimentalEnabled
        }
    }

    override fun setFlag(flag: FeatureFlags.FeatureFlag, enabled: Boolean) {
        // No-op in release builds to maintain static production behavior
    }

    override fun getAllFlags(): List<Pair<FeatureFlags.FeatureFlag, Boolean>> {
        return FeatureFlags.FeatureFlag.entries.map { flag ->
            flag to isEnabled(flag)
        }
    }

    override fun resetToDefaults() {
        // No-op in release builds
    }
}

/**
 * Debug Feature Flag Registry Implementation
 *
 * Allows full runtime toggle overrides for testing in debug builds.
 * Persists overrides in SharedPreferences.
 */
@Singleton
class DebugFeatureFlagRegistry @Inject constructor(
    @ApplicationContext private val context: Context
) : FeatureFlagRegistry {

    companion object {
        private const val PREFS_NAME = "feature_flags_debug"
    }

    private val prefs: SharedPreferences by lazy {
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    }

    override val isEpub4jEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.USE_EPUB4J)

    override val isGeminiEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_GEMINI)

    override val isCloudTtsEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_CLOUD_TTS)

    override val isExoPlayerEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_EXOPLAYER)

    override val isPodcastsEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_PODCASTS)

    override val isAdvancedReaderEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_ADVANCED_READER)

    override val isAiMetadataEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_AI_METADATA)

    override val isAudiobookPlayerEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_AUDIOBOOK_PLAYER)

    override val isSynchronizedReadingEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_SYNCHRONIZED_READING)

    override val isExperimentalEnabled: Boolean
        get() = isEnabled(FeatureFlags.FeatureFlag.ENABLE_EXPERIMENTAL)

    override fun isEnabled(flag: FeatureFlags.FeatureFlag): Boolean {
        return prefs.getBoolean(flag.key, flag.defaultValue)
    }

    override fun setFlag(flag: FeatureFlags.FeatureFlag, enabled: Boolean) {
        prefs.edit { putBoolean(flag.key, enabled) }
    }

    override fun getAllFlags(): List<Pair<FeatureFlags.FeatureFlag, Boolean>> {
        return FeatureFlags.FeatureFlag.entries.map { flag ->
            flag to isEnabled(flag)
        }
    }

    override fun resetToDefaults() {
        prefs.edit {
            FeatureFlags.FeatureFlag.entries.forEach { flag ->
                putBoolean(flag.key, flag.defaultValue)
            }
        }
    }
}
