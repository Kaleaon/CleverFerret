package com.universalmedialibrary.data.repository

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.StagedMetadataCandidateDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test

class MetadataStagingRepositoryTest {

    private lateinit var stagedDao: FakeStagedMetadataCandidateDao
    private lateinit var metadataDao: MetadataDao
    private lateinit var mediaItemDao: MediaItemDao
    private lateinit var repository: MetadataStagingRepository

    private val itemMap = mutableMapOf<Long, MediaItem>()
    private val metaMap = mutableMapOf<Long, MetadataCommon>()

    @Before
    fun setup() {
        stagedDao = FakeStagedMetadataCandidateDao()
        metadataDao = mockk(relaxed = true)
        mediaItemDao = mockk(relaxed = true)

        itemMap.clear()
        metaMap.clear()

        coEvery { mediaItemDao.insertMediaItem(any()) } answers { val item = firstArg<MediaItem>(); itemMap[item.itemId] = item; item.itemId }
        coEvery { mediaItemDao.getMediaItemById(any()) } answers { itemMap[firstArg()] }
        coEvery { mediaItemDao.updateMediaItem(any()) } answers { val item = firstArg<MediaItem>(); itemMap[item.itemId] = item }

        coEvery { metadataDao.insertMetadataCommon(any()) } answers { val meta = firstArg<MetadataCommon>(); metaMap[meta.itemId] = meta }
        coEvery { metadataDao.getMetadataCommonByItemId(any()) } answers { metaMap[firstArg()] }

        repository = MetadataStagingRepository(stagedDao, metadataDao, mediaItemDao)
    }

    @Test
    fun `stageMetadataCommon saves pending candidate`() = runTest {
        val metadata = MetadataCommon(
            itemId = 100L,
            title = "Enriched Book Title",
            year = 2024,
            summary = "A great book"
        )

        repository.stageMetadataCommon(
            itemId = 100L,
            metadata = metadata,
            source = "OpenLibraryAPI",
            confidenceScore = 0.90f
        )

        val pending = repository.getPendingCandidates()
        assertThat(pending).hasSize(1)
        val candidate = pending.first()
        assertThat(candidate.itemId).isEqualTo(100L)
        assertThat(candidate.title).isEqualTo("Enriched Book Title")
        assertThat(candidate.source).isEqualTo("OpenLibraryAPI")
        assertThat(candidate.confidenceScore).isEqualTo(0.90f)
        assertThat(candidate.status).isEqualTo("PENDING")
    }

    @Test
    fun `approveCandidate sets isVerified true and updates media item`() = runTest {
        // Setup initial media item without metadata
        val item = MediaItem(itemId = 100L, libraryId = 1L, filePath = "/path/book.epub", fileName = "book.epub", fileExtension = "epub", fileSize = 1024L, mediaType = "BOOK", hasMetadata = false)
        mediaItemDao.insertMediaItem(item)

        // Stage candidate
        val candidateId = stagedDao.insertCandidate(
            StagedMetadataCandidate(
                itemId = 100L,
                title = "Approved Title",
                summary = "Approved Summary",
                year = 2023,
                confidenceScore = 0.88f,
                source = "IngestionPipeline:book"
            )
        )

        val success = repository.approveCandidate(candidateId)
        assertThat(success).isTrue()

        // Verify metadata_common is saved with isVerified = true
        val common = metadataDao.getMetadataCommonByItemId(100L)
        assertThat(common).isNotNull()
        assertThat(common?.title).isEqualTo("Approved Title")
        assertThat(common?.summary).isEqualTo("Approved Summary")
        assertThat(common?.isVerified).isTrue()

        // Verify mediaItem.hasMetadata is true
        val updatedMediaItem = mediaItemDao.getMediaItemById(100L)
        assertThat(updatedMediaItem?.hasMetadata).isTrue()

        // Verify candidate was deleted from staging
        val remainingPending = repository.getPendingCandidates()
        assertThat(remainingPending).isEmpty()
    }

