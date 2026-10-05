package com.universalmedialibrary.ui.components

import androidx.compose.material3.Text
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.test.assertIsDisplayed
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import kotlinx.coroutines.CancellationException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [33])
class UiErrorBoundaryTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun normalContent_rendersSuccessfully() {
        composeTestRule.setContent {
            UiErrorBoundary(boundaryName = "TestBoundary") {
                Text("Normal Content Loaded")
            }
        }

        composeTestRule.onNodeWithText("Normal Content Loaded").assertIsDisplayed()
    }

    @Test
    fun compositionException_catchesErrorAndRendersFallback() {
        var reportIssueCalled = false
        var reportedThrowable: Throwable? = null

        composeTestRule.setContent {
            UiErrorBoundary(
                boundaryName = "TestBoundary",
                onReportIssue = {
                    reportIssueCalled = true
                    reportedThrowable = it
                }
            ) {
                throw IllegalStateException("Simulated composition error")
            }
        }

        // Fallback UI should display standardized user copy
        composeTestRule.onNodeWithText("Something Went Wrong").assertIsDisplayed()
        composeTestRule.onNodeWithText("We encountered an issue while displaying this section. Please try reloading the section or returning home.").assertIsDisplayed()

        // Technical details should NOT be present on screen
        composeTestRule.onNodeWithText("Boundary: TestBoundary").assertDoesNotExist()
        composeTestRule.onNodeWithText("Simulated composition error").assertDoesNotExist()

        // Issue report callback triggered
        assertTrue(reportIssueCalled)
        assertEquals("Simulated composition error", reportedThrowable?.message)
    }

    @Test
    fun reloadSection_resetsErrorAndRetriesComposition() {
        var shouldThrow by mutableStateOf(true)
        var reloadClicked = false

        composeTestRule.setContent {
            UiErrorBoundary(
                boundaryName = "TestBoundary",
                onReloadSection = { reloadClicked = true }
            ) {
                if (shouldThrow) {
                    throw RuntimeException("Temporary failure")
                } else {
                    Text("Recovered Content")
                }
            }
        }

        // Initially fallback is shown
        composeTestRule.onNodeWithText("Something Went Wrong").assertIsDisplayed()

        // Fix underlying condition before reload
        shouldThrow = false

        // Click "Reload Section"
        composeTestRule.onNodeWithText("Reload Section").performClick()

        // Verify onReloadSection was invoked and recovered content is displayed
        assertTrue(reloadClicked)
        composeTestRule.onNodeWithText("Recovered Content").assertIsDisplayed()
    }

    @Test
    fun goHome_triggersCallback() {
        var goHomeCalled = false

        composeTestRule.setContent {
            UiErrorBoundary(
                boundaryName = "TestBoundary",
                onGoHome = { goHomeCalled = true }
            ) {
                throw RuntimeException("Failure")
            }
        }

        composeTestRule.onNodeWithText("Go Home").performClick()
        assertTrue(goHomeCalled)
    }

    @Test
    fun cancellationException_isRethrown() {
        try {
            composeTestRule.setContent {
                UiErrorBoundary(boundaryName = "TestBoundary") {
                    throw CancellationException("Job cancelled")
                }
            }
            fail("Expected CancellationException to be rethrown")
        } catch (e: CancellationException) {
            assertEquals("Job cancelled", e.message)
        }
    }
}
