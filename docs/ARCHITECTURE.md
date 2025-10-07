# Architecture Guide

Technical architecture documentation for CleverFerret Universal Media Library.

---

## Overview

CleverFerret is built with modern Android development practices, following clean architecture principles with clear separation of concerns. The app is designed to be extensible, testable, and maintainable.

---

## Technology Stack

### Core Technologies

- **Language**: Kotlin 1.9.23
- **UI Framework**: Jetpack Compose with Material 3
- **Architecture Pattern**: MVVM (Model-View-ViewModel)
- **Dependency Injection**: Hilt 2.51.1
- **Database**: Room 2.6.1 (SQLite wrapper)
- **Async Programming**: Kotlin Coroutines and Flow
- **Build System**: Gradle 8.8 with Android Gradle Plugin 8.4.1

### Android Configuration

- **Min SDK**: 26 (Android 8.0 Oreo)
- **Target SDK**: 34 (Android 14)
- **Compile SDK**: 34
- **Jetpack Compose BOM**: 2024.05.00

---

## Application Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        UI Layer                             │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │  MainActivity   │  │  Compose UI     │                  │
│  │  (Single)       │  │  Components     │                  │
│  └─────────────────┘  └─────────────────┘                  │
│         │                      │                             │
│         │     observes State   │                             │
│         └──────────────────────┘                             │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                    Domain Layer                             │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │   ViewModels    │  │   Use Cases     │                  │
│  │   (State Mgmt)  │  │   (Business     │                  │
│  │                 │  │    Logic)       │                  │
│  └─────────────────┘  └─────────────────┘                  │
│         │                      │                             │
│         │     calls            │                             │
│         └──────────────────────┘                             │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                     Data Layer                              │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │  Room Database  │  │   Repositories  │                  │
│  │  (SQLite)       │  │   (Data Access) │                  │
│  │  - Entities     │  │   - Caching     │                  │
│  │  - DAOs         │  │   - Mapping     │                  │
│  └─────────────────┘  └─────────────────┘                  │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                   Services Layer                            │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │  Foreground     │  │  Background     │                  │
│  │  Services       │  │  Workers        │                  │
│  │  - Calibre      │  │  - Media Scan   │                  │
│  │    Import       │  │  - Metadata     │                  │
│  └─────────────────┘  └─────────────────┘                  │
└─────────────────────────────────────────────────────────────┘
```

---

## Layer Details

### UI Layer

**Responsibility**: Display data and handle user interactions

**Components:**
- **MainActivity**: Single activity architecture entry point
- **Compose Screens**: Declarative UI components for each screen
- **Material 3 Theming**: Dynamic color theming with Material You
- **Navigation**: Type-safe navigation between screens

**Key Files:**
- `MainActivity.kt` - Main activity hosting Compose UI
- `ui/screens/` - Screen composables
- `ui/theme/` - Material theming configuration

---

### Domain Layer

**Responsibility**: Business logic and state management

**Components:**
- **ViewModels**: Manage UI state and handle user actions
- **Use Cases**: Encapsulate business logic operations
- **State Management**: Using StateFlow and LiveData

**Patterns:**
- Unidirectional data flow
- Immutable state objects
- Event-driven updates

**Key Files:**
- `ui/viewmodels/` - ViewModel implementations
- State classes for each screen

---

### Data Layer

**Responsibility**: Data persistence and retrieval

**Components:**

#### Room Database
- **Entities**: Data models representing database tables
  - `Library` - Media library definition
  - `MediaItem` - Individual media items
  - `People` - Authors, artists, actors, etc.
  - `Metadata_Common` - Shared metadata fields
  - Type-specific metadata tables

- **DAOs** (Data Access Objects): Database operations
  - `LibraryDao` - Library CRUD operations
  - `MediaItemDao` - Media item operations with complex queries
  - `MetadataDao` - Metadata management
  - `BookmarkDao` - Reading progress and bookmarks

- **Database**: Room database definition with migrations

#### Repositories
- Abstract data sources from ViewModels
- Handle caching and data transformation
- Coordinate between local and future remote sources

**Key Files:**
- `data/local/entities/` - Entity classes
- `data/local/dao/` - DAO interfaces
- `data/local/AppDatabase.kt` - Database definition

---

### Services Layer

**Responsibility**: Background processing and long-running operations

**Components:**

#### Foreground Services
- **CalibreImportForegroundService**: Handles Calibre library import
  - Reads Calibre metadata.db
  - Transforms and cleans data
  - Inserts into app database
  - Shows persistent notification with progress

#### Future Services
- Media scanning and indexing
- Metadata fetching from APIs
- File watching and updates

**Key Files:**
- `services/CalibreImportForegroundService.kt`

---

## Dependency Injection

**Framework**: Hilt (compile-time DI)

**Module Structure:**

```kotlin
@Module
@InstallIn(SingletonComponent::class)
object AppModule {
    // Application-level dependencies
}

@Module
@InstallIn(ViewModelComponent::class)
object ViewModelModule {
    // ViewModel-specific dependencies
}
```

**Provided Dependencies:**
- Database instance
- DAOs
- Repositories
- Services
- API clients (future)

**Key Files:**
- `di/AppModule.kt` - Application module
- `MainApplication.kt` - Hilt application class

---

## Data Flow

### Reading Data (Example: Loading Libraries)

```
User Action (Click)
        ↓
