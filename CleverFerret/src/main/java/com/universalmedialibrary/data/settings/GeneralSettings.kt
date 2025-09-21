package com.universalmedialibrary.data.settings

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents the general application settings.
 *
 * @property id The unique identifier for the settings entry.
 * @property theme The selected application theme.
 * @property language The selected application language.
 * @property autoBackup Whether automatic backups are enabled.
 * @property backupFrequency How often to perform automatic backups.
 * @property enableAnalytics Whether to send anonymous usage analytics.
 * @property enableCrashReporting Whether to send crash reports.
 * @property enableNotifications Whether to show notifications.
 * @property autoSync Whether automatic syncing is enabled.
 * @property syncWifiOnly Whether to sync only when connected to Wi-Fi.
 * @property enableBetaFeatures Whether to enable experimental beta features.
 * @property maxCacheSize The maximum size of the application cache in bytes.
 * @property enableDebugMode Whether debug mode is enabled.
 * @property lastBackup The timestamp of the last successful backup.
 * @property appVersion The version of the application that last saved these settings.
 */
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

/**
 * The available themes for the application.
 */
enum class AppTheme {
    /** A light color scheme. */
    LIGHT,
    /** A dark color scheme. */
    DARK,
    /** Follow the system's theme setting. */
    SYSTEM
}

/**
 * The available frequencies for automatic backups.
 */
enum class BackupFrequency {
    /** Never perform automatic backups. */
    NEVER,
    /** Perform backups daily. */
    DAILY,
    /** Perform backups weekly. */
    WEEKLY,
    /** Perform backups monthly. */
    MONTHLY
}

/**
 * A container for all application settings.
 *
 * @property general The general application settings.
 * @property reader The settings for the e-reader and media viewers.
 * @property security The security-related settings.
 */
data class AppSettings(
    val general: GeneralSettings,
    val reader: ReaderSettings,
    val security: SecuritySettings
)