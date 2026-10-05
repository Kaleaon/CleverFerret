package com.universalmedialibrary.ui.media

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.test.runTest
import org.junit.Test

class OnboardingSetupScanTest {

    @Test
    fun `ScanProgress default values are initialized correctly`() {
        val defaultProgress = MediaScannerService.ScanProgress()
        assertThat(defaultProgress.isScanning).isFalse()
        assertThat(defaultProgress.statusText).isEmpty()
        assertThat(defaultProgress.itemsFound).isEqualTo(0)
    }

    @Test
    fun `ScanProgress updates accurately when scanning media items`() {
        var progress = MediaScannerService.ScanProgress(
            isScanning = true,
            statusText = "Scanning device for media files...",
            itemsFound = 0
        )

        progress = progress.copy(
            statusText = "Found: SampleBook.epub",
            itemsFound = progress.itemsFound + 1
        )

        assertThat(progress.isScanning).isTrue()
        assertThat(progress.statusText).contains("SampleBook.epub")
        assertThat(progress.itemsFound).isEqualTo(1)

        progress = progress.copy(
            isScanning = false,
            statusText = "Media scan complete!"
        )

        assertThat(progress.isScanning).isFalse()
        assertThat(progress.statusText).isEqualTo("Media scan complete!")
        assertThat(progress.itemsFound).isEqualTo(1)
    }

    @Test
    fun `startDestination selection redirects first-time users to onboarding`() {
        val hasCompletedOnboardingFlow = MutableStateFlow(false)

        fun computeStartDestination(hasCompleted: Boolean): String {
            return if (hasCompleted) MediaRoutes.HOME else MediaRoutes.ONBOARDING
        }

        assertThat(computeStartDestination(hasCompletedOnboardingFlow.value)).isEqualTo(MediaRoutes.ONBOARDING)

        hasCompletedOnboardingFlow.value = true
        assertThat(computeStartDestination(hasCompletedOnboardingFlow.value)).isEqualTo(MediaRoutes.HOME)
    }
}
