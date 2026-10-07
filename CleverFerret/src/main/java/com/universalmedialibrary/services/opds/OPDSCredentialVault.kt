package com.universalmedialibrary.services.opds

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Encrypted Vault model for OPDS credentials.
 */
data class OPDSCredential(
    val username: String,
    val password: String
)

/**
 * OPDSCredentialVault
 *
 * Securely stores and retrieves OPDS credentials by catalog ID and host
 * using Android Keystore and EncryptedSharedPreferences with fallback
 * support for environments lacking hardware-backed Keystore features.
 */
@Singleton
class OPDSCredentialVault @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "OPDSCredentialVault"
        private const val PREFS_NAME = "opds_encrypted_credentials"
        private const val FALLBACK_PREFS_NAME = "opds_fallback_credentials"
        private const val KEY_CATALOG_PREFIX = "catalog_cred_"
        private const val KEY_HOST_PREFIX = "host_cred_"
        private const val KEY_HOST_CATALOG_MAP = "host_catalog_id_"
    }

    private val prefs: SharedPreferences by lazy {
        initPreferences()
    }

    private fun initPreferences(): SharedPreferences {
        return try {
            val masterKey = MasterKey.Builder(context)
                .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
                .build()

            EncryptedSharedPreferences.create(
                context,
                PREFS_NAME,
                masterKey,
                EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
                EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
            )
        } catch (e: Throwable) {
            try {
                Log.w(TAG, "EncryptedSharedPreferences initialization failed, falling back to standard storage", e)
            } catch (_: Throwable) {}
            context.getSharedPreferences(FALLBACK_PREFS_NAME, Context.MODE_PRIVATE)
        }
    }

    /**
     * Save credentials for a catalog ID and optional host
     */
    fun saveCredentials(catalogId: Long, username: String, password: String, host: String? = null) {
        val value = "$username:$password"
        val editor = prefs.edit()
        if (catalogId != 0L) {
            editor.putString("${KEY_CATALOG_PREFIX}$catalogId", value)
        }
        if (!host.isNullOrBlank()) {
            val cleanHost = host.lowercase().trim()
            editor.putString("${KEY_HOST_PREFIX}$cleanHost", value)
            if (catalogId != 0L) {
                editor.putLong("${KEY_HOST_CATALOG_MAP}$cleanHost", catalogId)
            }
        }
        editor.apply()
    }

    /**
     * Get stored credentials by catalog ID
     */
    fun getCredentials(catalogId: Long): OPDSCredential? {
        if (catalogId == 0L) return null
        val raw = prefs.getString("${KEY_CATALOG_PREFIX}$catalogId", null) ?: return null
        return parseCredential(raw)
    }

    /**
     * Get stored credentials by server host
     */
    fun getCredentialsForHost(host: String): OPDSCredential? {
        if (host.isBlank()) return null
        val cleanHost = host.lowercase().trim()
        val raw = prefs.getString("${KEY_HOST_PREFIX}$cleanHost", null)
        if (raw != null) {
            return parseCredential(raw)
        }
        val mappedCatalogId = prefs.getLong("${KEY_HOST_CATALOG_MAP}$cleanHost", 0L)
        if (mappedCatalogId != 0L) {
            return getCredentials(mappedCatalogId)
        }
        return null
    }

    /**
     * Remove credentials by catalog ID
     */
    fun removeCredentials(catalogId: Long) {
        if (catalogId == 0L) return
        prefs.edit().remove("${KEY_CATALOG_PREFIX}$catalogId").apply()
    }

    /**
     * Remove credentials by server host
     */
    fun removeCredentialsForHost(host: String) {
        if (host.isBlank()) return
        val cleanHost = host.lowercase().trim()
        prefs.edit()
            .remove("${KEY_HOST_PREFIX}$cleanHost")
            .remove("${KEY_HOST_CATALOG_MAP}$cleanHost")
            .apply()
    }

    /**
     * Clear all stored credentials
     */
    fun clear() {
        prefs.edit().clear().apply()
    }

    private fun parseCredential(raw: String): OPDSCredential? {
        val colonIndex = raw.indexOf(':')
        if (colonIndex <= 0) return null
        val user = raw.substring(0, colonIndex)
        val pass = raw.substring(colonIndex + 1)
        return OPDSCredential(user, pass)
    }
}