    @Test
    fun `discardCandidate deletes candidate from staging without touching primary metadata`() = runTest {
        val existingCommon = MetadataCommon(itemId = 200L, title = "Original Title", isVerified = false)
        metadataDao.insertMetadataCommon(existingCommon)

        val candidateId = stagedDao.insertCandidate(
            StagedMetadataCandidate(itemId = 200L, title = "Proposed Wrong Title")
        )

        repository.discardCandidate(candidateId)

        // Verify candidate removed
        val pending = repository.getPendingCandidates()
        assertThat(pending).isEmpty()

        // Verify original metadata remains unchanged
        val common = metadataDao.getMetadataCommonByItemId(200L)
        assertThat(common?.title).isEqualTo("Original Title")
        assertThat(common?.isVerified).isFalse()
    }

    @Test
    fun `cleanExpiredCandidates removes stale entries`() = runTest {
        val pastMs = System.currentTimeMillis() - 1000L
        val futureMs = System.currentTimeMillis() + 100_000L

        stagedDao.insertCandidate(
            StagedMetadataCandidate(itemId = 1L, title = "Expired", expiresAt = pastMs)
        )
        stagedDao.insertCandidate(
            StagedMetadataCandidate(itemId = 2L, title = "Valid", expiresAt = futureMs)
        )

        val deletedCount = repository.cleanExpiredCandidates()
        assertThat(deletedCount).isEqualTo(1)

        val remaining = stagedDao.getPendingCandidates()
        assertThat(remaining).hasSize(1)
        assertThat(remaining.first().itemId).isEqualTo(2L)
    }

    // --- Fake DAOs ---

    private class FakeStagedMetadataCandidateDao : StagedMetadataCandidateDao {
        private val list = mutableListOf<StagedMetadataCandidate>()
        private var nextId = 1L

        override suspend fun insertCandidate(candidate: StagedMetadataCandidate): Long {
            val id = if (candidate.candidateId == 0L) nextId++ else candidate.candidateId
            val copy = candidate.copy(candidateId = id)
            list.removeAll { it.candidateId == id }
            list.add(copy)
            return id
        }

        override suspend fun insertCandidates(candidates: List<StagedMetadataCandidate>): List<Long> {
            return candidates.map { insertCandidate(it) }
        }

        override suspend fun updateCandidate(candidate: StagedMetadataCandidate) {
            list.removeAll { it.candidateId == candidate.candidateId }
            list.add(candidate)
        }

        override suspend fun getCandidateById(candidateId: Long): StagedMetadataCandidate? {
            return list.find { it.candidateId == candidateId }
        }

        override fun observePendingCandidates(): Flow<List<StagedMetadataCandidate>> {
            return MutableStateFlow(list.filter { it.status == "PENDING" })
        }

        override suspend fun getPendingCandidates(): List<StagedMetadataCandidate> {
            return list.filter { it.status == "PENDING" }
        }

        override suspend fun getPendingCandidatesByItemId(itemId: Long): List<StagedMetadataCandidate> {
            return list.filter { it.itemId == itemId && it.status == "PENDING" }
        }

        override suspend fun deleteCandidate(candidateId: Long) {
            list.removeAll { it.candidateId == candidateId }
        }

        override suspend fun deleteCandidates(candidateIds: List<Long>) {
            list.removeAll { candidateIds.contains(it.candidateId) }
        }

        override suspend fun deleteCandidatesByItemId(itemId: Long) {
            list.removeAll { it.itemId == itemId }
        }

        override suspend fun deleteExpiredCandidates(nowEpochMs: Long): Int {
            val expired = list.filter { it.expiresAt < nowEpochMs }
            list.removeAll(expired)
            return expired.size
        }

        override suspend fun deleteAllCandidates() {
            list.clear()
        }
    }
}
