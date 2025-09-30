package com.universalmedialibrary.data.settings

import androidx.room.Entity
import androidx.room.PrimaryKey

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

enum class SecurityLevel {
    NONE,
    PIN,
    BIOMETRIC,
    PIN_AND_BIOMETRIC
}

data class SecurityAuditEntry(
    val timestamp: Long,
    val action: String,
    val details: String?,
    val successful: Boolean
)
