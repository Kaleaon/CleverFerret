# Calibre Features Integration Guide

## 🎯 Overview

This guide provides step-by-step instructions to integrate all 41 newly created Calibre feature files into CleverFerret. The integration requires modifications to 5 existing files and creation of 2 new files.

**Estimated Time**: 30-45 minutes
**Complexity**: Medium
**Risk Level**: Low (non-breaking changes)

---

## 📋 Prerequisites

Ensure all 41 feature files are in place:
- ✅ 12 Fanfiction files
- ✅ 5 HD Cover Source files  
- ✅ 4 Enhanced Metadata files
- ✅ 3 Comic Enhancement files
- ✅ 6 Audiobook Support files
- ✅ 3 EPUB Tools files
- ✅ 4 Organization Tools files
- ✅ 2 AI Features files
- ✅ 2 Type Converters

---

## 🔧 Step 1: Database Migration (10 minutes)

### File: `CleverFerret/src/main/java/com/universalmedialibrary/data/local/AppDatabase.kt`

#### 1.1: Add New Entities

Add these two entities to the `entities` array (around line 27):

```kotlin
@Database(
    entities = [
        // ... existing entities ...
        
        // NEW: Calibre Features
        FanfictionStoryEntity::class,
        AudiobookEntity::class,
        
        // ... rest of existing entities ...
    ],
    version = 28, // INCREMENT from 27 to 28
    exportSchema = false
)
```

#### 1.2: Add Type Converter

Update the `@TypeConverters` annotation (around line 131):

```kotlin
@TypeConverters(
    Converters::class,
    AudioChapterListConverter::class  // ADD THIS LINE
)
```

#### 1.3: Add DAOs

Add these abstract methods after line 191 (after `comicTranslationCacheDao()`):

```kotlin
// Calibre Features DAOs
abstract fun fanfictionDao(): FanfictionDao
abstract fun audiobookDao(): AudiobookDao
```

#### 1.4: Create Migration

Create new file: `CleverFerret/src/main/java/com/universalmedialibrary/data/local/AppDatabaseMigrations.kt`

Add this at the end of the `AppDatabaseMigrations` object:

```kotlin
val MIGRATION_27_28 = object : Migration(27, 28) {
    override fun migrate(database: SupportSQLiteDatabase) {
        // Fanfiction Stories table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS fanfiction_stories (
                id TEXT PRIMARY KEY NOT NULL,
                url TEXT NOT NULL,
                title TEXT NOT NULL,
                author TEXT,
                summary TEXT,
                site_name TEXT NOT NULL,
                word_count INTEGER NOT NULL DEFAULT 0,
                chapter_count INTEGER NOT NULL DEFAULT 0,
                completion_status TEXT NOT NULL,
                rating TEXT,
                language TEXT NOT NULL DEFAULT 'en',
                genre TEXT,
                characters TEXT,
                tags TEXT NOT NULL,
                cover_url TEXT,
                date_published INTEGER,
                date_updated INTEGER,
                date_downloaded INTEGER NOT NULL,
                last_checked INTEGER NOT NULL,
                local_epub_path TEXT,
                has_updates INTEGER NOT NULL DEFAULT 0
            )
        """)
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_fanfiction_stories_site_name 
            ON fanfiction_stories(site_name)
        """)
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_fanfiction_stories_completion_status 
            ON fanfiction_stories(completion_status)
        """)
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_fanfiction_stories_date_updated 
            ON fanfiction_stories(date_updated)
        """)
        
        // Audiobooks table
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS audiobooks (
                id TEXT PRIMARY KEY NOT NULL,
                filePath TEXT NOT NULL,
                title TEXT NOT NULL,
                author TEXT,
                narrator TEXT,
                description TEXT,
                genre TEXT,
                publisher TEXT,
                publishDate TEXT,
                duration INTEGER NOT NULL,
                bitrate INTEGER,
                sampleRate INTEGER,
                codec TEXT,
                coverPath TEXT,
                chapterCount INTEGER NOT NULL DEFAULT 0,
                chapters TEXT NOT NULL,
                language TEXT NOT NULL DEFAULT 'en',
                lastPlayedPosition INTEGER NOT NULL DEFAULT 0,
                isFinished INTEGER NOT NULL DEFAULT 0,
                dateAdded INTEGER NOT NULL,
                lastPlayed INTEGER
            )
        """)
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_author 
            ON audiobooks(author)
        """)
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_genre 
            ON audiobooks(genre)
        """)
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_dateAdded 
            ON audiobooks(dateAdded)
        """)
        
        database.execSQL("""
            CREATE INDEX IF NOT EXISTS index_audiobooks_isFinished 
            ON audiobooks(isFinished)
        """)
    }
}
```

