package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientPlaylist
import com.universalmedialibrary.data.local.entity.AmbientReadingSession
import com.universalmedialibrary.data.local.entity.AmbientCategory
import kotlinx.coroutines.flow.Flow

/**
 * DAO for ambient sound operations
 */
@Dao
interface AmbientSoundDao {
    // AmbientSound queries
    @Query("SELECT * FROM ambient_sounds WHERE isEnabled = 1 ORDER BY name ASC")
    fun getAllEnabledSounds(): Flow<List<AmbientSound>>

    @Query("SELECT * FROM ambient_sounds")
    suspend fun getAllSoundsSync(): List<AmbientSound>

    @Query("SELECT * FROM ambient_sounds WHERE id = :id")
    suspend fun getSoundById(id: Long): AmbientSound?

    @Query("SELECT * FROM ambient_sounds WHERE category = :category AND isEnabled = 1")
    fun getSoundsByCategory(category: AmbientCategory): Flow<List<AmbientSound>>

    @Query("SELECT * FROM ambient_sounds WHERE isFavorite = 1 AND isEnabled = 1")
    fun getFavoriteSounds(): Flow<List<AmbientSound>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSound(sound: AmbientSound): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSounds(sounds: List<AmbientSound>)

    @Update
    suspend fun updateSound(sound: AmbientSound)

    @Delete
    suspend fun deleteSound(sound: AmbientSound)

    @Query("UPDATE ambient_sounds SET isFavorite = :isFavorite WHERE id = :id")
    suspend fun toggleFavorite(id: Long, isFavorite: Boolean)

    @Query("UPDATE ambient_sounds SET volume = :volume WHERE id = :id")
    suspend fun updateVolume(id: Long, volume: Float)

    // AmbientPlaylist queries
    @Query("SELECT * FROM ambient_playlists ORDER BY name ASC")
    fun getAllPlaylists(): Flow<List<AmbientPlaylist>>

    @Query("SELECT * FROM ambient_playlists WHERE id = :id")
    suspend fun getPlaylistById(id: Long): AmbientPlaylist?

    @Query("SELECT * FROM ambient_playlists WHERE isActive = 1 LIMIT 1")
    suspend fun getActivePlaylist(): AmbientPlaylist?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPlaylist(playlist: AmbientPlaylist): Long

    @Update
    suspend fun updatePlaylist(playlist: AmbientPlaylist)

    @Delete
    suspend fun deletePlaylist(playlist: AmbientPlaylist)

    @Query("UPDATE ambient_playlists SET isActive = 0")
    suspend fun deactivateAllPlaylists()

    @Query("UPDATE ambient_playlists SET isActive = 1 WHERE id = :id")
    suspend fun activatePlaylist(id: Long)

    // AmbientReadingSession queries
    @Query("SELECT * FROM ambient_reading_sessions WHERE mediaItemId = :mediaItemId ORDER BY startTime DESC LIMIT 1")
    suspend fun getLatestSessionForMedia(mediaItemId: Long): AmbientReadingSession?

    @Query("SELECT * FROM ambient_reading_sessions WHERE endTime IS NULL")
    suspend fun getActiveSessions(): List<AmbientReadingSession>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSession(session: AmbientReadingSession): Long

    @Update
    suspend fun updateSession(session: AmbientReadingSession)

    @Query("UPDATE ambient_reading_sessions SET endTime = :endTime WHERE id = :id")
    suspend fun endSession(id: Long, endTime: Long = System.currentTimeMillis())

    @Query("DELETE FROM ambient_reading_sessions WHERE endTime IS NOT NULL AND endTime < :olderThan")
    suspend fun deleteOldSessions(olderThan: Long)
}
