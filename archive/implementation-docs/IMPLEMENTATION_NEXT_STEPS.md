# Implementation Next Steps - Detailed Guide

**For**: Completing the Calibre Plugins Implementation  
**Current Status**: Foundation complete, UI needed  
**Time Estimate**: 3-4 weeks for complete implementation

---

## 🎯 Quick Start: Complete Phase 1 (Fanfiction)

To make the fanfiction feature immediately usable, create these 6 files:

### 1. FanfictionViewModel.kt

```kotlin
@HiltViewModel
class FanfictionViewModel @Inject constructor(
    private val fanfictionService: FanfictionDownloadService,
    private val fanfictionDao: FanfictionDao
) : ViewModel() {
    
    val allStories = fanfictionDao.getAllStories()
        .stateIn(viewModelScope, SharingStarted.Eagerly, emptyList())
    
    private val _downloadState = MutableStateFlow<DownloadState>(DownloadState.Idle)
    val downloadState = _downloadState.asStateFlow()
    
    fun downloadStory(url: String) {
        viewModelScope.launch {
            _downloadState.value = DownloadState.Downloading(0, 0, "Starting...")
            
            val result = fanfictionService.downloadStory(url) { current, total, message ->
                _downloadState.value = DownloadState.Downloading(current, total, message)
            }
            
            result.onSuccess { metadata ->
                _downloadState.value = DownloadState.Success(metadata)
            }.onFailure { error ->
                _downloadState.value = DownloadState.Error(error.message ?: "Download failed")
            }
        }
    }
    
    fun checkForUpdates() {
        viewModelScope.launch {
            fanfictionService.checkAllForUpdates()
        }
    }
}

sealed class DownloadState {
    object Idle : DownloadState()
    data class Downloading(val current: Int, val total: Int, val message: String) : DownloadState()
    data class Success(val metadata: StoryMetadata) : DownloadState()
    data class Error(val message: String) : DownloadState()
}
```

### 2. FanfictionDownloadScreen.kt

```kotlin
@Composable
fun FanfictionDownloadScreen(
    viewModel: FanfictionViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit
) {
    var url by remember { mutableStateOf("") }
    val downloadState by viewModel.downloadState.collectAsState()
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Download Fanfiction") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
        ) {
            OutlinedTextField(
                value = url,
                onValueChange = { url = it },
                label = { Text("Story URL") },
                placeholder = { Text("Paste URL from AO3, FFN, Royal Road...") },
                modifier = Modifier.fillMaxWidth()
            )
            
            Spacer(Modifier.height(16.dp))
            
            Button(
                onClick = { viewModel.downloadStory(url) },
                enabled = url.isNotBlank() && downloadState !is DownloadState.Downloading,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Download")
            }
            
            Spacer(Modifier.height(24.dp))
            
            when (val state = downloadState) {
                is DownloadState.Downloading -> {
                    LinearProgressIndicator(
                        progress = if (state.total > 0) state.current.toFloat() / state.total else 0f,
                        modifier = Modifier.fillMaxWidth()
                    )
                    Text(state.message)
                }
                is DownloadState.Success -> {
                    Text("✅ Downloaded: ${state.metadata.title}", color = Color.Green)
                }
                is DownloadState.Error -> {
                    Text("❌ Error: ${state.message}", color = Color.Red)
                }
                else -> {}
            }
        }
    }
}
```

### 3. FanfictionLibraryScreen.kt

```kotlin
@Composable
fun FanfictionLibraryScreen(
    viewModel: FanfictionViewModel = hiltViewModel(),
    onNavigateToDownload: () -> Unit,
    onStoryClick: (FanfictionStoryEntity) -> Unit
) {
    val stories by viewModel.allStories.collectAsState()
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Fanfiction Library") },
                actions = {
                    IconButton(onClick = onNavigateToDownload) {
                        Icon(Icons.Default.Add, "Download")
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = onNavigateToDownload) {
                Icon(Icons.Default.Download, "Download")
            }
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            items(stories) { story ->
                StoryCard(story, onClick = { onStoryClick(story) })
            }
        }
    }
}

@Composable
fun StoryCard(story: FanfictionStoryEntity, onClick: () -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(8.dp)
            .clickable(onClick = onClick)
    ) {
        Column(Modifier.padding(16.dp)) {
            Text(story.title, style = MaterialTheme.typography.titleLarge)
            Text("by ${story.author}", style = MaterialTheme.typography.bodyMedium)
            Text(
                "${story.chapterCount} chapters • ${story.wordCount} words",
                style = MaterialTheme.typography.bodySmall
            )
            Text(story.sourceSite, style = MaterialTheme.typography.bodySmall)
        }
    }
}
```

### 4. Update MainActivity.kt

Add navigation routes:

```kotlin
// In NavHost
composable("fanfiction_library") {
    FanfictionLibraryScreen(
        onNavigateToDownload = { navController.navigate("fanfiction_download") },
        onStoryClick = { story -> 
            // Open EPUB reader with story.epubPath
        }
    )
}

composable("fanfiction_download") {
    FanfictionDownloadScreen(
        onNavigateBack = { navController.popBackStack() }
    )
}
```

### 5. Update HomeScreen.kt

