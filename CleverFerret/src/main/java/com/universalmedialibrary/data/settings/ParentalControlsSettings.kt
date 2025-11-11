package com.universalmedialibrary.data.settings

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import java.security.MessageDigest
import javax.inject.Inject
import javax.inject.Singleton

private val Context.parentalControlsDataStore: DataStore<Preferences> by preferencesDataStore(
    name = "parental_controls"
)

/**
 * Parental controls settings manager
 * 
 * Features:
 * - Enable/disable mature content filtering
 * - PIN protection for settings and adult content
 * - Hide or lock adult-rated media
 * - Configurable rating filters
 */
@Singleton
class ParentalControlsSettings @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val dataStore = context.parentalControlsDataStore

    companion object {
        // Keys
        private val KEY_ENABLED = booleanPreferencesKey("parental_controls_enabled")
        private val KEY_PIN_HASH = stringPreferencesKey("pin_hash")
        private val KEY_BLOCK_EXPLICIT = booleanPreferencesKey("block_explicit")
        private val KEY_BLOCK_MATURE = booleanPreferencesKey("block_mature")
        private val KEY_HIDE_ADULT_CONTENT = booleanPreferencesKey("hide_adult_content")
        private val KEY_LOCK_SETTINGS = booleanPreferencesKey("lock_settings")
        private val KEY_REQUIRE_PIN_FOR_ADULT = booleanPreferencesKey("require_pin_for_adult")
        private val KEY_ALLOW_ADULT_SOURCES = booleanPreferencesKey("allow_adult_sources")
        
        // Rating categories
        const val RATING_GENERAL = "General"
        const val RATING_TEEN = "Teen"
        const val RATING_MATURE = "Mature"
        const val RATING_EXPLICIT = "Explicit"
        const val RATING_ADULT = "Adult"
        
        // AO3 ratings
        const val RATING_AO3_GENERAL = "General Audiences"
        const val RATING_AO3_TEEN = "Teen And Up"
        const val RATING_AO3_MATURE = "Mature"
        const val RATING_AO3_EXPLICIT = "Explicit"
        
        // FFN ratings
        const val RATING_FFN_K = "K"
        const val RATING_FFN_K_PLUS = "K+"
        const val RATING_FFN_T = "T"
        const val RATING_FFN_M = "M"
    }

    /**
     * Check if parental controls are enabled
     */
    val isEnabled: Flow<Boolean> = dataStore.data.map { preferences ->
        preferences[KEY_ENABLED] ?: false
    }

    /**
     * Check if explicit content is blocked
     */
    val isExplicitBlocked: Flow<Boolean> = dataStore.data.map { preferences ->
        preferences[KEY_BLOCK_EXPLICIT] ?: false
    }

    /**
     * Check if mature content is blocked
     */
    val isMatureBlocked: Flow<Boolean> = dataStore.data.map { preferences ->
        preferences[KEY_BLOCK_MATURE] ?: false
    }

    /**
     * Check if adult content should be hidden
     */
    val hideAdultContent: Flow<Boolean> = dataStore.data.map { preferences ->
        preferences[KEY_HIDE_ADULT_CONTENT] ?: false
    }

    /**
     * Check if settings should be locked
     */
    val lockSettings: Flow<Boolean> = dataStore.data.map { preferences ->
        preferences[KEY_LOCK_SETTINGS] ?: false
    }

    /**
     * Check if PIN is required for adult content
     */
    val requirePinForAdult: Flow<Boolean> = dataStore.data.map { preferences ->
        preferences[KEY_REQUIRE_PIN_FOR_ADULT] ?: false
    }

    /**
     * Complete parental controls state
     */
    val parentalControlsState: Flow<ParentalControlsState> = dataStore.data.map { preferences ->
        ParentalControlsState(
            enabled = preferences[KEY_ENABLED] ?: false,
            hasPinSet = !preferences[KEY_PIN_HASH].isNullOrEmpty(),
            blockExplicit = preferences[KEY_BLOCK_EXPLICIT] ?: false,
            blockMature = preferences[KEY_BLOCK_MATURE] ?: false,
            hideAdultContent = preferences[KEY_HIDE_ADULT_CONTENT] ?: false,
            lockSettings = preferences[KEY_LOCK_SETTINGS] ?: false,
            requirePinForAdult = preferences[KEY_REQUIRE_PIN_FOR_ADULT] ?: false,
            allowAdultSources = preferences[KEY_ALLOW_ADULT_SOURCES] ?: false
        )
    }

    /**
     * Enable parental controls
     */
    suspend fun enable() {
        dataStore.edit { preferences ->
            preferences[KEY_ENABLED] = true
        }
    }

    /**
     * Disable parental controls
     */
    suspend fun disable() {
        dataStore.edit { preferences ->
            preferences[KEY_ENABLED] = false
            preferences[KEY_ALLOW_ADULT_SOURCES] = false
        }
    }

    /**
     * Set PIN (hashed)
     */
    suspend fun setPin(pin: String) {
        val hash = hashPin(pin)
        dataStore.edit { preferences ->
            preferences[KEY_PIN_HASH] = hash
        }
    }

    /**
     * Verify PIN
     */
    suspend fun verifyPin(pin: String): Boolean {
        val hash = hashPin(pin)
        val storedHash = dataStore.data.map { it[KEY_PIN_HASH] }
            .first() // Get first emission
        return hash == storedHash
    }

    /**
     * Check if PIN is set
     */
    suspend fun isPinSet(): Boolean {
        return dataStore.data.map { preferences ->
            !preferences[KEY_PIN_HASH].isNullOrEmpty()
        }.first() // Get first emission
    }

    /**
     * Clear PIN
     */
    suspend fun clearPin() {
        dataStore.edit { preferences ->
            preferences.remove(KEY_PIN_HASH)
        }
    }

    /**
     * Set explicit content blocking
     */
    suspend fun setBlockExplicit(block: Boolean) {
        dataStore.edit { preferences ->
            preferences[KEY_BLOCK_EXPLICIT] = block
            if (block) {
                preferences[KEY_ALLOW_ADULT_SOURCES] = false
            }
        }
    }

    /**
     * Set mature content blocking
     */
    suspend fun setBlockMature(block: Boolean) {
        dataStore.edit { preferences ->
            preferences[KEY_BLOCK_MATURE] = block
        }
    }

    /**
     * Set hide adult content
     */
    suspend fun setHideAdultContent(hide: Boolean) {
        dataStore.edit { preferences ->
            preferences[KEY_HIDE_ADULT_CONTENT] = hide
            if (hide) {
                preferences[KEY_ALLOW_ADULT_SOURCES] = false
            }
        }
    }

    /**
     * Set lock settings
     */
    suspend fun setLockSettings(lock: Boolean) {
        dataStore.edit { preferences ->
            preferences[KEY_LOCK_SETTINGS] = lock
        }
    }

    /**
     * Set require PIN for adult content
     */
    suspend fun setRequirePinForAdult(require: Boolean) {
        dataStore.edit { preferences ->
            preferences[KEY_REQUIRE_PIN_FOR_ADULT] = require
        }
    }

    /**
     * Allow or disallow adult content sources
     */
    suspend fun setAllowAdultSources(allow: Boolean) {
        dataStore.edit { preferences ->
            if (allow) {
                val blockExplicit = preferences[KEY_BLOCK_EXPLICIT] ?: false
                val hideAdult = preferences[KEY_HIDE_ADULT_CONTENT] ?: false
                if (!blockExplicit && !hideAdult) {
                    preferences[KEY_ALLOW_ADULT_SOURCES] = true
                } else {
                    preferences[KEY_ALLOW_ADULT_SOURCES] = false
                }
            } else {
                preferences[KEY_ALLOW_ADULT_SOURCES] = false
            }
        }
    }

    /**
     * Check if adult sources can be used
     */
    suspend fun isAdultSourcesAllowed(): Boolean {
        val state = parentalControlsState.first()
        return state.allowAdultSources && (!state.enabled || (!state.blockExplicit && !state.hideAdultContent))
    }

    /**
     * Get current parental controls state
     */
    suspend fun currentState(): ParentalControlsState {
        return parentalControlsState.first()
    }

    /**
     * Check if content is allowed based on rating
     */
    suspend fun isContentAllowed(rating: String?): Boolean {
        val state = parentalControlsState.first()
        
        if (!state.enabled) {
            return true // Parental controls disabled, allow all
        }

        if (rating == null) {
            return true // No rating, allow by default
        }

        return when {
            isExplicitRating(rating) -> !state.blockExplicit
            isMatureRating(rating) -> !state.blockMature
            else -> true // General/Teen content always allowed
        }
    }

    /**
     * Check if content should be hidden
     */
    suspend fun shouldHideContent(rating: String?): Boolean {
        val state = parentalControlsState.first()
        
        if (!state.enabled || !state.hideAdultContent) {
            return false
        }

        if (rating == null) {
            return false
        }

        return when {
            isExplicitRating(rating) && state.blockExplicit -> true
            isMatureRating(rating) && state.blockMature -> true
            else -> false
        }
    }

    /**
     * Check if content requires PIN to access
     */
    suspend fun requiresPinForAccess(rating: String?): Boolean {
        val state = parentalControlsState.first()
        
        if (!state.enabled || !state.requirePinForAdult || !state.hasPinSet) {
            return false
        }

        if (rating == null) {
            return false
        }

        return isExplicitRating(rating) || isMatureRating(rating)
    }

    /**
     * Check if rating is explicit
     */
    private fun isExplicitRating(rating: String): Boolean {
        val normalized = rating.lowercase()
        return normalized in listOf(
            RATING_EXPLICIT.lowercase(),
            RATING_ADULT.lowercase(),
            RATING_AO3_EXPLICIT.lowercase(),
            "e",
            "nc-17",
            "xxx"
        )
    }

    /**
     * Check if rating is mature
     */
    private fun isMatureRating(rating: String): Boolean {
        val normalized = rating.lowercase()
        return normalized in listOf(
            RATING_MATURE.lowercase(),
            RATING_AO3_MATURE.lowercase(),
            RATING_FFN_M.lowercase(),
            "m",
            "r",
            "18+",
            "nsfw"
        )
    }

    /**
     * Hash PIN using SHA-256
     */
    private fun hashPin(pin: String): String {
        val bytes = pin.toByteArray()
        val md = MessageDigest.getInstance("SHA-256")
        val digest = md.digest(bytes)
        return digest.fold("") { str, it -> str + "%02x".format(it) }
    }

    /**
     * Reset all parental controls
     */
    suspend fun reset() {
        dataStore.edit { preferences ->
            preferences.clear()
        }
    }

    // Extension function to get first value from Flow
    private suspend fun <T> Flow<T>.first(): T {
        var result: T? = null
        this.collect { value ->
            result = value
            return@collect // Stop after first emission
        }
        return result!!
    }
}

/**
 * Parental controls state
 */
data class ParentalControlsState(
    val enabled: Boolean = false,
    val hasPinSet: Boolean = false,
    val blockExplicit: Boolean = false,
    val blockMature: Boolean = false,
    val hideAdultContent: Boolean = false,
    val lockSettings: Boolean = false,
    val requirePinForAdult: Boolean = false,
    val allowAdultSources: Boolean = false
) {
    /**
     * Check if any restrictions are active
     */
    val hasRestrictions: Boolean
        get() = enabled && (blockExplicit || blockMature)
    
    /**
     * Get allowed ratings
     */
    val allowedRatings: List<String>
        get() = buildList {
            add("General")
            add("General Audiences")
            add("K")
            add("K+")
            
            if (!blockMature || !enabled) {
                add("Teen")
                add("Teen And Up")
                add("T")
            }
            
            if (!blockMature || !enabled) {
                add("Mature")
                add("M")
            }
            
            if (!blockExplicit || !enabled) {
                add("Explicit")
                add("Adult")
            }
        }
}
