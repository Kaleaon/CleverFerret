package com.universalmedialibrary.ui.sync

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.services.sync.CloudSyncEngine
import com.universalmedialibrary.services.sync.SyncOptions
import com.universalmedialibrary.services.sync.SyncResult
import com.universalmedialibrary.services.sync.SyncState
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
import java.io.IOException

@OptIn(ExperimentalCoroutinesApi::class)
class SyncViewModelTest {

    private val testDispatcher = StandardTestDispatcher()

    @MockK
    lateinit var cloudSyncEngine: CloudSyncEngine

    @MockK
    lateinit var context: Context

    private val syncStateFlow = MutableStateFlow(SyncState())
    private val conflictsFlow = MutableStateFlow(emptyList<com.universalmedialibrary.services.sync.SyncConflict>())

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
        MockKAnnotations.init(this, relaxUnitFun = true)

        every { cloudSyncEngine.syncState } returns syncStateFlow
        every { cloudSyncEngine.conflicts } returns conflictsFlow
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun testClassifySyncErrorAuthKeywords() {
        val authMessages = listOf(
            "HTTP 401 Unauthorized",
            "403 Forbidden: Access denied",
            "Authentication token has expired",
            "Invalid credentials provided",
            "Please login again to renew access",
            "User unauthorized"
        )

        for (msg in authMessages) {
            assertThat(classifySyncError(msg)).isEqualTo(SyncErrorType.AUTH_EXPIRED)
            assertThat(classifySyncError(Exception(msg))).isEqualTo(SyncErrorType.AUTH_EXPIRED)
        }
    }

    @Test
    fun testClassifySyncErrorNetworkKeywords() {
        val networkMessages = listOf(
            "Device is currently offline",
            "Failed to connect to server",
            "Connection timed out",
            "Network host unreachable",
            "No internet connection available",
            "java.net.UnknownHostException: Unable to resolve host",
            "Socket closed unexpectedly"
        )

        for (msg in networkMessages) {
            assertThat(classifySyncError(msg)).isEqualTo(SyncErrorType.NETWORK_OFFLINE)
            assertThat(classifySyncError(IOException(msg))).isEqualTo(SyncErrorType.NETWORK_OFFLINE)
        }
    }

    @Test
    fun testClassifySyncErrorServerKeywords() {
        val serverMessages = listOf(
            "500 Internal Server Error",
            "502 Bad Gateway",
            "503 Service Unavailable",
            "504 Gateway Timeout",
            "Remote server error encountered"
        )

        for (msg in serverMessages) {
            assertThat(classifySyncError(msg)).isEqualTo(SyncErrorType.SERVER_ERROR)
            assertThat(classifySyncError(Exception(msg))).isEqualTo(SyncErrorType.SERVER_ERROR)
        }
    }

    @Test
    fun testClassifySyncErrorUnknownAndNull() {
        assertThat(classifySyncError(null as String?)).isEqualTo(SyncErrorType.UNKNOWN)
        assertThat(classifySyncError(null as Throwable?)).isEqualTo(SyncErrorType.UNKNOWN)
        assertThat(classifySyncError("")).isEqualTo(SyncErrorType.UNKNOWN)
        assertThat(classifySyncError("   ")).isEqualTo(SyncErrorType.UNKNOWN)
        assertThat(classifySyncError("Corrupted sqlite database table")).isEqualTo(SyncErrorType.UNKNOWN)
    }

    @Test
    fun testDiagnosticTipProvidesActionableGuidance() {
        val authTip = getSyncErrorDiagnosticTip(SyncErrorType.AUTH_EXPIRED)
        assertThat(authTip).contains("re-authenticate")

        val networkTip = getSyncErrorDiagnosticTip(SyncErrorType.NETWORK_OFFLINE)
        assertThat(networkTip).contains("internet connection")

        val serverTip = getSyncErrorDiagnosticTip(SyncErrorType.SERVER_ERROR)
        assertThat(serverTip).contains("server")

        val unknownTip = getSyncErrorDiagnosticTip(SyncErrorType.UNKNOWN, "File not found")
        assertThat(unknownTip).contains("File not found")
    }

    @Test
    fun testStartSyncResultFailureClassifiesError() = runTest {
        coEvery { cloudSyncEngine.sync(any()) } returns SyncResult(
            success = false,
            error = "HTTP 401 Unauthorized token expired"
        )

        val viewModel = SyncViewModel(cloudSyncEngine, context)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.startSync()
        testDispatcher.scheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.isSyncing).isFalse()
        assertThat(state.error).isEqualTo("HTTP 401 Unauthorized token expired")
        assertThat(state.errorType).isEqualTo(SyncErrorType.AUTH_EXPIRED)
        assertThat(state.showSyncComplete).isFalse()
    }

    @Test
    fun testStartSyncExceptionClassifiesError() = runTest {
        coEvery { cloudSyncEngine.sync(any()) } throws IOException("Connection timed out to sync host")

        val viewModel = SyncViewModel(cloudSyncEngine, context)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.startSync()
        testDispatcher.scheduler.advanceUntilIdle()

        val state = viewModel.uiState.value
        assertThat(state.isSyncing).isFalse()
        assertThat(state.error).contains("Connection timed out")
        assertThat(state.errorType).isEqualTo(SyncErrorType.NETWORK_OFFLINE)
    }

    @Test
    fun testClearErrorResetsErrorAndType() = runTest {
        coEvery { cloudSyncEngine.sync(any()) } returns SyncResult(
            success = false,
            error = "500 Internal Server Error"
        )

        val viewModel = SyncViewModel(cloudSyncEngine, context)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.startSync()
        testDispatcher.scheduler.advanceUntilIdle()
        assertThat(viewModel.uiState.value.error).isNotNull()
        assertThat(viewModel.uiState.value.errorType).isEqualTo(SyncErrorType.SERVER_ERROR)

        viewModel.clearError()
        val cleared = viewModel.uiState.value
        assertThat(cleared.error).isNull()
        assertThat(cleared.errorType).isNull()
    }

    @Test
    fun testRetrySyncTriggersSync() = runTest {
        coEvery { cloudSyncEngine.sync(any()) } returns SyncResult(success = true, itemsSynced = 5)

        val viewModel = SyncViewModel(cloudSyncEngine, context)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.retrySync()
        testDispatcher.scheduler.advanceUntilIdle()

        coVerify(exactly = 1) { cloudSyncEngine.sync(any()) }
        assertThat(viewModel.uiState.value.showSyncComplete).isTrue()
        assertThat(viewModel.uiState.value.error).isNull()
    }
}
