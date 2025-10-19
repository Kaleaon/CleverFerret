# Implementation Guide - Priority Features

## 🎧 Phase 1: Audiophile Essentials

### 1. FLAC/ALAC Support

**Android Implementation**:
```kotlin
// Add to build.gradle.kts
dependencies {
    implementation("androidx.media3:media3-exoplayer:1.2.0")
    implementation("androidx.media3:media3-exoplayer-flac:1.2.0") // FLAC
}

// AudioFormatDetector.kt
object AudioFormatDetector {
    fun detectFormat(file: File): AudioSpecs {
        val retriever = MediaMetadataRetriever()
        retriever.setDataSource(file.absolutePath)
        
        return AudioSpecs(
            codec = retriever.extractMetadata(METADATA_KEY_MIMETYPE) ?: "unknown",
            sampleRate = retriever.extractMetadata(METADATA_KEY_SAMPLERATE)?.toInt() ?: 44100,
            bitDepth = retriever.extractMetadata(METADATA_KEY_BITRATE)?.toInt(),
            channels = retriever.extractMetadata(METADATA_KEY_NUM_TRACKS)?.toInt() ?: 2,
            isLossless = file.extension in listOf("flac", "alac", "ape", "wav", "aiff")
        )
    }
}

// Update AudioPlaybackManager.kt
class AudioPlaybackManager {
    fun loadAudioFile(mediaItem: MediaItem) {
        val audioSpecs = AudioFormatDetector.detectFormat(File(mediaItem.filePath))
        
        // Configure ExoPlayer for hi-res
        if (audioSpecs.sampleRate > 48000) {
            player.audioComponent?.audioSessionId?.let { sessionId ->
                // Enable hi-res output
                val audioManager = context.getSystemService(AudioManager::class.java)
                audioManager.setParameters("hi_res_output=1")
            }
        }
        
        // Load with appropriate decoder
        val mediaSource = when (audioSpecs.codec) {
            "audio/flac" -> FlacExtractor()
            "audio/alac" -> AlacExtractor()  
            else -> DefaultExtractor()
        }
        
        player.setMediaSource(mediaSource)
    }
}
```

### 2. USB DAC Detection

```kotlin
// DACManager.kt
@Singleton
class DACManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val audioManager = context.getSystemService(AudioManager::class.java)
    
    fun detectConnectedDACs(): List<AudioDeviceInfo> {
        return audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)
            .filter { device ->
                device.type == AudioDeviceInfo.TYPE_USB_DEVICE ||
                device.type == AudioDeviceInfo.TYPE_USB_ACCESSORY ||
                device.type == AudioDeviceInfo.TYPE_USB_HEADSET
            }
    }
    
    fun enableExclusiveMode(device: AudioDeviceInfo): Boolean {
        // Request exclusive audio access (bit-perfect)
        val attributes = AudioAttributes.Builder()
            .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
            .setUsage(AudioAttributes.USAGE_MEDIA)
            .setFlags(AudioAttributes.FLAG_LOW_LATENCY)
            .build()
            
        // Configure for bit-perfect playback
        val format = AudioFormat.Builder()
            .setEncoding(AudioFormat.ENCODING_PCM_24BIT_PACKED)
            .setSampleRate(192000) // Max supported
            .setChannelMask(AudioFormat.CHANNEL_OUT_STEREO)
            .build()
            
        return try {
            val track = AudioTrack.Builder()
                .setAudioAttributes(attributes)
                .setAudioFormat(format)
                .setTransferMode(AudioTrack.MODE_STREAM)
                .setOffloadedPlayback(true) // Hardware acceleration
                .build()
            track.release()
            true
        } catch (e: Exception) {
            false
        }
    }
    
    data class DACInfo(
        val name: String,
        val maxSampleRate: Int,
        val maxBitDepth: Int,
        val supportedFormats: List<Int>,
        val isUSBDAC: Boolean
    )
}

// UI Component - DACSelectionScreen.kt
@Composable
fun DACSelectionScreen(dacManager: DACManager) {
    val dacs by dacManager.connectedDACs.collectAsState()
    
    LazyColumn {
        items(dacs) { dac ->
            DACCard(
                name = dac.name,
                specs = "${dac.maxSampleRate}kHz / ${dac.maxBitDepth}bit",
                isActive = dac.isActive,
                onClick = { dacManager.selectDAC(dac) }
            )
        }
    }
}
```

### 3. ReplayGain Support

