# Quick Implementation Guide: Komga-Inspired Features

**Purpose**: Practical, step-by-step guides for implementing Komga-inspired features in CleverFerret  
**Target Audience**: Developers working on CleverFerret  
**Related**: See `KOMGA_FEATURES_ANALYSIS.md` for detailed analysis

---

## 🚀 QUICK WIN: Reading Progress Sync

**Time**: 1-2 weeks | **Value**: Very High | **Difficulty**: Low

### Step 1: Enhance Database Schema

Add to `/CleverFerret/src/main/java/com/universalmedialibrary/data/local/entity/`:

```kotlin
// ReadingProgress.kt
@Entity(
    tableName = "reading_progress",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["id"],
            childColumns = ["mediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index(value = ["mediaItemId"])]
)
data class ReadingProgress(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    val mediaItemId: Long,
    val userId: Long = 1, // Default user, for future multi-user support
    
    // Position tracking
    val currentPage: Int = 0,
    val totalPages: Int = 0,
    val currentChapter: Int = 0,
    val totalChapters: Int = 0,
    
    // Calculated fields
    val progressPercent: Float = 0f,
    val completed: Boolean = false,
    
    // Time tracking
    val lastReadDate: Long = System.currentTimeMillis(),
    val firstReadDate: Long = System.currentTimeMillis(),
    val totalReadingTimeMs: Long = 0,
    
    // Reader state
    val lastPosition: String? = null, // JSON with reader-specific state
    val bookmarks: String? = null // JSON array of bookmark positions
)
```

### Step 2: Create DAO

```kotlin
// ReadingProgressDao.kt
@Dao
interface ReadingProgressDao {
    @Query("SELECT * FROM reading_progress WHERE mediaItemId = :mediaItemId LIMIT 1")
    fun getProgress(mediaItemId: Long): Flow<ReadingProgress?>
    
    @Query("SELECT * FROM reading_progress WHERE completed = 0 ORDER BY lastReadDate DESC LIMIT 10")
    fun getRecentlyRead(): Flow<List<ReadingProgress>>
    
    @Query("SELECT * FROM reading_progress WHERE completed = 1 ORDER BY lastReadDate DESC")
    fun getCompleted(): Flow<List<ReadingProgress>>
    
    @Upsert
    suspend fun upsert(progress: ReadingProgress)
    
    @Query("UPDATE reading_progress SET completed = :completed WHERE mediaItemId = :mediaItemId")
    suspend fun markAsCompleted(mediaItemId: Long, completed: Boolean)
    
    @Query("DELETE FROM reading_progress WHERE mediaItemId = :mediaItemId")
    suspend fun delete(mediaItemId: Long)
}
```

### Step 3: Create Repository

```kotlin
// ReadingProgressRepository.kt
@Singleton
class ReadingProgressRepository @Inject constructor(
    private val progressDao: ReadingProgressDao
) {
    fun getProgress(mediaItemId: Long): Flow<ReadingProgress?> =
        progressDao.getProgress(mediaItemId)
    
    fun getRecentlyRead(): Flow<List<ReadingProgress>> =
        progressDao.getRecentlyRead()
    
    suspend fun updateProgress(
        mediaItemId: Long,
        currentPage: Int,
        totalPages: Int,
        lastPosition: String? = null
    ) {
        val progress = progressDao.getProgress(mediaItemId).first() ?: ReadingProgress(
            mediaItemId = mediaItemId
        )
        
        val progressPercent = if (totalPages > 0) {
            (currentPage.toFloat() / totalPages.toFloat()) * 100f
        } else 0f
        
        val completed = progressPercent >= 99f // Consider 99% as completed
        
        progressDao.upsert(
            progress.copy(
                currentPage = currentPage,
                totalPages = totalPages,
                progressPercent = progressPercent,
                completed = completed,
                lastReadDate = System.currentTimeMillis(),
                lastPosition = lastPosition
            )
        )
    }
    
    suspend fun markAsRead(mediaItemId: Long) {
        progressDao.markAsCompleted(mediaItemId, true)
    }
    
    suspend fun markAsUnread(mediaItemId: Long) {
        progressDao.delete(mediaItemId)
    }
}
```

