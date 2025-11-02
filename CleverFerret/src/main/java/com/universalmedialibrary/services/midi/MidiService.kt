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
 * This service provides:
 * - MIDI file parsing and metadata extraction
 * - MIDI playback with track control (mute/solo/volume/pan)
 * - Soundfont management (SF2/SF3/SFZ formats)
 * - MIDI editing capabilities
 * 
 * Based on MuseScore's MIDI capabilities and designed to work with:
 * - Standard MIDI files (SMF format 0, 1, and 2)
 * - General MIDI instrument mapping
 * - Custom soundfonts for realistic playback
 * 
 * Implementation note: This is a foundation for MIDI support.
 * Full playback implementation requires integration with Android's
 * MIDI API or a software synthesizer library.
 */
@Singleton
class MidiService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val midiRepository: MidiRepository
) {
    companion object {
        private const val TAG = "MidiService"
    }
    
    private val _playbackState = MutableStateFlow(MidiPlaybackState())
    val playbackState: StateFlow<MidiPlaybackState> = _playbackState.asStateFlow()
    
    /**
     * Parse a MIDI file and extract metadata
     * Returns a MidiFile object with basic information
     */
    suspend fun parseMidiFile(filePath: String): MidiFile? = withContext(Dispatchers.IO) {
        try {
            val file = File(filePath)
            if (!file.exists() || !file.canRead()) {
                Log.e(TAG, "MIDI file not found or not readable: $filePath")
                return@withContext null
            }
            
            // Basic file information
            val title = file.nameWithoutExtension
            
            // TODO: Implement full MIDI parsing using ktmidi or javax.sound.midi
            // For now, return basic file info
            MidiFile(
                title = title,
                filePath = filePath,
                fileSize = file.length(),
                createdAt = file.lastModified(),
                modifiedAt = file.lastModified()
            )
        } catch (e: Exception) {
            Log.e(TAG, "Error parsing MIDI file: $filePath", e)
            null
        }
    }
    
    /**
     * Import a MIDI file into the library
     */
    suspend fun importMidiFile(filePath: String): Long? = withContext(Dispatchers.IO) {
        try {
            val midiFile = parseMidiFile(filePath)
            if (midiFile != null) {
                val id = midiRepository.insertMidiFile(midiFile)
                Log.d(TAG, "MIDI file imported: ${midiFile.title} (ID: $id)")
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
                updateState(error = "MIDI file not found")
                return
            }
            
            updateState(
                currentMidiFile = midiFile,
                duration = midiFile.durationMs,
                currentTempo = midiFile.tempo,
                error = null
            )
            
            Log.d(TAG, "MIDI file loaded: ${midiFile.title}")
        } catch (e: Exception) {
            Log.e(TAG, "Error loading MIDI file", e)
            updateState(error = "Error loading MIDI file: ${e.message}")
        }
    }
    
    /**
     * Start playback
     * TODO: Implement actual MIDI playback
     */
    fun play() {
        val midiFile = _playbackState.value.currentMidiFile
        if (midiFile == null) {
            updateState(error = "No MIDI file loaded")
            return
        }
        
        // TODO: Implement playback using Android MIDI API or synthesizer
        updateState(isPlaying = true, isPaused = false)
        Log.d(TAG, "Playback started (stub): ${midiFile.title}")
    }
    
    /**
     * Pause playback
     */
    fun pause() {
        updateState(isPlaying = false, isPaused = true)
        Log.d(TAG, "Playback paused")
    }
    
    /**
     * Stop playback
     */
    fun stop() {
        updateState(isPlaying = false, isPaused = false, currentPosition = 0)
        Log.d(TAG, "Playback stopped")
    }
    
    /**
     * Seek to position in milliseconds
     */
    fun seek(positionMs: Long) {
        val duration = _playbackState.value.duration
        val newPosition = positionMs.coerceIn(0, duration)
        updateState(currentPosition = newPosition)
    }
    
    /**
     * Set track muted state
     */
    suspend fun setTrackMuted(trackId: Long, isMuted: Boolean) {
        midiRepository.setTrackMuted(trackId, isMuted)
        
        val currentMuted = _playbackState.value.mutedTracks.toMutableSet()
        val trackNumber = midiRepository.getTrackById(trackId)?.trackNumber
        
        if (trackNumber != null) {
            if (isMuted) {
                currentMuted.add(trackNumber)
            } else {
                currentMuted.remove(trackNumber)
            }
            updateState(mutedTracks = currentMuted)
        }
    }
    
    /**
     * Set track solo state
     */
    suspend fun setTrackSolo(trackId: Long, isSolo: Boolean) {
        midiRepository.setTrackSolo(trackId, isSolo)
        
        val currentSolo = _playbackState.value.soloTracks.toMutableSet()
        val trackNumber = midiRepository.getTrackById(trackId)?.trackNumber
        
        if (trackNumber != null) {
            if (isSolo) {
                currentSolo.add(trackNumber)
            } else {
                currentSolo.remove(trackNumber)
            }
            updateState(soloTracks = currentSolo)
        }
    }
    
    /**
     * Set playback tempo
     */
    fun setTempo(tempo: Int) {
        val newTempo = tempo.coerceIn(40, 240)
        updateState(currentTempo = newTempo)
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
    
    /**
     * Get General MIDI instrument name from program number
     */
    fun getInstrumentName(programNumber: Int): String {
        val instruments = arrayOf(
            // Piano (0-7)
            "Acoustic Grand Piano", "Bright Acoustic Piano", "Electric Grand Piano",
            "Honky-tonk Piano", "Electric Piano 1", "Electric Piano 2", "Harpsichord", "Clavinet",
            // Chromatic Percussion (8-15)
            "Celesta", "Glockenspiel", "Music Box", "Vibraphone", "Marimba", "Xylophone",
            "Tubular Bells", "Dulcimer",
            // Organ (16-23)
            "Drawbar Organ", "Percussive Organ", "Rock Organ", "Church Organ", "Reed Organ",
            "Accordion", "Harmonica", "Tango Accordion",
            // Guitar (24-31)
            "Acoustic Guitar (nylon)", "Acoustic Guitar (steel)", "Electric Guitar (jazz)",
            "Electric Guitar (clean)", "Electric Guitar (muted)", "Overdriven Guitar",
            "Distortion Guitar", "Guitar Harmonics",
            // Bass (32-39)
            "Acoustic Bass", "Electric Bass (finger)", "Electric Bass (pick)", "Fretless Bass",
            "Slap Bass 1", "Slap Bass 2", "Synth Bass 1", "Synth Bass 2",
            // Strings (40-47)
            "Violin", "Viola", "Cello", "Contrabass", "Tremolo Strings", "Pizzicato Strings",
            "Orchestral Harp", "Timpani",
            // Ensemble (48-55)
            "String Ensemble 1", "String Ensemble 2", "Synth Strings 1", "Synth Strings 2",
            "Choir Aahs", "Voice Oohs", "Synth Choir", "Orchestra Hit",
            // Brass (56-63)
            "Trumpet", "Trombone", "Tuba", "Muted Trumpet", "French Horn", "Brass Section",
            "Synth Brass 1", "Synth Brass 2",
            // Reed (64-71)
            "Soprano Sax", "Alto Sax", "Tenor Sax", "Baritone Sax", "Oboe", "English Horn",
            "Bassoon", "Clarinet",
            // Pipe (72-79)
            "Piccolo", "Flute", "Recorder", "Pan Flute", "Blown Bottle", "Shakuhachi",
            "Whistle", "Ocarina",
            // Synth Lead (80-87)
            "Lead 1 (square)", "Lead 2 (sawtooth)", "Lead 3 (calliope)", "Lead 4 (chiff)",
            "Lead 5 (charang)", "Lead 6 (voice)", "Lead 7 (fifths)", "Lead 8 (bass + lead)",
            // Synth Pad (88-95)
            "Pad 1 (new age)", "Pad 2 (warm)", "Pad 3 (polysynth)", "Pad 4 (choir)",
            "Pad 5 (bowed)", "Pad 6 (metallic)", "Pad 7 (halo)", "Pad 8 (sweep)",
            // Synth Effects (96-103)
            "FX 1 (rain)", "FX 2 (soundtrack)", "FX 3 (crystal)", "FX 4 (atmosphere)",
            "FX 5 (brightness)", "FX 6 (goblins)", "FX 7 (echoes)", "FX 8 (sci-fi)",
            // Ethnic (104-111)
            "Sitar", "Banjo", "Shamisen", "Koto", "Kalimba", "Bagpipe", "Fiddle", "Shanai",
            // Percussive (112-119)
            "Tinkle Bell", "Agogo", "Steel Drums", "Woodblock", "Taiko Drum", "Melodic Tom",
            "Synth Drum", "Reverse Cymbal",
            // Sound Effects (120-127)
            "Guitar Fret Noise", "Breath Noise", "Seashore", "Bird Tweet", "Telephone Ring",
            "Helicopter", "Applause", "Gunshot"
        )
        
        return instruments.getOrNull(programNumber.coerceIn(0, 127)) ?: "Unknown"
    }
    
    // ===== Private helper methods =====
    
    private fun updateState(
        isPlaying: Boolean = _playbackState.value.isPlaying,
        isPaused: Boolean = _playbackState.value.isPaused,
        currentPosition: Long = _playbackState.value.currentPosition,
        duration: Long = _playbackState.value.duration,
        currentTempo: Int = _playbackState.value.currentTempo,
        currentMidiFile: MidiFile? = _playbackState.value.currentMidiFile,
        soloTracks: Set<Int> = _playbackState.value.soloTracks,
        mutedTracks: Set<Int> = _playbackState.value.mutedTracks,
        error: String? = null
    ) {
        _playbackState.value = MidiPlaybackState(
            isPlaying = isPlaying,
            isPaused = isPaused,
            currentPosition = currentPosition,
            duration = duration,
            currentTempo = currentTempo,
            currentMidiFile = currentMidiFile,
            soloTracks = soloTracks,
            mutedTracks = mutedTracks,
            error = error
        )
    }
}
