package com.universalmedialibrary.services.contentcreation

import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class StoryUpdateManager @Inject constructor() {

    data class TrackedStory(
        val id: String,
        val url: String,
        val title: String,
        val author: String,
        val totalChapters: Int,
        val lastKnownChapters: Int,
        val epubFilePath: String
    )

    data class UpdateCheck(
        val hasUpdates: Boolean,
        val error: String? = null
    )

    data class UpdateResult(
        val success: Boolean,
        val updatedStory: TrackedStory? = null,
        val error: String? = null
    )

    private val memory = mutableMapOf<String, TrackedStory>()

    fun checkStoryExists(url: String): TrackedStory? {
        return memory.values.find { it.url == url }
    }

    fun checkForUpdates(story: TrackedStory): UpdateCheck {
        // Stub: assume no updates
        return UpdateCheck(hasUpdates = false)
    }

    fun updateStory(story: TrackedStory): UpdateResult {
        // Stub: no update path
        return UpdateResult(success = false, error = "Update not implemented")
    }

    fun trackDownloadedStory(
        url: String,
        title: String,
        author: String,
        chapters: Int,
        filePath: String,
        site: String,
        siteStoryId: String
    ): String {
        val id = "$site-$siteStoryId"
        val tracked = TrackedStory(
            id = id,
            url = url,
            title = title,
            author = author,
            totalChapters = chapters,
            lastKnownChapters = chapters,
            epubFilePath = filePath
        )
        memory[id] = tracked
        return id
    }
}