### Step 4: Integrate with Readers

Update reader screens to save progress:

```kotlin
// In EPUBReaderViewModel or similar
class ReaderViewModel @Inject constructor(
    private val progressRepository: ReadingProgressRepository
) : ViewModel() {
    
    fun onPageChanged(currentPage: Int, totalPages: Int) {
        viewModelScope.launch {
            progressRepository.updateProgress(
                mediaItemId = currentMediaItemId,
                currentPage = currentPage,
                totalPages = totalPages
            )
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        // Save final state
        viewModelScope.launch {
            progressRepository.updateProgress(
                mediaItemId = currentMediaItemId,
                currentPage = currentPage,
                totalPages = totalPages,
                lastPosition = saveReaderState()
            )
        }
    }
}
```

### Step 5: Add UI Indicators

```kotlin
@Composable
fun MediaItemCard(
    mediaItem: MediaItem,
    progress: ReadingProgress?
) {
    Card {
        // ... cover image
        
        // Progress indicator
        if (progress != null) {
            LinearProgressIndicator(
                progress = progress.progressPercent / 100f,
                modifier = Modifier.fillMaxWidth()
            )
            
            Text(
                text = "${progress.progressPercent.toInt()}%",
                style = MaterialTheme.typography.labelSmall
            )
        }
        
        // Completed badge
        if (progress?.completed == true) {
            Badge { Text("✓ Read") }
        }
    }
}
```

---

## 📚 MAJOR FEATURE: Collections & Read Lists

**Time**: 2-3 weeks | **Value**: Very High | **Difficulty**: Medium

### Step 1: Database Schema

```kotlin
// Collection.kt
@Entity(
    tableName = "collections",
    foreignKeys = [
        ForeignKey(
            entity = Library::class,
            parentColumns = ["id"],
            childColumns = ["libraryId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class Collection(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val description: String? = null,
    val libraryId: Long,
    val coverImagePath: String? = null,
    val createdDate: Long = System.currentTimeMillis(),
    val updatedDate: Long = System.currentTimeMillis()
)

// CollectionItem.kt
@Entity(
    tableName = "collection_items",
    primaryKeys = ["collectionId", "mediaItemId"],
    foreignKeys = [
        ForeignKey(
            entity = Collection::class,
            parentColumns = ["id"],
            childColumns = ["collectionId"],
            onDelete = ForeignKey.CASCADE
        ),
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["id"],
            childColumns = ["mediaItemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class CollectionItem(
    val collectionId: Long,
    val mediaItemId: Long,
    val position: Int = 0,
    val addedDate: Long = System.currentTimeMillis()
)

// ReadList.kt (similar structure, but with ordered reading)
@Entity(tableName = "read_lists")
data class ReadList(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val description: String? = null,
    val libraryId: Long?,  // Nullable - can span libraries
    val ordered: Boolean = true,
    val coverImagePath: String? = null,
    val createdDate: Long = System.currentTimeMillis(),
    val updatedDate: Long = System.currentTimeMillis()
)

@Entity(
    tableName = "read_list_items",
    primaryKeys = ["readListId", "mediaItemId"]
)
data class ReadListItem(
    val readListId: Long,
    val mediaItemId: Long,
    val position: Int,  // Crucial for ordered reading
    val addedDate: Long = System.currentTimeMillis()
)
```

### Step 2: DAOs

