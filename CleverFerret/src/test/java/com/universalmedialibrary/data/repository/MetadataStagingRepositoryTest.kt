package com.universalmedialibrary.data.repository

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.StagedMetadataCandidateDao
import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.data.local.dao.UnifiedTagWithUsage
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
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
    private lateinit var tagDao: FakeUnifiedTagDao
    private lateinit var repository: MetadataStagingRepository

    private val itemMap = mutableMapOf<Long, MediaItem>()
    private val metaMap = mutableMapOf<Long, MetadataCommon>()

    @Before
    fun setup() {
        stagedDao = FakeStagedMetadataCandidateDao()
        metadataDao = FakeMetadataDao()
        mediaItemDao = FakeMediaItemDao()
        tagDao = FakeUnifiedTagDao()
        repository = MetadataStagingRepository(
            stagedDao,
            metadataDao,
            mediaItemDao,
            tagDao,
            kotlinx.coroutines.test.UnconfinedTestDispatcher()
        )
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
    fun `approveCandidate persists delimited tags to UnifiedTagDao and links to item`() = runTest {
        val item = MediaItem(itemId = 300L, libraryId = 1L, filePath = "/path/book3.epub", fileName = "book3.epub", fileExtension = "epub", fileSize = 1024L, mediaType = "BOOK", hasMetadata = false)
        mediaItemDao.insertMediaItem(item)

        val candidateId = stagedDao.insertCandidate(
            StagedMetadataCandidate(
                itemId = 300L,
                title = "Tagged Book",
                tags = "Sci-Fi, Cyberpunk; Dystopian | Artificial Intelligence",
                confidenceScore = 0.90f
            )
        )

        val success = repository.approveCandidate(candidateId)
        assertThat(success).isTrue()

        // Verify tags created with TagType.USER_DEFINED and usageCount recalculated
        val allTags = tagDao.tags.values.toList()
        assertThat(allTags.map { it.name }).containsExactly(
            "Sci-Fi", "Cyberpunk", "Dystopian", "Artificial Intelligence"
        )
        assertThat(allTags.all { it.type == TagType.USER_DEFINED }).isTrue()
        assertThat(allTags.all { it.usageCount == 1 }).isTrue()

        // Verify item-tag associations
        val itemTags = tagDao.itemTags.filter { it.itemId == 300L }
        assertThat(itemTags).hasSize(4)
        assertThat(itemTags.map { it.tagId }).containsExactlyElementsIn(allTags.map { it.tagId })
    }

    @Test
    fun `approveCandidate deduplicates tags case-insensitively`() = runTest {
        val item = MediaItem(itemId = 301L, libraryId = 1L, filePath = "/path/book4.epub", fileName = "book4.epub", fileExtension = "epub", fileSize = 1024L, mediaType = "BOOK", hasMetadata = false)
        mediaItemDao.insertMediaItem(item)

        val candidateId = stagedDao.insertCandidate(
            StagedMetadataCandidate(
                itemId = 301L,
                title = "Duplicate Tags Book",
                tags = "Fantasy, fantasy, FANTASY; Magic | magic",
                confidenceScore = 0.90f
            )
        )

        val success = repository.approveCandidate(candidateId)
        assertThat(success).isTrue()

        val allTags = tagDao.tags.values.toList()
        assertThat(allTags).hasSize(2)
        assertThat(allTags.map { it.name.lowercase() }).containsExactly("fantasy", "magic")
        assertThat(allTags.all { it.usageCount == 1 }).isTrue()

        val itemTags = tagDao.itemTags.filter { it.itemId == 301L }
        assertThat(itemTags).hasSize(2)
    }

    @Test
    fun `approveCandidate caps tag length at 64 characters`() = runTest {
        val item = MediaItem(itemId = 302L, libraryId = 1L, filePath = "/path/book5.epub", fileName = "book5.epub", fileExtension = "epub", fileSize = 1024L, mediaType = "BOOK", hasMetadata = false)
        mediaItemDao.insertMediaItem(item)

        val longTag = "A".repeat(80)
        val candidateId = stagedDao.insertCandidate(
            StagedMetadataCandidate(
                itemId = 302L,
                title = "Long Tag Book",
                tags = longTag,
                confidenceScore = 0.90f
            )
        )

        val success = repository.approveCandidate(candidateId)
        assertThat(success).isTrue()

        val allTags = tagDao.tags.values.toList()
        assertThat(allTags).hasSize(1)
        val createdTag = allTags.first()
        assertThat(createdTag.name).isEqualTo("A".repeat(64))
        assertThat(createdTag.name.length).isEqualTo(64)
    }

    @Test
    fun `approveCandidate safely ignores null, empty, and blank candidate tags`() = runTest {
        val item1 = MediaItem(itemId = 303L, libraryId = 1L, filePath = "/path/book6.epub", fileName = "book6.epub", fileExtension = "epub", fileSize = 1024L, mediaType = "BOOK", hasMetadata = false)
        val item2 = MediaItem(itemId = 304L, libraryId = 1L, filePath = "/path/book7.epub", fileName = "book7.epub", fileExtension = "epub", fileSize = 1024L, mediaType = "BOOK", hasMetadata = false)
        val item3 = MediaItem(itemId = 305L, libraryId = 1L, filePath = "/path/book8.epub", fileName = "book8.epub", fileExtension = "epub", fileSize = 1024L, mediaType = "BOOK", hasMetadata = false)
        mediaItemDao.insertMediaItems(listOf(item1, item2, item3))

        val c1 = stagedDao.insertCandidate(StagedMetadataCandidate(itemId = 303L, title = "Null Tags", tags = null))
        val c2 = stagedDao.insertCandidate(StagedMetadataCandidate(itemId = 304L, title = "Empty Tags", tags = ""))
        val c3 = stagedDao.insertCandidate(StagedMetadataCandidate(itemId = 305L, title = "Blank Delimiters", tags = "  , ; |   "))

        assertThat(repository.approveCandidate(c1)).isTrue()
        assertThat(repository.approveCandidate(c2)).isTrue()
        assertThat(repository.approveCandidate(c3)).isTrue()

        assertThat(tagDao.tags).isEmpty()
        assertThat(tagDao.itemTags).isEmpty()
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

        override suspend fun setFavorite(itemId: Long, isFavorite: Boolean) {
            map[itemId]?.let { map[itemId] = it.copy(isFavorite = isFavorite) }
        }

        override suspend fun updateAvailability(filePath: String, isAvailable: Boolean) {}
        override suspend fun updateAvailableStatus(itemId: Long, isAvailable: Boolean) {
            map[itemId]?.let { map[itemId] = it.copy(isAvailable = isAvailable) }
        }
        override suspend fun getMediaItemsModifiedSince(sinceTimestamp: Long): List<MediaItem> =
            map.values.filter { it.lastModified > sinceTimestamp }
        override suspend fun getAllMediaItems(): List<MediaItem> = map.values.toList()
        override suspend fun updateDownloadInfo(itemId: Long, cachePath: String?, status: String, progress: Float) {}
        override suspend fun updateDownloadStatus(itemId: Long, status: String, progress: Float) {}
        override suspend fun getMediaItemsByDownloadStatus(status: String): List<MediaItem> =
            map.values.filter { it.downloadStatus == status }
        override suspend fun getItemByPathOrCachePath(path: String): MediaItem? =
            map.values.find { it.filePath == path || it.localCachePath == path }

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
        override suspend fun updateThumbnail(itemId: Long, thumbnailPath: String?, hasThumbnail: Boolean) {
            map[itemId]?.let { map[itemId] = it.copy(thumbnailPath = thumbnailPath, hasThumbnail = hasThumbnail) }
        }
        override suspend fun getPlexMediaItemsByServer(machineIdentifier: String): List<MediaItem> = emptyList()
    }

    private class FakeUnifiedTagDao : UnifiedTagDao {
        val tags = mutableMapOf<Long, UnifiedTag>()
        val itemTags = mutableListOf<ItemTag>()
        private var nextTagId = 1L
        private var nextItemTagId = 1L

        override suspend fun insertTag(tag: UnifiedTag): Long {
            val id = if (tag.tagId == 0L) nextTagId++ else tag.tagId
            val copy = tag.copy(tagId = id)
            tags[id] = copy
            return id
        }

        override suspend fun insertTags(tagsList: List<UnifiedTag>): List<Long> {
            return tagsList.map { insertTag(it) }
        }

        override suspend fun updateTag(tag: UnifiedTag) {
            tags[tag.tagId] = tag
        }

        override suspend fun deleteTag(tag: UnifiedTag) {
            tags.remove(tag.tagId)
            itemTags.removeAll { it.tagId == tag.tagId }
        }

        override suspend fun deleteTagById(tagId: Long) {
            tags.remove(tagId)
            itemTags.removeAll { it.tagId == tagId }
        }

        override suspend fun deleteTag(tagId: Long) {
            deleteTagById(tagId)
        }

        override suspend fun updateTagName(tagId: Long, newName: String) {
            tags[tagId]?.let { tags[tagId] = it.copy(name = newName) }
        }

        override suspend fun getTagById(tagId: Long): UnifiedTag? = tags[tagId]

        override suspend fun getTagByName(name: String): UnifiedTag? =
            tags.values.find { it.name.equals(name.trim(), ignoreCase = true) }

        override fun getAllTags(): Flow<List<UnifiedTag>> = MutableStateFlow(tags.values.toList())

        override fun getTagsByType(type: TagType): Flow<List<UnifiedTag>> =
            MutableStateFlow(tags.values.filter { it.type == type })

        override fun getRecentlyUsedTags(limit: Int): Flow<List<UnifiedTag>> =
            MutableStateFlow(tags.values.sortedByDescending { it.lastUsed }.take(limit))

        override fun getMostUsedTags(limit: Int): Flow<List<UnifiedTag>> =
            MutableStateFlow(tags.values.sortedByDescending { it.usageCount }.take(limit))

        override fun searchTags(query: String): Flow<List<UnifiedTag>> =
            MutableStateFlow(tags.values.filter { it.name.contains(query, ignoreCase = true) })

        override suspend fun addTagToItem(itemTag: ItemTag) {
            itemTags.removeAll { it.itemId == itemTag.itemId && it.tagId == itemTag.tagId }
            val id = if (itemTag.id == 0L) nextItemTagId++ else itemTag.id
            itemTags.add(itemTag.copy(id = id))
        }

        override suspend fun addTagsToItem(itemTagsList: List<ItemTag>) {
            itemTagsList.forEach { addTagToItem(it) }
        }

        override suspend fun removeTagFromItem(itemId: Long, tagId: Long) {
            itemTags.removeAll { it.itemId == itemId && it.tagId == tagId }
        }

        override suspend fun removeAllTagsFromItem(itemId: Long) {
            itemTags.removeAll { it.itemId == itemId }
        }

        override suspend fun removeTagFromAllItems(tagId: Long) {
            itemTags.removeAll { it.tagId == tagId }
        }

        override fun getTagsForItem(itemId: Long): Flow<List<UnifiedTag>> {
            val tagIds = itemTags.filter { it.itemId == itemId }.map { it.tagId }.toSet()
            return MutableStateFlow(tags.values.filter { it.tagId in tagIds })
        }

        override suspend fun getTagsForItemSync(itemId: Long): List<UnifiedTag> {
            val tagIds = itemTags.filter { it.itemId == itemId }.map { it.tagId }.toSet()
            return tags.values.filter { it.tagId in tagIds }
        }

        override suspend fun getItemIdsForTag(tagId: Long): List<Long> {
            return itemTags.filter { it.tagId == tagId }.map { it.itemId }
        }

        override suspend fun incrementUsageCount(tagId: Long, timestamp: Long) {
            tags[tagId]?.let {
                tags[tagId] = it.copy(usageCount = it.usageCount + 1, lastUsed = timestamp)
            }
        }

        override suspend fun recalculateUsageCount(tagId: Long) {
            val count = itemTags.count { it.tagId == tagId }
            tags[tagId]?.let {
                tags[tagId] = it.copy(usageCount = count)
            }
        }

        override suspend fun recalculateAllUsageCounts() {
            tags.keys.forEach { recalculateUsageCount(it) }
        }

        override fun getTagSuggestions(query: String, limit: Int): Flow<List<UnifiedTag>> =
            MutableStateFlow(emptyList())

        override suspend fun getPopularTagsForMediaType(mediaType: String, limit: Int): List<UnifiedTag> =
            emptyList()

        override fun observeTagUsage(mediaType: String?): Flow<List<UnifiedTagWithUsage>> =
            MutableStateFlow(emptyList())
    }
}
