package com.universalmedialibrary.data.midi

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for MIDI data operations
 * Provides a clean API for working with MIDI files, tracks, and soundfonts
 */
@Singleton
class MidiRepository @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val database = MidiDatabase.getInstance(context)
    private val dao = database.midiDao()
    
    // ===== MIDI Files =====
    
    fun getAllMidiFiles(): Flow<List<MidiFile>> = dao.getAllMidiFiles()
    
    fun getAllMidiFilesWithTracks(): Flow<List<MidiFileWithTracks>> = 
        dao.getAllMidiFilesWithTracks()
    
    suspend fun getMidiFileById(id: Long): MidiFile? = withContext(Dispatchers.IO) {
        dao.getMidiFileById(id)
    }
    
    suspend fun getMidiFileByPath(filePath: String): MidiFile? = withContext(Dispatchers.IO) {
        dao.getMidiFileByPath(filePath)
    }
    
    suspend fun getMidiFileWithTracks(id: Long): MidiFileWithTracks? = 
        withContext(Dispatchers.IO) {
            dao.getMidiFileWithTracks(id)
        }
    
    suspend fun insertMidiFile(midiFile: MidiFile): Long = withContext(Dispatchers.IO) {
        dao.insertMidiFile(midiFile)
    }
    
    suspend fun updateMidiFile(midiFile: MidiFile) = withContext(Dispatchers.IO) {
        dao.updateMidiFile(midiFile)
    }
    
    suspend fun deleteMidiFile(midiFile: MidiFile) = withContext(Dispatchers.IO) {
        dao.deleteMidiFile(midiFile)
    }
    
    suspend fun deleteMidiFileById(id: Long) = withContext(Dispatchers.IO) {
        dao.deleteMidiFileById(id)
    }
    
    suspend fun incrementPlayCount(id: Long) = withContext(Dispatchers.IO) {
        dao.incrementPlayCount(id)
    }
    
    suspend fun searchMidiFiles(query: String): List<MidiFile> = withContext(Dispatchers.IO) {
        dao.searchMidiFiles(query)
    }
    
    fun getMidiFilesByComposer(composer: String): Flow<List<MidiFile>> = 
        dao.getMidiFilesByComposer(composer)
    
    fun getRecentlyPlayedMidiFiles(limit: Int = 10): Flow<List<MidiFile>> = 
        dao.getRecentlyPlayedMidiFiles(limit)
    
    fun getMostPlayedMidiFiles(limit: Int = 10): Flow<List<MidiFile>> = 
        dao.getMostPlayedMidiFiles(limit)
    
    // ===== MIDI Tracks =====
    
    suspend fun getTracksForMidiFile(midiFileId: Long): List<MidiTrackInfo> = 
        withContext(Dispatchers.IO) {
            dao.getTracksForMidiFile(midiFileId)
        }
    
    fun getTracksForMidiFileFlow(midiFileId: Long): Flow<List<MidiTrackInfo>> = 
        dao.getTracksForMidiFileFlow(midiFileId)
    
    suspend fun getTrackById(id: Long): MidiTrackInfo? = withContext(Dispatchers.IO) {
        dao.getTrackById(id)
    }
    
    suspend fun insertTrack(track: MidiTrackInfo): Long = withContext(Dispatchers.IO) {
        dao.insertTrack(track)
    }
    
    suspend fun insertTracks(tracks: List<MidiTrackInfo>) = withContext(Dispatchers.IO) {
        dao.insertTracks(tracks)
    }
    
    suspend fun updateTrack(track: MidiTrackInfo) = withContext(Dispatchers.IO) {
        dao.updateTrack(track)
    }
    
    suspend fun deleteTrack(track: MidiTrackInfo) = withContext(Dispatchers.IO) {
        dao.deleteTrack(track)
    }
    
    suspend fun setTrackMuted(trackId: Long, isMuted: Boolean) = withContext(Dispatchers.IO) {
        dao.setTrackMuted(trackId, isMuted)
    }
    
    suspend fun setTrackSolo(trackId: Long, isSolo: Boolean) = withContext(Dispatchers.IO) {
        dao.setTrackSolo(trackId, isSolo)
    }
    
    suspend fun setTrackVolume(trackId: Long, volume: Int) = withContext(Dispatchers.IO) {
        dao.setTrackVolume(trackId, volume)
    }
    
    suspend fun setTrackPan(trackId: Long, pan: Int) = withContext(Dispatchers.IO) {
        dao.setTrackPan(trackId, pan)
    }
    
    // ===== Soundfonts =====
    
    fun getAllSoundfonts(): Flow<List<Soundfont>> = dao.getAllSoundfonts()
    
    fun getEnabledSoundfonts(): Flow<List<Soundfont>> = dao.getEnabledSoundfonts()
    
    suspend fun getDefaultSoundfont(): Soundfont? = withContext(Dispatchers.IO) {
        dao.getDefaultSoundfont()
    }
    
    suspend fun getSoundfontById(id: Long): Soundfont? = withContext(Dispatchers.IO) {
        dao.getSoundfontById(id)
    }
    
    suspend fun insertSoundfont(soundfont: Soundfont): Long = withContext(Dispatchers.IO) {
        dao.insertSoundfont(soundfont)
    }
    
    suspend fun updateSoundfont(soundfont: Soundfont) = withContext(Dispatchers.IO) {
        dao.updateSoundfont(soundfont)
    }
    
    suspend fun deleteSoundfont(soundfont: Soundfont) = withContext(Dispatchers.IO) {
        dao.deleteSoundfont(soundfont)
    }
    
    suspend fun setDefaultSoundfont(soundfontId: Long) = withContext(Dispatchers.IO) {
        dao.setDefaultSoundfont(soundfontId)
    }
    
    suspend fun setSoundfontEnabled(soundfontId: Long, isEnabled: Boolean) = 
        withContext(Dispatchers.IO) {
            dao.setSoundfontEnabled(soundfontId, isEnabled)
        }
}
