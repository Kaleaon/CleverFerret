package com.universalmedialibrary.ui.media.viewmodels

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.services.search.EnhancedSearchService
import com.universalmedialibrary.services.search.SearchQuery
import com.universalmedialibrary.services.search.SearchResult
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.screens.SearchCategory
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.TestDispatcher
import kotlinx.coroutines.test.advanceTimeBy
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TestWatcher
import org.junit.runner.Description

@OptIn(ExperimentalCoroutinesApi::class)
class SearchViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    @Test
    fun rapidQueryChanges_cancelDebounceJobs_withoutUserVisibleError() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns listOf(
            SearchResult(
                itemId = 1L,
                title = "The latest query result",
                subtitle = null,
                mediaType = "BOOK",
                thumbnailUrl = null,
                relevanceScore = 1.0f,
                highlights = emptyList()
            )
        )

        val viewModel = SearchViewModel(searchService)
        val emittedMessages = mutableListOf<String>()
        val collector = backgroundScope.launch {
            viewModel.userMessages.collect { emittedMessages += it }
        }

        viewModel.updateQuery("ab")
        advanceTimeBy(150)
        viewModel.updateQuery("abc")
        advanceTimeBy(300)
        advanceUntilIdle()

        coVerify(exactly = 1) { searchService.search(match<SearchQuery> { it.textQuery == "abc" }) }
        coVerify(exactly = 0) { searchService.search(match<SearchQuery> { it.textQuery == "ab" }) }
        assertThat(emittedMessages).isEmpty()
        assertThat(viewModel.uiState.value.results).isNotEmpty()

        collector.cancel()
    }

    @Test
    fun cancellationFromSearch_isRethrownAndNotEmittedAsUserError() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } coAnswers {
            delay(1)
            throw CancellationException("search cancelled")
        }

        val viewModel = SearchViewModel(searchService)
        val emittedMessages = mutableListOf<String>()
        val collector = backgroundScope.launch {
            viewModel.userMessages.collect { emittedMessages += it }
        }

        viewModel.search("cancel me")
        advanceUntilIdle()

        assertThat(emittedMessages).isEmpty()
        assertThat(viewModel.uiState.value.isSearching).isFalse()

        collector.cancel()
    }

    @Test
    fun filterSelections_persistAcrossQueryUpdates() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns emptyList()

        val viewModel = SearchViewModel(searchService)

        viewModel.setCategory(SearchCategory.BOOKS)
        viewModel.setMediaType(MediaType.BOOK)
        viewModel.updateQuery("harry")
        advanceTimeBy(300)
        advanceUntilIdle()

        assertThat(viewModel.uiState.value.selectedCategory).isEqualTo(SearchCategory.BOOKS)
        assertThat(viewModel.uiState.value.selectedMediaType).isEqualTo(MediaType.BOOK)
    }
}

@OptIn(ExperimentalCoroutinesApi::class)
private class MainDispatcherRule(
    private val dispatcher: TestDispatcher = StandardTestDispatcher()
) : TestWatcher() {
    override fun starting(description: Description) {
        Dispatchers.setMain(dispatcher)
    }

    override fun finished(description: Description) {
        Dispatchers.resetMain()
    }
}
