package com.universalmedialibrary.data.settings

import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * Represents the security-related settings for the application.
 *
 * @property id The unique identifier for the settings entry.
 * @property enablePinLock Whether to require a PIN to unlock the app.
 * @property pinCode The user's PIN code (should be stored hashed).
 * @property enableBiometric Whether to allow biometric (fingerprint, face) unlock.
 * @property autoLockTimeout The time in milliseconds before the app automatically locks.
 * @property hideContentInRecents Whether to hide app content in the recent apps screen.
 * @property enablePrivateMode Whether private mode is enabled, which might hide certain libraries or content.
 * @property encryptDatabase Whether the database should be encrypted.
 * @property requireAuthForExport Whether to require authentication before exporting data.
 * @property enableAuditLog Whether to keep a log of security-related events.
 * @property lastSecurityCheck The timestamp of the last security check.
 */
@Entity(tableName = "security_settings")
data class SecuritySettings(
    @PrimaryKey
    val id: String = "default",
    val enablePinLock: Boolean = false,
    val pinCode: String? = null,
    val enableBiometric: Boolean = false,
    val autoLockTimeout: Long = 300000L, // 5 minutes in milliseconds
    val hideContentInRecents: Boolean = false,
    val enablePrivateMode: Boolean = false,
    val encryptDatabase: Boolean = false,
    val requireAuthForExport: Boolean = true,
    val enableAuditLog: Boolean = false,
    val lastSecurityCheck: Long = System.currentTimeMillis()
)

/**
 * The available levels of security for unlocking the app.
 */
enum class SecurityLevel {
    /** No security lock. */
    NONE,
    /** Require a PIN to unlock. */
    PIN,
    /** Require biometrics (fingerprint, face) to unlock. */
    BIOMETRIC,
    /** Require both PIN and biometrics to unlock. */
    PIN_AND_BIOMETRIC
}

/**
 * Represents an entry in the security audit log.
 *
 * @property timestamp The time the event occurred.
 * @property action The action that was performed (e.g., "LOGIN_ATTEMPT").
 * @property details Any additional details about the event.
 * @property successful Whether the action was successful.
 */
data class SecurityAuditEntry(
    val timestamp: Long,
    val action: String,
    val details: String?,
    val successful: Boolean
)