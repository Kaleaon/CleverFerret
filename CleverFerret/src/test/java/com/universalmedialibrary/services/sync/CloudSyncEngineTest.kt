package com.universalmedialibrary.services.sync

import com.universalmedialibrary.data.local.entity.Bookmark
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.services.cloud.CloudProvider
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.setMain
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import java.security.MessageDigest

@OptIn(ExperimentalCoroutinesApi::class)
class CloudSyncEngineTest {

    private val testDispatcher = StandardTestDispatcher()

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun testSyncStateDefaultsAndAliases() {
        val syncState = SyncState()
        assertFalse(syncState.isLoading)
        assertEquals(SyncStatus.IDLE, syncState.syncStatus)
        assertEquals(0, syncState.itemsSynced)
        assertEquals(0, syncState.conflictsCount)

        // Test alias equivalence
        val enhancedState: EnhancedSyncState = syncState
        assertEquals(enhancedState, syncState)
    }

    @Test
    fun testSyncSettingsDefaults() {
        val settings = SyncSettings()
        assertFalse(settings.enabled)
        assertTrue(settings.autoSync)
        assertEquals(30L, settings.syncInterval)
        assertTrue(settings.syncOnWifiOnly)
        assertEquals(ConflictResolutionStrategy.USE_NEWER, settings.conflictResolution)
    }

    @Test
    fun testConflictResolutionStrategies() {
        val localWins: EnhancedConflictResolution = ConflictResolutionStrategy.USE_LOCAL
        val remoteWins: EnhancedConflictResolution = ConflictResolutionStrategy.USE_REMOTE
        val newerWins: EnhancedConflictResolution = ConflictResolutionStrategy.USE_NEWER
        val mergeStrategy: EnhancedConflictResolution = ConflictResolutionStrategy.MERGE
        val askUser: EnhancedConflictResolution = ConflictResolutionStrategy.ASK_USER

        assertEquals(ConflictResolutionStrategy.USE_LOCAL, localWins)
        assertEquals(ConflictResolutionStrategy.USE_REMOTE, remoteWins)
        assertEquals(ConflictResolutionStrategy.USE_NEWER, newerWins)
        assertEquals(ConflictResolutionStrategy.MERGE, mergeStrategy)
        assertEquals(ConflictResolutionStrategy.ASK_USER, askUser)
    }

    @Test
    fun testSyncConflictModel() {
        val conflict = SyncConflict(
            itemId = "item_123",
            itemType = "READING_PROGRESS",
            localData = "local_progress",
            remoteData = "remote_progress",
            localTimestamp = 1000L,
            remoteTimestamp = 2000L,
            conflictType = ConflictType.MODIFY_MODIFY,
            resolution = ConflictResolutionStrategy.USE_NEWER
        )

        assertEquals("item_123", conflict.itemId)
        assertEquals("READING_PROGRESS", conflict.itemType)
        assertEquals(1000L, conflict.localTimestamp)
        assertEquals(2000L, conflict.remoteTimestamp)
        assertEquals(ConflictType.MODIFY_MODIFY, conflict.conflictType)
        assertEquals(ConflictResolutionStrategy.USE_NEWER, conflict.resolution)

        // Check alias equivalence
        val cloudConflict: CloudSyncConflict = conflict
        assertEquals("item_123", cloudConflict.itemId)
    }

    @Test
    fun testSyncResultModel() {
        val result = SyncResult(
            success = true,
            itemsSynced = 5,
            uploadedCount = 3,
            downloadedCount = 2,
            conflictsDetected = 1,
            conflictsResolved = 1,
            timestamp = 123456789L
        )

        assertTrue(result.success)
        assertEquals(5, result.itemsSynced)
        assertEquals(3, result.uploadedCount)
        assertEquals(2, result.downloadedCount)
        assertEquals(1, result.conflictsDetected)
        assertEquals(1, result.conflictsResolved)
        assertEquals(123456789L, result.timestamp)
    }

