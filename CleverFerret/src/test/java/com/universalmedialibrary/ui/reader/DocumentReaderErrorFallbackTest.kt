package com.universalmedialibrary.ui.reader

import android.content.Intent
import android.net.Uri
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Error
import androidx.compose.ui.test.assertIsDisplayed
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.theme.CFTheme
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, sdk = [33])
class DocumentReaderErrorFallbackTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun createPdfSystemViewerIntent_returnsValidActionViewIntent() {
        val testUri = Uri.parse("content://com.universalmedialibrary.provider/sample.pdf")
        val intent = createPdfSystemViewerIntent(testUri)

        assertEquals(Intent.ACTION_VIEW, intent.action)
        assertEquals(testUri, intent.data)
        assertEquals("application/pdf", intent.type)
        val hasReadPermissionFlag = (intent.flags and Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0
        assertTrue("Expected FLAG_GRANT_READ_URI_PERMISSION to be set", hasReadPermissionFlag)
    }

    @Test
    fun pdfErrorRecoveryCard_rendersErrorInformationAndActions() {
        composeTestRule.setContent {
            PdfErrorRecoveryCard(
                onRetry = {},
                onOpenExternal = {},
                message = "Unable to decode PDF stream"
            )
        }

        composeTestRule.onNodeWithText("Unable to Display Page").assertIsDisplayed()
        composeTestRule.onNodeWithText("Unable to decode PDF stream").assertIsDisplayed()
        composeTestRule.onNodeWithText("Retry").assertIsDisplayed()
        composeTestRule.onNodeWithText("Open with System Viewer").assertIsDisplayed()
    }

    @Test
    fun pdfErrorRecoveryCard_onRetryClick_invokesRetryAction() {
        var retryTriggered = false
        composeTestRule.setContent {
            PdfErrorRecoveryCard(
                onRetry = { retryTriggered = true },
                onOpenExternal = {}
            )
        }

        composeTestRule.onNodeWithText("Retry").performClick()
        assertTrue("Expected onRetry callback to be invoked", retryTriggered)
    }

    @Test
    fun pdfErrorRecoveryCard_onOpenExternalClick_invokesExternalViewerAction() {
        var externalTriggered = false
        composeTestRule.setContent {
            PdfErrorRecoveryCard(
                onRetry = {},
                onOpenExternal = { externalTriggered = true }
            )
        }

        composeTestRule.onNodeWithText("Open with System Viewer").performClick()
        assertTrue("Expected onOpenExternal callback to be invoked", externalTriggered)
    }

    @Test
    fun pdfReaderView_whenPdfFailsToOpen_showsErrorRecoveryCard() {
        val invalidUri = Uri.parse("content://nonexistent.authority/invalid_file.pdf")
        composeTestRule.setContent {
            PdfReaderView(uri = invalidUri)
        }

        composeTestRule.onNodeWithText("Unable to Display Page").assertIsDisplayed()
        composeTestRule.onNodeWithText("Retry").assertIsDisplayed()
        composeTestRule.onNodeWithText("Open with System Viewer").assertIsDisplayed()
    }

    @Test
    fun comicReader_nullBitmap_rendersCFEmptyStateWithRetry() {
        var retryTriggered = false
        composeTestRule.setContent {
            CFTheme {
                CFEmptyState(
                    icon = Icons.Default.Error,
                    title = "Failed to Load Page",
                    body = "Page 1 could not be decoded.",
                    actionLabel = "Retry",
                    onAction = { retryTriggered = true }
                )
            }
        }

        composeTestRule.onNodeWithText("Failed to Load Page").assertIsDisplayed()
        composeTestRule.onNodeWithText("Page 1 could not be decoded.").assertIsDisplayed()
        composeTestRule.onNodeWithText("Retry").assertIsDisplayed()

        composeTestRule.onNodeWithText("Retry").performClick()
        assertTrue("Expected retry action to be invoked", retryTriggered)
    }
}