```kotlin
@Dao
interface CollectionDao {
    @Query("SELECT * FROM collections WHERE libraryId = :libraryId ORDER BY name ASC")
    fun getCollectionsByLibrary(libraryId: Long): Flow<List<Collection>>
    
    @Query("SELECT * FROM collections WHERE id = :id")
    fun getCollection(id: Long): Flow<Collection?>
    
    @Insert
    suspend fun insert(collection: Collection): Long
    
    @Update
    suspend fun update(collection: Collection)
    
    @Delete
    suspend fun delete(collection: Collection)
    
    // Get items in collection
    @Query("""
        SELECT m.* FROM media_items m
        INNER JOIN collection_items ci ON m.id = ci.mediaItemId
        WHERE ci.collectionId = :collectionId
        ORDER BY ci.position ASC
    """)
    fun getItemsInCollection(collectionId: Long): Flow<List<MediaItem>>
    
    // Add item to collection
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun addItem(item: CollectionItem)
    
    // Remove item from collection
    @Query("DELETE FROM collection_items WHERE collectionId = :collectionId AND mediaItemId = :mediaItemId")
    suspend fun removeItem(collectionId: Long, mediaItemId: Long)
    
    // Reorder items
    @Query("UPDATE collection_items SET position = :position WHERE collectionId = :collectionId AND mediaItemId = :mediaItemId")
    suspend fun updateItemPosition(collectionId: Long, mediaItemId: Long, position: Int)
}

// Similar DAO for ReadList
```

### Step 3: Service Layer

```kotlin
@Singleton
class CollectionService @Inject constructor(
    private val collectionDao: CollectionDao
) {
    fun getCollections(libraryId: Long): Flow<List<Collection>> =
        collectionDao.getCollectionsByLibrary(libraryId)
    
    suspend fun createCollection(
        name: String,
        description: String?,
        libraryId: Long
    ): Long {
        return collectionDao.insert(
            Collection(
                name = name,
                description = description,
                libraryId = libraryId
            )
        )
    }
    
    suspend fun addToCollection(collectionId: Long, mediaItemId: Long) {
        // Get current max position
        val items = collectionDao.getItemsInCollection(collectionId).first()
        val nextPosition = (items.maxOfOrNull { it.id } ?: 0) + 1
        
        collectionDao.addItem(
            CollectionItem(
                collectionId = collectionId,
                mediaItemId = mediaItemId,
                position = nextPosition.toInt()
            )
        )
    }
    
    suspend fun reorderItems(
        collectionId: Long,
        newOrder: List<Long> // List of mediaItemIds in desired order
    ) {
        newOrder.forEachIndexed { index, mediaItemId ->
            collectionDao.updateItemPosition(
                collectionId = collectionId,
                mediaItemId = mediaItemId,
                position = index
            )
        }
    }
}
```

### Step 4: UI Implementation

```kotlin
// CollectionsScreen.kt
@Composable
fun CollectionsScreen(
    libraryId: Long,
    viewModel: CollectionsViewModel = hiltViewModel()
) {
    val collections by viewModel.getCollections(libraryId).collectAsState(initial = emptyList())
    var showCreateDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Collections") }
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { showCreateDialog = true }
            ) {
                Icon(Icons.Default.Add, contentDescription = "Create Collection")
            }
        }
    ) { padding ->
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 150.dp),
            contentPadding = padding,
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(collections) { collection ->
                CollectionCard(
                    collection = collection,
                    onClick = { /* Navigate to collection detail */ }
                )
            }
        }
    }
    
    if (showCreateDialog) {
        CreateCollectionDialog(
            onDismiss = { showCreateDialog = false },
            onConfirm = { name, description ->
                viewModel.createCollection(name, description, libraryId)
                showCreateDialog = false
            }
        )
    }
}

@Composable
fun CollectionCard(
    collection: Collection,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            // Cover grid (2x2 of item covers)
            if (collection.coverImagePath != null) {
                AsyncImage(
                    model = collection.coverImagePath,
                    contentDescription = null,
                    modifier = Modifier
                        .fillMaxWidth()
                        .aspectRatio(1f)
                )
            } else {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .aspectRatio(1f)
                        .background(MaterialTheme.colorScheme.surfaceVariant),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        Icons.Default.Collections,
                        contentDescription = null,
                        modifier = Modifier.size(48.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = collection.name,
                style = MaterialTheme.typography.titleMedium,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            
            if (collection.description != null) {
                Text(
                    text = collection.description,
                    style = MaterialTheme.typography.bodySmall,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

// Add "Add to Collection" context menu
@Composable
fun MediaItemContextMenu(
    mediaItem: MediaItem,
    onAddToCollection: () -> Unit
) {
    DropdownMenuItem(
        text = { Text("Add to Collection") },
        onClick = onAddToCollection,
        leadingIcon = {
            Icon(Icons.Default.PlaylistAdd, contentDescription = null)
        }
    )
}
```

