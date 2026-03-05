package com.cleverferret.v2.feature.metadata.usecase;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;

public final class MetadataAiIntegrationUseCase {
    private final MetadataAiUseCases metadataAiUseCases;

    public MetadataAiIntegrationUseCase(MetadataAiUseCases metadataAiUseCases) {
        this.metadataAiUseCases = metadataAiUseCases;
    }

    public IntegrationResult<AiGenerationResult> summarizeMetadataRecord(String metadataText) {
        return metadataAiUseCases.summarizeMetadata("feature:metadata", metadataText);
    }

    public IntegrationResult<AiGenerationResult> generateRecommendations(String metadataText) {
        return metadataAiUseCases.recommendFromMetadata("feature:metadata", metadataText);
    }
}
