package com.cleverferret.v2.feature.webfiction.services.webfiction

import com.cleverferret.v2.feature.webfiction.dto.StoryMetadataDtoV1

data class WebfictionStoryResultV1(
    val storyId: String,
    val metadata: StoryMetadataDtoV1
)