---

## 🔍 FEATURE: Duplicate Detection

**Time**: 2-3 weeks | **Value**: High | **Difficulty**: Medium

### Leverage Existing ContentFingerprinter

CleverFerret already has a `ContentFingerprinter` service! Just need to integrate it.

### Step 1: Enhance Existing Service

```kotlin
// Update ContentFingerprinter.kt
@Singleton
class ContentFingerprinter @Inject constructor() {
    
    // Keep existing methods...
    
    /**
     * Find duplicate media items by fingerprint
     */
    suspend fun findDuplicates(
        mediaItems: List<MediaItem>
    ): List<DuplicateGroup> = withContext(Dispatchers.IO) {
        val fingerprintMap = mutableMapOf<String, MutableList<MediaItem>>()
        
        mediaItems.forEach { item ->
            val fingerprint = when (item.type) {
                MediaType.BOOK -> generateDocumentFingerprint(readFile(item.path))
                MediaType.VIDEO -> generateVideoFingerprint(context, Uri.parse(item.path))
                MediaType.AUDIO -> generateAudioFingerprint(context, Uri.parse(item.path))
                MediaType.COMIC -> generateComicFingerprint(context, Uri.parse(item.path))
                else -> null
            }
            
            if (fingerprint != null) {
                fingerprintMap.getOrPut(fingerprint) { mutableListOf() }.add(item)
            }
        }
        
        // Return only groups with duplicates
        fingerprintMap
            .filter { it.value.size > 1 }
            .map { (fingerprint, items) ->
                DuplicateGroup(
                    fingerprint = fingerprint,
                    items = items,
                    totalSize = items.sumOf { getFileSize(it.path) }
                )
            }
    }
    
    private fun getFileSize(path: String): Long {
        return try {
            File(path).length()
        } catch (e: Exception) {
            0L
        }
    }
}

data class DuplicateGroup(
    val fingerprint: String,
    val items: List<MediaItem>,
    val totalSize: Long
) {
    val wastedSpace: Long = totalSize - (totalSize / items.size)
}
```

### Step 2: Create Duplicate Detection Service

```kotlin
@Singleton
class DuplicateDetectionService @Inject constructor(
    private val fingerprinter: ContentFingerprinter,
    private val mediaRepository: MediaRepository
) {
    suspend fun scanLibraryForDuplicates(
        libraryId: Long
    ): Flow<DuplicateScanResult> = flow {
        emit(DuplicateScanResult.Scanning(0))
        
        val items = mediaRepository.getMediaItemsByLibrary(libraryId).first()
        val total = items.size
        var processed = 0
        
        val duplicates = mutableListOf<DuplicateGroup>()
        
        // Process in batches to avoid memory issues
        items.chunked(50).forEach { batch ->
            val batchDuplicates = fingerprinter.findDuplicates(batch)
            duplicates.addAll(batchDuplicates)
            
            processed += batch.size
            emit(DuplicateScanResult.Scanning((processed * 100) / total))
        }
        
        emit(DuplicateScanResult.Complete(duplicates))
    }
}

sealed class DuplicateScanResult {
    data class Scanning(val progress: Int) : DuplicateScanResult()
    data class Complete(val duplicates: List<DuplicateGroup>) : DuplicateScanResult()
    data class Error(val message: String) : DuplicateScanResult()
}
```

### Step 3: UI for Reviewing Duplicates

