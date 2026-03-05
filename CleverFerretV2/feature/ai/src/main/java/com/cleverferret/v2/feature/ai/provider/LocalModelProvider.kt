package com.cleverferret.v2.feature.ai.provider

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.model.AiGenerationResult
import com.cleverferret.v2.feature.ai.model.AiRequest
import kotlin.math.max

class LocalModelProvider(private val modelLoaded: Boolean) : AiProvider {
    override fun providerKey(): String = "local"
    override fun isAvailable(): Boolean = modelLoaded
    override fun generate(request: AiRequest): IntegrationResult<AiGenerationResult> {
        if (!modelLoaded) return IntegrationResult.failure(AppError.ExternalServiceFailure("Local model unavailable", providerKey(), "AI_PROVIDER_UNAVAILABLE"), UserFacingState.TEMPORARILY_DEGRADED)
        return IntegrationResult.success(AiGenerationResult("Local model output for: ${request.capability}", providerKey(), max(1, request.prompt.length / 5), max(1, request.maxTokens / 3), 0.0, false))
    }
}
