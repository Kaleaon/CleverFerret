package com.universalmedialibrary.ui.media.screens

import androidx.activity.compose.LocalActivityResultRegistryOwner
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.ActivityResultRegistry
import androidx.activity.result.ActivityResultRegistryOwner
import androidx.activity.result.contract.ActivityResultContract
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithContentDescription
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.core.app.ActivityOptionsCompat
import com.google.common.truth.Truth.assertThat
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, sdk = [33])
class PodcastTopBarTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    private class RecordingActivityResultRegistry : ActivityResultRegistry() {
        var launchedContract: ActivityResultContract<*, *>? = null
        var launchedInput: Any? = null

        override fun <I, O> onLaunch(
            requestCode: Int,
            contract: ActivityResultContract<I, O>,
            input: I,
            options: ActivityOptionsCompat?
        ) {
            launchedContract = contract
            launchedInput = input
        }
    }

    @Test
    fun clickingImportOpmlMenuItem_launchesGetContentActivityResultContract() {
        val recordingRegistry = RecordingActivityResultRegistry()
        val registryOwner = object : ActivityResultRegistryOwner {
            override val activityResultRegistry: ActivityResultRegistry = recordingRegistry
        }

        composeTestRule.setContent {
            CompositionLocalProvider(LocalActivityResultRegistryOwner provides registryOwner) {
                val importLauncher = rememberLauncherForActivityResult(
                    contract = ActivityResultContracts.GetContent()
                ) { /* no-op */ }

                PodcastTopBar(
                    onBackClick = {},
                    onSearchClick = {},
                    onDiscoverClick = {},
                    onImportClick = { importLauncher.launch("*/*") },
                    onExportClick = {}
                )
            }
        }

        composeTestRule.onNodeWithContentDescription("OPML Menu").performClick()
        composeTestRule.onNodeWithText("Import OPML").performClick()

        assertThat(recordingRegistry.launchedContract)
            .isInstanceOf(ActivityResultContracts.GetContent::class.java)
        assertThat(recordingRegistry.launchedInput).isEqualTo("*/*")
    }

    @Test
    fun clickingExportOpmlMenuItem_invokesExportOpmlCallback() {
        var exportClicked = false

        composeTestRule.setContent {
            PodcastTopBar(
                onBackClick = {},
                onSearchClick = {},
                onDiscoverClick = {},
                onImportClick = {},
                onExportClick = { exportClicked = true }
            )
        }

        composeTestRule.onNodeWithContentDescription("OPML Menu").performClick()
        composeTestRule.onNodeWithText("Export OPML").performClick()

        assertThat(exportClicked).isTrue()
    }

    @Test
    fun clickingTopBarIcons_invokesNavigationCallbacks() {
        var backClicked = false
        var searchClicked = false
        var discoverClicked = false

        composeTestRule.setContent {
            PodcastTopBar(
                onBackClick = { backClicked = true },
                onSearchClick = { searchClicked = true },
                onDiscoverClick = { discoverClicked = true },
                onImportClick = {},
                onExportClick = {}
            )
        }

        composeTestRule.onNodeWithContentDescription("Back").performClick()
        assertThat(backClicked).isTrue()

        composeTestRule.onNodeWithContentDescription("Search").performClick()
        assertThat(searchClicked).isTrue()

        composeTestRule.onNodeWithContentDescription("Discover").performClick()
        assertThat(discoverClicked).isTrue()
    }
}
