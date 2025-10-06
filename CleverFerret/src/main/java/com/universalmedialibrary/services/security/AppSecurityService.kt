package com.universalmedialibrary.services.security

import android.content.Context
import android.content.SharedPreferences
import android.security.keystore.KeyGenParameterSpec
import android.security.keystore.KeyProperties
import androidx.biometric.BiometricManager
import androidx.biometric.BiometricPrompt
import androidx.core.content.ContextCompat
import androidx.fragment.app.FragmentActivity
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import java.security.KeyStore
import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.inject.Inject
import javax.inject.Singleton

/**
 * App Security Service
 * Features:
 * - PIN lock
 * - Pattern lock
 * - Biometric authentication (fingerprint, face)
 * - App locking with auto-lock timer
 * - Screen lock on app switch
 * - Private mode for sensitive content
 * - Encrypted storage for sensitive data
 * - Session management
 */

enum class LockType {
    NONE,
    PIN,
    PATTERN,
    BIOMETRIC,
    PIN_AND_BIOMETRIC,
    PATTERN_AND_BIOMETRIC
}

enum class AuthenticationState {
    AUTHENTICATED,
    LOCKED,
    PENDING_AUTHENTICATION
}

data class SecuritySettings(
    val lockType: LockType = LockType.NONE,
    val autoLockEnabled: Boolean = true,
    val autoLockTimeout: Long = 60000,      // milliseconds (1 minute)
    val lockOnAppSwitch: Boolean = true,
    val hideContentInRecents: Boolean = true,
    val biometricEnabled: Boolean = false,
    val requireAuthForSettings: Boolean = true,
    val requireAuthForSync: Boolean = true,
    val privateModeEnabled: Boolean = false
)