#### 1.5: Add Migration to Database Builder

In `AppDatabase.kt`, update the `addMigrations` call (around line 212):

```kotlin
.addMigrations(
    AppDatabaseMigrations.MIGRATION_20_21,
    AppDatabaseMigrations.MIGRATION_21_22,
    AppDatabaseMigrations.MIGRATION_22_23,
    AppDatabaseMigrations.MIGRATION_23_24,
    AppDatabaseMigrations.MIGRATION_24_25,
    AppDatabaseMigrations.MIGRATION_25_26,
    AppDatabaseMigrations.MIGRATION_26_27,
    AppDatabaseMigrations.MIGRATION_27_28  // ADD THIS LINE
)
```

---

## 🔌 Step 2: Dependency Injection (15 minutes)

### File: `CleverFerret/src/main/java/com/universalmedialibrary/di/DatabaseModule.kt`

Add these DAO providers at the end of the module (before the closing brace):

```kotlin
// Calibre Features DAOs
@Provides
fun provideFanfictionDao(database: AppDatabase): FanfictionDao {
    return database.fanfictionDao()
}

@Provides
fun provideAudiobookDao(database: AppDatabase): AudiobookDao {
    return database.audiobookDao()
}
```

### NEW File: `CleverFerret/src/main/java/com/universalmedialibrary/di/CalibreModule.kt`

Create this new file:

