package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.podcast.PodcastChapterEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for podcast chapter operations
 */
@Dao
interface PodcastChapterDao {

    @Query("SELECT * FROM podcast_chapters WHERE episodeId = :episodeId ORDER BY startTime ASC")
    fun getChaptersByEpisode(episodeId: Long): Flow<List<PodcastChapterEntity>>

    @Query("SELECT * FROM podcast_chapters WHERE episodeId = :episodeId ORDER BY startTime ASC")
    suspend fun getChaptersByEpisodeSync(episodeId: Long): List<PodcastChapterEntity>

    @Query("SELECT * FROM podcast_chapters WHERE id = :id")
    suspend fun getChapterById(id: Long): PodcastChapterEntity?

    @Query("""
        SELECT * FROM podcast_chapters
        WHERE episodeId = :episodeId
        AND startTime <= :time
        ORDER BY startTime DESC
        LIMIT 1
    """)
    suspend fun getCurrentChapter(episodeId: Long, time: Long): PodcastChapterEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertChapter(chapter: PodcastChapterEntity): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertChapters(chapters: List<PodcastChapterEntity>)

    @Update
    suspend fun updateChapter(chapter: PodcastChapterEntity)

    @Delete
    suspend fun deleteChapter(chapter: PodcastChapterEntity)

    @Query("DELETE FROM podcast_chapters WHERE episodeId = :episodeId")
    suspend fun deleteChaptersByEpisode(episodeId: Long)

    @Query("SELECT COUNT(*) FROM podcast_chapters WHERE episodeId = :episodeId")
    suspend fun getChapterCount(episodeId: Long): Int
}
