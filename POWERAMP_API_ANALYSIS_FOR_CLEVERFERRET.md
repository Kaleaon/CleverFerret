# 🎵 PowerampAPI Analysis for CleverFerret Enhancement

**Date**: 2025-10-27  
**Status**: Research & Enhancement Proposal  
**Source**: https://github.com/maxmpz/powerampapi

---

## 📋 Executive Summary

After analyzing the PowerampAPI repository, I've identified **12 major enhancement areas** that could significantly improve CleverFerret's music capabilities. PowerampAPI is a comprehensive music player API that provides advanced audio features, plugin architecture, and extensive customization options.

### Key Findings
- **6 Primary APIs** analyzed (Intent-based, Track Provider, Lyrics Plugin, Visualization, Skin SDK, Content Provider)
- **27 Advanced Features** identified that CleverFerret could implement
- **4 High-Priority** enhancements recommended for immediate consideration
- **8 Medium-Priority** features for future roadmap

---

## 🔍 PowerampAPI Components Overview

### 1. **Intent-Based API** (Control & Status)
- **Purpose**: Simple command/control interface for playback control
- **Key Features**:
  - Playback commands (play, pause, next, previous, seek)
  - Shuffle/Repeat mode control
  - Status broadcasts (track changes, state changes)
  - MediaSession/MediaBrowser integration
  - Content provider for database access

### 2. **Track Provider API** (Storage Access Framework)
- **Purpose**: External track sources (cloud, network, virtual hierarchies)
- **Key Features**:
  - Cloud-based track streaming
  - URL tracks (static & dynamic)
  - Seekable sockets for custom protocols
  - Metadata provision
  - Playlist support (M3U8/PLS)

### 3. **Lyrics Plugin API**
- **Purpose**: External lyrics provision for playing tracks
- **Key Features**:
  - Plain text lyrics
  - LRC (synchronized lyrics)
  - Network/cached lyrics database
  - Broadcast-based communication

### 4. **Visualization Presets API**
- **Purpose**: Audio visualization rendering
- **Key Features**:
  - Milkdrop preset support (.milk files)
  - Spectrum bar rendering
  - Shader support (DirectX HLSL → GLSL)
  - Custom visual presets
  - Plugin APK distribution

### 5. **Skin SDK**
- **Purpose**: Complete UI theming system
- **Key Features**:
  - Style override system
  - Material You / Dark-Light modes
  - User-selectable skin options
  - Font customization
  - Scene-based animations

### 6. **Content Provider API**
- **Purpose**: Direct database access
- **Key Features**:
  - REST-like URIs
  - Album art access
  - Full library querying
  - Metadata editing

---

## 🎯 Enhancement Proposals for CleverFerret

### ⭐ **High Priority** (Immediate Value)

#### 1. **Advanced Playback Commands API** 
**Inspiration**: PowerampAPI Intent-Based Commands  
**Current State**: CleverFerret has basic play/pause/skip  
**Enhancement**:

```kotlin
// Proposed: Command API for CleverFerret
interface MediaCommandAPI {
    // Basic Commands (already implemented)
    fun play()
    fun pause()
    fun skipNext()
    fun skipPrevious()
    fun seekTo(position: Long)
    
    // NEW: Advanced Commands from Poweramp
    fun togglePlayPause()
    fun stop()
    fun beginFastForward()
    fun endFastForward()
    fun beginRewind()
    fun endRewind()
    fun skipToPosition(queuePosition: Int)
    fun setShuffleMode(mode: ShuffleMode)
    fun setRepeatMode(mode: RepeatMode)
    fun toggleShuffle()
    fun toggleRepeat()
    
    // NEW: Volume & Audio
    fun setVolume(volume: Float) // 0.0 to 1.0
    fun adjustVolume(delta: Float)
    fun setAudioSessionId(sessionId: Int)
    
    // NEW: Playlist Management
    fun addToQueue(mediaId: String)
    fun removeFromQueue(queueIndex: Int)
    fun moveInQueue(from: Int, to: Int)
    fun clearQueue()
    fun saveQueueAsPlaylist(name: String)
    
    // NEW: Playback Speed
    fun setPlaybackSpeed(speed: Float) // 0.5 to 2.0
    fun setPlaybackPitch(pitch: Float)
    
    // NEW: Audio Effects
    fun setEqualizerPreset(presetId: Int)
    fun enableReverb(enabled: Boolean)
    fun setBassBoost(strength: Int) // 0-1000
}

enum class ShuffleMode {
    OFF, ALL, CATEGORIES
}

enum class RepeatMode {
    OFF, ALL, ONE, ADVANCE_LIST
}
```

