package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

/**
 * Entity for persisting security settings
 */
@Serializable
@Entity(tableName = "security_settings")
data class SecuritySettingsEntity(
    @PrimaryKey
    val id: Int = 1, // Only one settings record
    
    /**
     * Whether biometric authentication is required to open the app
     */
    val requireBiometric: Boolean = false,
    
    /**
     * Auto-lock timeout in minutes (0 = never)
     */
    val lockTimeoutMinutes: Int = 5,
    
    /**
     * Whether to allow screenshots in the app
     */
    val allowScreenshots: Boolean = true,
    
    /**
     * Whether to hide content in recent apps
     */
    val hideInRecents: Boolean = false,
    
    /**
     * Whether to require authentication for content changes
     */
    val requireAuthForContentChanges: Boolean = false,
    
    /**
     * Last time settings were updated
     */
    val lastUpdated: Long = System.currentTimeMillis()
)
