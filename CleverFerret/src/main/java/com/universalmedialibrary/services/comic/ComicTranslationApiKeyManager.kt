package com.universalmedialibrary.services.comic

import android.content.Context
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Secure API Key Manager for Comic Translation
 * 
 * Manages user-provided API key for Gemini AI using Android's 
 * EncryptedSharedPreferences for secure storage.
 * 
 * Note: Translation is now handled by on-device ML Kit, which doesn't require API keys.
 * Only Gemini AI key is needed for visual analysis.
 * 
 * Features:
 * - Encrypted storage using Android Keystore
 * - Simple get/set operations
 * - Validation checks
 * - Clear/reset functionality
 * 
 * Usage:
 * 1. User enters Gemini API key in settings
 * 2. Key is encrypted and stored
 * 3. Repository retrieves key when needed
 * 4. Translation features disabled if key not configured
 */
@Singleton
class ComicTranslationApiKeyManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val masterKey = MasterKey.Builder(context)
        .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
        .build()

    private val encryptedPrefs = EncryptedSharedPreferences.create(
        context,
        PREFS_NAME,
        masterKey,
        EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
        EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
    )

    companion object {
        private const val PREFS_NAME = "comic_translation_api_keys"
        private const val KEY_GEMINI_API = "gemini_api_key"
    }

    /**
     * Save Gemini API key
     */
    fun setGeminiApiKey(key: String) {
        encryptedPrefs.edit()
            .putString(KEY_GEMINI_API, key)
            .apply()
    }

    /**
     * Get Gemini API key
     * @return API key or null if not set
     */
    fun getGeminiApiKey(): String? {
        return encryptedPrefs.getString(KEY_GEMINI_API, null)
    }

    /**
     * Check if Gemini API key is configured
     */
    fun areKeysConfigured(): Boolean {
        return !getGeminiApiKey().isNullOrBlank()
    }

    /**
     * Check if Gemini API key is configured
     */
    fun isGeminiKeyConfigured(): Boolean {
        return !getGeminiApiKey().isNullOrBlank()
    }

    /**
     * Clear all API keys (e.g., for logout or reset)
     */
    fun clearKeys() {
        encryptedPrefs.edit()
            .remove(KEY_GEMINI_API)
            .apply()
    }

    /**
     * Validate API key format (basic validation)
     * Note: This is a basic check. Actual validation requires API calls.
     */
    fun validateKeyFormat(key: String): Boolean {
        return key.isNotBlank() && key.length > 10
    }
}
