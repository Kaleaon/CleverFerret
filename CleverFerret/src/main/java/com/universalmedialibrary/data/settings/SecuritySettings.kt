package com.universalmedialibrary.data.settings

data class SecuritySettings(
    val pinLockEnabled: Boolean = false,
    val biometricEnabled: Boolean = false,
    val autoLockTimeoutMinutes: Int = 5,
    val hideRecentApps: Boolean = false,
    val encryptDatabase: Boolean = false,
    val allowScreenshots: Boolean = true,
    val parentalControlsEnabled: Boolean = false,
    val ageRestrictionLevel: Int = 0, // 0 = No restriction, 18 = Adults only
    val privacyModeEnabled: Boolean = false,
    val dataCollectionEnabled: Boolean = true,
    val analyticsEnabled: Boolean = true,
    val crashReportingEnabled: Boolean = true
)