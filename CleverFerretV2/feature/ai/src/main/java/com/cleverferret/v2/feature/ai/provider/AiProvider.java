package com.cleverferret.v2.feature.ai.provider;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;
import com.cleverferret.v2.feature.ai.model.AiRequest;

public interface AiProvider {
    String providerKey();

    boolean isAvailable();

    IntegrationResult<AiGenerationResult> generate(AiRequest request);
}
