package com.universalmedialibrary.data.settings

data class GeneralSettings(
    val appTheme: String = "system", // "light", "dark", "system"
    val language: String = "system",
    val autoScanEnabled: Boolean = true,
    val scanIntervalHours: Int = 24,
    val notificationsEnabled: Boolean = true,
    val wifiOnlySync: Boolean = true,
    val automaticBackup: Boolean = false,
    val backupIntervalDays: Int = 7,
    val cacheSizeMB: Int = 500,
    val preloadCovers: Boolean = true,
    val lowPowerModeEnabled: Boolean = false,
    val debugModeEnabled: Boolean = false,
    val betaFeaturesEnabled: Boolean = false
)