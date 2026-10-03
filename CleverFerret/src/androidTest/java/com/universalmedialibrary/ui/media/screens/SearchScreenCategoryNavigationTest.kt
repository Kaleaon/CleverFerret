package com.universalmedialibrary.ui.media.screens

import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test

class SearchScreenCategoryNavigationTest {

    @get:Rule
    val composeRule = createComposeRule()

    @Test
    fun seeAllInCategory_triggersCategoryNavigation() {
        var selectedCategory: SearchCategory? = null
        var navigatedCategory: SearchCategory? = null
        val books = List(6) { index ->
            SearchResult(
                id = "$index",
                title = "Book $index",
                subtitle = null,
                imageUrl = null,
                category = SearchCategory.BOOKS,
                source = "Local",
                mediaType = com.universalmedialibrary.ui.media.components.MediaType.BOOK
            )
        }
        composeRule.setContent {
            MediaSearchScreen(
                state = SearchScreenState(
                    query = "book",
                    results = books,
                    groupedResults = mapOf(SearchCategory.BOOKS to books)
                ),
                onQueryChange = {},
                onSearch = {},
                onClearSearch = {},
                onResultClick = {},
                onRecentSearchClick = {},
                onClearRecentSearches = {},
                onCategoryFilterChange = { selectedCategory = it },
                onCategoryNavigate = { navigatedCategory = it },
                onVoiceSearch = {},
                onBackClick = {}
            )
        }

        composeRule.onNodeWithText("See all 6 books").performClick()

        assertEquals(SearchCategory.BOOKS, selectedCategory)
        assertEquals(SearchCategory.BOOKS, navigatedCategory)
    }
}