```kotlin
// ReplayGainProcessor.kt
class ReplayGainProcessor {
    enum class Mode {
        TRACK,  // Normalize each track individually
        ALBUM,  // Normalize album as whole
        OFF
    }
    
    fun applyReplayGain(
        audioData: ByteArray,
        trackGain: Float?,
        albumGain: Float?,
        mode: Mode
    ): ByteArray {
        val gain = when (mode) {
            Mode.TRACK -> trackGain ?: 0f
            Mode.ALBUM -> albumGain ?: trackGain ?: 0f
            Mode.OFF -> 0f
        }
        
        if (gain == 0f) return audioData
        
        // Apply gain to audio samples
        val multiplier = 10.0.pow(gain / 20.0).toFloat() // dB to linear
        
        return audioData.map { byte ->
            (byte * multiplier).coerceIn(-128f, 127f).toInt().toByte()
        }.toByteArray()
    }
    
    fun parseReplayGainTags(file: File): Pair<Float?, Float?> {
        // Read from ID3v2 or Vorbis comments
        // TXXX:replaygain_track_gain
        // TXXX:replaygain_album_gain
        val trackGain = readTag(file, "replaygain_track_gain")?.toFloatOrNull()
        val albumGain = readTag(file, "replaygain_album_gain")?.toFloatOrNull()
        return trackGain to albumGain
    }
}
```

### 4. Hi-Res Audio Badge

```kotlin
// HiResBadge.kt
@Composable
fun HiResBadge(audioSpecs: AudioSpecs) {
    if (audioSpecs.isHiRes) {
        Badge(
            containerColor = MaterialTheme.colorScheme.primary,
            contentColor = MaterialTheme.colorScheme.onPrimary
        ) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.Default.HighQuality, null, modifier = Modifier.size(16.dp))
                Spacer(Modifier.width(4.dp))
                Text(
                    "${audioSpecs.bitDepth}/${audioSpecs.sampleRate/1000}",
                    fontSize = 10.sp,
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}

data class AudioSpecs(
    val codec: String,
    val sampleRate: Int,
    val bitDepth: Int?,
    val isLossless: Boolean
) {
    val isHiRes: Boolean
        get() = (sampleRate > 48000 || (bitDepth ?: 16) > 16) && isLossless
        
    val qualityLabel: String
        get() = when {
            sampleRate >= 192000 -> "Studio Master"
            sampleRate >= 96000 -> "Hi-Res"
            isLossless -> "Lossless"
            else -> "Lossy"
        }
}
```

---

## 📊 Phase 2: Metadata Management

### MusicBrainz Integration

```kotlin
// MusicBrainzService.kt
class MusicBrainzService {
    private val client = OkHttpClient()
    private val baseUrl = "https://musicbrainz.org/ws/2"
    
    suspend fun lookupByAcoustID(fingerprint: String): TrackInfo? {
        val url = "$baseUrl/recording/?query=acoustid:$fingerprint&fmt=json"
        val response = client.newCall(Request.Builder().url(url).build()).execute()
        
        return response.body?.string()?.let { json ->
            parseTrackInfo(json)
        }
    }
    
    suspend fun searchTrack(
        artist: String,
        title: String,
        album: String?
    ): List<TrackInfo> {
        val query = buildQuery(artist, title, album)
        val url = "$baseUrl/recording/?query=$query&fmt=json"
        
        return fetchAndParse(url)
    }
    
    private fun parseTrackInfo(json: String): TrackInfo {
        // Parse MusicBrainz JSON response
        // Extract: title, artist, album, year, genre, ISRC
    }
}

// AutoTaggerService.kt  
class AutoTaggerService @Inject constructor(
    private val musicBrainz: MusicBrainzService,
    private val acoustIdService: AcoustIDService
) {
    suspend fun autoTag(file: File): TaggingResult {
        // 1. Generate acoustic fingerprint
        val fingerprint = acoustIdService.generateFingerprint(file)
        
        // 2. Lookup on MusicBrainz
        val match = musicBrainz.lookupByAcoustID(fingerprint)
        
        // 3. Update file tags
        if (match != null) {
            updateFileTags(file, match)
            return TaggingResult.Success(match)
        }
        
        return TaggingResult.NoMatch
    }
}
```

---

## 🎛️ Phase 3: Professional EQ

### 10-Band Parametric EQ

```kotlin
// ParametricEQ.kt
class ParametricEQ {
    data class Band(
        val frequency: Float,    // Hz
        val gain: Float,         // dB (-12 to +12)
        val q: Float = 1.0f      // Quality factor
    )
    
    private val bands = listOf(
        Band(32f, 0f),
        Band(64f, 0f),
        Band(125f, 0f),
        Band(250f, 0f),
        Band(500f, 0f),
        Band(1000f, 0f),
        Band(2000f, 0f),
        Band(4000f, 0f),
        Band(8000f, 0f),
        Band(16000f, 0f)
    )
    
    fun applyEQ(
        player: ExoPlayer,
        preset: EQPreset
    ) {
        val equalizer = Equalizer(0, player.audioSessionId)
        equalizer.enabled = true
        
        preset.bands.forEachIndexed { index, band ->
            if (index < equalizer.numberOfBands) {
                val level = (band.gain * 100).toInt().toShort()
                equalizer.setBandLevel(index.toShort(), level)
            }
        }
    }
    
    data class EQPreset(
        val name: String,
        val bands: List<Band>,
        val deviceId: String? = null  // Per-device presets
    )
    
    companion object {
        val FLAT = EQPreset("Flat", List(10) { Band(0f, 0f) })
        val BASS_BOOST = EQPreset("Bass Boost", listOf(
            Band(32f, 6f),
            Band(64f, 4f),
            Band(125f, 2f),
            Band(250f, 0f),
            Band(500f, 0f),
            Band(1000f, 0f),
            Band(2000f, 0f),
            Band(4000f, 0f),
            Band(8000f, 0f),
            Band(16000f, 0f)
        ))
        val VOCAL = EQPreset("Vocal", listOf(
            Band(32f, 0f),
            Band(64f, 0f),
            Band(125f, 0f),
            Band(250f, 3f),
            Band(500f, 4f),
            Band(1000f, 5f),
            Band(2000f, 4f),
            Band(4000f, 2f),
            Band(8000f, 0f),
            Band(16000f, 0f)
        ))
    }
}

// EQ UI
@Composable
fun EqualizerScreen(eq: ParametricEQ) {
    Column {
        eq.bands.forEachIndexed { index, band ->
            EQSlider(
                frequency = "${band.frequency.toInt()} Hz",
                value = band.gain,
                onValueChange = { newGain ->
                    eq.updateBand(index, band.copy(gain = newGain))
                }
            )
        }
    }
}
```

