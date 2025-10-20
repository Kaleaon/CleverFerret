package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * API Settings Entity
 * 
 * Stores configuration settings for each API provider
 */
@Entity(tableName = "api_settings")
data class ApiSettingsEntity(
    @PrimaryKey
    val serviceId: String, // e.g., "tmdb", "openai", "podcast_index"
    
    // API Key (stored separately in encrypted prefs, this is just metadata)
    val isConfigured: Boolean = false,
    val hasApiKey: Boolean = false,
    
    // Provider details
    val providerName: String,
    val category: String, // "tts", "metadata", "podcast"
    val description: String,
    
    // Configuration settings
    val model: String? = null, // For TTS providers
    val voiceId: String? = null, // For TTS providers
    val region: String? = null, // For regional APIs
    val rateLimit: Int? = null, // Requests per minute
    val priority: Int = 0, // Higher = preferred when multiple configured
    
    // Usage tracking
    val enabled: Boolean = true,
    val lastUsed: Long = 0L,
    val usageCount: Int = 0,
    
    // URLs
    val apiKeyUrl: String,
    val docsUrl: String,
    
    // Metadata
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)
