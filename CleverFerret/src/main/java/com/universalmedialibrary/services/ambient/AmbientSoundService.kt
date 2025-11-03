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
     * Initialize default ambient sounds from SoundLibrary
     * Extensible system - add new themes (sci-fi, medieval, etc.) without modifying this code
     * 
     * To add new themed collections:
     * 1. Create a new object like SciFiSounds with getAllSounds()
     * 2. Register it: SoundLibrary.registerCollection(...)
     * 3. Sounds will automatically be included in initialization
     */
    suspend fun initializeDefaultSounds() {
        val allSounds = SoundLibrary.getAllSounds()
        ambientSoundDao.insertSounds(allSounds)
    }
    
    /**
     * Initialize sounds from a specific collection
     * Useful for adding themed collections on-demand
     */
    suspend fun initializeCollection(collectionId: String) {
        SoundLibrary.getCollection(collectionId)?.let { collection ->
            ambientSoundDao.insertSounds(collection.sounds)
        }
    }
    
    /**
     * Get library statistics
     */
    fun getLibraryStats(): SoundLibrary.LibraryStats {
        return SoundLibrary.getStats()
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
        // Stop all sounds and release MediaPlayer instances
        mediaPlayers.values.forEach { player ->
            try {
                if (player.isPlaying) {
                    player.stop()
                }
                player.release()
            } catch (e: Exception) {
                // Ignore errors during cleanup
            }
        }
        mediaPlayers.clear()
        currentSessionId = null
    }
}
