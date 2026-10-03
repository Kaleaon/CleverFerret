package com.cleverferret.v2.core.network.ai

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import kotlin.math.max

class OpenAiProviderGatewayAdapter(
    private val available: Boolean,
    private val defaultModel: String = "gpt-4.1-mini",
) : AiProviderGateway {
    override fun providerId(): AiProviderId = AiProviderId.OPENAI
    override fun isAvailable(): Boolean = available

    override fun generate(request: AiProviderRequest): IntegrationResult<AiProviderResponse> {
        if (!available) {
            return IntegrationResult.failure(
                AppError.ExternalServiceFailure("OpenAI unavailable", providerId().name.lowercase(), "AI_PROVIDER_UNAVAILABLE"),
                UserFacingState.TEMPORARILY_DEGRADED,
            )
        }
        return IntegrationResult.success(
            AiProviderResponse(
                content = "OpenAI completion for ${request.metadata["contract"] ?: "unknown"}",
                provider = providerId(),
                model = request.model.ifBlank { defaultModel },
                promptTokens = max(1, request.prompt.length / 4),
                completionTokens = max(1, request.maxTokens / 2),
                finishReason = "stop",
            ),
        )
    }
}

class GeminiProviderGatewayAdapter(
    private val available: Boolean,
    private val defaultModel: String = "gemini-2.5-flash",
) : AiProviderGateway {
    override fun providerId(): AiProviderId = AiProviderId.GEMINI
    override fun isAvailable(): Boolean = available

    override fun generate(request: AiProviderRequest): IntegrationResult<AiProviderResponse> {
        if (!available) {
            return IntegrationResult.failure(
                AppError.ExternalServiceFailure("Gemini unavailable", providerId().name.lowercase(), "AI_PROVIDER_UNAVAILABLE"),
                UserFacingState.TEMPORARILY_DEGRADED,
            )
        }
        return IntegrationResult.success(
            AiProviderResponse(
                content = "Gemini completion for ${request.metadata["contract"] ?: "unknown"}",
                provider = providerId(),
                model = request.model.ifBlank { defaultModel },
                promptTokens = max(1, request.prompt.length / 4),
                completionTokens = max(1, request.maxTokens / 2),
                finishReason = "stop",
            ),
        )
    }
}

class OllamaProviderGatewayAdapter(
    private val available: Boolean,
    private val defaultModel: String = "llama3.2",
) : AiProviderGateway {
    override fun providerId(): AiProviderId = AiProviderId.OLLAMA
    override fun isAvailable(): Boolean = available

    override fun generate(request: AiProviderRequest): IntegrationResult<AiProviderResponse> {
        if (!available) {
            return IntegrationResult.failure(
                AppError.ExternalServiceFailure("Ollama unavailable", providerId().name.lowercase(), "AI_PROVIDER_UNAVAILABLE"),
                UserFacingState.TEMPORARILY_DEGRADED,
            )
        }
        return IntegrationResult.success(
            AiProviderResponse(
                content = "Ollama completion for ${request.metadata["contract"] ?: "unknown"}",
                provider = providerId(),
                model = request.model.ifBlank { defaultModel },
                promptTokens = max(1, request.prompt.length / 5),
                completionTokens = max(1, request.maxTokens / 3),
                finishReason = "stop",
            ),
        )
    }
}
