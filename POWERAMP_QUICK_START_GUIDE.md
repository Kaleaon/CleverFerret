# 🚀 PowerampAPI Enhancement Quick Start Guide

**For CleverFerret Development Team**

---

## 🎯 Top 4 Features to Implement NOW

These features provide the highest value-to-effort ratio and can be implemented quickly to significantly enhance CleverFerret's music capabilities.

---

## 1️⃣ Advanced Playback Commands API (3-5 days)

### What It Does
Expands CleverFerret's playback control from basic (play/pause/skip) to professional-grade (30+ commands).

### Implementation Steps

#### Step 1: Create the API Interface
**File**: `CleverFerret/src/main/java/com/universalmedialibrary/api/MediaCommandAPI.kt`

```kotlin
package com.universalmedialibrary.api

interface MediaCommandAPI {
    // Playback Control
    fun play()
    fun pause()
    fun togglePlayPause()
    fun stop()
    fun skipNext()
    fun skipPrevious()
    fun seekTo(positionMs: Long)
    fun seekRelative(deltaMs: Long)
    
    // Queue Management
    fun skipToQueuePosition(index: Int)
    fun addToQueue(mediaId: String)
    fun removeFromQueue(index: Int)
    fun moveInQueue(from: Int, to: Int)
    fun clearQueue()
    fun shuffleQueue()
    
    // Playback Modes
    fun setShuffleMode(mode: ShuffleMode)
    fun setRepeatMode(mode: RepeatMode)
    fun toggleShuffle()
    fun toggleRepeat()
    
    // Volume & Speed
    fun setVolume(volume: Float) // 0.0 to 1.0
    fun adjustVolume(delta: Float)
    fun setPlaybackSpeed(speed: Float) // 0.5 to 2.0
    
    // Audio Effects
    fun setEqualizerPreset(presetId: Int)
    fun setBassBoost(strength: Int) // 0-1000
}

enum class ShuffleMode { OFF, ALL, CATEGORIES }
enum class RepeatMode { OFF, ALL, ONE, ADVANCE_LIST }
```

#### Step 2: Implement in AdvancedMusicPlayerService
**File**: `CleverFerret/src/main/java/com/universalmedialibrary/services/music/AdvancedMusicPlayerService.kt`

```kotlin
// Add to existing class
class AdvancedMusicPlayerService : MediaCommandAPI {
    
    // NEW: Seek relative
    override fun seekRelative(deltaMs: Long) {
        val newPosition = (getCurrentPosition() + deltaMs).coerceIn(0, getDuration())
        seekTo(newPosition)
    }
    
    // NEW: Skip to queue position
    override fun skipToQueuePosition(index: Int) {
        if (index in 0 until _queue.value.size) {
            currentQueueIndex = index
            playCurrentTrack()
        }
    }
    
    // NEW: Move in queue
    override fun moveInQueue(from: Int, to: Int) {
        val queue = _queue.value.toMutableList()
        if (from in queue.indices && to in queue.indices) {
            val track = queue.removeAt(from)
            queue.add(to, track)
            _queue.value = queue
            
            // Adjust current index if needed
            when {
                currentQueueIndex == from -> currentQueueIndex = to
                from < currentQueueIndex && to >= currentQueueIndex -> currentQueueIndex--
                from > currentQueueIndex && to <= currentQueueIndex -> currentQueueIndex++
            }
        }
    }
    
    // NEW: Shuffle queue (improved)
    override fun shuffleQueue() {
        val currentTrack = _currentTrack.value
        val queue = _queue.value.toMutableList()
        
        // Remove current track, shuffle rest, then add current at front
        if (currentTrack != null) {
            queue.removeIf { it.id == currentTrack.id }
            queue.shuffle()
            queue.add(0, currentTrack)
            _queue.value = queue
            currentQueueIndex = 0
        } else {
            _queue.value = queue.shuffled()
        }
    }
    
    // NEW: Toggle methods
    override fun toggleShuffle() {
        setPlaylistMode(
            if (_playlistMode.value == PlaylistMode.SHUFFLE) 
                PlaylistMode.NORMAL 
            else 
                PlaylistMode.SHUFFLE
        )
    }
    
    override fun toggleRepeat() {
        setPlaylistMode(
            when (_playlistMode.value) {
                PlaylistMode.NORMAL -> PlaylistMode.REPEAT_ALL
                PlaylistMode.REPEAT_ALL -> PlaylistMode.REPEAT_ONE
                PlaylistMode.REPEAT_ONE -> PlaylistMode.NORMAL
                else -> PlaylistMode.NORMAL
            }
        )
    }
    
    // NEW: Volume control
    private val _volume = MutableStateFlow(1.0f)
    val volume: StateFlow<Float> = _volume.asStateFlow()
    
    override fun setVolume(volume: Float) {
        _volume.value = volume.coerceIn(0f, 1f)
        exoPlayerService.setVolume(_volume.value)
    }
    
    override fun adjustVolume(delta: Float) {
        setVolume(_volume.value + delta)
    }
}
```