```kotlin
package com.universalmedialibrary.di

import com.universalmedialibrary.data.local.dao.AudiobookDao
import com.universalmedialibrary.data.local.dao.FanfictionDao
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.ai.GrokAnalysisService
import com.universalmedialibrary.services.ai.TranslationService
import com.universalmedialibrary.services.audiobook.AudiobookService
import com.universalmedialibrary.services.comic.ComicInfoHandler
import com.universalmedialibrary.services.comic.ComicvineMetadataSource
import com.universalmedialibrary.services.epub.EpubCreatorService
import com.universalmedialibrary.services.epub.EpubMergeService
import com.universalmedialibrary.services.epub.EpubSplitService
import com.universalmedialibrary.services.epub.EpubValidationService
import com.universalmedialibrary.services.fanfiction.FanfictionDownloadService
import com.universalmedialibrary.services.fanfiction.FanfictionSiteAdapter
import com.universalmedialibrary.services.fanfiction.adapters.AO3Adapter
import com.universalmedialibrary.services.fanfiction.adapters.FFNAdapter
import com.universalmedialibrary.services.fanfiction.adapters.RoyalRoadAdapter
import com.universalmedialibrary.services.metadata.MetadataService
import com.universalmedialibrary.services.metadata.covers.AmazonCoverSource
import com.universalmedialibrary.services.metadata.covers.AppleBooksCoverSource
import com.universalmedialibrary.services.metadata.covers.CoverService
import com.universalmedialibrary.services.metadata.covers.GoogleBooksCoverSource
import com.universalmedialibrary.services.metadata.sources.GoodreadsMetadataSource
import com.universalmedialibrary.services.metadata.sources.MetadataSource
import com.universalmedialibrary.services.metadata.sources.OpenLibraryMetadataSource
import com.universalmedialibrary.services.organization.DuplicateDetectionService
import com.universalmedialibrary.services.organization.SeriesManagementService
import android.content.Context
import dagger.Binds
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import dagger.multibindings.IntoSet
import okhttp3.OkHttpClient
import javax.inject.Singleton

/**
 * Hilt module for Calibre plugin features
 */
@Module
@InstallIn(SingletonComponent::class)
object CalibreModule {
    
    // Fanfiction Services
    @Provides
    @Singleton
    fun provideFanfictionDownloadService(
        @ApplicationContext context: Context,
        httpClient: OkHttpClient,
        epubCreator: EpubCreatorService,
        fanfictionDao: FanfictionDao
    ): FanfictionDownloadService {
        return FanfictionDownloadService(context, httpClient, epubCreator, fanfictionDao)
    }
    
    @Provides
    @Singleton
    fun provideEpubCreatorService(): EpubCreatorService {
        return EpubCreatorService()
    }
    
    @Provides
    @Singleton
    fun provideEpubMergeService(
        @ApplicationContext context: Context,
        epubCreator: EpubCreatorService
    ): EpubMergeService {
        return EpubMergeService(context, epubCreator)
    }
    
    @Provides
    @Singleton
    fun provideEpubSplitService(
        @ApplicationContext context: Context,
        epubCreator: EpubCreatorService
    ): EpubSplitService {
        return EpubSplitService(context, epubCreator)
    }
    
    @Provides
    @Singleton
    fun provideEpubValidationService(): EpubValidationService {
        return EpubValidationService()
    }
    
    // Audiobook Services
    @Provides
    @Singleton
    fun provideAudiobookService(
        @ApplicationContext context: Context,
        audiobookDao: AudiobookDao
    ): AudiobookService {
        return AudiobookService(context, audiobookDao)
    }
    
    // Cover Services
    @Provides
    @Singleton
    fun provideCoverService(
        @ApplicationContext context: Context,
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): CoverService {
        val sources = listOf(
            AppleBooksCoverSource(httpClient),
            AmazonCoverSource(httpClient),
            GoogleBooksCoverSource(httpClient, apiKeyRepository)
        )
        return CoverService(context, sources)
    }
    
    // Metadata Service
    @Provides
    @Singleton
    fun provideMetadataService(
        metadataSources: Set<@JvmSuppressWildcards MetadataSource>
    ): MetadataService {
        return MetadataService(metadataSources)
    }
    
    // Comic Services
    @Provides
    @Singleton
    fun provideComicInfoHandler(): ComicInfoHandler {
        return ComicInfoHandler()
    }
    
    @Provides
    @Singleton
    fun provideComicvineMetadataSource(
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): ComicvineMetadataSource {
        return ComicvineMetadataSource(httpClient, apiKeyRepository)
    }
    
    // Organization Services
    @Provides
    @Singleton
    fun provideDuplicateDetectionService(): DuplicateDetectionService {
        return DuplicateDetectionService()
    }
    
    @Provides
    @Singleton
    fun provideSeriesManagementService(
        bookDao: com.universalmedialibrary.data.local.dao.BookDao
    ): SeriesManagementService {
        return SeriesManagementService(bookDao)
    }
    
    // AI Services
    @Provides
    @Singleton
    fun provideTranslationService(
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): TranslationService {
        return TranslationService(httpClient, apiKeyRepository)
    }
    
    @Provides
    @Singleton
    fun provideGrokAnalysisService(
        httpClient: OkHttpClient,
        apiKeyRepository: APIKeyRepository
    ): GrokAnalysisService {
        return GrokAnalysisService(httpClient, apiKeyRepository)
    }
}

/**
 * Module for binding metadata sources into a set
 */
@Module
@InstallIn(SingletonComponent::class)
abstract class MetadataSourcesModule {
    
    @Binds
    @IntoSet
    abstract fun bindGoodreads(impl: GoodreadsMetadataSource): MetadataSource
    
    @Binds
    @IntoSet
    abstract fun bindOpenLibrary(impl: OpenLibraryMetadataSource): MetadataSource
}
```

---

## 🧭 Step 3: Navigation (5 minutes)

### File: Create `CleverFerret/src/main/java/com/universalmedialibrary/ui/navigation/CalibreNavigation.kt`

