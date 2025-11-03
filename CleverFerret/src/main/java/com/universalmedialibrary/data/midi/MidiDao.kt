package com.universalmedialibrary.data.midi

import androidx.room.*
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object for MIDI files and tracks
 */
@Dao
interface MidiDao {
    
    // ===== MIDI Files =====
    
    @Query("SELECT * FROM midi_files ORDER BY title ASC")
    fun getAllMidiFiles(): Flow<List<MidiFile>>
    
    @Query("SELECT * FROM midi_files WHERE id = :id")
    suspend fun getMidiFileById(id: Long): MidiFile?
    
    @Query("SELECT * FROM midi_files WHERE file_path = :filePath")
    suspend fun getMidiFileByPath(filePath: String): MidiFile?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMidiFile(midiFile: MidiFile): Long
    
    @Update
    suspend fun updateMidiFile(midiFile: MidiFile)
    
    @Delete
    suspend fun deleteMidiFile(midiFile: MidiFile)
    
    @Query("DELETE FROM midi_files WHERE id = :id")
    suspend fun deleteMidiFileById(id: Long)
    
    @Query("UPDATE midi_files SET play_count = play_count + 1, last_played_at = :timestamp WHERE id = :id")
    suspend fun incrementPlayCount(id: Long, timestamp: Long = System.currentTimeMillis())
    
    @Transaction
    @Query("SELECT * FROM midi_files WHERE id = :id")
    suspend fun getMidiFileWithTracks(id: Long): MidiFileWithTracks?
    
    @Transaction
    @Query("SELECT * FROM midi_files ORDER BY title ASC")
    fun getAllMidiFilesWithTracks(): Flow<List<MidiFileWithTracks>>
    
    @Query("SELECT * FROM midi_files WHERE title LIKE '%' || :query || '%' OR composer LIKE '%' || :query || '%'")
    suspend fun searchMidiFiles(query: String): List<MidiFile>
    
    @Query("SELECT * FROM midi_files WHERE composer = :composer ORDER BY title ASC")
    fun getMidiFilesByComposer(composer: String): Flow<List<MidiFile>>
    
    @Query("SELECT * FROM midi_files ORDER BY last_played_at DESC LIMIT :limit")
    fun getRecentlyPlayedMidiFiles(limit: Int = 10): Flow<List<MidiFile>>
    
    @Query("SELECT * FROM midi_files ORDER BY play_count DESC LIMIT :limit")
    fun getMostPlayedMidiFiles(limit: Int = 10): Flow<List<MidiFile>>
    
    // ===== MIDI Tracks =====
    
    @Query("SELECT * FROM midi_tracks WHERE midi_file_id = :midiFileId ORDER BY track_number ASC")
    suspend fun getTracksForMidiFile(midiFileId: Long): List<MidiTrackInfo>
    
    @Query("SELECT * FROM midi_tracks WHERE midi_file_id = :midiFileId ORDER BY track_number ASC")
    fun getTracksForMidiFileFlow(midiFileId: Long): Flow<List<MidiTrackInfo>>
    
    @Query("SELECT * FROM midi_tracks WHERE id = :id")
    suspend fun getTrackById(id: Long): MidiTrackInfo?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTrack(track: MidiTrackInfo): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertTracks(tracks: List<MidiTrackInfo>)
    
    @Update
    suspend fun updateTrack(track: MidiTrackInfo)
    
    @Delete
    suspend fun deleteTrack(track: MidiTrackInfo)
    
    @Query("DELETE FROM midi_tracks WHERE id = :id")
    suspend fun deleteTrackById(id: Long)
    
    @Query("UPDATE midi_tracks SET is_muted = :isMuted WHERE id = :trackId")
    suspend fun setTrackMuted(trackId: Long, isMuted: Boolean)
    
    @Query("UPDATE midi_tracks SET is_solo = :isSolo WHERE id = :trackId")
    suspend fun setTrackSolo(trackId: Long, isSolo: Boolean)
    
    @Query("UPDATE midi_tracks SET volume = :volume WHERE id = :trackId")
    suspend fun setTrackVolume(trackId: Long, volume: Int)
    
    @Query("UPDATE midi_tracks SET pan = :pan WHERE id = :trackId")
    suspend fun setTrackPan(trackId: Long, pan: Int)
    
    // ===== Soundfonts =====
    
    @Query("SELECT * FROM soundfonts ORDER BY name ASC")
    fun getAllSoundfonts(): Flow<List<Soundfont>>
    
    @Query("SELECT * FROM soundfonts WHERE is_enabled = 1 ORDER BY name ASC")
    fun getEnabledSoundfonts(): Flow<List<Soundfont>>
    
    @Query("SELECT * FROM soundfonts WHERE is_default = 1 LIMIT 1")
    suspend fun getDefaultSoundfont(): Soundfont?
    
    @Query("SELECT * FROM soundfonts WHERE id = :id")
    suspend fun getSoundfontById(id: Long): Soundfont?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSoundfont(soundfont: Soundfont): Long
    
    @Update
    suspend fun updateSoundfont(soundfont: Soundfont)
    
    @Delete
    suspend fun deleteSoundfont(soundfont: Soundfont)
    
    @Query("DELETE FROM soundfonts WHERE id = :id")
    suspend fun deleteSoundfontById(id: Long)
    
    @Query("UPDATE soundfonts SET is_default = 0")
    suspend fun clearDefaultSoundfont()
    
    @Transaction
    suspend fun setDefaultSoundfont(soundfontId: Long) {
        clearDefaultSoundfont()
        val soundfont = getSoundfontById(soundfontId)
        soundfont?.let {
            updateSoundfont(it.copy(isDefault = true))
        }
    }
    
    @Query("UPDATE soundfonts SET is_enabled = :isEnabled WHERE id = :soundfontId")
    suspend fun setSoundfontEnabled(soundfontId: Long, isEnabled: Boolean)
}
