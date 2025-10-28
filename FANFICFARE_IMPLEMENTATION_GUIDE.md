# FanFicFare Implementation Guide for CleverFerret

**Priority**: ⭐⭐⭐⭐⭐ HIGHEST  
**Status**: Foundation code exists (disabled)  
**Effort**: Medium (2-3 weeks for core features)  
**Impact**: HIGH - Core differentiating feature

---

## 🎯 Executive Summary

FanFicFare is the #1 priority Calibre plugin for CleverFerret because:

1. **Foundation exists** - CleverFerret already has disabled fanfiction converter code
2. **User demand** - Huge fanfiction audience (AO3 alone has 10M+ works)
3. **Differentiation** - Not many mobile apps support fanfic downloading
4. **Proven pattern** - FanFicFare has 10+ years of development
5. **90+ sites** - Comprehensive coverage of fanfic ecosystem

---

## 📚 What is FanFicFare?

FanFicFare is Calibre's most popular plugin for downloading fanfiction from various sites and converting them to EPUB format.

### Supported Sites (90+)

**Tier 1 - Must Have**:
- **Archive of Our Own (AO3)** - archiveofourown.org
- **FanFiction.Net (FFN)** - fanfiction.net
- **Wattpad** - wattpad.com
- **Royal Road** - royalroad.com
- **ScribbleHub** - scribblehub.com

**Tier 2 - Should Have**:
- FictionPress - fictionpress.com
- SpaceBattles - forums.spacebattles.com
- Sufficient Velocity - forums.sufficientvelocity.com
- QuestionableQuesting - forum.questionablequesting.com
- Webnovel - webnovel.com

**Tier 3 - Nice to Have**:
- 80+ additional sites

### Key Features

1. **Rich Metadata Extraction**:
   - Title, author, summary
   - Publication/update dates
   - Word count, chapter count
   - Ratings, warnings, tags
   - Characters, relationships, fandoms
   - Completion status

2. **Smart Downloading**:
   - Complete stories
   - Specific chapter ranges
   - Update detection (only new chapters)
   - Multi-chapter handling

3. **Quality Output**:
   - Well-formatted EPUBs
   - Proper TOC
   - Chapter titles/numbering
   - Author notes
   - Inline images
   - Cover images

4. **Configuration**:
   - Per-site settings
   - Per-story settings
   - Format options
   - Metadata customization

---

## 🏗️ Architecture

### FanFicFare's Pattern

```python
# FanFicFare uses a site adapter pattern
class BaseSiteAdapter:
    def __init__(self, url):
        self.url = url
    
    def extractChapterUrls(self):
        # Get list of chapter URLs
        pass
    
    def getMetadata(self):
        # Extract story metadata
        pass
    
    def getChapterText(self, url):
        # Get chapter content
        pass

# Each site has its own adapter
class ArchiveOfOurOwnAdapter(BaseSiteAdapter):
    # AO3-specific implementation
    pass

class FanFictionNetAdapter(BaseSiteAdapter):
    # FFN-specific implementation
    pass
```

### CleverFerret Adaptation