```kotlin
@Composable
fun DuplicatesScreen(
    libraryId: Long,
    viewModel: DuplicatesViewModel = hiltViewModel()
) {
    val scanResult by viewModel.scanResult.collectAsState()
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Duplicate Files") },
                actions = {
                    IconButton(onClick = { viewModel.startScan(libraryId) }) {
                        Icon(Icons.Default.Refresh, "Scan")
                    }
                }
            )
        }
    ) { padding ->
        when (val result = scanResult) {
            is DuplicateScanResult.Scanning -> {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(padding),
                    contentAlignment = Alignment.Center
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        CircularProgressIndicator()
                        Spacer(modifier = Modifier.height(16.dp))
                        Text("Scanning: ${result.progress}%")
                    }
                }
            }
            
            is DuplicateScanResult.Complete -> {
                if (result.duplicates.isEmpty()) {
                    EmptyState(message = "No duplicates found!")
                } else {
                    LazyColumn(
                        modifier = Modifier.padding(padding)
                    ) {
                        item {
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp)
                            ) {
                                Column(modifier = Modifier.padding(16.dp)) {
                                    Text(
                                        text = "Found ${result.duplicates.size} duplicate groups",
                                        style = MaterialTheme.typography.titleMedium
                                    )
                                    Text(
                                        text = "Wasted space: ${formatFileSize(result.duplicates.sumOf { it.wastedSpace })}",
                                        style = MaterialTheme.typography.bodyMedium
                                    )
                                }
                            }
                        }
                        
                        items(result.duplicates) { group ->
                            DuplicateGroupCard(
                                group = group,
                                onKeep = { item -> viewModel.keepItem(group, item) },
                                onDeleteAll = { viewModel.deleteAll(group) }
                            )
                        }
                    }
                }
            }
            
            is DuplicateScanResult.Error -> {
                ErrorState(message = result.message)
            }
            
            null -> {
                EmptyState(message = "Click scan to find duplicates")
            }
        }
    }
}

@Composable
fun DuplicateGroupCard(
    group: DuplicateGroup,
    onKeep: (MediaItem) -> Unit,
    onDeleteAll: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                text = "${group.items.size} duplicates",
                style = MaterialTheme.typography.titleSmall
            )
            Text(
                text = "Wasted: ${formatFileSize(group.wastedSpace)}",
                style = MaterialTheme.typography.bodySmall
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            group.items.forEach { item ->
                DuplicateItemRow(
                    item = item,
                    onKeep = { onKeep(item) }
                )
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            OutlinedButton(
                onClick = onDeleteAll,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Delete All")
            }
        }
    }
}
```

---

## 📊 FEATURE: Enhanced Series Management

**Time**: 2-4 weeks | **Value**: Very High | **Difficulty**: Medium

### Step 1: Enhance Existing Series Entity

```kotlin
// Update existing Series.kt
@Entity(
    tableName = "series",
    foreignKeys = [
        ForeignKey(
            entity = Library::class,
            parentColumns = ["id"],
            childColumns = ["libraryId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class Series(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val name: String,
    val sortName: String,
    val libraryId: Long,
    
    // New fields inspired by Komga
    val status: SeriesStatus = SeriesStatus.ONGOING,
    val publisher: String? = null,
    val ageRating: AgeRating? = null,
    val description: String? = null,
    val thumbnail: String? = null,
    val totalBooks: Int = 0,
    val releaseDate: Long? = null,
    
    // Auto-detection metadata
    val folderPath: String? = null,
    val autoDetected: Boolean = false,
    
    val createdDate: Long = System.currentTimeMillis(),
    val updatedDate: Long = System.currentTimeMillis()
)

enum class SeriesStatus {
    ONGOING,
    COMPLETED,
    HIATUS,
    CANCELLED,
    UNKNOWN
}

enum class AgeRating {
    EVERYONE,
    EVERYONE_10_PLUS,
    TEEN,
    MATURE_17_PLUS,
    ADULTS_ONLY,
    UNKNOWN
}
```

### Step 2: Auto-Detection During Scan

