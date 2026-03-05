package com.cleverferret.v2.feature.ai.provider;

import com.cleverferret.v2.core.common.error.AppError;
import com.cleverferret.v2.core.common.error.UserFacingState;
import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;
import com.cleverferret.v2.feature.ai.model.AiRequest;

public final class LocalModelProvider implements AiProvider {
    private final boolean modelLoaded;

    public LocalModelProvider(boolean modelLoaded) {
        this.modelLoaded = modelLoaded;
    }

    @Override
    public String providerKey() {
        return "local";
    }

    @Override
    public boolean isAvailable() {
        return modelLoaded;
    }

    @Override
    public IntegrationResult<AiGenerationResult> generate(AiRequest request) {
        if (!modelLoaded) {
            return IntegrationResult.failure(new AppError.ExternalServiceFailure("Local model unavailable", providerKey(), "AI_PROVIDER_UNAVAILABLE"), UserFacingState.TEMPORARILY_DEGRADED);
        }
        return IntegrationResult.success(new AiGenerationResult(
                "Local model output for: " + request.capability(),
                providerKey(),
                Math.max(1, request.prompt().length() / 5),
                Math.max(1, request.maxTokens() / 3),
                0.0,
                false
        ));
    }
}
