package com.cleverferret.v2.feature.webfiction.services.webfiction

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.webfiction.api.WebfictionFeatureApi
import com.cleverferret.v2.feature.webfiction.dto.StoryMetadataDtoV1

class DefaultWebfictionFeatureApi : WebfictionFeatureApi {
    override fun featureKey(): String = "feature:webfiction"

    override fun loadStory(storyUrl: String): IntegrationResult<WebfictionStoryResultV1> {
        return IntegrationResult.success(
            WebfictionStoryResultV1(
                storyId = storyUrl,
                metadata = StoryMetadataDtoV1(
                    title = "Web Fiction Story",
                    author = "Unknown Author",
                    summary = "Web fiction story summary",
                    sourceUrl = storyUrl,
                    sourceSite = "Unknown",
                    tags = emptyList(),
                )
            )
        )
    }
}