```kotlin
package com.universalmedialibrary.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.universalmedialibrary.ui.audiobook.AudiobookLibraryScreen
import com.universalmedialibrary.ui.fanfiction.FanfictionDownloadScreen
import com.universalmedialibrary.ui.fanfiction.FanfictionLibraryScreen
import com.universalmedialibrary.ui.organization.DuplicateDetectionScreen

/**
 * Navigation destinations for Calibre features
 */
object CalibreDestinations {
    const val FANFICTION_DOWNLOAD = "fanfiction_download"
    const val FANFICTION_LIBRARY = "fanfiction_library"
    const val AUDIOBOOK_LIBRARY = "audiobook_library"
    const val DUPLICATE_DETECTION = "duplicate_detection"
}

/**
 * Add Calibre feature routes to navigation
 */
fun NavGraphBuilder.calibreGraph(
    navController: NavHostController
) {
    composable(CalibreDestinations.FANFICTION_DOWNLOAD) {
        FanfictionDownloadScreen(
            onNavigateBack = { navController.popBackStack() },
            onNavigateToLibrary = { 
                navController.navigate(CalibreDestinations.FANFICTION_LIBRARY)
            }
        )
    }
    
    composable(CalibreDestinations.FANFICTION_LIBRARY) {
        FanfictionLibraryScreen(
            onNavigateBack = { navController.popBackStack() },
            onNavigateToDownload = {
                navController.navigate(CalibreDestinations.FANFICTION_DOWNLOAD)
            }
        )
    }
    
    composable(CalibreDestinations.AUDIOBOOK_LIBRARY) {
        AudiobookLibraryScreen(
            onNavigateBack = { navController.popBackStack() },
            onImportClick = { /* File picker */ },
            onAudiobookClick = { /* Navigate to player */ }
        )
    }
    
    composable(CalibreDestinations.DUPLICATE_DETECTION) {
        DuplicateDetectionScreen(
            onNavigateBack = { navController.popBackStack() }
        )
    }
}
```

---

## 🏠 Step 4: Home Screen Integration (5 minutes)

### File: `CleverFerret/src/main/java/com/universalmedialibrary/ui/home/HomeScreen.kt`

#### 4.1: Fix Duplicate Lines

Remove lines 537-539 (duplicate declaration):

```kotlin
// DELETE THESE LINES (537-539):
  val totalHours: Int
)
```

#### 4.2: Add Calibre Features to Quick Actions

Replace the `QuickActionsGrid` function (starts around line 355) with:

```kotlin
@Composable
private fun QuickActionsGrid(
    onNavigateToMusic: () -> Unit,
    onNavigateToVideos: () -> Unit,
    onNavigateToBooks: () -> Unit,
    onNavigateToComics: () -> Unit,
    onNavigateToVisualizer: () -> Unit,
    onNavigateToFanfiction: () -> Unit = {},  // NEW
    onNavigateToAudiobooks: () -> Unit = {},  // NEW
    onNavigateToDuplicates: () -> Unit = {}   // NEW
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        // First row
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            QuickActionCard(
                title = "Music",
                icon = Icons.Default.MusicNote,
                onClick = onNavigateToMusic,
                modifier = Modifier.weight(1f)
            )
            QuickActionCard(
                title = "Videos",
                icon = Icons.Default.Movie,
                onClick = onNavigateToVideos,
                modifier = Modifier.weight(1f)
            )
            QuickActionCard(
                title = "Books",
                icon = Icons.Default.MenuBook,
                onClick = onNavigateToBooks,
                modifier = Modifier.weight(1f)
            )
        }
        
        // Second row
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            QuickActionCard(
                title = "Comics",
                icon = Icons.Default.Book,
                onClick = onNavigateToComics,
                modifier = Modifier.weight(1f)
            )
            QuickActionCard(
                title = "Fanfiction",
                icon = Icons.Default.AutoStories,  // NEW
                onClick = onNavigateToFanfiction,  // NEW
                modifier = Modifier.weight(1f)
            )
            QuickActionCard(
                title = "Audiobooks",
                icon = Icons.Default.Headphones,  // NEW
                onClick = onNavigateToAudiobooks,  // NEW
                modifier = Modifier.weight(1f)
            )
        }
        
        // Third row
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            QuickActionCard(
                title = "Visualizer",
                icon = Icons.Default.GraphicEq,
                onClick = onNavigateToVisualizer,
                modifier = Modifier.weight(1f)
            )
            QuickActionCard(
                title = "Organize",
                icon = Icons.Default.Settings,  // NEW
                onClick = onNavigateToDuplicates,  // NEW
                modifier = Modifier.weight(1f)
            )
            // Empty card for symmetry
            Spacer(modifier = Modifier.weight(1f))
        }
    }
}
```

#### 4.3: Update HomeScreen Composable

Update the `HomeScreen` function parameters and QuickActionsGrid call:

