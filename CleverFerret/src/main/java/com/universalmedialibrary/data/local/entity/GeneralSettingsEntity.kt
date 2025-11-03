package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Entity for persisting general app settings
 */
@Serializable
@Entity(tableName = "general_settings")
data class GeneralSettingsEntity(
    @PrimaryKey
    val id: Int = 1, // Only one settings record
    
    /**
     * App language code (e.g., "en", "es", "fr")
     */
    val languageCode: String = "en",
    
    /**
     * Theme mode: "light", "dark", "auto"
     */
    val themeMode: String = "auto",
    
    /**
     * Selected theme palette name
     */
    val themePalette: String = "BURGUNDY_ROSE_GOLD",
    
    /**
     * Default font size in SP
     */
    val defaultFontSize: Int = 16,
    
    /**
     * Whether to use dynamic colors (Material You)
     */
    val useDynamicColors: Boolean = true,
    
    /**
     * Whether to show animations
     */
    val enableAnimations: Boolean = true,
    
    /**
     * Whether to auto-play next episode/chapter
     */
    val autoPlayNext: Boolean = true,
    
    /**
     * Default playback speed (1.0 = normal)
     */
    val defaultPlaybackSpeed: Float = 1.0f,
    
    /**
     * Whether to remember playback position
     */
    val rememberPlaybackPosition: Boolean = true,
    
    /**
     * Skip intro/outro duration in seconds
     */
    val skipIntroSeconds: Int = 0,
    val skipOutroSeconds: Int = 0,
    
    /**
     * UI Feature Flags from Myne Analysis (Phase 2 & 3)
     */
    
    /**
     * Enable swipe actions for library items (Phase 2)
     * Allows swipe-to-delete, swipe-to-archive, etc.
     */
    val enableSwipeActions: Boolean = true,
    
    /**
     * Enable tutorial/onboarding overlays (Phase 3)
     * Shows TapTarget hints for first-time users
     */
    val enableTutorialOverlays: Boolean = true,
    
    /**
     * Show tutorial overlay for library creation
     */
    val showLibraryTutorial: Boolean = true,
    
    /**
     * Show tutorial overlay for Calibre import
     */
    val showCalibreTutorial: Boolean = true,
    
    /**
     * Show tutorial overlay for media type selection
     */
    val showMediaTypeTutorial: Boolean = true,
    
    /**
     * Last time settings were updated
     */
    val lastUpdated: Long = System.currentTimeMillis()
)
