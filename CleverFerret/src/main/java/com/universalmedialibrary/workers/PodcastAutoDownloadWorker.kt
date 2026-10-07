package com.universalmedialibrary.workers

import android.content.Context
import androidx.hilt.work.HiltWorker
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.universalmedialibrary.data.local.dao.PodcastDao
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.local.dao.PodcastSubscriptionDao
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobExecutionState
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import dagger.assisted.Assisted
import dagger.assisted.AssistedInject
import kotlinx.coroutines.flow.firstOrNull

/**
 * Dedicated background worker for automatically refreshing podcast feeds and downloading new episodes.
 */
@HiltWorker
class PodcastAutoDownloadWorker @AssistedInject constructor(
    @Assisted context: Context,
    @Assisted params: WorkerParameters,
    private val subscriptionDao: PodcastSubscriptionDao,
    private val podcastRepository: PodcastRepository,
    private val episodeDao: PodcastEpisodeDao,
    private val podcastDao: PodcastDao,
    private val downloadManager: PodcastDownloadManager
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        JobStatusBus.publish(
            JobStatusEvent(
                contractType = JobContractType.PODCAST_AUTO_DOWNLOAD,
                state = JobExecutionState.RUNNING,
                jobId = id.toString(),
                message = "Podcast auto-download started"
            )
        )

        return try {
            val autoDownloadSubscriptions = subscriptionDao.getAutoDownloadActiveSubscriptions()
            var totalEnqueued = 0

            for (subscription in autoDownloadSubscriptions) {
                // Refresh podcast RSS feed and save new episodes to Room
                runCatching {
                    podcastRepository.refreshPodcast(subscription.podcastId)
                }

                // Get podcast title
                val podcastTitle = podcastDao.getPodcastById(subscription.podcastId)
                    .firstOrNull()?.title ?: "Podcast #${subscription.podcastId}"

                // Retrieve undownloaded episodes up to download limit
                val limit = if (subscription.downloadLimit > 0) subscription.downloadLimit else 5
                val undownloadedEpisodes = episodeDao.getUndownloadedEpisodesByPodcast(subscription.podcastId, limit)

                for (episode in undownloadedEpisodes) {
                    if (episode.audioUrl.isNotBlank()) {
                        downloadManager.downloadEpisode(
                            episodeId = episode.id,
                            audioUrl = episode.audioUrl,
                            episodeTitle = episode.title,
                            podcastTitle = podcastTitle
                        )
                        totalEnqueued++
                    }
                }
            }

            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.PODCAST_AUTO_DOWNLOAD,
                    state = JobExecutionState.SUCCEEDED,
                    jobId = id.toString(),
                    message = "Podcast auto-download completed",
                    progress = totalEnqueued
                )
            )

            Result.success()
        } catch (e: Exception) {
            JobStatusBus.publish(
                JobStatusEvent(
                    contractType = JobContractType.PODCAST_AUTO_DOWNLOAD,
                    state = JobExecutionState.FAILED,
                    jobId = id.toString(),
                    message = e.message ?: "Podcast auto-download failed"
                )
            )

            if (runAttemptCount < 3) {
                Result.retry()
            } else {
                Result.failure()
            }
        }
    }

    companion object {
        const val UNIQUE_WORK_NAME = "podcast_auto_download"
    }
}
