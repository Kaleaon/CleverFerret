package com.universalmedialibrary.ui.components

import androidx.compose.material3.Text
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.semantics.SemanticsProperties
import androidx.compose.ui.semantics.getOrNull
import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.assert
import androidx.compose.ui.test.hasText
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performTextInput
import com.universalmedialibrary.ui.folderimport.UrlImportDialog
import com.universalmedialibrary.ui.podcast.AddPodcastFeedDialog
import com.universalmedialibrary.ui.settings.GeminiAPISection
import com.universalmedialibrary.ui.settings.GenericApiKeySection
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

/**
 * Test suite verifying accessible OutlinedTextField error semantics and live region behavior
 * for WCAG 2.1 SC 3.3.1 (Error Identification) and SC 4.1.3 (Status Messages) compliance.
 */
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [33])
class AccessibleOutlinedTextFieldTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun accessibleOutlinedTextField_whenErrorMessageProvided_attachesErrorSemantics() {
        val errorMessage = "Error: Invalid URL scheme"

        composeTestRule.setContent {
            AccessibleOutlinedTextField(
                value = "ftp://invalid-url",
                onValueChange = {},
                label = { Text("Media URL") },
                errorMessage = errorMessage
            )
        }

        composeTestRule.onNodeWithText(errorMessage)
            .assertExists()

        val semanticsNode = composeTestRule.onNodeWithText("ftp://invalid-url")
            .fetchSemanticsNode()

        assertEquals(
            "Error property in semantics must equal expected error string",
            errorMessage,
            semanticsNode.config[SemanticsProperties.Error]
        )
    }

    @Test
    fun accessibleOutlinedTextField_whenErrorMessageProvided_attachesPoliteLiveRegion() {
        val errorMessage = "Server URL must start with http or https"

        composeTestRule.setContent {
            AccessibleOutlinedTextField(
                value = "invalid-url",
                onValueChange = {},
                errorMessage = errorMessage
            )
        }

        val node = composeTestRule.onNodeWithText(errorMessage)
            .assertExists()
            .fetchSemanticsNode()

        assertEquals(
            "Supporting error text live region must be Polite",
            LiveRegionMode.Polite,
            node.config[SemanticsProperties.LiveRegion]
        )
    }

    @Test
    fun accessibleOutlinedTextField_whenNoErrorAndHelperTextProvided_rendersHelperTextWithoutError() {
        val helperText = "Enter direct links only (http/https)"

        composeTestRule.setContent {
            AccessibleOutlinedTextField(
                value = "https://example.com/media.mp3",
                onValueChange = {},
                helperText = helperText,
                errorMessage = null
            )
        }

        composeTestRule.onNodeWithText(helperText)
            .assertExists()

        val textNode = composeTestRule.onNodeWithText("https://example.com/media.mp3")
            .fetchSemanticsNode()

        assertEquals(
            "Node should not have Error semantics property when errorMessage is null",
            null,
            textNode.config.getOrNull(SemanticsProperties.Error)
        )
    }

    @Test
    fun urlImportDialog_whenInvalidUrlScheme_exposesErrorSemanticsAndLiveRegion() {
        composeTestRule.setContent {
            UrlImportDialog(
                url = "ftp://invalid-scheme.com",
                onUrlChange = {},
                onDismiss = {},
                onImport = {}
            )
        }

        composeTestRule.onNodeWithText("Error: Invalid URL scheme")
            .assertExists()
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.LiveRegion))
    }

    @Test
    fun addPodcastFeedDialog_whenInvalidFeedUrl_exposesErrorSemanticsAndLiveRegion() {
        composeTestRule.setContent {
            AddPodcastFeedDialog(
                onDismiss = {},
                onAdd = {}
            )
        }

        composeTestRule.onNodeWithText("https://example.com/podcast/feed.xml")
            .performTextInput("invalid-rss-url")

        composeTestRule.onNodeWithText("Error: Invalid RSS feed URL scheme (must start with http or https)")
            .assertExists()
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.LiveRegion))
    }

    @Test
    fun genericApiKeySection_whenErrorProvided_exposesErrorSemantics() {
        composeTestRule.setContent {
            GenericApiKeySection(
                title = "TMDB",
                description = "Movie metadata",
                apiKey = "",
                onSaveKey = {},
                isLoading = false,
                errorMessage = "Invalid TMDB API key format"
            )
        }

        composeTestRule.onNodeWithText("Invalid TMDB API key format")
            .assertExists()
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.LiveRegion))
    }

    @Test
    fun geminiAPISection_whenTestError_exposesErrorSemantics() {
        composeTestRule.setContent {
            GeminiAPISection(
                apiKey = "invalid_gemini_key",
                onSaveKey = {},
                onTestKey = {},
                isLoading = false,
                testResult = "API key verification failed (HTTP 401)"
            )
        }

        composeTestRule.onNodeWithText("API key verification failed (HTTP 401)")
            .assertExists()
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.LiveRegion))
    }
}
