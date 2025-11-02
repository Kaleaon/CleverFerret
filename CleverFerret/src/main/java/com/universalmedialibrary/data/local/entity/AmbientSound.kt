package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverter
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

/**
 * Entity representing an ambient sound preset
 */
@Entity(tableName = "ambient_sounds")
data class AmbientSound(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val category: AmbientCategory,
    val soundType: AmbientSoundType,
    val audioResourcePath: String? = null, // For local audio files
    val audioUrl: String? = null, // For streaming URLs
    val iconType: String = "nature", // Icon identifier
    val description: String = "",
    val keywords: List<String> = emptyList(), // For context detection
    val volume: Float = 0.5f,
    val isEnabled: Boolean = true,
    val isFavorite: Boolean = false,
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)

/**
 * Categories for ambient sounds
 */
enum class AmbientCategory {
    NATURE,
    URBAN,
    INDOOR,
    WEATHER,
    WATER,
    CUSTOM
}

/**
 * Types of ambient sounds with keywords for context detection
 */
enum class AmbientSoundType(val keywords: List<String>) {
    RAIN(listOf("rain", "raining", "drizzle", "downpour", "storm", "thunder")),
    THUNDER(listOf("thunder", "lightning", "storm", "thunderstorm")),
    OCEAN(listOf("ocean", "sea", "beach", "waves", "shore", "coast")),
    RIVER(listOf("river", "stream", "creek", "brook", "flowing water")),
    FOREST(listOf("forest", "woods", "trees", "woodland", "jungle")),
    BIRDS(listOf("birds", "chirping", "singing birds", "aviary")),
    FIRE(listOf("fire", "fireplace", "campfire", "crackling", "hearth")),
    WIND(listOf("wind", "windy", "breeze", "gust", "gale")),
    CAFE(listOf("cafe", "coffee shop", "restaurant", "bistro", "coffeehouse")),
    LIBRARY(listOf("library", "reading room", "study", "archive")),
    TRAFFIC(listOf("traffic", "street", "road", "highway", "cars")),
    CROWD(listOf("crowd", "people", "busy", "marketplace", "square")),
    TRAIN(listOf("train", "railway", "station", "locomotive")),
    AIRPLANE(listOf("airplane", "plane", "airport", "flying")),
    NIGHT(listOf("night", "evening", "crickets", "nocturnal")),
    CITY(listOf("city", "urban", "downtown", "metropolitan")),
    SNOW(listOf("snow", "snowing", "blizzard", "winter")),
    UNDERWATER(listOf("underwater", "diving", "submerged", "depths")),
    SPACE(listOf("space", "cosmic", "ambient", "ethereal")),
    WHITE_NOISE(listOf("white noise", "static", "background")),
    PINK_NOISE(listOf("pink noise", "brown noise")),
    BROWN_NOISE(listOf("brown noise", "red noise")),
    CUSTOM(emptyList())
}

/**
 * Entity for ambient sound playlists
 */
@Entity(tableName = "ambient_playlists")
data class AmbientPlaylist(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val description: String = "",
    val soundIds: List<Long> = emptyList(), // IDs of AmbientSound entries
    val autoSwitch: Boolean = false, // Auto-switch based on content
    val isActive: Boolean = false,
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis()
)

/**
 * Entity for tracking ambient sound usage with books
 */
@Entity(tableName = "ambient_reading_sessions")
data class AmbientReadingSession(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val mediaItemId: Long, // ID of the book/media being read
    val playlistId: Long? = null,
    val activeSoundIds: List<Long> = emptyList(),
    val startTime: Long = System.currentTimeMillis(),
    val endTime: Long? = null,
    val detectedContext: String? = null, // Context detected from content
    val manualOverride: Boolean = false // User manually selected sounds
)

/**
 * Type converters for Room database
 * Note: String list converters are provided by the main Converters class
 */
class AmbientSoundConverters {
    private val json = Json { ignoreUnknownKeys = true }

    @TypeConverter
    fun fromLongList(value: List<Long>): String {
        return json.encodeToString(value)
    }

    @TypeConverter
    fun toLongList(value: String): List<Long> {
        return json.decodeFromString(value)
    }

    @TypeConverter
    fun fromAmbientCategory(value: AmbientCategory): String {
        return value.name
    }

    @TypeConverter
    fun toAmbientCategory(value: String): AmbientCategory {
        return AmbientCategory.valueOf(value)
    }

    @TypeConverter
    fun fromAmbientSoundType(value: AmbientSoundType): String {
        return value.name
    }

    @TypeConverter
    fun toAmbientSoundType(value: String): AmbientSoundType {
        return AmbientSoundType.valueOf(value)
    }
}
