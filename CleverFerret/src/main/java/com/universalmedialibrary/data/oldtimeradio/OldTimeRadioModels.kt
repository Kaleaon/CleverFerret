package com.universalmedialibrary.data.oldtimeradio

import android.net.Uri
import androidx.room.*
import kotlinx.coroutines.flow.Flow

/**
 * Old Time Radio / Radio Drama data models
 * 
 * For organizing classic radio shows from 1930s-1960s:
 * - Radio dramas (The Shadow, Suspense, etc.)
 * - Radio soap operas (The Guiding Light, etc.)
 * - Comedy shows (Jack Benny, etc.)
 * - News broadcasts
 * - Historical recordings
 */

/**
 * Old Time Radio episode entity
 */
@Entity(tableName = "old_time_radio_episodes")
data class OldTimeRadioEpisode(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    // Series Info
    @ColumnInfo(name = "series_title")
    val seriesTitle: String,              // "The Shadow"
    
    @ColumnInfo(name = "episode_title")
    val episodeTitle: String?,            // "The Death House Rescue"
    
    @ColumnInfo(name = "episode_number")
    val episodeNumber: Int?,              // Episode # in series
    
    @ColumnInfo(name = "season_number")
    val seasonNumber: Int?,               // Season # if applicable
    
    // Metadata
    @ColumnInfo(name = "original_air_date")
    val originalAirDate: String?,         // "1938-11-05"
    
    @ColumnInfo(name = "broadcast_network")
    val broadcastNetwork: String?,        // "CBS", "NBC", "Mutual", "ABC"
    
    @ColumnInfo(name = "duration")
    val duration: Long,                   // Milliseconds
    
    // Categorization
    @ColumnInfo(name = "category")
    val category: OTRCategory,
    
    @ColumnInfo(name = "genre")
    val genre: String?,                   // "Mystery", "Western", "Sci-Fi"
    
    // Production Info
    @ColumnInfo(name = "cast")
    val cast: String?,                    // JSON: ["Orson Welles", "Agnes Moorehead"]
    
    @ColumnInfo(name = "director")
    val director: String?,
    
    @ColumnInfo(name = "writer")
    val writer: String?,
    
    @ColumnInfo(name = "sponsor")
    val sponsor: String?,                 // Historical sponsor (e.g., "Blue Coal")
    
    @ColumnInfo(name = "description")
    val description: String?,             // Episode synopsis
    
    // File Info
    @ColumnInfo(name = "uri")
    val uri: String,                      // Content URI
    
    @ColumnInfo(name = "file_path")
    val filePath: String?,
    
    @ColumnInfo(name = "file_size")
    val fileSize: Long,
    
    @ColumnInfo(name = "quality")
    val quality: AudioQuality,            // Audio quality rating
    
    // User Data
    @ColumnInfo(name = "last_played")
    val lastPlayed: Long?,
    
    @ColumnInfo(name = "playback_position")
    val playbackPosition: Long,           // Resume position in ms
    
    @ColumnInfo(name = "is_complete")
    val isComplete: Boolean,              // Finished listening
    
    @ColumnInfo(name = "is_favorite")
    val isFavorite: Boolean,
    
    @ColumnInfo(name = "play_count")
    val playCount: Int,
    
    // Tags
    @ColumnInfo(name = "tags")
    val tags: String?,                    // Comma-separated tags
    
    @ColumnInfo(name = "added_date")
    val addedDate: Long
) {
    val uriParsed: Uri get() = Uri.parse(uri)
    
    val displayTitle: String
        get() = episodeTitle ?: "Episode ${episodeNumber ?: "?"}"
    
    val displayDate: String
        get() = originalAirDate ?: "Date Unknown"
    
    val displayDuration: String
        get() {
            val seconds = duration / 1000
            val minutes = seconds / 60
            val secs = seconds % 60
            return "%d:%02d".format(minutes, secs)
        }
}

/**
 * Old Time Radio series (grouped episodes)
 */
data class OTRSeries(
    val seriesTitle: String,
    val episodeCount: Int,
    val category: OTRCategory,
    val genre: String?,
    val network: String?,
    val firstAirDate: String?,
    val lastAirDate: String?,
    val episodes: List<OldTimeRadioEpisode>
) {
    val displayYears: String
        get() {
            val start = firstAirDate?.take(4) ?: "?"
            val end = lastAirDate?.take(4) ?: "?"
            return if (start == end) start else "$start-$end"
        }
}

/**
 * Old Time Radio categories
 */