#### Step 3: Add to ExoPlayerService
**File**: `CleverFerret/src/main/java/com/universalmedialibrary/services/exoplayer/ExoPlayerService.kt`

```kotlin
// Add these methods
fun setVolume(volume: Float) {
    player?.volume = volume
}

fun setSkipSilence(enabled: Boolean) {
    player?.skipSilenceEnabled = enabled
}
```

### Benefits Achieved
✅ Professional-grade playback control  
✅ Better queue management  
✅ Volume control integration  
✅ Foundation for widgets and external control

---

## 2️⃣ Broadcast Intent System (2-3 days)

### What It Does
Enables external apps (widgets, automation apps, smartwatches) to control and monitor CleverFerret.

### Implementation Steps

#### Step 1: Define Broadcast Constants
**File**: `CleverFerret/src/main/java/com/universalmedialibrary/api/CleverFerretBroadcasts.kt`

```kotlin
package com.universalmedialibrary.api

object CleverFerretBroadcasts {
    // Actions (Outgoing - CleverFerret sends these)
    const val ACTION_STATUS_CHANGED = "com.universalmedialibrary.STATUS_CHANGED"
    const val ACTION_TRACK_CHANGED = "com.universalmedialibrary.TRACK_CHANGED"
    const val ACTION_PLAYING_MODE_CHANGED = "com.universalmedialibrary.PLAYING_MODE_CHANGED"
    
    // Actions (Incoming - External apps send these)
    const val ACTION_API_COMMAND = "com.universalmedialibrary.API_COMMAND"
    
    // Track Info Extras
    const val EXTRA_TRACK_ID = "id"
    const val EXTRA_TRACK_TITLE = "title"
    const val EXTRA_TRACK_ARTIST = "artist"
    const val EXTRA_TRACK_ALBUM = "album"
    const val EXTRA_TRACK_DURATION = "duration"
    const val EXTRA_TRACK_POSITION = "position"
    const val EXTRA_ALBUM_ART_URI = "albumArtUri"
    
    // State Extras
    const val EXTRA_STATE = "state" // 0=stopped, 1=playing, 2=paused
    const val EXTRA_SHUFFLE = "shuffle" // 0=off, 1=on
    const val EXTRA_REPEAT = "repeat" // 0=off, 1=all, 2=one
    const val EXTRA_VOLUME = "volume" // 0.0-1.0
    
    // Command Extras
    const val EXTRA_COMMAND = "cmd"
    const val CMD_TOGGLE_PLAY_PAUSE = 1
    const val CMD_PLAY = 2
    const val CMD_PAUSE = 3
    const val CMD_NEXT = 4
    const val CMD_PREVIOUS = 5
    const val CMD_STOP = 6
    const val CMD_SEEK = 7
    const val CMD_SET_SHUFFLE = 8
    const val CMD_SET_REPEAT = 9
    
    const val EXTRA_POSITION = "position" // For CMD_SEEK
}
```

#### Step 2: Create Broadcast Manager
**File**: `CleverFerret/src/main/java/com/universalmedialibrary/api/BroadcastManager.kt`

