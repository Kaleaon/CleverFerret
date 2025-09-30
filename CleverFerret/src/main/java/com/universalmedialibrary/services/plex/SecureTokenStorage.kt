package com.universalmedialibrary.services.plex

import android.content.Context
import android.content.SharedPreferences
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Secure storage for Plex authentication tokens using EncryptedSharedPreferences
 */
@Singleton
class SecureTokenStorage @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val PREFS_NAME = "plex_secure_tokens"
        private const val KEY_AUTH_TOKEN = "auth_token"
        private const val KEY_USER_ID = "user_id"
        private const val KEY_USERNAME = "username"
    }
    
    private val masterKey: MasterKey by lazy {
        MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()
    }
    
    private val encryptedPrefs: SharedPreferences by lazy {
        EncryptedSharedPreferences.create(
            context,
            PREFS_NAME,
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }
    
    /**
     * Save Plex authentication token securely
     */
    fun saveAuthToken(token: String, userId: String?, username: String?) {
        encryptedPrefs.edit().apply {
            putString(KEY_AUTH_TOKEN, token)
            userId?.let { putString(KEY_USER_ID, it) }
            username?.let { putString(KEY_USERNAME, it) }
            apply()
        }
    }
    
    /**
     * Get stored authentication token
     */
    fun getAuthToken(): String? {
        return encryptedPrefs.getString(KEY_AUTH_TOKEN, null)
    }
    
    /**
     * Get stored user ID
     */
    fun getUserId(): String? {
        return encryptedPrefs.getString(KEY_USER_ID, null)
    }
    
    /**
     * Get stored username
     */
    fun getUsername(): String? {
        return encryptedPrefs.getString(KEY_USERNAME, null)
    }
    
    /**
     * Check if user is authenticated
     */
    fun isAuthenticated(): Boolean {
        return !getAuthToken().isNullOrEmpty()
    }
    
    /**
     * Clear all stored authentication data
     */
    fun clearAuth() {
        encryptedPrefs.edit().clear().apply()
    }
}
