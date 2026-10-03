package com.cleverferret.v2.feature.ai.provider

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.model.AiGenerationResult
import com.cleverferret.v2.feature.ai.model.AiRequest
import kotlin.math.max

class GeminiAiProvider(private val available: Boolean) : AiProvider {
    override fun providerKey(): String = "gemini"
    override fun isAvailable(): Boolean = available
    override fun generate(request: AiRequest): IntegrationResult<AiGenerationResult> {
        if (!available) return IntegrationResult.failure(AppError.ExternalServiceFailure("Gemini is unavailable", providerKey(), "AI_PROVIDER_UNAVAILABLE"), UserFacingState.TEMPORARILY_DEGRADED)
        return IntegrationResult.success(AiGenerationResult("Gemini output for: ${request.capability}", providerKey(), max(1, request.prompt.length / 4), max(1, request.maxTokens / 2), 0.002, false))
    }
}