```kotlin
package com.universalmedialibrary.api

import android.content.Context
import android.content.Intent
import com.universalmedialibrary.services.music.TrackInfo
import com.universalmedialibrary.services.music.PlaylistMode
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class BroadcastManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    fun sendStatusChanged(
        isPlaying: Boolean,
        isPaused: Boolean,
        shuffle: PlaylistMode,
        repeat: PlaylistMode,
        volume: Float
    ) {
        val intent = Intent(CleverFerretBroadcasts.ACTION_STATUS_CHANGED).apply {
            putExtra(CleverFerretBroadcasts.EXTRA_STATE, when {
                isPlaying -> 1
                isPaused -> 2
                else -> 0
            })
            putExtra(CleverFerretBroadcasts.EXTRA_SHUFFLE, 
                if (shuffle == PlaylistMode.SHUFFLE) 1 else 0)
            putExtra(CleverFerretBroadcasts.EXTRA_REPEAT, when (repeat) {
                PlaylistMode.REPEAT_ALL -> 1
                PlaylistMode.REPEAT_ONE -> 2
                else -> 0
            })
            putExtra(CleverFerretBroadcasts.EXTRA_VOLUME, volume)
            setPackage(context.packageName) // Keep broadcast within app for now
        }
        context.sendBroadcast(intent)
    }
    
    fun sendTrackChanged(track: TrackInfo?, position: Long) {
        val intent = Intent(CleverFerretBroadcasts.ACTION_TRACK_CHANGED).apply {
            track?.let {
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_ID, it.id)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_TITLE, it.title)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_ARTIST, it.artist)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_ALBUM, it.album)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_DURATION, it.duration)
                putExtra(CleverFerretBroadcasts.EXTRA_TRACK_POSITION, position)
                putExtra(CleverFerretBroadcasts.EXTRA_ALBUM_ART_URI, it.albumArtUrl)
            }
            setPackage(context.packageName)
        }
        context.sendBroadcast(intent)
    }
    
    fun sendPlayingModeChanged(shuffle: PlaylistMode, repeat: PlaylistMode) {
        val intent = Intent(CleverFerretBroadcasts.ACTION_PLAYING_MODE_CHANGED).apply {
            putExtra(CleverFerretBroadcasts.EXTRA_SHUFFLE, 
                if (shuffle == PlaylistMode.SHUFFLE) 1 else 0)
            putExtra(CleverFerretBroadcasts.EXTRA_REPEAT, when (repeat) {
                PlaylistMode.REPEAT_ALL -> 1
                PlaylistMode.REPEAT_ONE -> 2
                else -> 0
            })
            setPackage(context.packageName)
        }
        context.sendBroadcast(intent)
    }
}
```

#### Step 3: Create Broadcast Receiver
**File**: `CleverFerret/src/main/java/com/universalmedialibrary/api/CleverFerretAPIReceiver.kt`

```kotlin
package com.universalmedialibrary.api

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

@AndroidEntryPoint
class CleverFerretAPIReceiver : BroadcastReceiver() {
    
    @Inject
    lateinit var musicService: AdvancedMusicPlayerService
    
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != CleverFerretBroadcasts.ACTION_API_COMMAND) return
        
        val command = intent.getIntExtra(CleverFerretBroadcasts.EXTRA_COMMAND, -1)
        
        Log.d("CleverFerretAPI", "Received command: $command")
        
        when (command) {
            CleverFerretBroadcasts.CMD_TOGGLE_PLAY_PAUSE -> musicService.togglePlayPause()
            CleverFerretBroadcasts.CMD_PLAY -> musicService.play()
            CleverFerretBroadcasts.CMD_PAUSE -> musicService.pause()
            CleverFerretBroadcasts.CMD_NEXT -> musicService.skipToNext()
            CleverFerretBroadcasts.CMD_PREVIOUS -> musicService.skipToPrevious()
            CleverFerretBroadcasts.CMD_STOP -> musicService.stop()
            CleverFerretBroadcasts.CMD_SEEK -> {
                val position = intent.getLongExtra(CleverFerretBroadcasts.EXTRA_POSITION, 0)
                musicService.seekTo(position)
            }
            CleverFerretBroadcasts.CMD_SET_SHUFFLE -> musicService.toggleShuffle()
            CleverFerretBroadcasts.CMD_SET_REPEAT -> musicService.toggleRepeat()
        }
    }
}
```

