package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.AudioWaveform
import kotlinx.coroutines.flow.Flow

@Dao
interface AudioWaveformDao {

    @Query("SELECT * FROM audio_waveforms WHERE itemId = :itemId")
    suspend fun getWaveformByItemId(itemId: Long): AudioWaveform?

    @Query("SELECT * FROM audio_waveforms WHERE itemId = :itemId")
    fun getWaveformByItemIdFlow(itemId: Long): Flow<AudioWaveform?>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertWaveform(waveform: AudioWaveform): Long

    @Update
    suspend fun updateWaveform(waveform: AudioWaveform)

    @Delete
    suspend fun deleteWaveform(waveform: AudioWaveform)

    @Query("DELETE FROM audio_waveforms WHERE itemId = :itemId")
    suspend fun deleteWaveformByItemId(itemId: Long)

    @Query("SELECT COUNT(*) FROM audio_waveforms")
    suspend fun getWaveformCount(): Int

    @Query("DELETE FROM audio_waveforms WHERE generatedAt < :timestamp")
    suspend fun deleteOldWaveforms(timestamp: Long)

    @Query("SELECT EXISTS(SELECT 1 FROM audio_waveforms WHERE itemId = :itemId AND fileHash = :hash)")
    suspend fun waveformExistsForHash(itemId: Long, hash: String): Boolean
}
