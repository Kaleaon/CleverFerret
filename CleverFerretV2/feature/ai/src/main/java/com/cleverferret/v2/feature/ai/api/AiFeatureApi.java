package com.cleverferret.v2.feature.ai.api;

public interface AiFeatureApi extends ReaderAiUseCases, MetadataAiUseCases {
    String featureKey();
}
