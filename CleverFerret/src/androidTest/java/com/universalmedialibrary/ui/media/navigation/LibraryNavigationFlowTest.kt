package com.universalmedialibrary.ui.media.navigation

import androidx.compose.ui.test.assertIsDisplayed
import androidx.compose.ui.test.junit4.createAndroidComposeRule
import androidx.compose.ui.test.onNodeWithContentDescription
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.universalmedialibrary.ui.media.MediaMainActivity
import dagger.hilt.android.testing.HiltAndroidRule
import dagger.hilt.android.testing.HiltAndroidTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@HiltAndroidTest
@RunWith(AndroidJUnit4::class)
class LibraryNavigationFlowTest {

    @get:Rule
    val hiltRule = HiltAndroidRule(this)

    @get:Rule
    val composeTestRule = createAndroidComposeRule<MediaMainActivity>()

    @Before
    fun setup() {
        hiltRule.inject()
    }

    @Test
    fun libraryDestination_exposesMediaTypeChipsAndNavigatesBetweenTypes() {
        composeTestRule.onNodeWithContentDescription("Library").assertIsDisplayed().performClick()
        composeTestRule.onNodeWithText("Books").assertIsDisplayed()

        composeTestRule.onNodeWithContentDescription("Library type Audiobooks")
            .assertIsDisplayed()
            .performClick()
        composeTestRule.onNodeWithText("Audiobooks").assertIsDisplayed()

        composeTestRule.onNodeWithContentDescription("Library type Music")
            .assertIsDisplayed()
            .performClick()
        composeTestRule.onNodeWithText("Music").assertIsDisplayed()
    }
}