```kotlin
// Site Adapter Interface
interface FanfictionSiteAdapter {
    val siteName: String
    val baseUrl: String
    val supportedUrlPatterns: List<Regex>
    
    fun canHandle(url: String): Boolean
    suspend fun extractMetadata(url: String): StoryMetadata
    suspend fun downloadChapters(url: String, progressCallback: (Int, Int) -> Unit): List<Chapter>
    suspend fun checkForUpdates(storyId: String, lastChapter: Int): UpdateInfo
}

// Metadata Model
data class StoryMetadata(
    val title: String,
    val author: String,
    val authorUrl: String?,
    val summary: String,
    val rating: String?,
    val warnings: List<String>,
    val fandoms: List<String>,
    val characters: List<String>,
    val relationships: List<String>,
    val tags: List<String>,
    val language: String,
    val status: CompletionStatus, // IN_PROGRESS, COMPLETE
    val wordCount: Int,
    val chapterCount: Int,
    val publishDate: LocalDate,
    val updateDate: LocalDate,
    val coverUrl: String?,
    val sourceUrl: String,
    val sourceSite: String
)

// Chapter Model
data class Chapter(
    val number: Int,
    val title: String,
    val content: String, // HTML
    val authorNote: String?,
    val wordCount: Int
)

// Update Info
data class UpdateInfo(
    val hasUpdates: Boolean,
    val newChapters: Int,
    val currentChapterCount: Int,
    val lastUpdateDate: LocalDate
)

// Service
@Singleton
class FanfictionDownloadService @Inject constructor(
    private val httpClient: OkHttpClient,
    private val epubCreator: EpubCreator,
    private val database: CleverFerretDatabase
) {
    private val adapters = listOf(
        AO3Adapter(httpClient),
        FFNAdapter(httpClient),
        RoyalRoadAdapter(httpClient),
        // ... more adapters
    )
    
    suspend fun downloadStory(url: String): Result<String> {
        val adapter = findAdapter(url) ?: return Result.failure(Exception("Unsupported site"))
        
        // 1. Extract metadata
        val metadata = adapter.extractMetadata(url)
        
        // 2. Download chapters with progress
        val chapters = adapter.downloadChapters(url) { current, total ->
            // Update progress
        }
        
        // 3. Generate EPUB
        val epubPath = epubCreator.createFanfictionEpub(metadata, chapters)
        
        // 4. Add to library
        addToLibrary(metadata, epubPath)
        
        return Result.success(epubPath)
    }
    
    private fun findAdapter(url: String): FanfictionSiteAdapter? {
        return adapters.find { it.canHandle(url) }
    }
}
```

---

## 🎨 Archive of Our Own (AO3) Adapter

AO3 is the BEST site to start with because:
- Clean HTML structure
- "View entire work" option (easier scraping)
- Rich, well-structured metadata
- No rate limiting (reasonable use)
- No login required for most content
- Most popular fanfic site

### Implementation

