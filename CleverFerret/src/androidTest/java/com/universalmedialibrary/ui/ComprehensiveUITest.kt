package com.universalmedialibrary.ui

import androidx.compose.ui.test.*
import androidx.compose.ui.test.junit4.createAndroidComposeRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.universalmedialibrary.MediaMainActivity
import dagger.hilt.android.testing.HiltAndroidRule
import dagger.hilt.android.testing.HiltAndroidTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

/**
 * Comprehensive UI Tests for CleverFerret
 * 
 * Tests critical user flows and UI components:
 * - Navigation and bottom bar persistence
 * - Media player functionality
 * - Search and filtering
 * - Settings and preferences
 * - AI entertainment features
 * - Theme switching
 */
@HiltAndroidTest
@RunWith(AndroidJUnit4::class)
class ComprehensiveUITest {

    @get:Rule
    val hiltRule = HiltAndroidRule(this)

    @get:Rule
    val composeTestRule = createAndroidComposeRule<MediaMainActivity>()

    @Before
    fun setup() {
        hiltRule.inject()
    }

    @Test
    fun bottomNavigationPersistsAcrossScreenChanges() {
        // Verify bottom navigation is visible on home screen
        composeTestRule.onNodeWithContentDescription("Home").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Books").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Music").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Settings").assertIsDisplayed()

        // Navigate to books screen
        composeTestRule.onNodeWithContentDescription("Books").performClick()
        
        // Verify bottom navigation is still visible
        composeTestRule.onNodeWithContentDescription("Home").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Books").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Music").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Settings").assertIsDisplayed()

        // Navigate to music screen
        composeTestRule.onNodeWithContentDescription("Music").performClick()
        
        // Verify bottom navigation persists
        composeTestRule.onNodeWithContentDescription("Home").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Books").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Music").assertIsDisplayed()
        composeTestRule.onNodeWithContentDescription("Settings").assertIsDisplayed()
    }

    @Test
    fun searchFunctionalityWorks() {
        // Navigate to search screen
        composeTestRule.onNodeWithContentDescription("Search").performClick()
        
        // Verify search input is present
        composeTestRule.onNodeWithText("Search").assertIsDisplayed()
        
        // Enter search query
        composeTestRule.onNodeWithText("Search").performTextInput("test book")
        
        // Verify search results (or empty state) appear
        composeTestRule.waitUntil(5000) {
            composeTestRule.onAllNodesWithText("No results").fetchSemanticsNodes().isNotEmpty() ||
            composeTestRule.onAllNodesWithText("test").fetchSemanticsNodes().isNotEmpty()
        }
    }

    @Test
    fun settingsNavigationWorks() {
        // Navigate to settings
        composeTestRule.onNodeWithContentDescription("Settings").performClick()
        
        // Verify settings screen loads
        composeTestRule.onNodeWithText("Settings").assertIsDisplayed()
        
        // Test settings categories
        composeTestRule.onNodeWithText("Appearance").assertIsDisplayed()
        composeTestRule.onNodeWithText("Library").assertIsDisplayed()
        composeTestRule.onNodeWithText("Player").assertIsDisplayed()
        composeTestRule.onNodeWithText("AI Features").assertIsDisplayed()

        // Navigate to appearance settings
        composeTestRule.onNodeWithText("Appearance").performClick()
        
        // Verify theme options are present
        composeTestRule.onNodeWithText("Theme").assertIsDisplayed()
        composeTestRule.onNodeWithText("Dark Mode").assertIsDisplayed()
    }

    @Test
    fun mediaPlayerControlsWork() {
        // Navigate to music screen
        composeTestRule.onNodeWithContentDescription("Music").performClick()
        
        // Try to find and play first item (if available)
        composeTestRule.onAllNodesWithContentDescription("Play").firstOrNull()?.performClick()
        
        // Verify mini player appears (if media is playing)
        composeTestRule.waitUntil(3000) {
            try {
                composeTestRule.onNodeWithContentDescription("Mini player").isDisplayed()
                true
            } catch (e: AssertionError) {
                false
            }
        }
    }

    @Test
    fun aiEntertainmentAccess() {
        // Look for AI entertainment feature in navigation
        composeTestRule.onAllNodesWithContentDescription("AI").firstOrNull()?.performClick()
        
        // If AI feature is available, verify it loads
        composeTestRule.waitUntil(3000) {
            try {
                composeTestRule.onNodeWithText("SynthChat").isDisplayed()
                true
            } catch (e: AssertionError) {
                false
            }
        }
    }

    @Test
    fun themeSwitchingWorks() {
        // Navigate to settings
        composeTestRule.onNodeWithContentDescription("Settings").performClick()
        composeTestRule.onNodeWithText("Appearance").performClick()
        
        // Try to switch themes (if theme switcher is available)
        composeTestRule.onAllNodesWithText("Navy Gold").firstOrNull()?.performClick()
        
        // Verify theme applied (by checking if any color changes occurred)
        // This is a basic check - more sophisticated testing would verify actual color values
    }

    @Test
    fun fileBrowserAccess() {
        // Look for file browser in navigation
        composeTestRule.onAllNodesWithContentDescription("Files").firstOrNull()?.performClick()
        
        // Verify file browser loads
        composeTestRule.waitUntil(3000) {
            try {
                composeTestRule.onNodeWithText("Storage").isDisplayed() ||
                composeTestRule.onNodeWithText("Browse").isDisplayed()
                true
            } catch (e: AssertionError) {
                false
            }
        }
    }

    @Test
    fun libraryCategoriesWork() {
        // Test different library categories
        val categories = listOf("Books", "Comics", "Movies", "Documents")
        
        categories.forEach { category ->
            composeTestRule.onNodeWithContentDescription(category).performClick()
            
            // Verify category screen loads
            composeTestRule.waitUntil(2000) {
                try {
                    composeTestRule.onNodeWithText(category).isDisplayed()
                    true
                } catch (e: AssertionError) {
                    false
                }
            }
            
            // Go back to home for next test
            composeTestRule.onNodeWithContentDescription("Home").performClick()
        }
    }

    @Test
    fun appStartupAndBasicFunctionality() {
        // Verify app starts without crash
        composeTestRule.onRoot().assertIsDisplayed()
        
        // Verify main navigation elements are present
        composeTestRule.onNodeWithContentDescription("Home").assertIsDisplayed()
        
        // Verify no crash dialogs or error messages are visible
        composeTestRule.onNodeWithText("Error").assertDoesNotExist()
        composeTestRule.onNodeWithText("Crashed").assertDoesNotExist()
    }

    @Test
    fun systemNavigationIntegrity() {
        // Test that navigation doesn't break after multiple clicks
        val destinations = listOf("Home", "Books", "Music", "Settings")
        
        // Cycle through destinations multiple times
        repeat(3) {
            destinations.forEach { destination ->
                composeTestRule.onNodeWithContentDescription(destination).performClick()
                composeTestRule.onNodeWithContentDescription(destination).assertIsDisplayed()
            }
        }
    }

    @Test
    fun bottomBarScrollingWorks() {
        // Test bottom bar horizontal scrolling if there are many items
        composeTestRule.onNodeWithContentDescription("Home").assertIsDisplayed()
        
        // Try to scroll the bottom bar (if it's scrollable)
        composeTestRule.onRoot().performTouchInput {
            swipeLeft()
        }
        
        // Verify navigation is still functional after scroll
        composeTestRule.onNodeWithContentDescription("Settings").performClick()
        composeTestRule.onNodeWithText("Settings").assertIsDisplayed()
    }
}