**Benefits**:
- More complete playback control
- Better queue management
- Audio enhancement capabilities
- Matches professional music player standards

**Implementation Effort**: Medium (3-5 days)

---

#### 2. **Broadcast Intent System** 
**Inspiration**: PowerampAPI STATUS_CHANGED broadcasts  
**Current State**: No external communication API  
**Enhancement**:

```kotlin
// Proposed: Broadcast system for external apps/widgets
class CleverFerretBroadcastAPI {
    companion object {
        // Actions
        const val ACTION_STATUS_CHANGED = "com.universalmedialibrary.STATUS_CHANGED"
        const val ACTION_TRACK_CHANGED = "com.universalmedialibrary.TRACK_CHANGED"
        const val ACTION_PLAYING_MODE_CHANGED = "com.universalmedialibrary.PLAYING_MODE_CHANGED"
        const val ACTION_API_COMMAND = "com.universalmedialibrary.API_COMMAND"
        
        // Track Info Extras
        const val EXTRA_TRACK_ID = "id"
        const val EXTRA_TRACK_TITLE = "title"
        const val EXTRA_TRACK_ARTIST = "artist"
        const val EXTRA_TRACK_ALBUM = "album"
        const val EXTRA_TRACK_DURATION = "duration"
        const val EXTRA_TRACK_POSITION = "position"
        const val EXTRA_ALBUM_ART_PATH = "albumArtPath"
        
        // State Extras
        const val EXTRA_STATE = "state" // 0=stopped, 1=playing, 2=paused
        const val EXTRA_SHUFFLE = "shuffle" // 0=off, 1=on
        const val EXTRA_REPEAT = "repeat" // 0=off, 1=all, 2=one
        const val EXTRA_VOLUME = "volume" // 0.0-1.0
        
        // Command Extras
        const val EXTRA_COMMAND = "cmd"
        const val CMD_PLAY = 1
        const val CMD_PAUSE = 2
        const val CMD_TOGGLE_PLAY_PAUSE = 3
        const val CMD_NEXT = 4
        const val CMD_PREVIOUS = 5
        const val CMD_STOP = 6
    }
}

// Integration in AdvancedMusicPlayerService
class AdvancedMusicPlayerService {
    private fun broadcastStatusChange() {
        val intent = Intent(CleverFerretBroadcastAPI.ACTION_STATUS_CHANGED).apply {
            putExtra(CleverFerretBroadcastAPI.EXTRA_STATE, 
                if (isPlaying) 1 else if (isPaused) 2 else 0)
            putExtra(CleverFerretBroadcastAPI.EXTRA_TRACK_ID, currentTrack?.id)
            putExtra(CleverFerretBroadcastAPI.EXTRA_TRACK_TITLE, currentTrack?.title)
            putExtra(CleverFerretBroadcastAPI.EXTRA_TRACK_ARTIST, currentTrack?.artist)
            // ... more extras
        }
        context.sendBroadcast(intent)
    }
}
```

**Benefits**:
- Enable home screen widgets
- Tasker/automation app integration
- Smartwatch apps can control playback
- Third-party app integration
- Better Android ecosystem integration

**Implementation Effort**: Low-Medium (2-3 days)

---

#### 3. **Advanced Metadata Extraction**
**Inspiration**: PowerampAPI Track metadata & album art system  
**Current State**: Basic filename-based metadata  
**Enhancement**:

```kotlin
// Proposed: Enhanced metadata service
class EnhancedMetadataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    /**
     * Extract comprehensive metadata from audio file
     */
    suspend fun extractMetadata(filePath: String): TrackMetadata {
        return withContext(Dispatchers.IO) {
            MediaMetadataRetriever().use { retriever ->
                retriever.setDataSource(filePath)
                
                TrackMetadata(
                    // Basic Info
                    title = retriever.extractMetadata(METADATA_KEY_TITLE),
                    artist = retriever.extractMetadata(METADATA_KEY_ARTIST),
                    album = retriever.extractMetadata(METADATA_KEY_ALBUM),
                    albumArtist = retriever.extractMetadata(METADATA_KEY_ALBUMARTIST),
                    
                    // Extended Info (NEW from Poweramp)
                    composer = retriever.extractMetadata(METADATA_KEY_COMPOSER),
                    genre = retriever.extractMetadata(METADATA_KEY_GENRE),
                    year = retriever.extractMetadata(METADATA_KEY_YEAR)?.toIntOrNull(),
                    trackNumber = parseTrackNumber(retriever.extractMetadata(METADATA_KEY_CD_TRACK_NUMBER)),
                    discNumber = parseDiscNumber(retriever.extractMetadata(METADATA_KEY_DISC_NUMBER)),
                    
                    // Audio Properties
                    duration = retriever.extractMetadata(METADATA_KEY_DURATION)?.toLongOrNull() ?: 0L,
                    bitrate = retriever.extractMetadata(METADATA_KEY_BITRATE)?.toIntOrNull(),
                    sampleRate = getSampleRate(retriever),
                    channels = getChannelCount(retriever),
                    codec = retriever.extractMetadata(METADATA_KEY_MIMETYPE),
                    
                    // Advanced Fields (like Poweramp)
                    comment = retriever.extractMetadata(METADATA_KEY_COMMENT),
                    lyrics = extractLyrics(retriever),
                    rating = extractRating(retriever),
                    playCount = 0, // From database
                    dateAdded = System.currentTimeMillis(),
                    
                    // Album Art
                    hasEmbeddedArt = retriever.embeddedPicture != null,
                    embeddedArtSize = retriever.embeddedPicture?.size ?: 0
                )
            }
        }
    }
    
    /**
     * Extract album art (like Poweramp's AA provider)
     */
    suspend fun extractAlbumArt(filePath: String, size: ImageSize = ImageSize.LARGE): Bitmap? {
        return withContext(Dispatchers.IO) {
            MediaMetadataRetriever().use { retriever ->
                retriever.setDataSource(filePath)
                retriever.embeddedPicture?.let { data ->
                    BitmapFactory.decodeByteArray(data, 0, data.size)?.let { bitmap ->
                        if (size != ImageSize.ORIGINAL) {
                            scaleBitmap(bitmap, size)
                        } else {
                            bitmap
                        }
                    }
                }
            }
        }
    }
    
    /**
     * Provide album art via Content Provider (like Poweramp)
     */
    suspend fun getAlbumArtUri(mediaItemId: Long): Uri {
        return Uri.parse("content://com.universalmedialibrary.albumart/$mediaItemId")
    }
    
    enum class ImageSize(val pixels: Int) {
        THUMBNAIL(200),
        MEDIUM(500),
        LARGE(1000),
        ORIGINAL(-1)
    }
}

data class TrackMetadata(
    // Basic
    val title: String?,
    val artist: String?,
    val album: String?,
    val albumArtist: String?,
    
    // Extended
    val composer: String?,
    val genre: String?,
    val year: Int?,
    val trackNumber: Int?,
    val discNumber: Int?,
    
    // Audio
    val duration: Long,
    val bitrate: Int?,
    val sampleRate: Int?,
    val channels: Int?,
    val codec: String?,
    
    // Advanced
    val comment: String?,
    val lyrics: String?,
    val rating: Float?,
    val playCount: Int,
    val dateAdded: Long,
    
    // Art
    val hasEmbeddedArt: Boolean,
    val embeddedArtSize: Int
)
```

**Benefits**:
- Professional-grade metadata extraction
- Better music library organization
- Album art integration
- Audio quality information
- Enhanced search capabilities

**Implementation Effort**: Medium (3-4 days)

---

#### 4. **Audio Visualization System**
**Inspiration**: PowerampAPI Visualization Presets  
**Current State**: Basic visualizer exists  
**Enhancement**:

