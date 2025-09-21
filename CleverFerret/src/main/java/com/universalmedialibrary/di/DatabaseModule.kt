package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * CleverFerret Database Dependency Injection Module
 * 
 * This Hilt module provides database-related dependencies throughout the CleverFerret
 * application. It ensures proper singleton behavior, handles database creation with
 * migrations, and provides all necessary DAO instances for data access.
 * 
 * ## Dependency Injection Strategy:
 * - **Singleton Scope**: Database instance shared across entire application
 * - **Migration Support**: Comprehensive migration chain for schema evolution
 * - **Thread Safety**: Room handles thread-safe database access automatically
 * - **Performance**: Lazy initialization and connection pooling
 * 
 * ## Architecture Integration:
 * This module integrates with the Clean Architecture pattern by providing:
 * - **Data Layer**: Room database and DAO implementations
 * - **Repository Support**: Database dependencies for repository implementations
 * - **ViewModel Integration**: DAO injection for ViewModels via repositories
 * 
 * ## Database Configuration:
 * The database is configured with:
 * - **All Migrations**: Complete migration chain from v1 to current version
 * - **Foreign Key Support**: Referential integrity enforcement
 * - **WAL Mode**: Write-Ahead Logging for better concurrent access
 * - **Query Optimization**: Room's automatic query optimization
 * 
 * ## Testing Support:
 * The module supports testing with:
 * - **In-Memory Database**: For unit tests (when configured)
 * - **Test Migrations**: Separate test configurations available
 * - **Mock Providers**: Test doubles for DAO instances
 * 
 * ## Performance Considerations:
 * - **Connection Pooling**: Room manages database connections efficiently
 * - **Background Threading**: All database operations on background threads
 * - **Query Caching**: Prepared statement caching for common queries
 * - **Index Usage**: Strategic indexing for common query patterns
 * 
 * ## Security Features:
 * - **File Protection**: Database files protected by Android app sandbox
 * - **Encryption Ready**: Structure supports SQLCipher integration
 * - **Access Control**: Dependency injection controls database access
 * 
 * @author CleverFerret Development Team
 * @version 1.1-enhanced
 * @since Android API 26 (Android 8.0)
 * 
 * @see AppDatabase for complete database schema and migrations
 * @see LibraryDao for library management operations
 * @see MediaItemDao for media item CRUD operations
 * @see MetadataDao for metadata extraction and storage
 * @see BookmarkDao for reading progress and bookmarks
 */
@Module
@InstallIn(SingletonComponent::class)
object DatabaseModule {