```kotlin
class AO3Adapter @Inject constructor(
    private val httpClient: OkHttpClient
) : FanfictionSiteAdapter {
    
    override val siteName = "Archive of Our Own"
    override val baseUrl = "https://archiveofourown.org"
    override val supportedUrlPatterns = listOf(
        Regex("https?://(?:www\\.)?archiveofourown\\.org/works/(\\d+)")
    )
    
    override fun canHandle(url: String): Boolean {
        return supportedUrlPatterns.any { it.matches(url) }
    }
    
    override suspend fun extractMetadata(url: String): StoryMetadata = withContext(Dispatchers.IO) {
        val workId = extractWorkId(url)
        val doc = fetchDocument("$baseUrl/works/$workId?view_full_work=true")
        
        StoryMetadata(
            title = doc.select("h2.title").text().trim(),
            author = doc.select("h3.byline a[rel=author]").text().trim(),
            authorUrl = doc.select("h3.byline a[rel=author]").attr("abs:href"),
            summary = doc.select("div.summary div.userstuff").html(),
            rating = doc.select("dd.rating a.tag").text(),
            warnings = doc.select("dd.warning a.tag").map { it.text() },
            fandoms = doc.select("dd.fandom a.tag").map { it.text() },
            characters = doc.select("dd.character a.tag").map { it.text() },
            relationships = doc.select("dd.relationship a.tag").map { it.text() },
            tags = doc.select("dd.freeform a.tag").map { it.text() },
            language = doc.select("dd.language").text(),
            status = if (doc.select("dt.status").text().contains("Complete")) 
                CompletionStatus.COMPLETE else CompletionStatus.IN_PROGRESS,
            wordCount = doc.select("dd.words").text().replace(",", "").toIntOrNull() ?: 0,
            chapterCount = extractChapterCount(doc),
            publishDate = parseDate(doc.select("dd.published").text()),
            updateDate = parseDate(doc.select("dd.status").text()),
            coverUrl = null, // AO3 doesn't have built-in covers
            sourceUrl = url,
            sourceSite = siteName
        )
    }
    
    override suspend fun downloadChapters(
        url: String, 
        progressCallback: (Int, Int) -> Unit
    ): List<Chapter> = withContext(Dispatchers.IO) {
        val workId = extractWorkId(url)
        val doc = fetchDocument("$baseUrl/works/$workId?view_full_work=true")
        
        val chapters = mutableListOf<Chapter>()
        val chapterElements = doc.select("div#chapters div.chapter")
        
        chapterElements.forEachIndexed { index, element ->
            val chapter = Chapter(
                number = index + 1,
                title = element.select("h3.title").text().trim()
                    .removePrefix("${index + 1}.").trim(),
                content = element.select("div.userstuff").html(),
                authorNote = element.select("div.notes").html()
                    .takeIf { it.isNotBlank() },
                wordCount = countWords(element.select("div.userstuff").text())
            )
            chapters.add(chapter)
            progressCallback(index + 1, chapterElements.size)
        }
        
        chapters
    }
    
    override suspend fun checkForUpdates(storyId: String, lastChapter: Int): UpdateInfo {
        val doc = fetchDocument("$baseUrl/works/$storyId")
        val currentChapters = extractChapterCount(doc)
        
        return UpdateInfo(
            hasUpdates = currentChapters > lastChapter,
            newChapters = (currentChapters - lastChapter).coerceAtLeast(0),
            currentChapterCount = currentChapters,
            lastUpdateDate = parseDate(doc.select("dd.status").text())
        )
    }
    
    // Helper functions
    private fun extractWorkId(url: String): String {
        return supportedUrlPatterns.first().find(url)?.groupValues?.get(1) 
            ?: throw IllegalArgumentException("Invalid AO3 URL")
    }
    
    private suspend fun fetchDocument(url: String): Document {
        val request = Request.Builder()
            .url(url)
            .header("User-Agent", "CleverFerret/1.0 (Android)")
            .build()
        
        val response = httpClient.newCall(request).await()
        return Jsoup.parse(response.body?.string() ?: "")
    }
    
    private fun extractChapterCount(doc: Document): Int {
        val chaptersText = doc.select("dd.chapters").text() // e.g., "10/15" or "15/15"
        return chaptersText.split("/").firstOrNull()?.toIntOrNull() ?: 1
    }
    
    private fun parseDate(dateStr: String): LocalDate {
        // AO3 format: "2023-10-27"
        return LocalDate.parse(dateStr, DateTimeFormatter.ISO_LOCAL_DATE)
    }
    
    private fun countWords(text: String): Int {
        return text.split(Regex("\\s+")).count { it.isNotBlank() }
    }
}

// OkHttp suspend extension
private suspend fun Call.await(): Response {
    return suspendCancellableCoroutine { continuation ->
        continuation.invokeOnCancellation {
            cancel()
        }
        enqueue(object : Callback {
            override fun onResponse(call: Call, response: Response) {
                continuation.resume(response)
            }
            override fun onFailure(call: Call, e: IOException) {
                continuation.resumeWithException(e)
            }
        })
    }
}
```

---

## 📱 UI Components

### 1. Download Screen

```kotlin
@Composable
fun FanfictionDownloadScreen(
    viewModel: FanfictionViewModel = hiltViewModel()
) {
    var url by remember { mutableStateOf("") }
    val downloadState by viewModel.downloadState.collectAsState()
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "Download Fanfiction",
            style = MaterialTheme.typography.headlineMedium
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        OutlinedTextField(
            value = url,
            onValueChange = { url = it },
            label = { Text("Story URL") },
            placeholder = { Text("Paste URL from AO3, FFN, etc.") },
            modifier = Modifier.fillMaxWidth(),
            singleLine = false,
            maxLines = 3
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Button(
                onClick = { viewModel.downloadStory(url) },
                enabled = url.isNotBlank() && downloadState !is DownloadState.Downloading,
                modifier = Modifier.weight(1f)
            ) {
                Text("Download")
            }
            
            OutlinedButton(
                onClick = { url = "" },
                modifier = Modifier.weight(1f)
            ) {
                Text("Clear")
            }
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        // Download status
        when (val state = downloadState) {
            is DownloadState.Idle -> {
                // Show examples
                ExampleUrls { exampleUrl ->
                    url = exampleUrl
                }
            }
            is DownloadState.Downloading -> {
                DownloadProgress(state)
            }
            is DownloadState.Success -> {
                SuccessMessage(state.metadata)
            }
            is DownloadState.Error -> {
                ErrorMessage(state.error)
            }
        }
    }
}

@Composable
fun DownloadProgress(state: DownloadState.Downloading) {
    Column {
        Text(
            text = "Downloading: ${state.currentStep}",
            style = MaterialTheme.typography.titleMedium
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        LinearProgressIndicator(
            progress = state.progress,
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(4.dp))
        
        Text(
            text = "${(state.progress * 100).toInt()}% - Chapter ${state.currentChapter}/${state.totalChapters}",
            style = MaterialTheme.typography.bodySmall
        )
    }
}

@Composable
fun ExampleUrls(onUrlClick: (String) -> Unit) {
    Column {
        Text(
            text = "Supported Sites",
            style = MaterialTheme.typography.titleMedium
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        ExampleUrlCard(
            siteName = "Archive of Our Own (AO3)",
            example = "https://archiveofourown.org/works/12345",
            onClick = { onUrlClick("https://archiveofourown.org/works/39508592") }
        )
        
        ExampleUrlCard(
            siteName = "FanFiction.Net",
            example = "https://www.fanfiction.net/s/12345/1/Story-Title",
            onClick = { onUrlClick("") }
        )
        
        ExampleUrlCard(
            siteName = "Royal Road",
            example = "https://www.royalroad.com/fiction/12345/story-title",
            onClick = { onUrlClick("") }
        )
    }
}
```

