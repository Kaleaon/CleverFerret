# Komga Features Analysis for CleverFerret

**Date**: January 2025  
**Purpose**: Analyze features from @gotson/komga that would be valuable for CleverFerret

---

## Executive Summary

[Komga](https://komga.org) (by @gotson) is a mature, open-source media server for comics, manga, BDs (French comics), magazines, and eBooks. It has been in active development since 2019 and represents a well-thought-out approach to digital media library management.

**Key Takeaway**: Komga focuses on **comics/manga** with EPUB support, while CleverFerret aims to be a **universal media library** with books as the primary focus. Many of Komga's organizational and metadata features would significantly enhance CleverFerret.

---

## 🎯 HIGH-PRIORITY FEATURES (Implement First)

These features provide the most value with reasonable implementation complexity.

### 1. **Collections & Read Lists** 🌟 HIGHLY RECOMMENDED

**What Komga Does:**
- **Collections**: User-created groupings of series (e.g., "Marvel Phase 1", "Favorite Sci-Fi")
- **Read Lists**: Ordered lists of books that can span multiple series (e.g., "Civil War Reading Order")
- Both support custom ordering and metadata

**Why CleverFerret Needs This:**
- Currently only has basic library organization
- Users want to create custom groupings beyond folders
- Essential for power users who manage large libraries
- Already mentioned in `FEATURES_TO_IMPLEMENT.md` Phase 2.4

**Implementation Approach:**
```kotlin
// Add to database schema
@Entity(tableName = "collections")
data class Collection(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val name: String,
    val description: String? = null,
    val libraryId: Long,
    val createdDate: Long = System.currentTimeMillis(),
    val updatedDate: Long = System.currentTimeMillis()
)

@Entity(
    tableName = "collection_items",
    primaryKeys = ["collectionId", "mediaItemId"]
)
data class CollectionItem(
    val collectionId: Long,
    val mediaItemId: Long,
    val position: Int // For ordering
)

// Similar structure for ReadList
```

**UI Considerations:**
- Add "Collections" tab to main navigation
- Add "Add to Collection" option in book/series context menu
- Visual collection cards with cover grid
- Drag-and-drop reordering in read lists

**Effort Estimate**: Medium (2-3 weeks)  
**Value**: Very High - Transforms basic library into powerful organization tool

---

### 2. **Series Management** 🌟 HIGHLY RECOMMENDED

**What Komga Does:**
- Automatic series detection from folder structure
- Series metadata (title, status, publisher, age rating)
- Book ordering within series
- Series-level reading progress tracking

**Why CleverFerret Needs This:**
- Current schema has `Series` entity but it's underutilized
- Comics, manga, and book series need proper grouping
- Users expect series-based organization (e.g., "Harry Potter", "One Piece")

**Implementation Approach:**
1. Enhance existing `Series` entity:
```kotlin
@Entity(tableName = "series")
data class Series(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val name: String,
    val sortName: String,
    val libraryId: Long,
    val status: SeriesStatus = SeriesStatus.ONGOING,
    val publisher: String? = null,
    val ageRating: Int? = null,
    val description: String? = null,
    val thumbnail: String? = null
)

enum class SeriesStatus {
    ONGOING, COMPLETED, HIATUS, CANCELLED
}
```

2. Auto-detect series from folder structure during scanning
3. Allow manual series assignment
4. Series detail view with all books in order

**UI Considerations:**
- Series view showing all books in order
- Series metadata editor
- "Continue Reading" from series page
- Series progress indicator

**Effort Estimate**: Medium (2-4 weeks)  
**Value**: Very High - Essential for comic/manga support

---

### 3. **Duplicate Detection** 🌟 RECOMMENDED

**What Komga Does:**
- Duplicate file detection using file hashes
- Duplicate page detection within books
- UI to review and remove duplicates

**Why CleverFerret Needs This:**
- Users often have duplicate books from different sources
- Wastes storage space
- Causes confusion in library browsing
- Already has `ContentFingerprinter` service!

**Implementation Approach:**
1. Leverage existing `ContentFingerprinter.kt`:
```kotlin
// Already exists, just needs integration:
class ContentFingerprinter {
    suspend fun generateDocumentFingerprint(content: String): String
    suspend fun generateVideoFingerprint(context: Context, uri: Uri): String
    suspend fun generateAudioFingerprint(context: Context, uri: Uri): String
}
```

2. Add duplicate detection service:
```kotlin
class DuplicateDetectionService {
    suspend fun scanForDuplicates(libraryId: Long): List<DuplicateGroup>
    suspend fun scanForDuplicatePages(bookId: Long): List<PageDuplicate>
}

data class DuplicateGroup(
    val fingerprint: String,
    val mediaItems: List<MediaItem>
)
```

3. Create UI for reviewing duplicates

**UI Considerations:**
- "Find Duplicates" action in library menu
- Side-by-side comparison view
- Batch delete or keep best quality
- Warning before deletion

**Effort Estimate**: Medium (2-3 weeks)  
**Value**: High - Helps users maintain clean libraries

---

### 4. **Enhanced Metadata Extraction** 🌟 RECOMMENDED

**What Komga Does:**
- Extracts embedded metadata (ComicInfo.xml for CBZ)
- Reads EPUB metadata from OPF files
- Extracts cover images from archives
- Parses filename conventions for metadata

**Why CleverFerret Needs This:**
- Current implementation is basic
- Comics/manga often have embedded ComicInfo.xml
- EPUBs contain rich metadata that's not being used
- Reduces manual metadata entry

**Implementation Approach:**
1. Add metadata extractors:
```kotlin
interface MetadataExtractor {
    suspend fun extract(file: File): MediaMetadata
}

class ComicInfoExtractor : MetadataExtractor {
    // Parse ComicInfo.xml from CBZ
}

class EpubMetadataExtractor : MetadataExtractor {
    // Parse OPF files from EPUB
}

class FilenameMetadataExtractor : MetadataExtractor {
    // Parse patterns like "Series Name v01 (2020).cbz"
}
```

2. Chain extractors in order of reliability
3. Merge results intelligently

**UI Considerations:**
- Show metadata source (file, embedded, user-edited)
- Allow "Refresh Metadata" action
- Indicate when metadata is auto-detected vs manual

**Effort Estimate**: Medium-High (3-4 weeks)  
**Value**: High - Dramatically improves user experience

---

### 5. **Reading Progress Sync** 🌟 RECOMMENDED

**What Komga Does:**
- Tracks reading progress per book per user
- Marks books as read/unread
- "Continue Reading" feature
- Recently read list

**Why CleverFerret Needs This:**
- Essential for multi-device use
- Users want to continue where they left off
- Already partially implemented in reader screens

**Implementation Approach:**
1. Enhance existing schema:
```kotlin
@Entity(tableName = "reading_progress")
data class ReadingProgress(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val mediaItemId: Long,
    val userId: Long = 1, // For future multi-user support
    val currentPage: Int,
    val totalPages: Int,
    val progressPercent: Float,
    val completed: Boolean = false,
    val lastReadDate: Long = System.currentTimeMillis()
)
```

2. Update on reader close/page turn
3. Show progress indicators in library views

**UI Considerations:**
- Progress bar on book cards
- "Continue Reading" section on home screen
- "Mark as Read/Unread" actions
- Reading statistics

**Effort Estimate**: Low-Medium (1-2 weeks)  
**Value**: Very High - Essential feature for readers

---

## 📚 MEDIUM-PRIORITY FEATURES (Phase 2)

Valuable features that require more effort or are less critical.

### 6. **OPDS Support**

**What Komga Does:**
- OPDS v1 and v2 servers
- Allows reading apps to browse and download books
- Works with Moon+ Reader, FBReader, Chunky, etc.

**Why CleverFerret Might Want This:**
- Makes CleverFerret a server for other reading apps
- Useful for multi-device scenarios
- Standard protocol with wide support

**Implementation Notes:**
- Requires HTTP server component
- Spring Boot or Ktor would be needed
- Out of scope for mobile-first app, but could be added later

**Effort Estimate**: High (4-6 weeks)  
**Value**: Medium - Nice to have for power users

---

### 7. **Kobo/KOReader Sync**

**What Komga Does:**
- Syncs reading progress with Kobo eReaders
- Syncs with KOReader app/devices
- Allows seamless transitions between devices

**Why CleverFerret Might Want This:**
- Great for users with eReaders
- Differentiates from competitors
- Adds value for serious readers

**Implementation Notes:**
- Complex protocols
- Requires server component
- Lower priority for Android-focused app

**Effort Estimate**: Very High (6-8 weeks)  
**Value**: Medium - Only valuable for eReader users

---

### 8. **Thumbnail Generation & Caching**

**What Komga Does:**
- Generates thumbnails for all books
- Caches at multiple sizes
- Extracts cover images from archives/PDFs
- Optimizes for fast browsing

**Why CleverFerret Needs This:**
- Faster library browsing
- Better visual experience
- Reduces memory usage

**Implementation Approach:**
1. Use Coil for image loading (already in use)
2. Add thumbnail cache:
```kotlin
class ThumbnailService {
    suspend fun generateThumbnail(
        mediaItemId: Long,
        size: ThumbnailSize
    ): File
}

enum class ThumbnailSize {
    SMALL(150), MEDIUM(300), LARGE(600)
}
```

3. Extract covers from CBZ/EPUB/PDF
4. Store in cache directory

**Effort Estimate**: Medium (2-3 weeks)  
**Value**: High - Significantly improves UI performance

---

### 9. **Age Ratings & Content Filtering**

**What Komga Does:**
- Age rating metadata for series
- User restrictions based on age ratings
- Label-based content filtering
- Parental controls

**Why CleverFerret Might Want This:**
- Important for family sharing
- Comics/manga often have age-inappropriate content
- Helps with content organization

**Implementation Approach:**
```kotlin
// Add to MediaItem/Series
data class MediaItem(
    // ... existing fields
    val ageRating: AgeRating? = null,
    val contentWarnings: List<String> = emptyList()
)

enum class AgeRating {
    EVERYONE, EVERYONE_10_PLUS, TEEN, MATURE_17_PLUS, ADULTS_ONLY
}

// Add user preferences
data class UserPreferences(
    val maxAgeRating: AgeRating = AgeRating.ADULTS_ONLY,
    val hiddenTags: List<String> = emptyList()
)
```

**Effort Estimate**: Medium (2-3 weeks)  
**Value**: Medium-High - Important for certain use cases

---

### 10. **Batch Operations**

**What Komga Does:**
- Batch metadata editing
- Batch download
- Batch mark as read/unread
- Batch delete

**Why CleverFerret Needs This:**
- Essential for managing large libraries
- Saves time on repetitive tasks
- Expected feature in media managers

**Implementation Approach:**
1. Add multi-select mode to library views
2. Batch operation menu
3. Progress indicators for long operations

**UI Considerations:**
- Checkbox mode in list/grid views
- "Select All" option
- Bulk action bottom sheet
- Confirm dangerous operations

**Effort Estimate**: Low-Medium (1-2 weeks)  
**Value**: High - Quality of life improvement

---

## 🚀 ADVANCED FEATURES (Phase 3)

Features that require significant effort or architectural changes.

### 11. **REST API**

**What Komga Does:**
- Comprehensive REST API
- Authentication & authorization
- API documentation (OpenAPI)
- Supports third-party tools

**Why CleverFerret Might Want This:**
- Enables ecosystem of tools
- Web interface possibility
- Integration with other apps

**Implementation Notes:**
- Requires server architecture
- Needs authentication system
- Better suited for desktop/server version

**Effort Estimate**: Very High (8-12 weeks)  
**Value**: Low-Medium for mobile app

---

### 12. **Multi-User Support**

**What Komga Does:**
- Multiple user accounts
- Per-library access control
- Individual reading progress
- User preferences

**Why CleverFerret Might Want This:**
- Useful for family devices
- Different reading preferences per user
- Privacy concerns

**Implementation Notes:**
- Significant database changes
- Authentication system needed
- Android user accounts integration possible

**Effort Estimate**: Very High (6-10 weeks)  
**Value**: Low-Medium - Most users don't share devices

---

## 🎨 UI/UX INSPIRATIONS FROM KOMGA

### 1. **Grid Layouts with Covers**
- Large, prominent cover images
- Metadata overlay on hover/long-press
- Progress indicators on covers
- Unread badges

### 2. **Filtering & Sorting**
- Multiple filter criteria (genre, status, rating)
- Saved filter presets
- Quick filter chips
- Advanced search

### 3. **Series Detail Pages**
- Series banner/hero image
- Complete metadata display
- Book list in reading order
- Reading progress per book
- Related series suggestions

### 4. **Reader Features**
- Fullscreen mode with hidden UI
- Settings panel overlay
- Page navigation drawer
- Bookmark indicators on progress bar

---

## 📊 IMPLEMENTATION PRIORITY MATRIX

| Feature | Value | Effort | Priority | Phase |
|---------|-------|--------|----------|-------|
| Collections & Read Lists | Very High | Medium | **P1** | 2 |
| Series Management | Very High | Medium | **P1** | 2 |
| Reading Progress Sync | Very High | Low | **P1** | 1 |
| Duplicate Detection | High | Medium | **P2** | 2 |
| Enhanced Metadata | High | High | **P2** | 2 |
| Thumbnail Caching | High | Medium | **P2** | 2 |
| Batch Operations | High | Low | **P2** | 2 |
| Age Ratings | Medium | Medium | **P3** | 2-3 |
| OPDS Support | Medium | High | **P4** | 3 |
| Kobo Sync | Medium | Very High | **P5** | 3 |
| REST API | Low | Very High | **P6** | 3+ |
| Multi-User | Low | Very High | **P6** | 3+ |

---

## 🛠 RECOMMENDED IMPLEMENTATION ROADMAP

### **Immediate (Next 1-2 Months)**
Focus on completing MVP as outlined in `FEATURES_TO_IMPLEMENT.md`, then:

1. **Reading Progress Sync** (1-2 weeks)
   - Already partially implemented
   - High value, low effort
   - Enables "Continue Reading" feature

2. **Batch Operations** (1-2 weeks)
   - Improves usability
   - Relatively simple to implement
   - Prepares for larger libraries

### **Short Term (Months 3-4)**
After MVP is stable:

3. **Collections & Read Lists** (2-3 weeks)
   - Major organizational feature
   - Differentiates from basic file browsers
   - Aligns with Phase 2 roadmap

4. **Series Management** (2-4 weeks)
   - Essential for comics/manga support
   - Database schema mostly ready
   - Natural progression from collections

5. **Thumbnail Caching** (2-3 weeks)
   - Performance improvement
   - Better visual experience
   - Supports growing library sizes

### **Medium Term (Months 5-6)**
As the app matures:

6. **Enhanced Metadata Extraction** (3-4 weeks)
   - Reduces manual work
   - Improves comic/manga support
   - Better integration with existing libraries

7. **Duplicate Detection** (2-3 weeks)
   - Helps maintain clean libraries
   - Leverages existing ContentFingerprinter
   - Power user feature

8. **Age Ratings & Filtering** (2-3 weeks)
   - Important for family use
   - Enhances content organization
   - Prepares for content warnings

### **Long Term (6+ Months)**
If app gains traction:

9. **OPDS Support** (4-6 weeks)
   - Makes CleverFerret a server
   - Ecosystem integration
   - Requires architectural changes

10. **Advanced Features** (as needed)
    - REST API
    - Kobo/KOReader sync
    - Multi-user support

---

## 🔧 TECHNICAL RECOMMENDATIONS

### 1. **Database Schema Enhancements**

Add these tables to support Komga-inspired features:

```kotlin
// Collections
@Entity(tableName = "collections")
data class Collection(...)

@Entity(tableName = "collection_items")
data class CollectionItem(...)

// Read Lists
@Entity(tableName = "read_lists")
data class ReadList(...)

@Entity(tableName = "read_list_items")
data class ReadListItem(...)

// Reading Progress (enhance existing)
@Entity(tableName = "reading_progress")
data class ReadingProgress(...)

// Thumbnails
@Entity(tableName = "thumbnails")
data class Thumbnail(
    @PrimaryKey val mediaItemId: Long,
    val smallPath: String?,
    val mediumPath: String?,
    val largePath: String?,
    val generatedDate: Long
)
```

### 2. **Service Layer**

Create these new services:

```kotlin
@Singleton
class CollectionService @Inject constructor(...)

@Singleton
class ReadListService @Inject constructor(...)

@Singleton
class SeriesService @Inject constructor(...)

@Singleton
class DuplicateDetectionService @Inject constructor(...)

@Singleton
class ThumbnailService @Inject constructor(...)
```

### 3. **UI Components**

Build reusable components:

```kotlin
@Composable
fun CollectionCard(collection: Collection, onClick: () -> Unit)

@Composable
fun SeriesDetailView(seriesId: Long)

@Composable
fun ReadListEditor(readList: ReadList)

@Composable
fun DuplicateReviewDialog(duplicates: DuplicateGroup)
```

### 4. **Metadata Extractors**

Implement extractor chain:

```kotlin
class MetadataExtractorChain {
    private val extractors = listOf(
        EmbeddedMetadataExtractor(),  // ComicInfo.xml, EPUB OPF
        FilenameMetadataExtractor(),   // Parse filename patterns
        OnlineMetadataExtractor()      // Existing API fetchers
    )
    
    suspend fun extract(file: File): MediaMetadata {
        // Try each extractor, merge results
    }
}
```

---

## 🎯 KEY DIFFERENTIATORS TO MAINTAIN

While learning from Komga, CleverFerret should maintain its unique position:

### **CleverFerret's Strengths:**
1. **Native Android App** - Better performance than web UI
2. **Universal Media Support** - Books, comics, music, video (not just comics)
3. **On-Device First** - No server required
4. **Modern UI** - Jetpack Compose + Material You
5. **AI Integration** - Gemini OCR plugin for metadata extraction
6. **Calibre Import** - Smooth migration path

### **Don't Copy Blindly:**
1. **Server Architecture** - CleverFerret is mobile-first, not server-based
2. **Web UI** - Android native UI is better for mobile
3. **Multi-User** - Most users don't need this on mobile
4. **Docker Deployment** - Not relevant for Android app

---

## 📝 CONCLUSION

Komga provides excellent inspiration for CleverFerret, particularly in these areas:

**Must Implement (High ROI):**
- Collections & Read Lists
- Series Management
- Reading Progress Sync
- Enhanced Metadata Extraction

**Should Implement (Good ROI):**
- Duplicate Detection
- Thumbnail Caching
- Batch Operations
- Age Ratings & Filtering

**Consider Later (Low ROI for Mobile):**
- OPDS Support
- Kobo/KOReader Sync
- REST API
- Multi-User Support

The key is to **adapt Komga's organizational concepts** to CleverFerret's mobile-first, universal media library vision while maintaining focus on the core book reading experience.

---

**Next Steps:**
1. Complete MVP features from `FEATURES_TO_IMPLEMENT.md`
2. Implement Reading Progress Sync (quick win)
3. Add Collections & Read Lists (major feature)
4. Enhance Series Management (comic/manga support)
5. Iterate based on user feedback

---

**Document Version**: 1.0  
**Last Updated**: January 2025  
**Author**: CleverFerret Development Team
