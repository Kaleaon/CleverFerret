package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Entity for persisting general app settings
 */
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
     * Last time settings were updated
     */
    val lastUpdated: Long = System.currentTimeMillis()
)