### 2. ViewModel

```kotlin
@HiltViewModel
class FanfictionViewModel @Inject constructor(
    private val fanficService: FanfictionDownloadService
) : ViewModel() {
    
    private val _downloadState = MutableStateFlow<DownloadState>(DownloadState.Idle)
    val downloadState: StateFlow<DownloadState> = _downloadState.asStateFlow()
    
    fun downloadStory(url: String) {
        if (url.isBlank()) return
        
        viewModelScope.launch {
            _downloadState.value = DownloadState.Downloading(
                currentStep = "Initializing...",
                progress = 0f,
                currentChapter = 0,
                totalChapters = 0
            )
            
            try {
                val result = fanficService.downloadStory(url) { current, total ->
                    _downloadState.value = DownloadState.Downloading(
                        currentStep = "Downloading chapters",
                        progress = current.toFloat() / total,
                        currentChapter = current,
                        totalChapters = total
                    )
                }
                
                result.onSuccess { metadata ->
                    _downloadState.value = DownloadState.Success(metadata)
                }.onFailure { error ->
                    _downloadState.value = DownloadState.Error(error.message ?: "Unknown error")
                }
            } catch (e: Exception) {
                _downloadState.value = DownloadState.Error(e.message ?: "Download failed")
            }
        }
    }
}

sealed class DownloadState {
    object Idle : DownloadState()
    data class Downloading(
        val currentStep: String,
        val progress: Float,
        val currentChapter: Int,
        val totalChapters: Int
    ) : DownloadState()
    data class Success(val metadata: StoryMetadata) : DownloadState()
    data class Error(val error: String) : DownloadState()
}
```

---

## 🗄️ Database Schema

```kotlin
@Entity(tableName = "fanfiction_stories")
data class FanfictionStoryEntity(
    @PrimaryKey val id: String, // Generated from URL
    val sourceUrl: String,
    val sourceSite: String,
    val title: String,
    val author: String,
    val authorUrl: String?,
    val summary: String,
    val rating: String?,
    val status: String,
    val wordCount: Int,
    val chapterCount: Int,
    val lastChapterDownloaded: Int,
    val publishDate: Long,
    val updateDate: Long,
    val lastCheckedDate: Long,
    val epubPath: String?,
    val coverPath: String?,
    @TypeConverters(StringListConverter::class)
    val warnings: List<String>,
    @TypeConverters(StringListConverter::class)
    val fandoms: List<String>,
    @TypeConverters(StringListConverter::class)
    val characters: List<String>,
    @TypeConverters(StringListConverter::class)
    val relationships: List<String>,
    @TypeConverters(StringListConverter::class)
    val tags: List<String>
)

@Dao
interface FanfictionDao {
    @Query("SELECT * FROM fanfiction_stories ORDER BY updateDate DESC")
    fun getAllStories(): Flow<List<FanfictionStoryEntity>>
    
    @Query("SELECT * FROM fanfiction_stories WHERE id = :id")
    suspend fun getStoryById(id: String): FanfictionStoryEntity?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStory(story: FanfictionStoryEntity)
    
    @Query("SELECT * FROM fanfiction_stories WHERE status = 'IN_PROGRESS'")
    suspend fun getInProgressStories(): List<FanfictionStoryEntity>
    
    @Query("UPDATE fanfiction_stories SET lastCheckedDate = :timestamp WHERE id = :id")
    suspend fun updateLastChecked(id: String, timestamp: Long)
}
```

