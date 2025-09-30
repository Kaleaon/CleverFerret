package com.universalmedialibrary.data.local.dao

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import com.universalmedialibrary.data.local.entity.PlaybackSession

/**
 * DAO for PlaybackSession operations
 *
 * Manages playback session state persistence and provides
 * reactive streams for session state changes.
 */
@Dao
interface PlaybackSessionDao {

    // Basic CRUD operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSession(session: PlaybackSession): Long

    @Update
    suspend fun updateSession(session: PlaybackSession)

    @Delete
    suspend fun deleteSession(session: PlaybackSession)

    @Query("DELETE FROM playback_sessions WHERE sessionId = :sessionId")
    suspend fun deleteSessionById(sessionId: Long)

    // Query operations
    @Query("SELECT * FROM playback_sessions WHERE sessionId = :sessionId")
    suspend fun getSessionById(sessionId: Long): PlaybackSession?

    @Query("SELECT * FROM playback_sessions WHERE sessionName = :sessionName")
    suspend fun getSessionByName(sessionName: String): PlaybackSession?

    @Query("SELECT * FROM playback_sessions WHERE isActive = 1 LIMIT 1")
    suspend fun getActiveSession(): PlaybackSession?

    @Query("SELECT * FROM playback_sessions ORDER BY lastUsed DESC")
    fun getAllSessions(): Flow<List<PlaybackSession>>

    @Query("SELECT * FROM playback_sessions WHERE sessionType = :sessionType ORDER BY lastUsed DESC")
    fun getSessionsByType(sessionType: String): Flow<List<PlaybackSession>>

    // Session management operations
    @Query("UPDATE playback_sessions SET isActive = 0")
    suspend fun deactivateAllSessions()

    @Query("UPDATE playback_sessions SET isActive = 1 WHERE sessionId = :sessionId")
    suspend fun activateSession(sessionId: Long)

    @Query("UPDATE playback_sessions SET lastUsed = :timestamp WHERE sessionId = :sessionId")
    suspend fun updateLastUsed(sessionId: Long, timestamp: Long = System.currentTimeMillis())

    // Playback state updates
    @Query("UPDATE playback_sessions SET isPlaying = :isPlaying, isPaused = :isPaused WHERE sessionId = :sessionId")
    suspend fun updatePlaybackState(sessionId: Long, isPlaying: Boolean, isPaused: Boolean)

    @Query("UPDATE playback_sessions SET currentPositionMs = :positionMs WHERE sessionId = :sessionId")
    suspend fun updateCurrentPosition(sessionId: Long, positionMs: Long)

    @Query("UPDATE playback_sessions SET playbackSpeed = :speed WHERE sessionId = :sessionId")
    suspend fun updatePlaybackSpeed(sessionId: Long, speed: Float)

    @Query("UPDATE playback_sessions SET volume = :volume WHERE sessionId = :sessionId")
    suspend fun updateVolume(sessionId: Long, volume: Float)

    @Query("UPDATE playback_sessions SET activeQueueId = :queueId WHERE sessionId = :sessionId")
    suspend fun updateActiveQueue(sessionId: Long, queueId: Long?)

    @Query("UPDATE playback_sessions SET currentQueueItemId = :queueItemId WHERE sessionId = :sessionId")
    suspend fun updateCurrentQueueItem(sessionId: Long, queueItemId: Long?)

    // Audio settings updates
    @Query("UPDATE playback_sessions SET audioFocusGained = :hasFocus WHERE sessionId = :sessionId")
    suspend fun updateAudioFocus(sessionId: Long, hasFocus: Boolean)

    @Query("UPDATE playback_sessions SET skipSilenceEnabled = :enabled WHERE sessionId = :sessionId")
    suspend fun updateSkipSilence(sessionId: Long, enabled: Boolean)

    @Query("UPDATE playback_sessions SET crossfadeEnabled = :enabled, crossfadeDurationMs = :durationMs WHERE sessionId = :sessionId")
    suspend fun updateCrossfade(sessionId: Long, enabled: Boolean, durationMs: Int)

    @Query("UPDATE playback_sessions SET equalizerPreset = :preset WHERE sessionId = :sessionId")
    suspend fun updateEqualizerPreset(sessionId: Long, preset: String?)

    // Sleep timer operations
    @Query("UPDATE playback_sessions SET sleepTimerEndTime = :endTime, sleepTimerPauseOnComplete = :pauseOnComplete WHERE sessionId = :sessionId")
    suspend fun updateSleepTimer(sessionId: Long, endTime: Long?, pauseOnComplete: Boolean)

    @Query("UPDATE playback_sessions SET sleepTimerEndTime = NULL WHERE sessionId = :sessionId")
    suspend fun clearSleepTimer(sessionId: Long)

    // Session statistics
    @Query("UPDATE playback_sessions SET sessionDurationMs = sessionDurationMs + :additionalMs WHERE sessionId = :sessionId")
    suspend fun addSessionDuration(sessionId: Long, additionalMs: Long)

    // Platform integration
    @Query("UPDATE playback_sessions SET mediaSessionToken = :token WHERE sessionId = :sessionId")
    suspend fun updateMediaSessionToken(sessionId: Long, token: String?)

    @Query("UPDATE playback_sessions SET notificationId = :notificationId WHERE sessionId = :sessionId")
    suspend fun updateNotificationId(sessionId: Long, notificationId: Int?)

    // Reactive streams for UI
    @Query("SELECT * FROM playback_sessions WHERE isActive = 1 LIMIT 1")
    fun observeActiveSession(): Flow<PlaybackSession?>

    @Query("SELECT * FROM playback_sessions WHERE sessionName = :sessionName")
    fun observeSessionByName(sessionName: String): Flow<PlaybackSession?>

    // Session cleanup
    @Query("DELETE FROM playback_sessions WHERE lastUsed < :cutoffTime AND sessionName != 'DEFAULT'")
    suspend fun cleanupOldSessions(cutoffTime: Long)

    // Utility queries
    @Query("SELECT COUNT(*) FROM playback_sessions WHERE isActive = 1")
    suspend fun getActiveSessionCount(): Int

    @Query("SELECT sessionName FROM playback_sessions WHERE isActive = 1")
    suspend fun getActiveSessionName(): String?
}
