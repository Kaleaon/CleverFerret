# Bugs, Inconsistencies, and Potential Improvements

This document lists the bugs, architectural inconsistencies, and potential areas for improvement identified during the comprehensive documentation of the CleverFerret repository.

## 1. Architectural Inconsistencies

### 1.1. Dual Database Implementations
The project currently contains two parallel and conflicting database implementations:
- **Manual `SQLiteOpenHelper`:** Located in `app/src/main/java/com/universalmedialibrary/data/`, this implementation uses a manual `DatabaseHelper.kt` and DAOs that execute raw SQL queries.
- **Room Persistence Library:** Located in `app/src/main/java/com/universalmedialibrary/data/local/`, this is a modern implementation using Room with annotated entities and DAOs.

**Recommendation:** The project should be standardized to use only the Room implementation. The older, manual `SQLiteOpenHelper`-based code should be refactored and removed to eliminate confusion, reduce complexity, and leverage the benefits of Room, such as compile-time query validation and simpler migration.

### 1.2. Inconsistent Naming
There are two files named `MediaItemDao.kt`, one in each of the database implementation directories. This is highly confusing and a direct result of the dual implementation issue.

**Recommendation:** Consolidate the database logic into the Room-based `data/local` package and delete the older `data` package.

## 2. Potential Bugs and Code Quality Issues

### 2.1. Missing Imports and Build-Related Issues
- **`Series` class not imported:** In `app/src/main/java/com/universalmedialibrary/data/local/dao/MetadataDao.kt`, the `Series` class was used without being imported.
- **`R` class not imported:** In `app/src/main/java/com/universalmedialibrary/services/CalibreImportForegroundService.kt`, the `R` class was used without being imported.

**Recommendation:** These issues suggest that the codebase may not have proper linting or static analysis configured. Implementing tools like `ktlint` and ensuring the "Optimize Imports" feature is used consistently can prevent such issues.

### 2.2. Stray Code
- The file `app/src/main/java/com/universalmedialibrary/data/local/dao/MetadataDao.kt` contained the stray word "main" in the middle of the file.

**Recommendation:** This reinforces the need for automated code quality checks to maintain a clean and professional codebase.

### 2.3. Destructive Database Migration
- The `onUpgrade` method in the older `DatabaseHelper.kt` is implemented to drop all tables and recreate the database. This is a destructive operation that would result in total data loss for users upon an upgrade.

**Recommendation:** This is a critical issue that must be addressed. The migration to a single Room-based implementation with a proper migration strategy is essential before the application is released.

## 3. UI and Feature Implementation Gaps

### 3.1. Hardcoded Values in UI
- **Add Library Dialog:** In `MainActivity.kt`, the `AddLibraryDialog` uses hardcoded values for the new library's type (`"BOOK"`) and path (`"/path/to/library"`).
- **Calibre Import:** The Calibre import process initiated from `LibraryListScreen` uses a hardcoded placeholder `libraryId` of `1L`.

**Recommendation:** These placeholder implementations should be replaced with functional UI components that allow the user to select the library type, path, and target library for imports.

### 3.2. Incomplete Foreign Key Definition
- In `app/src/main/java/com/universalmedialibrary/data/local/model/MetadataBook.kt`, the entity had a `seriesId` property but was missing the corresponding `ForeignKey` definition in the `@Entity` annotation. I have corrected this, but it highlights a potential gap in the development process.

**Recommendation:** Ensure that database schema changes are carefully reviewed and tested to maintain data integrity.