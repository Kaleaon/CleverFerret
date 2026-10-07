package com.universalmedialibrary.ui.accessibility

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Info
import androidx.compose.material3.Text
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.SemanticsProperties
import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.assert
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

/**
 * Compose UI accessibility test suite verifying that screen scaffolds,
 * section titles, and design system components include heading semantics nodes.
 */
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [33])
class HeadingSemanticsTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun headingSemantics_attachesHeadingPropertyToText() {
        composeTestRule.setContent {
            Text(
                text = "Standalone Title",
                modifier = Modifier.headingSemantics()
            )
        }

        composeTestRule.onNodeWithText("Standalone Title")
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.Heading))
    }

    @Test
    fun CFTopBar_includesHeadingSemanticsOnTitleNode() {
        composeTestRule.setContent {
            CFTopBar(title = "App Top Bar Header")
        }

        composeTestRule.onNodeWithText("App Top Bar Header")
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.Heading))
    }

    @Test
    fun CFSectionHeader_includesHeadingSemanticsOnTitleOnly() {
        composeTestRule.setContent {
            CFSectionHeader(
                title = "Main Section Title",
                subtitle = "Decorative Subtitle Caption"
            )
        }

        // Title should have heading semantics
        composeTestRule.onNodeWithText("Main Section Title")
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.Heading))

        // Subtitle should NOT have heading semantics so screen reader navigation skips it
        composeTestRule.onNodeWithText("Decorative Subtitle Caption")
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.Heading).not())
    }

    @Test
    fun CFEmptyState_includesHeadingSemanticsOnTitleOnly() {
        composeTestRule.setContent {
            CFEmptyState(
                icon = Icons.Default.Info,
                title = "Empty Section Title",
                body = "Body description explanation"
            )
        }

        // Empty state title should have heading semantics
        composeTestRule.onNodeWithText("Empty Section Title")
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.Heading))

        // Body message should NOT have heading semantics
        composeTestRule.onNodeWithText("Body description explanation")
            .assert(SemanticsMatcher.keyIsDefined(SemanticsProperties.Heading).not())
    }
}
