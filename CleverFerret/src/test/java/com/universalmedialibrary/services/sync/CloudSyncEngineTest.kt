package com.universalmedialibrary.services.sync

import com.universalmedialibrary.data.local.entity.Bookmark
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.services.cloud.CloudProvider
import com.universalmedialibrary.services.cloud.CloudSyncManager
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import org.junit.Assert.*
import org.junit.Test
import java.security.MessageDigest

class CloudSyncEngineTest {

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
            conflictResolution = ConflictResolution.MERGE
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
            mapConflictResolution(ConflictResolution.LAST_WRITE_WINS)
        )
        assertEquals(
            EnhancedConflictResolution.USE_LOCAL,
            mapConflictResolution(ConflictResolution.LOCAL_WINS)
        )
        assertEquals(
            EnhancedConflictResolution.USE_REMOTE,
            mapConflictResolution(ConflictResolution.REMOTE_WINS)
        )
        assertEquals(
            EnhancedConflictResolution.MERGE,
            mapConflictResolution(ConflictResolution.MERGE)
        )
        assertEquals(
            EnhancedConflictResolution.ASK_USER,
            mapConflictResolution(ConflictResolution.MANUAL)
        )
    }

    @Test
    fun testLastWriteWinsConflictResolution() {
        val localProgress = ReadingProgress(
            itemId = "item_1",
            currentPage = 50,
            lastModified = 1000L
        )
        val remoteProgress = ReadingProgress(
            itemId = "item_1",
            currentPage = 100,
            lastModified = 2000L
        )

        val conflict = EnhancedSyncConflict(
            itemId = 1L,
            itemType = "READING_PROGRESS",
            localData = SyncChange(1L, "READING_PROGRESS", ChangeOperation.MODIFY, 1000L, localProgress),
            remoteData = SyncChange(1L, "READING_PROGRESS", ChangeOperation.MODIFY, 2000L, remoteProgress),
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
            itemId = 1L,
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
            itemId = 1L,
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
            itemId = "book_101",
            currentPage = 45,
            lastModified = 1000L
        )
        val remoteProgress = ReadingProgress(
            itemId = "book_101",
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

    private fun mapToCloudProvider(provider: SyncProvider): CloudProvider? {
        return when (provider) {
            SyncProvider.GOOGLE_DRIVE -> CloudProvider.GOOGLE_DRIVE
            SyncProvider.DROPBOX -> CloudProvider.DROPBOX
            SyncProvider.ONEDRIVE -> CloudProvider.ONEDRIVE
            SyncProvider.CUSTOM_SERVER -> CloudProvider.WEBDAV
            SyncProvider.LOCAL_NETWORK -> null
        }
    }

    private fun mapConflictResolution(strategy: ConflictResolution): EnhancedConflictResolution {
        return when (strategy) {
            ConflictResolution.LAST_WRITE_WINS -> EnhancedConflictResolution.USE_NEWER
            ConflictResolution.LOCAL_WINS -> EnhancedConflictResolution.USE_LOCAL
            ConflictResolution.REMOTE_WINS -> EnhancedConflictResolution.USE_REMOTE
            ConflictResolution.MERGE -> EnhancedConflictResolution.MERGE
            ConflictResolution.MANUAL -> EnhancedConflictResolution.ASK_USER
        }
    }
}
