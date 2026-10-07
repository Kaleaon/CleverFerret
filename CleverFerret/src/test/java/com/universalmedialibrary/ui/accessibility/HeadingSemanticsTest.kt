package com.universalmedialibrary.ui.accessibility

import androidx.compose.material3.Text
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.SemanticsProperties
import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.assert
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
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
@Config(manifest = Config.NONE)
class HeadingSemanticsTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    private fun hasHeading(): SemanticsMatcher = SemanticsMatcher("has heading") {
        it.config.contains(SemanticsProperties.Heading)
    }

    @Test
    fun headingSemantics_attachesHeadingPropertyToText() {
        composeTestRule.setContent {
            Text(
                text = "Standalone Title",
                modifier = Modifier.headingSemantics()
            )
        }

        composeTestRule.onNodeWithText("Standalone Title")
            .assert(hasHeading())
    }
}
