package com.universalmedialibrary.services

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.data.settings.ParentalControlsState
import com.universalmedialibrary.services.webfiction.DownloadStatus
import com.universalmedialibrary.services.webfiction.StoryStatus
import com.universalmedialibrary.services.webfiction.WebFictionStory
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class ContentFilterHelperTest {

    @MockK(relaxed = true)
    lateinit var parentalControlsSettings: ParentalControlsSettings

    private lateinit var helper: ContentFilterHelper
    private val enabledState = ParentalControlsState(enabled = true)

    @Before
    fun setUp() {
        MockKAnnotations.init(this)
        helper = ContentFilterHelper(parentalControlsSettings)
        coEvery { parentalControlsSettings.currentState() } returns enabledState
    }

    @Test
    fun `filterStories removes stories hidden by parental controls`() = runTest {
        val explicitStory = story(
            id = "1",
            title = "Explicit Adventure",
            rating = "Explicit",
            tags = listOf("nsfw")
        )
        val teenStory = story(
            id = "2",
            title = "Teen Quest",
            rating = "Teen"
        )

        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Explicit",
                mediaType = "STORY",
                tags = listOf("nsfw")
            )
        } returns true
        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Teen",
                mediaType = "STORY",
                tags = emptyList()
            )
        } returns false

        val filtered = helper.filterStories(listOf(explicitStory, teenStory))

        assertThat(filtered).containsExactly(teenStory)
    }

    @Test
    fun `getContentStatus returns Locked when PIN is required`() = runTest {
        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Explicit",
                mediaType = "STORY",
                tags = any()
            )
        } returns false
        every {
            parentalControlsSettings.requiresPinForAccess(
                enabledState,
                rating = "Explicit",
                mediaType = "STORY",
                tags = any()
            )
        } returns true
        every {
            parentalControlsSettings.isContentAllowed(
                enabledState,
                rating = "Explicit",
                mediaType = "STORY",
                tags = any()
            )
        } returns true

        val status = helper.getContentStatus(
            rating = "Explicit",
            mediaType = "STORY",
            tags = listOf("adult")
        )

        assertThat(status).isEqualTo(ContentStatus.Locked)
    }

    @Test
    fun `getContentStatus returns Blocked when content is disallowed`() = runTest {
        every {
            parentalControlsSettings.shouldHideContent(
                enabledState,
                rating = "Mature",
                mediaType = "MOVIE",
                tags = any()
            )
        } returns false
        every {
            parentalControlsSettings.requiresPinForAccess(
                enabledState,
                rating = "Mature",
                mediaType = "MOVIE",
                tags = any()
            )
        } returns false
        every {
            parentalControlsSettings.isContentAllowed(
                enabledState,
                rating = "Mature",
                mediaType = "MOVIE",
                tags = any()
            )
        } returns false

        val status = helper.getContentStatus(
            rating = "Mature",
            mediaType = "MOVIE"
        )

        assertThat(status).isEqualTo(ContentStatus.Blocked)
    }

    private fun story(
        id: String,
        title: String,
        rating: String?,
        tags: List<String> = emptyList()
    ): WebFictionStory = WebFictionStory(
        id = id,
        url = "https://example.com/$id",
        title = title,
        author = "Author",
        description = null,
        status = StoryStatus.ONGOING,
        genre = null,
        fandom = null,
        language = "English",
        wordCount = 1_000,
        chapterCount = 10,
        lastUpdated = 0L,
        rating = rating,
        warnings = emptyList(),
        tags = tags,
        isCompleted = false,
        downloadStatus = DownloadStatus.NOT_DOWNLOADED
    )
}
