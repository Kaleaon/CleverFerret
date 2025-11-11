package com.universalmedialibrary.services

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.data.settings.ParentalControlsState
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class DownloadSafetyCheckerTest {

    @MockK(relaxed = true)
    lateinit var parentalControlsSettings: ParentalControlsSettings

    private lateinit var checker: DownloadSafetyChecker
    private val enabledState = ParentalControlsState(enabled = true)

    @Before
    fun setUp() {
        MockKAnnotations.init(this)
        checker = DownloadSafetyChecker(parentalControlsSettings)
        coEvery { parentalControlsSettings.currentState() } returns enabledState
    }

    @Test
    fun `checkDownload returns Blocked when content should be hidden`() = runTest {
        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Explicit",
                mediaType = "MOVIE",
                tags = any()
            )
        } returns true

        val result = checker.checkDownload(
            DownloadContentMetadata(
                rating = "Explicit",
                mediaType = "MOVIE"
            )
        )

        assertThat(result).isInstanceOf(DownloadSafetyResult.Blocked::class.java)
    }

    @Test
    fun `checkDownload returns Blocked when content is not allowed`() = runTest {
        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Mature",
                mediaType = "BOOK",
                tags = any()
            )
        } returns false
        every {
            parentalControlsSettings.isContentAllowed(
                enabledState,
                rating = "Mature",
                mediaType = "BOOK",
                tags = any()
            )
        } returns false

        val result = checker.checkDownload(
            DownloadContentMetadata(
                rating = "Mature",
                mediaType = "BOOK"
            )
        )

        assertThat(result).isInstanceOf(DownloadSafetyResult.Blocked::class.java)
    }

    @Test
    fun `checkDownload returns RequiresPin when PIN is required`() = runTest {
        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Explicit",
                mediaType = "STORY",
                tags = any()
            )
        } returns false
        every {
            parentalControlsSettings.isContentAllowed(
                enabledState,
                rating = "Explicit",
                mediaType = "STORY",
                tags = any()
            )
        } returns true
        every {
            parentalControlsSettings.requiresPinForAccess(
                enabledState,
                rating = "Explicit",
                mediaType = "STORY",
                tags = any()
            )
        } returns true

        val result = checker.checkDownload(
            DownloadContentMetadata(
                rating = "Explicit",
                title = "Locked Story",
                mediaType = "STORY"
            )
        )

        assertThat(result).isInstanceOf(DownloadSafetyResult.RequiresPin::class.java)
    }

    @Test
    fun `checkDownload returns Allowed when no restrictions apply`() = runTest {
        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Teen",
                mediaType = "GAME",
                tags = any()
            )
        } returns false
        every {
            parentalControlsSettings.isContentAllowed(
                enabledState,
                rating = "Teen",
                mediaType = "GAME",
                tags = any()
            )
        } returns true
        every {
            parentalControlsSettings.requiresPinForAccess(
                enabledState,
                rating = "Teen",
                mediaType = "GAME",
                tags = any()
            )
        } returns false

        val result = checker.checkDownload(
            DownloadContentMetadata(
                rating = "Teen",
                mediaType = "GAME"
            )
        )

        assertThat(result).isEqualTo(DownloadSafetyResult.Allowed)
    }

    @Test
    fun `verifyPinForDownload delegates to parental controls`() = runTest {
        coEvery { parentalControlsSettings.verifyPin("1234") } returns true

        val verified = checker.verifyPinForDownload("1234")

        assertThat(verified).isTrue()
    }
}
