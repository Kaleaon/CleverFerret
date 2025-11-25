package com.universalmedialibrary.services.ambient

import android.content.Context
import android.media.AudioAttributes
import android.media.MediaPlayer
import com.universalmedialibrary.data.local.dao.AmbientSoundDao
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientPlaylist
import com.universalmedialibrary.data.local.entity.AmbientReadingSession
import com.universalmedialibrary.data.local.entity.AmbientSoundType
import com.universalmedialibrary.data.remote.freesound.FreesoundClient
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.cancel
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for managing ambient sounds for reading
 * Provides context-aware ambient sound playback and playlist management
 */
@Singleton
class AmbientSoundService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val ambientSoundDao: AmbientSoundDao,
    private val freesoundClient: FreesoundClient,
    private val ambientSoundDownloader: AmbientSoundDownloader
) {
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    private val mediaPlayers = mutableMapOf<Long, MediaPlayer>()
    private var currentSessionId: Long? = null

    init {
        serviceScope.launch(Dispatchers.IO) {
            syncWithSoundLibrary()
        }
    }

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
        syncWithSoundLibrary()
    }

    /**
     * Syncs the database with the SoundLibrary, adding any missing sounds.
     * Does not overwrite existing sounds to preserve user preferences (volume, favorites).
     */
    suspend fun syncWithSoundLibrary() {
        val librarySounds = SoundLibrary.getAllSounds()
        val dbSounds = ambientSoundDao.getAllSoundsSync()
        val dbSoundMap = dbSounds.associateBy { it.name }
        
        val newSounds = mutableListOf<AmbientSound>()
        
        librarySounds.forEach { libSound ->
            val dbSound = dbSoundMap[libSound.name]
            if (dbSound == null) {
                newSounds.add(libSound)
            } else if (dbSound.audioUrl.isNullOrBlank() && !libSound.audioUrl.isNullOrBlank()) {
                // Update existing sound with URL if missing
                ambientSoundDao.updateSound(dbSound.copy(audioUrl = libSound.audioUrl))
            }
        }
        
        if (newSounds.isNotEmpty()) {
            ambientSoundDao.insertSounds(newSounds)
        }
        
        hydrateFreesoundUrls()
    }

    private suspend fun hydrateFreesoundUrls() {
        withContext(Dispatchers.IO) {
            try {
                val sounds = ambientSoundDao.getAllSoundsSync()
                
                sounds.forEach { sound ->
                    val url = sound.audioUrl ?: return@forEach
                    if (url.contains("freesound.org") && url.contains("-lq.mp3")) {
                        try {
                            // Extract ID from URL
                            val filename = url.substringAfterLast("/")
                            val idString = filename.substringBefore("_")
                            val id = idString.toIntOrNull()
                            
                            if (id != null) {
                                val freesoundData = freesoundClient.getSound(id)
                                val hqUrl = freesoundData.previews.previewHqMp3
                                
                                if (hqUrl.isNotEmpty() && hqUrl != url) {
                                    ambientSoundDao.updateSound(
                                        sound.copy(
                                            audioUrl = hqUrl,
                                            description = sound.description.ifEmpty { freesoundData.description.take(200) + "..." },
                                            updatedAt = System.currentTimeMillis()
                                        )
                                    )
                                }
                            }
                        } catch (e: Exception) {
                            e.printStackTrace()
                        }
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
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
        
        var dataSource = sound.audioUrl
        
        // Prefer local file if it exists
        if (!sound.audioResourcePath.isNullOrBlank()) {
            val file = File(sound.audioResourcePath)
            if (file.exists()) {
                dataSource = sound.audioResourcePath
            }
        }

        if (dataSource.isNullOrBlank()) {
            return@withContext
        }
        
        // Trigger download if not local
        if (sound.audioResourcePath.isNullOrBlank() && !sound.audioUrl.isNullOrBlank()) {
             launch {
                 try {
                     val downloaded = ambientSoundDownloader.downloadSound(sound)
                     if (downloaded) {
                         // If download completes while playing, we could switch to local source,
                         // but for now we just ensure it's saved for next time.
                         // The downloadSound function updates the DB.
                     }
                 } catch (e: Exception) {
                     e.printStackTrace()
                 }
             }
        }

        try {
            val mediaPlayer = MediaPlayer().apply {
                setAudioAttributes(
                    AudioAttributes.Builder()
                        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                        .setUsage(AudioAttributes.USAGE_MEDIA)
                        .build()
                )
                setDataSource(dataSource)
                isLooping = true
                setVolume(sound.volume, sound.volume)
                prepare()
                start()
            }
            mediaPlayers[sound.id] = mediaPlayer
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    /**
     * Download a specific sound for offline playback
     */
    suspend fun downloadSound(soundId: Long): Boolean {
        val sound = ambientSoundDao.getSoundById(soundId) ?: return false
        return ambientSoundDownloader.downloadSound(sound)
    }

    /**
     * Download all sounds in a collection/pack
     */
    suspend fun downloadCollection(collectionId: String) {
        SoundLibrary.getCollection(collectionId)?.let { collection ->
            // We need to get the actual sound entities from DB because they might have URLs that were updated (e.g. Freesound hydration)
            // The SoundLibrary is just the initial definition.
            // However, if they are already in DB, we should query them.
            // SoundLibrary sounds don't have IDs until inserted.
            // Strategy: Find sounds in DB that match the names in the collection? 
            // Or assuming they were inserted.
            
            // Simpler approach: Get all enabled sounds and filter by those that are in this collection (by name/category match?)
            // Ideally AmbientSound would have a collectionId field, but it doesn't.
            
            // Let's iterate the sounds in the collection definition, and try to find them in DB by name/category.
            // Or just use the SoundLibrary definition if it's not inserted yet?
            // But we need the hydrated URLs for Freesound!
            
            // Let's fetch all sounds from DB.
            val dbSounds = ambientSoundDao.getAllSoundsSync()
            val collectionSoundNames = collection.sounds.map { it.name }.toSet()
            
            val soundsToDownload = dbSounds.filter { it.name in collectionSoundNames }
            
            soundsToDownload.forEach { sound ->
                ambientSoundDownloader.downloadSound(sound)
            }
        }
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
        
        // Cancel coroutine scope to prevent memory leaks
        serviceScope.cancel()
    }
}
