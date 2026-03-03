package com.cleverferret.v2.feature.webfiction.services.webfiction;

import com.cleverferret.v2.feature.webfiction.dto.StoryMetadataDtoV1;

public record WebfictionStoryResultV1(
        String storyId,
        StoryMetadataDtoV1 metadata
) {}
