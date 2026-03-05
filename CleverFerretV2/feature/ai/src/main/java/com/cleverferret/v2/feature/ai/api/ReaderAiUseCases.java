package com.cleverferret.v2.feature.ai.api;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;

public interface ReaderAiUseCases {
    IntegrationResult<AiGenerationResult> summarizeSelection(String requester, String text);

    IntegrationResult<AiGenerationResult> analyzeCharacters(String requester, String text);

    IntegrationResult<AiGenerationResult> generateMindMap(String requester, String text);
}
