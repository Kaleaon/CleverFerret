package com.universalmedialibrary.data.midi

import androidx.room.*

/**
 * MIDI file entity for storing MIDI compositions
 * Inspired by MuseScore's MIDI capabilities
 */
@Entity(tableName = "midi_files")
data class MidiFile(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "title")
    val title: String,
    
    @ColumnInfo(name = "file_path")
    val filePath: String,
    
    @ColumnInfo(name = "composer")
    val composer: String? = null,
    
    @ColumnInfo(name = "duration_ms")
    val durationMs: Long = 0,
    
    @ColumnInfo(name = "tempo")
    val tempo: Int = 120, // BPM
    
    @ColumnInfo(name = "time_signature")
    val timeSignature: String = "4/4",
    
    @ColumnInfo(name = "key_signature")
    val keySignature: String? = null, // e.g., "C major", "A minor"
    
    @ColumnInfo(name = "track_count")
    val trackCount: Int = 0,
    
    @ColumnInfo(name = "format")
    val format: Int = 1, // MIDI file format (0, 1, or 2)
    
    @ColumnInfo(name = "ppqn")
    val ppqn: Int = 480, // Pulses per quarter note
    
    @ColumnInfo(name = "file_size")
    val fileSize: Long = 0,
    
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "modified_at")
    val modifiedAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "last_played_at")
    val lastPlayedAt: Long? = null,
    
    @ColumnInfo(name = "play_count")
    val playCount: Int = 0,
    
    @ColumnInfo(name = "tags")
    val tags: String? = null // Comma-separated tags
)

/**
 * MIDI track entity for storing individual tracks within a MIDI file
 */
@Entity(
    tableName = "midi_tracks",
    foreignKeys = [
        ForeignKey(
            entity = MidiFile::class,
            parentColumns = ["id"],
            childColumns = ["midi_file_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index("midi_file_id")]
)
data class MidiTrackInfo(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "midi_file_id")
    val midiFileId: Long,
    
    @ColumnInfo(name = "track_number")
    val trackNumber: Int,
    
    @ColumnInfo(name = "name")
    val name: String? = null,
    
    @ColumnInfo(name = "instrument")
    val instrument: String? = null, // General MIDI instrument name
    
    @ColumnInfo(name = "program_number")
    val programNumber: Int = 0, // MIDI program/patch number (0-127)
    
    @ColumnInfo(name = "channel")
    val channel: Int = 0, // MIDI channel (0-15)
    
    @ColumnInfo(name = "note_count")
    val noteCount: Int = 0,
    
    @ColumnInfo(name = "is_muted")
    val isMuted: Boolean = false,
    
    @ColumnInfo(name = "is_solo")
    val isSolo: Boolean = false,
    
    @ColumnInfo(name = "volume")
    val volume: Int = 100, // 0-127
    
    @ColumnInfo(name = "pan")
    val pan: Int = 64 // 0-127 (64 = center)
)

/**
 * Soundfont entity for storing instrument pack information
 * Supports SF2, SF3, and SFZ formats from MuseScore
 */
@Entity(tableName = "soundfonts")
data class Soundfont(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "name")
    val name: String,
    
    @ColumnInfo(name = "file_path")
    val filePath: String,
    
    @ColumnInfo(name = "format")
    val format: SoundfontFormat,
    
    @ColumnInfo(name = "file_size")
    val fileSize: Long = 0,
    
    @ColumnInfo(name = "instrument_count")
    val instrumentCount: Int = 0,
    
    @ColumnInfo(name = "description")
    val description: String? = null,
    
    @ColumnInfo(name = "author")
    val author: String? = null,
    
    @ColumnInfo(name = "version")
    val version: String? = null,
    
    @ColumnInfo(name = "is_default")
    val isDefault: Boolean = false,
    
    @ColumnInfo(name = "is_enabled")
    val isEnabled: Boolean = true,
    
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis()
)

/**
 * Soundfont format types
 */
enum class SoundfontFormat {
    SF2,  // SoundFont 2
    SF3,  // Compressed SoundFont
    SFZ   // SFZ format
}

/**
 * MIDI playback state
 */
data class MidiPlaybackState(
    val isPlaying: Boolean = false,
    val isPaused: Boolean = false,
    val currentPosition: Long = 0, // in milliseconds
    val duration: Long = 0,
    val currentTempo: Int = 120,
    val currentMidiFile: MidiFile? = null,
    val soloTracks: Set<Int> = emptySet(),
    val mutedTracks: Set<Int> = emptySet(),
    val error: String? = null
)

/**
 * MIDI instrument info (General MIDI standard)
 */
data class MidiInstrument(
    val programNumber: Int,
    val name: String,
    val category: String,
    val description: String? = null
)

/**
 * MIDI note event for display and editing
 */
data class MidiNote(
    val trackId: Long,
    val pitch: Int, // MIDI note number (0-127)
    val velocity: Int, // Note velocity (0-127)
    val startTime: Long, // in ticks or milliseconds
    val duration: Long,
    val channel: Int
)

/**
 * Complete MIDI file with tracks for display
 */
data class MidiFileWithTracks(
    @Embedded val midiFile: MidiFile,
    @Relation(
        parentColumn = "id",
        entityColumn = "midi_file_id"
    )
    val tracks: List<MidiTrackInfo>
)
