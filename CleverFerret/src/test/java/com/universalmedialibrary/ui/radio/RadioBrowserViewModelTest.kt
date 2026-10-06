package com.universalmedialibrary.ui.radio

import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.services.radio.RadioBrowserService
import com.universalmedialibrary.services.radio.RadioLogoService
import com.universalmedialibrary.testing.MainDispatcherRule
import com.universalmedialibrary.utils.UserFriendlyErrorMapper
import io.mockk.coEvery
import io.mockk.mockk
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test
import java.net.UnknownHostException

@OptIn(ExperimentalCoroutinesApi::class)
class RadioBrowserViewModelTest {

    @get:Rule
    val mainDispatcherRule = MainDispatcherRule()

    private val radioBrowserService: RadioBrowserService = mockk(relaxed = true)
    private val radioStationDao: RadioStationDao = mockk(relaxed = true)
    private val radioLogoService: RadioLogoService = mockk(relaxed = true)
    private val errorMapper = UserFriendlyErrorMapper()

    @Test
    fun loadTopStations_onNetworkError_setsUserFriendlyErrorMessage() = runTest {
        coEvery { radioBrowserService.fetchTopStations(any()) } throws UnknownHostException("radio-browser.info down")

        val viewModel = RadioBrowserViewModel(
            radioBrowserService = radioBrowserService,
            radioStationDao = radioStationDao,
            radioLogoService = radioLogoService,
            errorMapper = errorMapper
        )

        viewModel.loadTopStations()
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals("Unable to connect to the network. Please check your internet connection.", state.error)
    }

    @Test
    fun searchStations_onGenericError_setsUserFriendlyErrorMessage() = runTest {
        coEvery { radioBrowserService.searchStations(any()) } throws RuntimeException("Internal 500")

        val viewModel = RadioBrowserViewModel(
            radioBrowserService = radioBrowserService,
            radioStationDao = radioStationDao,
            radioLogoService = radioLogoService,
            errorMapper = errorMapper
        )

        viewModel.searchStations("jazz")
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertEquals(UserFriendlyErrorMapper.FALLBACK_ERROR_MESSAGE, state.error)
    }
}