```kotlin
@Composable
fun HomeScreen(
    onNavigateToMedia: (String, Long) -> Unit,
    onNavigateToSearch: () -> Unit,
    onNavigateToLibrary: () -> Unit,
    onNavigateToVisualizer: () -> Unit = {},
    onNavigateToFanfiction: () -> Unit = {},  // NEW
    onNavigateToAudiobooks: () -> Unit = {},  // NEW
    onNavigateToDuplicates: () -> Unit = {},  // NEW
    viewModel: HomeViewModel = hiltViewModel()
) {
    // ... existing code ...
    
    // Find the QuickActionsGrid call and update it:
    item {
        QuickActionsGrid(
            onNavigateToMusic = { onNavigateToMedia("music", 0) },
            onNavigateToVideos = { onNavigateToMedia("video", 0) },
            onNavigateToBooks = { onNavigateToMedia("book", 0) },
            onNavigateToComics = { onNavigateToMedia("comic", 0) },
            onNavigateToVisualizer = onNavigateToVisualizer,
            onNavigateToFanfiction = onNavigateToFanfiction,  // NEW
            onNavigateToAudiobooks = onNavigateToAudiobooks,  // NEW
            onNavigateToDuplicates = onNavigateToDuplicates   // NEW
        )
    }
}
```

---

## ✅ Step 5: Verification (5 minutes)

### 5.1: Build the Project

```bash
cd /workspace
./gradlew :CleverFerret:assembleDebug
```

### 5.2: Check for Compilation Errors

If you get compilation errors:

1. **Missing imports**: Add the required imports at the top of files
2. **Unresolved references**: Ensure all 41 feature files are in place
3. **Type mismatches**: Double-check the code snippets above

### 5.3: Run Database Migration Test

After the app starts, verify:
1. No database crash on startup
2. New tables created (check with Database Inspector in Android Studio)
3. DAOs accessible in injected classes

---

## 🎯 Final Integration Checklist

- [ ] Database version incremented to 28
- [ ] FanfictionStoryEntity added to entities array
- [ ] AudiobookEntity added to entities array
- [ ] AudioChapterListConverter added to TypeConverters
- [ ] fanfictionDao() and audiobookDao() added to AppDatabase
- [ ] MIGRATION_27_28 created in AppDatabaseMigrations.kt
- [ ] Migration added to addMigrations() call
- [ ] FanfictionDao and AudiobookDao providers added to DatabaseModule
- [ ] CalibreModule.kt created with all service providers
- [ ] MetadataSourcesModule created for metadata sources
- [ ] CalibreNavigation.kt created with navigation routes
- [ ] HomeScreen.kt updated with new quick action cards
- [ ] Duplicate lines removed from HomeScreen.kt (537-539)
- [ ] Project builds successfully
- [ ] App launches without crashes
- [ ] New features accessible from home screen

---

## 🚀 What's Next?

After integration is complete:

1. **Test Each Feature**:
   - Download a fanfiction story
   - Import an audiobook
   - Check for duplicates
   - Test metadata sources

2. **UI Polish** (optional):
   - Add animations
   - Refine error messages
   - Add loading skeletons
   - Improve empty states

3. **Additional Features**:
   - Translation UI screens
   - Ask Grok UI
   - EPUB merge/split UI
   - Series management UI

4. **Documentation**:
   - User guide
   - API documentation
   - Feature tutorials

---

## 🐛 Troubleshooting

### Issue: Database migration fails

**Solution**: Clear app data and reinstall
```bash
adb uninstall com.universalmedialibrary
./gradlew :CleverFerret:installDebug
```

### Issue: Dependency injection error

**Solution**: Rebuild project
```bash
./gradlew clean
./gradlew :CleverFerret:assembleDebug
```

### Issue: Missing imports

**Solution**: Add these imports to files as needed:
```kotlin
import com.universalmedialibrary.services.fanfiction.*
import com.universalmedialibrary.services.audiobook.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.local.dao.*
```

### Issue: BookDao not found in SeriesManagementService

**Solution**: The existing `BookDao` should already exist. If not, you can pass `MediaItemDao` instead and update the service accordingly.

---

## 📞 Support

If you encounter issues during integration:

1. Check that all 41 files are correctly placed in their directories
2. Verify import statements are correct
3. Ensure Kotlin and Compose compiler versions are compatible
4. Check the comprehensive implementation documentation at:
   - `COMPREHENSIVE_CALIBRE_IMPLEMENTATION_COMPLETE.md`
   - `COMPLETE_IMPLEMENTATION_SUMMARY.md`

---

*Integration Guide - CleverFerret v1.0*
*Last Updated: 2025-10-27*
