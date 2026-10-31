package com.universalmedialibrary.data.local

import android.content.Context
import android.util.Base64
import android.util.Log
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import java.security.KeyStore
import java.security.SecureRandom

/**
 * Manages the secure generation and retrieval of the 256-bit passphrase used by SQLCipher
 * to encrypt the Room database. The passphrase is held in hardware-backed Android KeyStore
 * via EncryptedSharedPreferences.
 */
class DatabaseKeyManager(private val context: Context) {

    companion object {
        private const val TAG = "DatabaseKeyManager"
        private const val PREFS_NAME = "sqlcipher_key_vault"
        private const val KEY_PASSPHRASE = "db_passphrase_256"
        private const val PASSPHRASE_BYTE_COUNT = 32 // 256 bits
    }

    /**
     * Get or create the 256-bit database passphrase as a ByteArray.
     */
    fun getPassphrase(): ByteArray {
        val prefs = getEncryptedPreferences()
        var encoded = prefs.getString(KEY_PASSPHRASE, null)
        if (encoded.isNullOrBlank()) {
            val randomBytes = ByteArray(PASSPHRASE_BYTE_COUNT)
            SecureRandom().nextBytes(randomBytes)
            encoded = Base64.encodeToString(randomBytes, Base64.NO_WRAP)
            prefs.edit().putString(KEY_PASSPHRASE, encoded).apply()
        }
        return Base64.decode(encoded, Base64.NO_WRAP)
    }

    @Suppress("TooGenericExceptionCaught")
    private fun getEncryptedPreferences() = try {
        createPreferences()
    } catch (e: Exception) {
        Log.w(TAG, "Failed to load encrypted key vault preferences. Attempting KeyStore recovery.", e)
        try {
            context.deleteSharedPreferences(PREFS_NAME)
            val keyStore = KeyStore.getInstance("AndroidKeyStore")
            keyStore.load(null)
            keyStore.deleteEntry(MasterKey.DEFAULT_MASTER_KEY_ALIAS)
        } catch (cleanEx: Exception) {
            Log.e(TAG, "Error cleaning KeyStore entry during recovery", cleanEx)
        }
        createPreferences()
    }

    private fun createPreferences(): android.content.SharedPreferences {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()

        return EncryptedSharedPreferences.create(
            context,
            PREFS_NAME,
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }
}
