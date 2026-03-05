package com.cleverferret.v2.feature.ai.api;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;

public interface MetadataAiUseCases {
    IntegrationResult<AiGenerationResult> summarizeMetadata(String requester, String metadataText);

    IntegrationResult<AiGenerationResult> recommendFromMetadata(String requester, String metadataText);
}