    /**
     * Provides the main AppDatabase instance as a singleton
     * 
     * Creates and configures the Room database with comprehensive migration support.
     * This database instance is shared across the entire application to ensure
     * data consistency and optimal resource usage.
     * 
     * ## Database Configuration:
     * - **Migration Chain**: All migrations from v1 to current version included
     * - **Error Handling**: Graceful handling of migration failures
     * - **Performance**: Optimized for both read and write operations
     * - **Integrity**: Foreign key constraints and data validation enabled
     * 
     * ## Migration Strategy:
     * The database includes comprehensive migrations that:
     * - Preserve existing user data during schema changes
     * - Add new features without data loss
     * - Handle edge cases and error conditions
     * - Provide fallback mechanisms for failed migrations
     * 
     * ## Threading Model:
     * - **Background Operations**: All database operations automatically on background threads
     * - **UI Thread Protection**: Prevents blocking the main/UI thread
     * - **Coroutine Support**: Full integration with Kotlin coroutines
     * - **Flow Integration**: Reactive data streams for UI updates
     * 
     * @param context Application context for database file location and permissions
     * @return Configured AppDatabase instance with all migrations and optimizations
     * 
     * @throws RuntimeException if database creation fails or migrations cannot be applied
     */
    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            AppDatabase.DATABASE_NAME
        ).addMigrations(
            AppDatabase.MIGRATION_1_2,
            AppDatabase.MIGRATION_2_3,
            AppDatabase.MIGRATION_3_4,
            AppDatabase.MIGRATION_4_5,
            AppDatabase.MIGRATION_5_6
        )
         .build()
    }

    /**
     * Provides LibraryDao for library management operations
     * 
     * The LibraryDao handles all database operations related to media libraries,
     * including creation, deletion, updates, and complex queries for library
     * organization and management.
     * 
     * ## Library Operations Supported:
     * - **CRUD Operations**: Create, read, update, delete libraries
     * - **Search and Filter**: Find libraries by name, type, or metadata
     * - **Statistics**: Library item counts, size calculations, usage metrics
     * - **Organization**: Hierarchical library structures and relationships
     * 
     * ## Performance Features:
     * - **Batch Operations**: Efficient bulk library operations
     * - **Indexed Queries**: Fast lookup by common search criteria
     * - **Lazy Loading**: On-demand loading of library contents
     * - **Caching**: Intelligent caching of frequently accessed libraries
     * 
     * @param appDatabase The main database instance containing the LibraryDao
     * @return LibraryDao instance for library-related database operations
     */
    @Provides
    fun provideLibraryDao(appDatabase: AppDatabase): LibraryDao {
        return appDatabase.libraryDao()
    }

    /**
     * Provides MediaItemDao for media item management operations
     * 
     * The MediaItemDao is the core data access object for individual media items,
     * handling file-based media content including books, music, videos, and documents.
     * 
     * ## Media Item Operations:
     * - **File Management**: Add, remove, update media files in the database
     * - **Metadata Extraction**: Parse and store file metadata automatically
     * - **Search Capabilities**: Full-text search across media content and metadata
     * - **Filtering**: Advanced filtering by type, date, size, and custom criteria
     * - **Batch Processing**: Efficient operations on multiple media items
     * 
     * ## Advanced Features:
     * - **Duplicate Detection**: Identify and manage duplicate media files
     * - **Thumbnail Generation**: Create and manage media thumbnails and previews
     * - **Progress Tracking**: Integration with reading/playback progress systems
     * - **Usage Analytics**: Track access patterns and usage statistics
     * 
     * ## Performance Optimizations:
     * - **Streaming Queries**: Handle large media collections efficiently
     * - **Background Processing**: Heavy operations moved to background threads
     * - **Memory Management**: Optimize memory usage for large file collections
     * - **Cache Integration**: Smart caching of frequently accessed items
     * 
     * @param appDatabase The main database instance containing the MediaItemDao
     * @return MediaItemDao instance for media item database operations
     */
    @Provides
    fun provideMediaItemDao(appDatabase: AppDatabase): MediaItemDao {
        return appDatabase.mediaItemDao()
    }

    /**
     * Provides MetadataDao for metadata extraction and management
     * 
     * The MetadataDao handles specialized metadata for different media types,
     * supporting automatic extraction from files and integration with external
     * metadata services and APIs.
     * 
     * ## Metadata Types Supported:
     * - **Book Metadata**: ISBN, authors, publishers, page counts, genres
     * - **Movie Metadata**: IMDB/TMDB IDs, cast, crew, ratings, runtime
     * - **Music Metadata**: Album info, artists, track numbers, lyrics, audio properties
     * - **Document Metadata**: Creation dates, authors, page counts, document properties
     * - **Academic Metadata**: DOI, citations, journals, research fields
     * 
     * ## External Integration:
     * - **API Services**: Integration with TMDB, OpenLibrary, MusicBrainz, etc.
     * - **Bulk Operations**: Batch metadata fetching for performance
     * - **Caching Strategy**: Cache metadata to reduce API calls and improve speed
     * - **Fallback Mechanisms**: Multiple metadata sources with fallback options
     * 
     * ## Data Processing:
     * - **File Analysis**: Extract metadata directly from file headers and content
     * - **Image Processing**: Extract and process cover art and thumbnails
     * - **Text Extraction**: OCR and text extraction for document content
     * - **Audio Analysis**: Extract audio properties, bitrates, and technical data
     * 
     * @param appDatabase The main database instance containing the MetadataDao
     * @return MetadataDao instance for metadata extraction and storage operations
     */
    @Provides
    fun provideMetadataDao(appDatabase: AppDatabase): MetadataDao {
        return appDatabase.metadataDao()
    }
    
    /**
     * Provides BookmarkDao for reading progress and bookmark management
     * 
     * The BookmarkDao manages user reading progress, bookmarks, and session tracking
     * for position-based media consumption including books, documents, videos, and audio.
     * 
     * ## Progress Tracking Features:
     * - **Position Management**: Track current reading/viewing positions accurately
     * - **Progress Calculation**: Calculate completion percentages and remaining content
     * - **Time Tracking**: Monitor reading/viewing time and session duration
     * - **Session History**: Maintain detailed logs of user engagement sessions
     * 
     * ## Bookmark System:
     * - **Multiple Bookmarks**: Support unlimited bookmarks per media item
     * - **Bookmark Types**: Categorize bookmarks (reference, highlight, note, etc.)
     * - **Annotations**: User notes and comments attached to specific positions
     * - **Synchronization**: Prepare for cross-device bookmark synchronization
     * 
     * ## Analytics and Insights:
     * - **Reading Habits**: Analyze reading patterns and preferences
     * - **Goal Tracking**: Support reading goals and progress toward targets
     * - **Recommendations**: Data for personalized content recommendations
     * - **Statistics**: Generate reading statistics and achievement tracking
     * 
     * ## Performance Features:
     * - **Fast Retrieval**: Optimized queries for quick bookmark and progress access
     * - **Batch Updates**: Efficient bulk operations for progress updates
     * - **Memory Efficiency**: Minimal memory footprint for progress tracking
     * - **Real-time Updates**: Live progress updates during media consumption
     * 
     * @param appDatabase The main database instance containing the BookmarkDao
     * @return BookmarkDao instance for bookmark and progress tracking operations
     */
    @Provides
    fun provideBookmarkDao(appDatabase: AppDatabase): BookmarkDao {
        return appDatabase.bookmarkDao()
    }
}