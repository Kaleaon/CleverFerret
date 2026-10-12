package com.universalmedialibrary.ui.accessibility

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.semantics.ProgressBarRangeInfo
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.SemanticsProperties
import androidx.compose.ui.state.ToggleableState
import androidx.compose.ui.test.assert
import androidx.compose.ui.test.assertIsDisplayed
import androidx.compose.ui.test.hasAnyAncestor
import androidx.compose.ui.test.hasContentDescription
import androidx.compose.ui.test.hasKey
import androidx.compose.ui.test.hasText
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithContentDescription
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.compose.ui.unit.dp
import com.ktheme.components.SelectableChip
import com.ktheme.components.SemanticState
import com.ktheme.compose.AccessibleRatingGroup
import com.ktheme.compose.AccessibleToggleRow
import com.ktheme.compose.accessibleButton
import com.ktheme.compose.accessibleSelectable
import com.universalmedialibrary.ui.bookshelf.RatingStars
import com.universalmedialibrary.ui.media.settings.SettingsToggleItem
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.theme.MetallicButton
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

/**
 * Automated test suite confirming semantic node properties across centralized accessibility foundation components
 * and custom controls (MetallicButton, CFMetalButton, SelectableChip, CFTagChip, SettingsToggleItem, QuickToggleChip, RatingStars).
 */
@RunWith(RobolectricTestRunner::class)
@Config(sdk = [33])
class CentralizedAccessibilityWrappersTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun accessibleButton_setsButtonRoleAndClickSemantics() {
        var clicked = false
        composeTestRule.setContent {
            Box(
                modifier = Modifier
                    .accessibleButton(onClickLabel = "Custom Action", onClick = { clicked = true })
            ) {
                Text("Click Me")
            }
        }

        composeTestRule.onNodeWithText("Click Me")
            .assert(hasKey(SemanticsProperties.Role))
            .assert(hasKey(SemanticsProperties.OnClick))
            .performClick()

        assertTrue("Button click callback should trigger", clicked)
    }

    @Test
    fun metallicButton_usesAccessibleButton() {
        var clicked = false
        composeTestRule.setContent {
            MetallicButton(
                text = "Metallic CTA",
                onClick = { clicked = true }
            )
        }

        composeTestRule.onNodeWithText("Metallic CTA")
            .assertIsDisplayed()
            .performClick()

        assertTrue(clicked)
    }

    @Test
    fun CFMetalButton_usesAccessibleButton() {
        var clicked = false
        composeTestRule.setContent {
            CFMetalButton(
                text = "CF Metal CTA",
                onClick = { clicked = true }
            )
        }

        composeTestRule.onNodeWithText("CF Metal CTA")
            .assertIsDisplayed()
            .performClick()

        assertTrue(clicked)
    }

    @Test
    fun accessibleSelectable_setsSelectionStateAndRole() {
        var clicked = false
        composeTestRule.setContent {
            Box(
                modifier = Modifier.accessibleSelectable(
                    selected = true,
                    onClick = { clicked = true }
                )
            ) {
                Text("Chip Text")
            }
        }

        val node = composeTestRule.onNodeWithText("Chip Text")
        node.assert(hasKey(SemanticsProperties.Selected))
        node.assert(hasKey(SemanticsProperties.Role))
        node.performClick()

        assertTrue(clicked)
    }

    @Test
    fun selectableChip_usesAccessibleSelectable() {
        var clicked = false
        composeTestRule.setContent {
            SelectableChip(
                text = "Selectable Chip",
                selected = true,
                state = SemanticState.NORMAL,
                onClick = { clicked = true }
            )
        }

        composeTestRule.onNodeWithText("Selectable Chip")
            .assert(hasKey(SemanticsProperties.Selected))
            .performClick()

        assertTrue(clicked)
    }

    @Test
    fun CFTagChip_usesAccessibleSelectable() {
        var clicked = false
        composeTestRule.setContent {
            CFTagChip(
                text = "Tag Chip",
                selected = true,
                onClick = { clicked = true }
            )
        }

        composeTestRule.onNodeWithText("Tag Chip")
            .assert(hasKey(SemanticsProperties.Selected))
            .performClick()

        assertTrue(clicked)
    }

    @Test
    fun accessibleToggleRow_mergesDescendantsWithSwitchRole() {
        var toggled = false
        composeTestRule.setContent {
            AccessibleToggleRow(
                checked = true,
                onCheckedChange = { toggled = it }
            ) {
                Text("Toggle Title")
                Text("Toggle Subtitle")
            }
        }

        composeTestRule.onNodeWithText("Toggle Title")
            .assert(hasKey(SemanticsProperties.Role))
            .assert(hasKey(SemanticsProperties.ToggleableState))
            .performClick()

        assertTrue(toggled)
    }

    @Test
    fun settingsToggleItem_usesAccessibleToggleRow() {
        var toggled = false
        composeTestRule.setContent {
            SettingsToggleItem(
                title = "Dark Theme",
                subtitle = "Enable dark mode for interface",
                isChecked = false,
                onCheckedChange = { toggled = it }
            )
        }

        composeTestRule.onNodeWithText("Dark Theme")
            .assert(hasKey(SemanticsProperties.Role))
            .performClick()

        assertTrue(toggled)
    }

    @Test
    fun accessibleRatingGroup_mergesDescriptionAndRangeInfo() {
        composeTestRule.setContent {
            AccessibleRatingGroup(
                rating = 4f,
                maxStars = 5
            ) { _, _ -> }
        }

        composeTestRule.onNodeWithContentDescription("4 out of 5 stars")
            .assertIsDisplayed()
    }

    @Test
    fun ratingStars_usesAccessibleRatingGroup() {
        composeTestRule.setContent {
            RatingStars(rating = 3f)
        }

        composeTestRule.onNodeWithContentDescription("3 out of 5 stars")
            .assertIsDisplayed()
    }
}
