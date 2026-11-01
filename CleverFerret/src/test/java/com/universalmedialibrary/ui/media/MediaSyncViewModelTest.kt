package com.universalmedialibrary.ui.media

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.services.plex.PlexSyncService
import com.universalmedialibrary.services.plex.PlexSyncStatus
import com.universalmedialibrary.ui.sync.SyncErrorType
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class MediaSyncViewModelTest {

    private val testDispatcher = StandardTestDispatcher()

    @MockK
    lateinit var plexSyncService: PlexSyncService

    private val syncStatusFlow = MutableStateFlow<PlexSyncStatus>(PlexSyncStatus.Idle)
    private val serversFlow = MutableStateFlow<List<com.universalmedialibrary.data.local.entity.PlexServer>>(emptyList())

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
        MockKAnnotations.init(this, relaxUnitFun = true)

        every { plexSyncService.syncStatus } returns syncStatusFlow
        every { plexSyncService.getAllServers() } returns serversFlow
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun testInitialUiStateHasNoError() = runTest {
        val viewModel = MediaSyncViewModel(plexSyncService)
        testDispatcher.scheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.isLoading).isFalse()
        assertThat(state.errorMessage).isNull()
        assertThat(state.errorType).isNull()
    }

    @Test
    fun testPlexSyncStatusErrorSetsClassifiedErrorType() = runTest {
        val viewModel = MediaSyncViewModel(plexSyncService)
        testDispatcher.scheduler.advanceUntilIdle()

        syncStatusFlow.value = PlexSyncStatus.Error("401 Unauthorized: token expired")
        testDispatcher.scheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.errorMessage).isEqualTo("401 Unauthorized: token expired")
        assertThat(state.errorType).isEqualTo(SyncErrorType.AUTH_EXPIRED)

        syncStatusFlow.value = PlexSyncStatus.Error("Connection timeout to plex host")
        testDispatcher.scheduler.advanceUntilIdle()

        val networkState = viewModel.uiState.value
        assertThat(networkState.errorType).isEqualTo(SyncErrorType.NETWORK_OFFLINE)
    }

    @Test
    fun testClearMessagesResetsErrorAndType() = runTest {
        val viewModel = MediaSyncViewModel(plexSyncService)
        testDispatcher.scheduler.advanceUntilIdle()

        syncStatusFlow.value = PlexSyncStatus.Error("500 Server error")
        testDispatcher.scheduler.advanceUntilIdle()
        assertThat(viewModel.uiState.value.errorType).isEqualTo(SyncErrorType.SERVER_ERROR)

        viewModel.clearMessages()
        val cleared = viewModel.uiState.value
        assertThat(cleared.errorMessage).isNull()
        assertThat(cleared.errorType).isNull()
    }

    @Test
    fun testRetrySyncTriggersSyncAllServers() = runTest {
        coEvery { plexSyncService.syncAllServers() } returns Result.success(Unit)

        val viewModel = MediaSyncViewModel(plexSyncService)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.retrySync()
        testDispatcher.scheduler.advanceUntilIdle()

        coVerify(exactly = 1) { plexSyncService.syncAllServers() }
    }
}
