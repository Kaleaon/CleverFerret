package com.universalmedialibrary.services.podcast

import android.app.DownloadManager
import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.PodcastEpisodeDao
import com.universalmedialibrary.data.local.entity.podcast.PodcastEpisodeEntity
import com.universalmedialibrary.utils.FileNameSanitizer
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test
import java.io.File

@OptIn(ExperimentalCoroutinesApi::class)
class PodcastDownloadManagerTest {

    @MockK
    lateinit var context: Context

    @MockK
    lateinit var episodeDao: PodcastEpisodeDao

    @MockK
    lateinit var fileNameSanitizer: FileNameSanitizer

    @MockK
    lateinit var telemetry: PodcastDownloadTelemetry

    private lateinit var downloadManager: DownloadManager

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        downloadManager = mockk(relaxed = true)
        every { context.getSystemService(Context.DOWNLOAD_SERVICE) } returns downloadManager
        every { fileNameSanitizer.sanitizeFileName(any()) } answers { firstArg<String>() }
        coEvery { episodeDao.getDownloadedEpisodesOnce() } returns emptyList()
    }

    @Test
    fun `reconcileDownloadedEpisodesOnStartup clears downloaded flag when local file is missing`() = runTest {
        val manager = PodcastDownloadManager(context, episodeDao, fileNameSanitizer, telemetry)
        val episode = PodcastEpisodeEntity(
            id = 42L,
            podcastId = 2L,
            guid = "guid-42",
            title = "Episode",
            audioUrl = "https://example.com/audio.mp3",
            publishDate = 1234L,
            downloaded = true,
            localFilePath = "/definitely/missing/file.mp3"
        )
        coEvery { episodeDao.getDownloadedEpisodesOnce() } returns listOf(episode)

        manager.reconcileDownloadedEpisodesOnStartup()

        coVerify(exactly = 1) { episodeDao.clearDownloadedState(42L) }
        coVerify(exactly = 1) { telemetry.recordMissingFileMismatch(42L, "/definitely/missing/file.mp3") }
        manager.onDestroy()
    }

    @Test
    fun `persistEpisodeCompletion uses atomic dao update with checksum when path resolves`() = runTest {
        val manager = PodcastDownloadManager(context, episodeDao, fileNameSanitizer, telemetry)
        val tempFile = File.createTempFile("episode", ".mp3").apply {
            writeText("checksum-content")
            deleteOnExit()
        }

        manager.persistEpisodeCompletion(episodeId = 100L, localUri = "file://${tempFile.absolutePath}")

        coVerify(exactly = 1) { episodeDao.markDownloadCompletedAtomically(100L, tempFile.absolutePath, any(), any()) }
        manager.onDestroy()
        assertThat(true).isTrue()
    }

    @Test
    fun `reconciliation clears downloaded state when checksum is corrupt`() = runTest {
        val manager = PodcastDownloadManager(context, episodeDao, fileNameSanitizer, telemetry)
        val tempFile = File.createTempFile("episode-corrupt", ".mp3").apply {
            writeText("real-bytes")
            deleteOnExit()
        }
        val episode = PodcastEpisodeEntity(
            id = 55L,
            podcastId = 7L,
            guid = "guid-55",
            title = "Checksum Episode",
            audioUrl = "https://example.com/audio.mp3",
            publishDate = 1234L,
            downloaded = true,
            localFilePath = tempFile.absolutePath,
            localFileChecksum = "bad-checksum"
        )
        coEvery { episodeDao.getDownloadedEpisodesOnce() } returns listOf(episode)

        manager.reconcileDownloadedEpisodesOnStartup()

        coVerify(exactly = 1) { episodeDao.clearDownloadedState(55L) }
        coVerify(exactly = 1) { telemetry.recordChecksumMismatch(55L, "bad-checksum", any()) }
        manager.onDestroy()
    }
}