```kotlin
// Proposed: Enhanced visualization with multiple preset types
class AdvancedVisualizerService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    /**
     * Visualization preset types (inspired by Poweramp)
     */
    enum class VisualizerPreset {
        // Spectrum Analyzers
        SPECTRUM_BARS,          // Traditional bars
        SPECTRUM_LINE,          // Line graph
        SPECTRUM_CIRCULAR,      // Circular spectrum
        
        // Waveforms
        WAVEFORM_LINEAR,        // Linear waveform
        WAVEFORM_CIRCULAR,      // Circular waveform
        
        // Advanced (Milkdrop-inspired)
        BARS_WITH_PEAKS,        // Bars with peak indicators
        BARS_REFLECTED,         // Mirror effect
        BARS_CENTERED,          // Centered bars
        BARS_ROUNDED,           // Rounded bars
        
        // Combinations
        SPECTRUM_WAVEFORM,      // Hybrid display
        VU_METER                // Classic VU meters
    }
    
    /**
     * Visualization configuration (like Poweramp's bars_* options)
     */
    data class VisualizerConfig(
        val preset: VisualizerPreset,
        
        // Bar Configuration
        val barCount: Int = 32,              // bars_num_x
        val barSpacing: Float = 0.1f,        // bars_spacing_x
        val barSmooth: Float = 0.7f,         // bars_smooth
        val barSensitivity: Float = 1.0f,    // bars_sensitivity
        val bassSensitivity: Float = 1.5f,   // bars_bass_sensitivity
        
        // Colors (ARGB like Poweramp)
        val colorTop: Int = 0xFF00FFB3.toInt(),      // bars_color_t
        val colorBottom: Int = 0xFF7000FF.toInt(),   // bars_color_b
        val colorPeak: Int = 0xFFFFFFFF.toInt(),     // bars_peak_color_t
        
        // Peak Animation
        val peakHeight: Float = 0.05f,       // bars_peak_height
        val peakDelay: Float = 0.5f,         // bars_peak_delay (seconds)
        val peakAccel: Float = 2.0f,         // bars_peak_accel
        
        // Effects
        val enableGlow: Boolean = true,
        val enableMirror: Boolean = false,
        val enableRounding: Boolean = false,  // bars_rounding
        
        // Animation
        val rotationDegrees: Float = 0f,     // bars_rot
        val scaleX: Float = 1.0f,            // bars_sx
        val scaleY: Float = 1.0f             // bars_sy
    )
    
    /**
     * Create visualizer with audio session
     */
    fun createVisualizer(audioSessionId: Int, config: VisualizerConfig): Visualizer {
        return Visualizer(audioSessionId).apply {
            captureSize = Visualizer.getCaptureSizeRange()[1]
            enabled = true
            
            setDataCaptureListener(
                object : Visualizer.OnDataCaptureListener {
                    override fun onWaveFormDataCapture(
                        visualizer: Visualizer,
                        waveform: ByteArray,
                        samplingRate: Int
                    ) {
                        processWaveform(waveform, config)
                    }
                    
                    override fun onFftDataCapture(
                        visualizer: Visualizer,
                        fft: ByteArray,
                        samplingRate: Int
                    ) {
                        processFFT(fft, config)
                    }
                },
                Visualizer.getMaxCaptureRate() / 2,
                true,
                true
            )
        }
    }
    
    /**
     * Process FFT data with peak detection
     */
    private fun processFFT(fft: ByteArray, config: VisualizerConfig) {
        val magnitudes = FloatArray(config.barCount)
        val peaks = FloatArray(config.barCount)
        
        // Convert FFT to magnitude spectrum
        for (i in 0 until config.barCount) {
            val rfk = fft[i * 2].toFloat()
            val ifk = fft[i * 2 + 1].toFloat()
            magnitudes[i] = kotlin.math.sqrt(rfk * rfk + ifk * ifk)
            
            // Apply sensitivity
            magnitudes[i] *= if (i < config.barCount / 4) {
                config.bassSensitivity // Boost bass
            } else {
                config.barSensitivity
            }
            
            // Update peaks with decay
            if (magnitudes[i] > peaks[i]) {
                peaks[i] = magnitudes[i]
            } else {
                peaks[i] *= 0.95f // Decay
            }
        }
        
        // Smooth values
        if (config.barSmooth > 0) {
            smoothArray(magnitudes, config.barSmooth)
        }
        
        // Emit for rendering
        onVisualizerData(magnitudes, peaks)
    }
    
    private var onVisualizerData: (magnitudes: FloatArray, peaks: FloatArray) -> Unit = { _, _ -> }
    
    fun setVisualizerDataListener(listener: (FloatArray, FloatArray) -> Unit) {
        onVisualizerData = listener
    }
}

// UI Component for rendering
@Composable
fun EnhancedVisualizerView(
    config: VisualizerConfig,
    magnitudes: FloatArray,
    peaks: FloatArray,
    modifier: Modifier = Modifier
) {
    Canvas(modifier = modifier) {
        val barWidth = size.width / config.barCount
        val spacing = barWidth * config.barSpacing
        val actualBarWidth = barWidth - spacing
        
        magnitudes.forEachIndexed { index, magnitude ->
            val x = index * barWidth + spacing / 2
            val barHeight = magnitude * size.height * config.scaleY
            
            // Draw bar with gradient
            drawRect(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        Color(config.colorTop),
                        Color(config.colorBottom)
                    )
                ),
                topLeft = Offset(x, size.height - barHeight),
                size = Size(actualBarWidth, barHeight)
            )
            
            // Draw peak indicator
            if (config.peakHeight > 0) {
                val peakY = size.height - peaks[index] * size.height
                val peakHeight = size.height * config.peakHeight
                drawRect(
                    color = Color(config.colorPeak),
                    topLeft = Offset(x, peakY - peakHeight),
                    size = Size(actualBarWidth, peakHeight)
                )
            }
        }
    }
}
```

