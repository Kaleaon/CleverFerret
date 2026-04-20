package com.universalmedialibrary.data.repository

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.SearchHistoryDao
import com.universalmedialibrary.data.local.entity.SearchHistory
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class SearchHistoryRepositoryTest {

    private val dao = mockk<SearchHistoryDao>()
    private val repository = SearchHistoryRepository(dao)

    @Test
    fun insertAndReadHistory_delegatesToDao() = runTest {
        val history = SearchHistory(historyId = 7, query = "dune", resultCount = 2)
        coEvery { dao.insertSearch(history) } returns 7L
        coEvery { dao.getRecentSearches(10) } returns listOf(history)

        val insertedId = repository.insertSearch(history)
        val recent = repository.getRecentSearches()

        assertThat(insertedId).isEqualTo(7L)
        assertThat(recent).containsExactly(history)
        coVerify { dao.insertSearch(history) }
        coVerify { dao.getRecentSearches(10) }
    }

    @Test
    fun searchDeleteAndClear_delegateToDao() = runTest {
        val history = SearchHistory(historyId = 5, query = "hobbit", resultCount = 1)
        coEvery { dao.searchHistory("hob", 5) } returns listOf(history)
        coEvery { dao.deleteSearch(5L) } returns Unit
        coEvery { dao.clearHistory() } returns Unit

        val matches = repository.searchHistory("hob", limit = 5)
        repository.deleteSearch(5L)
        repository.clearSearchHistory()

        assertThat(matches).containsExactly(history)
        coVerify { dao.searchHistory("hob", 5) }
        coVerify { dao.deleteSearch(5L) }
        coVerify { dao.clearHistory() }
    }
}
