package com.universalmedialibrary.services.music

import android.content.Context
import androidx.room.*
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for caching lyrics
 */
@Singleton
class LyricsCacheRepository @Inject constructor(
    @ApplicationContext context: Context
) {
    private val database = Room.databaseBuilder(
        context,
        LyricsDatabase::class.java,
        "lyrics_cache.db"
    ).build()

    private val dao = database.lyricsDao()

    suspend fun cacheLyrics(trackId: Long, lyrics: Lyrics) = withContext(Dispatchers.IO) {
        val entity = LyricsEntity(
            trackId = trackId,
            lyricsJson = serializeLyrics(lyrics),
            hasTimestamps = lyrics.hasTimestamps,
            language = lyrics.language,
            isInstrumental = lyrics.isInstrumental,
            confidence = lyrics.confidence,
            fetchedAt = System.currentTimeMillis()
        )
        dao.insertOrUpdate(entity)
    }

    suspend fun getLyrics(trackId: Long): Lyrics? = withContext(Dispatchers.IO) {
        val entity = dao.getLyrics(trackId) ?: return@withContext null
        
        // Check if cache is too old (30 days)
        val ageMs = System.currentTimeMillis() - entity.fetchedAt
        val thirtyDaysMs = 30L * 24 * 60 * 60 * 1000
        if (ageMs > thirtyDaysMs) {
            return@withContext null
        }

        deserializeLyrics(trackId, entity)
    }

    suspend fun clearLyrics(trackId: Long) = withContext(Dispatchers.IO) {
        dao.delete(trackId)
    }

    private fun serializeLyrics(lyrics: Lyrics): String {
        // Simple JSON serialization
        val lines = lyrics.lines.joinToString(separator = "|||") { 
            "${it.time}::${it.text}"
        }
        return lines
    }

    private fun deserializeLyrics(trackId: Long, entity: LyricsEntity): Lyrics {
        val lines = if (entity.lyricsJson.isBlank()) {
            emptyList()
        } else {
            entity.lyricsJson.split("|||").mapNotNull { line ->
                val parts = line.split("::", limit = 2)
                if (parts.size == 2) {
                    LyricLine(
                        time = parts[0].toLongOrNull() ?: 0L,
                        text = parts[1]
                    )
                } else null
            }
        }

        return Lyrics(
            trackId = trackId,
            lines = lines,
            hasTimestamps = entity.hasTimestamps,
            language = entity.language,
            isInstrumental = entity.isInstrumental,
            confidence = entity.confidence,
            fetchedAt = entity.fetchedAt
        )
    }
}

@Database(entities = [LyricsEntity::class], version = 1, exportSchema = false)
abstract class LyricsDatabase : RoomDatabase() {
    abstract fun lyricsDao(): LyricsDao
}

@Entity(tableName = "lyrics_cache")
data class LyricsEntity(
    @PrimaryKey
    val trackId: Long,
    val lyricsJson: String,
    val hasTimestamps: Boolean,
    val language: String,
    val isInstrumental: Boolean,
    val confidence: Float,
    val fetchedAt: Long
)

@Dao
interface LyricsDao {
    @Query("SELECT * FROM lyrics_cache WHERE trackId = :trackId")
    suspend fun getLyrics(trackId: Long): LyricsEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertOrUpdate(entity: LyricsEntity)

    @Query("DELETE FROM lyrics_cache WHERE trackId = :trackId")
    suspend fun delete(trackId: Long)

    @Query("DELETE FROM lyrics_cache")
    suspend fun deleteAll()
}
