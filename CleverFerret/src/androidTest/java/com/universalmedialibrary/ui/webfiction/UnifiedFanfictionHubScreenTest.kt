package com.universalmedialibrary.ui.webfiction

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.test.assertCountEquals
import androidx.compose.ui.test.assertDoesNotExist
import androidx.compose.ui.test.assertExists
import androidx.compose.ui.test.junit4.createComposeRule
import androidx.compose.ui.test.onNodeWithContentDescription
import androidx.compose.ui.test.onAllNodesWithText
import androidx.compose.ui.test.onNodeWithTag
import androidx.compose.ui.test.onNodeWithText
import androidx.compose.ui.test.performClick
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class UnifiedFanfictionHubScreenTest {

    @get:Rule
    val composeTestRule = createComposeRule()

    @Test
    fun libraryStoryCard_menuStateDoesNotTransferToSiblingAfterRowRemoval() {
        val storyA = testStory(id = "story-a", title = "Story A")
        val storyB = testStory(id = "story-b", title = "Story B")

        composeTestRule.setContent {
            var stories by remember { mutableStateOf(listOf(storyA, storyB)) }

            Column {
                Button(
                    onClick = { stories = stories.drop(1) },
                    modifier = Modifier.testTag("remove-first-story")
                ) {
                    Text("Remove First")
                }

                LazyColumn {
                    items(
                        items = stories,
                        key = { story -> story.id }
                    ) { story ->
                        LibraryStoryCard(
                            story = story,
                            onClick = {},
                            onUpdateClick = {},
                            onDeleteClick = {}
                        )
                    }
                }
            }
        }

        composeTestRule.onNodeWithText("Story A").assertExists()
        composeTestRule.onNodeWithText("Story B").assertExists()

        composeTestRule.onNodeWithContentDescription("Menu").performClick()
        composeTestRule.onAllNodesWithText("Delete").assertCountEquals(1)

        composeTestRule.onNodeWithTag("remove-first-story").performClick()

        composeTestRule.onNodeWithText("Story A").assertDoesNotExist()
        composeTestRule.onNodeWithText("Story B").assertExists()
        composeTestRule.onNodeWithText("Delete").assertDoesNotExist()
    }

    private fun testStory(
        id: String,
        title: String
    ) = FanfictionStoryEntity(
        id = id,
        sourceUrl = "https://example.com/$id",
        sourceSite = "Example",
        title = title,
        author = "Author",
        summary = "Summary",
        status = "IN_PROGRESS",
        wordCount = 10_000,
        chapterCount = 10,
        lastChapterDownloaded = 10,
        lastCheckedDate = 0L,
        epubPath = null
    )
}
