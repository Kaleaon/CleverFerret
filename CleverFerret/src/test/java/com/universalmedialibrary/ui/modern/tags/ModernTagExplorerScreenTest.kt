package com.universalmedialibrary.ui.modern.tags

import com.google.common.truth.Truth.assertThat
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

        assertThat(filtered.map { it.name }).containsExactly("Sci-Fi", "Science")
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

        assertThat(filtered).containsExactlyElementsIn(tags)
    }

    @Test
    fun filteringEmptyTagsList_returnsEmptyList() {
        val state = ModernTagExplorerUiState(query = "fantasy", tags = emptyList())

        val filtered = if (state.query.isBlank()) state.tags
        else state.tags.filter { it.name.contains(state.query, ignoreCase = true) }

        assertThat(filtered).isEmpty()
    }

    @Test
    fun maxCountCalculation_returnsMaxTagCountOrFallbackOne() {
        val emptyState = ModernTagExplorerUiState(query = "", tags = emptyList())
        val emptyMaxCount = (emptyState.tags.maxOfOrNull { it.count } ?: 1).coerceAtLeast(1)
        assertThat(emptyMaxCount).isEqualTo(1)

        val tags = listOf(
            UiTag(id = "1", name = "A", count = 15),
            UiTag(id = "2", name = "B", count = 42),
            UiTag(id = "3", name = "C", count = 8),
        )
        val populatedState = ModernTagExplorerUiState(query = "", tags = tags)
        val populatedMaxCount = (populatedState.tags.maxOfOrNull { it.count } ?: 1).coerceAtLeast(1)
        assertThat(populatedMaxCount).isEqualTo(42)
    }

    @Test
    fun uiStateContract_supportsRecentTagsAndDefaults() {
        val state = ModernTagExplorerUiState(
            query = "",
            tags = emptyList(),
        )
        assertThat(state.recent).isEmpty()

        val recentTag = UiTag(id = "r1", name = "Recent", count = 3)
        val stateWithRecent = ModernTagExplorerUiState(
            query = "test",
            tags = listOf(recentTag),
            recent = listOf(recentTag),
        )
        assertThat(stateWithRecent.recent).containsExactly(recentTag)
    }
}
