package com.universalmedialibrary.services.music

import android.content.Context
import androidx.room.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for caching artist information from Gemini API
 * Reduces API calls and provides offline access
 */
@Singleton
class ArtistInfoCacheRepository @Inject constructor(
    @ApplicationContext context: Context
) {
    private val database = Room.databaseBuilder(
        context,
        ArtistInfoDatabase::class.java,
        "artist_info_cache.db"
    ).build()

    private val dao = database.artistInfoDao()

    /**
     * Cache artist information
     */
    suspend fun cacheArtistInfo(artistName: String, info: ArtistInfo) = withContext(Dispatchers.IO) {
        val entity = ArtistInfoEntity(
            artistName = artistName.lowercase().trim(),
            displayName = info.name,
            biography = info.biography,
            startYear = info.startYear,
            endYear = info.endYear,
            origin = info.origin,
            genres = info.genres.joinToString(","),
            members = info.members.joinToString(","),
            facts = info.facts.joinToString("|||"), // Use special delimiter
            notableWorks = info.notableWorks.joinToString(","),
            awards = info.awards.joinToString(","),
            influences = info.influences.joinToString(","),
            website = info.website,
            confidence = info.confidence,
            lastUpdated = System.currentTimeMillis()
        )
        dao.insertOrUpdate(entity)
    }

    /**
     * Get cached artist information
     * Returns null if not found or if cache is too old (> 30 days)
     */
    suspend fun getArtistInfo(artistName: String): ArtistInfo? = withContext(Dispatchers.IO) {
        val entity = dao.getArtistInfo(artistName.lowercase().trim()) ?: return@withContext null

        // Permanent cache - no expiration
        // User can manually refresh if needed
        ArtistInfo(
            name = entity.displayName,
            biography = entity.biography,
            startYear = entity.startYear,
            endYear = entity.endYear,
            origin = entity.origin,
            genres = entity.genres.split(",").filter { it.isNotBlank() },
            members = entity.members.split(",").filter { it.isNotBlank() },
            facts = entity.facts.split("|||").filter { it.isNotBlank() },
            notableWorks = entity.notableWorks.split(",").filter { it.isNotBlank() },
            awards = entity.awards.split(",").filter { it.isNotBlank() },
            influences = entity.influences.split(",").filter { it.isNotBlank() },
            website = entity.website,
            confidence = entity.confidence,
            lastUpdated = entity.lastUpdated
        )
    }

    /**
     * Clear cached info for an artist
     */
    suspend fun clearArtistInfo(artistName: String) = withContext(Dispatchers.IO) {
        dao.delete(artistName.lowercase().trim())
    }

    /**
     * Clear all cached artist info
     */
    suspend fun clearAll() = withContext(Dispatchers.IO) {
        dao.deleteAll()
    }
}

/**
 * Room database for artist info cache
 */
@Database(entities = [ArtistInfoEntity::class], version = 1, exportSchema = false)
abstract class ArtistInfoDatabase : RoomDatabase() {
    abstract fun artistInfoDao(): ArtistInfoDao
}

/**
 * Room entity for cached artist info
 */
@Entity(tableName = "artist_info_cache")
data class ArtistInfoEntity(
    @PrimaryKey
    val artistName: String, // Normalized (lowercase) for matching
    val displayName: String, // Original display name
    val biography: String,
    val startYear: String,
    val endYear: String,
    val origin: String,
    val genres: String, // Comma-separated
    val members: String, // Comma-separated
    val facts: String, // ||| separated to allow commas in facts
    val notableWorks: String, // Comma-separated
    val awards: String, // Comma-separated
    val influences: String, // Comma-separated
    val website: String,
    val confidence: Float,
    val lastUpdated: Long
)

/**
 * DAO for artist info cache
 */
@Dao
interface ArtistInfoDao {
    @Query("SELECT * FROM artist_info_cache WHERE artistName = :artistName")
    suspend fun getArtistInfo(artistName: String): ArtistInfoEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOrUpdate(entity: ArtistInfoEntity)

    @Query("DELETE FROM artist_info_cache WHERE artistName = :artistName")
    suspend fun delete(artistName: String)

    @Query("DELETE FROM artist_info_cache")
    suspend fun deleteAll()
}
