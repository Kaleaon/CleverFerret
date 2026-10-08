package com.universalmedialibrary.workers

import android.content.Context
import androidx.work.ListenableWorker.Result
import androidx.work.WorkerParameters
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.PodcastDao
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.local.dao.PodcastSubscriptionDao
import com.universalmedialibrary.data.local.entity.podcast.PodcastEntity
import com.universalmedialibrary.data.local.entity.podcast.PodcastEpisodeEntity
import com.universalmedialibrary.data.local.entity.podcast.PodcastSubscriptionEntity
import com.universalmedialibrary.services.podcast.PodcastOperationResult
import com.universalmedialibrary.data.repository.podcast.PodcastRepository
import com.universalmedialibrary.services.podcast.PodcastDownloadManager
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class PodcastAutoDownloadWorkerTest {

    @MockK
    lateinit var context: Context

    @MockK
    lateinit var workerParams: WorkerParameters

    @MockK
    lateinit var subscriptionDao: PodcastSubscriptionDao

    @MockK
    lateinit var podcastRepository: PodcastRepository

    @MockK
    lateinit var episodeDao: PodcastEpisodeDao

    @MockK
    lateinit var podcastDao: PodcastDao

    @MockK
    lateinit var downloadManager: PodcastDownloadManager

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        every { workerParams.runAttemptCount } returns 0
    }

    @Test
    fun `doWork succeeds with no active auto download subscriptions`() = runTest {
        coEvery { subscriptionDao.getAutoDownloadActiveSubscriptions() } returns emptyList()

        val worker = PodcastAutoDownloadWorker(
            context,
            workerParams,
            subscriptionDao,
            podcastRepository,
            episodeDao,
            podcastDao,
            downloadManager
        )

        val result = worker.doWork()

        assertThat(result).isEqualTo(Result.success())
        coVerify(exactly = 0) { podcastRepository.refreshPodcast(any()) }
        coVerify(exactly = 0) { downloadManager.downloadEpisode(any(), any(), any(), any()) }
    }

    @Test
    fun `doWork refreshes feeds and enqueues missing episodes up to downloadLimit`() = runTest {
        val subscription = PodcastSubscriptionEntity(
            podcastId = 10L,
            subscribedAt = System.currentTimeMillis(),
            autoDownload = true,
            isActive = true,
            downloadLimit = 2
        )
        val podcast = PodcastEntity(
            id = 10L,
            title = "Tech Daily",
            description = "Daily tech news",
            author = "Tech Host",
            feedUrl = "https://example.com/feed.xml"
        )
        val episodes = listOf(
            PodcastEpisodeEntity(
                id = 101L,
                podcastId = 10L,
                guid = "guid-101",
                title = "Episode 101",
                audioUrl = "https://example.com/audio101.mp3",
                publishDate = 2000L
            ),
            PodcastEpisodeEntity(
                id = 102L,
                podcastId = 10L,
                guid = "guid-102",
                title = "Episode 102",
                audioUrl = "https://example.com/audio102.mp3",
                publishDate = 1000L
            )
        )

        coEvery { subscriptionDao.getAutoDownloadActiveSubscriptions() } returns listOf(subscription)
        coEvery { podcastRepository.refreshPodcast(10L) } returns PodcastOperationResult.Success("Refreshed")
        every { podcastDao.getPodcastById(10L) } returns flowOf(podcast)
        coEvery { episodeDao.getUndownloadedEpisodesByPodcast(10L, 2) } returns episodes
        every { downloadManager.downloadEpisode(any(), any(), any(), any()) } returns 1L

        val worker = PodcastAutoDownloadWorker(
            context,
            workerParams,
            subscriptionDao,
            podcastRepository,
            episodeDao,
            podcastDao,
            downloadManager
        )

        val result = worker.doWork()

        assertThat(result).isEqualTo(Result.success())
        coVerify(exactly = 1) { podcastRepository.refreshPodcast(10L) }
        coVerify(exactly = 1) {
            downloadManager.downloadEpisode(
                episodeId = 101L,
                audioUrl = "https://example.com/audio101.mp3",
                episodeTitle = "Episode 101",
                podcastTitle = "Tech Daily"
            )
        }
        coVerify(exactly = 1) {
            downloadManager.downloadEpisode(
                episodeId = 102L,
                audioUrl = "https://example.com/audio102.mp3",
                episodeTitle = "Episode 102",
                podcastTitle = "Tech Daily"
            )
        }
    }

    @Test
    fun `doWork continues remaining subscriptions if one podcast refresh throws an exception`() = runTest {
        val sub1 = PodcastSubscriptionEntity(
            podcastId = 1L,
            subscribedAt = System.currentTimeMillis(),
            autoDownload = true,
            isActive = true,
            downloadLimit = 1
        )
        val sub2 = PodcastSubscriptionEntity(
            podcastId = 2L,
            subscribedAt = System.currentTimeMillis(),
            autoDownload = true,
            isActive = true,
            downloadLimit = 1
        )

        val podcast2 = PodcastEntity(
            id = 2L,
            title = "Science Hour",
            description = "Science news",
            author = "Science Host",
            feedUrl = "https://example.com/science.xml"
        )
        val ep2 = PodcastEpisodeEntity(
            id = 201L,
            podcastId = 2L,
            guid = "guid-201",
            title = "Science Episode",
            audioUrl = "https://example.com/science.mp3",
            publishDate = 3000L
        )

        coEvery { subscriptionDao.getAutoDownloadActiveSubscriptions() } returns listOf(sub1, sub2)
        coEvery { podcastRepository.refreshPodcast(1L) } throws RuntimeException("Network error")
        coEvery { podcastRepository.refreshPodcast(2L) } returns PodcastOperationResult.Success("Refreshed")

        every { podcastDao.getPodcastById(1L) } returns flowOf(null)
        every { podcastDao.getPodcastById(2L) } returns flowOf(podcast2)

        coEvery { episodeDao.getUndownloadedEpisodesByPodcast(1L, 1) } returns emptyList()
        coEvery { episodeDao.getUndownloadedEpisodesByPodcast(2L, 1) } returns listOf(ep2)
        every { downloadManager.downloadEpisode(any(), any(), any(), any()) } returns 2L

        val worker = PodcastAutoDownloadWorker(
            context,
            workerParams,
            subscriptionDao,
            podcastRepository,
            episodeDao,
            podcastDao,
            downloadManager
        )

        val result = worker.doWork()

        assertThat(result).isEqualTo(Result.success())
        coVerify(exactly = 1) {
            downloadManager.downloadEpisode(
                episodeId = 201L,
                audioUrl = "https://example.com/science.mp3",
                episodeTitle = "Science Episode",
                podcastTitle = "Science Hour"
            )
        }
    }

    @Test
    fun `doWork returns retry when top level exception occurs and attempt count under max`() = runTest {
        coEvery { subscriptionDao.getAutoDownloadActiveSubscriptions() } throws RuntimeException("Database error")
        every { workerParams.runAttemptCount } returns 1

        val worker = PodcastAutoDownloadWorker(
            context,
            workerParams,
            subscriptionDao,
            podcastRepository,
            episodeDao,
            podcastDao,
            downloadManager
        )

        val result = worker.doWork()

        assertThat(result).isEqualTo(Result.retry())
    }

    @Test
    fun `doWork returns failure when top level exception occurs and attempt count reaches max`() = runTest {
        coEvery { subscriptionDao.getAutoDownloadActiveSubscriptions() } throws RuntimeException("Database error")
        every { workerParams.runAttemptCount } returns 3

        val worker = PodcastAutoDownloadWorker(
            context,
            workerParams,
            subscriptionDao,
            podcastRepository,
            episodeDao,
            podcastDao,
            downloadManager
        )

        val result = worker.doWork()

        assertThat(result).isEqualTo(Result.failure())
    }
}
