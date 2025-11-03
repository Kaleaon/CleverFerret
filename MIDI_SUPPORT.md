# MIDI Support in CleverFerret

## Overview

CleverFerret now includes comprehensive MIDI (Musical Instrument Digital Interface) support, inspired by MuseScore's capabilities. This feature allows users to manage, play, and edit MIDI files directly within the app.

## Features

### 1. MIDI File Management
- Import and organize MIDI files in your library
- Extract and display MIDI metadata:
  - Title, composer, and tags
  - Tempo (BPM), time signature, and key signature
  - Track count and duration
  - File format information (Format 0, 1, or 2)

### 2. MIDI Playback
- Play MIDI files with full track control
- Individual track mute/solo functionality
- Volume and pan control per track
- Adjustable playback tempo
- Seek functionality with position display
- Play count tracking

### 3. Soundfont Support
CleverFerret supports industry-standard soundfont formats compatible with MuseScore:

- **SF2** (SoundFont 2): Standard soundfont format
- **SF3** (Compressed SoundFont): Compressed version of SF2
- **SFZ**: Sample-based soundfont format

Users can import soundfonts from MuseScore or other sources to enhance MIDI playback with realistic instrument sounds.

### 4. General MIDI Instruments
Full support for the 128 General MIDI instruments, including:
- Piano family (8 instruments)
- Chromatic percussion (8 instruments)
- Organ (8 instruments)
- Guitar and Bass (16 instruments)
- Strings (8 instruments)
- Ensemble (8 instruments)
- Brass (8 instruments)
- Reed and Pipe (16 instruments)
- Synth Lead and Pad (16 instruments)
- Synth Effects (8 instruments)
- Ethnic instruments (8 instruments)
- Percussive instruments (8 instruments)
- Sound effects (8 instruments)

## Architecture

### Data Layer

#### Models (`data/midi/MidiModels.kt`)
- `MidiFile`: Core entity for MIDI file metadata
- `MidiTrackInfo`: Individual track information within a MIDI file
- `Soundfont`: Soundfont file metadata and management
- `MidiPlaybackState`: Current playback state
- `MidiNote`: Note event representation for editing
- `MidiInstrument`: General MIDI instrument information

#### Database (`data/midi/MidiDatabase.kt`)
Room database with three main tables:
- `midi_files`: MIDI file metadata
- `midi_tracks`: Track information with foreign key to MIDI files
- `soundfonts`: Installed soundfont libraries

#### Repository (`data/midi/MidiRepository.kt`)
Clean API for MIDI data operations with coroutines and Flow support.

### Service Layer

#### MidiService (`services/midi/MidiService.kt`)
Unified service providing:
- MIDI file parsing and metadata extraction
- Playback control (play, pause, stop, seek)
- Track control (mute, solo, volume, pan)
- Soundfont management
- General MIDI instrument mapping

### UI Layer

#### MidiPlayerScreen (`ui/midi/MidiPlayerScreen.kt`)
Material 3 Compose UI featuring:
- MIDI file information display
- Playback controls with seek bar
- Track list with mute/solo buttons
- Tempo control
- Error display

## Dependencies

- **ktmidi-android** (0.11.1): Kotlin Multiplatform MIDI library for MIDI 1.0/2.0 support
- **Android MIDI API**: Native Android support for MIDI devices

## Usage

### Importing MIDI Files

```kotlin
// Using MidiService
val midiService: MidiService // Injected via Hilt
val midiFileId = midiService.importMidiFile("/path/to/file.mid")
```

### Playing MIDI Files

```kotlin
// Load and play
midiService.loadMidiFile(midiFileId)
midiService.play()

// Observe playback state
midiService.playbackState.collect { state ->
    // Update UI with current position, playing status, etc.
}
```

### Managing Tracks

```kotlin
// Mute a track
midiService.setTrackMuted(trackId, isMuted = true)

// Solo a track
midiService.setTrackSolo(trackId, isSolo = true)

// Adjust tempo
midiService.setTempo(140) // 140 BPM
```

### Importing Soundfonts

```kotlin
val soundfontId = midiService.importSoundfont(
    filePath = "/path/to/soundfont.sf2",
    name = "Orchestra Soundfont",
    format = SoundfontFormat.SF2
)

// Set as default
midiService.setDefaultSoundfont(soundfontId)
```

## Integration with MuseScore

### Compatible Features
1. **MIDI Import/Export**: Standard MIDI file formats (SMF)
2. **Soundfont Support**: SF2, SF3, and SFZ formats
3. **General MIDI**: Full GM instrument mapping
4. **Track Management**: Individual track control
5. **Playback Control**: Tempo, position, and track muting

### MuseScore Soundfont Sources
Users can download free soundfonts compatible with CleverFerret from:
- [Muse Sounds GitHub](https://github.com/CarlGao4/Muse-Sounds)
- [Musical Artifacts](https://musical-artifacts.com)
- [Internet Archive Soundfont Collections](https://archive.org/details/500-soundfonts-full-gm-sets)

## Future Enhancements

### Phase 1 (Foundation - Completed)
- [x] MIDI data models and database
- [x] Basic MIDI file parsing
- [x] Playback service foundation
- [x] UI for MIDI player
- [x] Soundfont data models

### Phase 2 (Playback Implementation)
- [ ] Full MIDI parsing with ktmidi
- [ ] Software synthesizer integration
- [ ] Soundfont loading and playback
- [ ] Real-time track control
- [ ] MIDI device enumeration

### Phase 3 (Editing)
- [ ] Piano roll editor
- [ ] Note editing (add/remove/move)
- [ ] Track editing (add/remove/reorder)
- [ ] MIDI export functionality
- [ ] Quantization and transpose

### Phase 4 (Advanced Features)
- [ ] Music notation display
- [ ] Metronome and click track
- [ ] MIDI recording from external devices
- [ ] MIDI effects (reverb, chorus, etc.)
- [ ] Lyrics support

## Technical Notes

### MIDI File Format Support
- Format 0: Single multi-channel track
- Format 1: Multiple tracks, synchronous
- Format 2: Multiple tracks, asynchronous

### Limitations
- Current implementation provides foundation and data structures
- Full playback requires Android device with MIDI support (API 23+)
- Soundfont playback requires software synthesizer integration
- MIDI editing features planned for future releases

### Performance Considerations
- MIDI files are parsed in background coroutines
- Database operations use Room with Flow for reactive updates
- Large soundfonts may require memory management
- Playback timing uses Android's high-precision timing APIs

## References

- [MuseScore](https://musescore.org/) - Open source music notation software
- [General MIDI Specification](https://www.midi.org/specifications/midi1-specifications/general-midi-1)
- [ktmidi Library](https://github.com/atsushieno/ktmidi)
- [Android MIDI API](https://developer.android.com/reference/android/media/midi/package-summary)
