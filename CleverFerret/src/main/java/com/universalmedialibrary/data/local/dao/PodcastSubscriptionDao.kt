package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.podcast.PodcastSubscriptionEntity
import kotlinx.coroutines.flow.Flow

/**
 * DAO for podcast subscription settings
 */
@Dao
interface PodcastSubscriptionDao {

    @Query("SELECT * FROM podcast_subscriptions WHERE podcastId = :podcastId")
    fun getSubscriptionSettings(podcastId: Long): Flow<PodcastSubscriptionEntity?>

    @Query("SELECT * FROM podcast_subscriptions WHERE isActive = 1")
    fun getActiveSubscriptions(): Flow<List<PodcastSubscriptionEntity>>

    @Query("SELECT * FROM podcast_subscriptions WHERE autoDownload = 1")
    fun getAutoDownloadSubscriptions(): Flow<List<PodcastSubscriptionEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSubscription(subscription: PodcastSubscriptionEntity): Long

    @Update
    suspend fun updateSubscription(subscription: PodcastSubscriptionEntity)

    @Delete
    suspend fun deleteSubscription(subscription: PodcastSubscriptionEntity)

    @Query("DELETE FROM podcast_subscriptions WHERE podcastId = :podcastId")
    suspend fun deleteSubscriptionByPodcast(podcastId: Long)

    @Query("UPDATE podcast_subscriptions SET isActive = :active WHERE podcastId = :podcastId")
    suspend fun updateActiveStatus(podcastId: Long, active: Boolean)

    @Query("UPDATE podcast_subscriptions SET autoDownload = :autoDownload WHERE podcastId = :podcastId")
    suspend fun updateAutoDownload(podcastId: Long, autoDownload: Boolean)

    @Query("UPDATE podcast_subscriptions SET lastChecked = :timestamp WHERE podcastId = :podcastId")
    suspend fun updateLastChecked(podcastId: Long, timestamp: Long)
}
