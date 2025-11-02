# Badreads Integration - Feature Documentation

This document describes the features integrated from the [badreads project](https://github.com/fenimore/badreads) into CleverFerret.

## Overview

Badreads is a book tracking Android application that inspired several features in CleverFerret. We've integrated and enhanced the following capabilities:

1. **Goodreads CSV Import/Export** - Full library backup and migration support
2. **Barcode Scanning** - Quick book addition via ISBN scanning
3. **Purchase Links** - Digital book purchase suggestions for scanned books
4. **Reading Statistics** - Beautiful animated charts showing reading progress
5. **Enhanced Book Metadata** - Additional fields for better book tracking

## Features

### 1. Goodreads CSV Import/Export

**Location:** `com.universalmedialibrary.services.integration.goodreads.GoodreadsImportExport`

Import and export your book library in Goodreads-compatible CSV format.

**Supported Fields:**
- Basic info: Title, Subtitle, Author, Additional Authors
- Identifiers: ISBN-10, ISBN-13
- Publishing: Publisher, Year Published, Original Publication Year
- Physical: Number of Pages, Format (Paperback/Hardcover/etc.)
- Reading: Progress, Series, Language
- Dates: Date Read, Date Added, Date Started
- Personal: My Rating (1-5), My Review/Notes, Bookmark flag
- Organization: Exclusive Shelf (currently-reading, read, to-read)
- Custom: Custom Cover URL, Description

**Usage:**
```kotlin
val service = GoodreadsImportExport()

// Import from CSV
val inputStream = FileInputStream("goodreads_library_export.csv")
val books = service.importFromCSV(inputStream)

// Export to CSV
val outputStream = FileOutputStream("my_library_backup.csv")
service.exportToCSV(outputStream, books)

// Convert to CleverFerret entities
val (mediaItem, metadataCommon, metadataBook) = 
    service.toCleverFerretEntities(books[0], libraryId = 1L)
```

### 2. Barcode Scanning

**Location:** `com.universalmedialibrary.services.barcode.BarcodeScannerService`

Scan book ISBNs using your device camera with ZXing library.

**Features:**
- ISBN-10 and ISBN-13 validation
- ISBN normalization (removes hyphens/spaces)
- Barcode format detection
- Error handling for invalid scans

**Usage:**
```kotlin
val scannerService = BarcodeScannerService()

// Initiate scan from Activity
scannerService.startScan(activity, "Scan book barcode")

// Parse result in onActivityResult
val result = scannerService.parseScanResult(intentResult)
when (result) {
    is ScanResult.Success -> {
        val isbn = result.isbn
        // Search for book using ISBN
    }
    is ScanResult.Cancelled -> {
        // User cancelled scan
    }
    is ScanResult.Error -> {
        // Invalid ISBN
    }
}
```

**UI Screen:** `com.universalmedialibrary.ui.books.BarcodeScannerScreen`

### 3. Purchase Links for Scanned Books

**Location:** `com.universalmedialibrary.services.barcode.BookPurchaseLinksService`

When a book is scanned but not yet in the library, provide purchase links to help users acquire the digital copy.

**Supported Platforms:**

**Free & Open Source:**
- Open Library - Free online library
- Internet Archive - Digital library with borrowing
- Project Gutenberg - Free public domain books

**Commercial Stores:**
- Amazon Kindle
- Google Play Books
- Apple Books
- Kobo
- Barnes & Noble
- Goodreads (for ratings/reviews)

**Features:**
- Platform-specific URL generation
- Share functionality for links
- Categorized display (Free vs Commercial)
- Emoji icons for visual appeal

**Usage:**
```kotlin
val purchaseService = BookPurchaseLinksService(context)

// Get all purchase links
val allLinks = purchaseService.getPurchaseLinks(isbn, title)

// Get only free/open source links
val freeLinks = purchaseService.getFreeSourceLinks(isbn, title)

// Get only commercial links
val commercialLinks = purchaseService.getCommercialLinks(isbn)

// Open link in browser
purchaseService.openPurchaseLink(link)

// Create share intent
val shareIntent = purchaseService.createShareIntent(link, bookTitle)
```

**UI Component:** `com.universalmedialibrary.ui.books.PurchaseLinksDialog`

### 4. Visual Book Distinction

**Location:** `com.universalmedialibrary.ui.books.BookCardComponents`

Books are displayed with clear visual differences based on availability:

#### Available in Library (Has Digital File)
- **Border:** Solid 2dp primary-colored border
- **Background:** Normal surface color
- **Status:** Full metadata displayed
- **Indicates:** Book file exists in library

#### Scanned via Barcode (No File Yet)
- **Border:** 2dp tertiary-colored border (dashed style implied)
- **Background:** Tertiary container with 30% opacity
- **Badge:** QR scanner icon in top-right corner
- **Button:** Shopping cart button for purchase links
- **Status:** Metadata from ISBN lookup
- **Indicates:** Book scanned but needs to be acquired

#### Wish List (Manually Added)
- **Border:** 1dp outline border
- **Background:** Surface variant
- **Indicates:** Book on wishlist, no file

**Components:**
- `EnhancedBookCard` - Full card with all details
- `CompactBookCard` - Grid view card
- `ShelfChip` - Color-coded shelf status
- `BookAvailability` enum - Status tracking

### 5. Reading Statistics with Charts

**Location:** `com.universalmedialibrary.ui.books.ReadingStatisticsWithChartsScreen`

Beautiful animated charts showing reading progress and statistics using MPAndroidChart.

**Charts Included:**

#### Donut/Pie Chart - Yearly Reading Goal
- **Animation:** 1400ms Y-axis with EaseInOutQuad
- **Display:** Percentage complete with center text
- **Colors:** Green (read) vs Gray (remaining)
- **Features:** 
  - Goal setting dialog
  - Progress percentage
  - Book count display

#### Bar Chart - Monthly Reading
- **Animation:** 1500ms Y-axis with EaseInOutCubic
- **Display:** Books read per month (last 12 months)
- **Colors:** Blue bars
- **Features:**
  - Month labels on X-axis
  - Value labels on bars
  - Grid lines for reference

#### Horizontal Bar Chart - Top Publishers
- **Animation:** 1500ms X-axis with EaseInOutCubic
- **Display:** Top 8 most-read publishers
- **Colors:** Rainbow gradient (Orange → Purple)
- **Features:**
  - Truncated labels for long names
  - Book count on bars
  - Sorted by count

#### Summary Statistics Cards
- Total books read (all time)
- Total pages read (formatted: K/M)
- Average pages per book
- Books read this year
- Shelf breakdown (Reading/Read/To Read)

**Usage:**
```kotlin
@Composable
fun MyLibraryScreen() {
    ReadingStatisticsWithChartsScreen(
        libraryId = currentLibraryId,
        onNavigateBack = { navController.popBackStack() }
    )
}
```

### 6. Enhanced Book Metadata

**Location:** `com.universalmedialibrary.data.local.entity.MetadataBook`

Additional fields added to the MetadataBook entity:

```kotlin
data class MetadataBook(
    // ... existing fields ...
    
    // Enhanced fields from badreads
    val bookmarked: Boolean = false,              // Quick favorites flag
    val shelf: String? = null,                     // currently-reading, read, to-read
    val notes: String? = null,                     // User's personal notes/review
    val additionalAuthors: String? = null,         // Co-authors, editors
    val customCoverUrl: String? = null,            // User-provided cover
    
    // Barcode scanning tracking
    val scannedViaBarcode: Boolean = false,        // Added via ISBN scan?
    val purchaseLinksShown: Boolean = false,       // Has user seen purchase options?
    val dateScanned: Long? = null                  // When was it scanned?
)
```

## Dependencies Added

```kotlin
// CSV parsing for Goodreads import/export
implementation("com.github.doyaaaaaken:kotlin-csv-jvm:1.10.0")

// ZXing barcode scanner
implementation("com.journeyapps:zxing-android-embedded:4.3.0")
implementation("com.google.zxing:core:3.5.3")

// MPAndroidChart for statistics visualization
implementation("com.github.PhilJay:MPAndroidChart:v3.1.0")
```

## Architecture Integration

All features follow CleverFerret's architecture:

- **Hilt Dependency Injection** - All services are `@Singleton` with `@Inject`
- **Jetpack Compose UI** - All screens use modern Compose with Material 3
- **Room Database** - Enhanced entities integrate seamlessly
- **Coroutines** - All async operations use Kotlin coroutines
- **ViewModel Pattern** - State management with StateFlow
- **Repository Pattern** - Data access through DAOs

## Testing

Comprehensive unit tests included:

- `GoodreadsImportExportTest` - CSV import/export validation
- Tests for date parsing, empty fields, title splitting
- Entity conversion validation
- All tests passing ✅

## Migration Notes

When migrating from badreads to CleverFerret:

1. **Export from badreads:** Settings → Export Library
2. **Import to CleverFerret:** Use `GoodreadsImportExport.importFromCSV()`
3. **Books marked as unavailable** until files are found/added
4. **Shelves map directly:** currently-reading, read, to-read
5. **Ratings preserved:** 1-5 scale maintained
6. **Dates preserved:** All dates converted to epoch format

## Future Enhancements

Potential future additions:

- [ ] Batch barcode scanning
- [ ] Reading challenges (52 books/year tracking)
- [ ] Reading streak tracking
- [ ] Book recommendations based on history
- [ ] Social features (share reading progress)
- [ ] Library comparison with Goodreads
- [ ] Auto-sync with Goodreads account
- [ ] Reading goals per genre/publisher
- [ ] Time-to-read predictions

## Credits

Features inspired by and adapted from:
- **badreads** - https://github.com/fenimore/badreads
- Copyright 2021 Fenimore Love (GPLv3)
- Original concepts reimplemented in Compose with Material 3
- Enhanced with additional features and modern Android practices

## License

These features are part of CleverFerret and follow the same license as the main project.
