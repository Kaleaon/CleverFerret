package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.podcast.PodcastEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for podcast operations
 * Based on AntennaPod's Feed DAO architecture
 */
@Dao
interface PodcastDao {

    @Query("SELECT * FROM podcasts ORDER BY customOrder ASC, title ASC")
    fun getAllPodcasts(): Flow<List<PodcastEntity>>

    @Query("SELECT * FROM podcasts WHERE isSubscribed = 1 ORDER BY customOrder ASC, title ASC")
    fun getSubscribedPodcasts(): Flow<List<PodcastEntity>>

    @Query("SELECT * FROM podcasts WHERE id = :id")
    fun getPodcastById(id: Long): Flow<PodcastEntity?>

    @Query("SELECT * FROM podcasts WHERE feedUrl = :feedUrl LIMIT 1")
    suspend fun getPodcastByFeedUrl(feedUrl: String): PodcastEntity?

    @Query("SELECT * FROM podcasts WHERE isFavorite = 1 ORDER BY title ASC")
    fun getFavoritePodcasts(): Flow<List<PodcastEntity>>

    @Query("SELECT * FROM podcasts WHERE newEpisodeCount > 0 ORDER BY lastUpdated DESC")
    fun getPodcastsWithNewEpisodes(): Flow<List<PodcastEntity>>

    @Query("SELECT * FROM podcasts WHERE title LIKE '%' || :query || '%' OR author LIKE '%' || :query || '%'")
    fun searchPodcasts(query: String): Flow<List<PodcastEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPodcast(podcast: PodcastEntity): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPodcasts(podcasts: List<PodcastEntity>)

    @Update
    suspend fun updatePodcast(podcast: PodcastEntity)

    @Delete
    suspend fun deletePodcast(podcast: PodcastEntity)

    @Query("DELETE FROM podcasts WHERE id = :id")
    suspend fun deletePodcastById(id: Long)

    @Query("UPDATE podcasts SET isSubscribed = :subscribed, subscribedAt = :timestamp WHERE id = :id")
    suspend fun updateSubscriptionStatus(id: Long, subscribed: Boolean, timestamp: Long)

    @Query("UPDATE podcasts SET isFavorite = :favorite WHERE id = :id")
    suspend fun updateFavoriteStatus(id: Long, favorite: Boolean)

    @Query("UPDATE podcasts SET newEpisodeCount = :count WHERE id = :id")
    suspend fun updateNewEpisodeCount(id: Long, count: Int)

    @Query("UPDATE podcasts SET lastChecked = :timestamp WHERE id = :id")
    suspend fun updateLastChecked(id: Long, timestamp: Long)

    @Query("UPDATE podcasts SET lastUpdated = :timestamp, totalEpisodes = :count WHERE id = :id")
    suspend fun updateLastUpdated(id: Long, timestamp: Long, count: Int)

    @Query("UPDATE podcasts SET autoDownload = :autoDownload WHERE id = :id")
    suspend fun updateAutoDownload(id: Long, autoDownload: Boolean)

    @Query("SELECT COUNT(*) FROM podcasts WHERE isSubscribed = 1")
    fun getSubscribedPodcastCount(): Flow<Int>

    @Query("SELECT SUM(newEpisodeCount) FROM podcasts WHERE isSubscribed = 1")
    fun getTotalNewEpisodesCount(): Flow<Int?>

    @Transaction
    suspend fun subscribe(podcastId: Long) {
        updateSubscriptionStatus(podcastId, true, System.currentTimeMillis())
    }

    @Transaction
    suspend fun unsubscribe(podcastId: Long) {
        updateSubscriptionStatus(podcastId, false, 0)
    }
}
