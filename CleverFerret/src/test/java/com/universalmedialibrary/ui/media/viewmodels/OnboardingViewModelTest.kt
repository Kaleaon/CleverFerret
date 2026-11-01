package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.utils.PermissionsHandler
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import io.mockk.mockkObject
import io.mockk.mockkStatic
import io.mockk.unmockkAll
import io.mockk.verify
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@OptIn(ExperimentalCoroutinesApi::class)
@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, sdk = [33])
class OnboardingViewModelTest {

    private val testDispatcher = StandardTestDispatcher()
    private val settingsRepository = mockk<SettingsRepository>(relaxed = true)
    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private lateinit var context: Context

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        Dispatchers.setMain(testDispatcher)
        every { settingsRepository.hasCompletedOnboardingFlow } returns flowOf(false)
        every { settingsRepository.onboardingCompletedFlow } returns flowOf(false)
        every { mediaItemDao.getAllMediaItemsFlow() } returns flowOf(emptyList())
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
        unmockkAll()
    }

    @Test
    fun initialOnboardingState_isNotCompleted() = runTest {
        val viewModel = OnboardingViewModel(settingsRepository, mediaItemDao, context)
        testScheduler.advanceUntilIdle()

        assertThat(viewModel.isOnboardingCompleted.value).isFalse()
        assertThat(viewModel.totalMediaItemsCount.value).isEqualTo(0)
    }

    @Test
    fun completeOnboarding_setsSettingsAndInvokesCallback() = runTest {
        coEvery { settingsRepository.setHasCompletedOnboarding(true) } returns Unit

        val viewModel = OnboardingViewModel(settingsRepository, mediaItemDao, context)
        var callbackCalled = false

        viewModel.completeOnboarding {
            callbackCalled = true
        }
        testScheduler.advanceUntilIdle()

        coVerify(exactly = 1) { settingsRepository.setHasCompletedOnboarding(true) }
        assertThat(callbackCalled).isTrue()
    }

    @Test
    fun completeOnboarding_withStoragePermissions_dispatchesScanAndCompletes() = runTest {
        mockkObject(PermissionsHandler)
        mockkStatic(ContextCompat::class)
        every { PermissionsHandler.hasStoragePermissions(any()) } returns true
        every { ContextCompat.startForegroundService(any(), any()) } returns Unit
        coEvery { settingsRepository.setHasCompletedOnboarding(true) } returns Unit

        val viewModel = OnboardingViewModel(settingsRepository, mediaItemDao, context)
        var callbackCalled = false

        viewModel.completeOnboarding {
            callbackCalled = true
        }
        testScheduler.advanceUntilIdle()

        verify {
            ContextCompat.startForegroundService(
                context,
                match<Intent> { it.action == MediaScannerService.ACTION_SCAN_ALL }
            )
        }
        assertThat(viewModel.isScanDispatched.value).isTrue()
        coVerify(exactly = 1) { settingsRepository.setHasCompletedOnboarding(true) }
        assertThat(callbackCalled).isTrue()
    }

    @Test
    fun completeOnboarding_withoutStoragePermissions_doesNotDispatchScanAndCompletes() = runTest {
        mockkObject(PermissionsHandler)
        mockkStatic(ContextCompat::class)
        every { PermissionsHandler.hasStoragePermissions(any()) } returns false
        coEvery { settingsRepository.setHasCompletedOnboarding(true) } returns Unit

        val viewModel = OnboardingViewModel(settingsRepository, mediaItemDao, context)
        var callbackCalled = false

        viewModel.completeOnboarding {
            callbackCalled = true
        }
        testScheduler.advanceUntilIdle()

        verify(exactly = 0) { ContextCompat.startForegroundService(any(), any()) }
        assertThat(viewModel.isScanDispatched.value).isFalse()
        coVerify(exactly = 1) { settingsRepository.setHasCompletedOnboarding(true) }
        assertThat(callbackCalled).isTrue()
    }

    @Test
    fun triggerInitialScan_withStoragePermissions_dispatchesScanServiceIntent() = runTest {
        mockkObject(PermissionsHandler)
        mockkStatic(ContextCompat::class)
        every { PermissionsHandler.hasStoragePermissions(any()) } returns true
        every { ContextCompat.startForegroundService(any(), any()) } returns Unit

        val viewModel = OnboardingViewModel(settingsRepository, mediaItemDao, context)

        viewModel.triggerInitialScan()
        testScheduler.advanceUntilIdle()

        verify {
            ContextCompat.startForegroundService(
                context,
                match<Intent> { it.action == MediaScannerService.ACTION_SCAN_ALL }
            )
        }
        assertThat(viewModel.isScanDispatched.value).isTrue()
    }

    @Test
    fun triggerInitialScan_withoutStoragePermissions_doesNotDispatchScanServiceIntent() = runTest {
        mockkObject(PermissionsHandler)
        mockkStatic(ContextCompat::class)
        every { PermissionsHandler.hasStoragePermissions(any()) } returns false

        val viewModel = OnboardingViewModel(settingsRepository, mediaItemDao, context)

        viewModel.triggerInitialScan()
        testScheduler.advanceUntilIdle()

        verify(exactly = 0) { ContextCompat.startForegroundService(any(), any()) }
        assertThat(viewModel.isScanDispatched.value).isFalse()
    }
}
