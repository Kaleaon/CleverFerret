package com.universalmedialibrary.data.settings

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.core.stringSetPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import java.security.MessageDigest
import java.util.Locale
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
        private val KEY_MOVIE_RATING_LIMIT = stringPreferencesKey("rating_limit_movie")
        private val KEY_TV_RATING_LIMIT = stringPreferencesKey("rating_limit_tv")
        private val KEY_GAME_RATING_LIMIT = stringPreferencesKey("rating_limit_game")
        private val KEY_BOOK_RATING_LIMIT = stringPreferencesKey("rating_limit_book")
        private val KEY_BLOCKED_TAGS = stringSetPreferencesKey("blocked_tags")
        private val KEY_BLOCKED_TAG_CATEGORIES = stringSetPreferencesKey("blocked_tag_categories")
        
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

    enum class MovieRatingLevel(val order: Int, private val tokens: Set<String>, val displayName: String) {
        G(0, setOf("G"), "G"),
        PG(1, setOf("PG"), "PG"),
        PG_13(2, setOf("PG-13", "PG13"), "PG-13"),
        R(3, setOf("R"), "R"),
        NC_17(4, setOf("NC-17", "NC17", "X"), "NC-17"),
        UNRESTRICTED(5, emptySet(), "Allow All");

        fun allows(rating: String?): Boolean {
            if (this == UNRESTRICTED) return true
            val level = fromRating(rating) ?: return true
            return level.order <= this.order
        }

        companion object {
            fun fromRating(rating: String?): MovieRatingLevel? {
                if (rating.isNullOrBlank()) return null
                val normalized = rating.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                return values().firstOrNull { entry ->
                    entry != UNRESTRICTED && entry.tokens.any { token ->
                        normalized == token.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                    }
                }
            }

            fun parse(value: String?): MovieRatingLevel =
                value?.let { runCatching { valueOf(it) }.getOrNull() } ?: UNRESTRICTED
        }
    }

    enum class TvRatingLevel(val order: Int, private val tokens: Set<String>, val displayName: String) {
        TV_Y(0, setOf("TV-Y", "TVY"), "TV-Y"),
        TV_G(1, setOf("TV-G", "TVG"), "TV-G"),
        TV_PG(2, setOf("TV-PG", "TVPG"), "TV-PG"),
        TV_14(3, setOf("TV-14", "TV14"), "TV-14"),
        TV_MA(4, setOf("TV-MA", "TVMA"), "TV-MA"),
        UNRESTRICTED(5, emptySet(), "Allow All");

        fun allows(rating: String?): Boolean {
            if (this == UNRESTRICTED) return true
            val level = fromRating(rating) ?: return true
            return level.order <= this.order
        }

        companion object {
            fun fromRating(rating: String?): TvRatingLevel? {
                if (rating.isNullOrBlank()) return null
                val normalized = rating.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                return values().firstOrNull { entry ->
                    entry != UNRESTRICTED && entry.tokens.any { token ->
                        normalized == token.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                    }
                }
            }

            fun parse(value: String?): TvRatingLevel =
                value?.let { runCatching { valueOf(it) }.getOrNull() } ?: UNRESTRICTED
        }
    }

    enum class GameRatingLevel(val order: Int, private val tokens: Set<String>, val displayName: String) {
        EVERYONE(0, setOf("E", "EVERYONE"), "E"),
        EVERYONE_TEN_PLUS(1, setOf("E10+", "EVERYONE 10+", "E 10+"), "E10+"),
        TEEN(2, setOf("T", "TEEN"), "T"),
        MATURE(3, setOf("M", "MATURE", "17+"), "M"),
        ADULTS_ONLY(4, setOf("AO", "ADULTS ONLY", "18+"), "AO"),
        UNRESTRICTED(5, emptySet(), "Allow All");

        fun allows(rating: String?): Boolean {
            if (this == UNRESTRICTED) return true
            val level = fromRating(rating) ?: return true
            return level.order <= this.order
        }

        companion object {
            fun fromRating(rating: String?): GameRatingLevel? {
                if (rating.isNullOrBlank()) return null
                val normalized = rating.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                return values().firstOrNull { entry ->
                    entry != UNRESTRICTED && entry.tokens.any { token ->
                        normalized == token.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                    }
                }
            }

            fun parse(value: String?): GameRatingLevel =
                value?.let { runCatching { valueOf(it) }.getOrNull() } ?: UNRESTRICTED
        }
    }

    enum class BookRatingLevel(val order: Int, private val tokens: Set<String>, val displayName: String) {
        GENERAL(0, setOf("GENERAL", "K", "G"),
            "General"),
        TEEN(1, setOf("TEEN", "T", "YOUNG ADULT"),
            "Teen"),
        MATURE(2, setOf("MATURE", "M", "R"),
            "Mature"),
        EXPLICIT(3, setOf("EXPLICIT", "E", "ADULT", "NC-17", "XXX"),
            "Explicit"),
        UNRESTRICTED(4, emptySet(), "Allow All");

        fun allows(rating: String?): Boolean {
            if (this == UNRESTRICTED) return true
            val level = fromRating(rating) ?: return true
            return level.order <= this.order
        }

        companion object {
            fun fromRating(rating: String?): BookRatingLevel? {
                if (rating.isNullOrBlank()) return null
                val normalized = rating.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                return values().firstOrNull { entry ->
                    entry != UNRESTRICTED && entry.tokens.any { token ->
                        normalized == token.uppercase(Locale.US).replace(Regex("[^A-Z0-9+]"), "")
                    }
                }
            }

            fun parse(value: String?): BookRatingLevel =
                value?.let { runCatching { valueOf(it) }.getOrNull() } ?: UNRESTRICTED
        }
    }

    enum class TagBlockCategory(val displayName: String, private val keywords: Set<String>) {
        SEXUAL_CONTENT("Sexual Content", setOf("sex", "sexual", "erotic", "adult", "nsfw", "porn")),
        VIOLENCE("Violence", setOf("violence", "violent", "bloodshed")),
        GORE("Gore", setOf("gore", "gory", "splatter", "guts")),
        DRUGS("Drugs & Alcohol", setOf("drug", "alcohol", "substance", "narcotic")),
        PROFANITY("Profanity", setOf("profanity", "swear", "explicit language", "curse")),
        HATE_SPEECH("Hate Speech", setOf("hate", "racist", "homophobic", "xenophobic"));

        fun matches(tag: String): Boolean {
            val normalized = tag.lowercase(Locale.US)
            return keywords.any { keyword ->
                val escaped = Regex.escape(keyword.lowercase(Locale.US))
                Regex("\\b$escaped\\b").containsMatchIn(normalized)
            }
        }
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
            allowAdultSources = preferences[KEY_ALLOW_ADULT_SOURCES] ?: false,
            movieRatingLimit = MovieRatingLevel.parse(preferences[KEY_MOVIE_RATING_LIMIT]),
            tvRatingLimit = TvRatingLevel.parse(preferences[KEY_TV_RATING_LIMIT]),
            gameRatingLimit = GameRatingLevel.parse(preferences[KEY_GAME_RATING_LIMIT]),
            bookRatingLimit = BookRatingLevel.parse(preferences[KEY_BOOK_RATING_LIMIT]),
            blockedTagCategories = preferences[KEY_BLOCKED_TAG_CATEGORIES]
                ?.mapNotNull { runCatching { TagBlockCategory.valueOf(it) }.getOrNull() }
                ?.toSet()
                ?: emptySet(),
            blockedTags = loadBlockedTags(preferences)
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

    suspend fun setMovieRatingLimit(limit: MovieRatingLevel) {
        dataStore.edit { preferences ->
            preferences[KEY_MOVIE_RATING_LIMIT] = limit.name
        }
    }

    suspend fun setTvRatingLimit(limit: TvRatingLevel) {
        dataStore.edit { preferences ->
            preferences[KEY_TV_RATING_LIMIT] = limit.name
        }
    }

    suspend fun setGameRatingLimit(limit: GameRatingLevel) {
        dataStore.edit { preferences ->
            preferences[KEY_GAME_RATING_LIMIT] = limit.name
        }
    }

    suspend fun setBookRatingLimit(limit: BookRatingLevel) {
        dataStore.edit { preferences ->
            preferences[KEY_BOOK_RATING_LIMIT] = limit.name
        }
    }

    suspend fun setBlockedTagCategories(categories: Set<TagBlockCategory>) {
        dataStore.edit { preferences ->
            preferences[KEY_BLOCKED_TAG_CATEGORIES] = categories.map { it.name }.toSet()
            if (categories.any { it == TagBlockCategory.SEXUAL_CONTENT }) {
                preferences[KEY_ALLOW_ADULT_SOURCES] = false
            }
        }
    }

    suspend fun addBlockedTag(tag: String) {
        val sanitized = sanitizeTag(tag)
        if (sanitized.isEmpty()) return
        dataStore.edit { preferences ->
            val updated = (preferences[KEY_BLOCKED_TAGS] ?: emptySet()).toMutableSet()
            updated.add(sanitized)
            preferences[KEY_BLOCKED_TAGS] = updated
            if (TagBlockCategory.SEXUAL_CONTENT.matches(sanitized)) {
                preferences[KEY_ALLOW_ADULT_SOURCES] = false
            }
        }
    }

    suspend fun removeBlockedTag(tag: String) {
        val sanitized = sanitizeTag(tag)
        if (sanitized.isEmpty()) return
        dataStore.edit { preferences ->
            val updated = (preferences[KEY_BLOCKED_TAGS] ?: emptySet()).toMutableSet()
            updated.remove(sanitized)
            preferences[KEY_BLOCKED_TAGS] = updated
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
    suspend fun isContentAllowed(
        rating: String?,
        mediaType: String? = null,
        tags: Collection<String> = emptyList()
    ): Boolean {
        val state = parentalControlsState.first()
        return isContentAllowed(state, rating, mediaType, tags)
    }

    fun isContentAllowed(
        state: ParentalControlsState,
        rating: String?,
        mediaType: String? = null,
        tags: Collection<String> = emptyList()
    ): Boolean {
        if (!state.enabled) {
            return true // Parental controls disabled, allow all
        }

        if (tags.any { isTagBlocked(it, state) }) {
            return false
        }

        if (rating == null) {
            return true // No rating, allow by default
        }

        return when {
            isExplicitRating(rating) && state.blockExplicit -> false
            isMatureRating(rating) && state.blockMature -> false
            !isRatingAllowedByMediaType(mediaType, rating, state) -> false
            else -> true // General/Teen content allowed
        }
    }

    /**
     * Check if content should be hidden
     */
    suspend fun shouldHideContent(
        rating: String?,
        mediaType: String? = null,
        tags: Collection<String> = emptyList()
    ): Boolean {
        val state = parentalControlsState.first()
        return shouldHideContent(state, rating, mediaType, tags)
    }

    fun shouldHideContent(
        state: ParentalControlsState,
        rating: String?,
        mediaType: String? = null,
        tags: Collection<String> = emptyList()
    ): Boolean {
        if (!state.enabled || !state.hideAdultContent) {
            return false
        }

        if (tags.any { isTagBlocked(it, state) }) {
            return true
        }

        if (rating == null) {
            return false
        }

        return when {
            isExplicitRating(rating) && state.blockExplicit -> true
            isMatureRating(rating) && state.blockMature -> true
            !isRatingAllowedByMediaType(mediaType, rating, state) -> true
            else -> false
        }
    }

    /**
     * Check if content requires PIN to access
     */
    suspend fun requiresPinForAccess(
        rating: String?,
        mediaType: String? = null,
        tags: Collection<String> = emptyList()
    ): Boolean {
        val state = parentalControlsState.first()
        return requiresPinForAccess(state, rating, mediaType, tags)
    }

    fun requiresPinForAccess(
        state: ParentalControlsState,
        rating: String?,
        mediaType: String? = null,
        tags: Collection<String> = emptyList()
    ): Boolean {
        if (!state.enabled || !state.requirePinForAdult || !state.hasPinSet) {
            return false
        }

        if (tags.any { isTagBlocked(it, state) }) {
            return true
        }

        if (rating == null) {
            return false
        }

        return isExplicitRating(rating) || isMatureRating(rating) || !isRatingAllowedByMediaType(mediaType, rating, state)
    }

    private fun loadBlockedTags(preferences: Preferences): Set<String> {
        return preferences[KEY_BLOCKED_TAGS]
            ?.map { sanitizeTag(it) }
            ?.filter { it.isNotEmpty() }
            ?.toSet()
            ?: emptySet()
    }

    private fun sanitizeTag(tag: String): String = tag.trim().lowercase(Locale.US)

    private fun isTagBlocked(tag: String, state: ParentalControlsState): Boolean {
        val normalized = sanitizeTag(tag)
        if (normalized.isEmpty()) return false
        if (normalized in state.blockedTags) return true
        return state.blockedTagCategories.any { it.matches(normalized) }
    }

    private fun isRatingAllowedByMediaType(
        mediaType: String?,
        rating: String,
        state: ParentalControlsState
    ): Boolean {
        if (mediaType.isNullOrBlank()) return true
        val normalizedType = mediaType.uppercase(Locale.US)
        return when {
            normalizedType.contains("MOVIE") || normalizedType.contains("VIDEO") ->
                state.movieRatingLimit.allows(rating)
            normalizedType.contains("TV") || normalizedType.contains("SERIES") ->
                state.tvRatingLimit.allows(rating)
            normalizedType.contains("GAME") ->
                state.gameRatingLimit.allows(rating)
            normalizedType.contains("BOOK") ||
                normalizedType.contains("AUDIOBOOK") ||
                normalizedType.contains("COMIC") ||
                normalizedType.contains("STORY") ||
                normalizedType.contains("FICTION") ->
                state.bookRatingLimit.allows(rating)
            else -> true
        }
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
    val allowAdultSources: Boolean = false,
    val movieRatingLimit: ParentalControlsSettings.MovieRatingLevel = ParentalControlsSettings.MovieRatingLevel.UNRESTRICTED,
    val tvRatingLimit: ParentalControlsSettings.TvRatingLevel = ParentalControlsSettings.TvRatingLevel.UNRESTRICTED,
    val gameRatingLimit: ParentalControlsSettings.GameRatingLevel = ParentalControlsSettings.GameRatingLevel.UNRESTRICTED,
    val bookRatingLimit: ParentalControlsSettings.BookRatingLevel = ParentalControlsSettings.BookRatingLevel.UNRESTRICTED,
    val blockedTagCategories: Set<ParentalControlsSettings.TagBlockCategory> = emptySet(),
    val blockedTags: Set<String> = emptySet()
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
            
            if ((!blockMature || !enabled) && bookRatingLimit.order >= ParentalControlsSettings.BookRatingLevel.TEEN.order) {
                add("Teen")
                add("Teen And Up")
                add("T")
            }
            
            if ((!blockMature || !enabled) && bookRatingLimit.order >= ParentalControlsSettings.BookRatingLevel.MATURE.order) {
                add("Mature")
                add("M")
            }
            
            if ((!blockExplicit || !enabled) && bookRatingLimit.order >= ParentalControlsSettings.BookRatingLevel.EXPLICIT.order) {
                add("Explicit")
                add("Adult")
            }
        }
}
