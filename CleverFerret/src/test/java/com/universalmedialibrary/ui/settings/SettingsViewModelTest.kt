package com.universalmedialibrary.ui.settings

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.GeneralSettingsDao
import com.universalmedialibrary.data.local.dao.SecuritySettingsDao
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.data.repository.ReaderSettingsRepository
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.settings.ApiSettings
import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.ui.theme.ThemePalette
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.mockk
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

@OptIn(ExperimentalCoroutinesApi::class)
class SettingsViewModelTest {

    private val testDispatcher = StandardTestDispatcher()

    @MockK
    lateinit var context: Context

    @MockK
    lateinit var settingsRepository: SettingsRepository

    @MockK
    lateinit var apiKeyRepository: APIKeyRepository

    @MockK
    lateinit var readerSettingsRepository: ReaderSettingsRepository

    @MockK
    lateinit var securitySettingsDao: SecuritySettingsDao

    @MockK
    lateinit var generalSettingsDao: GeneralSettingsDao

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
        MockKAnnotations.init(this, relaxUnitFun = true)

        every { settingsRepository.themeFlow } returns flowOf(ThemePalette.NAVY_GOLD)
        every { settingsRepository.darkModeFlow } returns flowOf(true)
        every { settingsRepository.autoDownloadPodcastsFlow } returns flowOf(false)
        every { settingsRepository.wifiOnlyDownloadsFlow } returns flowOf(true)
        every { settingsRepository.notificationsEnabledFlow } returns flowOf(true)
        every { settingsRepository.bottomGearPositionFlow } returns flowOf(BottomGearPosition.RIGHT)
        every { settingsRepository.miniPlayerBackgroundModeFlow } returns flowOf(MiniPlayerBackgroundMode.THEME)
        every { settingsRepository.bottomBarPreferencesFlow } returns flowOf(BottomBarPreferences.Default)
        every { settingsRepository.reduceMotionFlow } returns flowOf(false)
        every { settingsRepository.apiSettingsFlow } returns flowOf(ApiSettings())
        every { settingsRepository.showDebugBugButtonFlow } returns flowOf(true)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun `setAutoDownload updates repository`() = runTest {
        val viewModel = SettingsViewModel(
            context,
            settingsRepository,
            apiKeyRepository,
            readerSettingsRepository,
            securitySettingsDao,
            generalSettingsDao
        )
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.setAutoDownload(true)
        testDispatcher.scheduler.advanceUntilIdle()

        coVerify { settingsRepository.setAutoDownloadPodcasts(true) }
    }

    @Test
    fun `setWifiOnlyDownloads updates repository`() = runTest {
        val viewModel = SettingsViewModel(
            context,
            settingsRepository,
            apiKeyRepository,
            readerSettingsRepository,
            securitySettingsDao,
            generalSettingsDao
        )
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.setWifiOnlyDownloads(false)
        testDispatcher.scheduler.advanceUntilIdle()

        coVerify { settingsRepository.setWifiOnlyDownloads(false) }
    }
}
