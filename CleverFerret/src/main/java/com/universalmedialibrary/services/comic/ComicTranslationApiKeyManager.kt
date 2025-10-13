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
 * Manages user-provided API keys for Gemini AI and Google Cloud Translation
 * using Android's EncryptedSharedPreferences for secure storage.
 * 
 * Features:
 * - Encrypted storage using Android Keystore
 * - Simple get/set operations
 * - Validation checks
 * - Clear/reset functionality
 * 
 * Usage:
 * 1. User enters API keys in settings
 * 2. Keys are encrypted and stored
 * 3. Repository retrieves keys when needed
 * 4. Translation features disabled if keys not configured
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
        private const val KEY_TRANSLATE_API = "translate_api_key"
    }

    /**
     * Store the Gemini API key for later retrieval.
     *
     * @param key The Gemini API key to store.
     */
    fun setGeminiApiKey(key: String) {
        encryptedPrefs.edit()
            .putString(KEY_GEMINI_API, key)
            .apply()
    }

    /**
     * Retrieves the stored Gemini API key.
     *
     * @return The stored Gemini API key, or null if none is configured.
     */
    fun getGeminiApiKey(): String? {
        return encryptedPrefs.getString(KEY_GEMINI_API, null)
    }

    /**
     * Stores the Google Cloud Translation API key in encrypted, device-backed preferences.
     *
     * @param key The translation API key to save.
     */
    fun setTranslateApiKey(key: String) {
        encryptedPrefs.edit()
            .putString(KEY_TRANSLATE_API, key)
            .apply()
    }

    /**
     * Retrieve the stored Google Cloud Translation API key.
     *
     * @return The stored Google Cloud Translation API key, or `null` if not set.
     */
    fun getTranslateApiKey(): String? {
        return encryptedPrefs.getString(KEY_TRANSLATE_API, null)
    }

    /**
     * Determines whether both the Gemini and Google Translate API keys are configured.
     *
     * @return `true` if both keys are present and not blank, `false` otherwise.
     */
    fun areKeysConfigured(): Boolean {
        return !getGeminiApiKey().isNullOrBlank() && 
               !getTranslateApiKey().isNullOrBlank()
    }

    /**
     * Check if Gemini API key is configured
     */
    fun isGeminiKeyConfigured(): Boolean {
        return !getGeminiApiKey().isNullOrBlank()
    }

    /**
     * Determines whether a Google Cloud Translation API key has been stored.
     *
     * @return `true` if the stored translation API key is present and not blank, `false` otherwise.
     */
    fun isTranslateKeyConfigured(): Boolean {
        return !getTranslateApiKey().isNullOrBlank()
    }

    /**
     * Clear all API keys (e.g., for logout or reset)
     */
    fun clearKeys() {
        encryptedPrefs.edit()
            .remove(KEY_GEMINI_API)
            .remove(KEY_TRANSLATE_API)
            .apply()
    }

    /**
     * Checks whether an API key looks valid based on simple heuristics.
     *
     * @param key The API key string to validate.
     * @return `true` if the key is not blank and longer than 10 characters, `false` otherwise.
     */
    fun validateKeyFormat(key: String): Boolean {
        return key.isNotBlank() && key.length > 10
    }
}