```kotlin
// Add to MediaScanningService.kt
class MediaScanningService @Inject constructor(...) {
    
    private suspend fun detectSeries(
        files: List<File>,
        libraryId: Long
    ): List<Series> {
        val seriesMap = mutableMapOf<String, MutableList<File>>()
        
        // Group files by parent folder
        files.forEach { file ->
            val parentFolder = file.parentFile?.name ?: "Unknown"
            seriesMap.getOrPut(parentFolder) { mutableListOf() }.add(file)
        }
        
        // Create series entries
        return seriesMap.map { (folderName, filesInSeries) ->
            Series(
                name = cleanSeriesName(folderName),
                sortName = cleanSeriesName(folderName),
                libraryId = libraryId,
                folderPath = filesInSeries.firstOrNull()?.parentFile?.absolutePath,
                autoDetected = true,
                totalBooks = filesInSeries.size
            )
        }
    }
    
    private fun cleanSeriesName(folderName: String): String {
        // Remove common patterns like "(2020)", "[Complete]", etc.
        return folderName
            .replace(Regex("""\([0-9]{4}\)"""), "")
            .replace(Regex("""\[[^\]]+\]"""), "")
            .trim()
    }
}
```

### Step 3: Series Detail View

```kotlin
@Composable
fun SeriesDetailScreen(
    seriesId: Long,
    viewModel: SeriesDetailViewModel = hiltViewModel()
) {
    val series by viewModel.getSeries(seriesId).collectAsState(initial = null)
    val books by viewModel.getBooksInSeries(seriesId).collectAsState(initial = emptyList())
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(series?.name ?: "") },
                navigationIcon = {
                    IconButton(onClick = { /* navigate back */ }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { /* edit metadata */ }) {
                        Icon(Icons.Default.Edit, "Edit")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Hero section with series info
            item {
                SeriesHeroSection(series = series)
            }
            
            // Books in series
            item {
                Text(
                    text = "Books (${books.size})",
                    style = MaterialTheme.typography.titleLarge,
                    modifier = Modifier.padding(16.dp)
                )
            }
            
            items(books) { book ->
                BookInSeriesCard(
                    book = book,
                    onClick = { /* open book */ }
                )
            }
        }
    }
}

@Composable
fun SeriesHeroSection(series: Series?) {
    if (series == null) return
    
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .background(MaterialTheme.colorScheme.surfaceVariant)
            .padding(16.dp)
    ) {
        Row {
            // Series thumbnail
            if (series.thumbnail != null) {
                AsyncImage(
                    model = series.thumbnail,
                    contentDescription = series.name,
                    modifier = Modifier
                        .width(120.dp)
                        .height(180.dp)
                        .clip(RoundedCornerShape(8.dp))
                )
            } else {
                Box(
                    modifier = Modifier
                        .width(120.dp)
                        .height(180.dp)
                        .clip(RoundedCornerShape(8.dp))
                        .background(MaterialTheme.colorScheme.surface),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        Icons.Default.MenuBook,
                        contentDescription = null,
                        modifier = Modifier.size(48.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            // Metadata
            Column {
                Text(
                    text = series.name,
                    style = MaterialTheme.typography.headlineSmall
                )
                
                if (series.publisher != null) {
                    Text(
                        text = series.publisher,
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Row {
                    StatusChip(status = series.status)
                    
                    if (series.ageRating != null) {
                        Spacer(modifier = Modifier.width(8.dp))
                        AgeRatingChip(rating = series.ageRating)
                    }
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Text(
                    text = "${series.totalBooks} books",
                    style = MaterialTheme.typography.bodySmall
                )
            }
        }
        
        if (series.description != null) {
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = series.description,
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}
```

---

## 🎨 UI COMPONENTS: Reusable Komga-Inspired Elements

### Progress Indicator Component

```kotlin
@Composable
fun ReadingProgressIndicator(
    progress: ReadingProgress,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier) {
        LinearProgressIndicator(
            progress = progress.progressPercent / 100f,
            modifier = Modifier.fillMaxWidth()
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                text = "Page ${progress.currentPage}/${progress.totalPages}",
                style = MaterialTheme.typography.labelSmall
            )
            Text(
                text = "${progress.progressPercent.toInt()}%",
                style = MaterialTheme.typography.labelSmall
            )
        }
    }
}
```