#### Step 4: Register in AndroidManifest.xml
**File**: `CleverFerret/src/main/AndroidManifest.xml`

```xml
<receiver
    android:name=".api.CleverFerretAPIReceiver"
    android:enabled="true"
    android:exported="false">
    <intent-filter>
        <action android:name="com.universalmedialibrary.API_COMMAND" />
    </intent-filter>
</receiver>
```

#### Step 5: Integrate with MusicPlayerService
**File**: `CleverFerret/src/main/java/com/universalmedialibrary/services/music/AdvancedMusicPlayerService.kt`

```kotlin
// Add injection
@Inject
lateinit var broadcastManager: BroadcastManager

// Modify existing methods to broadcast
override fun play() {
    exoPlayerService.play()
    updatePlaybackState(isPlaying = true)
    broadcastManager.sendStatusChanged(
        isPlaying = true,
        isPaused = false,
        shuffle = _playlistMode.value,
        repeat = _playlistMode.value,
        volume = _volume.value
    )
}

override fun pause() {
    exoPlayerService.pause()
    updatePlaybackState(isPlaying = false)
    broadcastManager.sendStatusChanged(
        isPlaying = false,
        isPaused = true,
        shuffle = _playlistMode.value,
        repeat = _playlistMode.value,
        volume = _volume.value
    )
}

// Add to playCurrentTrack()
private fun playCurrentTrack() {
    val queue = _queue.value
    val currentTrack = queue.getOrNull(currentQueueIndex)
    
    if (currentTrack != null) {
        _currentTrack.value = currentTrack
        exoPlayerService.seekToMediaItem(currentQueueIndex)
        if (!_playbackState.value.isPlaying) {
            play()
        }
        
        // NEW: Broadcast track change
        broadcastManager.sendTrackChanged(currentTrack, 0)
    }
}
```

### Benefits Achieved
✅ Widget support foundation  
✅ Automation app integration (Tasker, etc.)  
✅ Smartwatch control capability  
✅ External app integration  
✅ Better Android ecosystem integration

---

## 3️⃣ Enhanced Metadata Extraction (3-4 days)

### What It Does
Extracts 20+ metadata fields from audio files (vs current 5), including album art, lyrics, audio quality info.

### Quick Implementation

#### File: `CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/EnhancedMetadataService.kt`

