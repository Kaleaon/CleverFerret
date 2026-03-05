package com.cleverferret.v2.feature.ai.provider;

import com.cleverferret.v2.core.common.error.AppError;
import com.cleverferret.v2.core.common.error.UserFacingState;
import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;
import com.cleverferret.v2.feature.ai.model.AiRequest;

public final class OpenAiProvider implements AiProvider {
    private final boolean available;

    public OpenAiProvider(boolean available) {
        this.available = available;
    }

    @Override
    public String providerKey() {
        return "openai";
    }

    @Override
    public boolean isAvailable() {
        return available;
    }

    @Override
    public IntegrationResult<AiGenerationResult> generate(AiRequest request) {
        if (!available) {
            return IntegrationResult.failure(new AppError.ExternalServiceFailure("OpenAI is unavailable", providerKey(), "AI_PROVIDER_UNAVAILABLE"), UserFacingState.TEMPORARILY_DEGRADED);
        }
        return IntegrationResult.success(new AiGenerationResult(
                "OpenAI output for: " + request.capability(),
                providerKey(),
                Math.max(1, request.prompt().length() / 4),
                Math.max(1, request.maxTokens() / 2),
                0.003,
                false
        ));
    }
}
