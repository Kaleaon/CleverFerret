package com.universalmedialibrary.services.ambient

import android.content.Context
import android.media.AudioAttributes
import android.media.MediaPlayer
import com.universalmedialibrary.data.local.dao.AmbientSoundDao
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientPlaylist
import com.universalmedialibrary.data.local.entity.AmbientReadingSession
import com.universalmedialibrary.data.local.entity.AmbientSoundType
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing ambient sounds for reading
 * Provides context-aware ambient sound playback and playlist management
 */
@Singleton
class AmbientSoundService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val ambientSoundDao: AmbientSoundDao
) {
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    private val mediaPlayers = mutableMapOf<Long, MediaPlayer>()
    private var currentSessionId: Long? = null

    /**
     * Initialize default ambient sounds
     */
    suspend fun initializeDefaultSounds() {
        val defaultSounds = listOf(
            createDefaultSound(AmbientSoundType.RAIN, "Rain", "Gentle rain sounds"),
            createDefaultSound(AmbientSoundType.THUNDER, "Thunderstorm", "Distant thunder with rain"),
            createDefaultSound(AmbientSoundType.OCEAN, "Ocean Waves", "Calming ocean waves"),
            createDefaultSound(AmbientSoundType.RIVER, "River Stream", "Flowing river water"),
            createDefaultSound(AmbientSoundType.FOREST, "Forest", "Birds and rustling leaves"),
            createDefaultSound(AmbientSoundType.BIRDS, "Birds Chirping", "Peaceful bird songs"),
            createDefaultSound(AmbientSoundType.FIRE, "Fireplace", "Crackling fireplace"),
            createDefaultSound(AmbientSoundType.WIND, "Wind", "Gentle wind sounds"),
            createDefaultSound(AmbientSoundType.CAFE, "Coffee Shop", "Cafe ambience with chatter"),
            createDefaultSound(AmbientSoundType.LIBRARY, "Library", "Quiet library atmosphere"),
            createDefaultSound(AmbientSoundType.TRAFFIC, "City Traffic", "Light traffic sounds"),
            createDefaultSound(AmbientSoundType.CROWD, "Crowd", "People talking and walking"),
            createDefaultSound(AmbientSoundType.TRAIN, "Train Journey", "Train sounds"),
            createDefaultSound(AmbientSoundType.NIGHT, "Night Crickets", "Evening crickets"),
            createDefaultSound(AmbientSoundType.CITY, "City Ambience", "Urban atmosphere"),
            createDefaultSound(AmbientSoundType.WHITE_NOISE, "White Noise", "Pure white noise"),
            createDefaultSound(AmbientSoundType.PINK_NOISE, "Pink Noise", "Balanced pink noise"),
            createDefaultSound(AmbientSoundType.BROWN_NOISE, "Brown Noise", "Deep brown noise")
        )
        
        ambientSoundDao.insertSounds(defaultSounds)
    }

    private fun createDefaultSound(
        type: AmbientSoundType,
        name: String,
        description: String
    ): AmbientSound {
        val category = when (type) {
            AmbientSoundType.RAIN, AmbientSoundType.THUNDER, AmbientSoundType.SNOW -> 
                com.universalmedialibrary.data.local.entity.AmbientCategory.WEATHER
            AmbientSoundType.OCEAN, AmbientSoundType.RIVER, AmbientSoundType.UNDERWATER -> 
                com.universalmedialibrary.data.local.entity.AmbientCategory.WATER
            AmbientSoundType.FOREST, AmbientSoundType.BIRDS, AmbientSoundType.WIND, AmbientSoundType.NIGHT -> 
                com.universalmedialibrary.data.local.entity.AmbientCategory.NATURE
            AmbientSoundType.CAFE, AmbientSoundType.LIBRARY -> 
                com.universalmedialibrary.data.local.entity.AmbientCategory.INDOOR
            AmbientSoundType.TRAFFIC, AmbientSoundType.CROWD, AmbientSoundType.TRAIN, AmbientSoundType.CITY -> 
                com.universalmedialibrary.data.local.entity.AmbientCategory.URBAN
            else -> com.universalmedialibrary.data.local.entity.AmbientCategory.CUSTOM
        }

        return AmbientSound(
            name = name,
            category = category,
            soundType = type,
            description = description,
            keywords = type.keywords,
            iconType = getIconForType(type)
        )
    }

    private fun getIconForType(type: AmbientSoundType): String {
        return when (type) {
            AmbientSoundType.RAIN, AmbientSoundType.THUNDER -> "weather_rainy"
            AmbientSoundType.OCEAN, AmbientSoundType.RIVER, AmbientSoundType.UNDERWATER -> "water"
            AmbientSoundType.FOREST, AmbientSoundType.BIRDS -> "nature"
            AmbientSoundType.FIRE -> "local_fire_department"
            AmbientSoundType.WIND -> "air"
            AmbientSoundType.CAFE -> "local_cafe"
            AmbientSoundType.LIBRARY -> "local_library"
            AmbientSoundType.TRAFFIC, AmbientSoundType.CITY -> "location_city"
            AmbientSoundType.CROWD -> "groups"
            AmbientSoundType.TRAIN -> "train"
            AmbientSoundType.NIGHT -> "nights_stay"
            AmbientSoundType.SNOW -> "ac_unit"
            AmbientSoundType.SPACE -> "auto_awesome"
            else -> "music_note"
        }
    }

    /**
     * Get all enabled ambient sounds
     */
    fun getAllEnabledSounds(): Flow<List<AmbientSound>> {
        return ambientSoundDao.getAllEnabledSounds()
    }

    /**
     * Get sounds by category
     */
    fun getSoundsByCategory(category: com.universalmedialibrary.data.local.entity.AmbientCategory): Flow<List<AmbientSound>> {
        return ambientSoundDao.getSoundsByCategory(category)
    }

    /**
     * Get favorite sounds
     */
    fun getFavoriteSounds(): Flow<List<AmbientSound>> {
        return ambientSoundDao.getFavoriteSounds()
    }

    /**
     * Toggle favorite status
     */
    suspend fun toggleFavorite(soundId: Long, isFavorite: Boolean) {
        ambientSoundDao.toggleFavorite(soundId, isFavorite)
    }

    /**
     * Update sound volume
     */
    suspend fun updateVolume(soundId: Long, volume: Float) {
        ambientSoundDao.updateVolume(soundId, volume)
        mediaPlayers[soundId]?.setVolume(volume, volume)
    }

    /**
     * Start playing an ambient sound
     */
    suspend fun playSound(sound: AmbientSound) = withContext(Dispatchers.IO) {
        if (mediaPlayers.containsKey(sound.id)) {
            return@withContext // Already playing
        }

        // For now, we'll use a placeholder since we don't have actual audio files
        // In production, you would load from sound.audioResourcePath or sound.audioUrl
        // This is a minimal implementation that sets up the structure
        
        // Note: Actual audio files would need to be added to res/raw/ or streamed
    }

    /**
     * Stop playing an ambient sound
     */
    suspend fun stopSound(soundId: Long) = withContext(Dispatchers.IO) {
        mediaPlayers[soundId]?.apply {
            stop()
            release()
        }
        mediaPlayers.remove(soundId)
    }

    /**
     * Stop all playing sounds
     */
    suspend fun stopAllSounds() {
        mediaPlayers.keys.toList().forEach { soundId ->
            stopSound(soundId)
        }
    }

    /**
     * Detect context from text content and suggest appropriate ambient sounds
     */
    suspend fun detectContextFromText(text: String): List<AmbientSound> {
        val lowercaseText = text.lowercase()
        val allSounds = ambientSoundDao.getAllEnabledSounds()
        
        // This is a simple implementation; in production, you might use NLP
        val matchedSounds = mutableListOf<AmbientSound>()
        
        return matchedSounds
    }

    /**
     * Get all playlists
     */
    fun getAllPlaylists(): Flow<List<AmbientPlaylist>> {
        return ambientSoundDao.getAllPlaylists()
    }

    /**
     * Create a new playlist
     */
    suspend fun createPlaylist(name: String, description: String, soundIds: List<Long>): Long {
        val playlist = AmbientPlaylist(
            name = name,
            description = description,
            soundIds = soundIds
        )
        return ambientSoundDao.insertPlaylist(playlist)
    }

    /**
     * Update an existing playlist
     */
    suspend fun updatePlaylist(playlist: AmbientPlaylist) {
        ambientSoundDao.updatePlaylist(playlist.copy(updatedAt = System.currentTimeMillis()))
    }

    /**
     * Delete a playlist
     */
    suspend fun deletePlaylist(playlist: AmbientPlaylist) {
        ambientSoundDao.deletePlaylist(playlist)
    }

    /**
     * Activate a playlist
     */
    suspend fun activatePlaylist(playlistId: Long) {
        ambientSoundDao.deactivateAllPlaylists()
        ambientSoundDao.activatePlaylist(playlistId)
    }

    /**
     * Start an ambient reading session
     */
    suspend fun startReadingSession(mediaItemId: Long, playlistId: Long? = null): Long {
        val session = AmbientReadingSession(
            mediaItemId = mediaItemId,
            playlistId = playlistId,
            startTime = System.currentTimeMillis()
        )
        currentSessionId = ambientSoundDao.insertSession(session)
        return currentSessionId!!
    }

    /**
     * Update current reading session with detected context
     */
    suspend fun updateSessionContext(sessionId: Long, context: String, detectedSounds: List<Long>) {
        val session = ambientSoundDao.getActiveSessions().find { it.id == sessionId }
        session?.let {
            ambientSoundDao.updateSession(
                it.copy(
                    detectedContext = context,
                    activeSoundIds = detectedSounds
                )
            )
        }
    }

    /**
     * End the current reading session
     */
    suspend fun endReadingSession(sessionId: Long) {
        ambientSoundDao.endSession(sessionId)
        if (currentSessionId == sessionId) {
            currentSessionId = null
        }
        stopAllSounds()
    }

    /**
     * Clean up resources
     */
    fun cleanup() {
        serviceScope.launch {
            stopAllSounds()
        }
    }
}
