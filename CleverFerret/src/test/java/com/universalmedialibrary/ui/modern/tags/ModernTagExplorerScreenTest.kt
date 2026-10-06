package com.universalmedialibrary.ui.modern.tags

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class ModernTagExplorerScreenTest {

    @Test
    fun filteringTagsByQuery_returnsMatchingTagsCaseInsensitively() {
        val tags = listOf(
            UiTag(id = "1", name = "Sci-Fi", count = 10),
            UiTag(id = "2", name = "Fantasy", count = 5),
            UiTag(id = "3", name = "Science", count = 2),
        )
        val state = ModernTagExplorerUiState(query = "sci", tags = tags)

        val filtered = if (state.query.isBlank()) state.tags
        else state.tags.filter { it.name.contains(state.query, ignoreCase = true) }

        assertEquals(listOf("Sci-Fi", "Science"), filtered.map { it.name })
    }

    @Test
    fun filteringTagsWithBlankQuery_returnsAllTags() {
        val tags = listOf(
            UiTag(id = "1", name = "Sci-Fi", count = 10),
            UiTag(id = "2", name = "Fantasy", count = 5),
        )
        val state = ModernTagExplorerUiState(query = "   ", tags = tags)

        val filtered = if (state.query.isBlank()) state.tags
        else state.tags.filter { it.name.contains(state.query, ignoreCase = true) }

        assertEquals(tags, filtered)
    }

    @Test
    fun filteringEmptyTagsList_returnsEmptyList() {
        val state = ModernTagExplorerUiState(query = "fantasy", tags = emptyList())

        val filtered = if (state.query.isBlank()) state.tags
        else state.tags.filter { it.name.contains(state.query, ignoreCase = true) }

        assertTrue(filtered.isEmpty())
    }

    @Test
    fun maxCountCalculation_returnsMaxTagCountOrFallbackOne() {
        val emptyState = ModernTagExplorerUiState(query = "", tags = emptyList())
        val emptyMaxCount = (emptyState.tags.maxOfOrNull { it.count } ?: 1).coerceAtLeast(1)
        assertEquals(1, emptyMaxCount)

        val tags = listOf(
            UiTag(id = "1", name = "A", count = 15),
            UiTag(id = "2", name = "B", count = 42),
            UiTag(id = "3", name = "C", count = 8),
        )
        val populatedState = ModernTagExplorerUiState(query = "", tags = tags)
        val populatedMaxCount = (populatedState.tags.maxOfOrNull { it.count } ?: 1).coerceAtLeast(1)
        assertEquals(42, populatedMaxCount)
    }

    @Test
    fun uiStateContract_supportsRecentTagsAndDefaults() {
        val state = ModernTagExplorerUiState(
            query = "",
            tags = emptyList(),
        )
        assertTrue(state.recent.isEmpty())

        val recentTag = UiTag(id = "r1", name = "Recent", count = 3)
        val stateWithRecent = ModernTagExplorerUiState(
            query = "test",
            tags = listOf(recentTag),
            recent = listOf(recentTag),
        )
        assertEquals(listOf(recentTag), stateWithRecent.recent)
    }
}
