package com.universalmedialibrary.ui.media.screens

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.requiredWidth
import androidx.compose.ui.Modifier
import androidx.compose.ui.test.assertDoesNotExist
import androidx.compose.ui.test.assertIsDisplayed
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.theme.MediaTheme
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test

class StickyContentLibraryHeaderTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun stickyHeader_showsExpectedTopBarElements_withoutLegacyBranding() {
        composeTestRule.setContent {
            MediaTheme {
                StickyContentLibraryHeader(
                    onSearchClick = {},
                    onNotificationClick = {}
                )
            }
        }

        composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_TAG).assertIsDisplayed()
        composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_NAV_TAG).assertIsDisplayed()
        composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_SEARCH_TAG).assertIsDisplayed()
        composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_NOTIFICATIONS_TAG).assertIsDisplayed()
        composeTestRule.onNodeWithText("Content").assertDoesNotExist()
        composeTestRule.onNodeWithText("Library").assertDoesNotExist()
    }

    @Test
    fun stickyHeader_expandedWidth_increasesHamburgerInset_andPreservesSearchAlignment() {
        fun setHeader(width: Int) {
            composeTestRule.setContent {
                MediaTheme {
                    Box(
                        modifier = Modifier
                            .requiredWidth(width.dp)
                            .fillMaxHeight()
                    ) {
                        StickyContentLibraryHeader(
                            onSearchClick = {},
                            onNotificationClick = {}
                        )
                    }
                }
            }
        }

        setHeader(width = 420)
        val compactNavLeft = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_NAV_TAG)
            .fetchSemanticsNode().positionInRoot.x
        val compactSearchLeft = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_SEARCH_TAG)
            .fetchSemanticsNode().positionInRoot.x
        val compactSearchRight = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_SEARCH_TAG)
            .fetchSemanticsNode().boundsInRoot.right
        val compactNotificationLeft = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_NOTIFICATIONS_TAG)
            .fetchSemanticsNode().positionInRoot.x

        setHeader(width = 1000)
        val expandedNavLeft = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_NAV_TAG)
            .fetchSemanticsNode().positionInRoot.x
        val expandedSearchLeft = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_SEARCH_TAG)
            .fetchSemanticsNode().positionInRoot.x
        val expandedSearchRight = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_SEARCH_TAG)
            .fetchSemanticsNode().boundsInRoot.right
        val expandedNotificationLeft = composeTestRule.onNodeWithTag(MEDIA_HOME_TOP_BAR_NOTIFICATIONS_TAG)
            .fetchSemanticsNode().positionInRoot.x

        assertTrue(expandedNavLeft > compactNavLeft)
        assertTrue(compactSearchLeft > compactNavLeft)
        assertTrue(expandedSearchLeft > expandedNavLeft)
        assertTrue(compactSearchRight < compactNotificationLeft)
        assertTrue(expandedSearchRight < expandedNotificationLeft)
    }
}