---

## 🚗 Phase 4: Android Auto

```kotlin
// AndroidAutoMediaService.kt
@AndroidEntryPoint
class AndroidAutoMediaService : MediaBrowserServiceCompat() {
    
    override fun onGetRoot(
        clientPackageName: String,
        clientUid: Int,
        rootHints: Bundle?
    ): BrowserRoot {
        return BrowserRoot(ROOT_ID, null)
    }
    
    override fun onLoadChildren(
        parentId: String,
        result: Result<MutableList<MediaBrowserCompat.MediaItem>>
    ) {
        result.detach()
        
        scope.launch {
            val items = when (parentId) {
                ROOT_ID -> buildRootItems()
                "recent" -> loadRecentlyPlayed()
                "playlists" -> loadPlaylists()
                "albums" -> loadAlbums()
                "artists" -> loadArtists()
                else -> emptyList()
            }
            result.sendResult(items.toMutableList())
        }
    }
    
    private fun buildRootItems() = listOf(
        buildMediaItem("recent", "Recently Played", R.drawable.ic_recent),
        buildMediaItem("playlists", "Playlists", R.drawable.ic_playlist),
        buildMediaItem("albums", "Albums", R.drawable.ic_album),
        buildMediaItem("artists", "Artists", R.drawable.ic_artist)
    )
}

// AndroidManifest.xml additions
<service
    android:name=".AndroidAutoMediaService"
    android:exported="true">
    <intent-filter>
        <action android:name="android.media.browse.MediaBrowserService" />
    </intent-filter>
</service>

<meta-data
    android:name="com.google.android.gms.car.application"
    android:resource="@xml/automotive_app_desc" />
```

---

## 📦 Dependencies to Add

### build.gradle.kts
```kotlin
dependencies {
    // Hi-Res Audio
    implementation("androidx.media3:media3-exoplayer-flac:1.2.0")
    implementation("androidx.media3:media3-exoplayer-ffmpeg:1.2.0") // ALAC, DSD
    
    // Metadata
    implementation("org.jaudiotagger:jaudiotagger:2.2.5") // ID3 editing
    implementation("com.squareup.retrofit2:retrofit:2.9.0") // MusicBrainz API
    
    // Audio Processing
    implementation("com.google.android.exoplayer:extension-opus:2.19.1")
    implementation("androidx.media3:media3-effect:1.2.0") // Audio effects
    
    // Android Auto
    implementation("androidx.media:media:1.7.0")
    implementation("androidx.car.app:app-automotive:1.4.0")
    
    // Wear OS
    implementation("androidx.wear:wear:1.3.0")
    implementation("com.google.android.gms:play-services-wearable:18.1.0")
}
```

---

## 🎯 Quick Win Features (1-2 days each)

1. **Audio Quality Display** - Show codec/bitrate in Now Playing
2. **Smart Playlists** - Auto-playlists based on criteria
3. **Quick Settings Tile** - Control playback from quick settings
4. **Headphone Controls** - Customize button actions
5. **Car Mode** - Large buttons, simplified UI

---

## 📋 Testing Checklist

### Audio Quality
- [ ] FLAC files play correctly
- [ ] Hi-res badge shows for 24/96+ files
- [ ] USB DAC detected and selected
- [ ] Gapless playback works
- [ ] ReplayGain normalizes volume
- [ ] No audio artifacts or glitches

### Android Auto
- [ ] Shows up in Android Auto
- [ ] Can browse library
- [ ] Playback controls work
- [ ] Artwork displays
- [ ] Queue management works

### Performance
- [ ] No audio stuttering
- [ ] Battery drain reasonable
- [ ] CPU usage < 10% while playing
- [ ] Memory usage stable

---

This implementation guide provides concrete code examples for the highest priority features identified in the critical analysis.
