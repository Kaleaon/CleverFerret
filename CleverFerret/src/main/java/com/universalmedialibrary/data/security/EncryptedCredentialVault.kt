package com.universalmedialibrary.data.security

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import dagger.hilt.android.qualifiers.ApplicationContext
import java.security.KeyStore
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Data class for WebDAV stored credentials
 */
data class WebDavVaultCredentials(
    val serverUrl: String,
    val username: String,
    val password: String
)

/**
 * EncryptedCredentialVault
 *
 * Centralized credential storage backed by EncryptedSharedPreferences and Android KeyStore.
 * Manages API keys, WebDAV credentials, Google Drive OAuth tokens, OneDrive OAuth tokens,
 * and Plex server access tokens.
 */
@Singleton
class EncryptedCredentialVault @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "EncryptedCredentialVault"
        private const val PREFS_NAME = "central_encrypted_credential_vault"

        // Keys prefixes
        private const val KEY_API_PREFIX = "api_key_"
        private const val KEY_WEBDAV_URL = "webdav_server_url"
        private const val KEY_WEBDAV_USER = "webdav_username"
        private const val KEY_WEBDAV_PASS = "webdav_password"

        private const val KEY_GDRIVE_ACCOUNT = "gdrive_account_name"
        private const val KEY_GDRIVE_TOKEN = "gdrive_access_token"

        private const val KEY_ONEDRIVE_TOKEN = "onedrive_access_token"

        private const val KEY_PLEX_TOKEN_PREFIX = "plex_token_"
    }

    private val prefs: SharedPreferences by lazy {
        initPreferences()
    }

    @Suppress("TooGenericExceptionCaught")
    private fun initPreferences(): SharedPreferences {
        return try {
            createEncryptedPreferences()
        } catch (e: Exception) {
            Log.w(TAG, "EncryptedSharedPreferences initialization failed. Recovering KeyStore MasterKey...", e)
            try {
                context.deleteSharedPreferences(PREFS_NAME)
                val keyStore = KeyStore.getInstance("AndroidKeyStore")
                keyStore.load(null)
                keyStore.deleteEntry(MasterKey.DEFAULT_MASTER_KEY_ALIAS)
            } catch (cleanEx: Exception) {
                Log.e(TAG, "Error resetting KeyStore MasterKey during recovery", cleanEx)
            }
            createEncryptedPreferences()
        }
    }

    private fun createEncryptedPreferences(): SharedPreferences {
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

    // --- API Key Vault Operations ---

    fun getApiKey(provider: String): String? {
        if (provider.isBlank()) return null
        return prefs.getString("${KEY_API_PREFIX}${provider.lowercase()}", null)
    }

    fun saveApiKey(provider: String, keyValue: String) {
        if (provider.isBlank()) return
        prefs.edit().putString("${KEY_API_PREFIX}${provider.lowercase()}", keyValue).apply()
    }

    fun deleteApiKey(provider: String) {
        if (provider.isBlank()) return
        prefs.edit().remove("${KEY_API_PREFIX}${provider.lowercase()}").apply()
    }

    // --- WebDAV Credentials Vault Operations ---

    fun getWebDavCredentials(): WebDavVaultCredentials? {
        val url = prefs.getString(KEY_WEBDAV_URL, null)
        val user = prefs.getString(KEY_WEBDAV_USER, null)
        val pass = prefs.getString(KEY_WEBDAV_PASS, null)

        return if (!url.isNullOrBlank() && !user.isNullOrBlank() && !pass.isNullOrBlank()) {
            WebDavVaultCredentials(url, user, pass)
        } else {
            null
        }
    }

    fun saveWebDavCredentials(serverUrl: String, username: String, password: String) {
        prefs.edit()
            .putString(KEY_WEBDAV_URL, serverUrl)
            .putString(KEY_WEBDAV_USER, username)
            .putString(KEY_WEBDAV_PASS, password)
            .apply()
    }

    fun clearWebDavCredentials() {
        prefs.edit()
            .remove(KEY_WEBDAV_URL)
            .remove(KEY_WEBDAV_USER)
            .remove(KEY_WEBDAV_PASS)
            .apply()
    }

    // --- Google Drive Vault Operations ---

    fun getGoogleDriveAccountName(): String? {
        return prefs.getString(KEY_GDRIVE_ACCOUNT, null)
    }

    fun saveGoogleDriveAccountName(name: String) {
        prefs.edit().putString(KEY_GDRIVE_ACCOUNT, name).apply()
    }

    fun clearGoogleDriveAccountName() {
        prefs.edit().remove(KEY_GDRIVE_ACCOUNT).apply()
    }

    fun getGoogleDriveAccessToken(): String? {
        return prefs.getString(KEY_GDRIVE_TOKEN, null)
    }

    fun saveGoogleDriveAccessToken(token: String) {
        prefs.edit().putString(KEY_GDRIVE_TOKEN, token).apply()
    }

    fun clearGoogleDriveAccessToken() {
        prefs.edit().remove(KEY_GDRIVE_TOKEN).apply()
    }

    // --- OneDrive Vault Operations ---

    fun getOneDriveAccessToken(): String? {
        return prefs.getString(KEY_ONEDRIVE_TOKEN, null)
    }

    fun saveOneDriveAccessToken(token: String) {
        prefs.edit().putString(KEY_ONEDRIVE_TOKEN, token).apply()
    }

    fun clearOneDriveAccessToken() {
        prefs.edit().remove(KEY_ONEDRIVE_TOKEN).apply()
    }

    // --- Plex Server Token Vault Operations ---

    fun getPlexToken(serverId: Long): String? {
        if (serverId == 0L) return null
        return prefs.getString("${KEY_PLEX_TOKEN_PREFIX}$serverId", null)
    }

    fun savePlexToken(serverId: Long, token: String) {
        if (serverId == 0L) return
        prefs.edit().putString("${KEY_PLEX_TOKEN_PREFIX}$serverId", token).apply()
    }

    fun clearPlexToken(serverId: Long) {
        if (serverId == 0L) return
        prefs.edit().remove("${KEY_PLEX_TOKEN_PREFIX}$serverId").apply()
    }
}