UI Event Handler
        ↓
ViewModel Method
        ↓
Repository Call
        ↓
DAO Query (Room)
        ↓
Database (SQLite)
        ↓
Flow/LiveData Emission
        ↓
State Update in ViewModel
        ↓
UI Recomposition
        ↓
Display Updated Data
```

### Writing Data (Example: Creating Library)

```
User Input
        ↓
UI Form Submission
        ↓
ViewModel Validation
        ↓
Repository Method
        ↓
DAO Insert (Room)
        ↓
Database Transaction
        ↓
Success/Error Result
        ↓
State Update
        ↓
UI Feedback (Success/Error)
```

---

## Key Features

### 1. Universal Media Library

**Design**: Extensible schema supporting multiple media types

**Media Types:**
- Books (EPUB, PDF, MOBI, etc.)
- Music (MP3, FLAC, OGG, etc.)
- Movies (MP4, MKV, AVI, etc.)
- Podcasts
- Comics (CBZ, CBR)

**Implementation**: Shared base tables with type-specific extensions

---

### 2. Calibre Integration

**Process:**
1. User selects Calibre metadata.db file
2. Service reads Calibre database schema
3. Data transformation and cleaning
4. Batch insertion into app database
5. Progress tracking with notifications

**Features:**
- Handles large libraries (1000+ items)
- Foreground service prevents OS killing
- Conflict resolution for existing data
- File path resolution and validation

**Key File**: `analysis/IMPORT_LOGIC.md` - Detailed import logic

---

### 3. Material You Design

**Implementation:**
- Dynamic color extraction from wallpaper
- Dark/light theme support
- Proper elevation and surfaces
- Typography scale adherence
- Accessibility considerations

**Components:**
- Top app bars with Material colors
- Cards with elevation
- Floating action buttons
- Material dialogs and sheets

---

### 4. Local-First Architecture

**Benefits:**
- Works completely offline
- Fast data access (local database)
- Privacy-focused (no data sent externally)
- No server dependencies

**Future Online Features:**
- Optional metadata fetching from APIs
- Optional cloud backup/sync
- User retains full control

---

## Database Schema

### Core Tables

**Libraries**
- id, name, type, path, created_at, updated_at

**MediaItems**
- id, library_id, title, media_type, file_path, file_size
- created_at, updated_at

**People**
- id, name, sort_name, role (author, artist, actor, etc.)

**Metadata_Common**
- id, media_item_id, title, sort_title, description
- publisher, publication_date, language, ratings

**Media-Type Specific Tables**
- Book metadata
- Music metadata
- Video metadata
- etc.

### Relationships

- Library ↔ MediaItems (one-to-many)
- MediaItems ↔ People (many-to-many)
- MediaItems ↔ Metadata (one-to-one or one-to-many)

---

## Performance Considerations

### Database Optimization

- Indexed columns for frequent queries
- Batch operations for large imports
- Transactions for consistency
- Query optimization with Room compile-time validation

### UI Performance

- LazyColumn/Grid for large lists
- Key-based recomposition minimization
- Stable state objects
- Efficient image loading (future: Coil)

### Memory Management

- Flow-based data streams (no memory leaks)
- Proper lifecycle management
- Hilt scoped dependencies
- Database connection pooling

---

## Testing Architecture

### Unit Tests

- ViewModel logic testing
- Repository testing with fake DAOs
- Data transformation testing
- Business logic validation

### Integration Tests

- Database operations
- Service functionality
- End-to-end workflows

**Test Location**: `src/test/` and `src/androidTest/`

---

## Future Architecture Plans

### Planned Additions

1. **Metadata API Layer**
   - Multiple metadata sources
   - Intelligent data merging
   - User preference weighting

2. **Media Playback Layer**
   - ExoPlayer integration for video/audio
   - EPUB reader implementation
   - Comic reader with gesture support

3. **Sync Layer**
   - Cloud backup (optional)
   - Multi-device sync
   - Conflict resolution

4. **ML/AI Layer**
   - OCR for text extraction
   - Smart categorization
   - Duplicate detection

---

## Code Quality Standards

### Architecture Rules

1. **Separation of Concerns**: Each layer has single responsibility
2. **Dependency Rule**: Dependencies point inward (UI → Domain → Data)
3. **No Business Logic in UI**: ViewModels handle all logic
4. **Repository Pattern**: Abstract data sources
5. **Dependency Injection**: No manual dependency creation

### Best Practices

- Immutable data classes
- Sealed classes for state
- Extension functions for utilities
- Kotlin coroutines for async
- Comprehensive error handling

---

## Resources

- [Android Architecture Guide](https://developer.android.com/topic/architecture)
- [Jetpack Compose](https://developer.android.com/jetpack/compose)
- [Room Persistence Library](https://developer.android.com/training/data-storage/room)
- [Hilt Dependency Injection](https://developer.android.com/training/dependency-injection/hilt-android)
- [Material Design 3](https://m3.material.io/)

---

**For implementation details, see** [docs/DEVELOPMENT.md](DEVELOPMENT.md)