@Singleton
class AppSecurityService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val _authState = MutableStateFlow(AuthenticationState.LOCKED)
    val authState: StateFlow<AuthenticationState> = _authState.asStateFlow()

    private val _securitySettings = MutableStateFlow(SecuritySettings())
    val securitySettings: StateFlow<SecuritySettings> = _securitySettings.asStateFlow()

    private val _isPrivateMode = MutableStateFlow(false)
    val isPrivateMode: StateFlow<Boolean> = _isPrivateMode.asStateFlow()

    private var lastActivityTime: Long = System.currentTimeMillis()
    private var sessionToken: String? = null

    private val prefs: SharedPreferences
    private val encryptedPrefs: SharedPreferences

    init {
        // Initialize encrypted shared preferences
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()

        encryptedPrefs = EncryptedSharedPreferences.create(
            context,
            "secure_prefs",
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )

        prefs = context.getSharedPreferences("security_settings", Context.MODE_PRIVATE)
        loadSettings()
    }

    /**
     * Load security settings
     */
    private fun loadSettings() {
        val lockTypeValue = prefs.getString("lock_type", LockType.NONE.name) ?: LockType.NONE.name
        val lockType = try {
            LockType.valueOf(lockTypeValue)
        } catch (e: Exception) {
            LockType.NONE
        }

        _securitySettings.value = SecuritySettings(
            lockType = lockType,
            autoLockEnabled = prefs.getBoolean("auto_lock_enabled", true),
            autoLockTimeout = prefs.getLong("auto_lock_timeout", 60000),
            lockOnAppSwitch = prefs.getBoolean("lock_on_app_switch", true),
            hideContentInRecents = prefs.getBoolean("hide_content_in_recents", true),
            biometricEnabled = prefs.getBoolean("biometric_enabled", false),
            requireAuthForSettings = prefs.getBoolean("require_auth_for_settings", true),
            requireAuthForSync = prefs.getBoolean("require_auth_for_sync", true),
            privateModeEnabled = prefs.getBoolean("private_mode_enabled", false)
        )

        // Check if we should start locked
        if (_securitySettings.value.lockType != LockType.NONE) {
            _authState.value = AuthenticationState.LOCKED
        } else {
            _authState.value = AuthenticationState.AUTHENTICATED
        }
    }

    /**
     * Update security settings
     */
    fun updateSettings(newSettings: SecuritySettings) {
        _securitySettings.value = newSettings
        
        prefs.edit().apply {
            putString("lock_type", newSettings.lockType.name)
            putBoolean("auto_lock_enabled", newSettings.autoLockEnabled)
            putLong("auto_lock_timeout", newSettings.autoLockTimeout)
            putBoolean("lock_on_app_switch", newSettings.lockOnAppSwitch)
            putBoolean("hide_content_in_recents", newSettings.hideContentInRecents)
            putBoolean("biometric_enabled", newSettings.biometricEnabled)
            putBoolean("require_auth_for_settings", newSettings.requireAuthForSettings)
            putBoolean("require_auth_for_sync", newSettings.requireAuthForSync)
            putBoolean("private_mode_enabled", newSettings.privateModeEnabled)
        }.apply()
    }

    /**
     * Set PIN
     */
    fun setPin(pin: String): Boolean {
        if (pin.length < 4) return false
        
        val hashedPin = hashPin(pin)
        encryptedPrefs.edit().putString("pin", hashedPin).apply()
        return true
    }

    /**
     * Verify PIN
     */
    fun verifyPin(pin: String): Boolean {
        // Check if temporarily locked due to failed attempts
        if (isTemporarilyLocked()) {
            return false
        }
        
        val storedPin = encryptedPrefs.getString("pin", null) ?: return false
        val hashedPin = hashPin(pin)
        
        if (hashedPin == storedPin) {
            resetFailedAttempts()
            authenticate()
            return true
        }
        
        // Incorrect PIN - increment failed attempts
        incrementFailedAttempts()
        return false
    }

    /**
     * Set pattern
     */
    fun setPattern(pattern: List<Int>): Boolean {
        if (pattern.size < 4) return false
        
        val patternString = pattern.joinToString(",")
        val hashedPattern = hashPattern(patternString)
        encryptedPrefs.edit().putString("pattern", hashedPattern).apply()
        return true
    }

    /**
     * Verify pattern
     */
    fun verifyPattern(pattern: List<Int>): Boolean {
        // Check if temporarily locked due to failed attempts
        if (isTemporarilyLocked()) {
            return false
        }
        
        val storedPattern = encryptedPrefs.getString("pattern", null) ?: return false
        val patternString = pattern.joinToString(",")
        val hashedPattern = hashPattern(patternString)
        
        if (hashedPattern == storedPattern) {
            resetFailedAttempts()
            authenticate()
            return true
        }
        
        // Incorrect pattern - increment failed attempts
        incrementFailedAttempts()
        return false
    }

    /**
     * Check if biometric authentication is available
     */
    fun isBiometricAvailable(): Int {
        val biometricManager = BiometricManager.from(context)
        return biometricManager.canAuthenticate(
            BiometricManager.Authenticators.BIOMETRIC_STRONG or
            BiometricManager.Authenticators.BIOMETRIC_WEAK
        )
    }

    /**
     * Show biometric prompt
     */
    fun showBiometricPrompt(
        activity: FragmentActivity,
        onSuccess: () -> Unit,
        onError: (String) -> Unit
    ) {
        val executor = ContextCompat.getMainExecutor(context)
        
        val biometricPrompt = BiometricPrompt(
            activity,
            executor,
            object : BiometricPrompt.AuthenticationCallback() {
                override fun onAuthenticationSucceeded(
                    result: BiometricPrompt.AuthenticationResult
                ) {
                    super.onAuthenticationSucceeded(result)
                    authenticate()
                    onSuccess()
                }

                override fun onAuthenticationError(
                    errorCode: Int,
                    errString: CharSequence
                ) {
                    super.onAuthenticationError(errorCode, errString)
                    onError(errString.toString())
                }

                override fun onAuthenticationFailed() {
                    super.onAuthenticationFailed()
                    onError("Authentication failed")
                }
            }
        )

        val promptInfo = BiometricPrompt.PromptInfo.Builder()
            .setTitle("Unlock CleverFerret")
            .setSubtitle("Use your biometric credential")
            .setNegativeButtonText("Use PIN")
            .build()

        biometricPrompt.authenticate(promptInfo)
    }

    /**
     * Authenticate user (unlock app)
     */
    private fun authenticate() {
        _authState.value = AuthenticationState.AUTHENTICATED
        lastActivityTime = System.currentTimeMillis()
        sessionToken = generateSessionToken()
    }

    /**
     * Lock the app
     */
    fun lock() {
        if (_securitySettings.value.lockType != LockType.NONE) {
            _authState.value = AuthenticationState.LOCKED
            sessionToken = null
        }
    }

    /**
     * Check if auto-lock should trigger
     */
    fun checkAutoLock() {
        if (!_securitySettings.value.autoLockEnabled) return
        if (_authState.value != AuthenticationState.AUTHENTICATED) return
        
        val timeSinceLastActivity = System.currentTimeMillis() - lastActivityTime
        if (timeSinceLastActivity >= _securitySettings.value.autoLockTimeout) {
            lock()
        }
    }

    /**
     * Update activity time (call this on user interaction)
     */
    fun updateActivity() {
        lastActivityTime = System.currentTimeMillis()
    }

    /**
     * Handle app going to background
     */
    fun onAppPause() {
```kotlin
fun onAppPause() {
    if (_securitySettings.value.lockOnAppSwitch) {
        // Lock immediately when the app goes to background
        lock()
    }
}
            lastActivityTime = System.currentTimeMillis()
            // Will lock on next checkAutoLock() call
        }
    }

    /**
     * Handle app coming to foreground
     */
    fun onAppResume() {
        checkAutoLock()
    }

    /**
     * Toggle private mode
     */
    fun togglePrivateMode() {
        _isPrivateMode.value = !_isPrivateMode.value
    }

    /**
     * Enable private mode
     */
    fun enablePrivateMode() {
        if (_securitySettings.value.privateModeEnabled) {
            _isPrivateMode.value = true
        }
    }

    /**
     * Disable private mode
     */
    fun disablePrivateMode() {
        _isPrivateMode.value = false
    }

    /**
     * Check if authentication is required for an action
     */
    fun requiresAuthentication(action: String): Boolean {
        return when (action) {
            "settings" -> _securitySettings.value.requireAuthForSettings
            "sync" -> _securitySettings.value.requireAuthForSync
            else -> false
        } && _authState.value != AuthenticationState.AUTHENTICATED
    }

    /**
     * Encrypt sensitive data
     */
    fun encryptData(data: String): String {
        val cipher = getCipher()
        val secretKey = getOrCreateSecretKey()
        cipher.init(Cipher.ENCRYPT_MODE, secretKey)
        
        // Get the IV generated by the cipher
        val iv = cipher.iv
        val encrypted = cipher.doFinal(data.toByteArray())
        
        // Prepend IV to the encrypted data (IV is always 12 bytes for GCM)
        val combined = iv + encrypted
        return android.util.Base64.encodeToString(combined, android.util.Base64.DEFAULT)
    }

    /**
     * Decrypt sensitive data
     */
    fun decryptData(encryptedData: String): String {
        val cipher = getCipher()
        val secretKey = getOrCreateSecretKey()
        
        val decoded = android.util.Base64.decode(encryptedData, android.util.Base64.DEFAULT)
        
        // Extract IV (first 12 bytes) and ciphertext
        val iv = decoded.copyOfRange(0, 12)
        val ciphertext = decoded.copyOfRange(12, decoded.size)
        
        // Initialize cipher with the IV
        val gcmSpec = javax.crypto.spec.GCMParameterSpec(128, iv)
        cipher.init(Cipher.DECRYPT_MODE, secretKey, gcmSpec)
        
        val decrypted = cipher.doFinal(ciphertext)
        return String(decrypted)
    }

    /**
     * Hash PIN for secure storage
     */
    private fun hashPin(pin: String): String {
        return android.util.Base64.encodeToString(
            java.security.MessageDigest.getInstance("SHA-256")
                .digest(pin.toByteArray()),
            android.util.Base64.DEFAULT
        )
    }

    /**
     * Hash pattern for secure storage
     */
    private fun hashPattern(pattern: String): String {
        return android.util.Base64.encodeToString(
            java.security.MessageDigest.getInstance("SHA-256")
                .digest(pattern.toByteArray()),
            android.util.Base64.DEFAULT
        )
    }

    /**
     * Generate session token
     */
    private fun generateSessionToken(): String {
        return java.util.UUID.randomUUID().toString()
    }

    /**
     * Get or create secret key for encryption
     */
    private fun getOrCreateSecretKey(): SecretKey {
        val keyStore = KeyStore.getInstance("AndroidKeyStore")
        keyStore.load(null)

        val alias = "cleverferret_key"
        
        if (!keyStore.containsAlias(alias)) {
            val keyGenerator = KeyGenerator.getInstance(
                KeyProperties.KEY_ALGORITHM_AES,
                "AndroidKeyStore"
            )
            
            val keyGenParameterSpec = KeyGenParameterSpec.Builder(
                alias,
                KeyProperties.PURPOSE_ENCRYPT or KeyProperties.PURPOSE_DECRYPT
            )
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .build()

            keyGenerator.init(keyGenParameterSpec)
            return keyGenerator.generateKey()
        }

        return keyStore.getKey(alias, null) as SecretKey
    }

    /**
     * Get cipher for encryption/decryption
     */
    private fun getCipher(): Cipher {
        return Cipher.getInstance(
            KeyProperties.KEY_ALGORITHM_AES + "/" +
            KeyProperties.BLOCK_MODE_GCM + "/" +
            KeyProperties.ENCRYPTION_PADDING_NONE
        )
    }

    /**
     * Clear all security data (for logout)
     */
    fun clearSecurityData() {
        encryptedPrefs.edit().clear().apply()
        prefs.edit().clear().apply()
        _authState.value = AuthenticationState.LOCKED
        _securitySettings.value = SecuritySettings()
        sessionToken = null
    }

    /**
     * Get failed attempt count
     */
    fun getFailedAttempts(): Int {
        return prefs.getInt("failed_attempts", 0)
    }

    /**
     * Increment failed attempts
     */
    fun incrementFailedAttempts() {
        val attempts = getFailedAttempts() + 1
        prefs.edit().putInt("failed_attempts", attempts).apply()
        
        // Lock for increasing duration after multiple failures
        if (attempts >= 5) {
            val lockDuration = (attempts - 4) * 30000L // 30 seconds per extra attempt
            prefs.edit().putLong("locked_until", System.currentTimeMillis() + lockDuration).apply()
        }
    }

    /**
     * Reset failed attempts
     */
    fun resetFailedAttempts() {
        prefs.edit().putInt("failed_attempts", 0).apply()
        prefs.edit().remove("locked_until").apply()
    }

    /**
     * Check if temporarily locked due to failed attempts
     */
    fun isTemporarilyLocked(): Boolean {
        val lockedUntil = prefs.getLong("locked_until", 0)
        return System.currentTimeMillis() < lockedUntil
    }

    /**
     * Get remaining lock time
     */
    fun getRemainingLockTime(): Long {
        val lockedUntil = prefs.getLong("locked_until", 0)
        val remaining = lockedUntil - System.currentTimeMillis()
        return if (remaining > 0) remaining else 0
    }
}