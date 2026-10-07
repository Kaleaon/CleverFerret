package com.universalmedialibrary.ui.opds

import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.data.local.entity.OPDSCatalog
import com.universalmedialibrary.services.opds.OPDSCatalogService
import com.universalmedialibrary.services.opds.OPDSDownloadService
import com.universalmedialibrary.services.opds.OPDSEntry
import com.universalmedialibrary.services.opds.OPDSFeed
import com.universalmedialibrary.testing.MainDispatcherRule
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class OPDSCatalogBrowserViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val catalogDao: OPDSCatalogDao = mockk(relaxed = true)
    private val opdsCatalogService: OPDSCatalogService = mockk(relaxed = true)
    private val downloadService: OPDSDownloadService = mockk(relaxed = true)

    private val testCatalog = OPDSCatalog(
        id = 100L,
        name = "Standard Ebooks",
        url = "https://standardebooks.org/opds/all",
        isDefault = true
    )

    private val initialFeed = OPDSFeed(
        title = "Initial Feed",
        entries = listOf(
            OPDSEntry(id = "1", title = "The Great Gatsby")
        )
    )

    private val updatedFeed = OPDSFeed(
        title = "Updated Feed",
        entries = listOf(
            OPDSEntry(id = "1", title = "The Great Gatsby"),
            OPDSEntry(id = "2", title = "Moby Dick")
        )
    )

    @Before
    fun setUp() {
        every { catalogDao.getAllCatalogs() } returns flowOf(listOf(testCatalog))
        every { downloadService.activeDownloads } returns MutableStateFlow(emptyMap())
    }

    @Test
    fun selectCatalog_fetchesCatalogFeed() = runTest {
        coEvery { opdsCatalogService.browseCatalog(testCatalog) } returns Result.success(initialFeed)

        val viewModel = OPDSCatalogBrowserViewModel(
            catalogDao = catalogDao,
            opdsCatalogService = opdsCatalogService,
            downloadService = downloadService
        )

        viewModel.selectCatalog(testCatalog)
        advanceUntilIdle()

        assertEquals(testCatalog, viewModel.selectedCatalog.value)
        assertNotNull(viewModel.currentFeed.value)
        assertTrue(viewModel.currentFeed.value!!.isSuccess)
        assertEquals(initialFeed, viewModel.currentFeed.value!!.getOrNull())
        assertFalse(viewModel.isRefreshing.value)
    }

    @Test
    fun refreshFeed_preservesExistingFeedEntriesDuringRefresh() = runTest {
        coEvery { opdsCatalogService.browseCatalog(testCatalog) } returns Result.success(initialFeed)

        val viewModel = OPDSCatalogBrowserViewModel(
            catalogDao = catalogDao,
            opdsCatalogService = opdsCatalogService,
            downloadService = downloadService
        )

        viewModel.selectCatalog(testCatalog)
        advanceUntilIdle()

        assertEquals(initialFeed, viewModel.currentFeed.value?.getOrNull())

        coEvery { opdsCatalogService.browseCatalog(testCatalog) } returns Result.success(updatedFeed)

        viewModel.refreshFeed()

        // Before coroutines finish processing, feed should still hold initialFeed
        assertEquals(initialFeed, viewModel.currentFeed.value?.getOrNull())

        advanceUntilIdle()

        assertEquals(updatedFeed, viewModel.currentFeed.value?.getOrNull())
        assertFalse(viewModel.isRefreshing.value)
    }

    @Test
    fun navigateToUrl_preservesExistingFeedDuringBackgroundFetch() = runTest {
        coEvery { opdsCatalogService.browseCatalog(testCatalog) } returns Result.success(initialFeed)
        coEvery { opdsCatalogService.fetchUrl("https://standardebooks.org/opds/page/2") } returns updatedFeed

        val viewModel = OPDSCatalogBrowserViewModel(
            catalogDao = catalogDao,
            opdsCatalogService = opdsCatalogService,
            downloadService = downloadService
        )

        viewModel.selectCatalog(testCatalog)
        advanceUntilIdle()

        viewModel.navigateToUrl("https://standardebooks.org/opds/page/2")
        // Existing feed remains present
        assertNotNull(viewModel.currentFeed.value)

        advanceUntilIdle()

        assertEquals(updatedFeed, viewModel.currentFeed.value?.getOrNull())
    }
}
