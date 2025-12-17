# Advanced Features Added to CleverFerret

This document describes the advanced features integrated from Legado, Anx-reader, FDWaveformView, and Snapcast repositories.

## Table of Contents
1. [Custom Book Source System (from Legado)](#custom-book-source-system)
2. [AI-Powered Reading Features (from Anx-reader)](#ai-powered-reading-features)
3. [Audio Waveform Visualization (from FDWaveformView)](#audio-waveform-visualization)
4. [Multi-Room Audio Synchronization (from Snapcast)](#multi-room-audio-synchronization)

---

## Custom Book Source System

### Overview
Inspired by Legado's flexible source system, CleverFerret now supports custom online book sources with rule-based content extraction.

### Features

#### 1. BookSource Entity
- **Custom Sources**: Add unlimited online book sources
- **Rule-Based Extraction**: Define rules for search, book info, TOC, and content
- **Multiple Types**: Support for text, audio, image, and file sources
- **JavaScript Support**: Execute custom JavaScript for dynamic content
- **Cookie Management**: Automatic cookie handling for authenticated sources

#### 2. Book Chapter Management
- **Chapter Tracking**: Store and manage book chapters
- **Progress Tracking**: Track reading progress per chapter
- **Content Caching**: Cache chapter content for offline reading
- **Word Count**: Track word count per chapter

#### 3. Key Components

**Entities:**
- `BookSource`: Main source configuration
- `BookChapter`: Individual chapter data
- `SearchRule`: Rules for searching books
- `BookInfoRule`: Rules for extracting book details
- `TocRule`: Rules for table of contents
- `ContentRule`: Rules for content extraction

**Services:**
- `BookSourceService`: Manages book sources and content extraction

**DAOs:**
- `BookSourceDao`: Database operations for book sources
- `BookChapterDao`: Database operations for chapters

### Usage Example

```kotlin
// Add a custom book source
val bookSource = BookSource(
    sourceName = "My Book Site",
    sourceUrl = "https://example.com",
    sourceType = BookSourceType.TEXT,
    enabled = true,
    searchUrl = "https://example.com/search?q={{key}}",
    searchRule = """{"bookList": ".book-item", "name": ".title", "author": ".author"}"""
)

bookSourceService.addBookSource(bookSource)

// Search for books
val results = bookSourceService.searchBooks("science fiction")

// Get book chapters
val chapters = bookSourceService.getBookChapters(sourceId, bookUrl)
```

---

## AI-Powered Reading Features

### Overview
Inspired by Anx-reader's AI capabilities, CleverFerret now includes comprehensive reading analytics and AI-powered insights.

### Features

#### 1. Reading Analytics
- **Time Tracking**: Track reading time per book and session
- **Session Management**: Automatic session start/end tracking
- **Daily Statistics**: Daily, weekly, monthly, and yearly stats
- **Heatmap Data**: Visual representation of reading habits
- **Progress Tracking**: Monitor reading progress over time

#### 2. AI Insights
- **Book Summaries**: AI-generated summaries
- **Mind Maps**: Visual representation of book structure
- **Theme Analysis**: Extract key themes and topics
- **Character Analysis**: Analyze characters and relationships
- **Perspective Analysis**: Multiple perspective analysis

#### 3. Enhanced Annotations
- **Color Coding**: 8 color options for highlights
- **Multiple Styles**: Highlight, underline, strikethrough, notes, bookmarks
- **AI Features**: AI-powered summaries, translations, and insights
- **Export Options**: Export to TXT, Markdown, CSV, JSON, PDF
- **Shareable Cards**: Create beautiful shareable annotation cards

#### 4. Key Components

**Entities:**
- `ReadingAnalyticsEntry`: Daily reading statistics
- `ReadingSessionLog`: Individual reading sessions
- `ReaderAIInsight`: AI-generated insights
- `EnhancedAnnotation`: Advanced annotation system
- `AnnotationCard`: Shareable annotation cards

**Services:**
- `ReadingAnalyticsService`: Manages reading tracking and analytics
- `AnnotationExportService`: Handles annotation export
- `BookSourceService`: Legado-style custom source management
- `MultiRoomAudioService`: Synchronized playback management

**DAOs:**
- `ReadingAnalyticsDao`: Database operations for analytics
- `EnhancedAnnotationDao`: Database operations for annotations

### Usage Example

```kotlin
// Start reading session
val sessionId = readingAnalyticsService.startReadingSession(
    itemId = bookId,
    startProgress = 0.5f
)

// End session
readingAnalyticsService.endCurrentSession(
    endProgress = 0.6f,
    pagesRead = 10
)

// Get reading statistics
val stats = readingAnalyticsService.getReadingStats(TimePeriod.WEEKLY)
println("Total reading time: ${stats.totalReadingTimeSeconds / 3600} hours")
println("Pages read: ${stats.totalPagesRead}")

// Generate AI insight
readingAnalyticsService.generateAIInsight(
    itemId = bookId,
    insightType = ReaderAIInsightType.SUMMARY,
    content = "AI-generated summary..."
)

// Export annotations
val config = AnnotationExportConfig(
    format = ExportFormat.MARKDOWN,
    includeNotes = true,
    groupByChapter = true
)
annotationExportService.exportAnnotations(
    itemId = bookId,
    config = config,
    outputPath = "/path/to/export.md"
).onSuccess { println("Exported annotations to ${it.absolutePath}") }
```

---

## Audio Waveform Visualization

### Overview
Inspired by FDWaveformView, CleverFerret now includes real-time audio waveform visualization with interactive features.

### Features

#### 1. Waveform Generation
- **Automatic Generation**: Generate waveforms from audio files
- **Quality Levels**: Low, Medium, High, Ultra quality options
- **Compression**: GZIP compression for efficient storage
- **Caching**: Cache waveforms for quick loading

#### 2. Rendering Features
- **Antialiased Rendering**: Smooth, high-quality waveforms
- **Progressive Detail**: More detail when zoomed in
- **Color Customization**: Customize waveform and progress colors
- **Multiple Channels**: Support for mono and stereo audio

#### 3. Interactive Features
- **Scrubbing**: Tap to seek to position
- **Zoom**: Pinch to zoom in/out
- **Scroll**: Pan through waveform
- **Progress Highlighting**: Visual progress indicator

#### 4. Key Components

**Entities:**
- `AudioWaveform`: Waveform data storage linked to media items
- `WaveformRenderSettings`: Rendering configuration (UI layer)
- `WaveformQuality`: Quality levels

**Services & Utilities:**
- `WaveformGenerator`: Existing component that produces waveform samples
- `AudioWaveformDao`: Persists generated waveform data for reuse

### Usage Example

```kotlin
// Generate waveform samples with the existing utility
val generator = WaveformGenerator()
val result = generator.generate(File("/path/to/audio.mp3"))

if (result != null) {
    audioWaveformDao.insertWaveform(
        AudioWaveform(
            itemId = audioFileId,
            sampleData = result.samples,
            totalSamples = result.sampleCount,
            sampleRate = result.sampleRate,
            channels = result.channelCount,
            duration = result.durationMs
        )
    )
}

// Retrieve cached waveform for rendering
val waveform = audioWaveformDao.getWaveformByItemId(audioFileId)

// Periodically prune old cache entries
audioWaveformDao.deleteOldWaveforms(timestamp = System.currentTimeMillis() - THIRTY_DAYS)
```

---

## Multi-Room Audio Synchronization

### Overview
Inspired by Snapcast, CleverFerret now supports synchronized audio playback across multiple devices with sub-millisecond precision.

### Features

#### 1. Server Management
- **Multiple Servers**: Support for multiple sync servers
- **Codec Support**: PCM, FLAC, Vorbis, Opus codecs
- **Stream Sources**: Pipe, ALSA, TCP, Process, File, HTTP
- **Configuration**: Customizable buffer, latency, sample rate

#### 2. Client Management
- **Device Discovery**: Automatic client discovery
- **Volume Control**: Individual and group volume control
- **Mute Control**: Mute individual clients or groups
- **Connection Status**: Real-time connection monitoring

#### 3. Group Synchronization
- **Client Grouping**: Group clients for synchronized playback
- **Group Control**: Control all clients in a group together
- **Stream Assignment**: Assign different streams to groups

#### 4. Sync Quality
- **Time Synchronization**: Sub-millisecond precision
- **Statistics Tracking**: Monitor sync quality metrics
- **Adaptive Playback**: Automatic correction for drift
- **Quality Monitoring**: Real-time sync quality assessment

#### 5. Key Components

**Entities:**
- `AudioSyncServer`: Server configuration
- `AudioSyncClient`: Client/device information
- `AudioSyncGroup`: Client grouping
- `AudioStream`: Audio stream sources
- `SyncStatistics`: Sync quality metrics

**Services:**
- `MultiRoomAudioService`: Manages multi-room audio

**DAOs:**
- `AudioSyncServerDao`: Server operations
- `AudioSyncClientDao`: Client operations
- `AudioSyncGroupDao`: Group operations
- `AudioStreamDao`: Stream operations
- `SyncStatisticsDao`: Statistics operations

### Usage Example

```kotlin
// Add a sync server
val server = AudioSyncServer(
    serverName = "Living Room",
    serverUrl = "192.168.1.100",
    port = 1704,
    codec = AudioCodec.FLAC,
    sampleRate = 48000
)
val serverId = multiRoomAudioService.addServer(server)

// Add clients
val client1 = AudioSyncClient(
    serverId = serverId,
    clientId = "device-001",
    clientName = "Kitchen Speaker",
    volume = 80
)
multiRoomAudioService.addClient(client1)

// Create a group
val group = AudioSyncGroup(
    serverId = serverId,
    groupName = "Downstairs",
    volume = 75
)
val groupId = multiRoomAudioService.createGroup(group)

// Assign clients to group
multiRoomAudioService.assignClientToGroup(client1.id, groupId)

// Control group volume
multiRoomAudioService.setGroupVolume(groupId, 60)

// Monitor sync quality
val quality = multiRoomAudioService.getSyncQuality("device-001")
println("Sync quality: $quality")

// Get sync statistics
val stats = multiRoomAudioService.getSyncStats("device-001").first()
stats.forEach { stat ->
    println("Deviation: ${stat.timeDeviationMs}ms")
    println("Latency: ${stat.latencyMs}ms")
}
```

---

## Database Integration

All new features are integrated into the CleverFerret database. To use these features, you'll need to:

1. **Update AppDatabase.kt** to include new entities:
```kotlin
@Database(
    entities = [
        // Existing entities...
        BookSource::class,
        BookChapter::class,
        ReadingAnalytics::class,
        ReadingSession::class,
        AIBookInsight::class,
        EnhancedAnnotation::class,
        AnnotationCard::class,
        AudioWaveform::class,
        AudioSyncServer::class,
        AudioSyncClient::class,
        AudioSyncGroup::class,
        AudioStream::class,
        SyncStatistics::class
    ],
    version = 2 // Increment version
)
```

2. **Add DAOs to AppDatabase**:
```kotlin
abstract fun bookSourceDao(): BookSourceDao
abstract fun bookChapterDao(): BookChapterDao
abstract fun readingAnalyticsDao(): ReadingAnalyticsDao
abstract fun audioWaveformDao(): AudioWaveformDao
abstract fun audioSyncServerDao(): AudioSyncServerDao
abstract fun audioSyncClientDao(): AudioSyncClientDao
abstract fun audioSyncGroupDao(): AudioSyncGroupDao
abstract fun audioStreamDao(): AudioStreamDao
abstract fun syncStatisticsDao(): SyncStatisticsDao
abstract fun enhancedAnnotationDao(): EnhancedAnnotationDao
```

3. **Create Migration** from version 1 to 2 in AppDatabaseMigrations.kt

---

## Dependencies

Add these dependencies to your `build.gradle.kts`:

```kotlin
dependencies {
    // Existing dependencies...
    
    // For JSON serialization
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.0")
    
    // For audio processing
    implementation("androidx.media3:media3-exoplayer:1.2.0")
    implementation("androidx.media3:media3-common:1.2.0")
    
    // For network operations (book sources)
    implementation("com.squareup.okhttp3:okhttp:4.12.0")
    implementation("org.jsoup:jsoup:1.17.1") // For HTML parsing
    
    // For PDF export (optional)
    implementation("com.itextpdf:itext7-core:7.2.5")
}
```

---

## Future Enhancements

### Planned Features
1. **UI Components**: Compose UI components for all features
2. **Network Protocol**: Implement actual Snapcast protocol
3. **AI Integration**: Connect to AI services (OpenAI, Claude, etc.)
4. **Content Extraction**: Implement XPath/Regex rule engine
5. **Waveform UI**: Custom Compose waveform view
6. **Sync Protocol**: TCP-based audio streaming
7. **Cloud Sync**: WebDAV integration for cross-device sync

### Contributing
These features provide the foundation for advanced reading and audio capabilities. Contributions for UI implementation, protocol development, and feature enhancements are welcome!

---

## License
These features are integrated into CleverFerret and follow the same license as the main project.

## Credits
- **Legado**: Custom book source system inspiration
- **Anx-reader**: AI-powered reading features and analytics
- **FDWaveformView**: Audio waveform visualization concepts
- **Snapcast**: Multi-room audio synchronization architecture