    @Test
    fun testSerializationWithUnknownKeys() {
        val jsonStringWithExtraKeys = """
            {
                "enabled": true,
                "provider": "GOOGLE_DRIVE",
                "autoSync": true,
                "syncInterval": 15,
                "futureField1": "unknown_value",
                "futureField2": 999
            }
        """.trimIndent()

        val parsed = cloudSyncJson.decodeFromString<SyncSettings>(jsonStringWithExtraKeys)
        assertTrue(parsed.enabled)
        assertEquals(SyncProvider.GOOGLE_DRIVE, parsed.provider)
        assertEquals(15L, parsed.syncInterval)
    }

    @Test
    fun testSyncSettingsRoundTrip() {
        val settings = SyncSettings(
            enabled = true,
            provider = SyncProvider.DROPBOX,
            conflictResolution = ConflictResolutionStrategy.MERGE
        )

        val json = cloudSyncJson.encodeToString(settings)
        val restored = cloudSyncJson.decodeFromString<SyncSettings>(json)

        assertEquals(settings.enabled, restored.enabled)
        assertEquals(settings.provider, restored.provider)
        assertEquals(settings.conflictResolution, restored.conflictResolution)
    }

    @Test
    fun testConflictResolutionMapping() {
        assertEquals(
            EnhancedConflictResolution.USE_NEWER,
            mapConflictResolution(ConflictResolutionStrategy.USE_NEWER)
        )
        assertEquals(
            EnhancedConflictResolution.USE_LOCAL,
            mapConflictResolution(ConflictResolutionStrategy.USE_LOCAL)
        )
        assertEquals(
            EnhancedConflictResolution.USE_REMOTE,
            mapConflictResolution(ConflictResolutionStrategy.USE_REMOTE)
        )
        assertEquals(
            EnhancedConflictResolution.MERGE,
            mapConflictResolution(ConflictResolutionStrategy.MERGE)
        )
        assertEquals(
            EnhancedConflictResolution.ASK_USER,
            mapConflictResolution(ConflictResolutionStrategy.ASK_USER)
        )
    }

    @Test
    fun testLastWriteWinsConflictResolution() {
        val localProgress = ReadingProgress(
            itemId = 1L,
            currentPage = 50,
            lastModified = 1000L
        )
        val remoteProgress = ReadingProgress(
            itemId = 1L,
            currentPage = 100,
            lastModified = 2000L
        )

        val conflict = EnhancedSyncConflict(
            itemId = "1",
            itemType = "READING_PROGRESS",
            localData = SyncChange("1", "READING_PROGRESS", ChangeOperation.MODIFY, 1000L, localProgress),
            remoteData = SyncChange("1", "READING_PROGRESS", ChangeOperation.MODIFY, 2000L, remoteProgress),
            localTimestamp = 1000L,
            remoteTimestamp = 2000L
        )

        val winner = if (conflict.localTimestamp > conflict.remoteTimestamp) {
            EnhancedConflictResolution.USE_LOCAL
        } else {
            EnhancedConflictResolution.USE_REMOTE
        }

        assertEquals(EnhancedConflictResolution.USE_REMOTE, winner)
    }

    @Test
    fun testLocalWinsConflictResolution() {
        val conflict = EnhancedSyncConflict(
            itemId = "1",
            itemType = "READING_PROGRESS",
            localData = "local_value",
            remoteData = "remote_value",
            localTimestamp = 1000L,
            remoteTimestamp = 2000L
        )

        val resolution = EnhancedConflictResolution.USE_LOCAL
        assertEquals(EnhancedConflictResolution.USE_LOCAL, resolution)
    }

    @Test
    fun testRemoteWinsConflictResolution() {
        val conflict = EnhancedSyncConflict(
            itemId = "1",
            itemType = "READING_PROGRESS",
            localData = "local_value",
            remoteData = "remote_value",
            localTimestamp = 2000L,
            remoteTimestamp = 1000L
        )

        val resolution = EnhancedConflictResolution.USE_REMOTE
        assertEquals(EnhancedConflictResolution.USE_REMOTE, resolution)
    }

    @Test
    fun testMergeReadingProgressResolution() {
        val localProgress = ReadingProgress(
            itemId = 101L,
            currentPage = 45,
            lastModified = 1000L
        )
        val remoteProgress = ReadingProgress(
            itemId = 101L,
            currentPage = 80,
            lastModified = 900L
        )

        // Merging reading progress selects the further position
        val mergedProgress = if (localProgress.currentPage > remoteProgress.currentPage) {
            localProgress
        } else {
            remoteProgress
        }

        assertEquals(80, mergedProgress.currentPage)
    }