### Status Chips

```kotlin
@Composable
fun StatusChip(status: SeriesStatus) {
    val color = when (status) {
        SeriesStatus.ONGOING -> Color(0xFF4CAF50)
        SeriesStatus.COMPLETED -> Color(0xFF2196F3)
        SeriesStatus.HIATUS -> Color(0xFFFFC107)
        SeriesStatus.CANCELLED -> Color(0xFFF44336)
        SeriesStatus.UNKNOWN -> Color.Gray
    }
    
    SuggestionChip(
        onClick = { },
        label = { Text(status.name.lowercase().capitalize()) },
        colors = SuggestionChipDefaults.suggestionChipColors(
            containerColor = color.copy(alpha = 0.2f),
            labelColor = color
        )
    )
}

@Composable
fun AgeRatingChip(rating: AgeRating) {
    val text = when (rating) {
        AgeRating.EVERYONE -> "E"
        AgeRating.EVERYONE_10_PLUS -> "E10+"
        AgeRating.TEEN -> "T"
        AgeRating.MATURE_17_PLUS -> "M"
        AgeRating.ADULTS_ONLY -> "AO"
        AgeRating.UNKNOWN -> "?"
    }
    
    AssistChip(
        onClick = { },
        label = { Text(text) },
        leadingIcon = {
            Icon(
                Icons.Default.Info,
                contentDescription = null,
                modifier = Modifier.size(16.dp)
            )
        }
    )
}
```

---

## 🧪 Testing Recommendations

### Unit Tests

```kotlin
class ReadingProgressRepositoryTest {
    @Test
    fun `updateProgress calculates percentage correctly`() = runTest {
        // Test progress calculation
        repository.updateProgress(
            mediaItemId = 1,
            currentPage = 50,
            totalPages = 100
        )
        
        val progress = repository.getProgress(1).first()
        assertEquals(50f, progress?.progressPercent)
        assertFalse(progress?.completed ?: true)
    }
    
    @Test
    fun `updateProgress marks as completed at 99 percent`() = runTest {
        repository.updateProgress(
            mediaItemId = 1,
            currentPage = 99,
            totalPages = 100
        )
        
        val progress = repository.getProgress(1).first()
        assertTrue(progress?.completed ?: false)
    }
}
```

### Integration Tests

```kotlin
@HiltAndroidTest
class CollectionServiceTest {
    @Test
    fun `createCollection creates collection with items`() = runTest {
        val collectionId = collectionService.createCollection(
            name = "Test Collection",
            description = "Test",
            libraryId = 1
        )
        
        collectionService.addToCollection(collectionId, mediaItemId = 1)
        collectionService.addToCollection(collectionId, mediaItemId = 2)
        
        val items = collectionService.getItemsInCollection(collectionId).first()
        assertEquals(2, items.size)
    }
}
```

---

## 📋 Migration Scripts

### Database Migration Example

