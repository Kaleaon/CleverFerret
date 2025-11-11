package com.universalmedialibrary.ui.fanfiction

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.FanfictionDao
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.services.ContentPinRequiredException
import com.universalmedialibrary.services.DownloadBlockedException
import com.universalmedialibrary.services.DownloadSafetyChecker
import com.universalmedialibrary.services.fanfiction.FanfictionDownloadService
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class FanfictionViewModelTest {

    @MockK
    lateinit var fanfictionService: FanfictionDownloadService

    @MockK
    lateinit var fanfictionDao: FanfictionDao

    @MockK
    lateinit var downloadSafetyChecker: DownloadSafetyChecker

    private val dispatcher = StandardTestDispatcher()
    private lateinit var viewModel: FanfictionViewModel

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        Dispatchers.setMain(dispatcher)

        every { fanfictionDao.getAllStories() } returns flowOf(emptyList())
        every { fanfictionDao.getStoriesBySite(any()) } returns flowOf(emptyList())
        every { fanfictionDao.searchStories(any()) } returns flowOf(emptyList())

        viewModel = FanfictionViewModel(
            fanfictionService = fanfictionService,
            fanfictionDao = fanfictionDao,
            downloadSafetyChecker = downloadSafetyChecker
        )
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `downloadStory surfaces PIN challenge when ContentPinRequiredException thrown`() = runTest {
        val exception = ContentPinRequiredException(contentTitle = "Locked Story", contentRating = "Explicit")
        coEvery { fanfictionService.downloadStory(any(), any(), any()) } returns Result.failure(exception)

        viewModel.downloadStory("https://example.com/story")
        advanceUntilIdle()

        val challenge = viewModel.pendingPinChallenge.value
        assertThat(challenge).isNotNull()
        assertThat(challenge?.title).isEqualTo("Locked Story")
        assertThat(viewModel.downloadState.value).isEqualTo(DownloadState.Idle)
    }

    @Test
    fun `downloadStory emits error when download is blocked`() = runTest {
        val blockedMessage = "Parental controls are blocking this download. Update your parental control settings to continue."
        val exception = DownloadBlockedException(
            message = blockedMessage,
            contentRating = "Explicit"
        )
        coEvery { fanfictionService.downloadStory(any(), any(), any()) } returns Result.failure(exception)

        viewModel.downloadStory("https://example.com/story")
        advanceUntilIdle()

        val state = viewModel.downloadState.value
        assertThat(state).isInstanceOf(DownloadState.Error::class.java)
        assertThat((state as DownloadState.Error).message).isEqualTo(blockedMessage)
        assertThat(viewModel.pendingPinChallenge.value).isNull()
    }

    @Test
    fun `updateStory surfaces PIN challenge using stored metadata`() = runTest {
        val story = FanfictionStoryEntity(
            id = "story-1",
            sourceUrl = "https://example.com/story-1",
            sourceSite = "AO3",
            title = "My Story",
            author = "Author",
            summary = "Summary",
            rating = "Explicit",
            status = "IN_PROGRESS",
            wordCount = 1000,
            chapterCount = 10,
            lastChapterDownloaded = 5,
            lastCheckedDate = 0L,
            epubPath = null
        )
        every { fanfictionDao.getAllStories() } returns flowOf(listOf(story))
        coEvery { fanfictionDao.getStoryById("story-1") } returns story
        val exception = ContentPinRequiredException(contentTitle = null, contentRating = "Explicit")
        coEvery { fanfictionService.updateStory(any(), any(), any()) } returns Result.failure(exception)

        viewModel.updateStory("story-1")
        advanceUntilIdle()

        val challenge = viewModel.pendingPinChallenge.value
        assertThat(challenge).isNotNull()
        assertThat(challenge?.title).isEqualTo("My Story")
        assertThat(viewModel.downloadState.value).isEqualTo(DownloadState.Idle)
    }
}