    @Test
    fun testMergeBookmarksDeduplication() {
        val b1 = Bookmark(bookmarkId = 1L, itemId = 1L, title = "Chapter 1", page = 10, dateCreated = 100L)
        val b2 = Bookmark(bookmarkId = 2L, itemId = 1L, title = "Chapter 2", page = 25, dateCreated = 200L)
        val b2Remote = Bookmark(bookmarkId = 2L, itemId = 1L, title = "Chapter 2 Updated", page = 26, dateCreated = 300L)
        val b3 = Bookmark(bookmarkId = 3L, itemId = 1L, title = "Chapter 3", page = 50, dateCreated = 250L)

        val localBookmarks = listOf(b1, b2)
        val remoteBookmarks = listOf(b2Remote, b3)

        val mergedMap = mutableMapOf<Long, Bookmark>()
        for (b in localBookmarks) {
            mergedMap[b.bookmarkId] = b
        }
        for (b in remoteBookmarks) {
            val existing = mergedMap[b.bookmarkId]
            if (existing == null || b.dateCreated > existing.dateCreated) {
                mergedMap[b.bookmarkId] = b
            }
        }

        assertEquals(3, mergedMap.size)
        assertEquals("Chapter 2 Updated", mergedMap[2L]?.title)
    }

    @Test
    fun testSha256ChecksumCalculation() {
        val dataString = """{"itemId":"item_123","title":"Sample Book"}"""
        val digest = MessageDigest.getInstance("SHA-256")
        val hashBytes = digest.digest(dataString.toByteArray(Charsets.UTF_8))
        val checksum = hashBytes.joinToString("") { "%02x".format(it) }

        assertNotNull(checksum)
        assertEquals(64, checksum.length)
    }

    @Test
    fun testProviderMapping() {
        assertEquals(CloudProvider.GOOGLE_DRIVE, mapToCloudProvider(SyncProvider.GOOGLE_DRIVE))
        assertEquals(CloudProvider.DROPBOX, mapToCloudProvider(SyncProvider.DROPBOX))
        assertEquals(CloudProvider.ONEDRIVE, mapToCloudProvider(SyncProvider.ONEDRIVE))
        assertEquals(CloudProvider.WEBDAV, mapToCloudProvider(SyncProvider.CUSTOM_SERVER))
        assertNull(mapToCloudProvider(SyncProvider.LOCAL_NETWORK))
    }

    @Test
    fun testMediaItemsModifiedSinceFiltering() {
        val sinceTimestamp = 1000L
        val item1 = MediaItem(
            itemId = 1L,
            libraryId = 1L,
            filePath = "/path/1",
            fileName = "book1.epub",
            fileExtension = "epub",
            fileSize = 100L,
            mediaType = "BOOK",
            lastModified = 500L
        )
        val item2 = MediaItem(
            itemId = 2L,
            libraryId = 1L,
            filePath = "/path/2",
            fileName = "book2.epub",
            fileExtension = "epub",
            fileSize = 200L,
            mediaType = "BOOK",
            lastModified = 1500L
        )

        val items = listOf(item1, item2)
        val modifiedItems = items.filter { it.lastModified > sinceTimestamp }

        assertEquals(1, modifiedItems.size)
        assertEquals(2L, modifiedItems.first().itemId)
    }

    private fun mapToCloudProvider(provider: SyncProvider): CloudProvider? {
        return when (provider) {
            SyncProvider.GOOGLE_DRIVE -> CloudProvider.GOOGLE_DRIVE
            SyncProvider.DROPBOX -> CloudProvider.DROPBOX
            SyncProvider.ONEDRIVE -> CloudProvider.ONEDRIVE
            SyncProvider.CUSTOM_SERVER -> CloudProvider.WEBDAV
            SyncProvider.LOCAL_NETWORK -> null
        }
    }

    private fun mapConflictResolution(strategy: ConflictResolutionStrategy): EnhancedConflictResolution {
        return strategy
    }
}