---

## 🔄 Update Checking

```kotlin
class FanfictionUpdateService @Inject constructor(
    private val fanficDao: FanfictionDao,
    private val downloadService: FanfictionDownloadService
) {
    suspend fun checkForUpdates(): List<UpdateNotification> {
        val inProgressStories = fanficDao.getInProgressStories()
        val updates = mutableListOf<UpdateNotification>()
        
        inProgressStories.forEach { story ->
            try {
                val updateInfo = downloadService.checkForUpdates(
                    story.sourceUrl,
                    story.lastChapterDownloaded
                )
                
                if (updateInfo.hasUpdates) {
                    updates.add(UpdateNotification(
                        storyId = story.id,
                        title = story.title,
                        author = story.author,
                        newChapters = updateInfo.newChapters
                    ))
                }
                
                fanficDao.updateLastChecked(story.id, System.currentTimeMillis())
            } catch (e: Exception) {
                // Log error but continue checking other stories
            }
        }
        
        return updates
    }
}
```

---

## 📋 Implementation Checklist

### Phase 1: Foundation (Week 1)
- [ ] Re-enable existing fanfiction converter code
- [ ] Create `FanfictionSiteAdapter` interface
- [ ] Implement data models (StoryMetadata, Chapter, etc.)
- [ ] Set up database schema
- [ ] Create basic UI screen

### Phase 2: AO3 Adapter (Week 1-2)
- [ ] Implement `AO3Adapter`
- [ ] Metadata extraction
- [ ] Chapter downloading
- [ ] Update checking
- [ ] Error handling
- [ ] Rate limiting (be nice to servers)
- [ ] Unit tests

### Phase 3: EPUB Generation (Week 2)
- [ ] Enhance `SimpleEpubCreator`
- [ ] Proper TOC generation
- [ ] Chapter formatting
- [ ] Metadata embedding
- [ ] Cover generation (from text)

### Phase 4: UI & Integration (Week 2-3)
- [ ] Download screen
- [ ] Progress indicators
- [ ] Error messages
- [ ] Library integration
- [ ] Settings screen
- [ ] Update checking UI

### Phase 5: Additional Adapters (Week 3+)
- [ ] FanFiction.Net adapter
- [ ] Royal Road adapter
- [ ] Wattpad adapter (more complex)
- [ ] Other sites as needed

---

## 🧪 Testing Strategy

### Unit Tests
```kotlin
class AO3AdapterTest {
    private lateinit var adapter: AO3Adapter
    
    @Test
    fun `canHandle returns true for AO3 URLs`() {
        assertTrue(adapter.canHandle("https://archiveofourown.org/works/12345"))
        assertFalse(adapter.canHandle("https://fanfiction.net/s/12345"))
    }
    
    @Test
    fun `extractMetadata parses all fields correctly`() = runTest {
        val metadata = adapter.extractMetadata(TEST_STORY_URL)
        assertEquals("Expected Title", metadata.title)
        assertEquals("Expected Author", metadata.author)
        assertTrue(metadata.tags.isNotEmpty())
    }
}
```

### Integration Tests
```kotlin
@Test
fun `full download workflow completes successfully`() = runTest {
    val service = FanfictionDownloadService(...)
    val result = service.downloadStory(TEST_STORY_URL)
    
    assertTrue(result.isSuccess)
    val epubPath = result.getOrThrow()
    assertTrue(File(epubPath).exists())
}
```

### Manual Test Stories
```
AO3:
- Short story (1 chapter): https://archiveofourown.org/works/[id]
- Medium story (10 chapters)
- Long story (100+ chapters)
- Series

FFN:
- Short story
- Long story
- Multiple fandoms

Test cases:
- Different ratings
- Different warnings
- Various tag combinations
- Images in chapters
- Author notes
- Incomplete stories
- Complete stories
```