enum class OTRCategory(val displayName: String) {
    DRAMA("Drama"),
    MYSTERY("Mystery/Detective"),
    THRILLER("Suspense/Thriller"),
    SCI_FI("Science Fiction"),
    HORROR("Horror"),
    WESTERN("Western"),
    COMEDY("Comedy"),
    SOAP_OPERA("Soap Opera"),
    ADVENTURE("Adventure"),
    ANTHOLOGY("Anthology"),
    NEWS("News/Documentary"),
    VARIETY("Variety Show"),
    CHILDREN("Children's Program"),
    MUSIC("Music Program"),
    SPORTS("Sports"),
    OTHER("Other")
}

/**
 * Audio quality rating
 */
enum class AudioQuality(val displayName: String) {
    EXCELLENT("Excellent"),
    GOOD("Good"),
    FAIR("Fair"),
    POOR("Poor"),
    UNKNOWN("Unknown")
}

/**
 * Room DAO for Old Time Radio
 */
@Dao
interface OldTimeRadioDao {
    
    @Query("SELECT * FROM old_time_radio_episodes ORDER BY added_date DESC")
    fun getAllEpisodes(): Flow<List<OldTimeRadioEpisode>>
    
    @Query("SELECT * FROM old_time_radio_episodes WHERE series_title = :seriesTitle ORDER BY original_air_date ASC")
    fun getEpisodesBySeries(seriesTitle: String): Flow<List<OldTimeRadioEpisode>>
    
    @Query("SELECT * FROM old_time_radio_episodes WHERE category = :category ORDER BY series_title ASC")
    fun getEpisodesByCategory(category: OTRCategory): Flow<List<OldTimeRadioEpisode>>
    
    @Query("SELECT * FROM old_time_radio_episodes WHERE is_favorite = 1 ORDER BY last_played DESC")
    fun getFavoriteEpisodes(): Flow<List<OldTimeRadioEpisode>>
    
    @Query("SELECT * FROM old_time_radio_episodes WHERE uri = :uri LIMIT 1")
    suspend fun getEpisodeByUri(uri: String): OldTimeRadioEpisode?
    
    @Query("""
        SELECT DISTINCT series_title, 
               COUNT(*) as episodeCount,
               category,
               genre,
               broadcast_network as network,
               MIN(original_air_date) as firstAirDate,
               MAX(original_air_date) as lastAirDate
        FROM old_time_radio_episodes
        GROUP BY series_title
        ORDER BY series_title ASC
    """)
    suspend fun getAllSeries(): List<SeriesInfo>
    
    @Query("SELECT * FROM old_time_radio_episodes WHERE id = :id")
    suspend fun getEpisodeById(id: Long): OldTimeRadioEpisode?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertEpisode(episode: OldTimeRadioEpisode): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertEpisodes(episodes: List<OldTimeRadioEpisode>)
    
    @Update
    suspend fun updateEpisode(episode: OldTimeRadioEpisode)
    
    @Delete
    suspend fun deleteEpisode(episode: OldTimeRadioEpisode)
    
    @Query("UPDATE old_time_radio_episodes SET playback_position = :position, last_played = :timestamp WHERE id = :id")
    suspend fun updatePlaybackPosition(id: Long, position: Long, timestamp: Long)
    
    @Query("UPDATE old_time_radio_episodes SET is_complete = :complete WHERE id = :id")
    suspend fun updateComplete(id: Long, complete: Boolean)
    
    @Query("UPDATE old_time_radio_episodes SET is_favorite = :favorite WHERE id = :id")
    suspend fun updateFavorite(id: Long, favorite: Boolean)
    
    @Query("UPDATE old_time_radio_episodes SET play_count = play_count + 1, last_played = :timestamp WHERE id = :id")
    suspend fun incrementPlayCount(id: Long, timestamp: Long)
    
    @Query("SELECT COUNT(*) FROM old_time_radio_episodes")
    suspend fun getEpisodeCount(): Int
}

/**
 * Series info from query
 */
data class SeriesInfo(
    val series_title: String,
    val episodeCount: Int,
    val category: OTRCategory,
    val genre: String?,
    val network: String?,
    val firstAirDate: String?,
    val lastAirDate: String?
)

/**
 * Database
 */
@Database(entities = [OldTimeRadioEpisode::class], version = 1, exportSchema = false)
abstract class OldTimeRadioDatabase : RoomDatabase() {
    abstract fun oldTimeRadioDao(): OldTimeRadioDao
}