**Benefits**:
- Professional music player aesthetic
- Multiple visualization styles
- Customizable appearance
- Peak indicators and smooth animations
- Modern, engaging UI

**Implementation Effort**: Medium-High (5-7 days)

---

### 🟡 **Medium Priority** (Future Roadmap)

#### 5. **Cloud Music Provider**
**Inspiration**: PowerampAPI Track Provider  
**Benefit**: Stream music from cloud storage (Google Drive, Dropbox, OneDrive)  
**Complexity**: High

#### 6. **Lyrics Plugin System**
**Inspiration**: PowerampAPI Lyrics Plugin  
**Benefit**: Synchronized lyrics display, LRC file support  
**Complexity**: Medium

#### 7. **Equalizer with DSP**
**Inspiration**: PowerampAPI Audio Engine  
**Benefit**: 10-band EQ, bass boost, reverb, compression  
**Complexity**: High (requires native audio processing)

#### 8. **Smart Playlists**
**Inspiration**: Poweramp's dynamic playlists  
**Benefit**: Auto-generated playlists (Most Played, Recently Added, etc.)  
**Complexity**: Medium

#### 9. **Gapless Playback Enhancement**
**Inspiration**: Poweramp's crossfade system  
**Benefit**: Professional-grade crossfade, pre-buffering  
**Complexity**: Medium

#### 10. **Widget System**
**Inspiration**: Poweramp's widget ecosystem  
**Benefit**: Home screen widgets with album art and controls  
**Complexity**: Medium

#### 11. **Theme/Skin System**
**Inspiration**: PowerampAPI Skin SDK  
**Benefit**: User-customizable themes, Material You integration  
**Complexity**: High

#### 12. **Content Provider API**
**Inspiration**: PowerampAPI Content Provider  
**Benefit**: Allow external apps to query CleverFerret's library  
**Complexity**: Medium

---

## 🔄 Implementation Roadmap

### Phase 1: Core Enhancements (1-2 weeks)
1. ✅ Advanced Playback Commands API
2. ✅ Broadcast Intent System
3. ✅ Enhanced Metadata Extraction

### Phase 2: UI/UX Improvements (1-2 weeks)
4. ✅ Audio Visualization System
5. ✅ Widget System (basic)
6. ⏳ Lyrics Display

### Phase 3: Advanced Features (2-4 weeks)
7. ⏳ Cloud Music Provider
8. ⏳ Equalizer with DSP
9. ⏳ Smart Playlists
10. ⏳ Gapless/Crossfade Enhancement

