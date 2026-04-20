package com.universalmedialibrary.ui.media.screens

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.test.assertExists
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.compose.ui.test.performTextInput
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.theme.MediaTheme
import org.junit.Rule
import org.junit.Test

class MediaSearchScreenFilterStateTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun selectedFiltersRemainActiveAfterQueryChanges() {
        composeTestRule.setContent {
            var state by mutableStateOf(SearchScreenState())

            MediaTheme {
                MediaSearchScreen(
                    state = state,
                    onQueryChange = { state = state.copy(query = it) },
                    onSearch = { },
                    onClearSearch = { state = state.copy(query = "") },
                    onResultClick = { },
                    onRecentSearchClick = { },
                    onClearRecentSearches = { },
                    onCategoryFilterChange = { state = state.copy(selectedCategory = it) },
                    onMediaTypeFilterChange = { state = state.copy(selectedMediaType = it) },
                    onVoiceSearch = { },
                    onBackClick = { }
                )
            }
        }

        composeTestRule.onNodeWithText("Books").performClick()
        composeTestRule.onNodeWithText("BOOK").performClick()
        composeTestRule.onNodeWithText("Category: Books").assertExists()
        composeTestRule.onNodeWithText("Type: BOOK").assertExists()

        composeTestRule.onNodeWithText("Search library & more...").performTextInput("dune")

        composeTestRule.onNodeWithText("Category: Books").assertExists()
        composeTestRule.onNodeWithText("Type: BOOK").assertExists()
        composeTestRule.onNodeWithText("dune").assertExists()
    }

    @Test
    fun clearingTypeTagResetsOnlyMediaTypeFilter() {
        composeTestRule.setContent {
            var state by mutableStateOf(
                SearchScreenState(
                    selectedCategory = SearchCategory.BOOKS,
                    selectedMediaType = MediaType.BOOK
                )
            )

            MediaTheme {
                MediaSearchScreen(
                    state = state,
                    onQueryChange = { state = state.copy(query = it) },
                    onSearch = { },
                    onClearSearch = { state = state.copy(query = "") },
                    onResultClick = { },
                    onRecentSearchClick = { },
                    onClearRecentSearches = { },
                    onCategoryFilterChange = { state = state.copy(selectedCategory = it) },
                    onMediaTypeFilterChange = { state = state.copy(selectedMediaType = it) },
                    onVoiceSearch = { },
                    onBackClick = { }
                )
            }
        }

        composeTestRule.onNodeWithText("Type: BOOK").performClick()

        composeTestRule.onNodeWithText("Category: Books").assertExists()
        composeTestRule.onNodeWithText("Any media type").assertExists()
    }
}