---

## ⚡ Performance Considerations

### Rate Limiting
```kotlin
class RateLimiter(
    private val maxRequests: Int = 5,
    private val timeWindow: Duration = 10.seconds
) {
    private val requests = mutableListOf<Instant>()
    
    suspend fun acquire() {
        val now = Instant.now()
        requests.removeIf { now - it > timeWindow }
        
        if (requests.size >= maxRequests) {
            val oldestRequest = requests.first()
            val waitTime = timeWindow - (now - oldestRequest)
            delay(waitTime.inWholeMilliseconds)
        }
        
        requests.add(now)
    }
}
```

### Caching
```kotlin
class CachingHttpClient(private val client: OkHttpClient) {
    private val cache = ConcurrentHashMap<String, CachedResponse>()
    
    suspend fun fetch(url: String, cacheDuration: Duration = 1.hours): Response {
        val cached = cache[url]
        if (cached != null && !cached.isExpired()) {
            return cached.response
        }
        
        val response = client.newCall(Request.Builder().url(url).build()).await()
        cache[url] = CachedResponse(response, Instant.now() + cacheDuration)
        return response
    }
}
```

---

## 🎯 Success Metrics

### Week 1-2 Goals
- [ ] Download 1 AO3 story successfully
- [ ] Extract all metadata correctly
- [ ] Generate valid EPUB file
- [ ] Add to CleverFerret library
- [ ] Display in book list

### Month 1 Goals
- [ ] Support 3 sites (AO3, FFN, Royal Road)
- [ ] Download 10+ stories successfully
- [ ] Update checking works
- [ ] Error handling robust
- [ ] User-friendly UI

### Long-term Goals
- [ ] Support 10+ sites
- [ ] Background update checking
- [ ] Series management
- [ ] Smart recommendations
- [ ] Share/export stories

---

## 📚 Resources

### FanFicFare
- **GitHub**: https://github.com/JimmXinu/FanFicFare
- **Documentation**: https://github.com/JimmXinu/FanFicFare/wiki
- **Site Adapters**: https://github.com/JimmXinu/FanFicFare/tree/main/fanficfare/adapters
- **Configuration**: https://github.com/JimmXinu/FanFicFare/wiki/ConfiguringOutput

### AO3 Technical
- **API Docs**: https://archiveofourown.org/admin_posts/10851 (unofficial)
- **TOS**: https://archiveofourown.org/tos
- **Robots.txt**: https://archiveofourown.org/robots.txt
- **Developer Guidelines**: Respectful scraping, reasonable rate limiting

### Libraries
- **Jsoup**: https://jsoup.org/ (HTML parsing)
- **OkHttp**: https://square.github.io/okhttp/ (HTTP client)
- **EPub Library**: https://github.com/psiegman/epublib (EPUB creation)

---

## 🚀 QUICK START

### Immediate Next Steps

1. **Find existing code** (currently disabled):
   ```bash
   # Search for disabled files
   find /workspace/CleverFerret -name "*anf*" -o -name "*epub*"
   ```

2. **Re-enable and fix**:
   - Rename `.disabled` back to `.kt`
   - Fix compilation errors
   - Update to current architecture

3. **Create AO3 adapter**:
   - Start with simple test URL
   - Extract just title and author
   - Download single chapter
   - Verify works end-to-end

4. **Iterate**:
   - Add more metadata fields
   - Multi-chapter support
   - Error handling
   - UI polish

---

## 💡 PRO TIPS

1. **Start simple** - Get 1 story downloading before adding features
2. **Test with short stories** - Faster iteration during development
3. **Be nice to servers** - Implement rate limiting from day 1
4. **Cache aggressively** - Avoid re-downloading same content
5. **Handle errors gracefully** - Sites change HTML frequently
6. **Use FanFicFare as reference** - But don't copy code directly
7. **Respect site TOS** - Personal use only, no redistribution

---

**Status**: Ready to implement  
**Next Action**: Find and re-enable existing fanfiction code  
**Timeline**: 2-3 weeks for MVP (AO3 only)  
**Effort**: Medium  
**Impact**: HIGH
