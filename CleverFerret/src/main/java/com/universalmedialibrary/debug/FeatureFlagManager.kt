package com.universalmedialibrary.debug

import android.content.Context
import android.content.SharedPreferences
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Feature Flag Manager
 * 
 * Manages runtime feature flags for debug builds.
 * Allows enabling/disabling features without rebuilding.
 */
@Singleton
class FeatureFlagManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val prefs: SharedPreferences = context.getSharedPreferences(
        "debug_feature_flags",
        Context.MODE_PRIVATE
    )
    
    private val _flags = MutableStateFlow<Map<String, Boolean>>(emptyMap())
    val flags: StateFlow<Map<String, Boolean>> = _flags.asStateFlow()
    
    init {
        loadFlags()
    }
    
    private fun loadFlags() {
        val loadedFlags = mutableMapOf<String, Boolean>()
        
        // Define all feature flags with their default values
        FeatureFlag.entries.forEach { flag ->
            loadedFlags[flag.key] = prefs.getBoolean(flag.key, flag.defaultValue)
        }
        
        _flags.value = loadedFlags
    }
    
    fun setFlag(key: String, value: Boolean) {
        prefs.edit().putBoolean(key, value).apply()
        _flags.update { current ->
            current.toMutableMap().apply { put(key, value) }
        }
    }
    
    fun isEnabled(flag: FeatureFlag): Boolean {
        return _flags.value[flag.key] ?: flag.defaultValue
    }
    
    fun isEnabled(key: String): Boolean {
        return _flags.value[key] ?: false
    }
    
    fun resetAll() {
        prefs.edit().clear().apply()
        loadFlags()
    }
}

/**
 * Available Feature Flags
 */
enum class FeatureFlag(
    val key: String,
    val defaultValue: Boolean,
    val description: String
) {
    // UI Features
    ENABLE_VISUALIZER_BACKGROUND(
        "enable_visualizer_background",
        true,
        "Show audio visualizer as background during playback"
    ),
    ENABLE_SLIDE_UP_PLAYER(
        "enable_slide_up_player",
        true,
        "Enable slide-up media control bar"
    ),
    ENABLE_ANIMATED_PAGE_TURNS(
        "enable_animated_page_turns",
        true,
        "Enable animated page turn effects in book reader"
    ),
    
    // Networking Features
    ENABLE_OFFLINE_MODE(
        "enable_offline_mode",
        false,
        "Force offline mode for testing"
    ),
    ENABLE_MOCK_API(
        "enable_mock_api",
        false,
        "Use mock API responses instead of real network calls"
    ),
    
    // Media Server Features
    ENABLE_PLEX_INTEGRATION(
        "enable_plex_integration",
        true,
        "Enable Plex media server integration"
    ),
    ENABLE_JELLYFIN_INTEGRATION(
        "enable_jellyfin_integration",
        true,
        "Enable Jellyfin media server integration"
    ),
    ENABLE_EMBY_INTEGRATION(
        "enable_emby_integration",
        true,
        "Enable Emby media server integration"
    ),
    
    // Radio Features
    ENABLE_FM_RADIO(
        "enable_fm_radio",
        true,
        "Enable FM radio functionality"
    ),
    ENABLE_HD_RADIO(
        "enable_hd_radio",
        true,
        "Enable HD radio functionality"
    ),
    ENABLE_INTERNET_RADIO(
        "enable_internet_radio",
        true,
        "Enable internet radio streaming"
    ),
    
    // Debug Features
    VERBOSE_LOGGING(
        "verbose_logging",
        false,
        "Enable verbose debug logging"
    ),
    SHOW_PERFORMANCE_OVERLAY(
        "show_performance_overlay",
        false,
        "Show real-time performance metrics overlay"
    ),
    NETWORK_REQUEST_LOGGING(
        "network_request_logging",
        false,
        "Log all network requests and responses"
    ),
    
    // Experimental Features
    EXPERIMENTAL_READER_ENGINE(
        "experimental_reader_engine",
        false,
        "Use experimental book reader rendering engine"
    ),
    EXPERIMENTAL_AI_FEATURES(
        "experimental_ai_features",
        false,
        "Enable AI-powered features (recommendations, summaries)"
    ),
    EXPERIMENTAL_CAST_FEATURES(
        "experimental_cast_features",
        false,
        "Enable experimental Chromecast features"
    )
}