```kotlin
package com.universalmedialibrary.services.metadata

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.media.MediaMetadataRetriever
import android.media.MediaMetadataRetriever.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class EnhancedMetadataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    /**
     * Extract all available metadata from audio file
     */
    suspend fun extractMetadata(filePath: String): EnhancedTrackMetadata = withContext(Dispatchers.IO) {
        MediaMetadataRetriever().use { retriever ->
            try {
                retriever.setDataSource(filePath)
                
                EnhancedTrackMetadata(
                    // Basic Info
                    title = retriever.extractMetadata(METADATA_KEY_TITLE),
                    artist = retriever.extractMetadata(METADATA_KEY_ARTIST),
                    album = retriever.extractMetadata(METADATA_KEY_ALBUM),
                    albumArtist = retriever.extractMetadata(METADATA_KEY_ALBUMARTIST),
                    
                    // Extended Info (NEW!)
                    composer = retriever.extractMetadata(METADATA_KEY_COMPOSER),
                    writer = retriever.extractMetadata(METADATA_KEY_WRITER),
                    genre = retriever.extractMetadata(METADATA_KEY_GENRE),
                    year = retriever.extractMetadata(METADATA_KEY_YEAR)?.toIntOrNull(),
                    date = retriever.extractMetadata(METADATA_KEY_DATE),
                    
                    // Track/Disc Numbers
                    trackNumber = parseTrackNumber(
                        retriever.extractMetadata(METADATA_KEY_CD_TRACK_NUMBER)
                    ),
                    trackTotal = parseTrackTotal(
                        retriever.extractMetadata(METADATA_KEY_CD_TRACK_NUMBER)
                    ),
                    discNumber = parseDiscNumber(
                        retriever.extractMetadata(METADATA_KEY_DISC_NUMBER)
                    ),
                    discTotal = parseDiscTotal(
                        retriever.extractMetadata(METADATA_KEY_DISC_NUMBER)
                    ),
                    
                    // Audio Properties
                    duration = retriever.extractMetadata(METADATA_KEY_DURATION)?.toLongOrNull() ?: 0L,
                    bitrate = retriever.extractMetadata(METADATA_KEY_BITRATE)?.toIntOrNull(),
                    sampleRate = getSampleRate(retriever),
                    channels = getChannelCount(retriever),
                    mimeType = retriever.extractMetadata(METADATA_KEY_MIMETYPE),
                    
                    // Additional Fields
                    compilation = retriever.extractMetadata(METADATA_KEY_COMPILATION),
                    author = retriever.extractMetadata(METADATA_KEY_AUTHOR),
                    location = retriever.extractMetadata(METADATA_KEY_LOCATION),
                    
                    // Album Art
                    hasEmbeddedArt = retriever.embeddedPicture != null,
                    embeddedArtSize = retriever.embeddedPicture?.size ?: 0
                )
            } catch (e: Exception) {
                // Return minimal metadata on error
                EnhancedTrackMetadata(
                    title = filePath.substringAfterLast('/').substringBeforeLast('.'),
                    duration = 0L
                )
            }
        }
    }
    
    /**
     * Extract album art from audio file
     */
    suspend fun extractAlbumArt(filePath: String, maxSize: Int = 500): Bitmap? = withContext(Dispatchers.IO) {
        MediaMetadataRetriever().use { retriever ->
            try {
                retriever.setDataSource(filePath)
                retriever.embeddedPicture?.let { data ->
                    val options = BitmapFactory.Options().apply {
                        inJustDecodeBounds = true
                    }
                    BitmapFactory.decodeByteArray(data, 0, data.size, options)
                    
                    // Calculate sample size
                    options.inSampleSize = calculateInSampleSize(options, maxSize, maxSize)
                    options.inJustDecodeBounds = false
                    
                    BitmapFactory.decodeByteArray(data, 0, data.size, options)
                }
            } catch (e: Exception) {
                null
            }
        }
    }
    
    private fun parseTrackNumber(trackInfo: String?): Int? {
        return trackInfo?.split('/')?.firstOrNull()?.toIntOrNull()
    }
    
    private fun parseTrackTotal(trackInfo: String?): Int? {
        return trackInfo?.split('/')?.getOrNull(1)?.toIntOrNull()
    }
    
    private fun parseDiscNumber(discInfo: String?): Int? {
        return discInfo?.split('/')?.firstOrNull()?.toIntOrNull()
    }
    
    private fun parseDiscTotal(discInfo: String?): Int? {
        return discInfo?.split('/')?.getOrNull(1)?.toIntOrNull()
    }
    
    private fun getSampleRate(retriever: MediaMetadataRetriever): Int? {
        return try {
            retriever.extractMetadata(METADATA_KEY_SAMPLERATE)?.toIntOrNull()
        } catch (e: Exception) {
            null
        }
    }
    
    private fun getChannelCount(retriever: MediaMetadataRetriever): Int? {
        return try {
            retriever.extractMetadata(METADATA_KEY_NUM_TRACKS)?.toIntOrNull()
        } catch (e: Exception) {
            null
        }
    }
    
    private fun calculateInSampleSize(options: BitmapFactory.Options, reqWidth: Int, reqHeight: Int): Int {
        val height = options.outHeight
        val width = options.outWidth
        var inSampleSize = 1
        
        if (height > reqHeight || width > reqWidth) {
            val halfHeight = height / 2
            val halfWidth = width / 2
            
            while (halfHeight / inSampleSize >= reqHeight && halfWidth / inSampleSize >= reqWidth) {
                inSampleSize *= 2
            }
        }
        
        return inSampleSize
    }
}

data class EnhancedTrackMetadata(
    // Basic
    val title: String?,
    val artist: String? = null,
    val album: String? = null,
    val albumArtist: String? = null,
    
    // Extended
    val composer: String? = null,
    val writer: String? = null,
    val genre: String? = null,
    val year: Int? = null,
    val date: String? = null,
    
    // Track Info
    val trackNumber: Int? = null,
    val trackTotal: Int? = null,
    val discNumber: Int? = null,
    val discTotal: Int? = null,
    
    // Audio
    val duration: Long,
    val bitrate: Int? = null,
    val sampleRate: Int? = null,
    val channels: Int? = null,
    val mimeType: String? = null,
    
    // Additional
    val compilation: String? = null,
    val author: String? = null,
    val location: String? = null,
    
    // Art
    val hasEmbeddedArt: Boolean = false,
    val embeddedArtSize: Int = 0
) {
    val audioQuality: String
        get() = when {
            bitrate == null -> "Unknown"
            bitrate >= 320000 -> "High (320+ kbps)"
            bitrate >= 192000 -> "Medium (192-320 kbps)"
            bitrate >= 128000 -> "Standard (128-192 kbps)"
            else -> "Low (< 128 kbps)"
        }
}
```

