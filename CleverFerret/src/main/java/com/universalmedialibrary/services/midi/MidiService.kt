package com.universalmedialibrary.services.midi

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.midi.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified MIDI service for parsing, playback, and management
 * 
 * This service provides complete MIDI functionality:
 * - Full MIDI file parsing with ktmidi
 * - Playback with Media3 ExoPlayer and software synthesizer (JSyn)
 * - Track information and metadata extraction
 * - Playback control (play/pause/stop/seek)
 * - Track control (mute/solo)
 * - Tempo adjustment
 * - Soundfont management (SF2/SF3/SFZ formats)
 * 
 * Based on MuseScore's MIDI capabilities with:
 * - Standard MIDI files (SMF format 0, 1, and 2)
 * - General MIDI instrument mapping (128 instruments)
 * - Real-time playback via Android Jetpack Media3
 */
@Singleton
class MidiService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val midiRepository: MidiRepository,
    private val parserService: MidiParserService,
    private val playbackService: MidiPlaybackService
) {
    companion object {
        private const val TAG = "MidiService"
    }
    
    val playbackState: StateFlow<MidiPlaybackState> = playbackService.playbackState
    
    /**
     * Parse a MIDI file and extract complete metadata
     */
    suspend fun parseMidiFile(filePath: String): MidiFile? = 
        parserService.parseMidiFile(filePath)
    
    /**
     * Extract tracks from MIDI file
     */
    suspend fun extractTracks(filePath: String, midiFileId: Long): List<MidiTrackInfo> =
        parserService.extractTracks(filePath, midiFileId)
    
    /**
     * Extract notes from a track for piano roll/notation display
     */
    suspend fun extractNotes(filePath: String, trackNumber: Int, trackId: Long): List<MidiNote> =
        parserService.extractNotes(filePath, trackNumber, trackId)
    
    /**
     * Import a MIDI file into the library with full parsing
     */
    suspend fun importMidiFile(filePath: String): Long? = withContext(Dispatchers.IO) {
        try {
            val midiFile = parseMidiFile(filePath)
            if (midiFile != null) {
                val id = midiRepository.insertMidiFile(midiFile)
                
                // Extract and store tracks
                val tracks = extractTracks(filePath, id)
                tracks.forEach { track ->
                    midiRepository.insertTrack(track)
                }
                
                Log.d(TAG, "MIDI file imported: ${midiFile.title} with ${tracks.size} tracks (ID: $id)")
                id
            } else {
                null
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error importing MIDI file", e)
            null
        }
    }
    
    /**
     * Load a MIDI file for playback
     */
    suspend fun loadMidiFile(midiFileId: Long) {
        try {
            val midiFile = midiRepository.getMidiFileById(midiFileId)
            if (midiFile == null) {
                Log.e(TAG, "MIDI file not found: $midiFileId")
                return
            }
            
            playbackService.loadMidiFile(midiFile)
            Log.d(TAG, "MIDI file loaded for playback: ${midiFile.title}")
        } catch (e: Exception) {
            Log.e(TAG, "Error loading MIDI file", e)
        }
    }
    
    /**
     * Start playback with Media3 ExoPlayer
     */
    fun play() {
        playbackService.play()
        Log.d(TAG, "Playback started")
    }
    
    /**
     * Pause playback
     */
    fun pause() {
        playbackService.pause()
        Log.d(TAG, "Playback paused")
    }
    
    /**
     * Stop playback
     */
    fun stop() {
        playbackService.stopPlayback()
        Log.d(TAG, "Playback stopped")
    }
    
    /**
     * Seek to position in milliseconds
     */
    fun seek(positionMs: Long) {
        playbackService.seek(positionMs)
    }
    
    /**
     * Set track muted state
     */
    suspend fun setTrackMuted(trackId: Long, isMuted: Boolean) {
        playbackService.setTrackMuted(trackId, isMuted)
    }
    
    /**
     * Set track solo state
     */
    suspend fun setTrackSolo(trackId: Long, isSolo: Boolean) {
        playbackService.setTrackSolo(trackId, isSolo)
    }
    
    /**
     * Set playback tempo
     */
    fun setTempo(tempo: Int) {
        playbackService.setTempo(tempo)
    }
    
    /**
     * Set volume (0.0 to 1.0)
     */
    fun setVolume(volume: Float) {
        playbackService.setVolume(volume)
    }
    
    /**
     * Import a soundfont file (SF2/SF3/SFZ)
     */
    suspend fun importSoundfont(filePath: String, name: String, format: SoundfontFormat): Long? {
        return withContext(Dispatchers.IO) {
            try {
                val file = File(filePath)
                if (!file.exists()) {
                    Log.e(TAG, "Soundfont file not found: $filePath")
                    return@withContext null
                }
                
                val soundfont = Soundfont(
                    name = name,
                    filePath = filePath,
                    format = format,
                    fileSize = file.length()
                )
                
                val id = midiRepository.insertSoundfont(soundfont)
                Log.d(TAG, "Soundfont imported: $name (ID: $id)")
                id
            } catch (e: Exception) {
                Log.e(TAG, "Error importing soundfont", e)
                null
            }
        }
    }
    
    /**
     * Set the default soundfont for playback
     */
    suspend fun setDefaultSoundfont(soundfontId: Long) {
        midiRepository.setDefaultSoundfont(soundfontId)
        Log.d(TAG, "Default soundfont set: $soundfontId")
    }
    
}
