package com.universalmedialibrary.services.media

import android.content.Context
import com.universalmedialibrary.data.local.dao.EmbyServerDao
import com.universalmedialibrary.data.local.dao.JellyfinServerDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.PlexServerDao
import com.universalmedialibrary.data.local.entity.EmbyServerEntity
import com.universalmedialibrary.data.local.entity.JellyfinServerEntity
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.PlexServerEntity
import com.universalmedialibrary.services.cache.CacheManager
import com.universalmedialibrary.services.network.NetworkMonitor
import io.mockk.*
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

class MediaContentResolverTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private val context = mockk<Context>(relaxed = true)
    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private val jellyfinServerDao = mockk<JellyfinServerDao>(relaxed = true)
    private val embyServerDao = mockk<EmbyServerDao>(relaxed = true)
    private val plexServerDao = mockk<PlexServerDao>(relaxed = true)
    private val cacheManager = mockk<CacheManager>(relaxed = true)
    private val networkMonitor = mockk<NetworkMonitor>(relaxed = true)

    private lateinit var resolver: MediaContentResolverImpl

    @Before
    fun setUp() {
        val cacheDir = tempFolder.newFolder("cache")
        coEvery { cacheManager.getCacheDirectory() } returns cacheDir
        every { networkMonitor.isOnline() } returns true

        resolver = MediaContentResolverImpl(
            context,
            mediaItemDao,
            jellyfinServerDao,
            embyServerDao,
            plexServerDao,
            cacheManager,
            networkMonitor
        )
    }

    @After
    fun tearDown() {
        unmockkAll()
    }

    @Test
    fun testIsVirtualUri() {
        assertTrue(resolver.isVirtualUri("jellyfin://1/item123"))
        assertTrue(resolver.isVirtualUri("emby://1/item456"))
        assertTrue(resolver.isVirtualUri("plex://machine_abc/part789"))
        assertFalse(resolver.isVirtualUri("/path/to/local/file.mp3"))
        assertFalse(resolver.isVirtualUri("http://example.com/stream.mp3"))
    }

    @Test
    fun testResolveLocalFileExists() = runBlocking {
        val testFile = tempFolder.newFile("sample.mp3")
        val mediaItem = MediaItem(
            itemId = 100L,
            title = "Test Track",
            filePath = testFile.absolutePath,
            mimeType = "audio/mpeg"
        )

        val result = resolver.resolve(mediaItem)
        assertTrue(result is ResolvedContent.LocalFile)
        val localFileResult = result as ResolvedContent.LocalFile
        assertEquals(testFile.absolutePath, localFileResult.file.absolutePath)
        assertEquals("audio/mpeg", localFileResult.mimeType)
    }

    @Test
    fun testResolveLocalFileWithCachePath() = runBlocking {
        val cachedFile = tempFolder.newFile("cached_track.mp3")
        val mediaItem = MediaItem(
            itemId = 101L,
            title = "Cached Track",
            filePath = "jellyfin://1/item999",
            localCachePath = cachedFile.absolutePath,
            downloadStatus = "COMPLETED"
        )

        val result = resolver.resolve(mediaItem)
        assertTrue(result is ResolvedContent.LocalFile)
        val localFileResult = result as ResolvedContent.LocalFile
        assertEquals(cachedFile.absolutePath, localFileResult.file.absolutePath)
    }

    @Test
    fun testResolveJellyfinVirtualUriOnline() = runBlocking {
        val jellyfinServer = mockk<JellyfinServerEntity>(relaxed = true)
        every { jellyfinServer.url } returns "http://jellyfin.local:8096"
        every { jellyfinServer.apiKey } returns "jf_api_key_123"
        coEvery { jellyfinServerDao.getById(1L) } returns jellyfinServer

        val mediaItem = MediaItem(
            itemId = 102L,
            title = "Jellyfin Song",
            filePath = "jellyfin://1/item123"
        )

        val result = resolver.resolve(mediaItem)
        assertTrue(result is ResolvedContent.StreamUrl)
        val streamResult = result as ResolvedContent.StreamUrl
        assertEquals("http://jellyfin.local:8096/Items/item123/Download?api_key=jf_api_key_123", streamResult.url)
    }

    @Test
    fun testResolveEmbyVirtualUriOnline() = runBlocking {
        val embyServer = mockk<EmbyServerEntity>(relaxed = true)
        every { embyServer.url } returns "http://emby.local:8096"
        every { embyServer.apiKey } returns "emby_token_456"
        coEvery { embyServerDao.getById(2L) } returns embyServer

        val mediaItem = MediaItem(
            itemId = 103L,
            title = "Emby Track",
            filePath = "emby://2/item456"
        )

        val result = resolver.resolve(mediaItem)
        assertTrue(result is ResolvedContent.StreamUrl)
        val streamResult = result as ResolvedContent.StreamUrl
        assertEquals("http://emby.local:8096/Items/item456/Download?api_key=emby_token_456", streamResult.url)
    }

    @Test
    fun testResolvePlexVirtualUriOnline() = runBlocking {
        val plexServer = mockk<PlexServerEntity>(relaxed = true)
        every { plexServer.url } returns "http://plex.local:32400"
        every { plexServer.token } returns "plex_token_789"
        coEvery { plexServerDao.getServerByMachineId("machine123") } returns plexServer

        val mediaItem = MediaItem(
            itemId = 104L,
            title = "Plex Track",
            filePath = "plex://machine123/part789"
        )

        val result = resolver.resolve(mediaItem)
        assertTrue(result is ResolvedContent.StreamUrl)
        val streamResult = result as ResolvedContent.StreamUrl
        assertEquals("http://plex.local:32400/library/parts/part789/file?X-Plex-Token=plex_token_789", streamResult.url)
    }

    @Test
    fun testResolveVirtualUriOfflineUnbuffered() = runBlocking {
        every { networkMonitor.isOnline() } returns false

        val mediaItem = MediaItem(
            itemId = 105L,
            title = "Offline Unbuffered Track",
            filePath = "jellyfin://1/item123",
            fileName = "track.mp3"
        )

        val result = resolver.resolve(mediaItem)
        assertTrue(result is ResolvedContent.OfflineUnbuffered)
        val offlineResult = result as ResolvedContent.OfflineUnbuffered
        assertEquals("jellyfin://1/item123", offlineResult.virtualUri)
        assertTrue(offlineResult.message.contains("offline"))
    }

    @Test
    fun testResolveVirtualUriOfflineBuffered() = runBlocking {
        every { networkMonitor.isOnline() } returns false

        val cacheDir = cacheManager.getCacheDirectory()
        val bufferedDir = File(cacheDir, "buffered").apply { mkdirs() }
        val virtualUri = "jellyfin://1/item123"
        val hash = virtualUri.hashCode().toString()
        val bufferedFile = File(bufferedDir, "buffer_${hash}_106.mp3")
        bufferedFile.writeText("cached data content")

        val mediaItem = MediaItem(
            itemId = 106L,
            title = "Offline Buffered Track",
            filePath = virtualUri
        )

        val result = resolver.resolve(mediaItem)
        assertTrue(result is ResolvedContent.LocalFile)
        val localResult = result as ResolvedContent.LocalFile
        assertEquals(bufferedFile.absolutePath, localResult.file.absolutePath)
    }
}
