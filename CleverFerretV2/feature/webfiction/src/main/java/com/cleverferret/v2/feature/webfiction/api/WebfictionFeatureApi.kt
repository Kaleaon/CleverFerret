package com.cleverferret.v2.feature.webfiction.api

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.webfiction.services.webfiction.WebfictionStoryResultV1

interface WebfictionFeatureApi {
    fun featureKey(): String
    fun loadStory(storyUrl: String): IntegrationResult<WebfictionStoryResultV1>
}
