package com.universalmedialibrary.ui.media.viewmodels

import androidx.lifecycle.SavedStateHandle
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
                subtitle = "",
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

    @Test
    fun savedStateHandle_restoresQueryAndFilters_andExecutesSearch() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns listOf(
            SearchResult(
                itemId = 42L,
                title = "Dune",
                subtitle = "Frank Herbert",
                mediaType = "BOOK",
                thumbnailUrl = null,
                relevanceScore = 1.0f,
                highlights = emptyList()
            )
        )

        val savedStateHandle = SavedStateHandle(
            mapOf(
                SearchViewModel.KEY_QUERY to "dune",
                SearchViewModel.KEY_CATEGORY to "BOOKS",
                SearchViewModel.KEY_MEDIA_TYPE to "BOOK"
            )
        )

        val viewModel = SearchViewModel(searchService, savedStateHandle)
        advanceUntilIdle()

        assertThat(viewModel.uiState.value.query).isEqualTo("dune")
        assertThat(viewModel.uiState.value.selectedCategory).isEqualTo(SearchCategory.BOOKS)
        assertThat(viewModel.uiState.value.selectedMediaType).isEqualTo(MediaType.BOOK)
        assertThat(viewModel.uiState.value.results).isNotEmpty()
        coVerify(atLeast = 1) { searchService.search(match<SearchQuery> { it.textQuery == "dune" }) }
    }

    @Test
    fun savedStateHandle_persistsQueryCategoryAndMediaType_onUpdates() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns emptyList()

        val savedStateHandle = SavedStateHandle()
        val viewModel = SearchViewModel(searchService, savedStateHandle)

        viewModel.updateQuery("foundation")
        viewModel.setCategory(SearchCategory.BOOKS)
        viewModel.setMediaType(MediaType.BOOK)
        advanceUntilIdle()

        assertThat(savedStateHandle.get<String>(SearchViewModel.KEY_QUERY)).isEqualTo("foundation")
        assertThat(savedStateHandle.get<String>(SearchViewModel.KEY_CATEGORY)).isEqualTo("BOOKS")
        assertThat(savedStateHandle.get<String>(SearchViewModel.KEY_MEDIA_TYPE)).isEqualTo("BOOK")
    }

    @Test
    fun savedStateHandle_survivesViewModelRecreation() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns listOf(
            SearchResult(
                itemId = 99L,
                title = "Foundation",
                subtitle = "Isaac Asimov",
                mediaType = "BOOK",
                thumbnailUrl = null,
                relevanceScore = 1.0f,
                highlights = emptyList()
            )
        )

        val savedStateHandle = SavedStateHandle()
        val viewModel1 = SearchViewModel(searchService, savedStateHandle)
        viewModel1.updateQuery("foundation")
        viewModel1.setCategory(SearchCategory.BOOKS)
        viewModel1.setMediaType(MediaType.BOOK)
        advanceUntilIdle()

        // Recreate ViewModel with the same SavedStateHandle
        val viewModel2 = SearchViewModel(searchService, savedStateHandle)
        advanceUntilIdle()

        assertThat(viewModel2.uiState.value.query).isEqualTo("foundation")
        assertThat(viewModel2.uiState.value.selectedCategory).isEqualTo(SearchCategory.BOOKS)
        assertThat(viewModel2.uiState.value.selectedMediaType).isEqualTo(MediaType.BOOK)
        assertThat(viewModel2.uiState.value.results).isNotEmpty()
        coVerify { searchService.search(match<SearchQuery> { it.textQuery == "foundation" }) }
    }

    @Test
    fun clearSearch_removesQueryFromSavedStateHandle_andRecreationDoesNotSearch() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns emptyList()

        val savedStateHandle = SavedStateHandle(mapOf(SearchViewModel.KEY_QUERY to "old query"))
        val viewModel = SearchViewModel(searchService, savedStateHandle)
        advanceUntilIdle()

        viewModel.clearSearch()

        val savedQuery = savedStateHandle.get<String>(SearchViewModel.KEY_QUERY)
        assertThat(savedQuery.isNullOrEmpty()).isTrue()
        assertThat(viewModel.uiState.value.query).isEmpty()

        val recreatedViewModel = SearchViewModel(searchService, savedStateHandle)
        advanceUntilIdle()

        assertThat(recreatedViewModel.uiState.value.query).isEmpty()
    }

    @Test
    fun savedStateHandle_invalidEnumValues_fallBackToNullSafely() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns emptyList()

        val savedStateHandle = SavedStateHandle(
            mapOf(
                SearchViewModel.KEY_CATEGORY to "INVALID_CATEGORY_XYZ",
                SearchViewModel.KEY_MEDIA_TYPE to "INVALID_TYPE_XYZ"
            )
        )

        val viewModel = SearchViewModel(searchService, savedStateHandle)
        advanceUntilIdle()

        assertThat(viewModel.uiState.value.selectedCategory).isNull()
        assertThat(viewModel.uiState.value.selectedMediaType).isNull()
    }

    @Test
    fun savedStateHandle_blankRestoredQuery_doesNotExecuteSearch() = runTest {
        val searchService = mockk<EnhancedSearchService>()
        coEvery { searchService.getSearchHistory(any()) } returns emptyList()
        coEvery { searchService.search(any()) } returns emptyList()

        val savedStateHandle = SavedStateHandle(mapOf(SearchViewModel.KEY_QUERY to "   "))
        val viewModel = SearchViewModel(searchService, savedStateHandle)
        advanceUntilIdle()

        coVerify(exactly = 0) { searchService.search(any()) }
    }
}

@OptIn(ExperimentalCoroutinesApi::class)
class MainDispatcherRule(
    private val dispatcher: TestDispatcher = StandardTestDispatcher()
) : TestWatcher() {
    override fun starting(description: Description) {
        Dispatchers.setMain(dispatcher)
    }

    override fun finished(description: Description) {
        Dispatchers.resetMain()
    }
}
