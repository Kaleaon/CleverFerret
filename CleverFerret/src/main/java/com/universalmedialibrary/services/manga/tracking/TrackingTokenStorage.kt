package com.universalmedialibrary.services.manga.tracking

import android.content.Context
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKeys
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Secure storage for tracking service authentication tokens
 * 
 * Uses EncryptedSharedPreferences for secure storage of OAuth tokens
 */
@Singleton
class TrackingTokenStorage @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    companion object {
        private const val PREFS_FILE = "manga_tracking_tokens"
        private const val KEY_PREFIX = "token_"
    }
    
    private val json = Json {
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    private val prefs by lazy {
        val masterKeyAlias = MasterKeys.getOrCreate(MasterKeys.AES256_GCM_SPEC)
        EncryptedSharedPreferences.create(
            PREFS_FILE,
            masterKeyAlias,
            context,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }
    
    /**
     * Save a tracking token
     */
    fun saveToken(token: TrackingToken) {
        val key = KEY_PREFIX + token.service.name
        val tokenJson = json.encodeToString(token)
        prefs.edit().putString(key, tokenJson).apply()
    }
    
    /**
     * Get a tracking token for a service
     */
    fun getToken(service: TrackingService): TrackingToken? {
        val key = KEY_PREFIX + service.name
        val tokenJson = prefs.getString(key, null) ?: return null
        return try {
            json.decodeFromString<TrackingToken>(tokenJson)
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Check if a token exists for a service
     */
    fun hasToken(service: TrackingService): Boolean {
        val key = KEY_PREFIX + service.name
        return prefs.contains(key)
    }
    
    /**
     * Clear a token for a service
     */
    fun clearToken(service: TrackingService) {
        val key = KEY_PREFIX + service.name
        prefs.edit().remove(key).apply()
    }
    
    /**
     * Clear all tokens
     */
    fun clearAllTokens() {
        prefs.edit().clear().apply()
    }
    
    /**
     * Get all authenticated services
     */
    fun getAuthenticatedServices(): List<TrackingService> {
        return TrackingService.entries.filter { hasToken(it) }
    }
    
    /**
     * Check if token is expired
     */
    fun isTokenExpired(service: TrackingService): Boolean {
        val token = getToken(service) ?: return true
        return token.expiresAt > 0 && token.expiresAt < System.currentTimeMillis()
    }
}
