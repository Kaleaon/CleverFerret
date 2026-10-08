package com.universalmedialibrary.services.ingestion

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.StagedMetadataCandidateDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import com.universalmedialibrary.data.repository.MetadataStagingRepository
import com.universalmedialibrary.ui.metadata.review.MetadataReviewQueueViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class IngestionStagingGatewaysTest {

    private val testDispatcher = StandardTestDispatcher()
    private lateinit var stagedDao: FakeStagedCandidateDao
    private lateinit var metadataDao: FakeMetadataDao
    private lateinit var mediaItemDao: FakeMediaItemDao
    private lateinit var stagingRepository: MetadataStagingRepository
    private lateinit var healthMonitor: SourceHealthMonitor
    private lateinit var stateStore: InMemoryIncrementalStateStore
    private lateinit var pipeline: IngestionPipeline

    @Before
    fun setup() {
        Dispatchers.setMain(testDispatcher)
        stagedDao = FakeStagedCandidateDao()
        metadataDao = FakeMetadataDao()
        mediaItemDao = FakeMediaItemDao()
        stagingRepository = MetadataStagingRepository(stagedDao, metadataDao, mediaItemDao, testDispatcher)
        healthMonitor = SourceHealthMonitor()
        stateStore = InMemoryIncrementalStateStore()
        pipeline = IngestionPipeline(
            sourceHealthMonitor = healthMonitor,
            incrementalStateStore = stateStore,
            metadataStagingRepository = stagingRepository
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `IngestionPipeline execute halts active persistence when enriched is MetadataCommon`() = runTest {
        var persistCalled = false
        val candidateMetadata = MetadataCommon(
            itemId = 101L,
            title = "Scraped Book Title",
            summary = "Scraped summary text"
        )

        pipeline.execute<Unit, Unit, Unit, Unit, MetadataCommon, MetadataCommon>(
            sourceId = "test-scraper",
            authenticate = {},
            fetchPage = { _, _ -> },
            parse = {},
            deduplicate = {},
            enrichMetadata = { candidateMetadata },
            persist = {
                persistCalled = true
                it
            },
            nextIncrementalToken = { "token1" }
        )

        testScheduler.advanceUntilIdle()

        // Active persistence must NOT be called
        assertThat(persistCalled).isFalse()

        // Metadata must be staged in staged_metadata_candidates
        val pending = stagingRepository.getPendingCandidates()
        assertThat(pending).hasSize(1)
        assertThat(pending.first().itemId).isEqualTo(101L)
        assertThat(pending.first().title).isEqualTo("Scraped Book Title")
        assertThat(pending.first().source).isEqualTo("IngestionPipeline:test-scraper")

        // Active MetadataCommon must remain unwritten
        assertThat(metadataDao.getMetadataCommonByItemId(101L)).isNull()
    }

    @Test
    fun `MetadataStagingRepository approveCandidate merges candidate into MetadataCommon with isVerified true`() = runTest {
        // Given a media item shell in DB with hasMetadata = false
        val item = MediaItem(
            itemId = 200L,
            libraryId = 1L,
            filePath = "/path/book.epub",
            fileName = "book.epub",
            fileExtension = "epub",
            fileSize = 2048L,
            mediaType = "BOOK",
            hasMetadata = false
        )
        mediaItemDao.insertMediaItem(item)

        // Staged candidate metadata
        val candidateId = stagingRepository.stageMetadataCommon(
            itemId = 200L,
            metadata = MetadataCommon(
                itemId = 200L,
                title = "Verified Title",
                summary = "Verified Summary",
                year = 2025
            ),
            source = "TestImport",
            confidenceScore = 0.95f
        )

        // Approve candidate
        val approved = stagingRepository.approveCandidate(candidateId)
        assertThat(approved).isTrue()

        // Active MetadataCommon must be written with isVerified = true
        val activeMetadata = metadataDao.getMetadataCommonByItemId(200L)
        assertThat(activeMetadata).isNotNull()
        assertThat(activeMetadata?.title).isEqualTo("Verified Title")
        assertThat(activeMetadata?.summary).isEqualTo("Verified Summary")
        assertThat(activeMetadata?.isVerified).isTrue()

        // MediaItem.hasMetadata must be updated to true
        val updatedItem = mediaItemDao.getMediaItemById(200L)
        assertThat(updatedItem?.hasMetadata).isTrue()

        // Staging queue must be cleared
        assertThat(stagingRepository.getPendingCandidates()).isEmpty()
    }

    @Test
    fun `MetadataReviewQueueViewModel shows diffs and handles approve`() = runTest {
        // Setup existing media item
        mediaItemDao.insertMediaItem(
            MediaItem(
                itemId = 300L,
                libraryId = 1L,
                filePath = "/path/item300.epub",
                fileName = "item300.epub",
                fileExtension = "epub",
                fileSize = 1000L,
                mediaType = "BOOK",
                hasMetadata = false
            )
        )

        stagingRepository.stageMetadataCommon(
            itemId = 300L,
            metadata = MetadataCommon(
                itemId = 300L,
                title = "New Title",
                year = 2026
            ),
            source = "MediaScanner",
            confidenceScore = 0.85f
        )

        val viewModel = MetadataReviewQueueViewModel(
            metadataStagingRepository = stagingRepository,
            metadataDao = metadataDao,
            mediaItemDao = mediaItemDao
        )

        val collectJob = backgroundScope.launch(UnconfinedTestDispatcher(testScheduler)) {
            viewModel.uiState.collect {}
        }

        testScheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.candidateDiffs).hasSize(1)
        val diff = state.candidateDiffs.first()
        assertThat(diff.mediaItemName).isEqualTo("item300.epub")
        assertThat(diff.candidate.title).isEqualTo("New Title")

        // Approve candidate via VM
        viewModel.approveCandidate(diff.candidate.candidateId)
        testScheduler.advanceUntilIdle()

        // Candidate candidate should be approved and removed
        val active = metadataDao.getMetadataCommonByItemId(300L)
        assertThat(active?.title).isEqualTo("New Title")
        assertThat(active?.isVerified).isTrue()
        collectJob.cancel()
    }

    // --- Fake DAOs for testing ---

    private class FakeStagedCandidateDao : StagedMetadataCandidateDao {
        private val list = mutableListOf<StagedMetadataCandidate>()
        private val flow = MutableStateFlow<List<StagedMetadataCandidate>>(emptyList())
        private var idCounter = 1L

        private fun updateFlow() {
            flow.value = list.filter { it.status == "PENDING" }
        }

        override suspend fun insertCandidate(candidate: StagedMetadataCandidate): Long {
            val id = if (candidate.candidateId == 0L) idCounter++ else candidate.candidateId
            val copy = candidate.copy(candidateId = id)
            list.removeAll { it.candidateId == id }
            list.add(copy)
            updateFlow()
            return id
        }

        override suspend fun insertCandidates(candidates: List<StagedMetadataCandidate>): List<Long> {
            val res = candidates.map { insertCandidate(it) }
            updateFlow()
            return res
        }

        override suspend fun updateCandidate(candidate: StagedMetadataCandidate) {
            list.removeAll { it.candidateId == candidate.candidateId }
            list.add(candidate)
            updateFlow()
        }

        override suspend fun getCandidateById(candidateId: Long): StagedMetadataCandidate? {
            return list.find { it.candidateId == candidateId }
        }

        override fun observePendingCandidates(): Flow<List<StagedMetadataCandidate>> {
            updateFlow()
            return flow
        }

        override suspend fun getPendingCandidates(): List<StagedMetadataCandidate> {
            return list.filter { it.status == "PENDING" }
        }

        override suspend fun getPendingCandidatesByItemId(itemId: Long): List<StagedMetadataCandidate> {
            return list.filter { it.itemId == itemId && it.status == "PENDING" }
        }

        override suspend fun deleteCandidate(candidateId: Long) {
            list.removeAll { it.candidateId == candidateId }
            updateFlow()
        }

        override suspend fun deleteCandidates(candidateIds: List<Long>) {
            list.removeAll { candidateIds.contains(it.candidateId) }
            updateFlow()
        }

        override suspend fun deleteCandidatesByItemId(itemId: Long) {
            list.removeAll { it.itemId == itemId }
            updateFlow()
        }

        override suspend fun deleteExpiredCandidates(nowEpochMs: Long): Int {
            val expired = list.filter { it.expiresAt < nowEpochMs }
            list.removeAll(expired)
            updateFlow()
            return expired.size
        }

        override suspend fun deleteAllCandidates() {
            list.clear()
            updateFlow()
        }
    }

    private class FakeMetadataDao : MetadataDao {
        private val map = mutableMapOf<Long, MetadataCommon>()

        override suspend fun insertMetadataCommon(metadataCommon: MetadataCommon) {
            map[metadataCommon.itemId] = metadataCommon
        }

        override suspend fun insertMetadataCommonList(items: List<MetadataCommon>) {
            items.forEach { map[it.itemId] = it }
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

        override fun getMediaItemsForLibrary(libraryId: Long): Flow<List<MediaItem>> = MutableStateFlow(map.values.filter { it.libraryId == libraryId })
        override suspend fun getMediaItemById(itemId: Long): MediaItem? = map[itemId]
        override suspend fun getMediaItemByFilePath(filePath: String): MediaItem? = map.values.find { it.filePath == filePath }
        override suspend fun getExistingFilePaths(filePaths: List<String>): List<String> = filePaths.filter { path -> map.values.any { it.filePath == path } }
        override suspend fun getItemByPath(path: String): MediaItem? = map.values.find { it.filePath == path }
        override suspend fun getItemCountForLibrary(libraryId: Long): Int = map.values.count { it.libraryId == libraryId }
        override suspend fun getMediaItemCount(): Int = map.size
        override fun getMediaItemsByLibrary(libraryId: Long): Flow<List<MediaItem>> = MutableStateFlow(map.values.filter { it.libraryId == libraryId })
        override suspend fun getMediaItemByPath(filePath: String): MediaItem? = map.values.find { it.filePath == filePath }
        override fun getMediaItemsByType(mediaType: String): Flow<List<MediaItem>> = MutableStateFlow(map.values.filter { it.mediaType == mediaType })

        override suspend fun updateMediaItem(mediaItem: MediaItem) {
            map[mediaItem.itemId] = mediaItem
        }

        override suspend fun setFavorite(itemId: Long, isFavorite: Boolean) {
            map[itemId]?.let { map[itemId] = it.copy(isFavorite = isFavorite) }
        }

        override suspend fun updateAvailableStatus(itemId: Long, isAvailable: Boolean) {
            map[itemId]?.let { map[itemId] = it.copy(isAvailable = isAvailable) }
        }

        override suspend fun updateDownloadInfo(itemId: Long, cachePath: String?, status: String, progress: Float) {
            map[itemId]?.let { map[itemId] = it.copy(localCachePath = cachePath, downloadStatus = status, downloadProgress = progress) }
        }

        override suspend fun updateDownloadStatus(itemId: Long, status: String, progress: Float) {
            map[itemId]?.let { map[itemId] = it.copy(downloadStatus = status, downloadProgress = progress) }
        }

        override suspend fun getMediaItemsByDownloadStatus(status: String): List<MediaItem> = map.values.filter { it.downloadStatus == status }

        override suspend fun getItemByPathOrCachePath(path: String): MediaItem? = map.values.find { it.filePath == path || it.localCachePath == path }

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
        override suspend fun getItemCountsByTypeForLibrary(libraryId: Long): List<com.universalmedialibrary.data.local.dao.MediaTypeCount> = emptyList()
        override fun getBookDetailsForLibrary(libraryId: Long): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override suspend fun getBookDetailsById(bookId: Long): MediaItem? = map[bookId]
        override suspend fun getAllMediaItems(): List<MediaItem> = map.values.toList()
        override suspend fun getBooksBySeries(seriesName: String): List<MediaItem> = emptyList()
        override suspend fun getBooksWithSeries(): List<MediaItem> = emptyList()
        override fun getMediaItemsByGenre(genreName: String, mediaType: String): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override fun getMediaItemsByGenres(genreNames: List<String>, mediaType: String): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override fun getMediaItemsByAuthor(authorName: String): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override fun getMediaItemsByDirector(directorName: String): Flow<List<MediaItem>> = MutableStateFlow(emptyList())
        override suspend fun getByType(mediaType: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getCountByType(mediaType: String): Int = map.values.count { it.mediaType == mediaType }
        override suspend fun searchByTypeAndQuery(mediaType: String, query: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun searchByQuery(query: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getRecentItems(limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getByAuthor(author: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getByGenre(genre: String, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getHighlyRated(mediaType: String?, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun getBySeries(seriesId: Long, limit: Int, offset: Int): List<MediaItem> = emptyList()
        override suspend fun updateAvailability(filePath: String, isAvailable: Boolean) {
            map.values.find { it.filePath == filePath }?.let { item ->
                map[item.itemId] = item.copy(isAvailable = isAvailable)
            }
        }
    }
}
