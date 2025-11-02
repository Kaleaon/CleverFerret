package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.AudioPack
import com.universalmedialibrary.data.local.entity.AudioPackSound
import kotlinx.coroutines.flow.Flow

/**
 * DAO for audio pack operations
 */
@Dao
interface AudioPackDao {
    
    @Query("SELECT * FROM audio_packs WHERE isEnabled = 1 ORDER BY importedAt DESC")
    fun getAllEnabledPacks(): Flow<List<AudioPack>>
    
    @Query("SELECT * FROM audio_packs ORDER BY importedAt DESC")
    fun getAllPacks(): Flow<List<AudioPack>>
    
    @Query("SELECT * FROM audio_packs WHERE id = :packId")
    suspend fun getPackById(packId: Long): AudioPack?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPack(pack: AudioPack): Long
    
    @Update
    suspend fun updatePack(pack: AudioPack)
    
    @Delete
    suspend fun deletePack(pack: AudioPack)
    
    @Query("UPDATE audio_packs SET isEnabled = :enabled WHERE id = :packId")
    suspend fun setPackEnabled(packId: Long, enabled: Boolean)
    
    // AudioPackSound operations
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPackSound(packSound: AudioPackSound)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPackSounds(packSounds: List<AudioPackSound>)
    
    @Query("SELECT soundId FROM audio_pack_sounds WHERE packId = :packId")
    suspend fun getSoundIdsForPack(packId: Long): List<Long>
    
    @Query("DELETE FROM audio_pack_sounds WHERE packId = :packId")
    suspend fun deletePackSounds(packId: Long)
    
    @Query("SELECT COUNT(*) FROM audio_pack_sounds WHERE packId = :packId")
    suspend fun getSoundCountForPack(packId: Long): Int
}