Add quick access card:

```kotlin
Card(
    modifier = Modifier
        .fillMaxWidth()
        .clickable { navController.navigate("fanfiction_library") }
) {
    Row(modifier = Modifier.padding(16.dp)) {
        Icon(Icons.Default.Book, "Fanfiction")
        Spacer(Modifier.width(16.dp))
        Column {
            Text("Fanfiction", style = MaterialTheme.typography.titleMedium)
            Text("Download from AO3, FFN, Royal Road", 
                style = MaterialTheme.typography.bodySmall)
        }
    }
}
```

### 6. Update AppDatabase.kt

Add the new entity and DAO:

```kotlin
@Database(
    entities = [
        // ... existing entities ...
        FanfictionStoryEntity::class
    ],
    version = [CURRENT_VERSION + 1],
    exportSchema = true
)
abstract class AppDatabase : RoomDatabase {
    // ... existing DAOs ...
    abstract fun fanfictionDao(): FanfictionDao
}
```

---

## 📋 Implementation Checklist

### Phase 1: Fanfiction ✅ (Core Complete, UI Needed)

- [x] StoryMetadata model
- [x] FanfictionSiteAdapter interface
- [x] AO3Adapter
- [x] FFNAdapter
- [x] RoyalRoadAdapter
- [x] FanfictionDownloadService
- [x] EpubCreatorService
- [x] FanfictionStoryEntity
- [x] FanfictionDao
- [ ] FanfictionViewModel
- [ ] FanfictionDownloadScreen
- [ ] FanfictionLibraryScreen
- [ ] FanfictionDetailScreen (optional)
- [ ] Navigation integration
- [ ] Home screen integration
- [ ] Database migration

### Phase 2-8: Not Started

See `CALIBRE_PLUGINS_IMPLEMENTATION_STATUS.md` for detailed breakdown.

---

## 🔄 Development Workflow

For each remaining phase:

### Step 1: Models & Interfaces
Create data structures and interfaces first.

### Step 2: Services
Implement business logic and external integrations.

### Step 3: Database (if needed)
Create entities and DAOs.

### Step 4: ViewModels
Create ViewModels with state management.

### Step 5: UI Screens
Create Compose screens.

### Step 6: Integration
Add navigation and home screen links.

### Step 7: Testing
Test end-to-end functionality.

---

## 🎨 UI Theme Integration

All UI should use Material 3 theme from CleverFerret:

```kotlin
// Use existing theme components
MaterialTheme.colorScheme.primary
MaterialTheme.colorScheme.surface
MaterialTheme.typography.titleLarge
// etc.

// Follow existing patterns from:
// - BookDetailScreen.kt
// - MusicPlayerScreen.kt
// - ComicReaderScreen.kt
```

---

## 🚀 Quick Wins

To show immediate value, prioritize:

1. **Phase 1: Fanfiction** - Most unique feature, high user demand
2. **Phase 2: HD Covers** - Visual improvement, easy integration
3. **Phase 4: Comics** - Enhance existing comic reader
4. **Phase 5: Audiobooks** - New content type

Then:
5. Phase 3: Enhanced Metadata
6. Phase 6: EPUB Tools
7. Phase 7: Organization
8. Phase 8: AI Features

---

## 📚 Code Examples Available

Refer to the created files for patterns:
- `/services/fanfiction/adapters/AO3Adapter.kt` - Site adapter pattern
- `/services/fanfiction/FanfictionDownloadService.kt` - Service orchestration
- `/services/epub/EpubCreatorService.kt` - File generation
- `/data/local/dao/FanfictionDao.kt` - Database operations

---

## 💡 Tips for Fast Development

1. **Copy & Adapt**: Use existing fanfiction code as template
2. **Test Incrementally**: Test each adapter/service as you build
3. **Use Existing UI**: Follow patterns from existing screens
4. **Parallel Development**: Multiple phases can be developed in parallel
5. **Mock First**: Create UI with mock data before connecting services

---

## ⚠️ Important Notes

1. **Database Migration**: Remember to increment database version and add migration
2. **API Keys**: Add new API key methods to APIKeyRepository
3. **Dependencies**: Check if any new dependencies are needed
4. **Error Handling**: Use Result types consistently
5. **Progress Callbacks**: Maintain for long-running operations
6. **Testing**: Test with real URLs/files for each service

---

## 🎯 Success Criteria

### Phase 1 Complete When:
- [ ] Can download AO3 story
- [ ] Can download FFN story
- [ ] Can download Royal Road story
- [ ] EPUB is valid and readable
- [ ] Story appears in library
- [ ] Can re-open downloaded stories
- [ ] UI is polished and themed
- [ ] No crashes or errors

### All Phases Complete When:
- [ ] All 25+ features implemented
- [ ] All UI screens created
- [ ] All services tested
- [ ] Database migrations working
- [ ] Navigation complete
- [ ] Documentation updated
- [ ] No critical bugs

---

**Current Status**: ~25% Complete  
**Next Milestone**: Complete Phase 1 UI  
**Timeline**: 2-3 days for Phase 1, 3-4 weeks for all phases

---

**Ready to continue!** Start with the 6 files above to complete Phase 1.
