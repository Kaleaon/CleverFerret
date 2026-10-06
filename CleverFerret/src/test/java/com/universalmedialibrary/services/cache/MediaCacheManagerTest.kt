package com.universalmedialibrary.services.cache

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaCacheDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.DownloadPriority
import com.universalmedialibrary.data.local.entity.DownloadState
import com.universalmedialibrary.data.local.entity.MediaCacheItem
import com.universalmedialibrary.data.repository.SettingsRepository
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.slot
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

@OptIn(ExperimentalCoroutinesApi::class)
class MediaCacheManagerTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @MockK
    lateinit var context: Context

    @MockK
    lateinit var mediaCacheDao: MediaCacheDao

    @MockK
    lateinit var mediaItemDao: MediaItemDao

    @MockK
    lateinit var cacheManager: CacheManager

    @MockK
    lateinit var settingsRepository: SettingsRepository

    private lateinit var mediaCacheManager: MediaCacheManager

    @Before
    fun setUp() {
        MockKAnnotations.init(this)

        val cacheDir = tempFolder.newFolder("cache")
        coEvery { cacheManager.getCacheDirectory() } returns cacheDir
        coEvery { settingsRepository.maxCacheSizeMBFlow } returns flowOf(100) // 100 MB limit

        mediaCacheManager = MediaCacheManager(
            context = context,
            mediaCacheDao = mediaCacheDao,
            mediaItemDao = mediaItemDao,
            cacheManager = cacheManager,
            settingsRepository = settingsRepository
        )
    }

    @Test
    fun registerDownloadRequest_createsQueuedCacheItem() = runTest {
        coEvery { mediaCacheDao.getCacheItemByItemId(1L) } returns null
        coEvery { mediaCacheDao.insertCacheItem(any()) } returns Unit

        val item = mediaCacheManager.registerDownloadRequest(
            itemId = 1L,
            remoteUri = "plex://server1/123",
            downloadUrl = "http://localhost:32400/media/123",
            fileName = "test_movie",
            fileExtension = "mp4",
            priority = DownloadPriority.NORMAL
        )

        assertThat(item.itemId).isEqualTo(1L)
        assertThat(item.remoteUri).isEqualTo("plex://server1/123")
        assertThat(item.downloadState).isEqualTo(DownloadState.QUEUED)
        coVerify { mediaCacheDao.insertCacheItem(any()) }
    }

    @Test
    fun pinItem_updatesPinnedStateInDao() = runTest {
        coEvery { mediaCacheDao.updatePinned(1L, true) } returns Unit

        mediaCacheManager.pinItem(1L, true)

        coVerify { mediaCacheDao.updatePinned(1L, true) }
    }

    @Test
    fun getCachedFile_returnsFile_whenCachedAndFileExists() = runTest {
        val testFile = tempFolder.newFile("media_1.mp4")
        testFile.writeText("sample stream data")

        val cacheItem = MediaCacheItem(
            itemId = 1L,
            remoteUri = "plex://server1/1",
            downloadUrl = "http://localhost/1",
            localPath = testFile.absolutePath,
            fileSize = testFile.length(),
            downloadedBytes = testFile.length(),
            downloadState = DownloadState.CACHED
        )

        coEvery { mediaCacheDao.getCacheItemByItemId(1L) } returns cacheItem
        coEvery { mediaCacheDao.updateLastAccessed(1L, any()) } returns Unit

        val file = mediaCacheManager.getCachedFile(1L)

        assertThat(file).isNotNull()
        assertThat(file?.absolutePath).isEqualTo(testFile.absolutePath)
        coVerify { mediaCacheDao.updateLastAccessed(1L, any()) }
    }

    @Test
    fun enforceStorageLimits_evictsUnpinnedLRUItems_whenCacheExceedsLimit() = runTest {
        val file1 = tempFolder.newFile("file1.mp4")
        file1.writeText("some large content 1")
        val file2 = tempFolder.newFile("file2.mp4")
        file2.writeText("some large content 2")

        val item1 = MediaCacheItem(
            itemId = 101L,
            remoteUri = "plex://s1/1",
            downloadUrl = "http://s1/1",
            localPath = file1.absolutePath,
            fileSize = 150 * 1024 * 1024L,
            downloadState = DownloadState.CACHED,
            isPinned = false,
            lastAccessed = 1000L
        )

        coEvery { mediaCacheDao.getTotalCachedSizeBytes() } returns 150 * 1024 * 1024L
        coEvery { mediaCacheDao.getUnpinnedCachedItemsLRU() } returns listOf(item1)
        coEvery { mediaCacheDao.updateDownloadProgress(101L, 0L, 0L, DownloadState.QUEUED) } returns Unit

        mediaCacheManager.enforceStorageLimits()

        assertThat(file1.exists()).isFalse()
        coVerify { mediaCacheDao.updateDownloadProgress(101L, 0L, 0L, DownloadState.QUEUED) }
    }
}
