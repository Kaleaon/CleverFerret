package com.cleverferret.v2.core.network.ai

import com.cleverferret.v2.core.common.result.IntegrationResult

interface AiProviderGateway {
    fun providerId(): AiProviderId
    fun isAvailable(): Boolean
    fun generate(request: AiProviderRequest): IntegrationResult<AiProviderResponse>
}

enum class AiProviderId {
    OPENAI,
    GEMINI,
    OLLAMA
}

data class AiProviderRequest(
    val prompt: String,
    val model: String,
    val temperature: Double,
    val maxTokens: Int,
    val metadata: Map<String, String> = emptyMap(),
)

data class AiProviderResponse(
    val content: String,
    val provider: AiProviderId,
    val model: String,
    val promptTokens: Int,
    val completionTokens: Int,
    val finishReason: String,
)
