package com.universalmedialibrary.data.repository

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.StagedMetadataCandidateDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test

class MetadataStagingRepositoryTest {

    private lateinit var stagedDao: FakeStagedMetadataCandidateDao
    private lateinit var metadataDao: FakeMetadataDao
    private lateinit var mediaItemDao: FakeMediaItemDao
    private lateinit var repository: MetadataStagingRepository

    @Before
    fun setup() {
        stagedDao = FakeStagedMetadataCandidateDao()
        metadataDao = FakeMetadataDao()
        mediaItemDao = FakeMediaItemDao()
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

    private class FakeMetadataDao : MetadataDao {
        private val map = mutableMapOf<Long, MetadataCommon>()

        override suspend fun insertMetadataCommon(metadataCommon: MetadataCommon) {
            map[metadataCommon.itemId] = metadataCommon
        }

        override suspend fun insertMetadataCommonList(items: List<MetadataCommon>) {
            items.forEach { map[it.itemId] = it }
            items.forEach { insertMetadataCommon(it) }
        }

        override suspend fun updateMetadata(metadataCommon: MetadataCommon) {
            map[metadataCommon.itemId] = metadataCommon
        }

        override suspend fun insertMetadataBook(metadataBook: com.universalmedialibrary.data.local.entity.MetadataBook) {}
        override suspend fun insertMetadataBookList(items: List<com.universalmedialibrary.data.local.entity.MetadataBook>) {}
        override suspend fun insertMetadataMovie(metadataMovie: com.universalmedialibrary.data.local.entity.MetadataMovie) {}
        override suspend fun insertMetadataMusicTrack(metadataMusicTrack: com.universalmedialibrary.data.local.entity.MetadataMusicTrack) {}

        override suspend fun getMetadataCommonByItemId(itemId: Long): MetadataCommon? = map[itemId]

        override suspend fun setFavorite(itemId: Long, isFavorite: Boolean) {
            map[itemId]?.let { map[itemId] = it.copy(isFavorite = isFavorite) }
        }

        override suspend fun getMetadataBookByItemId(itemId: Long): com.universalmedialibrary.data.local.entity.MetadataBook? = null
        override suspend fun getMetadataMovieByItemId(itemId: Long): com.universalmedialibrary.data.local.entity.MetadataMovie? = null
        override suspend fun getMetadataMusicTrackByItemId(itemId: Long): com.universalmedialibrary.data.local.entity.MetadataMusicTrack? = null

        override suspend fun upsertWaveform(itemId: Long, waveformData: ByteArray?, sampleCount: Int, frameDurationMs: Int, offsetMs: Int, generatedAt: Long, version: Int) {}
        override suspend fun updateWaveformOffset(itemId: Long, offsetMs: Int) {}

        override suspend fun updateMetadataCommon(itemId: Long, title: String, summary: String?) {
            map[itemId]?.let { map[itemId] = it.copy(title = title, summary = summary) }
        }

        override suspend fun insertCommonMetadata(metadata: MetadataCommon) {
            map[metadata.itemId] = metadata
        }

        override suspend fun getCommonMetadata(itemId: Long): MetadataCommon? = map[itemId]
        override suspend fun searchByTitle(query: String): List<MetadataCommon> = map.values.filter { it.title.contains(query, true) }
        override suspend fun updateCommonMetadata(itemId: Long, title: String, summary: String?) {}

        override suspend fun findPersonByName(name: String): Long? = null
        override suspend fun insertPerson(person: com.universalmedialibrary.data.local.entity.People): Long = 1L
        override suspend fun insertItemPersonRole(itemPersonRole: com.universalmedialibrary.data.local.entity.ItemPersonRole) {}
        override suspend fun insertItemPersonRoleList(items: List<com.universalmedialibrary.data.local.entity.ItemPersonRole>) {}

        override suspend fun findSeriesByName(name: String): Long? = null
        override suspend fun insertSeries(series: com.universalmedialibrary.data.local.entity.Series): Long = 1L
        override suspend fun updateBookWithSeries(itemId: Long, seriesId: Long) {}

        override suspend fun findGenreByName(name: String): Long? = null
        override suspend fun insertGenre(genre: com.universalmedialibrary.data.local.entity.Genre): Long = 1L
        override suspend fun insertItemGenre(itemGenre: com.universalmedialibrary.data.local.entity.ItemGenre) {}
        override suspend fun insertItemGenreList(items: List<com.universalmedialibrary.data.local.entity.ItemGenre>) {}

        override suspend fun getAuthorsByItemId(itemId: Long): List<String> = emptyList()
        override suspend fun getSeriesByItemId(itemId: Long): String? = null
        override suspend fun getGenresByItemId(itemId: Long): List<String> = emptyList()
        override suspend fun deleteAuthorsByItemId(itemId: Long) {}
        override suspend fun deleteGenresByItemId(itemId: Long) {}

        override suspend fun updateMetadataCommon(itemId: Long, title: String, sortTitle: String?, summary: String?, rating: Float?) {}
        override suspend fun updateMetadataBook(itemId: Long, subtitle: String?, publisher: String?, isbn: String?) {}

        override suspend fun getCompletedBooksCount(libraryId: Long): Int = 0
        override suspend fun getTotalPagesRead(libraryId: Long): Int = 0
        override suspend fun getBooksReadSince(libraryId: Long, since: Long): Int = 0
        override suspend fun getCurrentReadingCount(libraryId: Long): Int = 0
        override suspend fun getToReadBooksCount(libraryId: Long): Int = 0
        override suspend fun getMonthlyCompletionCounts(libraryId: Long, since: Long): List<com.universalmedialibrary.data.local.dao.MonthlyCompletionCount> = emptyList()
        override suspend fun getTopPublishers(libraryId: Long, limit: Int): List<com.universalmedialibrary.data.local.dao.PublisherUsage> = emptyList()

        override suspend fun getAllMetadata(): List<MetadataCommon> = map.values.toList()
        override suspend fun getMetadataCommonById(itemId: Long): MetadataCommon? = map[itemId]
        override suspend fun getMetadataBookById(itemId: Long): com.universalmedialibrary.data.local.entity.MetadataBook? = null
        override suspend fun getItemAuthors(itemId: Long): List<String> = emptyList()
        override suspend fun getItemGenres(itemId: Long): List<String> = emptyList()

        override suspend fun getMetadataCommonBatch(itemIds: List<Long>): List<MetadataCommon> = itemIds.mapNotNull { map[it] }
        override suspend fun getMetadataBookBatch(itemIds: List<Long>): List<com.universalmedialibrary.data.local.entity.MetadataBook> = emptyList()
        override suspend fun getAuthorsBatch(itemIds: List<Long>): List<MetadataDao.ItemAuthor> = emptyList()
        override suspend fun getSeriesBatch(itemIds: List<Long>): List<MetadataDao.ItemSeries> = emptyList()

        override suspend fun getCommonMetadataByItemId(itemId: Long): MetadataCommon? = map[itemId]
        override suspend fun getGenresForItem(itemId: Long): List<com.universalmedialibrary.data.local.entity.Genre> = emptyList()
        override suspend fun getPeopleForItem(itemId: Long): List<MetadataDao.PersonWithRole> = emptyList()
        override suspend fun getAllAuthors(): List<String> = emptyList()
        override suspend fun getAllGenreNames(): List<String> = emptyList()
        override suspend fun getSeriesByName(name: String): com.universalmedialibrary.data.local.entity.Series? = null
    }

    private class FakeMediaItemDao : MediaItemDao {
        private val map = mutableMapOf<Long, MediaItem>()

        override suspend fun insertMediaItem(mediaItem: MediaItem): Long {
            map[mediaItem.itemId] = mediaItem
            return mediaItem.itemId
        }

        override fun getMediaItemsForLibrary(libraryId: Long): Flow<List<MediaItem>> =
            MutableStateFlow(map.values.filter { it.libraryId == libraryId })
        override suspend fun getMediaItemById(itemId: Long): MediaItem? = map[itemId]
        override suspend fun getMediaItemByFilePath(filePath: String): MediaItem? =
            map.values.find { it.filePath == filePath }
        override suspend fun getExistingFilePaths(filePaths: List<String>): List<String> =
            filePaths.filter { path -> map.values.any { it.filePath == path } }
        override suspend fun getItemByPath(path: String): MediaItem? = map.values.find { it.filePath == path }
        override suspend fun getItemCountForLibrary(libraryId: Long): Int = map.values.count { it.libraryId == libraryId }
        override suspend fun getMediaItemCount(): Int = map.size
        override fun getMediaItemsByLibrary(libraryId: Long): Flow<List<MediaItem>> =
            MutableStateFlow(map.values.filter { it.libraryId == libraryId })
        override suspend fun getMediaItemByPath(filePath: String): MediaItem? = map.values.find { it.filePath == filePath }
        override fun getMediaItemsByType(mediaType: String): Flow<List<MediaItem>> =
            MutableStateFlow(map.values.filter { it.mediaType == mediaType })

        override suspend fun updateMediaItem(mediaItem: MediaItem) {
            map[mediaItem.itemId] = mediaItem
        }

        override suspend fun getAllMediaItems(): List<MediaItem> = map.values.toList()
        override suspend fun setFavorite(itemId: Long, isFavorite: Boolean) {
            map[itemId]?.let { map[itemId] = it.copy(isFavorite = isFavorite) }
        }

        override suspend fun deleteMediaItem(mediaItem: MediaItem) {
            map.remove(mediaItem.itemId)
        }

        override suspend fun searchMediaItems(query: String, limit: Int): List<MediaItem> = emptyList()
        override suspend fun searchMediaItems(
            query: String,
            mediaTypes: List<String>?,
            minRating: Float?,
            maxRating: Float?,
            isFavorite: Boolean?,
            limit: Int
        ): List<MediaItem> = emptyList()

        override fun getAllMediaItemsFlow(): Flow<List<MediaItem>> = MutableStateFlow(map.values.toList())
        override suspend fun getMediaItemsWithTags(tagIds: List<Long>, limit: Int): List<MediaItem> = emptyList()
        override suspend fun getMediaItemsByTypes(mediaTypes: List<String>, limit: Int): List<MediaItem> = emptyList()
        override suspend fun insertMediaItems(mediaItems: List<MediaItem>) {
            mediaItems.forEach { map[it.itemId] = it }
        }

        override suspend fun getItemCountByLibrary(libraryId: Long): Int = map.values.count { it.libraryId == libraryId }
        override suspend fun findDuplicateByNameAndSize(libraryId: Long, fileName: String, fileSize: Long): MediaItem? = null
        override suspend fun findDuplicateByHash(libraryId: Long, fileHash: String): MediaItem? = null
        override fun getFavoriteMediaItems(): Flow<List<MediaItem>> = MutableStateFlow(map.values.filter { it.isFavorite })
        override suspend fun getItemCountByType(mediaType: String): Int = map.values.count { it.mediaType == mediaType }
        override suspend fun getItemCountsByTypeForLibrary(
            libraryId: Long
        ): List<com.universalmedialibrary.data.local.dao.MediaTypeCount> = emptyList()
        override fun getBookDetailsForLibrary(libraryId: Long): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override suspend fun getBookDetailsById(bookId: Long): MediaItem? = map[bookId]
        override suspend fun getBooksBySeries(seriesName: String): List<MediaItem> = emptyList()
        override suspend fun getBooksWithSeries(): List<MediaItem> = emptyList()
        override fun getMediaItemsByGenre(genreName: String, mediaType: String): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override fun getMediaItemsByGenres(
            genreNames: List<String>,
            mediaType: String
        ): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override fun getMediaItemsByAuthor(authorName: String): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override fun getMediaItemsByDirector(directorName: String): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override suspend fun getByType(mediaType: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getCountByType(mediaType: String): Int = map.values.count { it.mediaType == mediaType }
        override suspend fun searchByTypeAndQuery(
            mediaType: String,
            query: String,
            limit: Int,
            offset: Int
        ): List<MediaItem> = emptyList()
        override suspend fun searchByQuery(query: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getRecentItems(limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getByAuthor(author: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getByGenre(genre: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getHighlyRated(mediaType: String?, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getBySeries(seriesId: Long, limit: Int, offset: Int): List<MediaItem> = emptyList()
    }
}
