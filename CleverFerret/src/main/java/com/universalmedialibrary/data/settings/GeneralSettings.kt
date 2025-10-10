package com.universalmedialibrary.data.settings

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "general_settings")
data class GeneralSettings(
    @PrimaryKey
    val id: String = "default",
    val theme: AppTheme = AppTheme.DARK,
    val language: String = "en",
    val autoBackup: Boolean = true,
    val backupFrequency: BackupFrequency = BackupFrequency.DAILY,
    val enableAnalytics: Boolean = false,
    val enableCrashReporting: Boolean = true,
    val enableNotifications: Boolean = true,
    val autoSync: Boolean = true,
    val syncWifiOnly: Boolean = true,
    val enableBetaFeatures: Boolean = false,
    val maxCacheSize: Long = 1024L * 1024L * 1024L, // 1GB
    val enableDebugMode: Boolean = false,
    val lastBackup: Long = 0L,
    val appVersion: String = "1.0.0"
)

enum class AppTheme {
    LIGHT,
    DARK,
    SYSTEM
}

enum class BackupFrequency {
    NEVER,
    DAILY,
    WEEKLY,
    MONTHLY
}

data class AppSettings(
    val general: GeneralSettings,
    val reader: com.universalmedialibrary.data.local.entity.ReaderSettingsEntity,
    val security: SecuritySettings
)
