package com.universalmedialibrary.ui.metadata.review

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import com.universalmedialibrary.data.repository.MetadataStagingRepository
import com.universalmedialibrary.testing.MainDispatcherRule
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.UnconfinedTestDispatcher
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class MetadataReviewQueueViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val metadataStagingRepository: MetadataStagingRepository = mockk(relaxed = true)
    private val metadataDao: MetadataDao = mockk(relaxed = true)
    private val mediaItemDao: MediaItemDao = mockk(relaxed = true)

    private val candidatesFlow = MutableStateFlow<List<StagedMetadataCandidate>>(emptyList())

    private val candidateHigh = StagedMetadataCandidate(
        candidateId = 1L,
        itemId = 101L,
        title = "High Confidence Item",
        confidenceScore = 0.95f,
        source = "EPUB_PARSER",
        status = "PENDING"
    )

    private val candidateMedium = StagedMetadataCandidate(
        candidateId = 2L,
        itemId = 102L,
        title = "Medium Confidence Item",
        confidenceScore = 0.65f,
        source = "WEB_SCRAPER",
        status = "PENDING"
    )

    private val candidateLow = StagedMetadataCandidate(
        candidateId = 3L,
        itemId = 103L,
        title = "Low Confidence Item",
        confidenceScore = 0.35f,
        source = "FALLBACK_PARSER",
        status = "PENDING"
    )

    @Before
    fun setUp() {
        every { metadataStagingRepository.observePendingCandidates() } returns candidatesFlow

        val mediaItem1 = MediaItem(
            itemId = 101L,
            libraryId = 1L,
            filePath = "/media/high.epub",
            fileName = "high.epub",
            fileExtension = "epub",
            fileSize = 1000L,
            mediaType = "BOOK"
        )
        val mediaItem2 = MediaItem(
            itemId = 102L,
            libraryId = 1L,
            filePath = "/media/med.epub",
            fileName = "med.epub",
            fileExtension = "epub",
            fileSize = 2000L,
            mediaType = "BOOK"
        )
        val mediaItem3 = MediaItem(
            itemId = 103L,
            libraryId = 1L,
            filePath = "/media/low.epub",
            fileName = "low.epub",
            fileExtension = "epub",
            fileSize = 3000L,
            mediaType = "BOOK"
        )

        coEvery { mediaItemDao.getMediaItemById(101L) } returns mediaItem1
        coEvery { mediaItemDao.getMediaItemById(102L) } returns mediaItem2
        coEvery { mediaItemDao.getMediaItemById(103L) } returns mediaItem3

        coEvery { metadataDao.getMetadataCommonByItemId(101L) } returns MetadataCommon(
            itemId = 101L,
            title = "high",
            isVerified = false
        )
        coEvery { metadataDao.getMetadataCommonByItemId(102L) } returns MetadataCommon(
            itemId = 102L,
            title = "med",
            isVerified = false
        )
        coEvery { metadataDao.getMetadataCommonByItemId(103L) } returns MetadataCommon(
            itemId = 103L,
            title = "low",
            isVerified = false
        )
    }

    @Test
    fun `uiState presents all staged candidates with calculated confidence scores when filter is ALL`() = runTest {
        candidatesFlow.value = listOf(candidateHigh, candidateMedium, candidateLow)

        val viewModel = MetadataReviewQueueViewModel(
            metadataStagingRepository = metadataStagingRepository,
            metadataDao = metadataDao,
            mediaItemDao = mediaItemDao
        )

        backgroundScope.launch(UnconfinedTestDispatcher(testScheduler)) {
            viewModel.uiState.collect()
        }
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertFalse(state.isLoading)
        assertEquals(3, state.candidateDiffs.size)

        val highDiff = state.candidateDiffs.first { it.candidate.candidateId == 1L }
        assertEquals(0.95f, highDiff.candidate.confidenceScore, 0.001f)
        assertEquals("High Confidence Item", highDiff.candidate.title)

        val medDiff = state.candidateDiffs.first { it.candidate.candidateId == 2L }
        assertEquals(0.65f, medDiff.candidate.confidenceScore, 0.001f)

        val lowDiff = state.candidateDiffs.first { it.candidate.candidateId == 3L }
        assertEquals(0.35f, lowDiff.candidate.confidenceScore, 0.001f)
    }

    @Test
    fun `uiState filters to only high-confidence candidates when filter is HIGH`() = runTest {
        candidatesFlow.value = listOf(candidateHigh, candidateMedium, candidateLow)

        val viewModel = MetadataReviewQueueViewModel(
            metadataStagingRepository = metadataStagingRepository,
            metadataDao = metadataDao,
            mediaItemDao = mediaItemDao
        )

        backgroundScope.launch(UnconfinedTestDispatcher(testScheduler)) {
            viewModel.uiState.collect()
        }
        advanceUntilIdle()

        viewModel.setFilter(ConfidenceFilter.HIGH)
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals(ConfidenceFilter.HIGH, state.filter)
        assertEquals(1, state.candidateDiffs.size)
        assertEquals(1L, state.candidateDiffs.first().candidate.candidateId)
        assertTrue(state.candidateDiffs.first().candidate.confidenceScore >= 0.80f)
    }

    @Test
    fun `approveAllVisible batch approves only visible filtered candidates`() = runTest {
        candidatesFlow.value = listOf(candidateHigh, candidateMedium, candidateLow)
        coEvery { metadataStagingRepository.approveCandidates(any()) } returns 1

        val viewModel = MetadataReviewQueueViewModel(
            metadataStagingRepository = metadataStagingRepository,
            metadataDao = metadataDao,
            mediaItemDao = mediaItemDao
        )

        backgroundScope.launch(UnconfinedTestDispatcher(testScheduler)) {
            viewModel.uiState.collect()
        }
        advanceUntilIdle()

        // Filter to high confidence and batch approve
        viewModel.setFilter(ConfidenceFilter.HIGH)
        advanceUntilIdle()

        viewModel.approveAllVisible()
        advanceUntilIdle()

        coVerify { metadataStagingRepository.approveCandidates(listOf(1L)) }
    }

    @Test
    fun `approveCandidate calls repository approveCandidate with candidate id`() = runTest {
        coEvery { metadataStagingRepository.approveCandidate(1L) } returns true

        val viewModel = MetadataReviewQueueViewModel(
            metadataStagingRepository = metadataStagingRepository,
            metadataDao = metadataDao,
            mediaItemDao = mediaItemDao
        )

        viewModel.approveCandidate(1L)
        advanceUntilIdle()

        coVerify { metadataStagingRepository.approveCandidate(1L) }
    }
}
