package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.podcast.PodcastEpisodeEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for podcast episode operations
 * Based on AntennaPod's FeedItem DAO architecture
 */
@Dao
interface PodcastEpisodeDao {
    
    @Query("SELECT * FROM podcast_episodes WHERE podcastId = :podcastId ORDER BY publishDate DESC")
    fun getEpisodesByPodcast(podcastId: Long): Flow<List<PodcastEpisodeEntity>>
    
    @Query("SELECT * FROM podcast_episodes WHERE id = :id")
    fun getEpisodeById(id: Long): Flow<PodcastEpisodeEntity?>
    
    @Query("SELECT * FROM podcast_episodes WHERE guid = :guid LIMIT 1")
    suspend fun getEpisodeByGuid(guid: String): PodcastEpisodeEntity?
    
    @Query("SELECT * FROM podcast_episodes WHERE downloaded = 1 ORDER BY downloadedAt DESC")
    fun getDownloadedEpisodes(): Flow<List<PodcastEpisodeEntity>>
    
    @Query("SELECT * FROM podcast_episodes WHERE isNew = 1 ORDER BY publishDate DESC")
    fun getNewEpisodes(): Flow<List<PodcastEpisodeEntity>>
    
    @Query("SELECT * FROM podcast_episodes WHERE isFavorite = 1 ORDER BY publishDate DESC")
    fun getFavoriteEpisodes(): Flow<List<PodcastEpisodeEntity>>
    
    @Query("SELECT * FROM podcast_episodes WHERE isQueued = 1 ORDER BY queuePosition ASC")
    fun getQueuedEpisodes(): Flow<List<PodcastEpisodeEntity>>
    
    @Query("SELECT * FROM podcast_episodes WHERE played = 0 AND downloaded = 1 ORDER BY publishDate DESC")
    fun getUnplayedDownloadedEpisodes(): Flow<List<PodcastEpisodeEntity>>
    
    @Query("""
        SELECT * FROM podcast_episodes 
        WHERE title LIKE '%' || :query || '%' OR description LIKE '%' || :query || '%'
        ORDER BY publishDate DESC
    """)
    fun searchEpisodes(query: String): Flow<List<PodcastEpisodeEntity>>
    
    @Query("""
        SELECT * FROM podcast_episodes 
        WHERE (CASE WHEN :includeAll = 1 THEN 1 ELSE podcastId IN (:podcastIds) END)
        ORDER BY publishDate DESC 
        LIMIT :limit
    """)
    fun getRecentEpisodes(
        podcastIds: List<Long>, 
        limit: Int = 50,
        includeAll: Boolean = false
    ): Flow<List<PodcastEpisodeEntity>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertEpisode(episode: PodcastEpisodeEntity): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertEpisodes(episodes: List<PodcastEpisodeEntity>)
    
    @Update
    suspend fun updateEpisode(episode: PodcastEpisodeEntity)
    
    @Delete
    suspend fun deleteEpisode(episode: PodcastEpisodeEntity)
    
    @Query("DELETE FROM podcast_episodes WHERE id = :id")
    suspend fun deleteEpisodeById(id: Long)
    
    @Query("DELETE FROM podcast_episodes WHERE podcastId = :podcastId")
    suspend fun deleteEpisodesByPodcast(podcastId: Long)
    
    @Query("UPDATE podcast_episodes SET downloaded = :downloaded, localFilePath = :filePath, downloadedAt = :timestamp WHERE id = :id")
    suspend fun updateDownloadStatus(id: Long, downloaded: Boolean, filePath: String?, timestamp: Long?)
    
    @Query("UPDATE podcast_episodes SET downloadProgress = :progress WHERE id = :id")
    suspend fun updateDownloadProgress(id: Long, progress: Float)
    
    @Query("UPDATE podcast_episodes SET played = :played, lastPlayedAt = :timestamp WHERE id = :id")
    suspend fun updatePlayedStatus(id: Long, played: Boolean, timestamp: Long?)
    
    @Query("UPDATE podcast_episodes SET playPosition = :position WHERE id = :id")
    suspend fun updatePlayPosition(id: Long, position: Long)
    
    @Query("UPDATE podcast_episodes SET isNew = :isNew WHERE id = :id")
    suspend fun updateNewStatus(id: Long, isNew: Boolean)
    
    @Query("UPDATE podcast_episodes SET isFavorite = :favorite WHERE id = :id")
    suspend fun updateFavoriteStatus(id: Long, favorite: Boolean)
    
    @Query("UPDATE podcast_episodes SET isQueued = :queued, queuePosition = :position WHERE id = :id")
    suspend fun updateQueueStatus(id: Long, queued: Boolean, position: Int?)
    
    @Query("SELECT COUNT(*) FROM podcast_episodes WHERE podcastId = :podcastId")
    suspend fun getEpisodeCountForPodcast(podcastId: Long): Int
    
    @Query("SELECT COUNT(*) FROM podcast_episodes WHERE podcastId = :podcastId AND isNew = 1")
    suspend fun getNewEpisodeCountForPodcast(podcastId: Long): Int
    
    @Query("SELECT COUNT(*) FROM podcast_episodes WHERE downloaded = 1")
    fun getDownloadedEpisodeCount(): Flow<Int>
    
    @Query("""
        DELETE FROM podcast_episodes 
        WHERE podcastId = :podcastId 
        AND downloaded = 0 
        AND played = 1 
        AND id NOT IN (
            SELECT id FROM podcast_episodes 
            WHERE podcastId = :podcastId 
            ORDER BY publishDate DESC 
            LIMIT :keepCount
        )
    """)
    suspend fun cleanupOldEpisodes(podcastId: Long, keepCount: Int)
    
    @Transaction
    suspend fun markAsPlayed(episodeId: Long) {
        updatePlayedStatus(episodeId, true, System.currentTimeMillis())
        updateNewStatus(episodeId, false)
    }
    
    @Transaction
    suspend fun markAsUnplayed(episodeId: Long) {
        updatePlayedStatus(episodeId, false, null)
        updatePlayPosition(episodeId, 0)
    }
}