# Implementation Guide for Advanced Features

This guide provides step-by-step instructions for integrating the new advanced features into CleverFerret.

## Table of Contents
1. [Database Setup](#database-setup)
2. [Dependency Injection](#dependency-injection)
3. [UI Implementation](#ui-implementation)
4. [Testing](#testing)

---

## Database Setup

### Step 1: Update AppDatabase.kt

Add the new entities to your database:

```kotlin
@Database(
    entities = [
        // Existing entities
        MediaItem::class,
        Library::class,
        // ... other existing entities
        
        // New entities for advanced features
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
    version = 2, // Increment from current version
    exportSchema = true
)
@TypeConverters(
    StringListConverter::class,
    AudioChapterListConverter::class
    // Add any new converters if needed
)
abstract class AppDatabase : RoomDatabase() {
    
    // Existing DAOs
    abstract fun mediaItemDao(): MediaItemDao
    abstract fun libraryDao(): LibraryDao
    // ... other existing DAOs
    
    // New DAOs for advanced features
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
}
```

### Step 2: Create Database Migration

Add to `AppDatabaseMigrations.kt`:

```kotlin
val MIGRATION_1_2 = object : Migration(1, 2) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Create book_sources table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS book_sources (
                sourceId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                sourceName TEXT NOT NULL,
                sourceUrl TEXT NOT NULL,
                sourceGroup TEXT,
                sourceType TEXT NOT NULL,
                enabled INTEGER NOT NULL DEFAULT 1,
                enabledExplore INTEGER NOT NULL DEFAULT 1,
                customOrder INTEGER NOT NULL DEFAULT 0,
                weight INTEGER NOT NULL DEFAULT 0,
                header TEXT,
                loginUrl TEXT,
                loginCheckJs TEXT,
                enabledCookieJar INTEGER NOT NULL DEFAULT 1,
                concurrentRate TEXT,
                jsLib TEXT,
                searchUrl TEXT,
                searchRule TEXT,
                exploreUrl TEXT,
                exploreRule TEXT,
                bookInfoRule TEXT,
                tocRule TEXT,
                contentRule TEXT,
                bookSourceComment TEXT,
                lastUpdateTime INTEGER NOT NULL,
                respondTime INTEGER NOT NULL,
                bookUrlPattern TEXT,
                coverDecodeJs TEXT
            )
        """)
        
        // Create book_chapters table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS book_chapters (
                chapterId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                bookId INTEGER NOT NULL,
                chapterIndex INTEGER NOT NULL,
                chapterName TEXT NOT NULL,
                chapterUrl TEXT,
                content TEXT,
                contentCached INTEGER NOT NULL DEFAULT 0,
                wordCount INTEGER NOT NULL DEFAULT 0,
                isVolume INTEGER NOT NULL DEFAULT 0,
                isVip INTEGER NOT NULL DEFAULT 0,
                isPay INTEGER NOT NULL DEFAULT 0,
                updateTime INTEGER NOT NULL,
                lastReadTime INTEGER,
                readProgress REAL NOT NULL DEFAULT 0.0,
                isRead INTEGER NOT NULL DEFAULT 0,
                FOREIGN KEY(bookId) REFERENCES media_items(itemId) ON DELETE CASCADE
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_book_chapters_bookId ON book_chapters(bookId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_book_chapters_chapterIndex ON book_chapters(chapterIndex)")
        
        // Create reading_analytics table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS reading_analytics (
                analyticsId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                itemId INTEGER NOT NULL,
                date TEXT NOT NULL,
                readingTimeSeconds INTEGER NOT NULL DEFAULT 0,
                pagesRead INTEGER NOT NULL DEFAULT 0,
                wordsRead INTEGER NOT NULL DEFAULT 0,
                sessionCount INTEGER NOT NULL DEFAULT 0,
                averageSessionDuration INTEGER NOT NULL DEFAULT 0,
                firstReadTime INTEGER NOT NULL,
                lastReadTime INTEGER NOT NULL,
                FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_analytics_itemId ON reading_analytics(itemId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_analytics_date ON reading_analytics(date)")
        
        // Create reading_sessions table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS reading_sessions (
                sessionId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                itemId INTEGER NOT NULL,
                startTime INTEGER NOT NULL,
                endTime INTEGER,
                durationSeconds INTEGER NOT NULL DEFAULT 0,
                startProgress REAL NOT NULL DEFAULT 0.0,
                endProgress REAL NOT NULL DEFAULT 0.0,
                pagesRead INTEGER NOT NULL DEFAULT 0,
                deviceInfo TEXT,
                FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_sessions_itemId ON reading_sessions(itemId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_reading_sessions_startTime ON reading_sessions(startTime)")
        
        // Create ai_book_insights table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS ai_book_insights (
                insightId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                itemId INTEGER NOT NULL,
                insightType TEXT NOT NULL,
                summary TEXT,
                mindMap TEXT,
                keyThemes TEXT NOT NULL,
                characterAnalysis TEXT,
                perspectiveAnalysis TEXT,
                generatedAt INTEGER NOT NULL,
                modelUsed TEXT,
                confidence REAL NOT NULL DEFAULT 0.0,
                FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_ai_book_insights_itemId ON ai_book_insights(itemId)")
        
        // Create enhanced_annotations table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS enhanced_annotations (
                annotationId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                itemId INTEGER NOT NULL,
                text TEXT NOT NULL,
                note TEXT,
                quote TEXT,
                chapterId INTEGER,
                chapterName TEXT,
                pageNumber INTEGER,
                position REAL NOT NULL DEFAULT 0.0,
                colorTag TEXT NOT NULL,
                stylePreset TEXT NOT NULL,
                createdAt INTEGER NOT NULL,
                modifiedAt INTEGER NOT NULL,
                aiSummary TEXT,
                aiTranslation TEXT,
                aiInsights TEXT,
                tags TEXT NOT NULL,
                FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_enhanced_annotations_itemId ON enhanced_annotations(itemId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_enhanced_annotations_createdAt ON enhanced_annotations(createdAt)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_enhanced_annotations_colorTag ON enhanced_annotations(colorTag)")
        
        // Create annotation_cards table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS annotation_cards (
                cardId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                annotationId INTEGER NOT NULL,
                template TEXT NOT NULL,
                backgroundColor INTEGER NOT NULL,
                textColor INTEGER NOT NULL,
                accentColor INTEGER NOT NULL,
                includeBookCover INTEGER NOT NULL DEFAULT 1,
                includeBookTitle INTEGER NOT NULL DEFAULT 1,
                includeAuthor INTEGER NOT NULL DEFAULT 1,
                includeTimestamp INTEGER NOT NULL DEFAULT 0,
                imageUrl TEXT,
                generatedAt INTEGER NOT NULL,
                FOREIGN KEY(annotationId) REFERENCES enhanced_annotations(annotationId) ON DELETE CASCADE
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_annotation_cards_annotationId ON annotation_cards(annotationId)")
        
        // Create audio_waveforms table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audio_waveforms (
                waveformId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                itemId INTEGER NOT NULL,
                sampleData BLOB NOT NULL,
                totalSamples INTEGER NOT NULL,
                sampleRate INTEGER NOT NULL,
                channels INTEGER NOT NULL,
                duration INTEGER NOT NULL,
                bitDepth INTEGER NOT NULL DEFAULT 16,
                zoomLevel REAL NOT NULL DEFAULT 1.0,
                renderQuality TEXT NOT NULL,
                generatedAt INTEGER NOT NULL,
                fileHash TEXT,
                version INTEGER NOT NULL DEFAULT 1,
                FOREIGN KEY(itemId) REFERENCES media_items(itemId) ON DELETE CASCADE
            )
        """)
        database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_audio_waveforms_itemId ON audio_waveforms(itemId)")
        
        // Create audio_sync_servers table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audio_sync_servers (
                serverId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                serverName TEXT NOT NULL,
                serverUrl TEXT NOT NULL,
                port INTEGER NOT NULL DEFAULT 1704,
                enabled INTEGER NOT NULL DEFAULT 1,
                isLocalServer INTEGER NOT NULL DEFAULT 0,
                codec TEXT NOT NULL,
                sampleRate INTEGER NOT NULL DEFAULT 48000,
                bitDepth INTEGER NOT NULL DEFAULT 16,
                channels INTEGER NOT NULL DEFAULT 2,
                bufferMs INTEGER NOT NULL DEFAULT 1000,
                latencyMs INTEGER NOT NULL DEFAULT 0,
                lastConnected INTEGER,
                createdAt INTEGER NOT NULL
            )
        """)
        database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_audio_sync_servers_serverName ON audio_sync_servers(serverName)")
        
        // Create audio_sync_clients table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audio_sync_clients (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                serverId INTEGER NOT NULL,
                clientId TEXT NOT NULL,
                clientName TEXT NOT NULL,
                enabled INTEGER NOT NULL DEFAULT 1,
                volume INTEGER NOT NULL DEFAULT 100,
                muted INTEGER NOT NULL DEFAULT 0,
                latencyMs INTEGER NOT NULL DEFAULT 0,
                groupId INTEGER,
                connected INTEGER NOT NULL DEFAULT 0,
                lastSeen INTEGER,
                deviceType TEXT,
                osVersion TEXT,
                appVersion TEXT
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_audio_sync_clients_serverId ON audio_sync_clients(serverId)")
        database.execSQL("CREATE UNIQUE INDEX IF NOT EXISTS index_audio_sync_clients_clientId ON audio_sync_clients(clientId)")
        
        // Create audio_sync_groups table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audio_sync_groups (
                groupId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                serverId INTEGER NOT NULL,
                groupName TEXT NOT NULL,
                enabled INTEGER NOT NULL DEFAULT 1,
                volume INTEGER NOT NULL DEFAULT 100,
                muted INTEGER NOT NULL DEFAULT 0,
                streamId TEXT,
                createdAt INTEGER NOT NULL
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_audio_sync_groups_serverId ON audio_sync_groups(serverId)")
        
        // Create audio_streams table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audio_streams (
                streamId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                serverId INTEGER NOT NULL,
                streamName TEXT NOT NULL,
                streamType TEXT NOT NULL,
                sourceUri TEXT NOT NULL,
                codec TEXT NOT NULL,
                sampleRate INTEGER NOT NULL DEFAULT 48000,
                bitDepth INTEGER NOT NULL DEFAULT 16,
                channels INTEGER NOT NULL DEFAULT 2,
                enabled INTEGER NOT NULL DEFAULT 1,
                playing INTEGER NOT NULL DEFAULT 0,
                createdAt INTEGER NOT NULL
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_audio_streams_serverId ON audio_streams(serverId)")
        
        // Create sync_statistics table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS sync_statistics (
                statId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                clientId TEXT NOT NULL,
                timestamp INTEGER NOT NULL,
                timeDeviationMs REAL NOT NULL DEFAULT 0.0,
                bufferLevel INTEGER NOT NULL DEFAULT 0,
                droppedFrames INTEGER NOT NULL DEFAULT 0,
                latencyMs INTEGER NOT NULL DEFAULT 0,
                jitterMs REAL NOT NULL DEFAULT 0.0,
                packetLoss REAL NOT NULL DEFAULT 0.0
            )
        """)
        database.execSQL("CREATE INDEX IF NOT EXISTS index_sync_statistics_clientId ON sync_statistics(clientId)")
        database.execSQL("CREATE INDEX IF NOT EXISTS index_sync_statistics_timestamp ON sync_statistics(timestamp)")
    }
}

// Update the database builder to include the migration
Room.databaseBuilder(context, AppDatabase::class.java, "clever_ferret_db")
    .addMigrations(MIGRATION_1_2)
    .build()
```

---

## Dependency Injection

### Step 3: Update Hilt Modules

Add the new services to your Hilt modules:

```kotlin
@Module
@InstallIn(SingletonComponent::class)
object ServicesModule {
    
    // Existing service providers...
    
    @Provides
    @Singleton
    fun provideBookSourceService(
        bookSourceDao: BookSourceDao
    ): BookSourceService {
        return BookSourceService(bookSourceDao)
    }
    
    @Provides
    @Singleton
    fun provideReadingAnalyticsService(
        analyticsDao: ReadingAnalyticsDao
    ): ReadingAnalyticsService {
        return ReadingAnalyticsService(analyticsDao)
    }
    
    @Provides
    @Singleton
    fun provideWaveformGeneratorService(
        waveformDao: AudioWaveformDao
    ): WaveformGeneratorService {
        return WaveformGeneratorService(waveformDao)
    }
    
    @Provides
    @Singleton
    fun provideMultiRoomAudioService(
        serverDao: AudioSyncServerDao,
        clientDao: AudioSyncClientDao,
        groupDao: AudioSyncGroupDao,
        streamDao: AudioStreamDao,
        statsDao: SyncStatisticsDao
    ): MultiRoomAudioService {
        return MultiRoomAudioService(serverDao, clientDao, groupDao, streamDao, statsDao)
    }
    
    @Provides
    @Singleton
    fun provideAnnotationExportService(
        annotationDao: EnhancedAnnotationDao
    ): AnnotationExportService {
        return AnnotationExportService(annotationDao)
    }
}

@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {
    
    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            "clever_ferret_db"
        )
        .addMigrations(MIGRATION_1_2)
        .build()
    }
    
    // Existing DAO providers...
    
    @Provides
    fun provideBookSourceDao(database: AppDatabase): BookSourceDao {
        return database.bookSourceDao()
    }
    
    @Provides
    fun provideBookChapterDao(database: AppDatabase): BookChapterDao {
        return database.bookChapterDao()
    }
    
    @Provides
    fun provideReadingAnalyticsDao(database: AppDatabase): ReadingAnalyticsDao {
        return database.readingAnalyticsDao()
    }
    
    @Provides
    fun provideAudioWaveformDao(database: AppDatabase): AudioWaveformDao {
        return database.audioWaveformDao()
    }
    
    @Provides
    fun provideAudioSyncServerDao(database: AppDatabase): AudioSyncServerDao {
        return database.audioSyncServerDao()
    }
    
    @Provides
    fun provideAudioSyncClientDao(database: AppDatabase): AudioSyncClientDao {
        return database.audioSyncClientDao()
    }
    
    @Provides
    fun provideAudioSyncGroupDao(database: AppDatabase): AudioSyncGroupDao {
        return database.audioSyncGroupDao()
    }
    
    @Provides
    fun provideAudioStreamDao(database: AppDatabase): AudioStreamDao {
        return database.audioStreamDao()
    }
    
    @Provides
    fun provideSyncStatisticsDao(database: AppDatabase): SyncStatisticsDao {
        return database.syncStatisticsDao()
    }
    
    @Provides
    fun provideEnhancedAnnotationDao(database: AppDatabase): EnhancedAnnotationDao {
        return database.enhancedAnnotationDao()
    }
}
```

---

## UI Implementation

### Step 4: Create ViewModels

Example ViewModel for Reading Analytics:

```kotlin
@HiltViewModel
class ReadingAnalyticsViewModel @Inject constructor(
    private val readingAnalyticsService: ReadingAnalyticsService
) : ViewModel() {
    
    private val _readingStats = MutableStateFlow<ReadingStats?>(null)
    val readingStats: StateFlow<ReadingStats?> = _readingStats.asStateFlow()
    
    private val _currentSession = MutableStateFlow<ReadingSession?>(null)
    val currentSession: StateFlow<ReadingSession?> = _currentSession.asStateFlow()
    
    fun loadReadingStats(period: TimePeriod) {
        viewModelScope.launch {
            val stats = readingAnalyticsService.getReadingStats(period)
            _readingStats.value = stats
        }
    }
    
    fun startReadingSession(itemId: Long, startProgress: Float) {
        viewModelScope.launch {
            readingAnalyticsService.startReadingSession(itemId, startProgress)
        }
    }
    
    fun endReadingSession(endProgress: Float, pagesRead: Int) {
        viewModelScope.launch {
            readingAnalyticsService.endCurrentSession(endProgress, pagesRead)
        }
    }
}
```

### Step 5: Create Compose UI Components

Example Composable for Reading Stats:

```kotlin
@Composable
fun ReadingStatsScreen(
    viewModel: ReadingAnalyticsViewModel = hiltViewModel()
) {
    val stats by viewModel.readingStats.collectAsState()
    
    LaunchedEffect(Unit) {
        viewModel.loadReadingStats(TimePeriod.WEEKLY)
    }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "Reading Statistics",
            style = MaterialTheme.typography.headlineMedium
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        stats?.let { s ->
            StatCard(
                title = "Total Reading Time",
                value = "${s.totalReadingTimeSeconds / 3600} hours"
            )
            
            StatCard(
                title = "Pages Read",
                value = s.totalPagesRead.toString()
            )
            
            StatCard(
                title = "Reading Sessions",
                value = s.totalSessions.toString()
            )
            
            StatCard(
                title = "Days Read",
                value = s.daysRead.toString()
            )
            
            // Heatmap visualization
            ReadingHeatmap(heatmapData = s.heatmapData)
        }
    }
}

@Composable
fun StatCard(title: String, value: String) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyMedium
            )
            Text(
                text = value,
                style = MaterialTheme.typography.headlineSmall
            )
        }
    }
}
```

---

## Testing

### Step 6: Unit Tests

Create unit tests for services:

```kotlin
@RunWith(MockitoJUnitRunner::class)
class ReadingAnalyticsServiceTest {
    
    @Mock
    private lateinit var analyticsDao: ReadingAnalyticsDao
    
    private lateinit var service: ReadingAnalyticsService
    
    @Before
    fun setup() {
        service = ReadingAnalyticsService(analyticsDao)
    }
    
    @Test
    fun `startReadingSession creates new session`() = runTest {
        val itemId = 1L
        val startProgress = 0.5f
        
        whenever(analyticsDao.insertSession(any())).thenReturn(1L)
        
        val sessionId = service.startReadingSession(itemId, startProgress)
        
        assertEquals(1L, sessionId)
        verify(analyticsDao).insertSession(any())
    }
    
    @Test
    fun `endCurrentSession updates analytics`() = runTest {
        // Start a session first
        service.startReadingSession(1L, 0.5f)
        
        // End the session
        service.endCurrentSession(0.6f, 10)
        
        verify(analyticsDao).endSession(any(), any(), any(), any())
    }
}
```

### Step 7: Integration Tests

```kotlin
@RunWith(AndroidJUnit4::class)
class BookSourceIntegrationTest {
    
    @get:Rule
    val hiltRule = HiltAndroidRule(this)
    
    @Inject
    lateinit var bookSourceService: BookSourceService
    
    @Inject
    lateinit var database: AppDatabase
    
    @Before
    fun setup() {
        hiltRule.inject()
    }
    
    @After
    fun teardown() {
        database.close()
    }
    
    @Test
    fun testAddAndRetrieveBookSource() = runTest {
        val bookSource = BookSource(
            sourceName = "Test Source",
            sourceUrl = "https://test.com",
            sourceType = BookSourceType.TEXT
        )
        
        val sourceId = bookSourceService.addBookSource(bookSource)
        val retrieved = bookSourceService.getBookSourceById(sourceId)
        
        assertNotNull(retrieved)
        assertEquals("Test Source", retrieved?.sourceName)
    }
}
```

---

## Next Steps

1. **Implement UI Components**: Create Compose screens for each feature
2. **Add Navigation**: Integrate new screens into navigation graph
3. **Implement Network Layer**: Add HTTP client for book sources
4. **Add AI Integration**: Connect to AI services for insights
5. **Implement Sync Protocol**: Add Snapcast protocol implementation
6. **Create Waveform View**: Custom Compose component for waveforms
7. **Add Settings**: Configuration screens for all features
8. **Write Documentation**: User guides and API documentation

---

## Troubleshooting

### Common Issues

1. **Migration Errors**: Ensure all table names and column names match exactly
2. **Type Converter Issues**: Add custom type converters for complex types
3. **Dependency Injection**: Verify all dependencies are properly provided
4. **Performance**: Use indexes on frequently queried columns
5. **Memory**: Implement pagination for large datasets

---

## Support

For questions or issues with implementation, please refer to:
- CleverFerret documentation
- Android Room documentation
- Jetpack Compose documentation
- Hilt documentation