### Benefits Achieved
✅ 20+ metadata fields extracted  
✅ Album art extraction with size control  
✅ Audio quality information  
✅ Better library organization  
✅ Enhanced search capabilities

---

## 4️⃣ Audio Visualization System (5-7 days)

### What It Does
Professional music visualizer with 5+ preset styles, customizable colors, and smooth animations.

### Quick Start

**File**: `CleverFerret/src/main/java/com/universalmedialibrary/ui/visualizer/EnhancedVisualizerScreen.kt`

See the main analysis document for full implementation - this is a complex feature best implemented after the other 3.

---

## 🎯 Implementation Priority

### Week 1: Foundation
- ✅ Day 1-2: Advanced Playback Commands API
- ✅ Day 3-4: Broadcast Intent System
- ✅ Day 5: Testing & Integration

### Week 2: Enhancement
- ✅ Day 1-3: Enhanced Metadata Extraction
- ✅ Day 4-5: Integration with Music Library

### Week 3 (Optional): Polish
- ⏳ Audio Visualization System
- ⏳ Widget Development

---

## 📊 Expected Outcomes

After implementing these 4 features:

- **API Completeness**: 70% → 95% (Poweramp parity)
- **Metadata Quality**: 5 fields → 20+ fields
- **External Integration**: 0 → 3+ automation apps supported
- **User Experience**: Good → Excellent
- **Competitive Position**: Basic → Professional-grade

---

## 🔧 Testing Checklist

### Feature 1: Commands API
- [ ] All playback commands work
- [ ] Queue management functions correctly
- [ ] Volume control responds properly
- [ ] Shuffle/repeat modes switch correctly

### Feature 2: Broadcasts
- [ ] Status broadcasts sent on state change
- [ ] Track broadcasts sent on track change
- [ ] Commands received from external intents
- [ ] Broadcast receiver registered properly

### Feature 3: Metadata
- [ ] All 20+ fields extracted when available
- [ ] Album art extracted correctly
- [ ] Error handling for corrupt files
- [ ] Performance acceptable for large libraries

---

## 📝 Next Steps After Implementation

1. **Documentation**: Update user docs with new features
2. **Testing**: Comprehensive testing with various audio formats
3. **Widget**: Create home screen widget using broadcast system
4. **Automation**: Document Tasker integration examples
5. **Roadmap**: Plan Phase 2 features (Cloud Provider, Lyrics, etc.)

---

**Document Created**: 2024-10-27  
**Estimated Total Implementation Time**: 10-14 days  
**Impact**: Transform CleverFerret music player from basic to professional-grade
