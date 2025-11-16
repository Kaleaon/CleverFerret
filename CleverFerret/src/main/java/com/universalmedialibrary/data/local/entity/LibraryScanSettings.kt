package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import com.universalmedialibrary.data.local.entity.DownloadedStory.Converters

/**
 * Per-library scan and ingest preferences inspired by Namida's flexible indexer.
 *
 * A library can define the folders to include and exclude, minimum file thresholds,
 * and duplicate prevention strategy. These settings are enforced by MediaScannerService.
 */
@Entity(
    tableName = "library_scan_settings",
    foreignKeys = [
        ForeignKey(
            entity = Library::class,
            parentColumns = ["libraryId"],
            childColumns = ["libraryId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index("libraryId", unique = true)
    ]
)
@TypeConverters(Converters::class)
data class LibraryScanSettings(
    @PrimaryKey
    val libraryId: Long,
    val includePaths: List<String> = emptyList(),
    val excludePaths: List<String> = emptyList(),
    val includeSubdirectories: Boolean = true,
    val minFileSizeBytes: Long = 0L,
    val minAudioDurationMs: Long = 0L,
    val preventDuplicates: Boolean = true,
    /**
     * Duplicate detection strategy:
     * - PATH: rely on absolute path (default behavior)
     * - FILENAME_SIZE: treat same filename + size as duplicate
     * - HASH: compute SHA-1 hash for exact duplicates (most expensive)
     */
    val deduplicationStrategy: String = "PATH",
    /**
     * Minimum percent (0-100) that must be listened to before a track counts as "played"
     * for history/statistics purposes.
     */
    val minListenPercent: Int = 35,
    /**
     * Minimum seconds that must elapse before we record a listen event.
     */
    val minListenSeconds: Int = 30,
    val lastUpdated: Long = System.currentTimeMillis()
) {
    companion object {
        fun defaults(libraryId: Long, basePath: String): LibraryScanSettings {
            return LibraryScanSettings(
                libraryId = libraryId,
                includePaths = listOf(basePath)
            )
        }
    }
}
