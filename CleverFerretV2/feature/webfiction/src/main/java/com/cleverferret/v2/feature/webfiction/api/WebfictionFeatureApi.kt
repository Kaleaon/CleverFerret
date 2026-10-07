package com.cleverferret.v2.feature.webfiction.api

import com.cleverferret.v2.core.common.VersionedContract
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.webfiction.services.webfiction.WebfictionStoryResultV1

sealed class WebfictionNavDestination(val route: String) {
    data object Home : WebfictionNavDestination("discover/webfiction")
    data class Story(val storyId: String) : WebfictionNavDestination("webfiction/story/$storyId") {
        companion object {
            const val ROUTE_PATTERN = "webfiction/story/{storyId}"
        }
    }
}

interface WebfictionFeatureApi : VersionedContract {
    fun featureKey(): String
    fun loadStory(storyUrl: String): IntegrationResult<WebfictionStoryResultV1>
    override fun contractVersion(): String = "V1"
}