```kotlin
// In AppDatabase.kt
@Database(
    entities = [
        // ... existing entities
        ReadingProgress::class,
        Collection::class,
        CollectionItem::class,
        ReadList::class,
        ReadListItem::class
    ],
    version = 2 // Increment version
)
abstract class AppDatabase : RoomDatabase() {
    // ... existing DAOs
    abstract fun readingProgressDao(): ReadingProgressDao
    abstract fun collectionDao(): CollectionDao
    abstract fun readListDao(): ReadListDao
    
    companion object {
        val MIGRATION_1_2 = object : Migration(1, 2) {
            override fun migrate(database: SupportSQLiteDatabase) {
                // Create reading_progress table
                database.execSQL("""
                    CREATE TABLE IF NOT EXISTS reading_progress (
                        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        mediaItemId INTEGER NOT NULL,
                        userId INTEGER NOT NULL DEFAULT 1,
                        currentPage INTEGER NOT NULL DEFAULT 0,
                        totalPages INTEGER NOT NULL DEFAULT 0,
                        currentChapter INTEGER NOT NULL DEFAULT 0,
                        totalChapters INTEGER NOT NULL DEFAULT 0,
                        progressPercent REAL NOT NULL DEFAULT 0,
                        completed INTEGER NOT NULL DEFAULT 0,
                        lastReadDate INTEGER NOT NULL,
                        firstReadDate INTEGER NOT NULL,
                        totalReadingTimeMs INTEGER NOT NULL DEFAULT 0,
                        lastPosition TEXT,
                        bookmarks TEXT,
                        FOREIGN KEY(mediaItemId) REFERENCES media_items(id) ON DELETE CASCADE
                    )
                """)
                
                database.execSQL("CREATE INDEX index_reading_progress_mediaItemId ON reading_progress(mediaItemId)")
                
                // Create collections table
                database.execSQL("""
                    CREATE TABLE IF NOT EXISTS collections (
                        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        name TEXT NOT NULL,
                        description TEXT,
                        libraryId INTEGER NOT NULL,
                        coverImagePath TEXT,
                        createdDate INTEGER NOT NULL,
                        updatedDate INTEGER NOT NULL,
                        FOREIGN KEY(libraryId) REFERENCES libraries(id) ON DELETE CASCADE
                    )
                """)
                
                // Create collection_items table
                database.execSQL("""
                    CREATE TABLE IF NOT EXISTS collection_items (
                        collectionId INTEGER NOT NULL,
                        mediaItemId INTEGER NOT NULL,
                        position INTEGER NOT NULL DEFAULT 0,
                        addedDate INTEGER NOT NULL,
                        PRIMARY KEY(collectionId, mediaItemId),
                        FOREIGN KEY(collectionId) REFERENCES collections(id) ON DELETE CASCADE,
                        FOREIGN KEY(mediaItemId) REFERENCES media_items(id) ON DELETE CASCADE
                    )
                """)
                
                // Similar for read_lists and read_list_items...
                
                // Update series table
                database.execSQL("ALTER TABLE series ADD COLUMN status TEXT NOT NULL DEFAULT 'ONGOING'")
                database.execSQL("ALTER TABLE series ADD COLUMN publisher TEXT")
                database.execSQL("ALTER TABLE series ADD COLUMN ageRating TEXT")
                database.execSQL("ALTER TABLE series ADD COLUMN description TEXT")
                database.execSQL("ALTER TABLE series ADD COLUMN thumbnail TEXT")
                database.execSQL("ALTER TABLE series ADD COLUMN totalBooks INTEGER NOT NULL DEFAULT 0")
                database.execSQL("ALTER TABLE series ADD COLUMN releaseDate INTEGER")
                database.execSQL("ALTER TABLE series ADD COLUMN folderPath TEXT")
                database.execSQL("ALTER TABLE series ADD COLUMN autoDetected INTEGER NOT NULL DEFAULT 0")
            }
        }
    }
}
```

---

## ✅ Checklist for Each Feature

### Before Implementation
- [ ] Review existing code for similar functionality
- [ ] Check database schema for conflicts
- [ ] Identify required dependencies
- [ ] Create feature branch

### During Implementation
- [ ] Write database entities and DAOs
- [ ] Create repository layer
- [ ] Implement service layer
- [ ] Build UI components
- [ ] Add navigation
- [ ] Write unit tests
- [ ] Write integration tests

### After Implementation
- [ ] Manual testing
- [ ] Performance testing
- [ ] Update documentation
- [ ] Create migration script
- [ ] Code review
- [ ] Merge to main

---

## 📚 Resources

- **Komga Repository**: https://github.com/gotson/komga
- **Komga Documentation**: https://komga.org/docs
- **Room Database**: https://developer.android.com/training/data-storage/room
- **Jetpack Compose**: https://developer.android.com/jetpack/compose
- **Hilt**: https://developer.android.com/training/dependency-injection/hilt-android

---

**Document Version**: 1.0  
**Last Updated**: January 2025  
**Related**: `KOMGA_FEATURES_ANALYSIS.md`, `FEATURES_TO_IMPLEMENT.md`
