package com.universalmedialibrary.data.local

import androidx.room.Database
import androidx.room.RoomDatabase
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.model.*

/**
 * The main Room database for the application.
 *
 * This class defines the database configuration, including the list of entities and the database version.
 * It also provides abstract methods to access the Data Access Objects (DAOs).
 *
 * The schema is not exported to a file, which is acceptable for development but should be
 * enabled for production to keep a history of schema versions.
 */
@Database(
    entities = [
        Library::class,
        MediaItem::class,
        MetadataCommon::class,
        MetadataBook::class,
        MetadataMovie::class,
        Album::class,
        MetadataMusicTrack::class,
        Genre::class,
        ItemGenre::class,
        People::class,
        ItemPersonRole::class,
        Series::class,
    ],
    version = 1,
    exportSchema = false, // For now, we can disable schema exporting
)
abstract class AppDatabase : RoomDatabase() {
    /**
     * Provides access to the [LibraryDao] for library-related database operations.
     *
     * @return The [LibraryDao] instance.
     */
    abstract fun libraryDao(): LibraryDao

    /**
     * Provides access to the [MediaItemDao] for media item-related database operations.
     *
     * @return The [MediaItemDao] instance.
     */
    abstract fun mediaItemDao(): MediaItemDao

    /**
     * Provides access to the [MetadataDao] for metadata-related database operations.
     *
     * @return The [MetadataDao] instance.
     */
    abstract fun metadataDao(): MetadataDao

    companion object {
        /** The name of the database file. */
        const val DATABASE_NAME = "universal-media-library.db"
    }
}
