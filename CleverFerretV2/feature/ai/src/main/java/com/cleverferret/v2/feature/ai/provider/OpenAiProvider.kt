package com.cleverferret.v2.feature.ai.provider

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.model.AiGenerationResult
import com.cleverferret.v2.feature.ai.model.AiRequest
import kotlin.math.max

class OpenAiProvider(private val available: Boolean) : AiProvider {
    override fun providerKey(): String = "openai"
    override fun isAvailable(): Boolean = available
    override fun generate(request: AiRequest): IntegrationResult<AiGenerationResult> {
        if (!available) return IntegrationResult.failure(AppError.ExternalServiceFailure("OpenAI is unavailable", providerKey(), "AI_PROVIDER_UNAVAILABLE"), UserFacingState.TEMPORARILY_DEGRADED)
        return IntegrationResult.success(AiGenerationResult("OpenAI output for: ${request.capability}", providerKey(), max(1, request.prompt.length / 4), max(1, request.maxTokens / 2), 0.003, false))
    }
}
