package com.cleverferret.v2.feature.webfiction.api;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.webfiction.services.webfiction.WebfictionStoryResultV1;

public interface WebfictionFeatureApi {
    String featureKey();

    IntegrationResult<WebfictionStoryResultV1> loadStory(String storyUrl);
}
