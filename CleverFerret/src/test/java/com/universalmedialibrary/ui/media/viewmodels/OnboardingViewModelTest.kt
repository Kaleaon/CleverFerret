package com.universalmedialibrary.ui.media.viewmodels

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.repository.SettingsRepository
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.*
import org.junit.After
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class OnboardingViewModelTest {

    private val testDispatcher = StandardTestDispatcher()
    private val settingsRepository = mockk<SettingsRepository>(relaxed = true)
    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)
    private val context = mockk<Context>(relaxed = true)

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
        every { settingsRepository.hasCompletedOnboardingFlow } returns flowOf(false)
        every { mediaItemDao.getAllMediaItemsFlow() } returns flowOf(emptyList())
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
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
}