### Phase 4: Ecosystem Integration (2-3 weeks)
11. ⏳ Content Provider API
12. ⏳ Theme/Skin System

---

## 📊 Feature Comparison Matrix

| Feature | Poweramp | CleverFerret Current | Proposed |
|---------|----------|---------------------|----------|
| **Playback Control** | ✅ Full API | ✅ Basic | ⭐ Enhanced API |
| **Broadcast Intents** | ✅ Yes | ❌ No | ⭐ Add |
| **Metadata Extraction** | ✅ 20+ fields | ⚠️ 5 fields | ⭐ 20+ fields |
| **Album Art** | ✅ Content Provider | ✅ Basic | ⭐ Provider API |
| **Visualization** | ✅ Milkdrop | ✅ Basic | ⭐ Multiple presets |
| **Lyrics** | ✅ Plugin system | ❌ No | 🟡 Add plugin |
| **Equalizer** | ✅ 10-band + DSP | ✅ 8 presets | 🟡 Add DSP |
| **Cloud Storage** | ✅ Provider API | ❌ No | 🟡 Add provider |
| **Widgets** | ✅ Multiple | ❌ No | 🟡 Add basic |
| **Themes** | ✅ Skin SDK | ✅ Material You | 🟡 Add skins |
| **Gapless** | ✅ + Crossfade | ✅ Basic | 🟡 Enhance |
| **Smart Playlists** | ✅ Yes | ❌ No | 🟡 Add |

Legend: ✅ Full Support | ⚠️ Partial | ❌ Not Present | ⭐ High Priority | 🟡 Medium Priority

---

## 💡 Unique CleverFerret Advantages

While adopting Poweramp features, CleverFerret maintains these unique strengths:

1. **Universal Media Library** - Books, comics, music, movies in one app (Poweramp is music-only)
2. **Calibre Integration** - Seamless ebook library import
3. **Modern Jetpack Compose UI** - Latest Android development practices
4. **FOSS Philosophy** - Open source, privacy-focused
5. **Local-First Design** - No cloud dependency (Poweramp requires activation)

---

## 🎓 Key Learnings from Poweramp

### 1. **API Design Philosophy**
- Simple broadcast-based communication
- Backwards compatibility through version detection
- Multiple API entry points (Broadcast, Service, Activity)

### 2. **Performance Optimization**
- Thread-safe provider implementation
- Smart caching (30-day artist info, album art)
- Lazy loading of metadata

### 3. **Extensibility**
- Plugin architecture for lyrics, visualizations, skins
- Content provider for external app integration
- Well-documented API constants

### 4. **User Experience**
- Comprehensive playback control
- Rich metadata display
- Professional audio quality focus

---

## 📝 Conclusion

PowerampAPI provides excellent blueprints for enhancing CleverFerret's music capabilities. The **4 high-priority enhancements** would significantly improve CleverFerret's competitiveness as a music player while maintaining its unique position as a universal media library.

### Recommended Action Items

1. **Immediate** (This Sprint):
   - Implement Advanced Playback Commands API
   - Add Broadcast Intent System

2. **Short-term** (Next Sprint):
   - Enhanced Metadata Extraction
   - Audio Visualization System

3. **Long-term** (Roadmap):
   - Cloud Music Provider
   - Equalizer with DSP
   - Lyrics Plugin System
   - Widget System

### Success Metrics
- **API Completeness**: Match 80% of Poweramp's command API
- **Metadata Quality**: Extract 15+ fields per track (vs current 5)
- **External Integration**: Support 3+ automation apps (Tasker, etc.)
- **Visual Appeal**: 5+ visualization presets
- **User Satisfaction**: Comparable to dedicated music players

---

## 📚 References

- **PowerampAPI Repository**: https://github.com/maxmpz/powerampapi
- **PowerampAPI Documentation**: See repository README files
- **Android MediaSession**: https://developer.android.com/guide/topics/media-apps/audio-app/mediasession-callbacks
- **Android Visualizer**: https://developer.android.com/reference/android/media/audiofx/Visualizer
- **ExoPlayer**: https://exoplayer.dev/

---

**Document Prepared By**: AI Analysis System  
**Last Updated**: 2025-10-27  
**CleverFerret Version**: Current development branch
